<?php

/**
 * Application level Controller
 *
 * This file is application-wide controller file. You can put all
 * application-wide controller-related methods here.
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.Controller
 * @since         CakePHP(tm) v 0.2.9
 * @license       http://www.opensource.org/licenses/mit-license.php MIT License
 */
App::uses('Controller', 'Controller');

/**
 * Application Controller
 *
 * Add your application-wide methods in the class below, your controllers
 * will inherit them.
 *
 * @package		app.Controller
 * @link		http://book.cakephp.org/2.0/en/controllers.html#the-app-controller
 */
class AppController extends Controller {
    /*
     * Defined components uses in project
     * 
     */

    public $components = array('DebugKit.Toolbar',
        'Session',
        'Auth' => array(
            'loginRedirect'  => array(
                'controller' => 'users',
                'action'     => 'index'
            ),
            'logoutRedirect' => array(
                'controller' => 'pages',
                'action'     => 'display',
                'home'
            ),
            'authenticate' => array(
                'Form' => array(
                    'passwordHasher' => 'Blowfish'
                )
            )
        )
    );

    /*
     * Defined helpers uses in project
     * 
     */
    var $helpers = array('Html', 'Form', 'Session');

    // Function send mail in prject
    protected function _sendMail($message, $last_id, $lastest_user_email) {
        $message = "Your account information: Username: " .
                $lastest_user_email .
                // ". Password: " .
                // $lastest_user_password .
                " Please change your password at: " .
                "http://money.dev:8080/users/activate/" .
                $last_id .
                "/" . $lastest_user_email;

        $Email = new CakeEmail('smtp');
        $Email->from(array('moneylover.system@gmail.com' => __("Money lover system")));
        $Email->to($lastest_user_email);
        $Email->subject(__("Your account information"));
        $Email->send($message);
    }
    
    
    public function isAuthorized($user)
    {
        if ($this->Auth->User('id')) {
            return true;
        }
        // Default deny
        return false;
    }
    
    

}
