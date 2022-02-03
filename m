Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278B14A84FA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 14:16:26 +0100 (CET)
Received: from localhost ([::1]:45108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFbyK-0007ZZ-QI
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 08:16:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nFbsN-00062i-Bu
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 08:10:15 -0500
Received: from [2607:f8b0:4864:20::1032] (port=33642
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nFbsI-0001My-VM
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 08:10:14 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 cq9-20020a17090af98900b001b8262fe2d5so3980793pjb.0
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 05:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VVEhAJ4R93/nCF4cOzEL7tQzRDyNJIL1M34Qe5YvW+M=;
 b=ERXxQN8F6/oy1WhLonvT+AUGDJhJdTftfbUB1K0H1XyyoAn0UmqZUqU8MhY/ffKYoy
 SPvY+3Dh/Swd6D6l9/xWGzrFSgphO3X3wI1lXQfSYRZWFuhxFned1FcgleS31InJwNNy
 ZgH83CLJPFM6xHiOqlNcoEp+PKdpRbf1DfbERzPSX6xS59Zg/n2RKVgBYMiUM9HrdrNk
 uJ4jsdAXpgXq9O5Feq2K2H4pdZI6aKGJFlgv/3iE0lqJFabezHh4D0l/pTylDL3q0dyH
 NN00Tl0GW0hnGWlQaGmrCYgnDo8dUkQB4ziIerCUHRC7IoWGauB5IEMDA3HG8Pi7T0Q3
 WyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VVEhAJ4R93/nCF4cOzEL7tQzRDyNJIL1M34Qe5YvW+M=;
 b=WWaZ2qeEiK0XElunZF3HpOwIIO+RbxwSeU88E4BhOC5nORzvjtmMFVhcBFLQa6Tz8F
 +uXKQeDsmx9ut3Jvwh0bJFarWNTnK6/H1ZFzEYJFciSARWCET5O8R+221iMG3lrEX8Mv
 EfhlunPTeHJKtG13LHZYeVPsfHPsJiYmwcYnPure64IfUmKgDH/QjmrQhHJwJI1ulS+E
 E38DOMkCSk6oQfNRXAOWApTB2G1dqNnN1wMm20QeNFRu5FF+FuzT9703BZv31ovH5HVN
 1jcUknhPkdeMhN1gznInh8IFF5zU3nfiUuOkHGUBeDLC9/P8lk4Oe361NRe9MlDQZBiT
 +1eQ==
X-Gm-Message-State: AOAM5335VOeknnbb4WClu+myU/4UEAHQOKp1Dk2tiZsmmpfjPnOE3UJ4
 vit6b8Am0Iz/1vnATkp0GuZnSiAo1+QpO7tq
X-Google-Smtp-Source: ABdhPJyxq9XFmoPHAoP9NH83z42YesJXHluSixXcJ2U0QF5d9aERRieaIDkyGrQZWAkLsgim1RRrzA==
X-Received: by 2002:a17:902:f549:: with SMTP id
 h9mr35342076plf.62.1643893808455; 
 Thu, 03 Feb 2022 05:10:08 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.110.152])
 by smtp.googlemail.com with ESMTPSA id
 e17sm18214327pfv.101.2022.02.03.05.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 05:10:07 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v2] hw/smbios: fix memory corruption for large guests due to
 handle overlap
Date: Thu,  3 Feb 2022 18:39:57 +0530
Message-Id: <20220203130957.2248949-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

The current implementation of smbios table handle assignment does not leave
enough gap between tables 17 and table 19 for guests with larger than 8 TB of
memory. This change fixes this issue. This change calculates if additional
space between the tables need to be set aside and then reserves that additional
space.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2023977

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/smbios/smbios.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

changelog:
v2: make sure we do not overlap table 19 and table 32 addresses.

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 6013df1698..ccac4c1b3a 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -743,13 +743,16 @@ static void smbios_build_type_16_table(unsigned dimm_cnt)
 
 #define MAX_T17_STD_SZ 0x7FFF /* (32G - 1M), in Megabytes */
 #define MAX_T17_EXT_SZ 0x80000000 /* 2P, in Megabytes */
+#define T17_BASE 0x1100
+#define T19_BASE 0x1300
+#define T32_BASE 0x2000
 
 static void smbios_build_type_17_table(unsigned instance, uint64_t size)
 {
     char loc_str[128];
     uint64_t size_mb;
 
-    SMBIOS_BUILD_TABLE_PRE(17, 0x1100 + instance, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(17, T17_BASE + instance, true); /* required */
 
     t->physical_memory_array_handle = cpu_to_le16(0x1000); /* Type 16 above */
     t->memory_error_information_handle = cpu_to_le16(0xFFFE); /* Not provided */
@@ -785,12 +788,13 @@ static void smbios_build_type_17_table(unsigned instance, uint64_t size)
     SMBIOS_BUILD_TABLE_POST;
 }
 
-static void smbios_build_type_19_table(unsigned instance,
+static void smbios_build_type_19_table(unsigned instance, unsigned offset,
                                        uint64_t start, uint64_t size)
 {
     uint64_t end, start_kb, end_kb;
 
-    SMBIOS_BUILD_TABLE_PRE(19, 0x1300 + instance, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(19, T19_BASE + \
+                           offset + instance, true); /* required */
 
     end = start + size - 1;
     assert(end > start);
@@ -814,7 +818,7 @@ static void smbios_build_type_19_table(unsigned instance,
 
 static void smbios_build_type_32_table(void)
 {
-    SMBIOS_BUILD_TABLE_PRE(32, 0x2000, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(32, T32_BASE, true); /* required */
 
     memset(t->reserved, 0, 6);
     t->boot_status = 0; /* No errors detected */
@@ -982,7 +986,7 @@ void smbios_get_tables(MachineState *ms,
                        uint8_t **anchor, size_t *anchor_len,
                        Error **errp)
 {
-    unsigned i, dimm_cnt;
+    unsigned i, dimm_cnt, offset;
 
     if (smbios_legacy) {
         *tables = *anchor = NULL;
@@ -1012,6 +1016,19 @@ void smbios_get_tables(MachineState *ms,
 
         dimm_cnt = QEMU_ALIGN_UP(current_machine->ram_size, MAX_DIMM_SZ) / MAX_DIMM_SZ;
 
+        /*
+         * The offset determines if we need to keep additional space betweeen
+         * table 17 and table 19 so that they do not overlap. For example,
+         * for a VM with larger than 8 TB guest memory and DIMM size of 16 GiB,
+         * the default space between the two tables (T19_BASE - T17_BASE = 512)
+         * is not enough.
+         */
+        offset = (dimm_cnt > (T19_BASE - T17_BASE)) ? \
+                 dimm_cnt - (T19_BASE - T17_BASE) : 0;
+
+        /* we need to make sure table 19 and table 32 do not overlap */
+        assert((mem_array_size + offset) < (T32_BASE - T19_BASE));
+
         smbios_build_type_16_table(dimm_cnt);
 
         for (i = 0; i < dimm_cnt; i++) {
@@ -1019,7 +1036,7 @@ void smbios_get_tables(MachineState *ms,
         }
 
         for (i = 0; i < mem_array_size; i++) {
-            smbios_build_type_19_table(i, mem_array[i].address,
+            smbios_build_type_19_table(i, offset, mem_array[i].address,
                                        mem_array[i].length);
         }
 
-- 
2.25.1


