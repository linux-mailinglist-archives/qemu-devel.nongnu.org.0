Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFA13E16CD
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:19:32 +0200 (CEST)
Received: from localhost ([::1]:33608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBeDb-0006HK-Nx
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBe3d-00008T-0m
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:09:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBe3Z-0007rk-8i
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:09:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628172547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cOmMhpp3p4llkC5OfSZh/ocgsH4YD4+szlbrswEhgg4=;
 b=Z+HzX3PpKmDMzQWpLkjlDg5cYiWEtvr7n4WF81OdBxYbig/K0zsikzb8JxG1Xx9hCkT1hG
 Wa489IPboD/hYV5m0H4wOkFzzjjpJme8MDmOPtjXhMmIrH77qmTCcKGJN3PM+pPtZTAWaF
 tlTAoblU8IfhRxQ94oBqTDv+wqLSS8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-G3TxkWxeOR25Ul3PSfsrQA-1; Thu, 05 Aug 2021 10:09:05 -0400
X-MC-Unique: G3TxkWxeOR25Ul3PSfsrQA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BD40107466A;
 Thu,  5 Aug 2021 14:09:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 870731000186;
 Thu,  5 Aug 2021 14:09:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 28BB711380A3; Thu,  5 Aug 2021 16:09:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] docs/qapi-code-gen: Beautify formatting
Date: Thu,  5 Aug 2021 16:09:00 +0200
Message-Id: <20210805140902.2110546-4-armbru@redhat.com>
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

Mostly, add ``literal`` markers to a lot of things like C types, add
code blocks, and fix the way a few things render.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210720235619.2048797-3-jsnow@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/qapi-code-gen.rst | 172 ++++++++++++++++++-----------------
 1 file changed, 90 insertions(+), 82 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index 9155dba262..07b11e2a40 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -40,7 +40,7 @@ by any commands or events, for the side effect of generated C code
 used internally.
 
 There are several kinds of types: simple types (a number of built-in
-types, such as 'int' and 'str'; as well as enumerations), arrays,
+types, such as ``int`` and ``str``; as well as enumerations), arrays,
 complex types (structs and two flavors of unions), and alternate types
 (a choice between other types).
 
@@ -51,37 +51,37 @@ Schema syntax
 Syntax is loosely based on `JSON <http://www.ietf.org/rfc/rfc8259.txt>`_.
 Differences:
 
-* Comments: start with a hash character (#) that is not part of a
+* Comments: start with a hash character (``#``) that is not part of a
   string, and extend to the end of the line.
 
-* Strings are enclosed in 'single quotes', not "double quotes".
+* Strings are enclosed in ``'single quotes'``, not ``"double quotes"``.
 
 * Strings are restricted to printable ASCII, and escape sequences to
-  just '\\'.
+  just ``\\``.
 
-* Numbers and null are not supported.
+* Numbers and ``null`` are not supported.
 
 A second layer of syntax defines the sequences of JSON texts that are
 a correctly structured QAPI schema.  We provide a grammar for this
 syntax in an EBNF-like notation:
 
-* Production rules look like non-terminal = expression
-* Concatenation: expression A B matches expression A, then B
-* Alternation: expression A | B matches expression A or B
-* Repetition: expression A... matches zero or more occurrences of
-  expression A
-* Repetition: expression A, ... matches zero or more occurrences of
-  expression A separated by ,
-* Grouping: expression ( A ) matches expression A
-* JSON's structural characters are terminals: { } [ ] : ,
-* JSON's literal names are terminals: false true
-* String literals enclosed in 'single quotes' are terminal, and match
-  this JSON string, with a leading '*' stripped off
-* When JSON object member's name starts with '*', the member is
+* Production rules look like ``non-terminal = expression``
+* Concatenation: expression ``A B`` matches expression ``A``, then ``B``
+* Alternation: expression ``A | B`` matches expression ``A`` or ``B``
+* Repetition: expression ``A...`` matches zero or more occurrences of
+  expression ``A``
+* Repetition: expression ``A, ...`` matches zero or more occurrences of
+  expression ``A`` separated by ``,``
+* Grouping: expression ``( A )`` matches expression ``A``
+* JSON's structural characters are terminals: ``{ } [ ] : ,``
+* JSON's literal names are terminals: ``false true``
+* String literals enclosed in ``'single quotes'`` are terminal, and match
+  this JSON string, with a leading ``*`` stripped off
+* When JSON object member's name starts with ``*``, the member is
   optional.
-* The symbol STRING is a terminal, and matches any JSON string
-* The symbol BOOL is a terminal, and matches JSON false or true
-* ALL-CAPS words other than STRING are non-terminals
+* The symbol ``STRING`` is a terminal, and matches any JSON string
+* The symbol ``BOOL`` is a terminal, and matches JSON ``false`` or ``true``
+* ALL-CAPS words other than ``STRING`` are non-terminals
 
 The order of members within JSON objects does not matter unless
 explicitly noted.
@@ -109,27 +109,30 @@ These are discussed in detail below.
 Built-in Types
 --------------
 
-The following types are predefined, and map to C as follows::
+The following types are predefined, and map to C as follows:
 
-  Schema    C          JSON
-  str       char *     any JSON string, UTF-8
-  number    double     any JSON number
-  int       int64_t    a JSON number without fractional part
-                       that fits into the C integer type
-  int8      int8_t     likewise
-  int16     int16_t    likewise
-  int32     int32_t    likewise
-  int64     int64_t    likewise
-  uint8     uint8_t    likewise
-  uint16    uint16_t   likewise
-  uint32    uint32_t   likewise
-  uint64    uint64_t   likewise
-  size      uint64_t   like uint64_t, except StringInputVisitor
-                       accepts size suffixes
-  bool      bool       JSON true or false
-  null      QNull *    JSON null
-  any       QObject *  any JSON value
-  QType     QType      JSON string matching enum QType values
+  ============= ============== ============================================
+  Schema        C              JSON
+  ============= ============== ============================================
+  ``str``       ``char *``     any JSON string, UTF-8
+  ``number``    ``double``     any JSON number
+  ``int``       ``int64_t``    a JSON number without fractional part
+                               that fits into the C integer type
+  ``int8``      ``int8_t``     likewise
+  ``int16``     ``int16_t``    likewise
+  ``int32``     ``int32_t``    likewise
+  ``int64``     ``int64_t``    likewise
+  ``uint8``     ``uint8_t``    likewise
+  ``uint16``    ``uint16_t``   likewise
+  ``uint32``    ``uint32_t``   likewise
+  ``uint64``    ``uint64_t``   likewise
+  ``size``      ``uint64_t``   like ``uint64_t``, except
+                               ``StringInputVisitor`` accepts size suffixes
+  ``bool``      ``bool``       JSON ``true`` or ``false``
+  ``null``      ``QNull *``    JSON ``null``
+  ``any``       ``QObject *``  any JSON value
+  ``QType``     ``QType``      JSON string matching enum ``QType`` values
+  ============= ============== ============================================
 
 
 Include directives
@@ -174,14 +177,14 @@ Pragma 'doc-required' takes a boolean value.  If true, documentation
 is required.  Default is false.
 
 Pragma 'command-name-exceptions' takes a list of commands whose names
-may contain '_' instead of '-'.  Default is none.
+may contain ``"_"`` instead of ``"-"``.  Default is none.
 
 Pragma 'command-returns-exceptions' takes a list of commands that may
 violate the rules on permitted return types.  Default is none.
 
 Pragma 'member-name-exceptions' takes a list of types whose member
-names may contain uppercase letters, and '_' instead of '-'.  Default
-is none.
+names may contain uppercase letters, and ``"_"`` instead of ``"-"``.
+Default is none.
 
 
 Enumeration types
@@ -200,7 +203,7 @@ Syntax::
 Member 'enum' names the enum type.
 
 Each member of the 'data' array defines a value of the enumeration
-type.  The form STRING is shorthand for { 'name': STRING }.  The
+type.  The form STRING is shorthand for :code:`{ 'name': STRING }`.  The
 'name' values must be be distinct.
 
 Example::
@@ -243,7 +246,7 @@ Syntax::
 A string denotes the type named by the string.
 
 A one-element array containing a string denotes an array of the type
-named by the string.  Example: ['int'] denotes an array of 'int'.
+named by the string.  Example: ``['int']`` denotes an array of ``int``.
 
 
 Struct types
@@ -266,11 +269,11 @@ Member 'struct' names the struct type.
 
 Each MEMBER of the 'data' object defines a member of the struct type.
 
-The MEMBER's STRING name consists of an optional '*' prefix and the
-struct member name.  If '*' is present, the member is optional.
+The MEMBER's STRING name consists of an optional ``*`` prefix and the
+struct member name.  If ``*`` is present, the member is optional.
 
 The MEMBER's value defines its properties, in particular its type.
-The form TYPE-REF is shorthand for { 'type': TYPE-REF }.
+The form TYPE-REF is shorthand for :code:`{ 'type': TYPE-REF }`.
 
 Example::
 
@@ -334,7 +337,7 @@ union must have at least one branch.
 The BRANCH's STRING name is the branch name.
 
 The BRANCH's value defines the branch's properties, in particular its
-type.  The form TYPE-REF is shorthand for { 'type': TYPE-REF }.
+type.  The form TYPE-REF is shorthand for :code:`{ 'type': TYPE-REF }`.
 
 A simple union type defines a mapping from automatic discriminator
 values to data types like in this example::
@@ -381,7 +384,7 @@ struct.
 The following example enhances the above simple union example by
 adding an optional common member 'read-only', renaming the
 discriminator to something more applicable than the simple union's
-default of 'type', and reducing the number of {} required on the wire::
+default of 'type', and reducing the number of ``{}`` required on the wire::
 
  { 'enum': 'BlockdevDriver', 'data': [ 'file', 'qcow2' ] }
  { 'union': 'BlockdevOptions',
@@ -450,7 +453,7 @@ alternate.  An alternate must have at least one branch.
 The ALTERNATIVE's STRING name is the branch name.
 
 The ALTERNATIVE's value defines the branch's properties, in particular
-its type.  The form STRING is shorthand for { 'type': STRING }.
+its type.  The form STRING is shorthand for :code:`{ 'type': STRING }`.
 
 Example::
 
@@ -515,7 +518,7 @@ If 'data' is a MEMBERS object, then MEMBERS defines arguments just
 like a struct type's 'data' defines struct type members.
 
 If 'data' is a STRING, then STRING names a complex type whose members
-are the arguments.  A union type requires 'boxed': true.
+are the arguments.  A union type requires ``'boxed': true``.
 
 Member 'returns' defines the command's return type.  It defaults to an
 empty struct type.  It must normally be a complex type or an array of
@@ -555,7 +558,7 @@ section "Code generated for commands" for examples.
 The function returns the return type.  When member 'boxed' is absent,
 it takes the command arguments as arguments one by one, in QAPI schema
 order.  Else it takes them wrapped in the C struct generated for the
-complex argument type.  It takes an additional Error ** argument in
+complex argument type.  It takes an additional ``Error **`` argument in
 either case.
 
 The generator also emits a marshalling function that extracts
@@ -638,11 +641,11 @@ blocking the guest and other background operations.
 Coroutine safety can be hard to prove, similar to thread safety.  Common
 pitfalls are:
 
-- The global mutex isn't held across qemu_coroutine_yield(), so
+- The global mutex isn't held across ``qemu_coroutine_yield()``, so
   operations that used to assume that they execute atomically may have
   to be more careful to protect against changes in the global state.
 
-- Nested event loops (AIO_WAIT_WHILE() etc.) are problematic in
+- Nested event loops (``AIO_WAIT_WHILE()`` etc.) are problematic in
   coroutine context and can easily lead to deadlocks.  They should be
   replaced by yielding and reentering the coroutine when the condition
   becomes false.
@@ -650,9 +653,9 @@ pitfalls are:
 Since the command handler may assume coroutine context, any callers
 other than the QMP dispatcher must also call it in coroutine context.
 In particular, HMP commands calling such a QMP command handler must be
-marked .coroutine = true in hmp-commands.hx.
+marked ``.coroutine = true`` in hmp-commands.hx.
 
-It is an error to specify both 'coroutine': true and 'allow-oob': true
+It is an error to specify both ``'coroutine': true`` and ``'allow-oob': true``
 for a command.  We don't currently have a use case for both together and
 without a use case, it's not entirely clear what the semantics should
 be.
@@ -689,7 +692,7 @@ If 'data' is a MEMBERS object, then MEMBERS defines event-specific
 data just like a struct type's 'data' defines struct type members.
 
 If 'data' is a STRING, then STRING names a complex type whose members
-are the event-specific data.  A union type requires 'boxed': true.
+are the event-specific data.  A union type requires ``'boxed': true``.
 
 An example event is::
 
@@ -763,16 +766,16 @@ digits, hyphen, and underscore.  There are two exceptions: enum values
 may start with a digit, and names that are downstream extensions (see
 section Downstream extensions) start with underscore.
 
-Names beginning with 'q\_' are reserved for the generator, which uses
+Names beginning with ``q_`` are reserved for the generator, which uses
 them for munging QMP names that resemble C keywords or other
-problematic strings.  For example, a member named "default" in qapi
-becomes "q_default" in the generated C code.
+problematic strings.  For example, a member named ``default`` in qapi
+becomes ``q_default`` in the generated C code.
 
 Types, commands, and events share a common namespace.  Therefore,
 generally speaking, type definitions should always use CamelCase for
 user-defined type names, while built-in types are lowercase.
 
-Type names ending with 'Kind' or 'List' are reserved for the
+Type names ending with ``Kind`` or ``List`` are reserved for the
 generator, which uses them for implicit union enums and array types,
 respectively.
 
@@ -783,15 +786,15 @@ consistency is preferred over blindly avoiding underscore.
 
 Event names should be ALL_CAPS with words separated by underscore.
 
-Member name 'u' and names starting with 'has-' or 'has\_' are reserved
+Member name ``u`` and names starting with ``has-`` or ``has_`` are reserved
 for the generator, which uses them for unions and for tracking
 optional members.
 
 Any name (command, event, type, member, or enum value) beginning with
-"x-" is marked experimental, and may be withdrawn or changed
+``x-`` is marked experimental, and may be withdrawn or changed
 incompatibly in a future release.
 
-Pragmas 'command-name-exceptions' and 'member-name-exceptions' let you
+Pragmas ``command-name-exceptions`` and ``member-name-exceptions`` let you
 violate naming rules.  Use for new code is strongly discouraged.
 
 
@@ -805,7 +808,7 @@ who controls the valid, reverse fully qualified domain name RFQDN.
 RFQDN may only contain ASCII letters, digits, hyphen and period.
 
 Example: Red Hat, Inc. controls redhat.com, and may therefore add a
-downstream command __com.redhat_drive-mirror.
+downstream command ``__com.redhat_drive-mirror``.
 
 
 Configuring the schema
@@ -879,7 +882,7 @@ this particular build.
 Documentation comments
 ----------------------
 
-A multi-line comment that starts and ends with a '##' line is a
+A multi-line comment that starts and ends with a ``##`` line is a
 documentation comment.
 
 If the documentation comment starts like ::
@@ -887,7 +890,7 @@ If the documentation comment starts like ::
     ##
     # @SYMBOL:
 
-it documents the definition if SYMBOL, else it's free-form
+it documents the definition of SYMBOL, else it's free-form
 documentation.
 
 See below for more on definition documentation.
@@ -900,7 +903,7 @@ Headings and subheadings
 ~~~~~~~~~~~~~~~~~~~~~~~~
 
 A free-form documentation comment containing a line which starts with
-some '=' symbols and then a space defines a section heading::
+some ``=`` symbols and then a space defines a section heading::
 
     ##
     # = This is a top level heading
@@ -924,22 +927,22 @@ Documentation markup
 ~~~~~~~~~~~~~~~~~~~~
 
 Documentation comments can use most rST markup.  In particular,
-a '::' literal block can be used for examples::
+a ``::`` literal block can be used for examples::
 
     # ::
     #
     #   Text of the example, may span
     #   multiple lines
 
-'*' starts an itemized list::
+``*`` starts an itemized list::
 
     # * First item, may span
     #   multiple lines
     # * Second item
 
-You can also use '-' instead of '*'.
+You can also use ``-`` instead of ``*``.
 
-A decimal number followed by '.' starts a numbered list::
+A decimal number followed by ``.`` starts a numbered list::
 
     # 1. First item, may span
     #    multiple lines
@@ -952,11 +955,11 @@ If a list item's text spans multiple lines, then the second and
 subsequent lines must be correctly indented to line up with the
 first character of the first line.
 
-The usual '**strong**', '*emphasised*' and '``literal``' markup should
-be used.  If you need a single literal '*' you will need to
+The usual ****strong****, *\*emphasized\** and ````literal```` markup
+should be used.  If you need a single literal ``*``, you will need to
 backslash-escape it.  As an extension beyond the usual rST syntax, you
-can also use '@foo' to reference a name in the schema; this is
-rendered the same way as '``foo``'.
+can also use ``@foo`` to reference a name in the schema; this is rendered
+the same way as ````foo````.
 
 Example::
 
@@ -991,9 +994,9 @@ alternates), or value (for enums), and finally optional tagged
 sections.
 
 Descriptions of arguments can span multiple lines.  The description
-text can start on the line following the '@argname:', in which case it
+text can start on the line following the '\@argname:', in which case it
 must not be indented at all.  It can also start on the same line as
-the '@argname:'.  In this case if it spans multiple lines then second
+the '\@argname:'.  In this case if it spans multiple lines then second
 and subsequent lines must be indented to line up with the first
 character of the first line of the description::
 
@@ -1006,8 +1009,13 @@ character of the first line of the description::
 
 The number of spaces between the ':' and the text is not significant.
 
-FIXME: the parser accepts these things in almost any order.
-FIXME: union branches should be described, too.
+.. admonition:: FIXME
+
+   The parser accepts these things in almost any order.
+
+.. admonition:: FIXME
+
+   union branches should be described, too.
 
 Extensions added after the definition was first released carry a
 '(since x.y.z)' comment.
-- 
2.31.1


