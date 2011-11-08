<?php

class Model_Event extends Tg_Db_ActiveRecord
{
    protected $_name = 'event';
    protected $_className = __CLASS__;
	private static $_model;

    /**
     *
     * @param type $name
     * @return Model_Event
     */
    public static function model($name = __CLASS__)
    {
        if (!self::$_model)
            self::$_model = new $name();

        return self::$_model;
    }
    
    public function town ()
    {
    	
    	$i = strrpos($this->address, ',');
    	
    	if ($i > 0)
    	{
    		return trim(substr($this->address, $i+1));
    	} else 
    		return $this->address;
    }
    
    public function openDays ()
    {
    	
    	$select = $this->select(true);
    	$select->setIntegrityCheck(false);
    	$select->joinLeft('village', 'village.id=event.villageId', array('villageName'=>'village.name','villageThumbnail'=>'village.fileThumbnail'));
    	
    	$select->order('date ASC');    	
    	
    	return $this->all($select);
    }
    
}