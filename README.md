# CSVtoMacDive
R script to convert CSV files into XML files that can be imported to MacDive.
This was specifically written to convert dives from the AAUS Scientific Diving export function but can certainly be adapted to any other csv.
## Example
head(data)
```
Date     Time Dive.Number Duration..min.            Location  Purpose.s.
1 5/24/2016 10:15 AM         291           1200 Restoration Ecology Proficiency
2 5/24/2016 10:58 AM         292           1740 Restoration Ecology  Scientific
3 5/24/2016 12:04 PM         293           1560 Restoration Ecology  Scientific
  Buddy.First.Name Buddy.Last.Name Second.Buddy.First.Name Second.Buddy.Last.Name
1             Dave           Eaken                                               
2            Brian      Reckenbeil                                               
3            Brian      Reckenbeil                                               
       Specific.Location Surface.Conditions Underwater.Conditions Surface.Interval
1 Long Key Bridge Rubble               Calm                  Good                0
2 Long Key Bridge Rubble               Calm                  Good               22
3 Long Key Bridge Rubble               Calm                  Good               36
  Decompression.Planning Breathing.Gas Required.Decompression Overhead.Environment
1      Computer - Uwatec           Air                     NA                   NA
2      Computer - Uwatec           Air                     NA                   NA
3      Computer - Uwatec           Air                     NA                   NA
  Blue.Water Ice.Polar Saturation.Diving Aquarium.Diving  Gear Depth..ft.
1         NA        NA                NA              NA Scuba         26
2         NA        NA                NA              NA Scuba         28
3         NA        NA                NA              NA Scuba         29
                     Comments            combdate                   V1
1         AAUS Check out dive 2016-05-24 10:15:00 UkcDAqujg7TRswKsWHTh
2 Survey for Orange Cup Coral 2016-05-24 10:58:00 mWUxlpfWWO00mT7v2k5e
3 Survey for Orange Cup Coral 2016-05-24 12:04:00 S4AvROMeo0el5TewYsoG
       First.buddy Second.buddy
1       Dave Eaken             
2 Brian Reckenbeil             
3 Brian Reckenbeil
```
Final XML
```<?xml version="1.0"?>

<!DOCTYPE dives SYSTEM "http://www.mac-dive.com/macdive_logbook.dtd">
<dives>
  <units>Imperial</units>
  <schema>2.2.0</schema>
  <dive>
    <date>2016-05-24 10:15:00</date>
    <identifier>UkcDAqujg7TRswKsWHTh</identifier>
    <diveNumber>291</diveNumber>
    <diver>Mike Bollinger</diver>
    <computer>Oceanic Veo 2.0</computer>
    <maxDepth>26</maxDepth>
    <duration>1200</duration>
    <surfaceInterval>0</surfaceInterval>
    <diveOperator>FWC</diveOperator>
    <boat>Lobster Parker</boat>
    <entryType>Boat</entryType>
    <site>
      <country>USA</country>
      <location>Marathon, FL</location>
      <name>Long Key Bridge Rubble</name>
    </site>
    <tags>
      <tag>Florida Keys</tag>
    </tags>
    <types>
      <type>Proficiency</type>
    </types>
    <buddies>
      <buddy>Dave Eaken</buddy>
      <buddy> </buddy>
    </buddies>
    <gear>
      <item>
        <type>Computer</type>
        <manufacturer>Oceanic</manufacturer>
        <name>Oceanic Veo 2.0</name>
        <serial></serial>
      </item>
    </gear>
  </dive>
  <dive>
    <date>2016-05-24 10:58:00</date>
    <identifier>mWUxlpfWWO00mT7v2k5e</identifier>
    <diveNumber>292</diveNumber>
    <diver>Mike Bollinger</diver>
    <computer>Oceanic Veo 2.0</computer>
    <maxDepth>28</maxDepth>
    <duration>1740</duration>
    <surfaceInterval>22</surfaceInterval>
    <diveOperator>FWC</diveOperator>
    <boat>Lobster Parker</boat>
    <entryType>Boat</entryType>
    <site>
      <country>USA</country>
      <location>Marathon, FL</location>
      <name>Long Key Bridge Rubble</name>
    </site>
    <tags>
      <tag>Florida Keys</tag>
    </tags>
    <types>
      <type>Scientific</type>
    </types>
    <buddies>
      <buddy>Brian Reckenbeil</buddy>
      <buddy> </buddy>
    </buddies>
    <gear>
      <item>
        <type>Computer</type>
        <manufacturer>Oceanic</manufacturer>
        <name>Oceanic Veo 2.0</name>
        <serial></serial>
      </item>
    </gear>
  </dive>
  <dive>
    <date>2016-05-24 12:04:00</date>
    <identifier>S4AvROMeo0el5TewYsoG</identifier>
    <diveNumber>293</diveNumber>
    <diver>Mike Bollinger</diver>
    <computer>Oceanic Veo 2.0</computer>
    <maxDepth>29</maxDepth>
    <duration>1560</duration>
    <surfaceInterval>36</surfaceInterval>
    <diveOperator>FWC</diveOperator>
    <boat>Lobster Parker</boat>
    <entryType>Boat</entryType>
    <site>
      <country>USA</country>
      <location>Marathon, FL</location>
      <name>Long Key Bridge Rubble</name>
    </site>
    <tags>
      <tag>Florida Keys</tag>
    </tags>
    <types>
      <type>Scientific</type>
    </types>
    <buddies>
      <buddy>Brian Reckenbeil</buddy>
      <buddy> </buddy>
    </buddies>
    <gear>
      <item>
        <type>Computer</type>
        <manufacturer>Oceanic</manufacturer>
        <name>Oceanic Veo 2.0</name>
        <serial></serial>
      </item>
    </gear>
  </dive>
</dives>
```
