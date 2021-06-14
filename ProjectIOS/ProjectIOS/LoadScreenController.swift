//
//  LoadScreenController.swift
//  ProjectIOS
//
//  Created by Chuẩn Vũ Minh on 6/13/21.
//

import UIKit
import Firebase

class LoadScreenController: UIViewController {
    //MARK: hằng sử dụng chung trong cả chương trình
    public static let COUNTDOWN_BANG_A:String = "15:00";
    public static let COUNTDOWN_BANG_B_C_D_E_F:String = "20:00";
    public static let BANG_A1:String = "Bang A1";
    public static let BANG_A2:String = "Bang A2";
    public static let BANG_A3_A4:String = "Bang A3,A4";
    public static let BANG_B1:String = "Bang B1";
    public static let BANG_B2_C_D_E_F:String = "Bang B2, C, D, E, F";
    
    
    @IBOutlet weak var txtWarning: UILabel!
    var ref: DatabaseReference!
    var flag:Bool = true;
    var cauHoi:CauHoi = CauHoi();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
        print(InternetConnectionManager.isConnectedToNetwork());
        if(InternetConnectionManager.isConnectedToNetwork()){
        ref = Database.database().reference();
        ref.observe(DataEventType.value, with: { [self] (snapshot) in
            let dataSnapshot = snapshot.value as? [String : AnyObject] ?? [:]
            if(flag){
                flag = false;
                
                for data in dataSnapshot {
                    let dataChild = data.value as? [String : AnyObject] ?? [:]
                    switch data.key {
                    case LoadScreenController.BANG_A1:
                        for dataChildren in dataChild {
                            if let value = dataChildren.value as? NSDictionary{
                                self.cauHoi = TienIch.createCauHoi(value);
                                FirebaseData.bangA1 += [cauHoi];
                            }
                        }
                        break;
                    case LoadScreenController.BANG_A2:
                        for dataChildren in dataChild {
                            if let value = dataChildren.value as? NSDictionary{
                                cauHoi = TienIch.createCauHoi(value);
                                FirebaseData.bangA2 += [cauHoi];
                            }
                        }
                        break;
                    case LoadScreenController.BANG_A3_A4:
                        for dataChildren in dataChild {
                            if let value = dataChildren.value as? NSDictionary{
                                cauHoi = TienIch.createCauHoi(value);
                                FirebaseData.bangA3_A4 += [cauHoi];
                            }
                        }
                        break;
                    case LoadScreenController.BANG_B1:
                        for dataChildren in dataChild {
                            if let value = dataChildren.value as? NSDictionary{
                                cauHoi = TienIch.createCauHoi(value);
                                FirebaseData.bangB1 += [cauHoi];
                            }
                        }
                        break;
                    case LoadScreenController.BANG_B2_C_D_E_F:
                        for dataChildren in dataChild {
                            if let value = dataChildren.value as? NSDictionary{
                                cauHoi = TienIch.createCauHoi(value);
                                FirebaseData.bangB2_C_D_E_F += [cauHoi];
                            }
                        }
                        break;
                    default:
                        break;
                    }
                }
                
                //chuyen man hinh
            
                
                let mainStoryBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let homeView  = mainStoryBoard.instantiateViewController(withIdentifier: "Nav") as! UINavigationController
                homeView.modalPresentationStyle = .fullScreen
                self.present(homeView, animated: true, completion: nil)
                


            }
        })
        }else{
            txtWarning.text = "Không có kết nối Internet!";
        }
    }
}

