Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CB751E486
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 07:53:40 +0200 (CEST)
Received: from localhost ([::1]:58848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnDNr-0003GF-Gc
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 01:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nnDIw-0000bR-GN
 for qemu-devel@nongnu.org; Sat, 07 May 2022 01:48:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nnDIu-0003Cy-QC
 for qemu-devel@nongnu.org; Sat, 07 May 2022 01:48:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651902512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JGmHQMqCNcf001QFE7AizmcF+NcMPpfczKkVsKVaGlw=;
 b=ilkzbtDFyhYxghvyvtTZl8ZUIhRW2jLYDjrazGBJW63MshkeBoEyNpZzpecoVIm3hiDc3n
 DbqdT0syvcgkgGsleVc5zO/kP8F0tsA1k5+bFj397Rjqr48in68thyhXG47OHCPjfl6Dgb
 MQQGjNbNNb4At9ddblBUCDFQ13d0ddk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-Azno55sjNKKqJLkXovmAqQ-1; Sat, 07 May 2022 01:48:31 -0400
X-MC-Unique: Azno55sjNKKqJLkXovmAqQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 ch28-20020a0564021bdc00b00425cb227ab4so5022861edb.4
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 22:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JGmHQMqCNcf001QFE7AizmcF+NcMPpfczKkVsKVaGlw=;
 b=Iy7AM9zxorKDYVTh6qrJBYKJ+SOgU9FXe8KLanJKxeJ8T9u9p3VObY0xTvxlLobs8A
 vlRta02myqh3JHfH+BXrAD5FB/kdwnfowv7trmRCgmjLDCVKaDYYs6rE3aQiuzZ+8d9c
 4CT4bb+OzD3O8XIQP0Cp2pqcbu3G4++ibezY7WjGIjUJWEQBb/ZePbGXOWYZZY/2xMXG
 DfGqb2fLeBJkLHAjDj0hV+WVa8LdV9bDIJnu0k3XzFzoChZJlW3DjRmgSBsfZnPL5Qgg
 4fXADadewMdEKzUHi9hH1oFuc+ei8gb76974ixeAJsIkYdjFTcdhE21gIIHDUbG7OYHt
 oEgA==
X-Gm-Message-State: AOAM531ubxdSHA2ztpsf/aYNmMyux/Ry3Oc5jmzY6iQBKxmS90z2oqvH
 oj2tEaM7uEp9NzhHi9iGEgBk6SxBRg3mZI/5hXsM3U/rNADUH1vb/yWo2VJdsf6fK1ikM5+fJip
 rMe4JkCaZKXnIHz/whp9kF1Mca22VZeOmbc6PgO5HJXG9+pBDI+6mqsL1OWgJ5TNmEIQ=
X-Received: by 2002:a17:906:79c4:b0:6cf:5489:da57 with SMTP id
 m4-20020a17090679c400b006cf5489da57mr6105972ejo.48.1651902509649; 
 Fri, 06 May 2022 22:48:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUZMe3Zy1pWow4AHvm8O8+GeDzdjR6aIIxUxdPm9vxG9jysgubUQ5fQ4UqnJUOLqaw9RUdWw==
X-Received: by 2002:a17:906:79c4:b0:6cf:5489:da57 with SMTP id
 m4-20020a17090679c400b006cf5489da57mr6105960ejo.48.1651902509418; 
 Fri, 06 May 2022 22:48:29 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 hw7-20020a170907a0c700b006f3ef214e73sm2668869ejc.217.2022.05.06.22.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 22:48:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: danielhb413@gmail.com,
	qemu-ppc@nongnu.org
Subject: [PATCH v2] pseries: allow setting stdout-path even on machines with a
 VGA
Date: Sat,  7 May 2022 07:48:26 +0200
Message-Id: <20220507054826.124936-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index fe9937e811..75189e4020 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1066,7 +1066,7 @@ static void spapr_dt_chosen(SpaprMachineState *spapr, void *fdt, bool reset)
             _FDT(fdt_setprop_string(fdt, chosen, "qemu,boot-device", boot_device));
         }
 
-        if (!spapr->has_graphics && stdout_path) {
+        if (spapr->want_stdout_path && stdout_path) {
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


