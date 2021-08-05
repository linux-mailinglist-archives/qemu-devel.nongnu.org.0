Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 205AB3E169D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:13:21 +0200 (CEST)
Received: from localhost ([::1]:41254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBe7c-0000mW-5y
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBe3d-00007m-0j
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:09:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBe3Z-0007tS-EX
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:09:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628172548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WQDRMeL/paORGn0B5jTVyGJFkDl+x5LjlaDwj/3Y3Cs=;
 b=CzIbFkOh7zSsvFUzDh/henCA5IaPQ62iVPlw2ftoy6rZ/zctou4FL5FF10riZGdGC14PS/
 9NOyOsJmYh58bk1d6VjWJJjeUw0+3LdIT0GQhlXu068wTXdpzhcGxKzjPrAtVh7breR2kM
 rdmAWKfOqVmuRz9tAcRa1GDd3hQn1ro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-zbzqajIBP7OHDJTBdbOz3Q-1; Thu, 05 Aug 2021 10:09:05 -0400
X-MC-Unique: zbzqajIBP7OHDJTBdbOz3Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 262BA87D541;
 Thu,  5 Aug 2021 14:09:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8732E5D6A1;
 Thu,  5 Aug 2021 14:09:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2E2D411380A4; Thu,  5 Aug 2021 16:09:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] docs/qapi-code-gen: add cross-references
Date: Thu,  5 Aug 2021 16:09:01 +0200
Message-Id: <20210805140902.2110546-5-armbru@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add clickables to many places.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210720235619.2048797-4-jsnow@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/qapi-code-gen.rst | 107 +++++++++++++++++++----------------
 1 file changed, 58 insertions(+), 49 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index 07b11e2a40..26c62b0e7b 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -156,6 +156,7 @@ from making a forward reference to a type that is only introduced by
 an outer file.  The parser may be made stricter in the future to
 prevent incomplete include files.
 
+.. _pragma:
 
 Pragma directives
 -----------------
@@ -186,6 +187,7 @@ Pragma 'member-name-exceptions' takes a list of types whose member
 names may contain uppercase letters, and ``"_"`` instead of ``"-"``.
 Default is none.
 
+.. _ENUM-VALUE:
 
 Enumeration types
 -----------------
@@ -228,13 +230,15 @@ additional enumeration constant PREFIX__MAX with value N.
 Do not use string or an integer type when an enumeration type can do
 the job satisfactorily.
 
-The optional 'if' member specifies a conditional.  See "Configuring
-the schema" below for more on this.
+The optional 'if' member specifies a conditional.  See `Configuring the
+schema`_ below for more on this.
 
-The optional 'features' member specifies features.  See "Features"
+The optional 'features' member specifies features.  See Features_
 below for more on this.
 
 
+.. _TYPE-REF:
+
 Type references and array types
 -------------------------------
 
@@ -269,11 +273,13 @@ Member 'struct' names the struct type.
 
 Each MEMBER of the 'data' object defines a member of the struct type.
 
+.. _MEMBERS:
+
 The MEMBER's STRING name consists of an optional ``*`` prefix and the
 struct member name.  If ``*`` is present, the member is optional.
 
 The MEMBER's value defines its properties, in particular its type.
-The form TYPE-REF is shorthand for :code:`{ 'type': TYPE-REF }`.
+The form TYPE-REF_ is shorthand for :code:`{ 'type': TYPE-REF }`.
 
 Example::
 
@@ -300,10 +306,10 @@ both members like this::
  { "file": "/some/place/my-image",
    "backing": "/some/place/my-backing-file" }
 
-The optional 'if' member specifies a conditional.  See "Configuring
-the schema" below for more on this.
+The optional 'if' member specifies a conditional.  See `Configuring
+the schema`_ below for more on this.
 
-The optional 'features' member specifies features.  See "Features"
+The optional 'features' member specifies features.  See Features_
 below for more on this.
 
 
@@ -337,7 +343,7 @@ union must have at least one branch.
 The BRANCH's STRING name is the branch name.
 
 The BRANCH's value defines the branch's properties, in particular its
-type.  The form TYPE-REF is shorthand for :code:`{ 'type': TYPE-REF }`.
+type.  The form TYPE-REF_ is shorthand for :code:`{ 'type': TYPE-REF }`.
 
 A simple union type defines a mapping from automatic discriminator
 values to data types like in this example::
@@ -368,12 +374,12 @@ Flat unions permit arbitrary common members that occur in all variants
 of the union, not just a discriminator.  Their discriminators need not
 be named 'type'.  They also avoid nesting on the wire.
 
-The 'base' member defines the common members.  If it is a MEMBERS
+The 'base' member defines the common members.  If it is a MEMBERS_
 object, it defines common members just like a struct type's 'data'
 member defines struct type members.  If it is a STRING, it names a
 struct type whose members are the common members.
 
-All flat union branches must be of struct type.
+All flat union branches must be `Struct types`_.
 
 In the Client JSON Protocol, a flat union is represented by an object
 with the common members (from the base type) and the selected branch's
@@ -425,10 +431,10 @@ is identical on the wire to::
  { 'union': 'Flat', 'base': { 'type': 'Enum' }, 'discriminator': 'type',
    'data': { 'one': 'Branch1', 'two': 'Branch2' } }
 
-The optional 'if' member specifies a conditional.  See "Configuring
-the schema" below for more on this.
+The optional 'if' member specifies a conditional.  See `Configuring
+the schema`_ below for more on this.
 
-The optional 'features' member specifies features.  See "Features"
+The optional 'features' member specifies features.  See Features_
 below for more on this.
 
 
@@ -481,10 +487,10 @@ following example objects::
              "read-only": false,
              "filename": "/tmp/mydisk.qcow2" } }
 
-The optional 'if' member specifies a conditional.  See "Configuring
-the schema" below for more on this.
+The optional 'if' member specifies a conditional.  See `Configuring
+the schema`_ below for more on this.
 
-The optional 'features' member specifies features.  See "Features"
+The optional 'features' member specifies features.  See Features_
 below for more on this.
 
 
@@ -511,10 +517,10 @@ Syntax::
 
 Member 'command' names the command.
 
-Member 'data' defines the arguments.  It defaults to an empty MEMBERS
+Member 'data' defines the arguments.  It defaults to an empty MEMBERS_
 object.
 
-If 'data' is a MEMBERS object, then MEMBERS defines arguments just
+If 'data' is a MEMBERS_ object, then MEMBERS defines arguments just
 like a struct type's 'data' defines struct type members.
 
 If 'data' is a STRING, then STRING names a complex type whose members
@@ -553,7 +559,7 @@ which would validate this Client JSON Protocol transaction::
 
 The generator emits a prototype for the C function implementing the
 command.  The function itself needs to be written by hand.  See
-section "Code generated for commands" for examples.
+section `Code generated for commands`_ for examples.
 
 The function returns the return type.  When member 'boxed' is absent,
 it takes the command arguments as arguments one by one, in QAPI schema
@@ -660,10 +666,10 @@ for a command.  We don't currently have a use case for both together and
 without a use case, it's not entirely clear what the semantics should
 be.
 
-The optional 'if' member specifies a conditional.  See "Configuring
-the schema" below for more on this.
+The optional 'if' member specifies a conditional.  See `Configuring
+the schema`_ below for more on this.
 
-The optional 'features' member specifies features.  See "Features"
+The optional 'features' member specifies features.  See Features_
 below for more on this.
 
 
@@ -708,15 +714,17 @@ Resulting in this JSON object::
 The generator emits a function to send the event.  When member 'boxed'
 is absent, it takes event-specific data one by one, in QAPI schema
 order.  Else it takes them wrapped in the C struct generated for the
-complex type.  See section "Code generated for events" for examples.
+complex type.  See section `Code generated for events`_ for examples.
 
-The optional 'if' member specifies a conditional.  See "Configuring
-the schema" below for more on this.
+The optional 'if' member specifies a conditional.  See `Configuring
+the schema`_ below for more on this.
 
-The optional 'features' member specifies features.  See "Features"
+The optional 'features' member specifies features.  See Features_
 below for more on this.
 
 
+.. _FEATURE:
+
 Features
 --------
 
@@ -735,8 +743,8 @@ For this purpose, a list of features can be specified for a command or
 struct type.  Each list member can either be ``{ 'name': STRING, '*if':
 COND }``, or STRING, which is shorthand for ``{ 'name': STRING }``.
 
-The optional 'if' member specifies a conditional.  See "Configuring
-the schema" below for more on this.
+The optional 'if' member specifies a conditional.  See `Configuring
+the schema`_ below for more on this.
 
 Example::
 
@@ -745,7 +753,7 @@ Example::
    'features': [ 'allow-negative-numbers' ] }
 
 The feature strings are exposed to clients in introspection, as
-explained in section "Client JSON Protocol introspection".
+explained in section `Client JSON Protocol introspection`_.
 
 Intended use is to have each feature string signal that this build of
 QEMU shows a certain behaviour.
@@ -764,7 +772,7 @@ Naming rules and reserved names
 All names must begin with a letter, and contain only ASCII letters,
 digits, hyphen, and underscore.  There are two exceptions: enum values
 may start with a digit, and names that are downstream extensions (see
-section Downstream extensions) start with underscore.
+section `Downstream extensions`_) start with underscore.
 
 Names beginning with ``q_`` are reserved for the generator, which uses
 them for munging QMP names that resemble C keywords or other
@@ -794,8 +802,9 @@ Any name (command, event, type, member, or enum value) beginning with
 ``x-`` is marked experimental, and may be withdrawn or changed
 incompatibly in a future release.
 
-Pragmas ``command-name-exceptions`` and ``member-name-exceptions`` let you
-violate naming rules.  Use for new code is strongly discouraged.
+Pragmas ``command-name-exceptions`` and ``member-name-exceptions`` let
+you violate naming rules.  Use for new code is strongly discouraged. See
+`Pragma directives`_ for details.
 
 
 Downstream extensions
@@ -851,7 +860,7 @@ member 'bar' ::
 A union's discriminator may not be conditional.
 
 Likewise, individual enumeration values be conditional.  This requires
-the longhand form of ENUM-VALUE.
+the longhand form of ENUM-VALUE_.
 
 Example: an enum type with unconditional value 'foo' and conditional
 value 'bar' ::
@@ -861,7 +870,7 @@ value 'bar' ::
      { 'name' : 'bar', 'if': 'defined(IFCOND)' } ] }
 
 Likewise, features can be conditional.  This requires the longhand
-form of FEATURE.
+form of FEATURE_.
 
 Example: a struct with conditional feature 'allow-negative-numbers' ::
 
@@ -893,7 +902,7 @@ If the documentation comment starts like ::
 it documents the definition of SYMBOL, else it's free-form
 documentation.
 
-See below for more on definition documentation.
+See below for more on `Definition documentation`_.
 
 Free-form documentation may be used to provide additional text and
 structuring content.
@@ -984,7 +993,7 @@ Definition documentation
 Definition documentation, if present, must immediately precede the
 definition it documents.
 
-When documentation is required (see pragma 'doc-required'), every
+When documentation is required (see pragma_ 'doc-required'), every
 definition must have documentation.
 
 Definition documentation starts with a line naming the definition,
@@ -1181,7 +1190,7 @@ the wire then.
 Each command or event defined with 'data' as MEMBERS object in the
 QAPI schema implicitly defines an object type.
 
-Example: the SchemaInfo for EVENT_C from section Events ::
+Example: the SchemaInfo for EVENT_C from section Events_ ::
 
     { "name": "EVENT_C", "meta-type": "event",
       "arg-type": "q_obj-EVENT_C-arg" }
@@ -1205,7 +1214,7 @@ extensions.  The "members" array is in no particular order; clients
 must search the entire object when learning whether a particular
 member is supported.
 
-Example: the SchemaInfo for MyType from section Struct types ::
+Example: the SchemaInfo for MyType from section `Struct types`_ ::
 
     { "name": "MyType", "meta-type": "object",
       "members": [
@@ -1216,7 +1225,7 @@ Example: the SchemaInfo for MyType from section Struct types ::
 "features" exposes the command's feature strings as a JSON array of
 strings.
 
-Example: the SchemaInfo for TestType from section Features::
+Example: the SchemaInfo for TestType from section Features_::
 
     { "name": "TestType", "meta-type": "object",
       "members": [
@@ -1232,7 +1241,7 @@ that provides the variant members for this type tag value).  The
 list cases in the same order as the corresponding "tag" enum type.
 
 Example: the SchemaInfo for flat union BlockdevOptions from section
-Union types ::
+`Union types`_ ::
 
     { "name": "BlockdevOptions", "meta-type": "object",
       "members": [
@@ -1247,13 +1256,13 @@ Note that base types are "flattened": its members are included in the
 "members" array.
 
 A simple union implicitly defines an enumeration type for its implicit
-discriminator (called "type" on the wire, see section Union types).
+discriminator (called "type" on the wire, see section `Union types`_).
 
 A simple union implicitly defines an object type for each of its
 variants.
 
 Example: the SchemaInfo for simple union BlockdevOptionsSimple from section
-Union types ::
+`Union types`_ ::
 
     { "name": "BlockdevOptionsSimple", "meta-type": "object",
       "members": [
@@ -1273,7 +1282,7 @@ a JSON object with member "type", which names a type.  Values of the
 alternate type conform to exactly one of its member types.  There is
 no guarantee on the order in which "members" will be listed.
 
-Example: the SchemaInfo for BlockdevRef from section Alternate types ::
+Example: the SchemaInfo for BlockdevRef from section `Alternate types`_ ::
 
     { "name": "BlockdevRef", "meta-type": "alternate",
       "members": [
@@ -1297,13 +1306,13 @@ variant member "values".  The values are listed in no particular
 order; clients must search the entire enum when learning whether a
 particular value is supported.
 
-Example: the SchemaInfo for MyEnum from section Enumeration types ::
+Example: the SchemaInfo for MyEnum from section `Enumeration types`_ ::
 
     { "name": "MyEnum", "meta-type": "enum",
       "values": [ "value1", "value2", "value3" ] }
 
 The SchemaInfo for a built-in type has the same name as the type in
-the QAPI schema (see section Built-in Types), with one exception
+the QAPI schema (see section `Built-in Types`_), with one exception
 detailed below.  It has variant member "json-type" that shows how
 values of this type are encoded on the wire.
 
@@ -1505,7 +1514,7 @@ Example::
 
     [Uninteresting stuff omitted...]
 
-For a modular QAPI schema (see section Include directives), code for
+For a modular QAPI schema (see section `Include directives`_), code for
 each sub-module SUBDIR/SUBMODULE.json is actually generated into ::
 
  SUBDIR/$(prefix)qapi-types-SUBMODULE.h
@@ -1643,7 +1652,7 @@ Example::
 
     [Uninteresting stuff omitted...]
 
-For a modular QAPI schema (see section Include directives), code for
+For a modular QAPI schema (see section `Include directives`_), code for
 each sub-module SUBDIR/SUBMODULE.json is actually generated into ::
 
  SUBDIR/$(prefix)qapi-visit-SUBMODULE.h
@@ -1773,7 +1782,7 @@ Example::
     }
     [Uninteresting stuff omitted...]
 
-For a modular QAPI schema (see section Include directives), code for
+For a modular QAPI schema (see section `Include directives`_), code for
 each sub-module SUBDIR/SUBMODULE.json is actually generated into::
 
  SUBDIR/$(prefix)qapi-commands-SUBMODULE.h
@@ -1862,7 +1871,7 @@ Example::
 
     [Uninteresting stuff omitted...]
 
-For a modular QAPI schema (see section Include directives), code for
+For a modular QAPI schema (see section `Include directives`_), code for
 each sub-module SUBDIR/SUBMODULE.json is actually generated into ::
 
  SUBDIR/$(prefix)qapi-events-SUBMODULE.h
-- 
2.31.1


