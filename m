Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465FC3BBC9F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 14:05:30 +0200 (CEST)
Received: from localhost ([::1]:47484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0NLt-0002Hw-Az
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 08:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <6f569084277dc7ae351141cfa6ad3649e92a1390@lizzy.crudebyte.com>)
 id 1m0NJY-0007zo-Iz
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:03:04 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:47985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <6f569084277dc7ae351141cfa6ad3649e92a1390@lizzy.crudebyte.com>)
 id 1m0NJW-0001mn-Ay
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=J+DlRAQdloRk0W05N9zjGynKLCQUayek8IV2ly7sg0c=; b=PFF/T
 5iZC2/N+A1OoZCalZWYWzE07pNCGbbozkvIuL4hvqEy3XHdkt+1BpdojCIn5f4wUw75HEyM+/n5sq
 CioagfbDUH9zKyQ9vLa4aZqg92/51/cSIaUzqbRPqczVr/iTPdTSnIra+RziCjEGoUpeFsX8DJ1rg
 a2i9998+4xvOjQx0lRIZHCkI8rLzVCK2YGcMXE0aU4be3KmoXzEH9k7SsVVNGpW499AypW8jUsHQ9
 SqSN1QbPQC320MLmTgSY/idgCNFdKGTQfnjdaTnja0O8Z3Nmu9HTZJ7XZFV10xY3/sQaGWIpR0v1I
 KpXCIGEYQYi8WjnZ6GqyHM9sG2wVw==;
Message-Id: <6f569084277dc7ae351141cfa6ad3649e92a1390.1625483630.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1625483630.git.qemu_oss@crudebyte.com>
References: <cover.1625483630.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 05 Jul 2021 13:13:51 +0200
Subject: [PULL 1/8] 9pfs: add link to 9p developer docs
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=6f569084277dc7ae351141cfa6ad3649e92a1390@lizzy.crudebyte.com;
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

To lower the entry level for new developers, add a link to the 9p
developer docs (i.e. qemu wiki) to MAINTAINERS and to the beginning of
9p source files, that is to: https://wiki.qemu.org/Documentation/9p

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Acked-by: Greg Kurz <groug@kaod.org>
Message-Id: <E1leeDf-0008GZ-9q@lizzy.crudebyte.com>
---
 MAINTAINERS                    | 1 +
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
 18 files changed, 86 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cb8f3ea2c2..684142e12e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1881,6 +1881,7 @@ virtio-9p
 M: Greg Kurz <groug@kaod.org>
 M: Christian Schoenebeck <qemu_oss@crudebyte.com>
 S: Odd Fixes
+W: https://wiki.qemu.org/Documentation/9p
 F: hw/9pfs/
 X: hw/9pfs/xen-9p*
 F: fsdev/
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


