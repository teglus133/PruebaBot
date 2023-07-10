import React from 'react';
import {View, StyleSheet, TextInput, Text} from 'react-native';
import axios from 'axios';


const TextInputExample = () => {
  const [number, setNumber] = React.useState('');
  const [vuelos, setVuelos] = React.useState('');
  const [loading, setLoading] = React.useState(false)
  const substr = 'flight';
  
  React.useEffect( () => {
    console.log(number.includes(substr));
    if(number.toLowerCase().includes(substr.toLowerCase())){
    axios.get("http://localhost:3000/vuelos")
    .then(function (response) {
      setVuelos(response.data)
    })
    .finally(() => setLoading(true))
    }
  }, [number])


  return (
    <View style={[styles.container, styles.shadowProp]}>
      <View style={styles.box}>
      <Text style={styles.text2}>Ask for your flight</Text>
      <TextInput
              style={styles.input}
              onChangeText={setNumber}
              value={number}      />

      {!loading ? (
        <Text style={styles.text}>Loading...</Text>
      ) : (
        vuelos.map((obj) => {
          return (
            <View key={obj.idVuelo}>
              <Text>{obj.codigoVuelo}</Text>
              <Text>{obj.aerolinea}</Text>
            </View>
          )
        })
        
      )} 
      </View>
      

    </View>
    );
  }
const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    //backgroundColor: `#4169e1`,
    backgroundColor: '#fffafa',
  },
  input: {
    height: 40,
    width: 300,
    margin: 12,
    borderWidth: 1,
    padding: 10,
    backgroundColor: `#fffafa`,
    marginTop: 50,
  },
  text: {
    height: 40,
    padding: 10,
    color: 'black',
  },
  text2: {
    fontSize: 40,
    fontWeight: 'bold',
    color: 'black',
  },
  box: {
    borderColor: 'black',
    borderWidth:  1,
    padding: 10,
    backgroundColor: 'white',
    height: 400,
      
  
  },
  shadowProp: {
    shadowColor: '#171717',
    shadowOffset: {width: -2, height: 4},
    shadowOpacity: 0.2,
    shadowRadius: 3,
  },


  
});

export default TextInputExample;

