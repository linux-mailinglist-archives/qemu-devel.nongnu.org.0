Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6B13ED05E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 10:34:11 +0200 (CEST)
Received: from localhost ([::1]:54734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFY4Q-0007k9-BM
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 04:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mFY2v-0006uN-Ei
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 04:32:37 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:34535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mFY2t-0006u5-1B
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 04:32:37 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 gz13-20020a17090b0ecdb0290178c0e0ce8bso18467658pjb.1
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 01:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sM9vNorpMxSOaMgybPYzDF5RdJdftabH4hI2b4P6GBQ=;
 b=gLxkZfFPq1+Wv2UksekMGQwqlff3fMOUZzbSor2Rk3K4SznKWVy07XjCxbEBqgcZxu
 5dATjK0ArlSv8PMLMVqvq2BqwqPCklxHRZ2ZrewOk1Cvms5w7Rk39onMuLfPJheDxCwt
 XZonAQbpxffQ7Yr7U0m8WYubsmM0m3OAxuiyUJSrqta7UPU2o+1WMTvF0yL/bW1Mb1Ss
 ixbdHFjs4fR/+HSt4Vlxf+0/6o41BY7JpE2M7neldchov8G5CdWnQMwQX5y9J+o+3XZu
 PoQMlF/pdajEefAlU4QTc1oy1OiwNJ6eTexN7SQtrTw0WgZ/Pkf0xFkyXpTB3FqujEna
 6nMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sM9vNorpMxSOaMgybPYzDF5RdJdftabH4hI2b4P6GBQ=;
 b=Hr8Al8eJCDFP22SeSOWCNGXdlgm0qR5SvfIkO2pKYKSeFzEVqk37iX633yKcF0mGG1
 o+If5VsUGdR2NA/lPase22S69ANkP0jm8/1cXpWxgb1rcjmV+JlSw9j1kgWdkWa/7EL9
 mll/ZyCGEICYS1lrDkQ10PB3Ur0E4EyOeW7elHzuVRLuEf8Wg+1vQfMAiPJtEciOzn0/
 5HrjmiDzz4SHYQ8JVQXABZEtm3I33aD0x6Z8fjACwF5qElIdsa1VnOU38Im/9+vPLQO3
 AiOhiuwiR1HLKuphcExFzZt+GVaK8uGcXjIPWc56SBtOiOfQsjerl9Ua4cmP7hztsQyJ
 vyVg==
X-Gm-Message-State: AOAM530PJMMB2harSll9Z7LxLFTrpYMpLhE/mjMHUCodBRvPXvkzxlP5
 xLvnkHLtcbbPVkJjGyLG4/3oVhtKuxaM7g==
X-Google-Smtp-Source: ABdhPJzzTGFxwQkt7KaoMFya1nCRlkVyg+6I6YUu0+IZ7pfs4FYeSQRNfBQg1ZtSfZW4IXZjyReVpw==
X-Received: by 2002:a65:5c84:: with SMTP id a4mr15285344pgt.264.1629102752632; 
 Mon, 16 Aug 2021 01:32:32 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.199.67])
 by smtp.googlemail.com with ESMTPSA id 20sm13686468pgg.36.2021.08.16.01.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 01:32:32 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/acpi: define PIIX4 acpi pci hotplug property strings at a
 single place
Date: Mon, 16 Aug 2021 14:02:14 +0530
Message-Id: <20210816083214.105740-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, philmd@redhat.com,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have "acpi-pci-hotplug-with-bridge-support" PIIX4 PM property being
used for both q35 and i440fx machine types, it is better that we defined this
property string at a single place within a header file like other PIIX4
properties. We can then use this single definition at all the places that needs
it instead of duplicating the string everywhere. While at it, this change also
adds a definition for "acpi-root-pci-hotplug" PIIX4 PM property and uses
this definition at all places that were formally using the string value.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/ich9.c         | 2 +-
 hw/acpi/piix4.c        | 4 ++--
 hw/i386/acpi-build.c   | 4 ++--
 hw/i386/pc.c           | 4 ++--
 hw/i386/pc_q35.c       | 2 +-
 include/hw/acpi/acpi.h | 2 ++
 6 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 778e27b659..1ee2ba2c50 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -451,7 +451,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     object_property_add_bool(obj, ACPI_PM_PROP_TCO_ENABLED,
                              ich9_pm_get_enable_tco,
                              ich9_pm_set_enable_tco);
-    object_property_add_bool(obj, "acpi-pci-hotplug-with-bridge-support",
+    object_property_add_bool(obj, ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
                              ich9_pm_get_acpi_pci_hotplug,
                              ich9_pm_set_acpi_pci_hotplug);
 }
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 48f7a1edbc..f0b5fac44a 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -647,9 +647,9 @@ static Property piix4_pm_properties[] = {
     DEFINE_PROP_UINT8(ACPI_PM_PROP_S3_DISABLED, PIIX4PMState, disable_s3, 0),
     DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_DISABLED, PIIX4PMState, disable_s4, 0),
     DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_VAL, PIIX4PMState, s4_val, 2),
-    DEFINE_PROP_BOOL("acpi-pci-hotplug-with-bridge-support", PIIX4PMState,
+    DEFINE_PROP_BOOL(ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, PIIX4PMState,
                      use_acpi_hotplug_bridge, true),
-    DEFINE_PROP_BOOL("acpi-root-pci-hotplug", PIIX4PMState,
+    DEFINE_PROP_BOOL(ACPI_PM_PROP_ACPI_PCI_ROOTHP, PIIX4PMState,
                      use_acpi_root_pci_hotplug, true),
     DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
                      acpi_memory_hotplug.is_enabled, true),
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 5d43a62eea..868195f0c3 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -267,10 +267,10 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
     qobject_unref(o);
 
     pm->pcihp_bridge_en =
-        object_property_get_bool(obj, "acpi-pci-hotplug-with-bridge-support",
+        object_property_get_bool(obj, ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
                                  NULL);
     pm->pcihp_root_en =
-        object_property_get_bool(obj, "acpi-root-pci-hotplug",
+        object_property_get_bool(obj, ACPI_PM_PROP_ACPI_PCI_ROOTHP,
                                  NULL);
 }
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c2b9d62a35..25ae3881e9 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -99,7 +99,7 @@ GlobalProperty pc_compat_6_0[] = {
     { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
     { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
     { TYPE_X86_CPU, "x-vendor-cpuid-only", "off" },
-    { "ICH9-LPC", "acpi-pci-hotplug-with-bridge-support", "off" },
+    { "ICH9-LPC", ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, "off" },
 };
 const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
 
@@ -311,7 +311,7 @@ const size_t pc_compat_2_0_len = G_N_ELEMENTS(pc_compat_2_0);
 GlobalProperty pc_compat_1_7[] = {
     PC_CPU_MODEL_IDS("1.7.0")
     { TYPE_USB_DEVICE, "msos-desc", "no" },
-    { "PIIX4_PM", "acpi-pci-hotplug-with-bridge-support", "off" },
+    { "PIIX4_PM", ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, "off" },
     { "hpet", HPET_INTCAP, "4" },
 };
 const size_t pc_compat_1_7_len = G_N_ELEMENTS(pc_compat_1_7);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 04b4a4788d..5327ad5abc 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -239,7 +239,7 @@ static void pc_q35_init(MachineState *machine)
                              OBJECT(lpc), &error_abort);
 
     acpi_pcihp = object_property_get_bool(OBJECT(lpc),
-                                          "acpi-pci-hotplug-with-bridge-support",
+                                          ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
                                           NULL);
 
     if (acpi_pcihp) {
diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
index 9e8a76f2e2..cc0d370745 100644
--- a/include/hw/acpi/acpi.h
+++ b/include/hw/acpi/acpi.h
@@ -47,6 +47,8 @@
 #define ACPI_PM_PROP_PM_IO_BASE "pm_io_base"
 #define ACPI_PM_PROP_GPE0_BLK "gpe0_blk"
 #define ACPI_PM_PROP_GPE0_BLK_LEN "gpe0_blk_len"
+#define ACPI_PM_PROP_ACPI_PCIHP_BRIDGE "acpi-pci-hotplug-with-bridge-support"
+#define ACPI_PM_PROP_ACPI_PCI_ROOTHP "acpi-root-pci-hotplug"
 
 /* PM Timer ticks per second (HZ) */
 #define PM_TIMER_FREQUENCY  3579545
-- 
2.25.1


