Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7194B53D9
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:57:22 +0100 (CET)
Received: from localhost ([::1]:43152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJcn2-0003Al-Ho
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:57:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJc6a-0003Ls-5V
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:13:30 -0500
Received: from [2607:f8b0:4864:20::102c] (port=52002
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJc6Y-0005Hx-Ac
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:13:27 -0500
Received: by mail-pj1-x102c.google.com with SMTP id y9so14690138pjf.1
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 06:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IHZw2NbsTOllQQr+WFDECfmcdwGjfsvAlTYrot4L37o=;
 b=S4hITY6W+Xngk8d4Xf6x9fCreNZ+co9PqqKL8lWOslB4SoedUgfGnS7mJ7hJUcL4pA
 jVkK5Oq32HahB4jIdJUzm6w21aYN0wn8bmkYCVpirV4kQrhniTNTpgrWJg6dOUCJl5p1
 XONLqLt3oauACgp7VM3Rz4c03FOu1bWX10Po63eoQDujVELo3rxKsCQ9soTmWaZFqaIm
 CmM0m3SyOO7KMKBDTQUjOi4yDiDJaqK7gYX0OfxSTjD2jRf78wVw/gqVvGxWhvfbuwDK
 KPRx4smPKcR56V0jej9N+lcMmvjO6MvJ41MDNxqceU1FRwZzpsSOnNL3TrMUySz/plyv
 GV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IHZw2NbsTOllQQr+WFDECfmcdwGjfsvAlTYrot4L37o=;
 b=G8aW3zxdQdSd2zERSAhnTAGp+N7+iOj9ZOm1nkE8CC7LJVbacfWGtYEz2RN8PNQ3ae
 D6gaR9w6dQc2fSyT9nUGnVaAPFhhG3xcrAyLsBx4rlEFT6KHisFvz0owY54KNngybJYL
 vfv8BQrqnqNaJdeNqF+VAT125VH6xUXvuCrtjQe2cuBKzAifczspf19BKU5X2hxVpdec
 g41E6zVtxlDXVqVjAKnoHRWTw5A+dUZEDgrv+dRruDhFJHgasREBJjeapYq+vCDix/IM
 tCJ+znFJpiF0CZXo92g7jz10AVkgYPMYu0URnIu/EKfmP38kvyPR07sVykFH26T6ME9f
 FPPQ==
X-Gm-Message-State: AOAM530CphefZyMVY9o29d9FJq0q0yKamgjPmIlq9rALA11tFMHhKwXy
 T4zbd9JKZPJAQCmh2Adsi2Ul7GQNpYFYPQ==
X-Google-Smtp-Source: ABdhPJyggusg7PuolYAH4vUknvcoBCN5d00OH+j5VnH6QZp0wWDQ4oPxQBwBdM+YbuAKg5q+GtAVmQ==
X-Received: by 2002:a17:90a:4f:: with SMTP id
 15mr14790405pjb.218.1644848004808; 
 Mon, 14 Feb 2022 06:13:24 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.127.101])
 by smtp.googlemail.com with ESMTPSA id hk3sm9808340pjb.12.2022.02.14.06.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 06:13:24 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v3 2/3] hw/smbios: fix table memory corruption with large
 memory vms
Date: Mon, 14 Feb 2022 19:42:35 +0530
Message-Id: <20220214141237.47946-3-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214141237.47946-1-ani@anisinha.ca>
References: <20220214141237.47946-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001,
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

As table handles are altered for large memory VMs, this change can break
migration in those cases. However, in those situations, qemu crashes anyway
without this fix and hence we do not preserve the old bug by introducing
compat knobs/machine types.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2023977

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/smbios/smbios.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

changelog:
v3: reworded the commit log and comment in code.

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


