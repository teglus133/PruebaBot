import React, {useState} from 'react';
import {SafeAreaView, StyleSheet, TextInput} from 'react-native';
import axios from 'axios';


const TextInputExample = () => {
  const [number, setNumber] = React.useState('');
  const substr = 'flight';


  const onChangeNumber= () => {
    
    console.log(number.includes(substr));
    if(number.includes(substr)){
    axios.get("http://localhost:3000/vuelos") 
    }
  }

  return (
    <SafeAreaView>
      <TextInput
        style={styles.input}
        onChangeText={onChangeNumber}
        value={number}
        placeholder="Ask for your flight"
        keyboardType="numeric"
      />

        
    
      
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  input: {
    height: 40,
    margin: 12,
    borderWidth: 1,
    padding: 10,
  },
});

export default TextInputExample;