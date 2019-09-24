Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0210BC8C4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 15:20:38 +0200 (CEST)
Received: from localhost ([::1]:45552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCkk9-000646-7u
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 09:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50587)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iCk0p-0001LK-Ac
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:33:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iCk0j-0006xt-Mg
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:33:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53428)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iCk0i-0006ug-QF
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:33:41 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A4D01877A64
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 12:33:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E7EB5B6A5;
 Tue, 24 Sep 2019 12:33:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D5B111136423; Tue, 24 Sep 2019 14:33:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/37] tests/qapi-schema: Demonstrate insufficient 'if' checking
Date: Tue, 24 Sep 2019 14:33:20 +0200
Message-Id: <20190924123334.30645-24-armbru@redhat.com>
In-Reply-To: <20190924123334.30645-1-armbru@redhat.com>
References: <20190924123334.30645-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Tue, 24 Sep 2019 12:33:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cover invalid 'if' in struct members, features, union and alternate
branches.  Four out of four are broken.  Mark FIXME.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20190914153506.2151-6-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[Comment typo fixed]
---
 tests/Makefile.include                        |  4 ++++
 .../alternate-branch-if-invalid.err           |  0
 .../alternate-branch-if-invalid.exit          |  1 +
 .../alternate-branch-if-invalid.json          |  4 ++++
 .../alternate-branch-if-invalid.out           | 16 +++++++++++++
 tests/qapi-schema/features-if-invalid.err     |  0
 tests/qapi-schema/features-if-invalid.exit    |  1 +
 tests/qapi-schema/features-if-invalid.json    |  5 ++++
 tests/qapi-schema/features-if-invalid.out     | 14 +++++++++++
 .../qapi-schema/struct-member-if-invalid.err  |  0
 .../qapi-schema/struct-member-if-invalid.exit |  1 +
 .../qapi-schema/struct-member-if-invalid.json |  4 ++++
 .../qapi-schema/struct-member-if-invalid.out  | 15 ++++++++++++
 tests/qapi-schema/union-branch-if-invalid.err |  0
 .../qapi-schema/union-branch-if-invalid.exit  |  1 +
 .../qapi-schema/union-branch-if-invalid.json  |  7 ++++++
 tests/qapi-schema/union-branch-if-invalid.out | 23 +++++++++++++++++++
 17 files changed, 96 insertions(+)
 create mode 100644 tests/qapi-schema/alternate-branch-if-invalid.err
 create mode 100644 tests/qapi-schema/alternate-branch-if-invalid.exit
 create mode 100644 tests/qapi-schema/alternate-branch-if-invalid.json
 create mode 100644 tests/qapi-schema/alternate-branch-if-invalid.out
 create mode 100644 tests/qapi-schema/features-if-invalid.err
 create mode 100644 tests/qapi-schema/features-if-invalid.exit
 create mode 100644 tests/qapi-schema/features-if-invalid.json
 create mode 100644 tests/qapi-schema/features-if-invalid.out
 create mode 100644 tests/qapi-schema/struct-member-if-invalid.err
 create mode 100644 tests/qapi-schema/struct-member-if-invalid.exit
 create mode 100644 tests/qapi-schema/struct-member-if-invalid.json
 create mode 100644 tests/qapi-schema/struct-member-if-invalid.out
 create mode 100644 tests/qapi-schema/union-branch-if-invalid.err
 create mode 100644 tests/qapi-schema/union-branch-if-invalid.exit
 create mode 100644 tests/qapi-schema/union-branch-if-invalid.json
 create mode 100644 tests/qapi-schema/union-branch-if-invalid.out

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 7553616069..799fd4af02 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -294,6 +294,7 @@ check-qtest-generic-y +=3D tests/test-hmp$(EXESUF)
 qapi-schema +=3D alternate-any.json
 qapi-schema +=3D alternate-array.json
 qapi-schema +=3D alternate-base.json
+qapi-schema +=3D alternate-branch-if-invalid.json
 qapi-schema +=3D alternate-clash.json
 qapi-schema +=3D alternate-conflict-dict.json
 qapi-schema +=3D alternate-conflict-enum-bool.json
@@ -378,6 +379,7 @@ qapi-schema +=3D event-member-invalid-dict.json
 qapi-schema +=3D event-nest-struct.json
 qapi-schema +=3D features-bad-type.json
 qapi-schema +=3D features-duplicate-name.json
+qapi-schema +=3D features-if-invalid.json
 qapi-schema +=3D features-missing-name.json
 qapi-schema +=3D features-name-bad-type.json
 qapi-schema +=3D features-no-list.json
@@ -452,6 +454,7 @@ qapi-schema +=3D string-code-point-127.json
 qapi-schema +=3D struct-base-clash-deep.json
 qapi-schema +=3D struct-base-clash.json
 qapi-schema +=3D struct-data-invalid.json
+qapi-schema +=3D struct-member-if-invalid.json
 qapi-schema +=3D struct-member-invalid-dict.json
 qapi-schema +=3D struct-member-invalid.json
 qapi-schema +=3D trailing-comma-list.json
@@ -463,6 +466,7 @@ qapi-schema +=3D unclosed-string.json
 qapi-schema +=3D union-base-empty.json
 qapi-schema +=3D union-base-no-discriminator.json
 qapi-schema +=3D union-branch-case.json
+qapi-schema +=3D union-branch-if-invalid.json
 qapi-schema +=3D union-branch-invalid-dict.json
 qapi-schema +=3D union-clash-branches.json
 qapi-schema +=3D union-empty.json
diff --git a/tests/qapi-schema/alternate-branch-if-invalid.err b/tests/qa=
pi-schema/alternate-branch-if-invalid.err
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alternate-branch-if-invalid.exit b/tests/q=
api-schema/alternate-branch-if-invalid.exit
new file mode 100644
index 0000000000..573541ac97
--- /dev/null
+++ b/tests/qapi-schema/alternate-branch-if-invalid.exit
@@ -0,0 +1 @@
+0
diff --git a/tests/qapi-schema/alternate-branch-if-invalid.json b/tests/q=
api-schema/alternate-branch-if-invalid.json
new file mode 100644
index 0000000000..6497f53475
--- /dev/null
+++ b/tests/qapi-schema/alternate-branch-if-invalid.json
@@ -0,0 +1,4 @@
+# Cover alternative with invalid 'if'
+# FIXME not rejected, would generate '#if  \n'
+{ 'alternate': 'Alt',
+  'data': { 'branch': { 'type': 'int', 'if': ' ' } } }
diff --git a/tests/qapi-schema/alternate-branch-if-invalid.out b/tests/qa=
pi-schema/alternate-branch-if-invalid.out
new file mode 100644
index 0000000000..89305d7f21
--- /dev/null
+++ b/tests/qapi-schema/alternate-branch-if-invalid.out
@@ -0,0 +1,16 @@
+module None
+object q_empty
+enum QType
+    prefix QTYPE
+    member none
+    member qnull
+    member qnum
+    member qstring
+    member qdict
+    member qlist
+    member qbool
+module alternate-branch-if-invalid.json
+alternate Alt
+    tag type
+    case branch: int
+        if [' ']
diff --git a/tests/qapi-schema/features-if-invalid.err b/tests/qapi-schem=
a/features-if-invalid.err
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/features-if-invalid.exit b/tests/qapi-sche=
ma/features-if-invalid.exit
new file mode 100644
index 0000000000..573541ac97
--- /dev/null
+++ b/tests/qapi-schema/features-if-invalid.exit
@@ -0,0 +1 @@
+0
diff --git a/tests/qapi-schema/features-if-invalid.json b/tests/qapi-sche=
ma/features-if-invalid.json
new file mode 100644
index 0000000000..7e4c1ad720
--- /dev/null
+++ b/tests/qapi-schema/features-if-invalid.json
@@ -0,0 +1,5 @@
+# Cover feature with invalid 'if'
+# FIXME not rejected, misinterpreted as unconditional
+{ 'struct': 'Stru',
+  'data': {},
+  'features': [{'name': 'f', 'if': null }] }
diff --git a/tests/qapi-schema/features-if-invalid.out b/tests/qapi-schem=
a/features-if-invalid.out
new file mode 100644
index 0000000000..9c2637baa3
--- /dev/null
+++ b/tests/qapi-schema/features-if-invalid.out
@@ -0,0 +1,14 @@
+module None
+object q_empty
+enum QType
+    prefix QTYPE
+    member none
+    member qnull
+    member qnum
+    member qstring
+    member qdict
+    member qlist
+    member qbool
+module features-if-invalid.json
+object Stru
+    feature f
diff --git a/tests/qapi-schema/struct-member-if-invalid.err b/tests/qapi-=
schema/struct-member-if-invalid.err
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/struct-member-if-invalid.exit b/tests/qapi=
-schema/struct-member-if-invalid.exit
new file mode 100644
index 0000000000..573541ac97
--- /dev/null
+++ b/tests/qapi-schema/struct-member-if-invalid.exit
@@ -0,0 +1 @@
+0
diff --git a/tests/qapi-schema/struct-member-if-invalid.json b/tests/qapi=
-schema/struct-member-if-invalid.json
new file mode 100644
index 0000000000..73987e04fc
--- /dev/null
+++ b/tests/qapi-schema/struct-member-if-invalid.json
@@ -0,0 +1,4 @@
+# Cover member with invalid 'if'
+# FIXME not rejected, would generate '#if True\n'
+{ 'struct': 'Stru',
+  'data': { 'member': { 'type': 'int', 'if': true } } }
diff --git a/tests/qapi-schema/struct-member-if-invalid.out b/tests/qapi-=
schema/struct-member-if-invalid.out
new file mode 100644
index 0000000000..8fbb97985c
--- /dev/null
+++ b/tests/qapi-schema/struct-member-if-invalid.out
@@ -0,0 +1,15 @@
+module None
+object q_empty
+enum QType
+    prefix QTYPE
+    member none
+    member qnull
+    member qnum
+    member qstring
+    member qdict
+    member qlist
+    member qbool
+module struct-member-if-invalid.json
+object Stru
+    member member: int optional=3DFalse
+        if [True]
diff --git a/tests/qapi-schema/union-branch-if-invalid.err b/tests/qapi-s=
chema/union-branch-if-invalid.err
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/union-branch-if-invalid.exit b/tests/qapi-=
schema/union-branch-if-invalid.exit
new file mode 100644
index 0000000000..573541ac97
--- /dev/null
+++ b/tests/qapi-schema/union-branch-if-invalid.exit
@@ -0,0 +1 @@
+0
diff --git a/tests/qapi-schema/union-branch-if-invalid.json b/tests/qapi-=
schema/union-branch-if-invalid.json
new file mode 100644
index 0000000000..859b63b610
--- /dev/null
+++ b/tests/qapi-schema/union-branch-if-invalid.json
@@ -0,0 +1,7 @@
+# Cover branch with invalid 'if'
+# FIXME not rejected, would generate '#if \n'
+{ 'enum': 'Branches', 'data': ['branch1'] }
+{ 'struct': 'Stru', 'data': { 'member': 'str' } }
+{ 'union': 'Uni',
+  'base': { 'tag': 'Branches' }, 'discriminator': 'tag',
+  'data': { 'branch1': { 'type': 'Stru', 'if': [''] } } }
diff --git a/tests/qapi-schema/union-branch-if-invalid.out b/tests/qapi-s=
chema/union-branch-if-invalid.out
new file mode 100644
index 0000000000..2ed43218af
--- /dev/null
+++ b/tests/qapi-schema/union-branch-if-invalid.out
@@ -0,0 +1,23 @@
+module None
+object q_empty
+enum QType
+    prefix QTYPE
+    member none
+    member qnull
+    member qnum
+    member qstring
+    member qdict
+    member qlist
+    member qbool
+module union-branch-if-invalid.json
+enum Branches
+    member branch1
+object Stru
+    member member: str optional=3DFalse
+object q_obj_Uni-base
+    member tag: Branches optional=3DFalse
+object Uni
+    base q_obj_Uni-base
+    tag tag
+    case branch1: Stru
+        if ['']
--=20
2.21.0


