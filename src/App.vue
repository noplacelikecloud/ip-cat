<script setup>
import { ref } from 'vue'

const ip = ref(

fetch('https://api.ipify.org?format=json')
  .then(response => response.json())
  .then(data => {
    ip.value = data.ip
  })

)

const ipinfos = ref(

fetch('https://ipapi.co/json/')
  .then(response => response.json())
  .then(data => {
    ipinfos.value = data
  })

)

const cat_pic = ref(
  fetch('https://api.thecatapi.com/v1/images/search')
  .then(response => response.json())
  .then(data => {
    cat_pic.value = data[0].url
  })
)

function CopyToClipboard() {
  navigator.clipboard.writeText(ip.value)
}


</script>

<template>
  <div class="wrapper">
    <div class="header">
      <h1>🐈 IP Cat</h1>
    </div>

    <div class="infos">
      <h2>Your IP Address:</h2>
      <h1>{{ ip }}</h1>
      <button @click="CopyToClipboard()">Copy IP</button>

      <div class="spacer"></div>

      <img :src="cat_pic" alt="Random Cat Picture" style="max-width: 100%; border-radius: 10px;">

        <div class="spacer"></div>

        <h2>Your IP Information:</h2>
      <div class="propertiesTable">
        <table>
          <tr>
            <th>Field</th>
            <th>Value</th>
          </tr>
          <tr><td>Location</td><td>{{ ipinfos.city }}</td></tr>
          <tr><td>Country</td><td>{{ ipinfos.country_name }}</td></tr>
          <tr><td>Region</td><td>{{ ipinfos.region }}</td></tr>
          <tr><td>Postal Code</td><td>{{ ipinfos.postal }}</td></tr>
          <tr><td>Latitude</td><td>{{ ipinfos.latitude }}</td></tr>
          <tr><td>Longitude</td><td>{{ ipinfos.longitude }}</td></tr>
          <tr><td>Organization</td><td>{{ ipinfos.org }}</td></tr>
        </table>
      </div>
    </div>

    <div class="credits">
      <span>Powered by <a href="https://ipapi.co/" target="_blank">ipapi</a></span>
      <span> | </span>
      <span>Powered by <a href="https://www.ipify.org/" target="_blank">ipify</a></span>
      <span> | </span>
      <span>Powered by <a href="https://thecatapi.com/" target="_blank">The Cat API</a></span>
    </div>
  </div>
</template>


<style scoped >
.wrapper {
  display: flex;
  width: 100%;
  flex-direction: column;
  align-items: center;
  font-family: Arial, sans-serif;
  padding-top: 6rem; /* Added padding to account for header */
  padding-bottom: 3rem; /* Space for footer */
  text-align: center; /* Center all text inside */
}

button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 10px 28px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}

button:hover {
  background-color: #3e8e41;
}

.header {
  position: fixed;
  top: 0;
  width: 100vw;
  text-align: left;
  background-color: #1a1a1a;
  padding: 1rem 2rem;
  z-index: 10;
}

.infos {
  width: 100vw;
  max-width: 800px;
  margin-top: 1rem;
  text-align: center; /* Center the content inside the infos section */
  margin-bottom: 1rem;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin: 0 auto;
}

th, td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
  color: white;
}

th {
  background-color: #333;
}

.spacer {
  height: 2rem;
}

.credits {
  position: fixed;
  bottom: 0;
  width: 100vw;
  text-align: center;
  padding: 1rem;
  background-color: #1a1a1a;
  color: #ccc;
}

.credits a {
  color: #00bfff;
  text-decoration: none;
}

</style>
