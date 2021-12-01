Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C33B464976
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 09:19:25 +0100 (CET)
Received: from localhost ([::1]:35634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msKpn-0008P5-QL
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 03:19:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1msKn9-0005ei-BG
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 03:16:39 -0500
Received: from mail.loongson.cn ([114.242.206.163]:59066 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1msKn7-000803-4L
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 03:16:38 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxaslZL6dhBv8BAA--.4388S3;
 Wed, 01 Dec 2021 16:16:33 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 01/26] target/loongarch: Add README
Date: Wed,  1 Dec 2021 16:16:00 +0800
Message-Id: <1638346585-3436-2-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638346585-3436-1-git-send-email-gaosong@loongson.cn>
References: <1638346585-3436-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9AxaslZL6dhBv8BAA--.4388S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWUGr1xCw4rKr1DKF4Durg_yoW5tF1xpF
 1fuFyfKrWUX3sxtrnag34fWFnYyr4fGr1xWanIkw1rC3sxJryq9w1rta4IqFy7Xwn5trWv
 vrykCw1UWa1UGa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, richard.henderson@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch gives an introduction to the LoongArch target.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS             |  5 ++++
 target/loongarch/README | 76 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 target/loongarch/README

diff --git a/MAINTAINERS b/MAINTAINERS
index 7543eb4..d6fd854 100644
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
index 0000000..09f809c
--- /dev/null
+++ b/target/loongarch/README
@@ -0,0 +1,76 @@
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
+      wget https://github.com/loongson/build-tools/releases/latest/download/loongarch64-clfs-20210831-cross-tools.tar.xz
+
+      tar -vxf loongarch64-clfs-20210831-cross-tools.tar.xz -C /opt
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
+      wget https://github.com/loongson/build-tools/releases/latest/download/loongarch64-clfs-system-2021-08-31.tar.bz2
+
+      tar -vxf loongarch64-clfs-system-2021-08-31.tar.bz2 -C /opt/clfs
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
1.8.3.1


