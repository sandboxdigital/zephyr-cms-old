<?php
class Form_Enquire extends Tg_Form 
{
	public function __construct($options = array())
	{
		parent::__construct(array('disableTranslator'=>true));

		$this->addElement('hidden', 'village', array (
			'label' 	 	=> 'Village',
			'decorators' 	 => array('ViewHelper'),
		));
				
		$options = array(
			'Mr'=>'Mr',
			'Mrs'=>'Mrs',
			'Ms'=>'Ms',
			'Miss'=>'Miss',
			'Dr'=>'Dr',
			'Other'=>'Other',		
		);
		
		$this->addElement('select', 'title', array (
			'label' 	 	=> 'Title',
			'multiOptions' 	=> $options
		));
		
		$this->addElement('text', 'firstName', array (
			'label' 	 => 'First Name',
			'required' 	 => true,
			'class' 	 => 'text'
		));
		
		$this->addElement('text', 'surname', array (
			'label' 	 => 'Surname',
			'required' 	 => true,
			'class' 	 => 'text'
		));
		
		$this->addElement('text', 'number', array (
			'label' 	 => 'Contact Number (business hours)',
			'required' 	 => true,
			'class' 	 => 'text'
		));
		
		$this->addElement('text', 'address1', array (
			'label' 	 => 'Postal Address',
			'required' 	 => true,
			'class' 	 => 'text'
		));
		
		$this->addElement('text', 'suburb', array (
			'label' 	 => 'Suburb',
			'required' 	 => true,
			'class' 	 => 'text'
		));
		
		$this->addElement('text', 'state', array (
			'label' 	 => 'State',
			'required' 	 => true,
			'class' 	 => 'text'
		));
		
		$this->addElement('text', 'postcode', array (
			'label' 	 => 'Postcode',
			'required' 	 => true,
			'class' 	 => 'text'
		));
		
		$this->addElement('text', 'country', array (
			'label' 	 => 'Country',
			'required' 	 => true,
			'class' 	 => 'text'
		));
		
		$this->addElement('text', 'email', array (
			'label' 	 => 'Email',
			'class' 	 => 'text',
			'validators' =>array('EmailAddress')
		));
		
		$this->addElement('textarea', 'notes', array (
			'label' 	 => 'Notes / Special Requirements',
			'class' 	 => 'text'
		));
		
		$this->addElement('checkbox', 'requestACatalogue', array (
			'label' 	 => 'Request A Catalogue',
			'class' 	 => 'checkbox',
			'Description'=>'Request a catalogue'
		));
		
		$this->addElement('custom', 'c1', array (
			'decorators' 	 => array('ViewHelper'),
			'html'=>'<div id="privacy">
		<p>By providing your contact details, you agree to our collection, use and disclosure of your contact details for the purposes of providing you with further information in relation to Stockland retirement villages and discussing with you the possibility of Stockland entering into a property transaction with you.</p>
		'
		));
		
		$this->addElement('checkbox', 'contactOptOut', array (
			'label' 	 => 'Contact Opt Out',
			'class' 	 => 'checkbox',
			'Description'=>'Unless you indicate otherwise by ticking this box, you also agree that we may use your contact details to keep you informed about future Stockland products, services and special offers that may be of interest to you and provide other relevant information relating to Stockland and its affiliate companies. This includes contacting you by telephone.'
		));
		
		$this->addElement('custom', 'c2', array (
			'decorators' 	 => array('ViewHelper'),
			'html'=>'
			<p>To find out information about Stockland’s Privacy Policy and to get access to information Stockland may hold about you, ask a Stockland representative to view a copy of Stockland’s Privacy Policy or view <a href="http://www.stockland.com.au/privacy-policy.htm" target="_blank">Stockland’s Privacy Policy here</a>.</p>
			</div>'
		));
		
		$this->addElement('submit', 'save', array (
			'label' => 'Submit',
			'class' => 'submit'
			));
	}
	
	function onValid ()
	{
		$mail = new Tg_Mail_Form();
		$mail->subject = 'Spring in to Retirement - Enquiry'; 
		$mail->to = 'contact.centre@stockland.com.au';
		$mail->addCc('simon.hodgon@iris-worldwide.com');
		$mail->addCc('thomas.garrood@gmail.com');
		$mail->send($this);
	}
}