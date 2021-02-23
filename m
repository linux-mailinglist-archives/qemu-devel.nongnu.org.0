Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FC6322EA3
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:22:38 +0100 (CET)
Received: from localhost ([::1]:41924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaSL-0007Z4-K4
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:22:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaEi-0001wc-H7
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:08:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaEg-0005f9-Bi
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:08:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614096509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8shfiQzKMo3SCes8KTF6skOuPdfQ+1UY9IH2UX4kYd0=;
 b=AG0mNAoiFWUuUrzsqBRBcKojfF1CvNtmMb/SSpTOGvfOi+aPEXd+jLEIWq7jci4cAzoNON
 2qPTE0Di3vS7g0rAwLVrcSW3yZszqlQobjZ2xyVbiJwM5oXymMEMbtJj9gf+kiYCx5Xclh
 QZvnlWUyXctbwk89R0ppvuXUF7CdEqM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-Ir4-eQFdNqiQ2KSJATFjGQ-1; Tue, 23 Feb 2021 11:05:40 -0500
X-MC-Unique: Ir4-eQFdNqiQ2KSJATFjGQ-1
Received: by mail-wr1-f71.google.com with SMTP id b7so2843589wrv.7
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:05:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8shfiQzKMo3SCes8KTF6skOuPdfQ+1UY9IH2UX4kYd0=;
 b=ip7lsmh7bZc5iClHxErdMOMlehkLdwReE5JyVNyoV/7TGs3nLj2WEYDyhJBZ2lAAPu
 kYiyS7bLzDEPycWQwbAr4p75tfQE8zVWZC0ZNldM6yUsCGsSBlgp4Xcu0l+vjsu2L9l/
 SKtqxhIHMHWGaRA/f6OoR9VvYCS5qZI32jiV+86pv0G2eujiyhHsQa1n5AtdUO36/+kG
 A2lzSU/sv4r5l5DdF9CKt/a9HTb0M2zXobfYx4AD5i9Ge6WtwZeRAQnsY4/g9W4PpNo8
 J3YrtHfOuEmeqX6x5TTTVI/PgT5auWs7+w6pyg9l0HPPJKDuiSQZqTMs1AoV66XdhQfr
 GicA==
X-Gm-Message-State: AOAM530RI4wMmtKndQ6bZx+meeJag2li6yKS5LqPNoSAQMYTJ0C31L9n
 EJtWN8ZdITJdiTcXmvYxtsWx1v/1TX+kQxOtN25iCakbUjnKftRkZZBGHggkc1mlCCdQn2Ihl+Q
 8HCqwQpSZv6UHWMcLvPdNNJXLvaAfuMQT+vyA0kDcaZqNPOWnfnngnClRi/th
X-Received: by 2002:adf:ec86:: with SMTP id z6mr18289068wrn.359.1614096338304; 
 Tue, 23 Feb 2021 08:05:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyaknO5UGohw0rRyT4OBR2DaBURfpFDZjW+hfanmXeAaCd7d6XKmLVElN9FqId5zWzrtp/QZA==
X-Received: by 2002:adf:ec86:: with SMTP id z6mr18289040wrn.359.1614096338079; 
 Tue, 23 Feb 2021 08:05:38 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id c2sm32838399wrx.70.2021.02.23.08.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 08:05:37 -0800 (PST)
Date: Tue, 23 Feb 2021 11:05:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/17] acpi: set fadt.smi_cmd to zero when SMM is not supported
Message-ID: <20210223160144.1507082-13-mst@redhat.com>
References: <20210223160144.1507082-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210223160144.1507082-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

>From table 5.9 SMI_CMD of ACPI spec
> This field is reserved and must be zero on system
> that does not support System Management mode.

When smm is not enabled, set it to zero to comform to the spec.
When -machine smm=off is passed, the change to FACP is as follows.

@@ -1,46 +1,46 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20180105 (64-bit version)
  * Copyright (c) 2000 - 2018 Intel Corporation
  *
- * Disassembly of tests/data/acpi/q35/FACP, Fri Feb  5 16:57:04 2021
+ * Disassembly of /tmp/aml-1OQYX0, Fri Feb  5 16:57:04 2021
  *
  * ACPI Data Table [FACP]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
  */

 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 000000F4
 [008h 0008   1]                     Revision : 03
-[009h 0009   1]                     Checksum : 1F
+[009h 0009   1]                     Checksum : D6
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPCFACP"
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

 [024h 0036   4]                 FACS Address : 00000000
 [028h 0040   4]                 DSDT Address : 00000000
 [02Ch 0044   1]                        Model : 01
 [02Dh 0045   1]                   PM Profile : 00 [Unspecified]
 [02Eh 0046   2]                SCI Interrupt : 0009
-[030h 0048   4]             SMI Command Port : 000000B2
-[034h 0052   1]            ACPI Enable Value : 02
-[035h 0053   1]           ACPI Disable Value : 03
+[030h 0048   4]             SMI Command Port : 00000000
+[034h 0052   1]            ACPI Enable Value : 00
+[035h 0053   1]           ACPI Disable Value : 00
 [036h 0054   1]               S4BIOS Command : 00
 [037h 0055   1]              P-State Control : 00
 [038h 0056   4]     PM1A Event Block Address : 00000600
 [03Ch 0060   4]     PM1B Event Block Address : 00000000
 [040h 0064   4]   PM1A Control Block Address : 00000604
 [044h 0068   4]   PM1B Control Block Address : 00000000
 [048h 0072   4]    PM2 Control Block Address : 00000000
 [04Ch 0076   4]       PM Timer Block Address : 00000608
 [050h 0080   4]           GPE0 Block Address : 00000620
 [054h 0084   4]           GPE1 Block Address : 00000000
 [058h 0088   1]       PM1 Event Block Length : 04
 [059h 0089   1]     PM1 Control Block Length : 02
 [05Ah 0090   1]     PM2 Control Block Length : 00
 [05Bh 0091   1]        PM Timer Block Length : 04
 [05Ch 0092   1]            GPE0 Block Length : 10
 [05Dh 0093   1]            GPE1 Block Length : 00

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Message-Id: <09ed791ef77fda2b194100669cbc690865c9eb52.1613615732.git.isaku.yamahata@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b9190b924a..49aef4ebd1 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -139,6 +139,14 @@ const struct AcpiGenericAddress x86_nvdimm_acpi_dsmio = {
 static void init_common_fadt_data(MachineState *ms, Object *o,
                                   AcpiFadtData *data)
 {
+    X86MachineState *x86ms = X86_MACHINE(ms);
+    /*
+     * "ICH9-LPC" or "PIIX4_PM" has "smm-compat" property to keep the old
+     * behavior for compatibility irrelevant to smm_enabled, which doesn't
+     * comforms to ACPI spec.
+     */
+    bool smm_enabled = object_property_get_bool(o, "smm-compat", NULL) ?
+        true : x86_machine_is_smm_enabled(x86ms);
     uint32_t io = object_property_get_uint(o, ACPI_PM_PROP_PM_IO_BASE, NULL);
     AmlAddressSpace as = AML_AS_SYSTEM_IO;
     AcpiFadtData fadt = {
@@ -159,12 +167,16 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
         .rtc_century = RTC_CENTURY,
         .plvl2_lat = 0xfff /* C2 state not supported */,
         .plvl3_lat = 0xfff /* C3 state not supported */,
-        .smi_cmd = ACPI_PORT_SMI_CMD,
+        .smi_cmd = smm_enabled ? ACPI_PORT_SMI_CMD : 0,
         .sci_int = object_property_get_uint(o, ACPI_PM_PROP_SCI_INT, NULL),
         .acpi_enable_cmd =
-            object_property_get_uint(o, ACPI_PM_PROP_ACPI_ENABLE_CMD, NULL),
+            smm_enabled ?
+            object_property_get_uint(o, ACPI_PM_PROP_ACPI_ENABLE_CMD, NULL) :
+            0,
         .acpi_disable_cmd =
-            object_property_get_uint(o, ACPI_PM_PROP_ACPI_DISABLE_CMD, NULL),
+            smm_enabled ?
+            object_property_get_uint(o, ACPI_PM_PROP_ACPI_DISABLE_CMD, NULL) :
+            0,
         .pm1a_evt = { .space_id = as, .bit_width = 4 * 8, .address = io },
         .pm1a_cnt = { .space_id = as, .bit_width = 2 * 8,
                       .address = io + 0x04 },
-- 
MST


