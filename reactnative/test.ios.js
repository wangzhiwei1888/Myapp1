import React, { Component } from 'react';

import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
} from 'react-native';


class Main extends Component {
  render() {
    return (
      <View style={{backgroundColor:'yellow', flex:1, alignItems:'center', justifyContent:'center'}}>
        <View><Text>Hello World</Text></View>
        <View><Text>jason xxxxx</Text></View>
      </View>
    );
  }
}


AppRegistry.registerComponent('Helloworld', () => Main);

