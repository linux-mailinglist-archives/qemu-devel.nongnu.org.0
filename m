Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10694FCC3A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 04:14:49 +0200 (CEST)
Received: from localhost ([::1]:37206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne63M-0006nm-RU
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 22:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ne5zD-0003zb-22
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 22:10:31 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:34808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ne5z9-0001kA-7H
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 22:10:29 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 g12-20020a17090a640c00b001cb59d7a57cso867497pjj.1
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 19:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tTOZt42cdW9ewoAI+nHU9OmE05mRjlLe8L41OPvyaxo=;
 b=Gq5moTm/oMfKJwbdPRF1ljj0iAN+fW/Red4XsAkO7LB87Cnlo+QPyUih52dcFrgncs
 KZIclMXGjjpI6awwZWOuC9E0lUu40J6zTtj0DKqM9mJgHEtMyxC9ZU7Yzh2FsQoqhoZ+
 qY6INJ5bH/QyvPIixA6lImMzntWHRm+4EBvtHoSHcprZKhYKFgSulSK5kqYumB65KPFW
 o7kZButEVpwYm6hSaUlR8Oq+k0+gbJhPtQ/HnpKHvhzHmXp6mzb3WMamM+dSRkyj18OV
 Cwgm4d5sjiY97xy71dW5CaJ49Y1nIpW2vfviymQ74UTaXSSSEUNLDTQAQa80XUbyVQbt
 CBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tTOZt42cdW9ewoAI+nHU9OmE05mRjlLe8L41OPvyaxo=;
 b=BtXoDt/40EhMbw3Zp0H8fig3TTa3wIw1bCWBWgXTtJLyn/c4ReTcY5VQJ7vnyMwsZz
 BqTrDFM3gX6KpBzclEFTak1nVAVqTcWnttWsZSAA9K50k43DZ54EeaBF+t6lGTLyqj8s
 6iwS4EdlKqaEn+oVjYenUseeHKNToB8mmuDlFrKzVA4SpwIfQdj57f4hmRpZ3O4VHbY4
 jk6X2FncVqjM5i66yLdTf/EEkgqVL9tb2wJy+UNqeGUxTPntHsgjQr8CVkw3qiBCgEiO
 hurAlGJPm58wtMWhIsrJxS6+RnBVxhiqJOF2ktxKsJozQ7QVH3rZ9fQrg0dE0QbIom+N
 0i/Q==
X-Gm-Message-State: AOAM533o0SoXOBYoq/+AQknmJaT4P5ZsAsLlefUX/i3L2KUhqV+uZ8GK
 70J/c+20/Dri/7BMpNtaaCNHiDGnDDEeHw==
X-Google-Smtp-Source: ABdhPJylLgEYfbxJIxB90znSyaLgjoUFd4k/Orl3orZ7QByD6G+jiIs4CD4oZ/q1IyJ+IypcS40s2w==
X-Received: by 2002:a17:903:31cd:b0:158:542b:908d with SMTP id
 v13-20020a17090331cd00b00158542b908dmr9870520ple.16.1649729425222; 
 Mon, 11 Apr 2022 19:10:25 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a056a00158900b004faad3ae570sm37946504pfk.189.2022.04.11.19.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 19:10:24 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [RFC 1/3] serial: Enable MSI capablity and option
Date: Mon, 11 Apr 2022 19:10:07 -0700
Message-Id: <20220412021009.582424-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412021009.582424-1-atishp@rivosinc.com>
References: <20220412021009.582424-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The seria-pci device doesn't support MSI. Enable the device to provide
MSI so that any platform with MSI support only can also use
this serial device. MSI can be enabled by enabling the newly introduced
device property. This will be disabled by default preserving the current
behavior of the seria-pci device.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 hw/char/serial-pci.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index 93d6f9924425..ca93c2ce2776 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -31,6 +31,7 @@
 #include "hw/char/serial.h"
 #include "hw/irq.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/msi.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qom/object.h"
@@ -39,26 +40,54 @@ struct PCISerialState {
     PCIDevice dev;
     SerialState state;
     uint8_t prog_if;
+    bool msi_enabled;
 };
 
 #define TYPE_PCI_SERIAL "pci-serial"
 OBJECT_DECLARE_SIMPLE_TYPE(PCISerialState, PCI_SERIAL)
 
+
+static void msi_irq_handler(void *opaque, int irq_num, int level)
+{
+    PCIDevice *pci_dev = opaque;
+
+    assert(level == 0 || level == 1);
+
+    if (msi_enabled(pci_dev)) {
+        msi_notify(pci_dev, 0);
+    }
+}
+
 static void serial_pci_realize(PCIDevice *dev, Error **errp)
 {
     PCISerialState *pci = DO_UPCAST(PCISerialState, dev, dev);
     SerialState *s = &pci->state;
+    Error *err = NULL;
+    int ret;
 
     if (!qdev_realize(DEVICE(s), NULL, errp)) {
         return;
     }
 
     pci->dev.config[PCI_CLASS_PROG] = pci->prog_if;
-    pci->dev.config[PCI_INTERRUPT_PIN] = 0x01;
-    s->irq = pci_allocate_irq(&pci->dev);
-
+    if (pci->msi_enabled) {
+        pci->dev.config[PCI_INTERRUPT_PIN] = 0x00;
+        s->irq = qemu_allocate_irq(msi_irq_handler, &pci->dev, 100);
+    } else {
+        pci->dev.config[PCI_INTERRUPT_PIN] = 0x01;
+        s->irq = pci_allocate_irq(&pci->dev);
+    }
     memory_region_init_io(&s->io, OBJECT(pci), &serial_io_ops, s, "serial", 8);
     pci_register_bar(&pci->dev, 0, PCI_BASE_ADDRESS_SPACE_IO, &s->io);
+
+    if (!pci->msi_enabled) {
+        return;
+    }
+
+    ret = msi_init(&pci->dev, 0, 1, true, false, &err);
+    if (ret == -ENOTSUP) {
+        fprintf(stdout, "MSIX INIT FAILED\n");
+    }
 }
 
 static void serial_pci_exit(PCIDevice *dev)
@@ -83,6 +112,7 @@ static const VMStateDescription vmstate_pci_serial = {
 
 static Property serial_pci_properties[] = {
     DEFINE_PROP_UINT8("prog_if",  PCISerialState, prog_if, 0x02),
+    DEFINE_PROP_BOOL("msi",  PCISerialState, msi_enabled, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.25.1


