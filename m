Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7114B5FA374
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:39:03 +0200 (CEST)
Received: from localhost ([::1]:43702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxg6-0001oD-CX
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwd8-0003jP-Pz
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:31:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwcr-0007Q6-7F
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:31:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lSdj0c5Xx/hwF/JVH5if+X58Jg6X9O17WP0jnK/PzJ0=;
 b=BEmAjY6ZjsIqS7rPxVS1iI307t8XHUlEKY/T0a5SG2FkZhfW0I8XW/BjyDvDqhdDqLRbZx
 GEiKP/zBmuNv9oepiIt19jUgYRyjZsWSznYMslQEOwg4GUSHtAEmLPeOm3tewPb+RAOpgn
 ibkQGxuj6E+Tm+McabUNz5H1cPpL+0g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-417-hRhkOg_INRWJC3AaT9hWCg-1; Mon, 10 Oct 2022 13:31:35 -0400
X-MC-Unique: hRhkOg_INRWJC3AaT9hWCg-1
Received: by mail-wr1-f69.google.com with SMTP id
 h17-20020adfaa91000000b0022e9f2245c8so2080739wrc.19
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lSdj0c5Xx/hwF/JVH5if+X58Jg6X9O17WP0jnK/PzJ0=;
 b=xQTAsGhgr+oZc+5y2Lgn4S62LeFP44ZT9Bv1LJQxF571wB3Dss0+18oKJVBuAV7QG4
 0iHN7Y7hibFh1p5t5YY+Cc4d4ZqzacipmRD2nBV9twIG9IP2aTZlTL1QpG6W81rFz+PD
 3ZWxfuVTz3VrzwZ9lPpdKTbRuty4JjV6LdZJA7XWw5SvPH5Vhvfu1nTJA9dd6GmASxef
 a4zWAOVpT+dMz0FxbMeGApBOJVYjaDkzBc7W8czvCwCb9utkvKAHbNwsGnzvuOzHeeRh
 Dhb7icart7MOsKRNkcHb8OWh5CMmZm56dwPM4iTEx1uWkOihhcGS93/8AwQuS5TWDP4z
 xuEQ==
X-Gm-Message-State: ACrzQf1E0Rin0P1pOnViRV0TIqJ2REyi5j8UWe6diwXByuAjgXpsWTvK
 Qea/UQB5l+dylNa/EyFpESUM+UMplQmbxOQRfpEV5aFXlmFrFldVNqIWBJVdELS1Q6JrWn6JHeD
 +j4pQ3H5FQ4K6qtwH6HZGQ/CI8n7Jr5hzrgjOxTe9Om0Xq1WaetJQ4BuyAOmd
X-Received: by 2002:a05:600c:3b8b:b0:3c0:a1a7:bd1e with SMTP id
 n11-20020a05600c3b8b00b003c0a1a7bd1emr17844401wms.159.1665423093630; 
 Mon, 10 Oct 2022 10:31:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4eOEa1YHARkh1ufpZIO1P0DO0MiAKMyazfi1tR/WKnFP76Q0NRl/+X25xtCZ5QYHygMerAow==
X-Received: by 2002:a05:600c:3b8b:b0:3c0:a1a7:bd1e with SMTP id
 n11-20020a05600c3b8b00b003c0a1a7bd1emr17844380wms.159.1665423093318; 
 Mon, 10 Oct 2022 10:31:33 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 d18-20020adffbd2000000b0022860e8ae7csm9563259wrs.77.2022.10.10.10.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:31:32 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:31:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Hal Martin <hal.martin@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 38/55] hw/smbios: support for type 8 (port connector)
Message-ID: <20221010172813.204597-39-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hal Martin <hal.martin@gmail.com>

PATCH v1: add support for SMBIOS type 8 to qemu
PATCH v2: incorporate patch v1 feedback and add smbios type=8 to qemu-options

internal_reference: internal reference designator
external_reference: external reference designator
connector_type: hex value for port connector type (see SMBIOS 7.9.2)
port_type: hex value for port type (see SMBIOS 7.9.3)

After studying various vendor implementationsi (Dell, Lenovo, MSI),
the value of internal connector type was hard-coded to 0x0 (None).

Example usage:
-smbios type=8,internal_reference=JUSB1,external_reference=USB1,connector_type=0x12,port_type=0x10 \
-smbios type=8,internal_reference=JAUD1,external_reference="Audio Jack",connector_type=0x1f,port_type=0x1d \
-smbios type=8,internal_reference=LAN,external_reference=Ethernet,connector_type=0x0b,port_type=0x1f \
-smbios type=8,internal_reference=PS2,external_reference=Mouse,connector_type=0x0f,port_type=0x0e \
-smbios type=8,internal_reference=PS2,external_reference=Keyboard,connector_type=0x0f,port_type=0x0d

Signed-off-by: Hal Martin <hal.martin@gmail.com>

Message-Id: <20220812135153.17859-1-hal.martin@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/firmware/smbios.h | 10 ++++++
 hw/smbios/smbios.c           | 63 ++++++++++++++++++++++++++++++++++++
 qemu-options.hx              |  2 ++
 3 files changed, 75 insertions(+)

diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
index 4b7ad77a44..e7d386f7c8 100644
--- a/include/hw/firmware/smbios.h
+++ b/include/hw/firmware/smbios.h
@@ -189,6 +189,16 @@ struct smbios_type_4 {
     uint16_t processor_family2;
 } QEMU_PACKED;
 
+/* SMBIOS type 8 - Port Connector Information */
+struct smbios_type_8 {
+    struct smbios_structure_header header;
+    uint8_t internal_reference_str;
+    uint8_t internal_connector_type;
+    uint8_t external_reference_str;
+    uint8_t external_connector_type;
+    uint8_t port_type;
+} QEMU_PACKED;
+
 /* SMBIOS type 11 - OEM strings */
 struct smbios_type_11 {
     struct smbios_structure_header header;
diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 4c9f664830..51437ca09f 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -111,6 +111,13 @@ static struct {
     .processor_id = 0,
 };
 
+struct type8_instance {
+    const char *internal_reference, *external_reference;
+    uint8_t connector_type, port_type;
+    QTAILQ_ENTRY(type8_instance) next;
+};
+static QTAILQ_HEAD(, type8_instance) type8 = QTAILQ_HEAD_INITIALIZER(type8);
+
 static struct {
     size_t nvalues;
     char **values;
@@ -337,6 +344,29 @@ static const QemuOptDesc qemu_smbios_type4_opts[] = {
     { /* end of list */ }
 };
 
+static const QemuOptDesc qemu_smbios_type8_opts[] = {
+    {
+        .name = "internal_reference",
+        .type = QEMU_OPT_STRING,
+        .help = "internal reference designator",
+    },
+    {
+        .name = "external_reference",
+        .type = QEMU_OPT_STRING,
+        .help = "external reference designator",
+    },
+    {
+        .name = "connector_type",
+        .type = QEMU_OPT_NUMBER,
+        .help = "connector type",
+    },
+    {
+        .name = "port_type",
+        .type = QEMU_OPT_NUMBER,
+        .help = "port type",
+    },
+};
+
 static const QemuOptDesc qemu_smbios_type11_opts[] = {
     {
         .name = "value",
@@ -718,6 +748,26 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
     smbios_type4_count++;
 }
 
+static void smbios_build_type_8_table(void)
+{
+    unsigned instance = 0;
+    struct type8_instance *t8;
+
+    QTAILQ_FOREACH(t8, &type8, next) {
+        SMBIOS_BUILD_TABLE_PRE(8, T0_BASE + instance, true);
+
+        SMBIOS_TABLE_SET_STR(8, internal_reference_str, t8->internal_reference);
+        SMBIOS_TABLE_SET_STR(8, external_reference_str, t8->external_reference);
+        /* most vendors seem to set this to None */
+        t->internal_connector_type = 0x0;
+        t->external_connector_type = t8->connector_type;
+        t->port_type = t8->port_type;
+
+        SMBIOS_BUILD_TABLE_POST;
+        instance++;
+    }
+}
+
 static void smbios_build_type_11_table(void)
 {
     char count_str[128];
@@ -1030,6 +1080,7 @@ void smbios_get_tables(MachineState *ms,
             smbios_build_type_4_table(ms, i);
         }
 
+        smbios_build_type_8_table();
         smbios_build_type_11_table();
 
 #define MAX_DIMM_SZ (16 * GiB)
@@ -1348,6 +1399,18 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
                            UINT16_MAX);
             }
             return;
+        case 8:
+            if (!qemu_opts_validate(opts, qemu_smbios_type8_opts, errp)) {
+                return;
+            }
+            struct type8_instance *t;
+            t = g_new0(struct type8_instance, 1);
+            save_opt(&t->internal_reference, opts, "internal_reference");
+            save_opt(&t->external_reference, opts, "external_reference");
+            t->connector_type = qemu_opt_get_number(opts, "connector_type", 0);
+            t->port_type = qemu_opt_get_number(opts, "port_type", 0);
+            QTAILQ_INSERT_TAIL(&type8, t, next);
+            return;
         case 11:
             if (!qemu_opts_validate(opts, qemu_smbios_type11_opts, errp)) {
                 return;
diff --git a/qemu-options.hx b/qemu-options.hx
index 95b998a13b..c0bb74655c 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2572,6 +2572,8 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
     "              [,asset=str][,part=str][,max-speed=%d][,current-speed=%d]\n"
     "              [,processor-id=%d]\n"
     "                specify SMBIOS type 4 fields\n"
+    "-smbios type=8[,external_reference=str][,internal_reference=str][,connector_type=%d][,port_type=%d]\n"
+    "                specify SMBIOS type 8 fields\n"
     "-smbios type=11[,value=str][,path=filename]\n"
     "                specify SMBIOS type 11 fields\n"
     "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
-- 
MST


