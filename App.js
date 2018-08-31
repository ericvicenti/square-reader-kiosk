/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, { Component } from "react";
import { Platform, StyleSheet, Text, View, NativeModules } from "react-native";

const OPaymentManager = NativeModules.OPaymentManager;

type Props = {};
export default class App extends Component<Props> {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>Welcome to React Native!</Text>
        <Text style={styles.instructions}>
          {JSON.stringify(OPaymentManager)}
        </Text>
        <Text
          style={styles.instructions}
          onPress={async () => {
            console.log(await OPaymentManager.getPermissions());
          }}
        >
          Get permissions
        </Text>
        <Text
          style={styles.instructions}
          onPress={() => {
            OPaymentManager.getPayment(100, "yes react native");
          }}
        >
          Pay me!
        </Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#F5FCFF"
  },
  welcome: {
    fontSize: 20,
    textAlign: "center",
    margin: 10
  },
  instructions: {
    textAlign: "center",
    color: "#333333",
    marginBottom: 5
  }
});
