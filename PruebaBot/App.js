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
    <View>
      <TextInput
              style={styles.input}
              onChangeText={setNumber}
              value={number}
              placeholder="Ask for your flight"
              keyboardType="numeric"
      />
      {!loading ? (
        <Text>Loading...</Text>
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
    );
  }
const styles = StyleSheet.create({
  input: {
    height: 40,
    margin: 12,
    borderWidth: 1,
    padding: 10,
  },
});

export default TextInputExample;

