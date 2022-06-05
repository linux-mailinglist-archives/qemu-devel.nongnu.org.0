Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF4753D8E0
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jun 2022 02:19:38 +0200 (CEST)
Received: from localhost ([::1]:45450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxdzU-0006lL-Kk
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 20:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oxr463@gmx.us>) id 1nxdwy-0005Ig-Ay
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 20:17:02 -0400
Received: from mout.gmx.net ([212.227.15.19]:57409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oxr463@gmx.us>) id 1nxdwq-0004zA-BM
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 20:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1654388206;
 bh=b0REZVUJsocksjG+ao7irXsDDw3rhgRIcUCDiffsB3k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Av9GXhJXZ8fCwNSh5Axdy7X7mWfLypppmTnc1AFrPoHLREzm7MT+Rf6MxCBRPSNbc
 pnZxgcQbFcRaQrjk8cnHACPTf+Z3KdkWEbVE/eaVRAOmTOV04wgU5PVB0aH3Sq4WsE
 DVzP7KqzTD/UQyrwCX64veLSLUB2leiARon5FrXQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([172.58.168.47]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MOiHl-1o8pwQ1SjH-00Q8Hs; Sun, 05 Jun 2022 02:16:46 +0200
From: oxr463@gmx.us
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Lucas Ramage <lucas.ramage@infinite-omicron.com>
Subject: [PATCH] docs/devel/*.txt: convert remaining files to restructuredText
Date: Sun,  5 Jun 2022 00:16:32 +0000
Message-Id: <20220605001632.3402-1-oxr463@gmx.us>
X-Mailer: git-send-email 2.34.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Br3m+FbqRdkQOUi27n/fOrwjhYgwrNYeJKh/az+FKDdsIHnsDBU
 ycOICgrAgB29fZOArWksFXtn3VwtIeW1UvD993xke/9pmMx0U/tljTLzIGH2mHjYp15yA2G
 qK71mRafM2D6qDg1lTLnZjIof5m5CX65vEpkrBN7ez/EqPwpEAFpGL0y+a8zlqwNCRmM2oi
 6fVWFHkyjlL40bSjUJ+WQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uoMKZSjzLaE=:VGuT5oSYRTQm9uaTwi47/k
 s5nBbqCzlDxTMgTy0HRNxHR6+g7PP+LgtNucYuAMAzaMcKSwg2w/VR+Z7yu42S2q9YjVD8SK5
 ErCC5MtpNekZqotI9kbT+I+sz0uQT6OfmcBM9KuH3G3RIL6ApNAmEZs43pG10I28s4gOOveMm
 XJerOoGY/Bi129UAozbF2BHyLrQrqaY7bqAOPlDAdKtitGcvdnCFAWru2WlnkgRR7FOJWn3zj
 sQpcbODNsaEHUqlarmhVc7tQYEsKJ/yQQsUlEtDlxAZXXYzbS8eRDnyUHfqN4FmEIgJU9x4rl
 4/oXX11uFKU81c6rNTwRVAtCaZKg6hg+mR2unh/BKr1XtCh7FUwOGxqFuyTeOBRr3XUEiCIdF
 rq0Kg7kQRl9/hqLKM4IGGqeszLM2JlJJmCGZqOZM6nWZ9pSvx3zlzMoX+RUoD2JTPRIyrlTrp
 DtaA+7ZZ6v8ac5OrlfClWFIOKVvLAYlUl6fEbEge1QWQ4T5ZJIJe3yH1KIuanoXf4bIu+M7r9
 b/+T+DVJO5+3JZNQPcJxBLJJJ5T98dlhYnCE54xb6AAYzxoYf9dgUlh2MIkaKYWLh3uFPqbBE
 0f7sfLBVvyjjtnnRY7xFQvEpCuUwc/AZ/RlaRcx8orZ9Wv9WucZ6AIZAOA80vCYk9FJs3ZP68
 S9VMq4/NATkdmjdwMcWdPkYiQVqsOJV8c02MA+mh+AgAxHm4gAtIGEdaK1NJtZbTX/50t+stE
 ZZckCjcsx1+rNTjJSkVfWa/fUIKXYmTTXmBGBXWXMkAHGbDDz6BPYccusDo6HiMq2SGtENTCk
 +RNPRP8dSemczExqtBk2/ws5yiAUsmxyus5tHPSkzcM8TaTaACDDBE9chcFCwSjIcanhFx9qx
 2ech6bNL2eAfbfCfhM0ApFNY7M+2nYaVtpCU1XTPk7wc7MxE365q75WqeT4T0LnrBUxQnAOAP
 oS+cgDY0aPttPVq0UcbTJro0OYtzzYIZJw+xFv+nTLnMScx8PPSSkMmzKBmZmyGBodbOVY72O
 MViynmZVRWy9KhR0gLUAatULOWVYLcz5EtaSf1dwdnK5c5ZXsP5BGaBwTyQTZU7LyC1mvk3NQ
 S7QOOBBUBYZIHvtDA/Or5W+zuPNrXt/xFPb6LyPfCsRI+9YBY3/lR2yCA==
Received-SPF: pass client-ip=212.227.15.19; envelope-from=oxr463@gmx.us;
 helo=mout.gmx.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Lucas Ramage <lucas.ramage@infinite-omicron.com>

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/527
Signed-off-by: Lucas Ramage <lucas.ramage@infinite-omicron.com>
=2D--
 docs/devel/{blkdebug.txt =3D> blkdebug.rst}     |  8 +++++-
 docs/devel/{blkverify.txt =3D> blkverify.rst}   | 12 ++++++---
 docs/devel/index-build.rst                    |  2 ++
 docs/devel/index-internals.rst                |  5 ++++
 docs/devel/{lockcnt.txt =3D> lockcnt.rst}       | 25 ++++++++++---------
 ...e-iothreads.txt =3D> multiple-iothreads.rst} |  3 +++
 docs/devel/{rcu.txt =3D> rcu.rst}               |  0
 docs/devel/{replay.txt =3D> replay.rst}         | 11 +++++---
 ...tio-migration.txt =3D> virtio-migration.rst} |  6 ++---
 9 files changed, 48 insertions(+), 24 deletions(-)
 rename docs/devel/{blkdebug.txt =3D> blkdebug.rst} (99%)
 rename docs/devel/{blkverify.txt =3D> blkverify.rst} (94%)
 rename docs/devel/{lockcnt.txt =3D> lockcnt.rst} (95%)
 rename docs/devel/{multiple-iothreads.txt =3D> multiple-iothreads.rst} (9=
9%)
 rename docs/devel/{rcu.txt =3D> rcu.rst} (100%)
 rename docs/devel/{replay.txt =3D> replay.rst} (96%)
 rename docs/devel/{virtio-migration.txt =3D> virtio-migration.rst} (98%)

diff --git a/docs/devel/blkdebug.txt b/docs/devel/blkdebug.rst
similarity index 99%
rename from docs/devel/blkdebug.txt
rename to docs/devel/blkdebug.rst
index 0b0c128d35..660d35aaf8 100644
=2D-- a/docs/devel/blkdebug.txt
+++ b/docs/devel/blkdebug.rst
@@ -1,5 +1,6 @@
 Block I/O error injection using blkdebug
=2D----------------------------------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
 Copyright (C) 2014-2015 Red Hat Inc

 This work is licensed under the terms of the GNU GPL, version 2 or later.=
  See
@@ -13,6 +14,7 @@ This document gives an overview of the features availabl=
e in blkdebug.

 Background
 ----------
+
 Block drivers have many error code paths that handle I/O errors.  Image f=
ormats
 are especially complex since metadata I/O errors during cluster allocatio=
n or
 while updating tables happen halfway through request processing and requi=
re
@@ -23,6 +25,7 @@ This way, all error paths can be tested to make sure the=
y are correct.

 Rules
 -----
+
 The blkdebug block driver takes a list of "rules" that tell the error inj=
ection
 engine when to fail an I/O request.

@@ -77,6 +80,7 @@ Rules support the following attributes:

 Events
 ------
+
 Block drivers provide information about the type of I/O request they are =
about
 to make so rules can match specific types of requests.  For example, the =
qcow2
 block driver tells blkdebug when it accesses the L1 table so rules can ma=
tch
@@ -98,6 +102,7 @@ meaning of specific events.

 State transitions
 -----------------
+
 There are cases where more power is needed to match a particular I/O requ=
est in
 a longer sequence of requests.  For example:

@@ -149,6 +154,7 @@ State transition rules support the following attribute=
s:

 Suspend and resume
 ------------------
+
 Exercising code paths in block drivers may require specific ordering amon=
gst
 concurrent requests.  The "breakpoint" feature allows requests to be halt=
ed on
 a blkdebug event and resumed later.  This makes it possible to achieve
diff --git a/docs/devel/blkverify.txt b/docs/devel/blkverify.rst
similarity index 94%
rename from docs/devel/blkverify.txt
rename to docs/devel/blkverify.rst
index aca826c51c..7e1b0fb500 100644
=2D-- a/docs/devel/blkverify.txt
+++ b/docs/devel/blkverify.rst
@@ -1,6 +1,8 @@
-=3D Block driver correctness testing with blkverify =3D
+Block driver correctness testing with blkverify
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

-=3D=3D Introduction =3D=3D
+Introduction
+------------

 This document describes how to use the blkverify protocol to test that a =
block
 driver is operating correctly.
@@ -14,7 +16,8 @@ driver.
 Blkverify solves this problem by catching data corruption inside QEMU the=
 first
 time bad data is read and reporting the disk sector that is corrupted.

-=3D=3D How it works =3D=3D
+How it works
+------------

 The blkverify protocol has two child block devices, the "test" device and=
 the
 "raw" device.  Read/write operations are mirrored to both devices so thei=
r
@@ -29,7 +32,8 @@ After a mirrored read operation completes, blkverify wil=
l compare the data and
 raise an error if it is not identical.  This makes it possible to catch t=
he
 first instance where corrupt data is read.

-=3D=3D Example =3D=3D
+Example
+-------

 Imagine raw.img has 0xcd repeated throughout its first sector:

diff --git a/docs/devel/index-build.rst b/docs/devel/index-build.rst
index 1002a533a6..514ef308fc 100644
=2D-- a/docs/devel/index-build.rst
+++ b/docs/devel/index-build.rst
@@ -11,6 +11,8 @@ the basics if you are adding new files and targets to th=
e build.
    build-system
    kconfig
    testing
+   blkdebug
+   blkverify
    qtest
    ci
    qapi-code-gen
diff --git a/docs/devel/index-internals.rst b/docs/devel/index-internals.r=
st
index e1a93df263..16f57b87da 100644
=2D-- a/docs/devel/index-internals.rst
+++ b/docs/devel/index-internals.rst
@@ -11,11 +11,16 @@ Details about QEMU's various subsystems including how =
to add features to them.
    block-coroutine-wrapper
    clocks
    ebpf_rss
+   lockcnt
    migration
    multi-process
+   multiple-iothreads
+   rcu
+   replay
    reset
    s390-dasd-ipl
    tracing
    vfio-migration
    writing-monitor-commands
    virtio-backends
+   virtio-migration
diff --git a/docs/devel/lockcnt.txt b/docs/devel/lockcnt.rst
similarity index 95%
rename from docs/devel/lockcnt.txt
rename to docs/devel/lockcnt.rst
index a3fb3bc5d8..0968af46b6 100644
=2D-- a/docs/devel/lockcnt.txt
+++ b/docs/devel/lockcnt.rst
@@ -1,9 +1,10 @@
-DOCUMENTATION FOR LOCKED COUNTERS (aka QemuLockCnt)
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Locked Counters (aka QemuLockCnt)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D

 QEMU often uses reference counts to track data structures that are being
 accessed and should not be freed.  For example, a loop that invoke
-callbacks like this is not safe:
+callbacks like this is not safe::

     QLIST_FOREACH_SAFE(ioh, &io_handlers, next, pioh) {
         if (ioh->revents & G_IO_OUT) {
@@ -15,7 +16,7 @@ QLIST_FOREACH_SAFE protects against deletion of the curr=
ent node (ioh)
 by stashing away its "next" pointer.  However, ioh->fd_write could
 actually delete the next node from the list.  The simplest way to
 avoid this is to mark the node as deleted, and remove it from the
-list in the above loop:
+list in the above loop::

     QLIST_FOREACH_SAFE(ioh, &io_handlers, next, pioh) {
         if (ioh->deleted) {
@@ -29,7 +30,7 @@ list in the above loop:
     }

 If however this loop must also be reentrant, i.e. it is possible that
-ioh->fd_write invokes the loop again, some kind of counting is needed:
+ioh->fd_write invokes the loop again, some kind of counting is needed::

     walking_handlers++;
     QLIST_FOREACH_SAFE(ioh, &io_handlers, next, pioh) {
@@ -101,7 +102,7 @@ can happen concurrently with the read.  The RCU API en=
sures that the
 processor and the compiler see all required memory barriers.

 This could be implemented simply by protecting the counter with the
-mutex, for example:
+mutex, for example::

     // (1)
     qemu_mutex_lock(&walking_handlers_mutex);
@@ -183,7 +184,7 @@ QemuLockCnt usage
 This section explains the typical usage patterns for QemuLockCnt function=
s.

 Setting a variable to a non-NULL value can be done between
-qemu_lockcnt_lock and qemu_lockcnt_unlock:
+qemu_lockcnt_lock and qemu_lockcnt_unlock::

     qemu_lockcnt_lock(&xyz_lockcnt);
     if (!xyz) {
@@ -194,7 +195,7 @@ qemu_lockcnt_lock and qemu_lockcnt_unlock:
     qemu_lockcnt_unlock(&xyz_lockcnt);

 Accessing the value can be done between qemu_lockcnt_inc and
-qemu_lockcnt_dec:
+qemu_lockcnt_dec::

     qemu_lockcnt_inc(&xyz_lockcnt);
     if (xyz) {
@@ -208,7 +209,7 @@ Freeing the object can similarly use qemu_lockcnt_lock=
 and
 qemu_lockcnt_unlock, but you also need to ensure that the count
 is zero (i.e. there is no concurrent visit).  Because qemu_lockcnt_inc
 takes the QemuLockCnt's lock, the count cannot become non-zero while
-the object is being freed.  Freeing an object looks like this:
+the object is being freed.  Freeing an object looks like this::

     qemu_lockcnt_lock(&xyz_lockcnt);
     if (!qemu_lockcnt_count(&xyz_lockcnt)) {
@@ -218,7 +219,7 @@ the object is being freed.  Freeing an object looks li=
ke this:
     qemu_lockcnt_unlock(&xyz_lockcnt);

 If an object has to be freed right after a visit, you can combine
-the decrement, the locking and the check on count as follows:
+the decrement, the locking and the check on count as follows::

     qemu_lockcnt_inc(&xyz_lockcnt);
     if (xyz) {
@@ -232,7 +233,7 @@ the decrement, the locking and the check on count as f=
ollows:
         qemu_lockcnt_unlock(&xyz_lockcnt);
     }

-QemuLockCnt can also be used to access a list as follows:
+QemuLockCnt can also be used to access a list as follows::

     qemu_lockcnt_inc(&io_handlers_lockcnt);
     QLIST_FOREACH_RCU(ioh, &io_handlers, pioh) {
@@ -255,7 +256,7 @@ Again, the RCU primitives are used because new items c=
an be added to the
 list during the walk.  QLIST_FOREACH_RCU ensures that the processor and
 the compiler see the appropriate memory barriers.

-An alternative pattern uses qemu_lockcnt_dec_if_lock:
+An alternative pattern uses qemu_lockcnt_dec_if_lock::

     qemu_lockcnt_inc(&io_handlers_lockcnt);
     QLIST_FOREACH_SAFE_RCU(ioh, &io_handlers, next, pioh) {
diff --git a/docs/devel/multiple-iothreads.txt b/docs/devel/multiple-iothr=
eads.rst
similarity index 99%
rename from docs/devel/multiple-iothreads.txt
rename to docs/devel/multiple-iothreads.rst
index aeb997bed5..8e7e55b294 100644
=2D-- a/docs/devel/multiple-iothreads.txt
+++ b/docs/devel/multiple-iothreads.rst
@@ -1,3 +1,6 @@
+IOThreads
+=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
 Copyright (c) 2014-2017 Red Hat Inc.

 This work is licensed under the terms of the GNU GPL, version 2 or later.=
  See
diff --git a/docs/devel/rcu.txt b/docs/devel/rcu.rst
similarity index 100%
rename from docs/devel/rcu.txt
rename to docs/devel/rcu.rst
diff --git a/docs/devel/replay.txt b/docs/devel/replay.rst
similarity index 96%
rename from docs/devel/replay.txt
rename to docs/devel/replay.rst
index e641c35add..cddc9333c3 100644
=2D-- a/docs/devel/replay.txt
+++ b/docs/devel/replay.rst
@@ -1,3 +1,6 @@
+Replay
+=3D=3D=3D=3D=3D=3D
+
 Record/replay mechanism, that could be enabled through icount mode, expec=
ts
 the virtual devices to satisfy the following requirements.

@@ -5,7 +8,7 @@ The main idea behind this document is that everything that=
 affects
 the guest state during execution in icount mode should be deterministic.

 Timers
-=3D=3D=3D=3D=3D=3D
+------

 All virtual devices should use virtual clock for timers that change the g=
uest
 state. Virtual clock is deterministic, therefore such timers are determin=
istic
@@ -19,7 +22,7 @@ the virtual devices (e.g., slirp routing device) that li=
e outside the
 replayed guest.

 Bottom halves
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+-------------

 Bottom half callbacks, that affect the guest state, should be invoked thr=
ough
 replay_bh_schedule_event or replay_bh_schedule_oneshot_event functions.
@@ -27,7 +30,7 @@ Their invocations are saved in record mode and synchroni=
zed with the existing
 log in replay mode.

 Saving/restoring the VM state
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+-----------------------------

 All fields in the device state structure (including virtual timers)
 should be restored by loadvm to the same values they had before savevm.
@@ -38,7 +41,7 @@ is not defined. It means that you should not call functi=
ons like
 the dependencies that may make restoring the VM state non-deterministic.

 Stopping the VM
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+---------------

 Stopping the guest should not interfere with its state (with the exceptio=
n
 of the network connections, that could be broken by the remote timeouts).
diff --git a/docs/devel/virtio-migration.txt b/docs/devel/virtio-migration=
.rst
similarity index 98%
rename from docs/devel/virtio-migration.txt
rename to docs/devel/virtio-migration.rst
index 98a6b0ffb5..a8a221ab34 100644
=2D-- a/docs/devel/virtio-migration.txt
+++ b/docs/devel/virtio-migration.rst
@@ -22,7 +22,7 @@ caveats.


 Save state procedure
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--------------------

 virtio core               virtio transport          virtio device
 -----------               ----------------          -------------
@@ -58,7 +58,7 @@ virtio_save()                                       <---=
-------


 Load state procedure
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--------------------

 virtio core               virtio transport          virtio device
 -----------               ----------------          -------------
@@ -95,7 +95,7 @@ virtio_load()                                       <---=
-------


 Implications of this setup
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+--------------------------

 Devices need to be careful in their state processing during load: The
 load_device() procedure is invoked by the core before subsections have
=2D-
2.34.2


