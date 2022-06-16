Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B889C54E0C1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 14:26:26 +0200 (CEST)
Received: from localhost ([::1]:38560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1oZt-0001xO-QN
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 08:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o1oQL-0001lX-QN
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:16:33 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45690 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o1oQI-0006RI-Uy
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:16:33 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD08LH6tiaiNGAA--.9326S15; 
 Thu, 16 Jun 2022 20:16:18 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, laurent@vivier.eu, gaosong@loongson.cn,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH v17 13/13] target/loongarch: Update README
Date: Thu, 16 Jun 2022 20:16:11 +0800
Message-Id: <20220616121611.3316074-14-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616121611.3316074-1-gaosong@loongson.cn>
References: <20220616121611.3316074-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxD08LH6tiaiNGAA--.9326S15
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4xCw4fGw17XFW8Kr45KFg_yoW5JF48pr
 1fuFy3KrW8X3sxtwnxWas5uFyFqrs3Gr1aqan3tw48urZrAr9F9an3ta4ktF17Z34fXryq
 vry8Cw1UW3WUG3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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

Add linux-user emulation introduction

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/README | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/target/loongarch/README b/target/loongarch/README
index 4dcd0f1682..9f5edd10c8 100644
--- a/target/loongarch/README
+++ b/target/loongarch/README
@@ -24,9 +24,9 @@
 
     Download cross-tools.
 
-      wget https://github.com/loongson/build-tools/releases/latest/download/loongarch64-clfs-20211202-cross-tools.tar.xz
+      wget https://github.com/loongson/build-tools/releases/download/2022.05.29/loongarch64-clfs-5.0-cross-tools-gcc-full.tar.xz
 
-      tar -vxf loongarch64-clfs-20211202-cross-tools.tar.xz -C /opt
+      tar -vxf loongarch64-clfs-5.0-cross-tools-gcc-full.tar.xz -C /opt
 
     Config cross-tools env.
 
@@ -60,5 +60,40 @@
 
     ./build/qemu-system-loongarch64 -machine virt -m 4G -cpu Loongson-3A5000 -smp 1 -kernel build/tests/tcg/loongarch64-softmmu/hello -monitor none -display none -chardev file,path=hello.out,id=output -serial chardev:output
 
+- Linux-user emulation
+
+  We already support Linux user emulation. We can use LoongArch cross-tools to build LoongArch executables on X86 machines,
+  and We can also use qemu-loongarch64 to run LoongArch executables.
+
+  1. Config cross-tools env.
+
+     see System emulation.
+
+  2. Test tests/tcg/multiarch.
+
+     ./configure  --static  --prefix=/usr  --disable-werror --target-list="loongarch64-linux-user" --enable-debug
+
+     cd build
+
+     make && make check-tcg
+
+  3. Run LoongArch system basic command with loongarch-clfs-system.
+
+     - Config clfs env.
+
+       wget https://github.com/loongson/build-tools/releases/download/2022.05.29/loongarch64-clfs-system-5.0.tar.bz2
+
+       tar -vxf loongarch64-clfs-system-5.0.tar.bz2 -C /opt/clfs
+
+       cp /opt/clfs/lib64/ld-linux-loongarch-lp64d.so.1  /lib64
+
+       export LD_LIBRARY_PATH="/opt/clfs/lib64"
+
+     - Run LoongArch system basic command.
+
+       ./qemu-loongarch64  /opt/clfs/usr/bin/bash
+       ./qemu-loongarch64  /opt/clfs/usr/bin/ls
+       ./qemu-loongarch64  /opt/clfs/usr/bin/pwd
+
 - Note.
   We can get the latest LoongArch documents or LoongArch tools at https://github.com/loongson/
-- 
2.31.1


