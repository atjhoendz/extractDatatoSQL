import axios from 'axios'
import fs from 'fs'

const baseURL = 'https://indonesia-covid-19.mathdro.id/api';

const getData = async(param) => {
    try {
        const response = await axios.get(`${baseURL}/${param}`);
        return response.data.data;
    } catch (err) {
        console.log(err);
    }
}

let id_kasus = 1;
const mapDataPerKasus = (data) => {
    let tanggal_ditambahkan = new Date(data.added_date);
    tanggal_ditambahkan = `${tanggal_ditambahkan.getFullYear()}-${tanggal_ditambahkan.getMonth()+1}-${tanggal_ditambahkan.getDay()+1}`;

    return {
        "id_kasus": id_kasus++,
        "kode_provinsi": data.provinsi,
        "jenis_kelamin": data.jenis_kelamin == 0 ? 'P' : 'L',
        "umur": data.umur == null ? 0 : data.umur,
        "keterangan": data.keterangan == null ? '' : data.keterangan,
        "garis_penularan": data.garis_penularan == null ? '' : data.garis_penularan,
        "keterangan_status": data.keterangan_status == null ? '' : data.keterangan_status,
        "wn": data.wn,
        "detail_wn": data.detail_wn == null ? '' : data.detail_wn,
        "tanggal_ditambahkan": tanggal_ditambahkan
    }
}

const mapDataPerProvinsi = (data) => {
    return {
        "kode_provinsi": data.kodeProvi,
        "nama_provinsi": data.provinsi,
        "kasus_positif": data.kasusPosi,
        "kasus_sembuh": data.kasusSemb,
        "kasus_meninggal": data.kasusMeni
    }
}

const writeToFile = (filename, data) => {
    fs.writeFile(filename, data, err => {
        if (err)
            console.log(err);
        // console.log(`Writing data to ${filename} success!`);
    });
}

const appendFile = (filename, data) => {
    fs.appendFile(filename, data, err => {
        if (err)
            console.log(err)
    });
}

const insertQueryPerKasus = async() => {
    let dataPerKasus = await getData('kasus');
    dataPerKasus = dataPerKasus.map(data => mapDataPerKasus(data));

    dataPerKasus.forEach(data => {
        let query = `INSERT INTO perKasus VALUES(${data.id_kasus}, ${data.kode_provinsi}, '${data.jenis_kelamin}', ${data.umur}, '${data.keterangan}', '${data.garis_penularan}', '${data.keterangan_status}', '${data.wn}', '${data.detail_wn}', '${data.tanggal_ditambahkan}');\n`;
        appendFile('insertQuery.sql', query);
    });
}

const insertQueryPerProvinsi = async() => {
    let dataPerProvinsi = await getData('provinsi');
    dataPerProvinsi = dataPerProvinsi.map(data => mapDataPerProvinsi(data));

    dataPerProvinsi.forEach(data => {
        let query = `INSERT INTO perProvinsi VALUES(${data.kode_provinsi}, '${data.nama_provinsi}', ${data.kasus_positif}, ${data.kasus_sembuh}, ${data.kasus_meninggal});\n`;
        appendFile('insertQuery.sql', query);
    });
}

const insertQueryWaktu = () => {
    let date = new Date();
    date.setDate(date.getDate() - 99);

    for (let i = 1; i <= 98; i++) {
        date.setDate(date.getDate() + 1);
        let query = `INSERT INTO waktu VALUES(${i}, '${date.getFullYear()}', '${date.getMonth()+1}', '${date.getDate()}');\n`
        appendFile('insertQuery.sql', query);
    }
}

const insertQueryFactTable = async() => {
    let dataPerHari = await getData('harian');
    let i = 1;
    dataPerHari.forEach(data => {
        if (i <= 98) {
            let query = `INSERT INTO factTable VALUES(${i}, ${i}, ${i}, ${data.jumlahKasusSembuhperHari}, ${data.jumlahKasusMeninggalperHari}, ${data.jumlahKasusDirawatperHari}, ${data.jumlahNegatif}, ${data.pdp == null ? 0 : data.pdp}, ${data.odp == null ? 0 : data.odp});\n`;
            appendFile('insertQuery.sql', query);
        }
        ++i;
    });
}

const main = () => {
    // writeToFile('insertQuery.sql', '');
    // insertQueryPerProvinsi();
    // insertQueryPerKasus();
    // insertQueryWaktu();
    insertQueryFactTable();
}

export default main();