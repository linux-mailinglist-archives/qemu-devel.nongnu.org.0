Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE713486277
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 10:55:44 +0100 (CET)
Received: from localhost ([::1]:34788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5PUl-0003HW-Vn
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 04:55:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1n5PIz-0003Jn-85
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:43:33 -0500
Received: from mail.loongson.cn ([114.242.206.163]:57282 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1n5PIx-0004GL-7E
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:43:32 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz8toudZhmQsAAA--.229S3;
 Thu, 06 Jan 2022 17:42:15 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 01/26] target/loongarch: Add README
Date: Thu,  6 Jan 2022 04:41:35 -0500
Message-Id: <20220106094200.1801206-2-gaosong@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220106094200.1801206-1-gaosong@loongson.cn>
References: <20220106094200.1801206-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz8toudZhmQsAAA--.229S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWUGr1fJFyUuryxCryfJFb_yoW5tFWxpF
 1fuFyfKrWUX3sIqrnag343WrnYyrs3Gr1xWFsIkw1rC3sxtryv9w1rta40qFy7Xwn5JrWv
 vrykCw1UW3WUGa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch gives an introduction to the LoongArch target.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS             |  5 +++
 target/loongarch/README | 77 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 target/loongarch/README

diff --git a/MAINTAINERS b/MAINTAINERS
index f871d759fd..2df0d4a7c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -213,6 +213,11 @@ S: Maintained
 F: target/hppa/
 F: disas/hppa.c
 
+LoongArch TCG CPUS
+M: Song Gao <gaosong@loongson.cn>
+S: Maintained
+F: target/loongarch/
+
 M68K TCG CPUs
 M: Laurent Vivier <laurent@vivier.eu>
 S: Maintained
diff --git a/target/loongarch/README b/target/loongarch/README
new file mode 100644
index 0000000000..d5780c5918
--- /dev/null
+++ b/target/loongarch/README
@@ -0,0 +1,77 @@
+- Introduction
+
+  LoongArch is the general processor architecture of Loongson.
+
+  The following versions of the LoongArch core are supported
+    core: 3A5000
+    https://github.com/loongson/LoongArch-Documentation/releases/download/2021.08.17/LoongArch-Vol1-v1.00-EN.pdf
+
+  We can get the latest loongarch documents at https://github.com/loongson/LoongArch-Documentation/tags.
+
+
+- Linux-user emulation
+
+  We already support Linux user emulation. We can use LoongArch cross-tools to build LoongArch executables on X86 machines,
+  and We can also use qemu-loongarch64 to run LoongArch executables.
+
+  1. Install LoongArch cross-tools on X86 machines.
+
+    Download cross-tools.
+
+      wget https://github.com/loongson/build-tools/releases/latest/download/loongarch64-clfs-20211202-cross-tools.tar.xz
+
+      tar -vxf loongarch64-clfs-20211202-cross-tools.tar.xz -C /opt
+
+    Config cross-tools env.
+
+      . setenv.sh
+
+      setenv.sh:
+
+          #!/bin/sh
+          set -x
+          CC_PREFIX=/opt/cross-tools
+
+          export PATH=$CC_PREFIX/bin:$PATH
+          export LD_LIBRARY_PATH=$CC_PREFIX/lib:$LD_LIBRARY_PATH
+          export LD_LIBRARY_PATH=$CC_PREFIX/loongarch64-unknown-linux-gnu/lib/:$LD_LIBRARY_PATH
+          set +x
+
+  2. Test tests/tcg/multiarch.
+
+    ./configure --disable-rdma --disable-pvrdma --prefix=/usr  \
+            --target-list="loongarch64-linux-user"  \
+            --disable-libiscsi --disable-libnfs --disable-libpmem \
+            --disable-glusterfs --enable-libusb --enable-usb-redir \
+            --disable-opengl --disable-xen --enable-spice --disable-werror \
+            --enable-debug --disable-capstone --disable-kvm --enable-profiler
+
+    cd  build/
+
+    make && make check-tcg
+
+  3. Run LoongArch system basic command with loongarch-clfs-system.
+
+    Download clfs-system.
+
+      wget https://github.com/loongson/build-tools/releases/latest/download/loongarch64-clfs-system-2021-12-02.tar.bz2
+
+      tar -vxf loongarch64-clfs-system-2021-12-02.tar.bz2 -C /opt/clfs
+      ln -s /opt/clfs/  /opt/clfs/tls
+
+    Config env.
+
+      cp /opt/clfs/lib64/ld-linux-loongarch64.so.1   /lib64
+
+      export LD_LIBRARY_PATH="/opt/clfs/lib64"
+
+    Run LoongArch system basic command.
+
+      ./qemu-loongarch64  /opt/clfs/usr/bin/bash
+      ./qemu-loongarch64  /opt/clfs/usr/bin/ls
+      ./qemu-loongarch64  /opt/clfs/usr/bin/pwd
+      ...
+
+
+- Note.
+  We can get the latest LoongArch documents or LoongArch tools at https://github.com/loongson/
-- 
2.27.0


