Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BD81C2B52
	for <lists+qemu-devel@lfdr.de>; Sun,  3 May 2020 12:25:36 +0200 (CEST)
Received: from localhost ([::1]:48360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVBoV-00028X-G7
	for lists+qemu-devel@lfdr.de; Sun, 03 May 2020 06:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1jVBnJ-0001TG-AX
 for qemu-devel@nongnu.org; Sun, 03 May 2020 06:24:21 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:51136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1jVBnI-00070P-D7
 for qemu-devel@nongnu.org; Sun, 03 May 2020 06:24:21 -0400
Received: by mail-pj1-x1043.google.com with SMTP id t9so2385283pjw.0
 for <qemu-devel@nongnu.org>; Sun, 03 May 2020 03:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3jIcKseLRlDrsTfsSCco9E5+WjcQguD48G/bWDLSlaA=;
 b=lyeXgDMSqWOGdHs8q3AGTYhbaNEvUlnrvK6LbqRJ/ovza3yIyMaR4vpW9hhqcQc+FY
 7Dg3ZIL5A6M8iRxbxZUHt3b/Eynj0cRyxsD3PugUqF+8QnrGCQ9Uj3ZECChi9AK45SpS
 cPiJkL+5tHRq7ax+KoQhwhpwW6qCEIh0Hg4iFP6KGkKlhHZpPdCzKpyvYaJgKgUG0U0E
 KHPYs/RZ/cL830LASSt1e9oY05MZsbYXXx43K9x7yavaXZ7m42chqLDOduNfkxt6gUk8
 ACfMWLIgyPHMvHeVi5/JP1qGtONR/82FB6cbRElPsLO1ZSQY49FO82C66gcJnyLNGQc2
 vVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3jIcKseLRlDrsTfsSCco9E5+WjcQguD48G/bWDLSlaA=;
 b=cASQXe4gpBXj+en29VwTCtHgAeBrdLv9oVae1rlydlUykFBakxMHSWY/92gvaXjVbu
 0iGYJ+YtIEkCTmebcBLKEk1YaHADSaPXMXEGFTYUTQKbW7ghReqVRm6D4Ra7VNN9bzSc
 WtEpHE4L7JDEEw+MvYghJdnFj3QWfK7g0J05/VR1yhPH9p9Xwv0kMNoP3PcZVvaUbhps
 qoXMyE4j+deKHDhOH1fccMPF0B5hxyGXJ1E2mgtjtvqZRZIC138ZoE/WcXiiOCLq/Uj0
 ZJiuKXkq42iV5xZtLiPLN1Uzg2SIWI6+0ihnMK6k9uPSFBh/EHR6N1VLhGiVvhXP9a5y
 f5QA==
X-Gm-Message-State: AGi0PuZXiLnWGID6op2gteutbDXkOVGwctn3CN9zAhuKZg3dSDgEXNT3
 gUhXBC7uUVcdyy9DfL+2O10=
X-Google-Smtp-Source: APiQypI71j+EA3Iq2DujYIsdL7muioyshOUx0vYJCWOeDjVENPAl9rJiMeuzbJrkYWj4Nc76uwr5Aw==
X-Received: by 2002:a17:90a:6fe4:: with SMTP id
 e91mr10845265pjk.28.1588501458934; 
 Sun, 03 May 2020 03:24:18 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com.
 [34.92.144.28])
 by smtp.gmail.com with ESMTPSA id a12sm6173654pfr.28.2020.05.03.03.24.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 May 2020 03:24:18 -0700 (PDT)
From: Huacai Chen <zltjiangshi@gmail.com>
X-Google-Original-From: Huacai Chen <chenhc@lemote.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Subject: [PATCH for-5.1 V3 2/7] hw/mips: Implement the kvm_type() hook in
 MachineClass
Date: Sun,  3 May 2020 18:20:16 +0800
Message-Id: <1588501221-1205-3-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1588501221-1205-1-git-send-email-chenhc@lemote.com>
References: <1588501221-1205-1-git-send-email-chenhc@lemote.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=zltjiangshi@gmail.com; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Huacai Chen <chenhuacai@gmail.com>, Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MIPS has two types of KVM: TE & VZ, and TE is the default type. Now we
can't create a VZ guest in QEMU because it lacks the kvm_type() hook in
MachineClass. Besides, libvirt uses a null-machine to detect the kvm
capability, so by default it will return "KVM not supported" on a VZ
platform. Thus, null-machine also need the kvm_type() hook.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/core/Makefile.objs  |  2 +-
 hw/core/null-machine.c |  4 ++++
 hw/mips/Makefile.objs  |  2 +-
 hw/mips/common.c       | 31 +++++++++++++++++++++++++++++++
 include/hw/mips/mips.h |  3 +++
 5 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 hw/mips/common.c

diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index 1d540ed..b5672f4 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -17,11 +17,11 @@ common-obj-$(CONFIG_SOFTMMU) += vm-change-state-handler.o
 common-obj-$(CONFIG_SOFTMMU) += qdev-properties-system.o
 common-obj-$(CONFIG_SOFTMMU) += sysbus.o
 common-obj-$(CONFIG_SOFTMMU) += machine.o
-common-obj-$(CONFIG_SOFTMMU) += null-machine.o
 common-obj-$(CONFIG_SOFTMMU) += loader.o
 common-obj-$(CONFIG_SOFTMMU) += machine-hmp-cmds.o
 common-obj-$(CONFIG_SOFTMMU) += numa.o
 common-obj-$(CONFIG_SOFTMMU) += clock-vmstate.o
+obj-$(CONFIG_SOFTMMU) += null-machine.o
 obj-$(CONFIG_SOFTMMU) += machine-qmp-cmds.o
 
 common-obj-$(CONFIG_EMPTY_SLOT) += empty_slot.o
diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index cb47d9d..94a36f9 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -17,6 +17,7 @@
 #include "sysemu/sysemu.h"
 #include "exec/address-spaces.h"
 #include "hw/core/cpu.h"
+#include "hw/mips/mips.h"
 
 static void machine_none_init(MachineState *mch)
 {
@@ -50,6 +51,9 @@ static void machine_none_machine_init(MachineClass *mc)
     mc->max_cpus = 1;
     mc->default_ram_size = 0;
     mc->default_ram_id = "ram";
+#ifdef TARGET_MIPS
+    mc->kvm_type = mips_kvm_type;
+#endif
 }
 
 DEFINE_MACHINE("none", machine_none_machine_init)
diff --git a/hw/mips/Makefile.objs b/hw/mips/Makefile.objs
index 525809a..2f7795b 100644
--- a/hw/mips/Makefile.objs
+++ b/hw/mips/Makefile.objs
@@ -1,4 +1,4 @@
-obj-y += addr.o mips_int.o
+obj-y += addr.o common.o mips_int.o
 obj-$(CONFIG_R4K) += mips_r4k.o
 obj-$(CONFIG_MALTA) += gt64xxx_pci.o mips_malta.o
 obj-$(CONFIG_MIPSSIM) += mips_mipssim.o
diff --git a/hw/mips/common.c b/hw/mips/common.c
new file mode 100644
index 0000000..0e33bd0
--- /dev/null
+++ b/hw/mips/common.c
@@ -0,0 +1,31 @@
+/*
+ * Common MIPS routines
+ *
+ * Copyright (c) 2020 Huacai Chen (chenhc@lemote.com)
+ * This code is licensed under the GNU GPL v2.
+ */
+
+#include <linux/kvm.h>
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "hw/boards.h"
+#include "hw/mips/mips.h"
+#include "sysemu/kvm_int.h"
+
+int mips_kvm_type(MachineState *machine, const char *vm_type)
+{
+    int r;
+    KVMState *s = KVM_STATE(machine->accelerator);
+
+    r = kvm_check_extension(s, KVM_CAP_MIPS_VZ);
+    if (r > 0) {
+        return KVM_VM_MIPS_VZ;
+    }
+
+    r = kvm_check_extension(s, KVM_CAP_MIPS_TE);
+    if (r > 0) {
+        return KVM_VM_MIPS_TE;
+    }
+
+    return -1;
+}
diff --git a/include/hw/mips/mips.h b/include/hw/mips/mips.h
index 0af4c3d..2ac0580 100644
--- a/include/hw/mips/mips.h
+++ b/include/hw/mips/mips.h
@@ -20,4 +20,7 @@ void rc4030_dma_write(void *dma, uint8_t *buf, int len);
 
 DeviceState *rc4030_init(rc4030_dma **dmas, IOMMUMemoryRegion **dma_mr);
 
+/* common.c */
+int mips_kvm_type(MachineState *machine, const char *vm_type);
+
 #endif
-- 
2.7.0


