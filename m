Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AF3371EAE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:32:42 +0200 (CEST)
Received: from localhost ([::1]:38156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcQz-0005tm-Nw
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldc8a-0002FA-Fb
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:13:40 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldc8Y-000459-Fy
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:13:40 -0400
Received: by mail-wr1-x436.google.com with SMTP id t18so6384011wry.1
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gDycxe8WIhEZVnSndKn65sM4fYtaRiCKpUhaU9eIkw4=;
 b=Xdi0EjLr49Iri7yDOLRuB7tsVmto4YRsXf9LTbbwcONtfIBV1O8OZ9nRctN3eKtE9P
 uWskvroDJM1Kj0HMOQVBSPOvFRuLB7ncDirNgPChPkr3dFowhx6jZsgejBdlrRSZEcg5
 Y390t4syK86tC0yowk/1fCt1OuKOSYVMcbP0UEZ2X8Zd+0ZwAOT1gww4ay+b7s0xbzGm
 cZ65f1J1Zg/4w2LY8Yq7i8S8l+1wbj155kVWyNnwYAqPngNoyuv9p6DvG+FYs6+cLSVJ
 1IBzwOD+BYC1Qzcc+VliAQrHjRGSGZfJGTXhr+HOq+Q3vemKh5KxBuZkO9f9wgq6++Aj
 xVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gDycxe8WIhEZVnSndKn65sM4fYtaRiCKpUhaU9eIkw4=;
 b=UPOAXFsPiNG7eDMB9+h4uFf+vDMsw29SqTWiRNG5uEjq9MRf1lavIOq9u1tqpRe0I3
 KZGKWSdD1jNbQRjoGq/auowq3CjmnBJPwfi8kJCqXjVQ7HgdwgeuV3zEsF7x64o3xRLy
 c6JFUU6ffnqpk2JiEaGRvbweG8jkyeXPqAo9HSPXx+8uoeBcq8NP2kMz1n8ZYU1frzs8
 /yWmSafYFnOiummngIdVltlGQGDkoQpHE2HVwZ+6Ur9zaOuWGWAoGKbixENSEjQCzLg6
 baivGjhGb5GB3Beo/PhlqjOrnFjhJb4CH7TRF18bZB5MmmKSb2q3G5EiqQquPBWBQz4s
 RX1A==
X-Gm-Message-State: AOAM5334fgzm6d05CsyRQ26UMjfevEWuNlyiBLdFIgP9MegolPhIaJ8Y
 84oGovU9i1kLOFQSPMUAT8/ZidIBzQHFsQ==
X-Google-Smtp-Source: ABdhPJxN0cMf5kVQ77cUh2PnvCc1kA7k1x3ArwzraF/n6RrTRLObT6jZT7PCPS3hBjeuHILHQ+NaqQ==
X-Received: by 2002:a05:6000:136b:: with SMTP id
 q11mr26107841wrz.350.1620062016882; 
 Mon, 03 May 2021 10:13:36 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id n3sm208602wmi.7.2021.05.03.10.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 10:13:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/6] hw/sparc/sun4m: Move each sun4m_hwdef definition in
 its class_init
Date: Mon,  3 May 2021 19:13:03 +0200
Message-Id: <20210503171303.822501-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503171303.822501-1-f4bug@amsat.org>
References: <20210503171303.822501-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the sun4m_hwdefs[] array by moving assigning the
structure fields directly in each machine class_init()
function.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sparc/sun4m.c | 248 ++++++++++++++++++++++-------------------------
 1 file changed, 118 insertions(+), 130 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 956216591b0..263732b9041 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -1138,9 +1138,22 @@ enum {
     ss600mp_id,
 };
 
-static const struct sun4m_hwdef sun4m_hwdefs[] = {
-    /* SS-5 */
-    {
+static void sun4m_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->init = sun4m_hw_init;
+    mc->block_default_type = IF_SCSI;
+    mc->default_boot_order = "c";
+    mc->default_display = "tcx";
+    mc->default_ram_id = "sun4m.ram";
+}
+
+static void ss5_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+    static const struct sun4m_hwdef ss5_hwdef = {
         .iommu_base   = 0x10000000,
         .iommu_pad_base = 0x10004000,
         .iommu_pad_len  = 0x0fffb000,
@@ -1165,9 +1178,19 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = ss5_id,
         .iommu_version = 0x05000000,
         .max_mem = 0x10000000,
-    },
-    /* SS-10 */
-    {
+    };
+
+    mc->desc = "Sun4m platform, SPARCstation 5";
+    mc->is_default = true;
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
+    smc->hwdef = &ss5_hwdef;
+}
+
+static void ss10_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+    static const struct sun4m_hwdef ss10_hwdef = {
         .iommu_base   = 0xfe0000000ULL,
         .tcx_base     = 0xe20000000ULL,
         .slavio_base  = 0xff0000000ULL,
@@ -1190,9 +1213,19 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = ss10_id,
         .iommu_version = 0x03000000,
         .max_mem = 0xf00000000ULL,
-    },
-    /* SS-600MP */
-    {
+    };
+
+    mc->desc = "Sun4m platform, SPARCstation 10";
+    mc->max_cpus = 4;
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
+    smc->hwdef = &ss10_hwdef;
+}
+
+static void ss600mp_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+    static const struct sun4m_hwdef ss600mp_hwdef = {
         .iommu_base   = 0xfe0000000ULL,
         .tcx_base     = 0xe20000000ULL,
         .slavio_base  = 0xff0000000ULL,
@@ -1213,9 +1246,19 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = ss600mp_id,
         .iommu_version = 0x01000000,
         .max_mem = 0xf00000000ULL,
-    },
-    /* SS-20 */
-    {
+    };
+
+    mc->desc = "Sun4m platform, SPARCserver 600MP";
+    mc->max_cpus = 4;
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
+    smc->hwdef = &ss600mp_hwdef;
+}
+
+static void ss20_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+    static const struct sun4m_hwdef ss20_hwdef = {
         .iommu_base   = 0xfe0000000ULL,
         .tcx_base     = 0xe20000000ULL,
         .slavio_base  = 0xff0000000ULL,
@@ -1254,9 +1297,19 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = ss20_id,
         .iommu_version = 0x13000000,
         .max_mem = 0xf00000000ULL,
-    },
-    /* Voyager */
-    {
+    };
+
+    mc->desc = "Sun4m platform, SPARCstation 20";
+    mc->max_cpus = 4;
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
+    smc->hwdef = &ss20_hwdef;
+}
+
+static void voyager_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+    static const struct sun4m_hwdef voyager_hwdef = {
         .iommu_base   = 0x10000000,
         .tcx_base     = 0x50000000,
         .slavio_base  = 0x70000000,
@@ -1277,9 +1330,18 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = vger_id,
         .iommu_version = 0x05000000,
         .max_mem = 0x10000000,
-    },
-    /* LX */
-    {
+    };
+
+    mc->desc = "Sun4m platform, SPARCstation Voyager";
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
+    smc->hwdef = &voyager_hwdef;
+}
+
+static void ss_lx_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+    static const struct sun4m_hwdef ss_lx_hwdef = {
         .iommu_base   = 0x10000000,
         .iommu_pad_base = 0x10004000,
         .iommu_pad_len  = 0x0fffb000,
@@ -1301,9 +1363,18 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = lx_id,
         .iommu_version = 0x04000000,
         .max_mem = 0x10000000,
-    },
-    /* SS-4 */
-    {
+    };
+
+    mc->desc = "Sun4m platform, SPARCstation LX";
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
+    smc->hwdef = &ss_lx_hwdef;
+}
+
+static void ss4_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+    static const struct sun4m_hwdef ss4_hwdef = {
         .iommu_base   = 0x10000000,
         .tcx_base     = 0x50000000,
         .cs_base      = 0x6c000000,
@@ -1325,9 +1396,18 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = ss4_id,
         .iommu_version = 0x05000000,
         .max_mem = 0x10000000,
-    },
-    /* SPARCClassic */
-    {
+    };
+
+    mc->desc = "Sun4m platform, SPARCstation 4";
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
+    smc->hwdef = &ss4_hwdef;
+}
+
+static void scls_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+    static const struct sun4m_hwdef scls_hwdef = {
         .iommu_base   = 0x10000000,
         .tcx_base     = 0x50000000,
         .slavio_base  = 0x70000000,
@@ -1348,9 +1428,18 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = scls_id,
         .iommu_version = 0x05000000,
         .max_mem = 0x10000000,
-    },
-    /* SPARCbook */
-    {
+    };
+
+    mc->desc = "Sun4m platform, SPARCClassic";
+    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
+    smc->hwdef = &scls_hwdef;
+}
+
+static void sbook_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+    static const struct sun4m_hwdef sbook_hwdef = {
         .iommu_base   = 0x10000000,
         .tcx_base     = 0x50000000, /* XXX */
         .slavio_base  = 0x70000000,
@@ -1371,112 +1460,11 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .machine_id = sbook_id,
         .iommu_version = 0x05000000,
         .max_mem = 0x10000000,
-    },
-};
-
-static void sun4m_machine_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-
-    mc->init = sun4m_hw_init;
-    mc->block_default_type = IF_SCSI;
-    mc->default_boot_order = "c";
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
-}
-
-static void ss5_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
-
-    mc->desc = "Sun4m platform, SPARCstation 5";
-    mc->is_default = true;
-    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
-    smc->hwdef = &sun4m_hwdefs[0];
-}
-
-static void ss10_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
-
-    mc->desc = "Sun4m platform, SPARCstation 10";
-    mc->max_cpus = 4;
-    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
-    smc->hwdef = &sun4m_hwdefs[1];
-}
-
-static void ss600mp_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
-
-    mc->desc = "Sun4m platform, SPARCserver 600MP";
-    mc->max_cpus = 4;
-    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
-    smc->hwdef = &sun4m_hwdefs[2];
-}
-
-static void ss20_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
-
-    mc->desc = "Sun4m platform, SPARCstation 20";
-    mc->max_cpus = 4;
-    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
-    smc->hwdef = &sun4m_hwdefs[3];
-}
-
-static void voyager_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
-
-    mc->desc = "Sun4m platform, SPARCstation Voyager";
-    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
-    smc->hwdef = &sun4m_hwdefs[4];
-}
-
-static void ss_lx_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
-
-    mc->desc = "Sun4m platform, SPARCstation LX";
-    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
-    smc->hwdef = &sun4m_hwdefs[5];
-}
-
-static void ss4_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
-
-    mc->desc = "Sun4m platform, SPARCstation 4";
-    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
-    smc->hwdef = &sun4m_hwdefs[6];
-}
-
-static void scls_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
-
-    mc->desc = "Sun4m platform, SPARCClassic";
-    mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
-    smc->hwdef = &sun4m_hwdefs[7];
-}
-
-static void sbook_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
+    };
 
     mc->desc = "Sun4m platform, SPARCbook";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
-    smc->hwdef = &sun4m_hwdefs[8];
+    smc->hwdef = &sbook_hwdef;
 }
 
 static const TypeInfo sun4m_machine_types[] = {
-- 
2.26.3


