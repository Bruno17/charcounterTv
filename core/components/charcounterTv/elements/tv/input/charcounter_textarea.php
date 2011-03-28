<?php
/**
 * charcounter_textarea - TV
 *
 * Copyright 2011 by Bruno Perner <b.perner@gmx.de>
 *
 * charcounter_textarea - TV is free software; you can redistribute it and/or modify it under the
 * terms of the GNU General Public License as published by the Free Software
 * Foundation; either version 2 of the License, or (at your option) any later
 * version.
 *
 * charcounter_textarea - TV is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * charcounter_textarea - TV; if not, write to the Free Software Foundation, Inc., 59 Temple
 * Place, Suite 330, Boston, MA 02111-1307 USA
 *
 * @package charcounterTv
 */
/**
 * Input TV render to limit chars
 *
 * @package charcounterTv
 * @subpackage tv
 */
$this->xpdo->lexicon->load('tv_widget');

$options = $this->parseInputOptions($this->processBindings($this->get('elements'),$this->get('name')));

$opts='allowed characters remaining:100';
if (count($options)>0){
$opts=!empty($options[0])?$options[0]:$opts;
}

$options=explode (':',$opts);
$counter['caption']=$options[0];
$counter['value']=$options[1];
$counter['xtype']='textarea';

$corePath = $this->xpdo->getOption('charcounter.core_path',null,$this->xpdo->getOption('core_path').'components/charcounterTv/');
$this->xpdo->smarty->assign('counter',$counter);
return $modx->smarty->fetch($corePath.'elements/tv/charcounter.tpl');