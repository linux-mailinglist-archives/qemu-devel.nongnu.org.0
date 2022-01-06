Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD3D486559
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:38:38 +0100 (CET)
Received: from localhost ([::1]:52800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5SyS-0004XC-S7
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:38:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Se4-000523-I4
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Se2-0000uv-Gj
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2nFeua7zjPU9qdmSR15xkvtgazR5lMIelJwJXZHlGtA=;
 b=FuyIo7Emv5YQh76Y0q/FwH6NxHSG38JjlmP8PsX3L4E7e8n1rixgxBgrc2+KJn9YhEadaS
 79Y74g0Dm715U5WyRtedqYq5HIxDHFs/9jeaiOCbyJ9TsN3EuDDVDWEEXuCi6VW10j9LaI
 Nf8LNc22zsEXGA0fu5orMfUKZ8nmoNE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-_3wuVHiwOm2GQd2LFRCzww-1; Thu, 06 Jan 2022 08:17:28 -0500
X-MC-Unique: _3wuVHiwOm2GQd2LFRCzww-1
Received: by mail-ed1-f70.google.com with SMTP id
 i5-20020a05640242c500b003f84839a8c3so1938556edc.6
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:17:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2nFeua7zjPU9qdmSR15xkvtgazR5lMIelJwJXZHlGtA=;
 b=wgCD3/pFd1Xpx4kkaOVY6RWIKmfz27/jYN/n96gEXkX1By0fmMbOBykf+oMyuU0Nhp
 bvc3x26//bPusCbU8wEhJKZSHe7piDK15QQCaMwFa2feKmyMgoYhvw7KbRSPF5QJMv8j
 zLy9v+ncQk2fYn/2dTsjL3MqlWVnXHoW1GN9GXchF+ME1eI96DDs+C9d4H221GNeCYu9
 WwbkuMm3KHmv39VkPJh/t8UTssKfHkHz83mN0THXIKfQ6K8qFTrMk/S9zM/2qlECsjlk
 h/BDA2pnJgg4AGMegCJN6SsVKHp0t1lfroUh5jIkYu48bjmlaFRIU5gW4BS7+ze5kjGq
 Bxcw==
X-Gm-Message-State: AOAM5334K9G7+JCQs77c+4SWNOfREaxLsOJMokBdj85EhOHKtChwrRCp
 dGaAkOEZ3AXjArtrpqYbyBUf3DoqmPKALn8YXoqEphI2x0MIFmfI7y71k/L/7bwgXwW07xqaXKI
 8C0Slh8mOoD3FvbZ1oMkFIFlWaZd5YYUFpEtV3T6I1+YlGsLcE9PKZMRfbaFb
X-Received: by 2002:a17:907:6d87:: with SMTP id
 sb7mr48269417ejc.220.1641475046550; 
 Thu, 06 Jan 2022 05:17:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw46ED+z4x+q7QQpntGTyF51zKK9+DHFBCxQ4xySEhk2XyPAcMfDiwc64SHXKWv3BDCVDz7HQ==
X-Received: by 2002:a17:907:6d87:: with SMTP id
 sb7mr48269396ejc.220.1641475046315; 
 Thu, 06 Jan 2022 05:17:26 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id qk34sm492348ejc.143.2022.01.06.05.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:17:25 -0800 (PST)
Date: Thu, 6 Jan 2022 08:17:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/52] smbios: Rename SMBIOS_ENTRY_POINT_* enums
Message-ID: <20220106131534.423671-26-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

Rename the enums to match the naming style used by QAPI, and to
use "32" and "64" instead of "20" and "31".  This will allow us
to more easily move the enum to the QAPI schema later.

About the naming choice: "SMBIOS 2.1 entry point"/"SMBIOS 3.0
entry point" and "32-bit entry point"/"64-bit entry point" are
synonymous in the SMBIOS specification.  However, the phrases
"32-bit entry point" and "64-bit entry point" are used more often.

The new names also avoid confusion between the entry point format
and the actual SMBIOS version reported in the entry point
structure.  For example: currently the 32-bit entry point
actually report SMBIOS 2.8 support, not 2.1.

Based on portions of a patch submitted by Daniel P. Berrangé.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20211026151100.1691925-2-ehabkost@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/firmware/smbios.h | 4 ++--
 hw/arm/virt.c                | 2 +-
 hw/i386/pc_piix.c            | 2 +-
 hw/i386/pc_q35.c             | 2 +-
 hw/smbios/smbios.c           | 8 ++++----
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
index 5a0dd0c8cf..d916baed6a 100644
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
index 4593fea1ce..b45b52c90e 100644
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
index 1999190276..25f918b609 100644
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
index 2e981f436c..1103fbcd90 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -200,7 +200,7 @@ static void pc_q35_init(MachineState *machine)
         smbios_set_defaults("QEMU", "Standard PC (Q35 + ICH9, 2009)",
                             mc->name, pcmc->smbios_legacy_mode,
                             pcmc->smbios_uuid_encoded,
-                            SMBIOS_ENTRY_POINT_21);
+                            SMBIOS_ENTRY_POINT_TYPE_32);
     }
 
     /* allocate ram and load rom/bios */
diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 7397e56737..6013df1698 100644
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
MST


