Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEEE4882C1
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 10:21:49 +0100 (CET)
Received: from localhost ([::1]:58778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n67v2-0005cu-6F
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 04:21:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1n67oN-0003sP-Qx
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 04:14:55 -0500
Received: from mail.loongson.cn ([114.242.206.163]:38796 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1n67oL-0000qc-OD
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 04:14:55 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxKMrrVdlhvLMAAA--.1341S3;
 Sat, 08 Jan 2022 17:14:32 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 01/30] target/loongarch: Update README
Date: Sat,  8 Jan 2022 04:13:50 -0500
Message-Id: <20220108091419.2027710-2-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxKMrrVdlhvLMAAA--.1341S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AFWxCrWkKw1UAFWkJr47Arb_yoW8Cryrpr
 43u345Grs5J39rJ39aga45Wr4Y9rs3GF43Xa1xtry09FsrJw1vvw18tas8tF17Zw1fKFy0
 qry8Ww1UW3W5XaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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
Cc: philmd@redhat.com, mark.cave-ayland@ilande.co.uk,
 richard.henderson@linaro.org, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mainly introduce how to run the softmmu

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/README | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/loongarch/README b/target/loongarch/README
index d5780c5918..337ba55f33 100644
--- a/target/loongarch/README
+++ b/target/loongarch/README
@@ -72,6 +72,31 @@
       ./qemu-loongarch64  /opt/clfs/usr/bin/pwd
       ...
 
+- Softmmu emulation
+
+  Add support softmmu emulation support in the following series patches.
+  Mainly emulate a virt 3A5000 board and ls7a bridge that is not exactly
+  the same as the host. Kernel code and uefi code is on the github.
+  All required binaries can get from github for test.
+
+  1.Download kernel and the cross-tools.(vmlinux)
+
+      https://github.com/loongson/linux/tree/loongarch-next
+      https://github.com/loongson/build-tools/releases/latest/download/loongarch64-clfs-20211202-cross-tools.tar.xz
+
+  2.Download uefi code.(loongarch_bios.bin)
+
+      https://github.com/loongson/edk2/tree/LoongArch
+      https://github.com/loongson/edk2-platforms
+
+  3.Download the clfs-system and make a ramdisk with busybox.(ramdisk)
+
+  4.Run with command,eg:
+
+   ./build/qemu-system-loongarch64 -m 4G -smp 4 --cpu Loongson-3A5000 --machine loongson3-ls7a -kernel ./vmlinux -initrd ./ramdisk  -append "root=/dev/ram console=ttyS0,115200 rdinit=/sbin/init loglevel=8" -monitor tcp::4000,server,nowait -nographic
+
+The vmlinux, ramdisk and uefi binary loongarch_bios.bin can get from :
+    git clone https://github.com/yangxiaojuan-loongson/qemu-binary
 
 - Note.
   We can get the latest LoongArch documents or LoongArch tools at https://github.com/loongson/
-- 
2.27.0


