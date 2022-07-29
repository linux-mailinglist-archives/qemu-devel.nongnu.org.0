Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C91584CC5
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 09:41:15 +0200 (CEST)
Received: from localhost ([::1]:49760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHKcU-00060E-Sj
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 03:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oHKSG-0008Gr-7H
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 03:30:45 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47412 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oHKSD-0004t2-M1
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 03:30:39 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn9GLjONiJ2lBAA--.46172S3; 
 Fri, 29 Jul 2022 15:30:21 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v1 1/2] hw/loongarch: Rename file 'loongson3.XXX' to 'virt.XXX'
Date: Fri, 29 Jul 2022 15:30:17 +0800
Message-Id: <20220729073018.27037-2-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220729073018.27037-1-yangxiaojuan@loongson.cn>
References: <20220729073018.27037-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn9GLjONiJ2lBAA--.46172S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGryUWrWrJFW8tw1rWFyrtFb_yoW5Gr17pr
 y3uFn8KrW8Jr9rArWkW34fXF1DJrnrCr12va12y340krsrXw1UZr1rtasrZF12qa4rJFW0
 vF95G34UXa10qw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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

1. Rename 'loongson3.c' to 'virt.c' and change the meson.build file.
2. Rename 'loongson3.rst' to 'virt.rst'.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 MAINTAINERS                          | 2 +-
 hw/loongarch/meson.build             | 2 +-
 hw/loongarch/{loongson3.c => virt.c} | 0
 target/loongarch/README              | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename hw/loongarch/{loongson3.c => virt.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6af9cd985c..5ce4227ff6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1129,7 +1129,7 @@ Virt
 M: Xiaojuan Yang <yangxiaojuan@loongson.cn>
 M: Song Gao <gaosong@loongson.cn>
 S: Maintained
-F: docs/system/loongarch/loongson3.rst
+F: docs/system/loongarch/virt.rst
 F: configs/targets/loongarch64-softmmu.mak
 F: configs/devices/loongarch64-softmmu/default.mak
 F: hw/loongarch/
diff --git a/hw/loongarch/meson.build b/hw/loongarch/meson.build
index 6a2a1b18e5..c0421502ab 100644
--- a/hw/loongarch/meson.build
+++ b/hw/loongarch/meson.build
@@ -2,7 +2,7 @@ loongarch_ss = ss.source_set()
 loongarch_ss.add(files(
     'fw_cfg.c',
 ))
-loongarch_ss.add(when: 'CONFIG_LOONGARCH_VIRT', if_true: [files('loongson3.c'), fdt])
+loongarch_ss.add(when: 'CONFIG_LOONGARCH_VIRT', if_true: [files('virt.c'), fdt])
 loongarch_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-build.c'))
 
 hw_arch += {'loongarch': loongarch_ss}
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/virt.c
similarity index 100%
rename from hw/loongarch/loongson3.c
rename to hw/loongarch/virt.c
diff --git a/target/loongarch/README b/target/loongarch/README
index 9f5edd10c8..1823375d04 100644
--- a/target/loongarch/README
+++ b/target/loongarch/README
@@ -15,7 +15,7 @@
   3A5000 support multiple interrupt cascading while here we just emulate the extioi interrupt
   cascading. LS7A1000 host bridge support multiple devices, such as sata, gmac, uart, rtc
   and so on. But we just realize the rtc. Others use the qemu common devices. It does not affect
-  the general use. We also introduced the emulation of devices at docs/system/loongarch/loongson3.rst.
+  the general use. We also introduced the emulation of devices at docs/system/loongarch/virt.rst.
 
   This version only supports running binary files in ELF format, and does not depend on BIOS and kernel file.
   You can compile the test program with 'make & make check-tcg' and run the test case with the following command:
-- 
2.31.1


