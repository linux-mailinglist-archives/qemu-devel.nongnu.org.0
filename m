Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C003E169B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:12:34 +0200 (CEST)
Received: from localhost ([::1]:38680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBe6r-0007V3-6l
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBe3h-0000Oz-4N
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:09:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBe3Z-0007sm-GQ
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:09:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628172548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gCdkemQb7iLJsPFQNX15c1N/3mv7Yb12mTzojAwjkfg=;
 b=bxy/x3iTlEFW1/Ky4u5Sw+5Zgjs5dkFIbDsy3xHwCYTHpIB0sypuLCB8TlYmeB7aIHLTNp
 Sp3ivbLUnUIKKQn8kJo8qflZgVq9S1UHzMFWU1wva+1J8vI6yTTxjMV+NBaUtEwb39UxKh
 rNpZS3tNqHwlAwabewxrTh2BsccgdRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-OIcstT-OMZuq_n6QFeoG8A-1; Thu, 05 Aug 2021 10:09:06 -0400
X-MC-Unique: OIcstT-OMZuq_n6QFeoG8A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7E08180FCBC;
 Thu,  5 Aug 2021 14:09:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C8BA5D6A1;
 Thu,  5 Aug 2021 14:09:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3443A11380A5; Thu,  5 Aug 2021 16:09:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] docs: convert writing-qmp-commands.txt to
 writing-qmp-commands.rst
Date: Thu,  5 Aug 2021 16:09:02 +0200
Message-Id: <20210805140902.2110546-6-armbru@redhat.com>
In-Reply-To: <20210805140902.2110546-1-armbru@redhat.com>
References: <20210805140902.2110546-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Connor Kuehl <ckuehl@redhat.com>, peter.maydell@linaro.org,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

This does about the bare minimum, converting section headers to ReST
ones and adding an indent for code blocks.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210721165015.2180311-1-jsnow@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/index.rst                          |   1 +
 ...-commands.txt => writing-qmp-commands.rst} | 567 +++++++++---------
 2 files changed, 297 insertions(+), 271 deletions(-)
 rename docs/devel/{writing-qmp-commands.txt => writing-qmp-commands.rst} (61%)

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index bfba3a8daa..5522db7241 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -43,3 +43,4 @@ modifying QEMU's source code.
    ebpf_rss
    vfio-migration
    qapi-code-gen
+   writing-qmp-commands
diff --git a/docs/devel/writing-qmp-commands.txt b/docs/devel/writing-qmp-commands.rst
similarity index 61%
rename from docs/devel/writing-qmp-commands.txt
rename to docs/devel/writing-qmp-commands.rst
index b1e31d56c0..6a10a06c48 100644
--- a/docs/devel/writing-qmp-commands.txt
+++ b/docs/devel/writing-qmp-commands.rst
@@ -1,4 +1,5 @@
-= How to write QMP commands using the QAPI framework =
+How to write QMP commands using the QAPI framework
+==================================================
 
 This document is a step-by-step guide on how to write new QMP commands using
 the QAPI framework. It also shows how to implement new style HMP commands.
@@ -10,7 +11,9 @@ For an in-depth introduction to the QAPI framework, please refer to
 docs/devel/qapi-code-gen.txt. For documentation about the QMP protocol,
 start with docs/interop/qmp-intro.txt.
 
-== Overview ==
+
+Overview
+--------
 
 Generally speaking, the following steps should be taken in order to write a
 new QMP command.
@@ -31,55 +34,59 @@ new QMP command.
 The following sections will demonstrate each of the steps above. We will start
 very simple and get more complex as we progress.
 
-=== Testing ===
+
+Testing
+-------
 
 For all the examples in the next sections, the test setup is the same and is
 shown here.
 
-First, QEMU should be started like this:
+First, QEMU should be started like this::
 
-# qemu-system-TARGET [...] \
-    -chardev socket,id=qmp,port=4444,host=localhost,server=on \
-    -mon chardev=qmp,mode=control,pretty=on
+ # qemu-system-TARGET [...] \
+     -chardev socket,id=qmp,port=4444,host=localhost,server=on \
+     -mon chardev=qmp,mode=control,pretty=on
 
-Then, in a different terminal:
+Then, in a different terminal::
 
-$ telnet localhost 4444
-Trying 127.0.0.1...
-Connected to localhost.
-Escape character is '^]'.
-{
-    "QMP": {
-        "version": {
-            "qemu": {
-                "micro": 50, 
-                "minor": 15, 
-                "major": 0
-            }, 
-            "package": ""
-        }, 
-        "capabilities": [
-        ]
-    }
-}
+ $ telnet localhost 4444
+ Trying 127.0.0.1...
+ Connected to localhost.
+ Escape character is '^]'.
+ {
+     "QMP": {
+         "version": {
+             "qemu": {
+                 "micro": 50,
+                 "minor": 15,
+                 "major": 0
+             },
+             "package": ""
+         },
+         "capabilities": [
+         ]
+     }
+ }
 
 The above output is the QMP server saying you're connected. The server is
-actually in capabilities negotiation mode. To enter in command mode type:
+actually in capabilities negotiation mode. To enter in command mode type::
 
-{ "execute": "qmp_capabilities" }
+ { "execute": "qmp_capabilities" }
 
-Then the server should respond:
+Then the server should respond::
 
-{
-    "return": {
-    }
-}
+ {
+     "return": {
+     }
+ }
 
 Which is QMP's way of saying "the latest command executed OK and didn't return
 any data". Now you're ready to enter the QMP example commands as explained in
 the following sections.
 
-== Writing a command that doesn't return data ==
+
+Writing a command that doesn't return data
+------------------------------------------
 
 That's the most simple QMP command that can be written. Usually, this kind of
 command carries some meaningful action in QEMU but here it will just print
@@ -90,9 +97,9 @@ return any data.
 
 The first step is defining the command in the appropriate QAPI schema
 module.  We pick module qapi/misc.json, and add the following line at
-the bottom:
+the bottom::
 
-{ 'command': 'hello-world' }
+ { 'command': 'hello-world' }
 
 The "command" keyword defines a new QMP command. It's an JSON object. All
 schema entries are JSON objects. The line above will instruct the QAPI to
@@ -102,19 +109,19 @@ protocol data.
 The next step is to write the "hello-world" implementation. As explained
 earlier, it's preferable for commands to live in QEMU subsystems. But
 "hello-world" doesn't pertain to any, so we put its implementation in
-monitor/qmp-cmds.c:
+monitor/qmp-cmds.c::
 
-void qmp_hello_world(Error **errp)
-{
-    printf("Hello, world!\n");
-}
+ void qmp_hello_world(Error **errp)
+ {
+     printf("Hello, world!\n");
+ }
 
 There are a few things to be noticed:
 
-1. QMP command implementation functions must be prefixed with "qmp_"
+1. QMP command implementation functions must be prefixed with "qmp\_"
 2. qmp_hello_world() returns void, this is in accordance with the fact that the
    command doesn't return any data
-3. It takes an "Error **" argument. This is required. Later we will see how to
+3. It takes an "Error \*\*" argument. This is required. Later we will see how to
    return errors and take additional arguments. The Error argument should not
    be touched if the command doesn't return errors
 4. We won't add the function's prototype. That's automatically done by the QAPI
@@ -122,23 +129,25 @@ There are a few things to be noticed:
    because it's the easiest way to demonstrate a QMP command
 
 You're done. Now build qemu, run it as suggested in the "Testing" section,
-and then type the following QMP command:
+and then type the following QMP command::
 
-{ "execute": "hello-world" }
+ { "execute": "hello-world" }
 
 Then check the terminal running qemu and look for the "Hello, world" string. If
 you don't see it then something went wrong.
 
-=== Arguments ===
+
+Arguments
+~~~~~~~~~
 
 Let's add an argument called "message" to our "hello-world" command. The new
 argument will contain the string to be printed to stdout. It's an optional
 argument, if it's not present we print our default "Hello, World" string.
 
 The first change we have to do is to modify the command specification in the
-schema file to the following:
+schema file to the following::
 
-{ 'command': 'hello-world', 'data': { '*message': 'str' } }
+ { 'command': 'hello-world', 'data': { '*message': 'str' } }
 
 Notice the new 'data' member in the schema. It's an JSON object whose each
 element is an argument to the command in question. Also notice the asterisk,
@@ -147,80 +156,82 @@ for mandatory arguments). Finally, 'str' is the argument's type, which
 stands for "string". The QAPI also supports integers, booleans, enumerations
 and user defined types.
 
-Now, let's update our C implementation in monitor/qmp-cmds.c:
+Now, let's update our C implementation in monitor/qmp-cmds.c::
 
-void qmp_hello_world(bool has_message, const char *message, Error **errp)
-{
-    if (has_message) {
-        printf("%s\n", message);
-    } else {
-        printf("Hello, world\n");
-    }
-}
+ void qmp_hello_world(bool has_message, const char *message, Error **errp)
+ {
+     if (has_message) {
+         printf("%s\n", message);
+     } else {
+         printf("Hello, world\n");
+     }
+ }
 
 There are two important details to be noticed:
 
-1. All optional arguments are accompanied by a 'has_' boolean, which is set
+1. All optional arguments are accompanied by a 'has\_' boolean, which is set
    if the optional argument is present or false otherwise
 2. The C implementation signature must follow the schema's argument ordering,
    which is defined by the "data" member
 
 Time to test our new version of the "hello-world" command. Build qemu, run it as
-described in the "Testing" section and then send two commands:
+described in the "Testing" section and then send two commands::
 
-{ "execute": "hello-world" }
-{
-    "return": {
-    }
-}
+ { "execute": "hello-world" }
+ {
+     "return": {
+     }
+ }
 
-{ "execute": "hello-world", "arguments": { "message": "We love qemu" } }
-{
-    "return": {
-    }
-}
+ { "execute": "hello-world", "arguments": { "message": "We love qemu" } }
+ {
+     "return": {
+     }
+ }
 
 You should see "Hello, world" and "We love qemu" in the terminal running qemu,
 if you don't see these strings, then something went wrong.
 
-=== Errors ===
+
+Errors
+~~~~~~
 
 QMP commands should use the error interface exported by the error.h header
 file. Basically, most errors are set by calling the error_setg() function.
 
 Let's say we don't accept the string "message" to contain the word "love". If
-it does contain it, we want the "hello-world" command to return an error:
+it does contain it, we want the "hello-world" command to return an error::
 
-void qmp_hello_world(bool has_message, const char *message, Error **errp)
-{
-    if (has_message) {
-        if (strstr(message, "love")) {
-            error_setg(errp, "the word 'love' is not allowed");
-            return;
-        }
-        printf("%s\n", message);
-    } else {
-        printf("Hello, world\n");
-    }
-}
+ void qmp_hello_world(bool has_message, const char *message, Error **errp)
+ {
+     if (has_message) {
+         if (strstr(message, "love")) {
+             error_setg(errp, "the word 'love' is not allowed");
+             return;
+         }
+         printf("%s\n", message);
+     } else {
+         printf("Hello, world\n");
+     }
+ }
 
 The first argument to the error_setg() function is the Error pointer
 to pointer, which is passed to all QMP functions. The next argument is a human
 description of the error, this is a free-form printf-like string.
 
 Let's test the example above. Build qemu, run it as defined in the "Testing"
-section, and then issue the following command:
+section, and then issue the following command::
 
-{ "execute": "hello-world", "arguments": { "message": "all you need is love" } }
+ { "execute": "hello-world", "arguments": { "message": "all you need is love" } }
 
-The QMP server's response should be:
+The QMP server's response should be::
 
-{
-    "error": {
-        "class": "GenericError",
-        "desc": "the word 'love' is not allowed"
-    }
-}
+ {
+     "error": {
+         "class": "GenericError",
+         "desc": "the word 'love' is not allowed"
+     }
+ }
 
 Note that error_setg() produces a "GenericError" class.  In general,
 all QMP errors should have that error class.  There are two exceptions
@@ -234,34 +245,38 @@ to this rule:
 If the failure you want to report falls into one of the two cases above,
 use error_set() with a second argument of an ErrorClass value.
 
-=== Command Documentation ===
+
+Command Documentation
+~~~~~~~~~~~~~~~~~~~~~
 
 There's only one step missing to make "hello-world"'s implementation complete,
 and that's its documentation in the schema file.
 
 There are many examples of such documentation in the schema file already, but
-here goes "hello-world"'s new entry for qapi/misc.json:
+here goes "hello-world"'s new entry for qapi/misc.json::
 
-##
-# @hello-world:
-#
-# Print a client provided string to the standard output stream.
-#
-# @message: string to be printed
-#
-# Returns: Nothing on success.
-#
-# Notes: if @message is not provided, the "Hello, world" string will
-#        be printed instead
-#
-# Since: <next qemu stable release, eg. 1.0>
-##
-{ 'command': 'hello-world', 'data': { '*message': 'str' } }
+ ##
+ # @hello-world:
+ #
+ # Print a client provided string to the standard output stream.
+ #
+ # @message: string to be printed
+ #
+ # Returns: Nothing on success.
+ #
+ # Notes: if @message is not provided, the "Hello, world" string will
+ #        be printed instead
+ #
+ # Since: <next qemu stable release, eg. 1.0>
+ ##
+ { 'command': 'hello-world', 'data': { '*message': 'str' } }
 
 Please, note that the "Returns" clause is optional if a command doesn't return
 any data nor any errors.
 
-=== Implementing the HMP command ===
+
+Implementing the HMP command
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Now that the QMP command is in place, we can also make it available in the human
 monitor (HMP).
@@ -270,20 +285,20 @@ With the introduction of the QAPI, HMP commands make QMP calls. Most of the
 time HMP commands are simple wrappers. All HMP commands implementation exist in
 the monitor/hmp-cmds.c file.
 
-Here's the implementation of the "hello-world" HMP command:
+Here's the implementation of the "hello-world" HMP command::
 
-void hmp_hello_world(Monitor *mon, const QDict *qdict)
-{
-    const char *message = qdict_get_try_str(qdict, "message");
-    Error *err = NULL;
+ void hmp_hello_world(Monitor *mon, const QDict *qdict)
+ {
+     const char *message = qdict_get_try_str(qdict, "message");
+     Error *err = NULL;
 
-    qmp_hello_world(!!message, message, &err);
-    if (err) {
-        monitor_printf(mon, "%s\n", error_get_pretty(err));
-        error_free(err);
-        return;
-    }
-}
+     qmp_hello_world(!!message, message, &err);
+     if (err) {
+         monitor_printf(mon, "%s\n", error_get_pretty(err));
+         error_free(err);
+         return;
+     }
+ }
 
 Also, you have to add the function's prototype to the hmp.h file.
 
@@ -299,7 +314,7 @@ There are three important points to be noticed:
    QMP call
 
 There's one last step to actually make the command available to monitor users,
-we should add it to the hmp-commands.hx file:
+we should add it to the hmp-commands.hx file::
 
     {
         .name       = "hello-world",
@@ -309,11 +324,13 @@ we should add it to the hmp-commands.hx file:
         .cmd        = hmp_hello_world,
     },
 
-STEXI
-@item hello_world @var{message}
-@findex hello_world
-Print message to the standard output
-ETEXI
+::
+
+ STEXI
+ @item hello_world @var{message}
+ @findex hello_world
+ Print message to the standard output
+ ETEXI
 
 To test this you have to open a user monitor and issue the "hello-world"
 command. It might be instructive to check the command's documentation with
@@ -322,7 +339,9 @@ HMP's "help" command.
 Please, check the "-monitor" command-line option to know how to open a user
 monitor.
 
-== Writing a command that returns data ==
+
+Writing a command that returns data
+-----------------------------------
 
 A QMP command is capable of returning any data the QAPI supports like integers,
 strings, booleans, enumerations and user defined types.
@@ -330,7 +349,9 @@ strings, booleans, enumerations and user defined types.
 In this section we will focus on user defined types. Please, check the QAPI
 documentation for information about the other types.
 
-=== User Defined Types ===
+
+User Defined Types
+~~~~~~~~~~~~~~~~~~
 
 FIXME This example needs to be redone after commit 6d32717
 
@@ -344,63 +365,63 @@ returned as a string, the latter is an integer in nanoseconds (which is not
 very useful in practice, as the timer has probably already fired when the
 information reaches the client).
 
-The best way to return that data is to create a new QAPI type, as shown below:
+The best way to return that data is to create a new QAPI type, as shown below::
 
-##
-# @QemuAlarmClock
-#
-# QEMU alarm clock information.
-#
-# @clock-name: The alarm clock method's name.
-#
-# @next-deadline: The time (in nanoseconds) the next alarm will fire.
-#
-# Since: 1.0
-##
-{ 'type': 'QemuAlarmClock',
-  'data': { 'clock-name': 'str', '*next-deadline': 'int' } }
+ ##
+ # @QemuAlarmClock
+ #
+ # QEMU alarm clock information.
+ #
+ # @clock-name: The alarm clock method's name.
+ #
+ # @next-deadline: The time (in nanoseconds) the next alarm will fire.
+ #
+ # Since: 1.0
+ ##
+ { 'type': 'QemuAlarmClock',
+   'data': { 'clock-name': 'str', '*next-deadline': 'int' } }
 
 The "type" keyword defines a new QAPI type. Its "data" member contains the
 type's members. In this example our members are the "clock-name" and the
 "next-deadline" one, which is optional.
 
-Now let's define the query-alarm-clock command:
+Now let's define the query-alarm-clock command::
 
-##
-# @query-alarm-clock
-#
-# Return information about QEMU's alarm clock.
-#
-# Returns a @QemuAlarmClock instance describing the alarm clock method
-# being currently used by QEMU (this is usually set by the '-clock'
-# command-line option).
-#
-# Since: 1.0
-##
-{ 'command': 'query-alarm-clock', 'returns': 'QemuAlarmClock' }
+ ##
+ # @query-alarm-clock
+ #
+ # Return information about QEMU's alarm clock.
+ #
+ # Returns a @QemuAlarmClock instance describing the alarm clock method
+ # being currently used by QEMU (this is usually set by the '-clock'
+ # command-line option).
+ #
+ # Since: 1.0
+ ##
+ { 'command': 'query-alarm-clock', 'returns': 'QemuAlarmClock' }
 
 Notice the "returns" keyword. As its name suggests, it's used to define the
 data returned by a command.
 
 It's time to implement the qmp_query_alarm_clock() function, you can put it
-in the qemu-timer.c file:
+in the qemu-timer.c file::
 
-QemuAlarmClock *qmp_query_alarm_clock(Error **errp)
-{
-    QemuAlarmClock *clock;
-    int64_t deadline;
+ QemuAlarmClock *qmp_query_alarm_clock(Error **errp)
+ {
+     QemuAlarmClock *clock;
+     int64_t deadline;
 
-    clock = g_malloc0(sizeof(*clock));
+     clock = g_malloc0(sizeof(*clock));
 
-    deadline = qemu_next_alarm_deadline();
-    if (deadline > 0) {
-        clock->has_next_deadline = true;
-        clock->next_deadline = deadline;
-    }
-    clock->clock_name = g_strdup(alarm_timer->name);
+     deadline = qemu_next_alarm_deadline();
+     if (deadline > 0) {
+         clock->has_next_deadline = true;
+         clock->next_deadline = deadline;
+     }
+     clock->clock_name = g_strdup(alarm_timer->name);
 
-    return clock;
-}
+     return clock;
+ }
 
 There are a number of things to be noticed:
 
@@ -423,40 +444,42 @@ There are a number of things to be noticed:
 6. You have to include "qapi/qapi-commands-misc.h" in qemu-timer.c
 
 Time to test the new command. Build qemu, run it as described in the "Testing"
-section and try this:
+section and try this::
 
-{ "execute": "query-alarm-clock" }
-{
-    "return": {
-        "next-deadline": 2368219,
-        "clock-name": "dynticks"
-    }
-}
+ { "execute": "query-alarm-clock" }
+ {
+     "return": {
+         "next-deadline": 2368219,
+         "clock-name": "dynticks"
+     }
+ }
 
-==== The HMP command ====
 
-Here's the HMP counterpart of the query-alarm-clock command:
+The HMP command
+~~~~~~~~~~~~~~~
 
-void hmp_info_alarm_clock(Monitor *mon)
-{
-    QemuAlarmClock *clock;
-    Error *err = NULL;
+Here's the HMP counterpart of the query-alarm-clock command::
 
-    clock = qmp_query_alarm_clock(&err);
-    if (err) {
-        monitor_printf(mon, "Could not query alarm clock information\n");
-        error_free(err);
-        return;
-    }
+ void hmp_info_alarm_clock(Monitor *mon)
+ {
+     QemuAlarmClock *clock;
+     Error *err = NULL;
 
-    monitor_printf(mon, "Alarm clock method in use: '%s'\n", clock->clock_name);
-    if (clock->has_next_deadline) {
-        monitor_printf(mon, "Next alarm will fire in %" PRId64 " nanoseconds\n",
-                       clock->next_deadline);
-    }
+     clock = qmp_query_alarm_clock(&err);
+     if (err) {
+         monitor_printf(mon, "Could not query alarm clock information\n");
+         error_free(err);
+         return;
+     }
 
-   qapi_free_QemuAlarmClock(clock); 
-}
+     monitor_printf(mon, "Alarm clock method in use: '%s'\n", clock->clock_name);
+     if (clock->has_next_deadline) {
+         monitor_printf(mon, "Next alarm will fire in %" PRId64 " nanoseconds\n",
+                        clock->next_deadline);
+     }
+
+    qapi_free_QemuAlarmClock(clock);
+ }
 
 It's important to notice that hmp_info_alarm_clock() calls
 qapi_free_QemuAlarmClock() to free the data returned by qmp_query_alarm_clock().
@@ -471,7 +494,7 @@ it's good practice to always check for errors.
 
 Another important detail is that HMP's "info" commands don't go into the
 hmp-commands.hx. Instead, they go into the info_cmds[] table, which is defined
-in the monitor/misc.c file. The entry for the "info alarmclock" follows:
+in the monitor/misc.c file. The entry for the "info alarmclock" follows::
 
     {
         .name       = "alarmclock",
@@ -483,63 +506,65 @@ in the monitor/misc.c file. The entry for the "info alarmclock" follows:
 
 To test this, run qemu and type "info alarmclock" in the user monitor.
 
-=== Returning Lists ===
+
+Returning Lists
+~~~~~~~~~~~~~~~
 
 For this example, we're going to return all available methods for the timer
 alarm, which is pretty much what the command-line option "-clock ?" does,
 except that we're also going to inform which method is in use.
 
-This first step is to define a new type:
+This first step is to define a new type::
 
-##
-# @TimerAlarmMethod
-#
-# Timer alarm method information.
-#
-# @method-name: The method's name.
-#
-# @current: true if this alarm method is currently in use, false otherwise
-#
-# Since: 1.0
-##
-{ 'type': 'TimerAlarmMethod',
-  'data': { 'method-name': 'str', 'current': 'bool' } }
+ ##
+ # @TimerAlarmMethod
+ #
+ # Timer alarm method information.
+ #
+ # @method-name: The method's name.
+ #
+ # @current: true if this alarm method is currently in use, false otherwise
+ #
+ # Since: 1.0
+ ##
+ { 'type': 'TimerAlarmMethod',
+   'data': { 'method-name': 'str', 'current': 'bool' } }
 
 The command will be called "query-alarm-methods", here is its schema
-specification:
+specification::
 
-##
-# @query-alarm-methods
-#
-# Returns information about available alarm methods.
-#
-# Returns: a list of @TimerAlarmMethod for each method
-#
-# Since: 1.0
-##
-{ 'command': 'query-alarm-methods', 'returns': ['TimerAlarmMethod'] }
+ ##
+ # @query-alarm-methods
+ #
+ # Returns information about available alarm methods.
+ #
+ # Returns: a list of @TimerAlarmMethod for each method
+ #
+ # Since: 1.0
+ ##
+ { 'command': 'query-alarm-methods', 'returns': ['TimerAlarmMethod'] }
 
 Notice the syntax for returning lists "'returns': ['TimerAlarmMethod']", this
 should be read as "returns a list of TimerAlarmMethod instances".
 
-The C implementation follows:
+The C implementation follows::
 
-TimerAlarmMethodList *qmp_query_alarm_methods(Error **errp)
-{
-    TimerAlarmMethodList *method_list = NULL;
-    const struct qemu_alarm_timer *p;
-    bool current = true;
+ TimerAlarmMethodList *qmp_query_alarm_methods(Error **errp)
+ {
+     TimerAlarmMethodList *method_list = NULL;
+     const struct qemu_alarm_timer *p;
+     bool current = true;
 
-    for (p = alarm_timers; p->name; p++) {
-        TimerAlarmMethod *value = g_malloc0(*value);
-        value->method_name = g_strdup(p->name);
-        value->current = current;
-        QAPI_LIST_PREPEND(method_list, value);
-        current = false;
-    }
+     for (p = alarm_timers; p->name; p++) {
+         TimerAlarmMethod *value = g_malloc0(*value);
+         value->method_name = g_strdup(p->name);
+         value->current = current;
+         QAPI_LIST_PREPEND(method_list, value);
+         current = false;
+     }
 
-    return method_list;
-}
+     return method_list;
+ }
 
 The most important difference from the previous examples is the
 TimerAlarmMethodList type, which is automatically generated by the QAPI from
@@ -557,41 +582,41 @@ first element of the alarm_timers array. Also notice that QAPI lists are handled
 by hand and we return the head of the list.
 
 Now Build qemu, run it as explained in the "Testing" section and try our new
-command:
+command::
 
-{ "execute": "query-alarm-methods" }
-{
-    "return": [
-        {
-            "current": false, 
-            "method-name": "unix"
-        }, 
-        {
-            "current": true, 
-            "method-name": "dynticks"
-        }
-    ]
-}
+ { "execute": "query-alarm-methods" }
+ {
+     "return": [
+         {
+             "current": false,
+             "method-name": "unix"
+         },
+         {
+             "current": true,
+             "method-name": "dynticks"
+         }
+     ]
+ }
 
 The HMP counterpart is a bit more complex than previous examples because it
-has to traverse the list, it's shown below for reference:
+has to traverse the list, it's shown below for reference::
 
-void hmp_info_alarm_methods(Monitor *mon)
-{
-    TimerAlarmMethodList *method_list, *method;
-    Error *err = NULL;
+ void hmp_info_alarm_methods(Monitor *mon)
+ {
+     TimerAlarmMethodList *method_list, *method;
+     Error *err = NULL;
 
-    method_list = qmp_query_alarm_methods(&err);
-    if (err) {
-        monitor_printf(mon, "Could not query alarm methods\n");
-        error_free(err);
-        return;
-    }
+     method_list = qmp_query_alarm_methods(&err);
+     if (err) {
+         monitor_printf(mon, "Could not query alarm methods\n");
+         error_free(err);
+         return;
+     }
 
-    for (method = method_list; method; method = method->next) {
-        monitor_printf(mon, "%c %s\n", method->value->current ? '*' : ' ',
-                                       method->value->method_name);
-    }
+     for (method = method_list; method; method = method->next) {
+         monitor_printf(mon, "%c %s\n", method->value->current ? '*' : ' ',
+                                        method->value->method_name);
+     }
 
-    qapi_free_TimerAlarmMethodList(method_list);
-}
+     qapi_free_TimerAlarmMethodList(method_list);
+ }
-- 
2.31.1


