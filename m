Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 588AE60C09
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 22:04:35 +0200 (CEST)
Received: from localhost ([::1]:55684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjURe-0000Rg-IV
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 16:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55696)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hjUES-0005eR-3A
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 15:50:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hjUER-0004Eh-4Y
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 15:50:56 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38350)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hjUEQ-0004Dw-UK
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 15:50:55 -0400
Received: by mail-wr1-x429.google.com with SMTP id g17so823366wrr.5
 for <qemu-devel@nongnu.org>; Fri, 05 Jul 2019 12:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=f5eaHZEx4jvTLEPdXp22zQYyufBn4vXvsMxeTuvnmkU=;
 b=OANXjfVHxAtxucVZBDQSkmghfICiUPDWLlr7zZEL/RVjvLAARWW0SYC6IIX4eDv0tz
 NWBpgNcPBbHrhYSZMw1TlHKEgvRM3SlM9xzAglf6BSRuqeOWV4snFpOxPv4Y/RrbFqAl
 upqA9L8btvQzCYVK0zzk3A2NN/2ktt5rDybwKK2m5jn8J/WV4bIV0nYgJKEwYhHTAJay
 ILPTzZaRuEE8K2iLaZNdFS6SeRzJrnEDvtZiAJRoa+bNNxBwRIf00aFe/R2JQ+gvdm1b
 ikyEso+/k0IItAyAO7s1Ey9aVUGa8X4BwI7MHuXMyhEULrRvOrBZAkUsc8q95ziOU6LY
 +ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=f5eaHZEx4jvTLEPdXp22zQYyufBn4vXvsMxeTuvnmkU=;
 b=W6CxgsLOZWAoQGTT/2wf8m8RyFpouqG6vBFuXq7DYKyTUbVmT9lShlKGue7FQis+rD
 xZOcxsCDJW4hDfGA9ax5Em8liKKziGgmsVPxuGyIDtcb6r9TTyankCrUmx6ppmCf0eiD
 sNYSOKGEOVW559PcVfyfZplXWkY1hgOGasETyUNCea6NEQ7O4wpQZcFiZTli6A7/Epih
 3xy/qriiPz7GUgdsfMtJiw6lKHkAg9Hok7Wy4Uz0qBPyIlK69kP3zmTDcaAtGMgFnnzW
 akz3JHZjxY6UlIdwTVnfKExIdOQWoxlDRny5q2jY3PIjfCNUNbYJM1LV71iEbNE1iHAp
 Kd7g==
X-Gm-Message-State: APjAAAUowPqmwO4zLF0Mc2awSmQpC9gn8rZnaskuprWHmI3Q/vuB5u6y
 nHIXBcsm7lYmhbwbHwuLsuKVJFU+qZA=
X-Google-Smtp-Source: APXvYqy0kMHB8DsKPyepyyVdj54ccmDJdpwr5U/WiLGnVDQ+FN2T3MxG3cAGfdaSjBgXQ/2sBhIiVg==
X-Received: by 2002:a5d:5692:: with SMTP id f18mr5207631wrv.104.1562356253717; 
 Fri, 05 Jul 2019 12:50:53 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id d10sm11478625wro.18.2019.07.05.12.50.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 12:50:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 21:50:38 +0200
Message-Id: <1562356239-19391-12-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1562356239-19391-1-git-send-email-pbonzini@redhat.com>
References: <1562356239-19391-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::429
Subject: [Qemu-devel] [PULL 11/12] hw/i386: Fix linker error when ISAPC is
 disabled
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
Cc: Julio Montes <julio.montes@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Julio Montes <julio.montes@intel.com>

v2: include config-devices.h to use CONFIG_IDE_ISA

Message-Id: <20190705143554.10295-2-julio.montes@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/pc_piix.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index c07c4a5..cc04c01 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "config-devices.h"
 
 #include "qemu/units.h"
 #include "hw/hw.h"
@@ -61,9 +62,11 @@
 
 #define MAX_IDE_BUS 2
 
+#ifdef CONFIG_IDE_ISA
 static const int ide_iobase[MAX_IDE_BUS] = { 0x1f0, 0x170 };
 static const int ide_iobase2[MAX_IDE_BUS] = { 0x3f6, 0x376 };
 static const int ide_irq[MAX_IDE_BUS] = { 14, 15 };
+#endif
 
 /* PC hardware initialisation */
 static void pc_init1(MachineState *machine,
@@ -254,7 +257,10 @@ static void pc_init1(MachineState *machine,
         }
         idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
         idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
-    } else {
+        pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
+    }
+#ifdef CONFIG_IDE_ISA
+else {
         for(i = 0; i < MAX_IDE_BUS; i++) {
             ISADevice *dev;
             char busname[] = "ide.0";
@@ -268,9 +274,9 @@ static void pc_init1(MachineState *machine,
             busname[4] = '0' + i;
             idebus[i] = qdev_get_child_bus(DEVICE(dev), busname);
         }
+        pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
     }
-
-    pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
+#endif
 
     if (pcmc->pci_enabled && machine_usb(machine)) {
         pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
-- 
1.8.3.1



