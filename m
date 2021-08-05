Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D633E16D3
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:21:18 +0200 (CEST)
Received: from localhost ([::1]:38132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBeFJ-0000zB-LE
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBe3g-0000Lh-AT
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:09:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBe3a-0007tm-6a
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:09:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628172549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qr+5glCU8GfKFnGWHfI0YLXbaxu50IRNw6H96SLd2og=;
 b=bz09AzyZjyGEKgORpnVfNicaY+i4zuWwj/2l8vMUKx0teI4DYzKa0WLRem27Kukm22kgkd
 Esg4qvAg5xau8mVfdnxWZwGbNjlDD6NVrvGRhDvi+Oh7zBZmlG3UrhGZoiD9B68d7C9FrY
 VOkvl2PkfnXTWKNVYjpp/62At1SELKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-qjxz_G6GOTWKZHRAVqk5Sw-1; Thu, 05 Aug 2021 10:09:05 -0400
X-MC-Unique: qjxz_G6GOTWKZHRAVqk5Sw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 502CE87D545;
 Thu,  5 Aug 2021 14:09:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8675B10016F5;
 Thu,  5 Aug 2021 14:09:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 246D711380A2; Thu,  5 Aug 2021 16:09:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] docs: convert qapi-code-gen.txt to ReST
Date: Thu,  5 Aug 2021 16:08:59 +0200
Message-Id: <20210805140902.2110546-3-armbru@redhat.com>
In-Reply-To: <20210805140902.2110546-1-armbru@redhat.com>
References: <20210805140902.2110546-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

This is a very rudimentary conversion from .txt to .rst changing as
little as possible, but getting it to render somewhat nicely; without
using any Sphinx directives. (It is 'native' ReST.)

Further patches will add cross-references and Sphinx-specific extensions
to make it sparkle.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210720235619.2048797-2-jsnow@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/index.rst                          |   1 +
 .../{qapi-code-gen.txt => qapi-code-gen.rst}  | 559 ++++++++++--------
 2 files changed, 312 insertions(+), 248 deletions(-)
 rename docs/devel/{qapi-code-gen.txt => qapi-code-gen.rst} (86%)

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 153979caf4..bfba3a8daa 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -42,3 +42,4 @@ modifying QEMU's source code.
    multi-process
    ebpf_rss
    vfio-migration
+   qapi-code-gen
diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.rst
similarity index 86%
rename from docs/devel/qapi-code-gen.txt
rename to docs/devel/qapi-code-gen.rst
index 233022184b..9155dba262 100644
--- a/docs/devel/qapi-code-gen.txt
+++ b/docs/devel/qapi-code-gen.rst
@@ -1,12 +1,17 @@
-= How to use the QAPI code generator =
+==================================
+How to use the QAPI code generator
+==================================
 
-Copyright IBM Corp. 2011
-Copyright (C) 2012-2016 Red Hat, Inc.
+..
+   Copyright IBM Corp. 2011
+   Copyright (C) 2012-2016 Red Hat, Inc.
 
-This work is licensed under the terms of the GNU GPL, version 2 or
-later.  See the COPYING file in the top-level directory.
+   This work is licensed under the terms of the GNU GPL, version 2 or
+   later.  See the COPYING file in the top-level directory.
 
-== Introduction ==
+
+Introduction
+============
 
 QAPI is a native C API within QEMU which provides management-level
 functionality to internal and external users.  For external
@@ -23,7 +28,8 @@ Protocol and to C.  It additionally provides guidance on maintaining
 Client JSON Protocol compatibility.
 
 
-== The QAPI schema language ==
+The QAPI schema language
+========================
 
 The QAPI schema defines the Client JSON Protocol's commands and
 events, as well as types used by them.  Forward references are
@@ -39,9 +45,10 @@ complex types (structs and two flavors of unions), and alternate types
 (a choice between other types).
 
 
-=== Schema syntax ===
+Schema syntax
+-------------
 
-Syntax is loosely based on JSON (http://www.ietf.org/rfc/rfc8259.txt).
+Syntax is loosely based on `JSON <http://www.ietf.org/rfc/rfc8259.txt>`_.
 Differences:
 
 * Comments: start with a hash character (#) that is not part of a
@@ -79,7 +86,7 @@ syntax in an EBNF-like notation:
 The order of members within JSON objects does not matter unless
 explicitly noted.
 
-A QAPI schema consists of a series of top-level expressions:
+A QAPI schema consists of a series of top-level expressions::
 
     SCHEMA = TOP-LEVEL-EXPR...
 
@@ -87,11 +94,11 @@ The top-level expressions are all JSON objects.  Code and
 documentation is generated in schema definition order.  Code order
 should not matter.
 
-A top-level expressions is either a directive or a definition:
+A top-level expressions is either a directive or a definition::
 
     TOP-LEVEL-EXPR = DIRECTIVE | DEFINITION
 
-There are two kinds of directives and six kinds of definitions:
+There are two kinds of directives and six kinds of definitions::
 
     DIRECTIVE = INCLUDE | PRAGMA
     DEFINITION = ENUM | STRUCT | UNION | ALTERNATE | COMMAND | EVENT
@@ -99,9 +106,10 @@ There are two kinds of directives and six kinds of definitions:
 These are discussed in detail below.
 
 
-=== Built-in Types ===
+Built-in Types
+--------------
 
-The following types are predefined, and map to C as follows:
+The following types are predefined, and map to C as follows::
 
   Schema    C          JSON
   str       char *     any JSON string, UTF-8
@@ -124,12 +132,14 @@ The following types are predefined, and map to C as follows:
   QType     QType      JSON string matching enum QType values
 
 
-=== Include directives ===
+Include directives
+------------------
+
+Syntax::
 
-Syntax:
     INCLUDE = { 'include': STRING }
 
-The QAPI schema definitions can be modularized using the 'include' directive:
+The QAPI schema definitions can be modularized using the 'include' directive::
 
  { 'include': 'path/to/file.json' }
 
@@ -144,9 +154,11 @@ an outer file.  The parser may be made stricter in the future to
 prevent incomplete include files.
 
 
-=== Pragma directives ===
+Pragma directives
+-----------------
+
+Syntax::
 
-Syntax:
     PRAGMA = { 'pragma': {
                    '*doc-required': BOOL,
                    '*command-name-exceptions': [ STRING, ... ],
@@ -172,9 +184,11 @@ names may contain uppercase letters, and '_' instead of '-'.  Default
 is none.
 
 
-=== Enumeration types ===
+Enumeration types
+-----------------
+
+Syntax::
 
-Syntax:
     ENUM = { 'enum': STRING,
              'data': [ ENUM-VALUE, ... ],
              '*prefix': STRING,
@@ -189,7 +203,7 @@ Each member of the 'data' array defines a value of the enumeration
 type.  The form STRING is shorthand for { 'name': STRING }.  The
 'name' values must be be distinct.
 
-Example:
+Example::
 
  { 'enum': 'MyEnum', 'data': [ 'value1', 'value2', 'value3' ] }
 
@@ -218,9 +232,11 @@ The optional 'features' member specifies features.  See "Features"
 below for more on this.
 
 
-=== Type references and array types ===
+Type references and array types
+-------------------------------
+
+Syntax::
 
-Syntax:
     TYPE-REF = STRING | ARRAY-TYPE
     ARRAY-TYPE = [ STRING ]
 
@@ -230,9 +246,11 @@ A one-element array containing a string denotes an array of the type
 named by the string.  Example: ['int'] denotes an array of 'int'.
 
 
-=== Struct types ===
+Struct types
+------------
+
+Syntax::
 
-Syntax:
     STRUCT = { 'struct': STRING,
                'data': MEMBERS,
                '*base': STRING,
@@ -254,7 +272,7 @@ struct member name.  If '*' is present, the member is optional.
 The MEMBER's value defines its properties, in particular its type.
 The form TYPE-REF is shorthand for { 'type': TYPE-REF }.
 
-Example:
+Example::
 
  { 'struct': 'MyType',
    'data': { 'member1': 'str', 'member2': ['int'], '*member3': 'str' } }
@@ -265,7 +283,7 @@ The C struct's members are generated in QAPI schema order.
 The optional 'base' member names a struct type whose members are to be
 included in this type.  They go first in the C struct.
 
-Example:
+Example::
 
  { 'struct': 'BlockdevOptionsGenericFormat',
    'data': { 'file': 'str' } }
@@ -274,7 +292,7 @@ Example:
    'data': { '*backing': 'str' } }
 
 An example BlockdevOptionsGenericCOWFormat object on the wire could use
-both members like this:
+both members like this::
 
  { "file": "/some/place/my-image",
    "backing": "/some/place/my-backing-file" }
@@ -286,9 +304,11 @@ The optional 'features' member specifies features.  See "Features"
 below for more on this.
 
 
-=== Union types ===
+Union types
+-----------
+
+Syntax::
 
-Syntax:
     UNION = { 'union': STRING,
               'data': BRANCHES,
               '*if': COND,
@@ -317,7 +337,7 @@ The BRANCH's value defines the branch's properties, in particular its
 type.  The form TYPE-REF is shorthand for { 'type': TYPE-REF }.
 
 A simple union type defines a mapping from automatic discriminator
-values to data types like in this example:
+values to data types like in this example::
 
  { 'struct': 'BlockdevOptionsFile', 'data': { 'filename': 'str' } }
  { 'struct': 'BlockdevOptionsQcow2',
@@ -330,7 +350,7 @@ values to data types like in this example:
 In the Client JSON Protocol, a simple union is represented by an
 object that contains the 'type' member as a discriminator, and a
 'data' member that is of the specified data type corresponding to the
-discriminator value, as in these examples:
+discriminator value, as in these examples::
 
  { "type": "file", "data": { "filename": "/some/place/my-image" } }
  { "type": "qcow2", "data": { "backing": "/some/place/my-image",
@@ -361,7 +381,7 @@ struct.
 The following example enhances the above simple union example by
 adding an optional common member 'read-only', renaming the
 discriminator to something more applicable than the simple union's
-default of 'type', and reducing the number of {} required on the wire:
+default of 'type', and reducing the number of {} required on the wire::
 
  { 'enum': 'BlockdevDriver', 'data': [ 'file', 'qcow2' ] }
  { 'union': 'BlockdevOptions',
@@ -370,7 +390,7 @@ default of 'type', and reducing the number of {} required on the wire:
    'data': { 'file': 'BlockdevOptionsFile',
              'qcow2': 'BlockdevOptionsQcow2' } }
 
-Resulting in these JSON objects:
+Resulting in these JSON objects::
 
  { "driver": "file", "read-only": true,
    "filename": "/some/place/my-image" }
@@ -390,11 +410,11 @@ struct.
 
 A simple union can always be re-written as a flat union where the base
 class has a single member named 'type', and where each branch of the
-union has a struct with a single member named 'data'.  That is,
+union has a struct with a single member named 'data'.  That is, ::
 
  { 'union': 'Simple', 'data': { 'one': 'str', 'two': 'int' } }
 
-is identical on the wire to:
+is identical on the wire to::
 
  { 'enum': 'Enum', 'data': ['one', 'two'] }
  { 'struct': 'Branch1', 'data': { 'data': 'str' } }
@@ -409,9 +429,11 @@ The optional 'features' member specifies features.  See "Features"
 below for more on this.
 
 
-=== Alternate types ===
+Alternate types
+---------------
+
+Syntax::
 
-Syntax:
     ALTERNATE = { 'alternate': STRING,
                   'data': ALTERNATIVES,
                   '*if': COND,
@@ -430,7 +452,7 @@ The ALTERNATIVE's STRING name is the branch name.
 The ALTERNATIVE's value defines the branch's properties, in particular
 its type.  The form STRING is shorthand for { 'type': STRING }.
 
-Example:
+Example::
 
  { 'alternate': 'BlockdevRef',
    'data': { 'definition': 'BlockdevOptions',
@@ -449,7 +471,7 @@ as the 'null' built-in, it accepts JSON null; and if it is typed as a
 complex type (struct or union), it accepts a JSON object.
 
 The example alternate declaration above allows using both of the
-following example objects:
+following example objects::
 
  { "file": "my_existing_block_device_id" }
  { "file": { "driver": "file",
@@ -463,9 +485,11 @@ The optional 'features' member specifies features.  See "Features"
 below for more on this.
 
 
-=== Commands ===
+Commands
+--------
+
+Syntax::
 
-Syntax:
     COMMAND = { 'command': STRING,
                 (
                 '*data': ( MEMBERS | STRING ),
@@ -508,7 +532,7 @@ member is the command name.  The value of the "arguments" member then
 has to conform to the arguments, and the value of the success
 response's "return" member will conform to the return type.
 
-Some example commands:
+Some example commands::
 
  { 'command': 'my-first-command',
    'data': { 'arg1': 'str', '*arg2': 'str' } }
@@ -516,7 +540,7 @@ Some example commands:
  { 'command': 'my-second-command',
    'returns': [ 'MyType' ] }
 
-which would validate this Client JSON Protocol transaction:
+which would validate this Client JSON Protocol transaction::
 
  => { "execute": "my-first-command",
       "arguments": { "arg1": "hello" } }
@@ -543,7 +567,7 @@ In rare cases, QAPI cannot express a type-safe representation of a
 corresponding Client JSON Protocol command.  You then have to suppress
 generation of a marshalling function by including a member 'gen' with
 boolean value false, and instead write your own function.  For
-example:
+example::
 
  { 'command': 'netdev_add',
    'data': {'type': 'str', 'id': 'str'},
@@ -561,7 +585,7 @@ the command definition includes the optional member 'success-response'
 with boolean value false.  So far, only QGA makes use of this member.
 
 Member 'allow-oob' declares whether the command supports out-of-band
-(OOB) execution.  It defaults to false.  For example:
+(OOB) execution.  It defaults to false.  For example::
 
  { 'command': 'migrate_recover',
    'data': { 'uri': 'str' }, 'allow-oob': true }
@@ -594,7 +618,7 @@ other "slow" lock.
 When in doubt, do not implement OOB execution support.
 
 Member 'allow-preconfig' declares whether the command is available
-before the machine is built.  It defaults to false.  For example:
+before the machine is built.  It defaults to false.  For example::
 
  { 'enum': 'QMPCapability',
    'data': [ 'oob' ] }
@@ -640,9 +664,11 @@ The optional 'features' member specifies features.  See "Features"
 below for more on this.
 
 
-=== Events ===
+Events
+------
+
+Syntax::
 
-Syntax:
     EVENT = { 'event': STRING,
               (
               '*data': ( MEMBERS | STRING ),
@@ -665,16 +691,16 @@ data just like a struct type's 'data' defines struct type members.
 If 'data' is a STRING, then STRING names a complex type whose members
 are the event-specific data.  A union type requires 'boxed': true.
 
-An example event is:
+An example event is::
 
-{ 'event': 'EVENT_C',
-  'data': { '*a': 'int', 'b': 'str' } }
+ { 'event': 'EVENT_C',
+   'data': { '*a': 'int', 'b': 'str' } }
 
-Resulting in this JSON object:
+Resulting in this JSON object::
 
-{ "event": "EVENT_C",
-  "data": { "b": "test string" },
-  "timestamp": { "seconds": 1267020223, "microseconds": 435656 } }
+ { "event": "EVENT_C",
+   "data": { "b": "test string" },
+   "timestamp": { "seconds": 1267020223, "microseconds": 435656 } }
 
 The generator emits a function to send the event.  When member 'boxed'
 is absent, it takes event-specific data one by one, in QAPI schema
@@ -688,9 +714,11 @@ The optional 'features' member specifies features.  See "Features"
 below for more on this.
 
 
-=== Features ===
+Features
+--------
+
+Syntax::
 
-Syntax:
     FEATURES = [ FEATURE, ... ]
     FEATURE = STRING
             | { 'name': STRING, '*if': COND }
@@ -701,17 +729,17 @@ that previously resulted in an error).  QMP clients may still need to
 know whether the extension is available.
 
 For this purpose, a list of features can be specified for a command or
-struct type.  Each list member can either be { 'name': STRING, '*if':
-COND }, or STRING, which is shorthand for { 'name': STRING }.
+struct type.  Each list member can either be ``{ 'name': STRING, '*if':
+COND }``, or STRING, which is shorthand for ``{ 'name': STRING }``.
 
 The optional 'if' member specifies a conditional.  See "Configuring
 the schema" below for more on this.
 
-Example:
+Example::
 
-{ 'struct': 'TestType',
-  'data': { 'number': 'int' },
-  'features': [ 'allow-negative-numbers' ] }
+ { 'struct': 'TestType',
+   'data': { 'number': 'int' },
+   'features': [ 'allow-negative-numbers' ] }
 
 The feature strings are exposed to clients in introspection, as
 explained in section "Client JSON Protocol introspection".
@@ -720,20 +748,22 @@ Intended use is to have each feature string signal that this build of
 QEMU shows a certain behaviour.
 
 
-==== Special features ====
+Special features
+~~~~~~~~~~~~~~~~
 
 Feature "deprecated" marks a command, event, or struct member as
 deprecated.  It is not supported elsewhere so far.
 
 
-=== Naming rules and reserved names ===
+Naming rules and reserved names
+-------------------------------
 
 All names must begin with a letter, and contain only ASCII letters,
 digits, hyphen, and underscore.  There are two exceptions: enum values
 may start with a digit, and names that are downstream extensions (see
 section Downstream extensions) start with underscore.
 
-Names beginning with 'q_' are reserved for the generator, which uses
+Names beginning with 'q\_' are reserved for the generator, which uses
 them for munging QMP names that resemble C keywords or other
 problematic strings.  For example, a member named "default" in qapi
 becomes "q_default" in the generated C code.
@@ -753,7 +783,7 @@ consistency is preferred over blindly avoiding underscore.
 
 Event names should be ALL_CAPS with words separated by underscore.
 
-Member name 'u' and names starting with 'has-' or 'has_' are reserved
+Member name 'u' and names starting with 'has-' or 'has\_' are reserved
 for the generator, which uses them for unions and for tracking
 optional members.
 
@@ -765,7 +795,8 @@ Pragmas 'command-name-exceptions' and 'member-name-exceptions' let you
 violate naming rules.  Use for new code is strongly discouraged.
 
 
-=== Downstream extensions ===
+Downstream extensions
+---------------------
 
 QAPI schema names that are externally visible, say in the Client JSON
 Protocol, need to be managed with care.  Names starting with a
@@ -777,9 +808,11 @@ Example: Red Hat, Inc. controls redhat.com, and may therefore add a
 downstream command __com.redhat_drive-mirror.
 
 
-=== Configuring the schema ===
+Configuring the schema
+----------------------
+
+Syntax::
 
-Syntax:
     COND = STRING
          | [ STRING, ... ]
 
@@ -788,12 +821,12 @@ string or a list of strings.  A string is shorthand for a list
 containing just that string.  The code generated for the definition
 will then be guarded by #if STRING for each STRING in the COND list.
 
-Example: a conditional struct
+Example: a conditional struct ::
 
  { 'struct': 'IfStruct', 'data': { 'foo': 'int' },
    'if': ['defined(CONFIG_FOO)', 'defined(HAVE_BAR)'] }
 
-gets its generated code guarded like this:
+gets its generated code guarded like this::
 
  #if defined(CONFIG_FOO)
  #if defined(HAVE_BAR)
@@ -806,11 +839,11 @@ event-specific data can also be made conditional.  This requires the
 longhand form of MEMBER.
 
 Example: a struct type with unconditional member 'foo' and conditional
-member 'bar'
+member 'bar' ::
 
-{ 'struct': 'IfStruct', 'data':
-  { 'foo': 'int',
-    'bar': { 'type': 'int', 'if': 'defined(IFCOND)'} } }
+ { 'struct': 'IfStruct', 'data':
+   { 'foo': 'int',
+     'bar': { 'type': 'int', 'if': 'defined(IFCOND)'} } }
 
 A union's discriminator may not be conditional.
 
@@ -818,21 +851,21 @@ Likewise, individual enumeration values be conditional.  This requires
 the longhand form of ENUM-VALUE.
 
 Example: an enum type with unconditional value 'foo' and conditional
-value 'bar'
+value 'bar' ::
 
-{ 'enum': 'IfEnum', 'data':
-  [ 'foo',
-    { 'name' : 'bar', 'if': 'defined(IFCOND)' } ] }
+ { 'enum': 'IfEnum', 'data':
+   [ 'foo',
+     { 'name' : 'bar', 'if': 'defined(IFCOND)' } ] }
 
 Likewise, features can be conditional.  This requires the longhand
 form of FEATURE.
 
-Example: a struct with conditional feature 'allow-negative-numbers'
+Example: a struct with conditional feature 'allow-negative-numbers' ::
 
-{ 'struct': 'TestType',
-  'data': { 'number': 'int' },
-  'features': [ { 'name': 'allow-negative-numbers',
-                  'if': 'defined(IFCOND)' } ] }
+ { 'struct': 'TestType',
+   'data': { 'number': 'int' },
+   'features': [ { 'name': 'allow-negative-numbers',
+                   'if': 'defined(IFCOND)' } ] }
 
 Please note that you are responsible to ensure that the C code will
 compile with an arbitrary combination of conditions, since the
@@ -843,12 +876,13 @@ shows a conditional entity only when the condition is satisfied in
 this particular build.
 
 
-=== Documentation comments ===
+Documentation comments
+----------------------
 
 A multi-line comment that starts and ends with a '##' line is a
 documentation comment.
 
-If the documentation comment starts like
+If the documentation comment starts like ::
 
     ##
     # @SYMBOL:
@@ -861,10 +895,12 @@ See below for more on definition documentation.
 Free-form documentation may be used to provide additional text and
 structuring content.
 
-==== Headings and subheadings ====
+
+Headings and subheadings
+~~~~~~~~~~~~~~~~~~~~~~~~
 
 A free-form documentation comment containing a line which starts with
-some '=' symbols and then a space defines a section heading:
+some '=' symbols and then a space defines a section heading::
 
     ##
     # = This is a top level heading
@@ -883,17 +919,19 @@ comment block.
 Section headings must always be correctly nested, so you can only
 define a third-level heading inside a second-level heading, and so on.
 
-==== Documentation markup ====
+
+Documentation markup
+~~~~~~~~~~~~~~~~~~~~
 
 Documentation comments can use most rST markup.  In particular,
-a '::' literal block can be used for examples:
+a '::' literal block can be used for examples::
 
     # ::
     #
     #   Text of the example, may span
     #   multiple lines
 
-'*' starts an itemized list:
+'*' starts an itemized list::
 
     # * First item, may span
     #   multiple lines
@@ -901,7 +939,7 @@ a '::' literal block can be used for examples:
 
 You can also use '-' instead of '*'.
 
-A decimal number followed by '.' starts a numbered list:
+A decimal number followed by '.' starts a numbered list::
 
     # 1. First item, may span
     #    multiple lines
@@ -920,24 +958,25 @@ backslash-escape it.  As an extension beyond the usual rST syntax, you
 can also use '@foo' to reference a name in the schema; this is
 rendered the same way as '``foo``'.
 
-Example:
+Example::
 
-##
-# Some text foo with **bold** and *emphasis*
-# 1. with a list
-# 2. like that
-#
-# And some code:
-#
-# ::
-#
-#   $ echo foo
-#   -> do this
-#   <- get that
-##
+ ##
+ # Some text foo with **bold** and *emphasis*
+ # 1. with a list
+ # 2. like that
+ #
+ # And some code:
+ #
+ # ::
+ #
+ #   $ echo foo
+ #   -> do this
+ #   <- get that
+ ##
 
 
-==== Definition documentation ====
+Definition documentation
+~~~~~~~~~~~~~~~~~~~~~~~~
 
 Definition documentation, if present, must immediately precede the
 definition it documents.
@@ -956,14 +995,14 @@ text can start on the line following the '@argname:', in which case it
 must not be indented at all.  It can also start on the same line as
 the '@argname:'.  In this case if it spans multiple lines then second
 and subsequent lines must be indented to line up with the first
-character of the first line of the description:
+character of the first line of the description::
 
-# @argone:
-# This is a two line description
-# in the first style.
-#
-# @argtwo: This is a two line description
-#          in the second style.
+ # @argone:
+ # This is a two line description
+ # in the first style.
+ #
+ # @argtwo: This is a two line description
+ #          in the second style.
 
 The number of spaces between the ':' and the text is not significant.
 
@@ -997,52 +1036,53 @@ An 'Example' or 'Examples' section is automatically rendered
 entirely as literal fixed-width text.  In other sections,
 the text is formatted, and rST markup can be used.
 
-For example:
+For example::
 
-##
-# @BlockStats:
-#
-# Statistics of a virtual block device or a block backing device.
-#
-# @device: If the stats are for a virtual block device, the name
-#          corresponding to the virtual block device.
-#
-# @node-name: The node name of the device. (since 2.3)
-#
-# ... more members ...
-#
-# Since: 0.14.0
-##
-{ 'struct': 'BlockStats',
-  'data': {'*device': 'str', '*node-name': 'str',
-           ... more members ... } }
+ ##
+ # @BlockStats:
+ #
+ # Statistics of a virtual block device or a block backing device.
+ #
+ # @device: If the stats are for a virtual block device, the name
+ #          corresponding to the virtual block device.
+ #
+ # @node-name: The node name of the device. (since 2.3)
+ #
+ # ... more members ...
+ #
+ # Since: 0.14.0
+ ##
+ { 'struct': 'BlockStats',
+   'data': {'*device': 'str', '*node-name': 'str',
+            ... more members ... } }
 
-##
-# @query-blockstats:
-#
-# Query the @BlockStats for all virtual block devices.
-#
-# @query-nodes: If true, the command will query all the
-#               block nodes ... explain, explain ...  (since 2.3)
-#
-# Returns: A list of @BlockStats for each virtual block devices.
-#
-# Since: 0.14.0
-#
-# Example:
-#
-# -> { "execute": "query-blockstats" }
-# <- {
-#      ... lots of output ...
-#    }
-#
-##
-{ 'command': 'query-blockstats',
-  'data': { '*query-nodes': 'bool' },
-  'returns': ['BlockStats'] }
+ ##
+ # @query-blockstats:
+ #
+ # Query the @BlockStats for all virtual block devices.
+ #
+ # @query-nodes: If true, the command will query all the
+ #               block nodes ... explain, explain ...  (since 2.3)
+ #
+ # Returns: A list of @BlockStats for each virtual block devices.
+ #
+ # Since: 0.14.0
+ #
+ # Example:
+ #
+ # -> { "execute": "query-blockstats" }
+ # <- {
+ #      ... lots of output ...
+ #    }
+ #
+ ##
+ { 'command': 'query-blockstats',
+   'data': { '*query-nodes': 'bool' },
+   'returns': ['BlockStats'] }
 
 
-== Client JSON Protocol introspection ==
+Client JSON Protocol introspection
+==================================
 
 Clients of a Client JSON Protocol commonly need to figure out what
 exactly the server (QEMU) supports.
@@ -1114,13 +1154,13 @@ If the command takes no arguments, "arg-type" names an object type
 without members.  Likewise, if the command returns nothing, "ret-type"
 names an object type without members.
 
-Example: the SchemaInfo for command query-qmp-schema
+Example: the SchemaInfo for command query-qmp-schema ::
 
-    { "name": "query-qmp-schema", "meta-type": "command",
-      "arg-type": "q_empty", "ret-type": "SchemaInfoList" }
+ { "name": "query-qmp-schema", "meta-type": "command",
+   "arg-type": "q_empty", "ret-type": "SchemaInfoList" }
 
-    Type "q_empty" is an automatic object type without members, and type
-    "SchemaInfoList" is the array of SchemaInfo type.
+   Type "q_empty" is an automatic object type without members, and type
+   "SchemaInfoList" is the array of SchemaInfo type.
 
 The SchemaInfo for an event has meta-type "event", and variant member
 "arg-type".  On the wire, a "data" member that the server passes in an
@@ -1133,7 +1173,7 @@ the wire then.
 Each command or event defined with 'data' as MEMBERS object in the
 QAPI schema implicitly defines an object type.
 
-Example: the SchemaInfo for EVENT_C from section Events
+Example: the SchemaInfo for EVENT_C from section Events ::
 
     { "name": "EVENT_C", "meta-type": "event",
       "arg-type": "q_obj-EVENT_C-arg" }
@@ -1157,7 +1197,7 @@ extensions.  The "members" array is in no particular order; clients
 must search the entire object when learning whether a particular
 member is supported.
 
-Example: the SchemaInfo for MyType from section Struct types
+Example: the SchemaInfo for MyType from section Struct types ::
 
     { "name": "MyType", "meta-type": "object",
       "members": [
@@ -1168,7 +1208,7 @@ Example: the SchemaInfo for MyType from section Struct types
 "features" exposes the command's feature strings as a JSON array of
 strings.
 
-Example: the SchemaInfo for TestType from section Features:
+Example: the SchemaInfo for TestType from section Features::
 
     { "name": "TestType", "meta-type": "object",
       "members": [
@@ -1184,7 +1224,7 @@ that provides the variant members for this type tag value).  The
 list cases in the same order as the corresponding "tag" enum type.
 
 Example: the SchemaInfo for flat union BlockdevOptions from section
-Union types
+Union types ::
 
     { "name": "BlockdevOptions", "meta-type": "object",
       "members": [
@@ -1205,7 +1245,7 @@ A simple union implicitly defines an object type for each of its
 variants.
 
 Example: the SchemaInfo for simple union BlockdevOptionsSimple from section
-Union types
+Union types ::
 
     { "name": "BlockdevOptionsSimple", "meta-type": "object",
       "members": [
@@ -1225,7 +1265,7 @@ a JSON object with member "type", which names a type.  Values of the
 alternate type conform to exactly one of its member types.  There is
 no guarantee on the order in which "members" will be listed.
 
-Example: the SchemaInfo for BlockdevRef from section Alternate types
+Example: the SchemaInfo for BlockdevRef from section Alternate types ::
 
     { "name": "BlockdevRef", "meta-type": "alternate",
       "members": [
@@ -1239,7 +1279,7 @@ resemble the element type; however, clients should examine member
 "element-type" instead of making assumptions based on parsing member
 "name".
 
-Example: the SchemaInfo for ['str']
+Example: the SchemaInfo for ['str'] ::
 
     { "name": "[str]", "meta-type": "array",
       "element-type": "str" }
@@ -1249,7 +1289,7 @@ variant member "values".  The values are listed in no particular
 order; clients must search the entire enum when learning whether a
 particular value is supported.
 
-Example: the SchemaInfo for MyEnum from section Enumeration types
+Example: the SchemaInfo for MyEnum from section Enumeration types ::
 
     { "name": "MyEnum", "meta-type": "enum",
       "values": [ "value1", "value2", "value3" ] }
@@ -1259,7 +1299,7 @@ the QAPI schema (see section Built-in Types), with one exception
 detailed below.  It has variant member "json-type" that shows how
 values of this type are encoded on the wire.
 
-Example: the SchemaInfo for str
+Example: the SchemaInfo for str ::
 
     { "name": "str", "meta-type": "builtin", "json-type": "string" }
 
@@ -1273,7 +1313,8 @@ the names of built-in types.  Clients should examine member
 "json-type" instead of hard-coding names of built-in types.
 
 
-== Compatibility considerations ==
+Compatibility considerations
+============================
 
 Maintaining backward compatibility at the Client JSON Protocol level
 while evolving the schema requires some care.  This section is about
@@ -1333,7 +1374,8 @@ may be freely renamed.  Even certain refactorings are invisible, such
 as splitting members from one type into a common base type.
 
 
-== Code generation ==
+Code generation
+===============
 
 The QAPI code generator qapi-gen.py generates code and documentation
 from the schema.  Together with the core QAPI libraries, this code
@@ -1347,7 +1389,7 @@ As an example, we'll use the following schema, which describes a
 single complex user-defined type, along with command which takes a
 list of that type as a parameter, and returns a single element of that
 type.  The user is responsible for writing the implementation of
-qmp_my_command(); everything else is produced by the generator.
+qmp_my_command(); everything else is produced by the generator. ::
 
     $ cat example-schema.json
     { 'struct': 'UserDefOne',
@@ -1359,7 +1401,7 @@ qmp_my_command(); everything else is produced by the generator.
 
     { 'event': 'MY_EVENT' }
 
-We run qapi-gen.py like this:
+We run qapi-gen.py like this::
 
     $ python scripts/qapi-gen.py --output-dir="qapi-generated" \
     --prefix="example-" example-schema.json
@@ -1369,24 +1411,27 @@ tests/qapi-schema/qapi-schema-tests.json that covers more examples of
 what the generator will accept, and compiles the resulting C code as
 part of 'make check-unit'.
 
-=== Code generated for QAPI types ===
+
+Code generated for QAPI types
+-----------------------------
 
 The following files are created:
 
-$(prefix)qapi-types.h - C types corresponding to types defined in
-                        the schema
+ ``$(prefix)qapi-types.h``
+     C types corresponding to types defined in the schema
 
-$(prefix)qapi-types.c - Cleanup functions for the above C types
+ ``$(prefix)qapi-types.c``
+     Cleanup functions for the above C types
 
 The $(prefix) is an optional parameter used as a namespace to keep the
 generated code from one schema/code-generation separated from others so code
 can be generated/used from multiple schemas without clobbering previously
 created code.
 
-Example:
+Example::
 
     $ cat qapi-generated/example-qapi-types.h
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
 
     #ifndef EXAMPLE_QAPI_TYPES_H
     #define EXAMPLE_QAPI_TYPES_H
@@ -1422,7 +1467,7 @@ Example:
 
     #endif /* EXAMPLE_QAPI_TYPES_H */
     $ cat qapi-generated/example-qapi-types.c
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
 
     void qapi_free_UserDefOne(UserDefOne *obj)
     {
@@ -1450,22 +1495,26 @@ Example:
         visit_free(v);
     }
 
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
 
 For a modular QAPI schema (see section Include directives), code for
-each sub-module SUBDIR/SUBMODULE.json is actually generated into
+each sub-module SUBDIR/SUBMODULE.json is actually generated into ::
 
-SUBDIR/$(prefix)qapi-types-SUBMODULE.h
-SUBDIR/$(prefix)qapi-types-SUBMODULE.c
+ SUBDIR/$(prefix)qapi-types-SUBMODULE.h
+ SUBDIR/$(prefix)qapi-types-SUBMODULE.c
 
 If qapi-gen.py is run with option --builtins, additional files are
 created:
 
-qapi-builtin-types.h - C types corresponding to built-in types
+ ``qapi-builtin-types.h``
+     C types corresponding to built-in types
 
-qapi-builtin-types.c - Cleanup functions for the above C types
+ ``qapi-builtin-types.c``
+     Cleanup functions for the above C types
 
-=== Code generated for visiting QAPI types ===
+
+Code generated for visiting QAPI types
+--------------------------------------
 
 These are the visitor functions used to walk through and convert
 between a native QAPI C data structure and some other format (such as
@@ -1474,19 +1523,18 @@ visit_type_FOO_members().
 
 The following files are generated:
 
-$(prefix)qapi-visit.c: Visitor function for a particular C type, used
-                       to automagically convert QObjects into the
-                       corresponding C type and vice-versa, as well
-                       as for deallocating memory for an existing C
-                       type
+ ``$(prefix)qapi-visit.c``
+     Visitor function for a particular C type, used to automagically
+     convert QObjects into the corresponding C type and vice-versa, as
+     well as for deallocating memory for an existing C type
 
-$(prefix)qapi-visit.h: Declarations for previously mentioned visitor
-                       functions
+ ``$(prefix)qapi-visit.h``
+     Declarations for previously mentioned visitor functions
 
-Example:
+Example::
 
     $ cat qapi-generated/example-qapi-visit.h
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
 
     #ifndef EXAMPLE_QAPI_VISIT_H
     #define EXAMPLE_QAPI_VISIT_H
@@ -1507,7 +1555,7 @@ Example:
 
     #endif /* EXAMPLE_QAPI_VISIT_H */
     $ cat qapi-generated/example-qapi-visit.c
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
 
     bool visit_type_UserDefOne_members(Visitor *v, UserDefOne *obj, Error **errp)
     {
@@ -1585,22 +1633,26 @@ Example:
         return true;
     }
 
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
 
 For a modular QAPI schema (see section Include directives), code for
-each sub-module SUBDIR/SUBMODULE.json is actually generated into
+each sub-module SUBDIR/SUBMODULE.json is actually generated into ::
 
-SUBDIR/$(prefix)qapi-visit-SUBMODULE.h
-SUBDIR/$(prefix)qapi-visit-SUBMODULE.c
+ SUBDIR/$(prefix)qapi-visit-SUBMODULE.h
+ SUBDIR/$(prefix)qapi-visit-SUBMODULE.c
 
 If qapi-gen.py is run with option --builtins, additional files are
 created:
 
-qapi-builtin-visit.h - Visitor functions for built-in types
+ ``qapi-builtin-visit.h``
+     Visitor functions for built-in types
 
-qapi-builtin-visit.c - Declarations for these visitor functions
+ ``qapi-builtin-visit.c``
+     Declarations for these visitor functions
 
-=== Code generated for commands ===
+
+Code generated for commands
+---------------------------
 
 These are the marshaling/dispatch functions for the commands defined
 in the schema.  The generated code provides qmp_marshal_COMMAND(), and
@@ -1608,20 +1660,23 @@ declares qmp_COMMAND() that the user must implement.
 
 The following files are generated:
 
-$(prefix)qapi-commands.c: Command marshal/dispatch functions for each
-                          QMP command defined in the schema
+ ``$(prefix)qapi-commands.c``
+     Command marshal/dispatch functions for each QMP command defined in
+     the schema
 
-$(prefix)qapi-commands.h: Function prototypes for the QMP commands
-                          specified in the schema
+ ``$(prefix)qapi-commands.h``
+     Function prototypes for the QMP commands specified in the schema
 
-$(prefix)qapi-init-commands.h - Command initialization prototype
+ ``$(prefix)qapi-init-commands.h``
+     Command initialization prototype
 
-$(prefix)qapi-init-commands.c - Command initialization code
+ ``$(prefix)qapi-init-commands.c``
+     Command initialization code
 
-Example:
+Example::
 
     $ cat qapi-generated/example-qapi-commands.h
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
 
     #ifndef EXAMPLE_QAPI_COMMANDS_H
     #define EXAMPLE_QAPI_COMMANDS_H
@@ -1633,7 +1688,7 @@ Example:
 
     #endif /* EXAMPLE_QAPI_COMMANDS_H */
     $ cat qapi-generated/example-qapi-commands.c
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
 
 
     static void qmp_marshal_output_UserDefOne(UserDefOne *ret_in,
@@ -1688,9 +1743,9 @@ Example:
         visit_free(v);
     }
 
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
     $ cat qapi-generated/example-qapi-init-commands.h
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
     #ifndef EXAMPLE_QAPI_INIT_COMMANDS_H
     #define EXAMPLE_QAPI_INIT_COMMANDS_H
 
@@ -1700,7 +1755,7 @@ Example:
 
     #endif /* EXAMPLE_QAPI_INIT_COMMANDS_H */
     $ cat qapi-generated/example-qapi-init-commands.c
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
     void example_qmp_init_marshal(QmpCommandList *cmds)
     {
         QTAILQ_INIT(cmds);
@@ -1708,34 +1763,39 @@ Example:
         qmp_register_command(cmds, "my-command",
                              qmp_marshal_my_command, QCO_NO_OPTIONS);
     }
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
 
 For a modular QAPI schema (see section Include directives), code for
-each sub-module SUBDIR/SUBMODULE.json is actually generated into
+each sub-module SUBDIR/SUBMODULE.json is actually generated into::
 
-SUBDIR/$(prefix)qapi-commands-SUBMODULE.h
-SUBDIR/$(prefix)qapi-commands-SUBMODULE.c
+ SUBDIR/$(prefix)qapi-commands-SUBMODULE.h
+ SUBDIR/$(prefix)qapi-commands-SUBMODULE.c
 
-=== Code generated for events ===
+
+Code generated for events
+-------------------------
 
 This is the code related to events defined in the schema, providing
 qapi_event_send_EVENT().
 
 The following files are created:
 
-$(prefix)qapi-events.h - Function prototypes for each event type
+ ``$(prefix)qapi-events.h``
+     Function prototypes for each event type
 
-$(prefix)qapi-events.c - Implementation of functions to send an event
+ ``$(prefix)qapi-events.c``
+     Implementation of functions to send an event
 
-$(prefix)qapi-emit-events.h - Enumeration of all event names, and
-                              common event code declarations
+ ``$(prefix)qapi-emit-events.h``
+     Enumeration of all event names, and common event code declarations
 
-$(prefix)qapi-emit-events.c - Common event code definitions
+ ``$(prefix)qapi-emit-events.c``
+     Common event code definitions
 
-Example:
+Example::
 
     $ cat qapi-generated/example-qapi-events.h
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
 
     #ifndef EXAMPLE_QAPI_EVENTS_H
     #define EXAMPLE_QAPI_EVENTS_H
@@ -1747,7 +1807,7 @@ Example:
 
     #endif /* EXAMPLE_QAPI_EVENTS_H */
     $ cat qapi-generated/example-qapi-events.c
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
 
     void qapi_event_send_my_event(void)
     {
@@ -1760,9 +1820,9 @@ Example:
         qobject_unref(qmp);
     }
 
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
     $ cat qapi-generated/example-qapi-emit-events.h
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
 
     #ifndef EXAMPLE_QAPI_EMIT_EVENTS_H
     #define EXAMPLE_QAPI_EMIT_EVENTS_H
@@ -1783,7 +1843,7 @@ Example:
 
     #endif /* EXAMPLE_QAPI_EMIT_EVENTS_H */
     $ cat qapi-generated/example-qapi-emit-events.c
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
 
     const QEnumLookup example_QAPIEvent_lookup = {
         .array = (const char *const[]) {
@@ -1792,27 +1852,30 @@ Example:
         .size = EXAMPLE_QAPI_EVENT__MAX
     };
 
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
 
 For a modular QAPI schema (see section Include directives), code for
-each sub-module SUBDIR/SUBMODULE.json is actually generated into
+each sub-module SUBDIR/SUBMODULE.json is actually generated into ::
 
-SUBDIR/$(prefix)qapi-events-SUBMODULE.h
-SUBDIR/$(prefix)qapi-events-SUBMODULE.c
+ SUBDIR/$(prefix)qapi-events-SUBMODULE.h
+ SUBDIR/$(prefix)qapi-events-SUBMODULE.c
 
-=== Code generated for introspection ===
+
+Code generated for introspection
+--------------------------------
 
 The following files are created:
 
-$(prefix)qapi-introspect.c - Defines a string holding a JSON
-                            description of the schema
+ ``$(prefix)qapi-introspect.c``
+     Defines a string holding a JSON description of the schema
 
-$(prefix)qapi-introspect.h - Declares the above string
+ ``$(prefix)qapi-introspect.h``
+     Declares the above string
 
-Example:
+Example::
 
     $ cat qapi-generated/example-qapi-introspect.h
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
 
     #ifndef EXAMPLE_QAPI_INTROSPECT_H
     #define EXAMPLE_QAPI_INTROSPECT_H
@@ -1823,7 +1886,7 @@ Example:
 
     #endif /* EXAMPLE_QAPI_INTROSPECT_H */
     $ cat qapi-generated/example-qapi-introspect.c
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
 
     const QLitObject example_qmp_schema_qlit = QLIT_QLIST(((QLitObject[]) {
         QLIT_QDICT(((QLitDictEntry[]) {
@@ -1903,4 +1966,4 @@ Example:
         {}
     }));
 
-[Uninteresting stuff omitted...]
+    [Uninteresting stuff omitted...]
-- 
2.31.1


