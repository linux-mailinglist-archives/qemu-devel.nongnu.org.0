Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC1043B578
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:24:56 +0200 (CEST)
Received: from localhost ([::1]:46490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfOJs-0004OH-3I
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mfO6h-0001SO-P8
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:11:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mfO6e-0004Gn-GZ
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:11:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635261072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mdf2tFrR48heWDECv6SjjvW3NydipqmBR2MtQDmUJgA=;
 b=HhsVaI1tXCK86zGS9ZnE5A+ugNyew2cigA2qskf/P+oMNoPdc9Ab/wAuL3BZFUjtlCkzrE
 vBrITzNXHBY64qPuYSqMc8b/eaPoSEdT7i0VqD20N37MnXTPxia6+M1Umm3ry0fpYRXE2j
 0XtY6Gpo/Um+ZstD37WICzz/NWoYgVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-LZ1mYwJGP8Ks9Q399kav-Q-1; Tue, 26 Oct 2021 11:11:08 -0400
X-MC-Unique: LZ1mYwJGP8Ks9Q399kav-Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62630101B4A3;
 Tue, 26 Oct 2021 15:11:07 +0000 (UTC)
Received: from localhost (unknown [10.22.17.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E4D3100751A;
 Tue, 26 Oct 2021 15:11:02 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] smbios: Rename SMBIOS_ENTRY_POINT_* enums
Date: Tue, 26 Oct 2021 11:10:58 -0400
Message-Id: <20211026151100.1691925-2-ehabkost@redhat.com>
In-Reply-To: <20211026151100.1691925-1-ehabkost@redhat.com>
References: <20211026151100.1691925-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename the enums to match the naming style used by QAPI, and to
use "32" and "64" instead of "20" and "31".  This will allow us
to more easily move the enum to the QAPI schema later.

About the naming choice: "SMBIOS 2.1 entry point"/"SMBIO 3.0
entry point" and "32-bit entry point"/"64-bit entry point" are
synonymous in the SMBIOS specification.  However, the phrases
"32-bit entry point" and "64-bit entry point" are used more often.

The new names also avoid confusion between the entry point format
and the actual SMBIOS version reported in the entry point
structure.  For example: currently the 32-bit entry point
actually report SMBIOS 2.8 support, not 2.1.

Based on portions of a patch submitted by Daniel P. Berrangé.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
First version of this code was submitted at:
https://lore.kernel.org/qemu-devel/20200908165438.1008942-5-berrange@redhat.com

Changes from v2:
* Use "32" and "64" instead of "2_0" and "3_1"

Changes from v1:
* Patch was split in two
* Hunks included this patch are not changed from v1
---
 include/hw/firmware/smbios.h | 4 ++--
 hw/arm/virt.c                | 2 +-
 hw/i386/pc_piix.c            | 2 +-
 hw/i386/pc_q35.c             | 2 +-
 hw/smbios/smbios.c           | 8 ++++----
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
index 5a0dd0c8cff..d916baed6a9 100644
--- a/include/hw/firmware/smbios.h
+++ b/include/hw/firmware/smbios.h
@@ -27,8 +27,8 @@ struct smbios_phys_mem_area {
  * SMBIOS spec defined tables
  */
 typedef enum SmbiosEntryPointType {
-    SMBIOS_ENTRY_POINT_21,
-    SMBIOS_ENTRY_POINT_30,
+    SMBIOS_ENTRY_POINT_TYPE_32,
+    SMBIOS_ENTRY_POINT_TYPE_64,
 } SmbiosEntryPointType;
 
 /* SMBIOS Entry Point
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ca433adb5b1..2bd73d501da 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1589,7 +1589,7 @@ static void virt_build_smbios(VirtMachineState *vms)
 
     smbios_set_defaults("QEMU", product,
                         vmc->smbios_old_sys_ver ? "1.0" : mc->name, false,
-                        true, SMBIOS_ENTRY_POINT_30);
+                        true, SMBIOS_ENTRY_POINT_TYPE_64);
 
     smbios_get_tables(MACHINE(vms), NULL, 0,
                       &smbios_tables, &smbios_tables_len,
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 6ad0d763c57..17c050694f5 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -177,7 +177,7 @@ static void pc_init1(MachineState *machine,
         smbios_set_defaults("QEMU", "Standard PC (i440FX + PIIX, 1996)",
                             mc->name, pcmc->smbios_legacy_mode,
                             pcmc->smbios_uuid_encoded,
-                            SMBIOS_ENTRY_POINT_21);
+                            SMBIOS_ENTRY_POINT_TYPE_32);
     }
 
     /* allocate ram and load rom/bios */
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index fcc6e4eb2b8..48419ebfd5f 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -199,7 +199,7 @@ static void pc_q35_init(MachineState *machine)
         smbios_set_defaults("QEMU", "Standard PC (Q35 + ICH9, 2009)",
                             mc->name, pcmc->smbios_legacy_mode,
                             pcmc->smbios_uuid_encoded,
-                            SMBIOS_ENTRY_POINT_21);
+                            SMBIOS_ENTRY_POINT_TYPE_32);
     }
 
     /* allocate ram and load rom/bios */
diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 7397e567373..6013df1698e 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -62,7 +62,7 @@ uint8_t *smbios_tables;
 size_t smbios_tables_len;
 unsigned smbios_table_max;
 unsigned smbios_table_cnt;
-static SmbiosEntryPointType smbios_ep_type = SMBIOS_ENTRY_POINT_21;
+static SmbiosEntryPointType smbios_ep_type = SMBIOS_ENTRY_POINT_TYPE_32;
 
 static SmbiosEntryPoint ep;
 
@@ -432,7 +432,7 @@ static void smbios_validate_table(MachineState *ms)
         exit(1);
     }
 
-    if (smbios_ep_type == SMBIOS_ENTRY_POINT_21 &&
+    if (smbios_ep_type == SMBIOS_ENTRY_POINT_TYPE_32 &&
         smbios_tables_len > SMBIOS_21_MAX_TABLES_LEN) {
         error_report("SMBIOS 2.1 table length %zu exceeds %d",
                      smbios_tables_len, SMBIOS_21_MAX_TABLES_LEN);
@@ -927,7 +927,7 @@ void smbios_set_defaults(const char *manufacturer, const char *product,
 static void smbios_entry_point_setup(void)
 {
     switch (smbios_ep_type) {
-    case SMBIOS_ENTRY_POINT_21:
+    case SMBIOS_ENTRY_POINT_TYPE_32:
         memcpy(ep.ep21.anchor_string, "_SM_", 4);
         memcpy(ep.ep21.intermediate_anchor_string, "_DMI_", 5);
         ep.ep21.length = sizeof(struct smbios_21_entry_point);
@@ -950,7 +950,7 @@ static void smbios_entry_point_setup(void)
         ep.ep21.structure_table_address = cpu_to_le32(0);
 
         break;
-    case SMBIOS_ENTRY_POINT_30:
+    case SMBIOS_ENTRY_POINT_TYPE_64:
         memcpy(ep.ep30.anchor_string, "_SM3_", 5);
         ep.ep30.length = sizeof(struct smbios_30_entry_point);
         ep.ep30.entry_point_revision = 1;
-- 
2.32.0


