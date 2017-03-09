//
//  ViewController.swift
//  memo2
//
//  Created by 管理者 on 2017/03/08.
//  Copyright © 2017年 Shoko. All rights reserved.
//
import UIKit

private let unselectedRow = -1

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var editMemoField: UITextField!
    
    @IBOutlet weak var editMemoField2: UITextField!
    
    @IBOutlet weak var memoListView: UITableView!
    
    @IBOutlet weak var memoListView2: UITableView!
    
    

    var memoList: [String] = []
    var editRow: Int = unselectedRow
    var memoList2: [String] = []
    var editRow2: Int = unselectedRow
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        memoListView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        editMemoField.becomeFirstResponder()
        memoListView2.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell2")
        editMemoField2.becomeFirstResponder()
    //L2
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func tapSubmitButton(sender: UIButton) {applyMemo()
    }
    
    @IBAction func tapSubmitButton2(sender: UIButton) {applyMemo2()
    }
  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        if indexPath.row >= memoList.count {
            return cell
        }
        
        cell.textLabel?.text = memoList[indexPath.row]
        return cell
    }
    
    func tableView2(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell2", forIndexPath: indexPath)
        if indexPath.row >= memoList2.count {
            return cell
        }
        
        cell.textLabel?.text = memoList2[indexPath.row]
        return cell
    }//L2
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row >= memoList.count {
            return
        }
        editRow = indexPath.row
        editMemoField.text = memoList[editRow]
    }
    func tableView2(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row >= memoList2.count {
            return
        }
        editRow2 = indexPath.row
        editMemoField2.text = memoList2[editRow]
    }//L2
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        applyMemo()
        return true
    }
    func textFieldShouldReturn2(textField: UITextField) -> Bool {
        applyMemo2()
        return true
    }
    
    
    func applyMemo() {
        if editMemoField.text == nil {
            return
        }
        
        if editRow == unselectedRow {
            memoList.append(editMemoField.text!)
        } else {
            memoList[editRow] = editMemoField.text!
        }
        editMemoField.text = ""
        editRow = unselectedRow
        memoListView.reloadData()
    }
    func applyMemo2() {
        if editMemoField.text == nil {
            return
        }
        
        if editRow == unselectedRow {
            memoList.append(editMemoField.text!)
        } else {
            memoList[editRow] = editMemoField.text!
        }
        editMemoField.text = ""
        editRow = unselectedRow
        memoListView.reloadData()
        
    }
//以下電卓
    
    
    
    @IBOutlet weak var genjituText: UITextField!
   
    var mon : Double = 0//モニタ1
    var a : Double = 0//モニタ1
    var cal : Double = 0//計算
    var enz : Int = 1//演算子の振り分け
    var han : Int = 0//数字入力判定用
    
    
    @IBAction func but1(sender: AnyObject) {
        
        a = 1
        han = 1
        mon = mon*10 + a
        genjituText.text = String(mon)
    }
    
    
    @IBAction func but2(sender: AnyObject) {
        a = 2
        han = 1
        mon = mon*10 + a
        genjituText.text = String(mon)    }
    
    
    @IBAction func but3(sender: AnyObject) {
        a = 3
        han = 1
        mon = mon*10 + a
        genjituText.text = String(mon)
    }
    
    @IBAction func but4(sender: AnyObject) {
        a = 4
        han = 1
        mon = mon*10 + a
        genjituText.text = String(mon)     }
    
    
    @IBAction func but5(sender: AnyObject) {
        a = 5
        han = 1
        mon = mon*10 + a
        genjituText.text = String(mon)
    }
    
    @IBAction func but6(sender: AnyObject) {
        a = 6
        han = 1
        mon = mon*10 + a
        genjituText.text = String(mon)
    }
    
    @IBAction func but7(sender: AnyObject) {
        a = 7
        han = 1
        mon = mon*10 + a
        genjituText.text = String(mon)    }
    
    @IBAction func but8(sender: AnyObject) {
        a = 8
        han = 1
        mon = mon*10 + a
        genjituText.text = String(mon)
    }
    
    @IBAction func but9(sender: AnyObject) {
        a = 9
        han = 1
        mon = mon*10 + a
        genjituText.text = String(mon)
    }
    
    
   // @IBAction func but0(sender: AnyObject) {
   //     a = 0
   //     han = 1
   //     mon = mon*10 + a
   //     genjituText.text = String(mon)
    //}
    
    
    @IBAction func but(sender: AnyObject) {
        if han == 0{
        }
        else if enz == 1{
            cal = cal + mon
        }
        else if enz == 2{
            cal = cal - mon
        }
        else if enz == 3{
            cal = cal * mon
        }
        else if enz == 4{
            cal = cal / mon
        }
        enz = 1
        mon = 0
        han = 0
        genjituText.text = String(cal)
    }
    
    
    
    @IBAction func butMai(sender: AnyObject) {
        if han == 0{
        }
        else if enz == 1{
            cal = cal + mon
        }
        else if enz == 2{
            cal = cal - mon
        }
        else if enz == 3{
            cal = cal * mon
        }
        else if enz == 4{
            cal = cal / mon
        }
        enz = 2
        mon = 0
        han = 0
        genjituText.text = String(cal)
    }
    
    
    
    @IBAction func butKak(sender: AnyObject) {
        
        if han == 0{
        }
        else if enz == 1{
            cal = cal + mon
        }
        else if enz == 2{
            cal = cal - mon
        }
        else if enz == 3{
            cal = cal * mon
        }
        else if enz == 4{
            cal = cal / cal
        }
        enz = 3
        mon = 0
        han = 0
        genjituText.text = String(cal)

    }
    
    @IBAction func butKAk(sender: AnyObject) {
    
        if han == 0{
        }
        else if enz == 1{
            cal = cal + mon
        }
        else if enz == 2{
            cal = cal - mon
        }
        else if enz == 3{
            cal = cal * mon
        }
        else if enz == 4{
            cal = cal / cal
        }
        enz = 3
        mon = 0
        han = 0
        genjituText.text = String(cal)
        
        
    }
    
    
    @IBAction func butWar(sender: AnyObject) {
        if han == 0{
        }
        else if enz == 1{
            cal = cal + mon
        }
        else if enz == 2{
            cal = cal - mon
        }
        else if enz == 3{
            cal = cal * mon
        }
        else if enz == 4{
            cal = cal / mon
        }
        enz = 4
        mon = 0
        han = 0
        genjituText.text = String(cal)    }
    
    @IBAction func butAC(sender: AnyObject) {
        cal = 0
        mon = 0
        enz = 1
        han = 0
        genjituText.text = String(cal)
    }
    
    
    @IBAction func butgen(sender: AnyObject) {
        if enz == 1{
            cal = cal + mon
            genjituText.text = String(cal)
        }else if enz == 2{
            cal = cal - mon
            genjituText.text = String(cal)
        }else if enz == 3{
            cal = cal * mon
            genjituText.text = String(cal)
        }else if enz == 4{
            cal = cal / mon
            genjituText.text = String(cal)
        }
        print(mon)
        han = 0
        
    }
    

}