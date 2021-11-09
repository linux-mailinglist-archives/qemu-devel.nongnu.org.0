Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCA644AE1A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 13:54:13 +0100 (CET)
Received: from localhost ([::1]:50558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkQdg-0002lW-HH
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 07:54:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkQc7-0000Hb-9j
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 07:52:35 -0500
Received: from mail.loongson.cn ([114.242.206.163]:37730 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkQc4-0006KF-6r
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 07:52:35 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cx+dD5bophXJYBAA--.3628S3;
 Tue, 09 Nov 2021 20:52:13 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/30] target/loongarch: Update README
Date: Tue,  9 Nov 2021 20:51:40 +0800
Message-Id: <1636462329-1716-2-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636462329-1716-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1636462329-1716-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Cx+dD5bophXJYBAA--.3628S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AFW3Zr48tr1rWry5Ar43ZFb_yoW8WFy7pr
 43Z343Krs8X39rJ3yfWa4rWr1Y9ws3GF43Za1ftr109a1Dtw1vqw1vqas8tFy7Aw1fJFWY
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 i.qemu@xen0n.name, richard.henderson@linaro.org, laurent@vivier.eu,
 peterx@redhat.com, f4bug@amsat.org, yangxiaojuan@loongson.cn,
 alistair.francis@wdc.com, maobibo@loongson.cn, gaosong@loongson.cn,
 pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk, chenhuacai@loongson.cn,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mainly introduce how to run the softmmu

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/README | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/target/loongarch/README b/target/loongarch/README
index 09f809cf80..b307bd4091 100644
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
+The vmlinux and ramdisk binary can get from :
+    git clone https://github.com/yangxiaojuan-loongson/qemu-binary
 
 - Note.
   We can get the latest LoongArch documents or LoongArch tools at https://github.com/loongson/
-- 
2.27.0


