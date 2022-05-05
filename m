Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E75A51BD13
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:22:14 +0200 (CEST)
Received: from localhost ([::1]:52032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYce-0008GN-WB
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmXlK-0000Y3-Vl
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:27:07 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:44787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmXlH-0008Bz-4k
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651742821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hTVRTsFjk2Aih71W8GkzS5uwuC3WRq4ds1vV4wMktcY=;
 b=SixgIjRETwVMnboLUddhr+j/L2E9j54s21X8djQsKoZRrqA+JBM41ltC+T+MXxE3v5HxO3
 KSFKHOvDcv9BcrxfyasaU4DfwSuN/9N+BOEkutuxa4P5kp0b8ZW5N8aaI5GJVzdlbZca+o
 mSwpqy6O9FPKU/9WND2Epfi4Z1yyYMA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-7Y0N_W-OMOKPSjYZTXrnYA-1; Thu, 05 May 2022 05:27:00 -0400
X-MC-Unique: 7Y0N_W-OMOKPSjYZTXrnYA-1
Received: by mail-ej1-f72.google.com with SMTP id
 qf19-20020a1709077f1300b006f439243355so2287262ejc.3
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hTVRTsFjk2Aih71W8GkzS5uwuC3WRq4ds1vV4wMktcY=;
 b=Czpu+gGb5ihHsXd3MKjhqbVmt9w0HYdrHaZe1+BfC/89Axh+CFN9JxOjBWqaDD3mGi
 aadkmrhtvd21pfIYE5AZxawWJkUiZ4F9G7t92uxGlqDGeSxJQ2bg4hILuEXiWG/x4w3i
 JfpoqTTStgEhfSur/yiueNwWMMOde++cLnl24JpOyDZNgzPs8zqwK2+jz/lJtqa2M8Cd
 vlPZqzAz+kGwu57FLEf7KFWnJJX/yEkKI8yVuKwCQf8/xgN8N0y/sDFVUCv9VPCdVsYU
 RgKo+wwfQDQIgN2IJtNkqA3Xiid4caOSMBHp/efypdcGMgwFNzjWiVY2XzvxExdFHUAc
 neQw==
X-Gm-Message-State: AOAM533+Sr0lEYCAiHBGjcxeJtYz7TlfQrXVX7VHmrlVcYE9Kij85B63
 ZL0LT+t8Jd/jywGu3rpwzSqsn8r92YMKGWhbvOFHGnKyOW7fbvLVjnofFpYYPQkU9mPi6uXxjuv
 SnV+kIahYpiBRW+3fsdeGGnesORjNRalQmFu25czjVBslZLbXCKQ4fYGfmMlxCNXSQTM=
X-Received: by 2002:a17:907:9812:b0:6da:aaaf:7713 with SMTP id
 ji18-20020a170907981200b006daaaaf7713mr24252088ejc.163.1651742819156; 
 Thu, 05 May 2022 02:26:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFB0cQ1E5DoS5g8lzp5y99LzK6DJqAUCbcNFYex0XStZ5pyM4kPubSJO88f/X9b9oIHaMmxQ==
X-Received: by 2002:a17:907:9812:b0:6da:aaaf:7713 with SMTP id
 ji18-20020a170907981200b006daaaaf7713mr24252065ejc.163.1651742818794; 
 Thu, 05 May 2022 02:26:58 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 dk20-20020a0564021d9400b0042617ba63c0sm552314edb.74.2022.05.05.02.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:26:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
Subject: [PATCH] pseries: allow setting stdout-path even on machines with a VGA
Date: Thu,  5 May 2022 11:26:56 +0200
Message-Id: <20220505092656.728925-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.74; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

-machine graphics=off is the usual way to tell the firmware or the OS that the
user wants a serial console.  The pseries machine however does not support
this, and never adds the stdout-path node to the device tree if a VGA device
is provided.  This is in addition to the other magic behavior of VGA devices,
which is to add a keyboard and mouse to the default USB bus.

Split spapr->has_graphics in two variables so that the two behaviors can be
separated: the USB devices remains the same, but the stdout-path is added
even with "-device VGA -machine graphics=off".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/ppc/spapr.c         | 12 ++++++++----
 include/hw/ppc/spapr.h |  2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 22569305d2..05eacf29b8 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1066,7 +1066,7 @@ static void spapr_dt_chosen(SpaprMachineState *spapr, void *fdt, bool reset)
             _FDT(fdt_setprop_string(fdt, chosen, "qemu,boot-device", boot_device));
         }
 
-        if (!spapr->has_graphics && stdout_path) {
+        if (!spapr->want_stdout_path && stdout_path) {
             /*
              * "linux,stdout-path" and "stdout" properties are
              * deprecated by linux kernel. New platforms should only
@@ -2711,6 +2711,7 @@ static void spapr_machine_init(MachineState *machine)
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
     PCIHostState *phb;
+    bool has_vga;
     int i;
     MemoryRegion *sysmem = get_system_memory();
     long load_limit, fw_size;
@@ -2949,9 +2950,12 @@ static void spapr_machine_init(MachineState *machine)
     }
 
     /* Graphics */
-    if (spapr_vga_init(phb->bus, &error_fatal)) {
-        spapr->has_graphics = true;
+    has_vga = spapr_vga_init(phb->bus, &error_fatal);
+    if (has_vga) {
+        spapr->want_stdout_path = !machine->enable_graphics;
         machine->usb |= defaults_enabled() && !machine->usb_disabled;
+    } else {
+        spapr->want_stdout_path = true;
     }
 
     if (machine->usb) {
@@ -2961,7 +2965,7 @@ static void spapr_machine_init(MachineState *machine)
             pci_create_simple(phb->bus, -1, "nec-usb-xhci");
         }
 
-        if (spapr->has_graphics) {
+        if (has_vga) {
             USBBus *usb_bus = usb_bus_find(-1);
 
             usb_create_simple(usb_bus, "usb-kbd");
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 14b01c3f59..072dda2c72 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -194,7 +194,7 @@ struct SpaprMachineState {
     Vof *vof;
     uint64_t rtc_offset; /* Now used only during incoming migration */
     struct PPCTimebase tb;
-    bool has_graphics;
+    bool want_stdout_path;
     uint32_t vsmt;       /* Virtual SMT mode (KVM's "core stride") */
 
     /* Nested HV support (TCG only) */
-- 
2.35.1


