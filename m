Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8892A486D4F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 23:42:04 +0100 (CET)
Received: from localhost ([::1]:34394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5bSN-0008Vs-43
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 17:42:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3L27XYQcKCn4xgpvwtgiqqing.eqosgow-fgxgnpqpipw.qti@flex--venture.bounces.google.com>)
 id 1n5bQn-0007lN-Rp
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:40:26 -0500
Received: from [2607:f8b0:4864:20::349] (port=44976
 helo=mail-ot1-x349.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3L27XYQcKCn4xgpvwtgiqqing.eqosgow-fgxgnpqpipw.qti@flex--venture.bounces.google.com>)
 id 1n5bQj-0004AH-FA
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:40:22 -0500
Received: by mail-ot1-x349.google.com with SMTP id
 c22-20020a9d67d6000000b00567f3716bdbso976568otn.11
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 14:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=F0QDLO0GPf+mFBoIBX3s2DEYPjSNlRaYLj2xMqk8eAE=;
 b=litDGxXdBuf1dXcQ1RezLbrREnEXdyxERDhNutZ/bvXlbUSl2a7065UEf2Mw7Mzf+P
 TojWu5hX9oioTMx2uvXUEZpTIzAYepmb8zrBb780kzU35ODAs4IWjyUFNyHV3Ip8s9If
 i8IXNwgt9GlDfC2HH7Hy44ghs8aqQRnpTiWIIHLWMRjhuQSr20admEk3B18T+ZtSn2RV
 clVOVqggJfU2WqH8GqauiBm4A2/X0UVWjM+iLVy4hHzyWDHawE6kPl8Zqs96m9asp+R1
 Snkkw/6EeUm+T3U678pwbMVsbwALY6skt98yLSjFVqBz9v+RNPZNy5b3cj1eJN+Jz+Pn
 kQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=F0QDLO0GPf+mFBoIBX3s2DEYPjSNlRaYLj2xMqk8eAE=;
 b=1AH0ReHizmG4xaoJIpfg5KdOEu2iGeOIsjZtsVhZIo3uGbqqy0/L8/a8xOtXQ4X19g
 0NS1Wm1bS1s7mFwgcVtfWPDI3T0cTDY+VMmB9tEVIApP2ZGZgWUUBsxzikjvYPKBPAEv
 /DgE1mi1o7SVNw9xxYANJXk38zJBlLiiUfCzVKMcwPnn4D5KsZvO8G9Gwj1PmWzHfjio
 nKqfIaJuttrIZD7rqWEivdI2sadCsO29lQTlduXJgKC9HhVQvqRMw6bqBVlMy/RhEMQo
 eQvvRoBkTiW9gySZDb2oZFpN4EZVtVxynrnXbmTAUy3D18UJs33/pLmoY48z3GaRpF+L
 Pssw==
X-Gm-Message-State: AOAM531QQqfvpzSQdnQTvGSYyVKTk3hhdDtT0CuCIOSiseX4sQuSoSmo
 akUYQ26yxu8FYw3HwxCmE6fHoNv1iOSY
X-Google-Smtp-Source: ABdhPJyDiX3jzUPQ+DQnjFctvSphbKRZQt9B3gSiG2N9G3oetez4me7k96F74esi7cNezUjIDXscwu3+2uim
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:9986:338a:477f:1df7])
 (user=venture job=sendgmr) by 2002:a25:f803:: with SMTP id
 u3mr1355168ybd.38.1641508399966; Thu, 06 Jan 2022 14:33:19 -0800 (PST)
Date: Thu,  6 Jan 2022 14:33:16 -0800
Message-Id: <20220106223316.3661625-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH] hw/smbios: Add table 4 parameter, "processor-id"
From: Patrick Venture <venture@google.com>
To: mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca
Cc: qemu-devel@nongnu.org, Patrick Venture <venture@google.com>, 
 Peter Foley <pefoley@google.com>, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::349
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::349;
 envelope-from=3L27XYQcKCn4xgpvwtgiqqing.eqosgow-fgxgnpqpipw.qti@flex--venture.bounces.google.com;
 helo=mail-ot1-x349.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

This parameter is to be used in the processor_id lower 32-bit entry in
the type 4 table.  The upper 32-bits represent the features for the CPU.
This patch leaves those as 0 when the lower 32-bits are set.

This parameter is set as optional and if left will use the values from
the CPU model.

This enables hiding the host information from the guest and allowing AMD
VMs to run pretending to be Intel for some userspace software concerns.

Reviewed-by: Peter Foley <pefoley@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
 hw/smbios/smbios.c | 19 ++++++++++++++++---
 qemu-options.hx    |  1 +
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 7397e56737..0553ee0b17 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -104,9 +104,11 @@ static struct {
     const char *sock_pfx, *manufacturer, *version, *serial, *asset, *part;
     uint64_t max_speed;
     uint64_t current_speed;
+    uint32_t processor_id;
 } type4 = {
     .max_speed = DEFAULT_CPU_SPEED,
-    .current_speed = DEFAULT_CPU_SPEED
+    .current_speed = DEFAULT_CPU_SPEED,
+    .processor_id = 0,
 };
 
 static struct {
@@ -327,6 +329,10 @@ static const QemuOptDesc qemu_smbios_type4_opts[] = {
         .name = "part",
         .type = QEMU_OPT_STRING,
         .help = "part number",
+    }, {
+        .name = "processor-id",
+        .type = QEMU_OPT_NUMBER,
+        .help = "processor id",
     },
     { /* end of list */ }
 };
@@ -669,8 +675,13 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
     t->processor_type = 0x03; /* CPU */
     t->processor_family = 0x01; /* Other */
     SMBIOS_TABLE_SET_STR(4, processor_manufacturer_str, type4.manufacturer);
-    t->processor_id[0] = cpu_to_le32(smbios_cpuid_version);
-    t->processor_id[1] = cpu_to_le32(smbios_cpuid_features);
+    if (type4.processor_id == 0) {
+        t->processor_id[0] = cpu_to_le32(smbios_cpuid_version);
+        t->processor_id[1] = cpu_to_le32(smbios_cpuid_features);
+    } else {
+        t->processor_id[0] = cpu_to_le32(type4.processor_id);
+        t->processor_id[1] = 0;
+    }
     SMBIOS_TABLE_SET_STR(4, processor_version_str, type4.version);
     t->voltage = 0;
     t->external_clock = cpu_to_le16(0); /* Unknown */
@@ -1292,6 +1303,8 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
             save_opt(&type4.serial, opts, "serial");
             save_opt(&type4.asset, opts, "asset");
             save_opt(&type4.part, opts, "part");
+            /* If the value is 0, it will take the value from the CPU model. */
+            type4.processor_id = qemu_opt_get_number(opts, "processor-id", 0);
             type4.max_speed = qemu_opt_get_number(opts, "max-speed",
                                                   DEFAULT_CPU_SPEED);
             type4.current_speed = qemu_opt_get_number(opts, "current-speed",
diff --git a/qemu-options.hx b/qemu-options.hx
index ec90505d84..3c51b6cf8f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2527,6 +2527,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
     "                specify SMBIOS type 3 fields\n"
     "-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str]\n"
     "              [,asset=str][,part=str][,max-speed=%d][,current-speed=%d]\n"
+    "              [,processor-id=%d]\n"
     "                specify SMBIOS type 4 fields\n"
     "-smbios type=11[,value=str][,path=filename]\n"
     "                specify SMBIOS type 11 fields\n"
-- 
2.34.1.448.ga2b2bfdf31-goog


