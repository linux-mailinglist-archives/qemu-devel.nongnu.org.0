Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186794BA47E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 16:37:17 +0100 (CET)
Received: from localhost ([::1]:40548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKiqJ-0005Q6-W3
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 10:37:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nKiUS-00009Z-AU
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:14:40 -0500
Received: from [2607:f8b0:4864:20::431] (port=36665
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nKiUQ-0007cs-Kb
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 10:14:40 -0500
Received: by mail-pf1-x431.google.com with SMTP id z16so5231768pfh.3
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 07:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rjh7+VUyyC1W9oWLXjXeD2Pl8AMEHbHBcf/pXVbnb1c=;
 b=LzQLT1q2rlUIjbmDRKJBGhYLGvcGgJ/6WARToUeSwQspE0ImWwEV0tPOo7jvgMFJb/
 yktf8z210aStik1uK22oYgTC0TeIfgVpRsBACP6DhIlQiAaG44MwCkVSRkC5zIUyIdmX
 /fT4ucWh9MaJ3ILxXFRSufyd+7MZXH1GqFQA5laaSeZnc91fvlINnaYY4ZhqebUL+QEf
 JPTHek7jVLgp8Hfy8VgTAaSXR3OMbXFWsYR7XRAC88swjrRoJpy8mBzGI5nTZoNgPJRK
 oxq2VOtXoQwhr1IWM2jUfyVUDGh79ZNPicKRgZPMJW3AQtdgVuh/9BrvIVGMvqjkjhY+
 wxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rjh7+VUyyC1W9oWLXjXeD2Pl8AMEHbHBcf/pXVbnb1c=;
 b=vs/8tgzuCNuFBc8cOiZhmRPbFFP/rowF3gFQaX8X9hMF0ES70gLjLtgI6DUd5YZhCI
 BP3qAshu/EXhezEv8lkS0Q50W/qcH75b5zSKBxX/veI79eNj6GLKAF3p3PHMn2HR6uRp
 GpKgQY9X4syMHG2M9yHG3FswA9HEhzSUx3yT9VYAy7XXNP1TJWaqr6SWJEKbDrPvVPam
 Z7xDIsRDdT78TX405XmHF/9WIn9tKlEFIawBc/UblGM5rATDroWfzm7rsMOliID+qy4g
 nBRF7nuhloXXEK9jmMkdIXRayeBDzqCKYAqHzu40oGZ8S0zlMHYBwy2lw/EtIQq4lvmI
 jM8w==
X-Gm-Message-State: AOAM531E9QgQFz0kpVor8gCralcgPabNyKPXNyS1IOj8cM4ikAM+PRbS
 Ejp+xBE2QZVG5+RHDTjUQfFu2IiMEXv1zg==
X-Google-Smtp-Source: ABdhPJzdSg6QhQZycerTATXNNk+nx3o57ot0f75RyY387Yf1Vy4M7NE+2sLgN5n5CiodET874EgKBg==
X-Received: by 2002:a63:6b8a:0:b0:373:1037:1c65 with SMTP id
 g132-20020a636b8a000000b0037310371c65mr2750188pgc.7.1645110875954; 
 Thu, 17 Feb 2022 07:14:35 -0800 (PST)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.242.253])
 by smtp.googlemail.com with ESMTPSA id z9sm8456884pgz.32.2022.02.17.07.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 07:14:35 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v4 2/3] hw/smbios: fix overlapping table handle numbers with
 large memory vms
Date: Thu, 17 Feb 2022 20:44:09 +0530
Message-Id: <20220217151410.300210-3-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217151410.300210-1-ani@anisinha.ca>
References: <20220217151410.300210-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::431;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x431.google.com
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

changelog:
v4: addressed Igor's suggestions on v3 with the commit log.
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


