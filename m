Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1519A4CFBE0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:49:49 +0100 (CET)
Received: from localhost ([::1]:33804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAw0-00018l-48
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:49:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRAD4-0002Nu-Lp
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRAD2-0002tG-OK
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WM8DbqbTKSLQVyBrsakCaCO02eOzlZ2Ph3Cq4l91luQ=;
 b=Fk7L1xsuoFABnrVbdckvJDWgUGzno+EXJkviE3t3FymWxUwwrPB9hCGEbpVapB/T6ZF1i0
 EpFKbHvTB/trqgaIRzKjWh9e74s3c6FGk9Xd/MWiEQSk0DOvoZe0Ce8HnKOjsMQzb0fNUW
 ImDvgrvkg9el5ZkNNF/ogKZu67G0RjI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-AQgf7U94MFGkg0z8cPhvGg-1; Mon, 07 Mar 2022 05:03:18 -0500
X-MC-Unique: AQgf7U94MFGkg0z8cPhvGg-1
Received: by mail-ej1-f72.google.com with SMTP id
 hr26-20020a1709073f9a00b006d6d1ee8cf8so6682218ejc.19
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:03:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WM8DbqbTKSLQVyBrsakCaCO02eOzlZ2Ph3Cq4l91luQ=;
 b=TdcHLUav1POQpPN/7f8rKlpSPhkSDudxQdN3LnzvbnLtmhwcHf4HssanY1ETywdBTN
 NBjxOkoTZ+lSNIYwLPzWHzsIhDESVM1RGgS205FBL6bT5TmFMbgQFexUW6lCm1mpyj6z
 dhZiWhr+lpT8SkjHPGFdVgXgO+dx5hivwF+JVbl0qkDsHLSCy8JpQBJrC99KOTYBnWS8
 MYhh0We/Ltq1TZdC92MaMVx1xAJQvqo6pg38W936K1kQRbuUGJ06wvs0MFIuSGDWjYg3
 ZYwk083wbvSF0RRAcY50knff6FsZvEAalNYRvX2DJd7G7qjTswSyvOJEufUd1PjwEtA5
 /qcQ==
X-Gm-Message-State: AOAM533D8DPxjd7mowaR/oMWWlMTXwo85aFNVmVEkK/z3Cap0VRRu0lw
 Xj2STiKapWGmQQqgHWk/22gSB1LiL7yrRQxTCtyZFwHFVKsXdWEJUa6SMexRnrP9ergtGDR7sB+
 6a0rU1hRv0/LvFlR4roe3gPUZIofajkIs3jG0ujsavJxkSngflfCd3MRh4Hum
X-Received: by 2002:a17:907:3f95:b0:6d3:feb2:ef88 with SMTP id
 hr21-20020a1709073f9500b006d3feb2ef88mr8631282ejc.480.1646647396496; 
 Mon, 07 Mar 2022 02:03:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzG9SGHzriGbKcfGLF7857rC+AsQ8yrnEBnDQ1yQpvQrPGtA3Smhd8lmItzGXaMNlh4BDG4eA==
X-Received: by 2002:a17:907:3f95:b0:6d3:feb2:ef88 with SMTP id
 hr21-20020a1709073f9500b006d3feb2ef88mr8631255ejc.480.1646647396138; 
 Mon, 07 Mar 2022 02:03:16 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 c1-20020a170906762100b006d00ae72b0csm4506501ejn.221.2022.03.07.02.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:03:15 -0800 (PST)
Date: Mon, 7 Mar 2022 05:03:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 38/47] hw/smbios: Add table 4 parameter, "processor-id"
Message-ID: <20220307100058.449628-39-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Titus Rwantare <titusr@google.com>, Patrick Venture <venture@google.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Peter Foley <pefoley@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Patrick Venture <venture@google.com>

This parameter is to be used in the processor_id entry in the type 4
table.

This parameter is set as optional and if left will use the values from
the CPU model.

This enables hiding the host information from the guest and allowing AMD
VMs to run pretending to be Intel for some userspace software concerns.

Reviewed-by: Peter Foley <pefoley@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220125163118.1011809-1-venture@google.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/smbios/smbios.c | 19 ++++++++++++++++---
 qemu-options.hx    |  3 ++-
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 1f8d5c252f..60349ee402 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -104,9 +104,11 @@ static struct {
     const char *sock_pfx, *manufacturer, *version, *serial, *asset, *part;
     uint64_t max_speed;
     uint64_t current_speed;
+    uint64_t processor_id;
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
@@ -683,8 +689,13 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
     t->processor_type = 0x03; /* CPU */
     t->processor_family = 0x01; /* Other */
     SMBIOS_TABLE_SET_STR(4, processor_manufacturer_str, type4.manufacturer);
-    t->processor_id[0] = cpu_to_le32(smbios_cpuid_version);
-    t->processor_id[1] = cpu_to_le32(smbios_cpuid_features);
+    if (type4.processor_id == 0) {
+        t->processor_id[0] = cpu_to_le32(smbios_cpuid_version);
+        t->processor_id[1] = cpu_to_le32(smbios_cpuid_features);
+    } else {
+        t->processor_id[0] = cpu_to_le32((uint32_t)type4.processor_id);
+        t->processor_id[1] = cpu_to_le32(type4.processor_id >> 32);
+    }
     SMBIOS_TABLE_SET_STR(4, processor_version_str, type4.version);
     t->voltage = 0;
     t->external_clock = cpu_to_le16(0); /* Unknown */
@@ -1323,6 +1334,8 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
             save_opt(&type4.serial, opts, "serial");
             save_opt(&type4.asset, opts, "asset");
             save_opt(&type4.part, opts, "part");
+            /* If the value is 0, it will take the value from the CPU model. */
+            type4.processor_id = qemu_opt_get_number(opts, "processor-id", 0);
             type4.max_speed = qemu_opt_get_number(opts, "max-speed",
                                                   DEFAULT_CPU_SPEED);
             type4.current_speed = qemu_opt_get_number(opts, "current-speed",
diff --git a/qemu-options.hx b/qemu-options.hx
index 094a6c1d7c..5ce0ada75e 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2537,6 +2537,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
     "                specify SMBIOS type 3 fields\n"
     "-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str]\n"
     "              [,asset=str][,part=str][,max-speed=%d][,current-speed=%d]\n"
+    "              [,processor-id=%d]\n"
     "                specify SMBIOS type 4 fields\n"
     "-smbios type=11[,value=str][,path=filename]\n"
     "                specify SMBIOS type 11 fields\n"
@@ -2562,7 +2563,7 @@ SRST
 ``-smbios type=3[,manufacturer=str][,version=str][,serial=str][,asset=str][,sku=str]``
     Specify SMBIOS type 3 fields
 
-``-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str][,asset=str][,part=str]``
+``-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str][,asset=str][,part=str][,processor-id=%d]``
     Specify SMBIOS type 4 fields
 
 ``-smbios type=11[,value=str][,path=filename]``
-- 
MST


