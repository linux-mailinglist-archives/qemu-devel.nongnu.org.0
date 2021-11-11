Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E3744CF20
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 02:41:27 +0100 (CET)
Received: from localhost ([::1]:37388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkz5i-0004Cg-Vv
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 20:41:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkz0D-0005bZ-2x
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:35:45 -0500
Received: from mail.loongson.cn ([114.242.206.163]:53886 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkz08-0001fp-VA
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:35:44 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9Ngc4xh9RMCAA--.4955S3;
 Thu, 11 Nov 2021 09:35:34 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 01/30] target/loongarch: Update README
Date: Thu, 11 Nov 2021 09:34:59 +0800
Message-Id: <1636594528-8175-2-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Dxr9Ngc4xh9RMCAA--.4955S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AFW3Zr48tr1rWry5Ar43ZFb_yoW8Ww1fpr
 43Zry3Krs8J39rJ3yfWa4rWr4Y9rZ3GF43Za1xtry09a1Dt34vqw1vqas8tF17Aw1fGFWY
 vFy8Wr1UW3W5Xa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mainly introduce how to run the softmmu

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/README | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/target/loongarch/README b/target/loongarch/README
index 09f809cf80..6f64bde22f 100644
--- a/target/loongarch/README
+++ b/target/loongarch/README
@@ -71,6 +71,26 @@
       ./qemu-loongarch64  /opt/clfs/usr/bin/pwd
       ...
 
+- Softmmu emulation
+
+  Add support softmmu emulation support in the following series patches.
+  Mainly emulate a virt 3A5000 board that is not exactly the same as the host.
+  Kernel code is on the github and the uefi code will be opened in the near future.
+  All required binaries can get from github for test.
+
+  1.Download kernel and the cross-tools.(vmlinux)
+
+      wget https://github.com/loongson/linux
+      wget https://github.com/loongson/build-tools/releases/latest/download/loongarch64-clfs-20210831-cross-tools.tar.xz
+
+  2.Download the clfs-system and made a ramdisk with busybox.(ramdisk)
+
+  3.Run with command,eg:
+
+   ./build/qemu-system-loongarch64 -m 4G -smp 16 --cpu Loongson-3A5000 --machine loongson7a -kernel ./vmlinux -initrd ./ramdisk  -append "root=/dev/ram console=ttyS0,115200 rdinit=/sbin/init loglevel=8" -monitor tcp::4000,server,nowait -nographic
+
+The vmlinux, ramdisk and uefi binary loongarch_bios.bin can get from :
+    git clone https://github.com/yangxiaojuan-loongson/qemu-binary
 
 - Note.
   We can get the latest LoongArch documents or LoongArch tools at https://github.com/loongson/
-- 
2.27.0


