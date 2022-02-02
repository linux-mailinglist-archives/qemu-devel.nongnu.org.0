Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0074A6AE0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 05:29:10 +0100 (CET)
Received: from localhost ([::1]:42808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF7GX-0006G3-M3
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 23:29:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nF7CD-0003qX-3q
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 23:24:41 -0500
Received: from [2607:f8b0:4864:20::1036] (port=43006
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nF7CB-0007Lg-1T
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 23:24:40 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so4784937pjb.1
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 20:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oRJJylaHjQ+ZkM8sCG79PuvEUKlM7vaTCUMFwt6rRS0=;
 b=Rpm0M9960MK6cxDM9XcVIXRpYVIo9h9hzh66rkzj8ex5H2z5Ce1YMJBVino5EVASkh
 6kPfD37jsJye2tOpjQoTVzTNiAPAVXtXR8X94kAQJ/EHBR+c7EsTZX4AOBQd9QV1UBLG
 q5BbvmjpPRb3owzThsjVeZlLbxdM1BA/hd6TXwVYJBiLSnHLd3dPS4z8RzK8l8vpYsh2
 l+SVKmiejaAExRkh3QnK6ciGJKLE6tSW+oQFaWphI4QFRmYUIgQEmhw4emzE2RhHUWjw
 BTpnJSaePQ91CLkPZUXO5SBEN6O03oGf7JDx5C8WAJeHLJ3DIBFsOjoO5/MQ+R7yZ95k
 PmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oRJJylaHjQ+ZkM8sCG79PuvEUKlM7vaTCUMFwt6rRS0=;
 b=zl65ma7wklFHMRivhxVyGfW+xjX7jsgC78/YIOxELUxzs/fG/UOpZ2YhCM+Qc2pIcf
 aoBbRc3GgMJtmqMUBpSRmTcU/pSwa1zspm3afsVGs6/lfGrIi2HK7zvqcQ3Hxvzexja2
 VJUssKHLrh8OPj4fxpV4xvrlBgJa/bq6ZEXXThP+DYIip/O86j4TzJyr7kYwlPDQj1VL
 IMhRopKwRBXfBUlELTLkLP8qa0hTiFRtmk/tuJYMDHPpEaG/btimIYR5MDPsyT7Q96tj
 S5cl2VF6LS7ra9hJYBXbFPgnlkKJ9kXOefG127N2Dm3cNrr5OAY40h1E/4xcWemQQ+Y/
 qKbw==
X-Gm-Message-State: AOAM530cWDHfrfJGM/s+pmC3+6DTIFuyRsfyI5A1B7Md0qndPW90xGM4
 nX24NcQ4Ht73VgAWRpW7YTe9yWg3GsnbUoip
X-Google-Smtp-Source: ABdhPJxg8ceY/oCMzahSuOYLo+/CaJEaezypLUKoaO3Yeb+FgFrg3m+0GEah0qsqx67VSKsNBQK0xA==
X-Received: by 2002:a17:902:ea12:: with SMTP id
 s18mr28315429plg.173.1643775877234; 
 Tue, 01 Feb 2022 20:24:37 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.105.196])
 by smtp.googlemail.com with ESMTPSA id ga21sm4891832pjb.2.2022.02.01.20.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 20:24:36 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PATCH] hw/smbios: fix memory corruption for large guests due to
 handle overlap
Date: Wed,  2 Feb 2022 09:54:20 +0530
Message-Id: <20220202042420.2115231-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1036.google.com
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
 hw/smbios/smbios.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 6013df1698..e53e676f2e 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -743,13 +743,14 @@ static void smbios_build_type_16_table(unsigned dimm_cnt)
 
 #define MAX_T17_STD_SZ 0x7FFF /* (32G - 1M), in Megabytes */
 #define MAX_T17_EXT_SZ 0x80000000 /* 2P, in Megabytes */
+#define T17_BASE 0x1100
 
 static void smbios_build_type_17_table(unsigned instance, uint64_t size)
 {
     char loc_str[128];
     uint64_t size_mb;
 
-    SMBIOS_BUILD_TABLE_PRE(17, 0x1100 + instance, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(17, T17_BASE + instance, true); /* required */
 
     t->physical_memory_array_handle = cpu_to_le16(0x1000); /* Type 16 above */
     t->memory_error_information_handle = cpu_to_le16(0xFFFE); /* Not provided */
@@ -785,12 +786,15 @@ static void smbios_build_type_17_table(unsigned instance, uint64_t size)
     SMBIOS_BUILD_TABLE_POST;
 }
 
-static void smbios_build_type_19_table(unsigned instance,
+#define T19_BASE 0x1300
+
+static void smbios_build_type_19_table(unsigned instance, unsigned offset,
                                        uint64_t start, uint64_t size)
 {
     uint64_t end, start_kb, end_kb;
 
-    SMBIOS_BUILD_TABLE_PRE(19, 0x1300 + instance, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(19, T19_BASE + \
+                           offset + instance, true); /* required */
 
     end = start + size - 1;
     assert(end > start);
@@ -982,7 +986,7 @@ void smbios_get_tables(MachineState *ms,
                        uint8_t **anchor, size_t *anchor_len,
                        Error **errp)
 {
-    unsigned i, dimm_cnt;
+    unsigned i, dimm_cnt, offset;
 
     if (smbios_legacy) {
         *tables = *anchor = NULL;
@@ -1012,6 +1016,16 @@ void smbios_get_tables(MachineState *ms,
 
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
         smbios_build_type_16_table(dimm_cnt);
 
         for (i = 0; i < dimm_cnt; i++) {
@@ -1019,7 +1033,7 @@ void smbios_get_tables(MachineState *ms,
         }
 
         for (i = 0; i < mem_array_size; i++) {
-            smbios_build_type_19_table(i, mem_array[i].address,
+            smbios_build_type_19_table(i, offset, mem_array[i].address,
                                        mem_array[i].length);
         }
 
-- 
2.25.1


