Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F24140AEA1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:09:27 +0200 (CEST)
Received: from localhost ([::1]:39392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8Bi-00023v-9L
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mQ83k-0005J4-15
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:01:12 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57502 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mQ83Y-0007oh-Ea
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:01:11 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxheXvnEBhNJ0GAA--.21668S3; 
 Tue, 14 Sep 2021 21:00:55 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/21] target/loongarch: Add README
Date: Tue, 14 Sep 2021 21:00:11 +0800
Message-Id: <1631624431-30658-2-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
References: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxheXvnEBhNJ0GAA--.21668S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWUuF18ZrW7Kw18Kw4xCrg_yoW5tr13pF
 1fuFyfKrWUX3sxKrnag343WF1Fyws3Gr1xWanIkw1rC3sxtryqkw1fta4jqF17Jwn5trWv
 vrykCr1UW3WUCa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 KHOP_HELO_FCRDNS=0.399, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, peterx@redhat.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 maobibo@loongson.cn, pbonzini@redhat.com, bmeng.cn@gmail.com,
 alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch give an introduction to the LoongArch target.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: XiaoJuan Yang <yangxiaojuan@loongson.cn>
---
 MAINTAINERS             |  5 ++++
 target/loongarch/README | 76 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 target/loongarch/README

diff --git a/MAINTAINERS b/MAINTAINERS
index 6c20634..ad372a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -210,6 +210,11 @@ F: disas/hppa.c
 F: hw/net/*i82596*
 F: include/hw/net/lasi_82596.h
 
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


