import React, { Component } from 'react';

import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  TouchableHighlight,
  NativeModules
} from 'react-native';

var nativeModule = NativeModules.OpenNativeModule;

class Main extends Component {
  jumpToNativeView(){
    nativeModule.openNativeVC();
  }
  render() {
    return (
      <View style={{backgroundColor:'yellow', flex:1, alignItems:'center', justifyContent:'center'}}>
        <Text>Hello Worldxxx</Text>

        <TouchableHighlight
         onPress={()=>{
          this.jumpToNativeView()
         }}
        >
         <Text> Touch Here </Text>
        </TouchableHighlight>
            
      </View>
    );
  }
}


AppRegistry.registerComponent('Helloworld', () => Main);