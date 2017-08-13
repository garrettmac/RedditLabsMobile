/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,TouchableOpacity,

  View,NativeModules
} from 'react-native';
// import * as RedditLabs from 'react-native-reddit-labs';
// console.log(" RedditLabs: ",RedditLabs.openDialog);
console.log(" NativeModules: ",NativeModules);
let RedditLabs=NativeModules.RedditLabs
// console.log(" NativeModules.RNRedditLabs: ",NativeModules.RNRedditLabs);
function cb(msg,err){
  console.log(" msg: ",msg);
  console.log(" err: ",err);
}
let msg=NativeModules.RedditLabs.openDialog({},cb,cb)
NativeModules.RedditLabs.promise({"url":"https://politi.cc"},cb,cb)
// "hello",
// `https://robohash.org/asdf?size=350x350&set=set1`,
// cb
// // {message:"hello",
// // image:`https://robohash.org/asdf?size=350x350&set=set1`,
// // cb}
// )
// console.log(" msg: ",msg);
// .then((o)=>{
// alert(JSON.stringify(o))
// })
// .catch((e)=>{
//   console.warn("e",e)
// })

export default class RedditLabsMobile extends Component {

  onPress(){
    console.log(" button: ");
  }
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to React Native!
        </Text>
        <Text style={styles.instructions}>
          To get started, edit index.ios.js
        </Text>
        <TouchableOpacity onPress={this.onPress}>
          <Text style={{color:'rgba(0,0,0,0.5)',fontSize: 20,textAlign: "center",margin: 10,}}>
Button
          </Text>
        </TouchableOpacity>
        <Text style={styles.instructions}>
          Press Cmd+R to reload,{'\n'}
          Cmd+D or shake for dev menu
        </Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('RedditLabsMobile', () => RedditLabsMobile);
