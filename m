Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859C34C158D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 15:38:47 +0100 (CET)
Received: from localhost ([::1]:34938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMsn0-0004DH-Hp
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 09:38:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMsiT-0001B3-6P
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 09:34:05 -0500
Received: from [2607:f8b0:4864:20::102a] (port=44990
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMsiR-0005ae-4T
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 09:34:04 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 cp23-20020a17090afb9700b001bbfe0fbe94so2882224pjb.3
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 06:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bHSDtq9nX65sHhUSEmWXPKE+bo44P0ZIROyPp3M0lPU=;
 b=td/UCLr6RPhGQ+dkKIbUYNRhKqAKVIE6JrPWORmsOiFs6u7INy5/Lo0samVmzk0fdq
 injJRmdSlFsIV6y/z+4CHgoHLu6OlK5H3bQYrAoL6Om9g1h+YzOTC0vg7nr2tYQSX+qI
 26eQapXC3zf58jk1tQ4Dyk/domByHjXnPc5VEtmcEkLlSQ4JxwEGxjEOscPrdgIHG3CP
 yXtegUKkvvff0IgTnTHXfPFW131ql15lv1rG5+pOrgb5mVcO6/0cIj6noF/3loDXinaW
 NpC00s0p/iFfxkWVnvjcpXCGAw5Uzz6YnGbeMKKACIkwx6HNYGkxkBgebm/XbtiDuE+r
 33Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bHSDtq9nX65sHhUSEmWXPKE+bo44P0ZIROyPp3M0lPU=;
 b=PEe+FhUyRR2a2d1ndvW01NMNwuG46x9SY+FKAhfMSRzGn2g/Lc1VNj1CYUswrnqqEX
 43VM1ThQUfaGHC/QyplZTmLkdSbOtbrB1/LovLpY5QTvAWONkqqFq+sQYTIylCJOWBR9
 EUYIHcYQRfVJ5DmygAlQ7I1z83/6ZFnyKhTy9faY0Bgp00tW71MIuogudT2dWVezMmBk
 AxrgUgcUAqgbwGUIN87hx/80jW5SxGUO3ZutTxYyBg622g3MFt6WbVTNsA5Wvvf0vZ1K
 VfPS2Z7Sa2OcQIJC+KO8XIP+7JPwKLNO5qDVADzfp2qxbaf0ZDS3xjJEODNSpM4fzosO
 FKdg==
X-Gm-Message-State: AOAM5327qybsZ57gKJqTPF5UqZQKGCDjcFQB/yCVY3TlSyDWzgzRirB7
 RLJivKnN6gwqFNzSsOPDLHln0lsSVdrEOQ==
X-Google-Smtp-Source: ABdhPJx73vUg9V2zssI3dpTLZLqb2yp8+cGIaieIPxcriYumh2GIEDcdNnNrL9k47U9+K/Uqmo/TFA==
X-Received: by 2002:a17:902:e5ca:b0:14f:3a3d:44a5 with SMTP id
 u10-20020a170902e5ca00b0014f3a3d44a5mr28009498plf.139.1645626841566; 
 Wed, 23 Feb 2022 06:34:01 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.242.81])
 by smtp.googlemail.com with ESMTPSA id
 l21sm22929583pfu.120.2022.02.23.06.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 06:34:01 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, mst@redhat.com, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 5/7] hw/smbios: code cleanup - use macro definitions for table
 header handles
Date: Wed, 23 Feb 2022 20:03:20 +0530
Message-Id: <20220223143322.927136-6-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223143322.927136-1-ani@anisinha.ca>
References: <20220223143322.927136-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This is a minor cleanup. Using macro definitions makes the code more
readable. It is at once clear which tables use which handle numbers in their
header. It also makes it easy to calculate the gaps between the numbers and
update them if needed.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/smbios/smbios.c | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 6013df1698..56b412ce35 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -549,9 +549,23 @@ bool smbios_skip_table(uint8_t type, bool required_table)
     return true;
 }
 
+#define T0_BASE 0x000
+#define T1_BASE 0x100
+#define T2_BASE 0x200
+#define T3_BASE 0x300
+#define T4_BASE 0x400
+#define T11_BASE 0xe00
+
+#define T16_BASE 0x1000
+#define T17_BASE 0x1100
+#define T19_BASE 0x1300
+#define T32_BASE 0x2000
+#define T41_BASE 0x2900
+#define T127_BASE 0x7F00
+
 static void smbios_build_type_0_table(void)
 {
-    SMBIOS_BUILD_TABLE_PRE(0, 0x000, false); /* optional, leave up to BIOS */
+    SMBIOS_BUILD_TABLE_PRE(0, T0_BASE, false); /* optional, leave up to BIOS */
 
     SMBIOS_TABLE_SET_STR(0, vendor_str, type0.vendor);
     SMBIOS_TABLE_SET_STR(0, bios_version_str, type0.version);
@@ -599,7 +613,7 @@ static void smbios_encode_uuid(struct smbios_uuid *uuid, QemuUUID *in)
 
 static void smbios_build_type_1_table(void)
 {
-    SMBIOS_BUILD_TABLE_PRE(1, 0x100, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(1, T1_BASE, true); /* required */
 
     SMBIOS_TABLE_SET_STR(1, manufacturer_str, type1.manufacturer);
     SMBIOS_TABLE_SET_STR(1, product_name_str, type1.product);
@@ -619,7 +633,7 @@ static void smbios_build_type_1_table(void)
 
 static void smbios_build_type_2_table(void)
 {
-    SMBIOS_BUILD_TABLE_PRE(2, 0x200, false); /* optional */
+    SMBIOS_BUILD_TABLE_PRE(2, T2_BASE, false); /* optional */
 
     SMBIOS_TABLE_SET_STR(2, manufacturer_str, type2.manufacturer);
     SMBIOS_TABLE_SET_STR(2, product_str, type2.product);
@@ -637,7 +651,7 @@ static void smbios_build_type_2_table(void)
 
 static void smbios_build_type_3_table(void)
 {
-    SMBIOS_BUILD_TABLE_PRE(3, 0x300, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(3, T3_BASE, true); /* required */
 
     SMBIOS_TABLE_SET_STR(3, manufacturer_str, type3.manufacturer);
     t->type = 0x01; /* Other */
@@ -662,7 +676,7 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
 {
     char sock_str[128];
 
-    SMBIOS_BUILD_TABLE_PRE(4, 0x400 + instance, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(4, T4_BASE + instance, true); /* required */
 
     snprintf(sock_str, sizeof(sock_str), "%s%2x", type4.sock_pfx, instance);
     SMBIOS_TABLE_SET_STR(4, socket_designation_str, sock_str);
@@ -702,7 +716,7 @@ static void smbios_build_type_11_table(void)
         return;
     }
 
-    SMBIOS_BUILD_TABLE_PRE(11, 0xe00, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(11, T11_BASE, true); /* required */
 
     snprintf(count_str, sizeof(count_str), "%zu", type11.nvalues);
     t->count = type11.nvalues;
@@ -722,7 +736,7 @@ static void smbios_build_type_16_table(unsigned dimm_cnt)
 {
     uint64_t size_kb;
 
-    SMBIOS_BUILD_TABLE_PRE(16, 0x1000, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(16, T16_BASE, true); /* required */
 
     t->location = 0x01; /* Other */
     t->use = 0x03; /* System memory */
@@ -749,7 +763,7 @@ static void smbios_build_type_17_table(unsigned instance, uint64_t size)
     char loc_str[128];
     uint64_t size_mb;
 
-    SMBIOS_BUILD_TABLE_PRE(17, 0x1100 + instance, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(17, T17_BASE + instance, true); /* required */
 
     t->physical_memory_array_handle = cpu_to_le16(0x1000); /* Type 16 above */
     t->memory_error_information_handle = cpu_to_le16(0xFFFE); /* Not provided */
@@ -790,7 +804,7 @@ static void smbios_build_type_19_table(unsigned instance,
 {
     uint64_t end, start_kb, end_kb;
 
-    SMBIOS_BUILD_TABLE_PRE(19, 0x1300 + instance, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(19, T19_BASE + instance, true); /* required */
 
     end = start + size - 1;
     assert(end > start);
@@ -814,7 +828,7 @@ static void smbios_build_type_19_table(unsigned instance,
 
 static void smbios_build_type_32_table(void)
 {
-    SMBIOS_BUILD_TABLE_PRE(32, 0x2000, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(32, T32_BASE, true); /* required */
 
     memset(t->reserved, 0, 6);
     t->boot_status = 0; /* No errors detected */
@@ -828,7 +842,7 @@ static void smbios_build_type_41_table(Error **errp)
     struct type41_instance *t41;
 
     QTAILQ_FOREACH(t41, &type41, next) {
-        SMBIOS_BUILD_TABLE_PRE(41, 0x2900 + instance, true);
+        SMBIOS_BUILD_TABLE_PRE(41, T41_BASE + instance, true);
 
         SMBIOS_TABLE_SET_STR(41, reference_designation_str, t41->designation);
         t->device_type = t41->kind;
@@ -871,7 +885,7 @@ static void smbios_build_type_41_table(Error **errp)
 
 static void smbios_build_type_127_table(void)
 {
-    SMBIOS_BUILD_TABLE_PRE(127, 0x7F00, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(127, T127_BASE, true); /* required */
     SMBIOS_BUILD_TABLE_POST;
 }
 
-- 
2.25.1


