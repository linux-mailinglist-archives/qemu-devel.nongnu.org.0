Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B700BD539
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 01:04:48 +0200 (CEST)
Received: from localhost ([::1]:43702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCtrT-0006Pr-DC
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 19:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45701)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iCtom-0004gW-0F
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 19:02:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iCtok-0000Y8-Ly
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 19:01:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58694)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1iCtoe-0000U1-E5; Tue, 24 Sep 2019 19:01:52 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9D604A2892A;
 Tue, 24 Sep 2019 23:01:50 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-231.bos.redhat.com [10.18.17.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9984E60603;
 Tue, 24 Sep 2019 23:01:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] dirty-bitmaps: remove deprecated autoload parameter
Date: Tue, 24 Sep 2019 19:01:43 -0400
Message-Id: <20190924230143.22551-2-jsnow@redhat.com>
In-Reply-To: <20190924230143.22551-1-jsnow@redhat.com>
References: <20190924230143.22551-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Tue, 24 Sep 2019 23:01:50 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-block@nongnu.org,
 libvir-list@redhat.com, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This parameter has been deprecated since 2.12.0 and is eligible for
removal. Remove this parameter as it is actually completely ignored;
let's not give false hope.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qemu-deprecated.texi | 20 +++++++++++++++-----
 qapi/block-core.json |  6 +-----
 blockdev.c           |  6 ------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
index 01245e0b1c..d60246d5d6 100644
--- a/qemu-deprecated.texi
+++ b/qemu-deprecated.texi
@@ -149,11 +149,6 @@ QEMU 4.1 has three options, please migrate to one of=
 these three:
=20
 @section QEMU Machine Protocol (QMP) commands
=20
-@subsection block-dirty-bitmap-add "autoload" parameter (since 2.12.0)
-
-"autoload" parameter is now ignored. All bitmaps are automatically loade=
d
-from qcow2 images.
-
 @subsection query-block result field dirty-bitmaps[i].status (since 4.0)
=20
 The ``status'' field of the ``BlockDirtyInfo'' structure, returned by
@@ -356,3 +351,18 @@ existing CPU models.  Management software that needs=
 runnability
 guarantees must resolve the CPU model aliases using te
 ``alias-of'' field returned by the ``query-cpu-definitions'' QMP
 command.
+
+
+@node Recently removed features
+@appendix Recently removed features
+
+What follows is a record of recently removed, formerly deprecated
+features that serves as a record for users who have encountered
+trouble after a recent upgrade.
+
+@section QEMU Machine Protocol (QMP) commands
+
+@subsection block-dirty-bitmap-add "autoload" parameter (since 2.12.0)
+
+"autoload" parameter is now ignored. All bitmaps are automatically loade=
d
+from qcow2 images.
diff --git a/qapi/block-core.json b/qapi/block-core.json
index e6edd641f1..e4975ece4a 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1987,10 +1987,6 @@
 #              Qcow2 disks support persistent bitmaps. Default is false =
for
 #              block-dirty-bitmap-add. (Since: 2.10)
 #
-# @autoload: ignored and deprecated since 2.12.
-#            Currently, all dirty tracking bitmaps are loaded from Qcow2=
 on
-#            open.
-#
 # @disabled: the bitmap is created in the disabled state, which means th=
at
 #            it will not track drive changes. The bitmap may be enabled =
with
 #            block-dirty-bitmap-enable. Default is false. (Since: 4.0)
@@ -1999,7 +1995,7 @@
 ##
 { 'struct': 'BlockDirtyBitmapAdd',
   'data': { 'node': 'str', 'name': 'str', '*granularity': 'uint32',
-            '*persistent': 'bool', '*autoload': 'bool', '*disabled': 'bo=
ol' } }
+            '*persistent': 'bool', '*disabled': 'bool' } }
=20
 ##
 # @BlockDirtyBitmapMergeSource:
diff --git a/blockdev.c b/blockdev.c
index fbef6845c8..93804da840 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1966,7 +1966,6 @@ static void block_dirty_bitmap_add_prepare(BlkActio=
nState *common,
     qmp_block_dirty_bitmap_add(action->node, action->name,
                                action->has_granularity, action->granular=
ity,
                                action->has_persistent, action->persisten=
t,
-                               action->has_autoload, action->autoload,
                                action->has_disabled, action->disabled,
                                &local_err);
=20
@@ -2858,7 +2857,6 @@ out:
 void qmp_block_dirty_bitmap_add(const char *node, const char *name,
                                 bool has_granularity, uint32_t granulari=
ty,
                                 bool has_persistent, bool persistent,
-                                bool has_autoload, bool autoload,
                                 bool has_disabled, bool disabled,
                                 Error **errp)
 {
@@ -2890,10 +2888,6 @@ void qmp_block_dirty_bitmap_add(const char *node, =
const char *name,
         persistent =3D false;
     }
=20
-    if (has_autoload) {
-        warn_report("Autoload option is deprecated and its value is igno=
red");
-    }
-
     if (!has_disabled) {
         disabled =3D false;
     }
--=20
2.21.0


