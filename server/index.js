// Modülleri içe aktarma
const express = require('express');
const http = require('http');
const  mongoose  = require('mongoose');
const socketIo = require('socket.io');

// Express uygulamasını oluştur
const app = express();
const port = process.env.PORT || 3000;

// HTTP sunucusunu Express uygulaması ile oluştur
var server = http.createServer(app);
const Room = require('./models/room');

// Socket.io'yu başlat
var io = socketIo(server);

// Middleware kullanımı
app.use(express.json());

const DB="mongodb+srv://arifcngk:arifcngk.12345@cluster0.0isfk.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"

io.on('connection', (socket) => {
    console.log("Yeni bir kullanıcı bağlandı");
    socket.on('createRoom',async ({nickname}) => {
        console.log(nickname + " adlı kullanıcı oda oluşturdu");
       try{
        let room = new Room()
        let player ={
            socketID:socket.id,
            nickname,
            playerType:"X"
        };
        room.players.push(player);
        room.turn = player;
        room= await room.save();
        console.log(room);
        const roomId = room._id.toString();
        socket.join(roomId);
        socket.emit('roomCreated',Room);

       }catch(e){
        console.log(e);
       }
    });
});


mongoose.connect(DB).then(()=>{
    console.log("connection successful");
})
.catch((err)=>console.log("no connection"));


// Sunucuyu başlat
server.listen(port, '0.0.0.0', () => {
    console.log(`Server is running at ${port}`);
});

