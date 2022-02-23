Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735674C159D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 15:43:16 +0100 (CET)
Received: from localhost ([::1]:42928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMsrL-0001Lm-IJ
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 09:43:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMsid-0001HQ-5x
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 09:34:16 -0500
Received: from [2607:f8b0:4864:20::102b] (port=53197
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMsiT-0005bI-TA
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 09:34:08 -0500
Received: by mail-pj1-x102b.google.com with SMTP id v4so2816537pjh.2
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 06:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ExJ2vPUFYtt0SmxWITMaGuPcTRr0TqMeSezK7QlaGuo=;
 b=C0Tv54/naKVP963TDGuqboN18fBbuMZTln8p95PmUk08gQUPSAKAIaQOksaMw4A51e
 678taBPVS4i2CuSVtiH/KTxfPM3Tyxxpbl9WAKoINaebhQHZaSaWdMsauts6h26R8y0+
 Q6Gu1+TO6eMoHaobiKIHurOGeZCmGcj0oavr9htHlcQlBys1TRELmpjJ12Z8f2Oo01Me
 N7RcU3L2jFN54t+fDic3ndrA7xlukGGIKttV5/QqW/00K9KccqW7Y+X7pBcXefE4dZ3n
 w/RUZy9rycbV4Un+ufYAcAYhH1xmZJIsB3TpAwm2dgIH/WmUeVI/RdNPm+89WeCxVAN2
 LBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ExJ2vPUFYtt0SmxWITMaGuPcTRr0TqMeSezK7QlaGuo=;
 b=X1Y+5g4ISDRApMdBncf/jwdjIib0mBNL6OkiGHBTZQ6vvMB4z12mx7OtIqh89kon30
 lPytTtJckY0RB4FPU6KtDDbD9fI7v/4kqUs09Qw7DrTD4/rurMPlTiO55eavbPRS8vD4
 05a4deYUb/ml/RMKJFMksgxt1by1zycqgzskD66LiUBfWhRFVrZaV7X9k9uN8KZQR8cR
 bJ7cMJkrAKUFGHqahGeJ1ffIeA/oOyNRCeVdhO9xbQKmeOjBVUkSzgfJuAca/mqgpaSK
 TSyt1VeLbGQzeNbSHFIYzZzcUEMcFzKRaNBdy7nlGhFBY77dV72t2c0Y5pBYU4E0yle8
 oRiw==
X-Gm-Message-State: AOAM533i0W71VqbjOSbnuCKdH2dx0y7IYdFFzZ7bg4AMftA32FarQwk1
 q2fmsE78Opr0mnsc02U5/3Owxav+QXblOQ==
X-Google-Smtp-Source: ABdhPJzLsIR5NzDuPiWT6cX8V1qC57tBRTwycCHWLx87g2zZpFhiesdIyU0K2fPBqEZ27QQ1Xd/t2g==
X-Received: by 2002:a17:902:8b86:b0:14f:cad:38f6 with SMTP id
 ay6-20020a1709028b8600b0014f0cad38f6mr27681959plb.3.1645626844126; 
 Wed, 23 Feb 2022 06:34:04 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.242.81])
 by smtp.googlemail.com with ESMTPSA id
 l21sm22929583pfu.120.2022.02.23.06.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 06:34:03 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, mst@redhat.com, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 6/7] hw/smbios: fix overlapping table handle numbers with
 large memory vms
Date: Wed, 23 Feb 2022 20:03:21 +0530
Message-Id: <20220223143322.927136-7-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223143322.927136-1-ani@anisinha.ca>
References: <20220223143322.927136-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102b.google.com
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

The current smbios table implementation splits the main memory in 16 GiB
(DIMM like) chunks. With the current smbios table assignment code, we can have
only 512 such chunks before the 16 bit handle numbers in the header for tables
17 and 19 conflict. A guest with more than 8 TiB of memory will hit this
limitation and would fail with the following assertion in isa-debugcon:

ASSERT_EFI_ERROR (Status = Already started)
ASSERT /builddir/build/BUILD/edk2-ca407c7246bf/OvmfPkg/SmbiosPlatformDxe/SmbiosPlatformDxe.c(125): !EFI_ERROR (Status)

This change adds an additional offset between tables 17 and 19 handle numbers
when configuring VMs larger than 8 TiB of memory. The value of the offset is
calculated to be equal to the additional space required to be reserved
in order to accomodate more DIMM entries without the table handles colliding.
In normal cases where the VM memory is smaller or equal to 8 TiB, this offset
value is 0. Hence in this case, no additional handle numbers are reserved and
table handle values remain as before.

Since smbios memory is not transmitted over the wire during migration,
this change can break migration for large memory vms if the guest is in the
middle of generating the tables during migration. However, in those
situations, qemu generates invalid table handles anyway with or without this
fix. Hence, we do not preserve the old bug by introducing compat knobs/machine
types.

Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2023977

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/smbios/smbios.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 56b412ce35..44c53797a4 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -799,12 +799,13 @@ static void smbios_build_type_17_table(unsigned instance, uint64_t size)
     SMBIOS_BUILD_TABLE_POST;
 }
 
-static void smbios_build_type_19_table(unsigned instance,
+static void smbios_build_type_19_table(unsigned instance, unsigned offset,
                                        uint64_t start, uint64_t size)
 {
     uint64_t end, start_kb, end_kb;
 
-    SMBIOS_BUILD_TABLE_PRE(19, T19_BASE + instance, true); /* required */
+    SMBIOS_BUILD_TABLE_PRE(19, T19_BASE + offset + instance,
+                           true); /* required */
 
     end = start + size - 1;
     assert(end > start);
@@ -996,7 +997,7 @@ void smbios_get_tables(MachineState *ms,
                        uint8_t **anchor, size_t *anchor_len,
                        Error **errp)
 {
-    unsigned i, dimm_cnt;
+    unsigned i, dimm_cnt, offset;
 
     if (smbios_legacy) {
         *tables = *anchor = NULL;
@@ -1026,6 +1027,16 @@ void smbios_get_tables(MachineState *ms,
 
         dimm_cnt = QEMU_ALIGN_UP(current_machine->ram_size, MAX_DIMM_SZ) / MAX_DIMM_SZ;
 
+        /*
+         * The offset determines if we need to keep additional space betweeen
+         * table 17 and table 19 header handle numbers so that they do
+         * not overlap. For example, for a VM with larger than 8 TB guest
+         * memory and DIMM like chunks of 16 GiB, the default space between
+         * the two tables (T19_BASE - T17_BASE = 512) is not enough.
+         */
+        offset = (dimm_cnt > (T19_BASE - T17_BASE)) ? \
+                 dimm_cnt - (T19_BASE - T17_BASE) : 0;
+
         smbios_build_type_16_table(dimm_cnt);
 
         for (i = 0; i < dimm_cnt; i++) {
@@ -1033,7 +1044,7 @@ void smbios_get_tables(MachineState *ms,
         }
 
         for (i = 0; i < mem_array_size; i++) {
-            smbios_build_type_19_table(i, mem_array[i].address,
+            smbios_build_type_19_table(i, offset, mem_array[i].address,
                                        mem_array[i].length);
         }
 
-- 
2.25.1


