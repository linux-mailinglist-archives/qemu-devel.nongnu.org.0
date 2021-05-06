Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51843755A0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:28:14 +0200 (CEST)
Received: from localhost ([::1]:41390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leez7-0001aT-Ln
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <dd5004665090f6b054072a51ccbad7bbd2f2424a@lizzy.crudebyte.com>)
 id 1leewV-0008Dx-TH
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:25:31 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:59931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <dd5004665090f6b054072a51ccbad7bbd2f2424a@lizzy.crudebyte.com>)
 id 1leewQ-00029l-Rk
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Cc:To:Subject:Date:From:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=t3xFS+RdkHlUPcAh91xVvn9sIS/X2PCweHr1Tsp1qDI=; b=pQUBp
 uuTMUaNtp5dxAe1jrJPG9XG+1mcvqMSMkvfAd8cCsG/3G1t3hQPeG/QhOU9F19IzRL7B4reIqwzO1
 K4x/vRDHIgrnhgrQaRO5X3C7lqJKdEc5TSUrTibMWlFdabl7E8hf9by6GEJscx6I0+pqalDwIA64O
 Q2Kdo4a54oC/1xhoIR1r3nKaDk+yGBCv8sdzs2CYWREspb7l5eVHBiGWAXsN6XfwGJtHmyBnD6t3B
 ZQJPZksPWTs4mpyNQoCD3zQNy632mQRShzbjAs5ubaG+6U5gcbwBJnddPrU4XC72rDSF4YKPM097y
 D5UB75QBecnrl9OT0yhNZ+7YQMBfw==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 6 May 2021 15:12:23 +0200
Subject: [PATCH] 9pfs: add link to 9p developer docs
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Message-Id: <E1leeDf-0008GZ-9q@lizzy.crudebyte.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=dd5004665090f6b054072a51ccbad7bbd2f2424a@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To lower the entry level for new developers, add a link to the
9p developer docs (i.e. qemu wiki) at the beginning of 9p source
files, that is to: https://wiki.qemu.org/Documentation/9p

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-local.c             | 5 +++++
 hw/9pfs/9p-posix-acl.c         | 5 +++++
 hw/9pfs/9p-proxy.c             | 5 +++++
 hw/9pfs/9p-synth.c             | 5 +++++
 hw/9pfs/9p-util.c              | 5 +++++
 hw/9pfs/9p-xattr-user.c        | 5 +++++
 hw/9pfs/9p-xattr.c             | 5 +++++
 hw/9pfs/9p.c                   | 5 +++++
 hw/9pfs/codir.c                | 5 +++++
 hw/9pfs/cofile.c               | 5 +++++
 hw/9pfs/cofs.c                 | 5 +++++
 hw/9pfs/coth.c                 | 5 +++++
 hw/9pfs/coxattr.c              | 5 +++++
 hw/9pfs/virtio-9p-device.c     | 5 +++++
 hw/9pfs/xen-9p-backend.c       | 5 +++++
 tests/qtest/libqos/virtio-9p.c | 5 +++++
 tests/qtest/virtio-9p-test.c   | 5 +++++
 17 files changed, 85 insertions(+)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index af52c1daac..210d9e7705 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -10,6 +10,11 @@
  * the COPYING file in the top-level directory.
  */
 
+/*
+ * Not so fast! You might want to read the 9p developer docs first:
+ * https://wiki.qemu.org/Documentation/9p
+ */
+
 #include "qemu/osdep.h"
 #include "9p.h"
 #include "9p-local.h"
diff --git a/hw/9pfs/9p-posix-acl.c b/hw/9pfs/9p-posix-acl.c
index bbf89064f7..eadae270dd 100644
--- a/hw/9pfs/9p-posix-acl.c
+++ b/hw/9pfs/9p-posix-acl.c
@@ -11,6 +11,11 @@
  *
  */
 
+/*
+ * Not so fast! You might want to read the 9p developer docs first:
+ * https://wiki.qemu.org/Documentation/9p
+ */
+
 #include "qemu/osdep.h"
 #include "qemu/xattr.h"
 #include "9p.h"
diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
index 4aa4e0a3ba..09bd9f1464 100644
--- a/hw/9pfs/9p-proxy.c
+++ b/hw/9pfs/9p-proxy.c
@@ -10,6 +10,11 @@
  * the COPYING file in the top-level directory.
  */
 
+/*
+ * Not so fast! You might want to read the 9p developer docs first:
+ * https://wiki.qemu.org/Documentation/9p
+ */
+
 #include "qemu/osdep.h"
 #include <sys/socket.h>
 #include <sys/un.h>
diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index 473ef914b0..b38088e066 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -12,6 +12,11 @@
  *
  */
 
+/*
+ * Not so fast! You might want to read the 9p developer docs first:
+ * https://wiki.qemu.org/Documentation/9p
+ */
+
 #include "qemu/osdep.h"
 #include "9p.h"
 #include "fsdev/qemu-fsdev.h"
diff --git a/hw/9pfs/9p-util.c b/hw/9pfs/9p-util.c
index 614b7fc34d..3221d9b498 100644
--- a/hw/9pfs/9p-util.c
+++ b/hw/9pfs/9p-util.c
@@ -10,6 +10,11 @@
  * See the COPYING file in the top-level directory.
  */
 
+/*
+ * Not so fast! You might want to read the 9p developer docs first:
+ * https://wiki.qemu.org/Documentation/9p
+ */
+
 #include "qemu/osdep.h"
 #include "qemu/xattr.h"
 #include "9p-util.h"
diff --git a/hw/9pfs/9p-xattr-user.c b/hw/9pfs/9p-xattr-user.c
index 2c90817b75..f2ae9582e6 100644
--- a/hw/9pfs/9p-xattr-user.c
+++ b/hw/9pfs/9p-xattr-user.c
@@ -11,6 +11,11 @@
  *
  */
 
+/*
+ * Not so fast! You might want to read the 9p developer docs first:
+ * https://wiki.qemu.org/Documentation/9p
+ */
+
 #include "qemu/osdep.h"
 #include "9p.h"
 #include "fsdev/file-op-9p.h"
diff --git a/hw/9pfs/9p-xattr.c b/hw/9pfs/9p-xattr.c
index c696d8f846..9ae69dd8db 100644
--- a/hw/9pfs/9p-xattr.c
+++ b/hw/9pfs/9p-xattr.c
@@ -11,6 +11,11 @@
  *
  */
 
+/*
+ * Not so fast! You might want to read the 9p developer docs first:
+ * https://wiki.qemu.org/Documentation/9p
+ */
+
 #include "qemu/osdep.h"
 #include "9p.h"
 #include "fsdev/file-op-9p.h"
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 134806db52..0fa776af09 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -11,6 +11,11 @@
  *
  */
 
+/*
+ * Not so fast! You might want to read the 9p developer docs first:
+ * https://wiki.qemu.org/Documentation/9p
+ */
+
 #include "qemu/osdep.h"
 #include <glib/gprintf.h>
 #include "hw/virtio/virtio.h"
diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
index 1f70a58df5..032cce04c4 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -11,6 +11,11 @@
  *
  */
 
+/*
+ * Not so fast! You might want to read the 9p developer docs first:
+ * https://wiki.qemu.org/Documentation/9p
+ */
+
 #include "qemu/osdep.h"
 #include "fsdev/qemu-fsdev.h"
 #include "qemu/thread.h"
diff --git a/hw/9pfs/cofile.c b/hw/9pfs/cofile.c
index 83bb6c14e0..20f93a90e7 100644
--- a/hw/9pfs/cofile.c
+++ b/hw/9pfs/cofile.c
@@ -11,6 +11,11 @@
  *
  */
 
+/*
+ * Not so fast! You might want to read the 9p developer docs first:
+ * https://wiki.qemu.org/Documentation/9p
+ */
+
 #include "qemu/osdep.h"
 #include "fsdev/qemu-fsdev.h"
 #include "qemu/thread.h"
diff --git a/hw/9pfs/cofs.c b/hw/9pfs/cofs.c
index 0b321b456e..9d0adc2e78 100644
--- a/hw/9pfs/cofs.c
+++ b/hw/9pfs/cofs.c
@@ -11,6 +11,11 @@
  *
  */
 
+/*
+ * Not so fast! You might want to read the 9p developer docs first:
+ * https://wiki.qemu.org/Documentation/9p
+ */
+
 #include "qemu/osdep.h"
 #include "fsdev/qemu-fsdev.h"
 #include "qemu/thread.h"
diff --git a/hw/9pfs/coth.c b/hw/9pfs/coth.c
index 9778f24b00..2802d41cce 100644
--- a/hw/9pfs/coth.c
+++ b/hw/9pfs/coth.c
@@ -12,6 +12,11 @@
  *
  */
 
+/*
+ * Not so fast! You might want to read the 9p developer docs first:
+ * https://wiki.qemu.org/Documentation/9p
+ */
+
 #include "qemu/osdep.h"
 #include "block/thread-pool.h"
 #include "qemu/coroutine.h"
diff --git a/hw/9pfs/coxattr.c b/hw/9pfs/coxattr.c
index 0e00ffaa0d..dbcd09e0fd 100644
--- a/hw/9pfs/coxattr.c
+++ b/hw/9pfs/coxattr.c
@@ -11,6 +11,11 @@
  *
  */
 
+/*
+ * Not so fast! You might want to read the 9p developer docs first:
+ * https://wiki.qemu.org/Documentation/9p
+ */
+
 #include "qemu/osdep.h"
 #include "fsdev/qemu-fsdev.h"
 #include "qemu/thread.h"
diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
index 14371a78ef..54ee93b71f 100644
--- a/hw/9pfs/virtio-9p-device.c
+++ b/hw/9pfs/virtio-9p-device.c
@@ -11,6 +11,11 @@
  *
  */
 
+/*
+ * Not so fast! You might want to read the 9p developer docs first:
+ * https://wiki.qemu.org/Documentation/9p
+ */
+
 #include "qemu/osdep.h"
 #include "hw/virtio/virtio.h"
 #include "qemu/sockets.h"
diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
index a969fcc54c..65c4979c3c 100644
--- a/hw/9pfs/xen-9p-backend.c
+++ b/hw/9pfs/xen-9p-backend.c
@@ -8,6 +8,11 @@
  *
  */
 
+/*
+ * Not so fast! You might want to read the 9p developer docs first:
+ * https://wiki.qemu.org/Documentation/9p
+ */
+
 #include "qemu/osdep.h"
 
 #include "hw/9pfs/9p.h"
diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
index be91662c6f..b4e1143288 100644
--- a/tests/qtest/libqos/virtio-9p.c
+++ b/tests/qtest/libqos/virtio-9p.c
@@ -16,6 +16,11 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>
  */
 
+/*
+ * Not so fast! You might want to read the 9p developer docs first:
+ * https://wiki.qemu.org/Documentation/9p
+ */
+
 #include "qemu/osdep.h"
 #include "libqtest.h"
 #include "qemu/module.h"
diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 92a498f249..41fed41de1 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -7,6 +7,11 @@
  * See the COPYING file in the top-level directory.
  */
 
+/*
+ * Not so fast! You might want to read the 9p developer docs first:
+ * https://wiki.qemu.org/Documentation/9p
+ */
+
 #include "qemu/osdep.h"
 #include "libqtest-single.h"
 #include "qemu/module.h"
-- 
2.20.1


