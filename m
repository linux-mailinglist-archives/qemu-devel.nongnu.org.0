Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FF2261126
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 14:15:39 +0200 (CEST)
Received: from localhost ([::1]:60784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFcXC-0006kG-Gi
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 08:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFcSz-0000uh-1u
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 08:11:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFcSn-0005eb-FU
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 08:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599567064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1r+MKpb0Fe1tDNRacm0WsbAaCZgeR8IGCKDQUj+29m0=;
 b=bmzULwWFdCYCKM2IiJ4T+zcYfUmxTZdU5978DjdAFMwuE11Ac4nQIEjmIsKGi+UOKawQ29
 VBFtw4h9yx1WErKjuxDbAADnHx6AXYCQekMblRcYGYyi1OdtFn95IGRV4eIpRBD7nhgVUi
 KefyadsAQ1UhPy/EIDCa+0pp/u0a3dM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-kgWSo7GINW6xca7IdCoD_g-1; Tue, 08 Sep 2020 08:11:03 -0400
X-MC-Unique: kgWSo7GINW6xca7IdCoD_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3B4018B9EBD;
 Tue,  8 Sep 2020 12:11:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 802BB5D9E2;
 Tue,  8 Sep 2020 12:10:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 76DA09D78; Tue,  8 Sep 2020 14:10:50 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 01/21] microvm: name qboot binary qboot.rom
Date: Tue,  8 Sep 2020 14:10:30 +0200
Message-Id: <20200908121050.1162-2-kraxel@redhat.com>
In-Reply-To: <20200908121050.1162-1-kraxel@redhat.com>
References: <20200908121050.1162-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:10:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qboot isn't a bios and shouldnt be named that way.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
---
 hw/i386/microvm.c                       |   4 ++--
 pc-bios/meson.build                     |   2 +-
 pc-bios/{bios-microvm.bin => qboot.rom} | Bin
 roms/Makefile                           |   6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename pc-bios/{bios-microvm.bin => qboot.rom} (100%)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 81d0888930d1..b1dc7e49c159 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -47,7 +47,7 @@
 #include "kvm_i386.h"
 #include "hw/xen/start_info.h"
 
-#define MICROVM_BIOS_FILENAME "bios-microvm.bin"
+#define MICROVM_QBOOT_FILENAME "qboot.rom"
 
 static void microvm_set_rtc(MicrovmMachineState *mms, ISADevice *s)
 {
@@ -158,7 +158,7 @@ static void microvm_devices_init(MicrovmMachineState *mms)
     }
 
     if (bios_name == NULL) {
-        bios_name = MICROVM_BIOS_FILENAME;
+        bios_name = MICROVM_QBOOT_FILENAME;
     }
     x86_bios_rom_init(get_system_memory(), true);
 }
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 8087e5c0a7a1..b4aaf31143dd 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -27,7 +27,7 @@ endif
 blobs = files(
   'bios.bin',
   'bios-256k.bin',
-  'bios-microvm.bin',
+  'qboot.rom',
   'sgabios.bin',
   'vgabios.bin',
   'vgabios-cirrus.bin',
diff --git a/pc-bios/bios-microvm.bin b/pc-bios/qboot.rom
similarity index 100%
rename from pc-bios/bios-microvm.bin
rename to pc-bios/qboot.rom
diff --git a/roms/Makefile b/roms/Makefile
index 5d9f15b6777f..2673a39f9dc2 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -66,7 +66,7 @@ default help:
 	@echo "  efi                -- update UEFI (edk2) platform firmware"
 	@echo "  opensbi32-generic  -- update OpenSBI for 32-bit generic machine"
 	@echo "  opensbi64-generic  -- update OpenSBI for 64-bit generic machine"
-	@echo "  bios-microvm       -- update bios-microvm.bin (qboot)"
+	@echo "  qboot              -- update qboot"
 	@echo "  clean              -- delete the files generated by the previous" \
 	                              "build targets"
 
@@ -182,9 +182,9 @@ opensbi64-generic:
 	cp opensbi/build/platform/generic/firmware/fw_dynamic.bin ../pc-bios/opensbi-riscv64-generic-fw_dynamic.bin
 	cp opensbi/build/platform/generic/firmware/fw_dynamic.elf ../pc-bios/opensbi-riscv64-generic-fw_dynamic.elf
 
-bios-microvm:
+qboot:
 	$(MAKE) -C qboot
-	cp qboot/bios.bin ../pc-bios/bios-microvm.bin
+	cp qboot/bios.bin ../pc-bios/qboot.rom
 
 clean:
 	rm -rf seabios/.config seabios/out seabios/builds
-- 
2.27.0


