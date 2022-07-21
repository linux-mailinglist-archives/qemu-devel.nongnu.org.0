Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA0F57CAE4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 14:46:39 +0200 (CEST)
Received: from localhost ([::1]:33968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEVZe-0007Jj-DR
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 08:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEVJP-0004Qu-5K
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:29:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEVJM-0004qs-So
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 08:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658406588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sceov1CLy0D+Gutd0UzwXapyWU3DMBeCOe8zNIq1+H8=;
 b=IBtmwWQpzGPPUnMRHH81JJdnKlMJ54oCq56U08eTzXAAbFBUSSqxmL4sVN8a5AQS5qlIZQ
 y0UKq+8eefCA6n7ztn/cznR2ro/+iyXNpsJM+ZpFQC3b/ToXTLgIZ4Jq1vs0aWtKrcY08W
 utdZO7+Kl6yL2SXWY/4JzFCa436dog0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-gn8BlLTgN3CF2Q_TH69psQ-1; Thu, 21 Jul 2022 08:29:47 -0400
X-MC-Unique: gn8BlLTgN3CF2Q_TH69psQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 z20-20020a05640240d400b0043a82d9d65fso1046176edb.0
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 05:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sceov1CLy0D+Gutd0UzwXapyWU3DMBeCOe8zNIq1+H8=;
 b=jnnFL1aO2LzLVoFLOtknUhrvc8czqomBaY+vaVDL3EpG9xJ9W1VLjfYWqRF3G3i2Iq
 rOEd9bNeTgKTIr7kuX1I3sRD38JBXSNAJpOq5boEq0+8Zj3A0o2SxZhov1l8TaJdlvJc
 deQLkSD9S9ds56PJzvg3E/f25wxOMnnnbS3+CecC63oE4oSQZvn+9ULsxqsbuqIyUXeh
 0Cr4zLRRywkC8pjuWr03ntX0adZ/EQpDp8AZnykMjch98BD8JzUm5BXxWGpgZZ7IfBpp
 MxDYbbVxRshtbEeYwMHLmDA0T67L5pDDqaYVFtMQrpfRSylAa6ikaaJBbdmyLFq43zxY
 YPUQ==
X-Gm-Message-State: AJIora/Qv4/A6ybeyG62JQqJcnda1hArh4Fx0NRwhzRQax7btnpXIhV1
 53cmahVj5c7Az935zRxx3mCqTZD2fTJi5CqshomvYDBTnKCrlr6poMzGhysuoBxgKlVFKGuKhG5
 HzY+lg67m5vdHi5N0I+fOjjf3GrcXT8yObVcKFyc/0inYbU04uOHwY5P67128FJvZLMA=
X-Received: by 2002:a17:907:2722:b0:72b:6d79:1a46 with SMTP id
 d2-20020a170907272200b0072b6d791a46mr40559978ejl.713.1658406585777; 
 Thu, 21 Jul 2022 05:29:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ukYdiFbsjdhJzyosrMfJokyXZhLE7oFKaS5eYoTuDbZXqmjlZJqtcbvNdjWUdLv5MQ1H/sdA==
X-Received: by 2002:a17:907:2722:b0:72b:6d79:1a46 with SMTP id
 d2-20020a170907272200b0072b6d791a46mr40559932ejl.713.1658406585380; 
 Thu, 21 Jul 2022 05:29:45 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 we10-20020a170907234a00b006fec4ee28d0sm801504ejb.189.2022.07.21.05.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 05:29:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 4/4] hw/i386: pass RNG seed via setup_data entry
Date: Thu, 21 Jul 2022 14:29:37 +0200
Message-Id: <20220721122937.729959-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721122937.729959-1-pbonzini@redhat.com>
References: <20220721122937.729959-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

Tiny machines optimized for fast boot time generally don't use EFI,
which means a random seed has to be supplied some other way. For this
purpose, Linux (≥5.20) supports passing a seed in the setup_data table
with SETUP_RNG_SEED, specially intended for hypervisors, kexec, and
specialized bootloaders. The linked commit shows the upstream kernel
implementation.

Link: https://git.kernel.org/tip/tip/c/68b8e9713c8
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-Id: <20220719115300.104095-1-Jason@zx2c4.com>
[Mostly rewritten to preserve guest ABI, but still starting from Jason's
 code. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/pc.c                                 |  1 +
 hw/i386/x86.c                                | 31 ++++++++++++++++++++
 include/hw/i386/x86.h                        |  2 ++
 include/standard-headers/asm-x86/bootparam.h |  1 +
 4 files changed, 35 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 774cb2bf07..d456fbb166 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -112,6 +112,7 @@ const size_t pc_compat_7_0_len = G_N_ELEMENTS(pc_compat_7_0);
 
 GlobalProperty pc_compat_6_2[] = {
     { "virtio-mem", "unplugged-inaccessible", "off" },
+    { TYPE_X86_MACHINE, "linuxboot-seed", "off" },
 };
 const size_t pc_compat_6_2_len = G_N_ELEMENTS(pc_compat_6_2);
 
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 564bf3834b..c5d01e084a 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -26,6 +26,7 @@
 #include "qemu/cutils.h"
 #include "qemu/units.h"
 #include "qemu/datadir.h"
+#include "qemu/guest-random.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/qapi-visit-common.h"
@@ -1088,6 +1089,12 @@ void x86_load_linux(X86MachineState *x86ms,
     }
     fclose(f);
 
+    if (x86ms->linuxboot_seed != ON_OFF_AUTO_OFF &&
+        (data.protocol >= 0x209 || x86ms->linuxboot_seed == ON_OFF_AUTO_ON)) {
+        void *seed = add_setup_data(&data, 32, SETUP_RNG_SEED);
+        qemu_guest_getrandom_nofail(seed, 32);
+    }
+
     /* append dtb to kernel */
     if (dtb_filename) {
         dtb_size = get_image_size(dtb_filename);
@@ -1247,6 +1254,23 @@ static void x86_machine_set_smm(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &x86ms->smm, errp);
 }
 
+static void x86_machine_get_linuxboot_seed(Object *obj, Visitor *v, const char *name,
+                                           void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+    OnOffAuto linuxboot_seed = x86ms->linuxboot_seed;
+
+    visit_type_OnOffAuto(v, name, &linuxboot_seed, errp);
+}
+
+static void x86_machine_set_linuxboot_seed(Object *obj, Visitor *v, const char *name,
+                                           void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+
+    visit_type_OnOffAuto(v, name, &x86ms->linuxboot_seed, errp);
+}
+
 bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms)
 {
     if (x86ms->acpi == ON_OFF_AUTO_OFF) {
@@ -1397,6 +1421,7 @@ static void x86_machine_initfn(Object *obj)
     x86ms->acpi = ON_OFF_AUTO_AUTO;
     x86ms->pit = ON_OFF_AUTO_AUTO;
     x86ms->pic = ON_OFF_AUTO_AUTO;
+    x86ms->linuxboot_seed = ON_OFF_AUTO_AUTO;
     x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
     x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
@@ -1435,6 +1460,12 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, X86_MACHINE_PIT,
         "Enable i8254 PIT");
 
+    object_class_property_add(oc, X86_MACHINE_LINUXBOOT_SEED, "OnOffAuto",
+        x86_machine_get_linuxboot_seed, x86_machine_set_linuxboot_seed,
+        NULL, NULL);
+    object_class_property_set_description(oc, X86_MACHINE_LINUXBOOT_SEED,
+        "Pass random number seed to -kernel Linux image");
+
     object_class_property_add(oc, X86_MACHINE_PIC, "OnOffAuto",
                               x86_machine_get_pic,
                               x86_machine_set_pic,
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 9089bdd99c..edf0f6799e 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -67,6 +67,7 @@ struct X86MachineState {
     OnOffAuto acpi;
     OnOffAuto pit;
     OnOffAuto pic;
+    OnOffAuto linuxboot_seed;
 
     char *oem_id;
     char *oem_table_id;
@@ -91,6 +92,7 @@ struct X86MachineState {
 #define X86_MACHINE_OEM_ID           "x-oem-id"
 #define X86_MACHINE_OEM_TABLE_ID     "x-oem-table-id"
 #define X86_MACHINE_BUS_LOCK_RATELIMIT  "bus-lock-ratelimit"
+#define X86_MACHINE_LINUXBOOT_SEED      "linuxboot-seed"
 
 #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
 OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
diff --git a/include/standard-headers/asm-x86/bootparam.h b/include/standard-headers/asm-x86/bootparam.h
index 072e2ed546..b2aaad10e5 100644
--- a/include/standard-headers/asm-x86/bootparam.h
+++ b/include/standard-headers/asm-x86/bootparam.h
@@ -10,6 +10,7 @@
 #define SETUP_EFI			4
 #define SETUP_APPLE_PROPERTIES		5
 #define SETUP_JAILHOUSE			6
+#define SETUP_RNG_SEED			9
 
 #define SETUP_INDIRECT			(1<<31)
 
-- 
2.36.1


