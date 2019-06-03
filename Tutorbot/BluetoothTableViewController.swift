//
//  BluetoothTableViewController.swift
//  Tutorbot
//
//  Created by student on 03/06/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import CoreBluetooth

class BluetoothTableViewController: UITableViewController,  CBCentralManagerDelegate, CBPeripheralDelegate{

    var bluetoothManager: CBCentralManager?
    var peripheralLocal: CBPeripheral?
    var peripheralUUID: CBUUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peripheralUUID = CBUUID(string: "0x1800")
        let dispatchQueue: DispatchQueue = DispatchQueue(label: "com.iosbrain.centralQueueName", attributes: .concurrent)
        
        bluetoothManager = CBCentralManager(delegate: self, queue: dispatchQueue)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOff:
            print("Bluetooth is off")
            
        case .unauthorized:
            print("Bluetooth is unauthorized")
            
        case .unknown:
            print("Bluetooth is unknown")
            
        case .unsupported:
            print("Bluetooth is unsupported")
            
        case .resetting:
            print("Bluetooth is reseting")
            
        case .poweredOn:
            print("Bluetooth is on")
            DispatchQueue.main.async {
                
            }
            
            bluetoothManager?.scanForPeripherals(withServices: [peripheralUUID!])
            
        default:
            print("errado")
        }
        
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        print(peripheral.state)
        if(peripheral.name == "Rasp"){
            peripheral.delegate = self
            
            peripheralLocal = peripheral
            
            bluetoothManager?.stopScan()
            
            bluetoothManager?.connect(peripheral)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        DispatchQueue.main.async {
            
        }
        print("conectado com sucesso a \(peripheral.name ?? "nada" )")
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
