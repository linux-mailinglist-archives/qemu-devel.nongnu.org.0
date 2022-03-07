Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE494D0BDC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:16:41 +0100 (CET)
Received: from localhost ([::1]:55572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMan-0002LP-26
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:16:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7l-0000RS-B0
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7j-0005k0-5k
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WM8DbqbTKSLQVyBrsakCaCO02eOzlZ2Ph3Cq4l91luQ=;
 b=DtOX42zdUfefzwIlVzpfZBd4ZtdOiNKFpfAGskazWtC9CGY3n1tpdwDyRQZ6+p+f/ij7au
 ZwTmCc0m57HsyhW1f0AsXbtKXhz/G98tIzmhuCi70RNZ0+qFDk1dl2s9JeKmfND1X1lr9q
 D+9zsQ8DQ48xYHag7ffgzj4hhm6ZvBI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-Ue2FkA77PoOmTRX7iukLWw-1; Mon, 07 Mar 2022 17:46:37 -0500
X-MC-Unique: Ue2FkA77PoOmTRX7iukLWw-1
Received: by mail-ed1-f71.google.com with SMTP id
 i17-20020aa7c711000000b00415ecaefd07so7099728edq.21
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:46:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WM8DbqbTKSLQVyBrsakCaCO02eOzlZ2Ph3Cq4l91luQ=;
 b=FJydMQJY5gi87UCKxYXHGWXAKjj7o5wrET7vfg0J5YL1akMJoaX0fKpPcKvkFIj0us
 CtSCCc0n555ye3HdS3Fy8o3YCajgfT+rS6Xq2FsgEilw+XeJzucH0xKNtTec/NF9M1e7
 UbGxFDkHBgxrOmv//OZ7QjUPq+vIM1DHcinNTPxwylC10f5fW1EnROfQvZ5Hnd21owBB
 TBRbcbWTCr4NBnEZd0ilfJVyKcBSwyNGKFoPt/OuLfHeDzpLI1HybVLl1C7XhujNAjFV
 f6osZ1ctpSkH8OzWE4uEqMNaR8BtzRlccXuDA5+yavjOj0ncEaEv30mz5yYdlFQH1wmV
 ts1Q==
X-Gm-Message-State: AOAM531n0mGkuGrhVf1ylS47aHt9AiAuYbGBy2dxD22eR11/HNGuX78Q
 6MwXWVslfqBf8/f+R/rXCG8G7qDzuS5bDIBEAHZoqYdh8oK9gFGR0lzd6+XnG561PX6kz6bIdkR
 r+H59Md9jDAffHiGIWCRIxtrUBGDmuqpVaV4YKzvkc/i9Wg5zSAbM0ASU8X21
X-Received: by 2002:a05:6402:3595:b0:416:5b62:7376 with SMTP id
 y21-20020a056402359500b004165b627376mr4148080edc.107.1646693196087; 
 Mon, 07 Mar 2022 14:46:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYt3BMC0tWMZiQC0MCJSmPIsRRKn27oRMkuhRSQWYiXWf3mf8IlSGhjS1N80rPZ8HmHZwzUQ==
X-Received: by 2002:a05:6402:3595:b0:416:5b62:7376 with SMTP id
 y21-20020a056402359500b004165b627376mr4148056edc.107.1646693195839; 
 Mon, 07 Mar 2022 14:46:35 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 bw26-20020a170906c1da00b006c8aeca8febsm5203573ejb.47.2022.03.07.14.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:46:35 -0800 (PST)
Date: Mon, 7 Mar 2022 17:46:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 38/47] hw/smbios: Add table 4 parameter, "processor-id"
Message-ID: <20220307224357.682101-39-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
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


