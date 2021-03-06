--[[
LuCI - Lua Configuration Interface

Copyright 2008 Steven Barth <steven@midlink.org>
Copyright 2008 Jo-Philipp Wich <xm@leipzig.freifunk.net>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

$Id: asterisk-voice.lua 3620 2008-10-23 15:42:12Z jow $
]]--

cbimap = Map("asterisk", "asterisk", "")

voicegeneral = cbimap:section(TypedSection, "voicegeneral", translate("Voicemail general options"), "")

serveremail = voicegeneral:option(Value, "serveremail", translate("From Email address of server"), "")


voicemail = cbimap:section(TypedSection, "voicemail", translate("Voice Mail boxes"), "")
voicemail.addremove = true

attach = voicemail:option(Flag, "attach", translate("Email contains attachment"), "")
attach.rmempty = true

email = voicemail:option(Value, "email", translate("Email"), "")
email.rmempty = true

name = voicemail:option(Value, "name", translate("Display Name"), "")
name.rmempty = true

password = voicemail:option(Value, "password", translate("Password"), "")
password.rmempty = true

zone = voicemail:option(ListValue, "zone", translate("Voice Zone"), "")
cbimap.uci:foreach( "asterisk", "voicezone", function(s) zone:value(s['.name']) end )


voicezone = cbimap:section(TypedSection, "voicezone", translate("Voice Zone settings"), "")
voicezone.addremove = true

message = voicezone:option(Value, "message", translate("Message Format"), "")
message.rmempty = true

zone = voicezone:option(Value, "zone", translate("Time Zone"), "")
zone.rmempty = true


return cbimap
