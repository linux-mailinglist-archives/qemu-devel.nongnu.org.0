Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B114D5253BF
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 19:34:54 +0200 (CEST)
Received: from localhost ([::1]:51048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npCiD-0005w6-Nu
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 13:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZ9-0004vW-Oa
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npCZ7-00057C-S3
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652376329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b24ag/3lg69zQUr8SVPEmaPs+R3PKIq1TKpfWQLcnNE=;
 b=TM1qGJWCuFgpflGav89S//UbpKtJR8TIw5aulpql6TKnsQMLPWnlMpOOXIFWaZvflsRZwO
 yQHkRN3RzdPrMzyGEH589UXLFq+yVShPX2NOHpWA/oGPoaQC5YRNmBhNHNE8gBhVuolUVn
 9nj7Q4yny0mimCi9RhCb86lVhzDqZAA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-XWPM8kA9NWuoluvKHKkmOg-1; Thu, 12 May 2022 13:25:28 -0400
X-MC-Unique: XWPM8kA9NWuoluvKHKkmOg-1
Received: by mail-ej1-f69.google.com with SMTP id
 nd34-20020a17090762a200b006e0ef16745cso3150066ejc.20
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 10:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b24ag/3lg69zQUr8SVPEmaPs+R3PKIq1TKpfWQLcnNE=;
 b=xiF954mhJ3BkW51yOz0YCWAC7THFFYexmotJ7mVVw+bBBapd4pvZwZtpsEtw4gXe6P
 ZIO7wjJqJVgvEgtRJCJVUKYUqLd3UJ29m7H8au7NCVQ1Z/jsZmjUuFsTI2xmzfLpPBBx
 aaeTWdHFpavgUSCjbD9g8P1o7VUxTUxDmgKYZcOAAduvvm6hzTcVfNHVaImahO0jqxcz
 daQoXamuKQgwY5ie8iRIt1zloYPmYHIDcxrMHI89wIuwx7EuLnlhO0o5+6GvnlQNClwJ
 P46aGFMZPq7/3Sv7LDU3h7VxElisfWs4coa3SVifWefiePzSV3hMzjDHl5RDZVRbAJuj
 SSHQ==
X-Gm-Message-State: AOAM531mSj96EqiCtNM6BRgj9ntu+vYuwFdCLYjayAt+B3TwHZcrDC0T
 C/34AO94THTyBm7gc6kugXTSPMu5gEaE/5uqwBl3qNN/9NftoL6dKGogNpsG9Y6cz6OE/kswhwf
 CeZW7HmiM7bhNnu3OWN5CCOe2AqeO9cg7LI0D6rwiJyHYMjvcqmSc7l0Iz/Ax2Zz56BE=
X-Received: by 2002:a17:906:a219:b0:6e4:86a3:44ea with SMTP id
 r25-20020a170906a21900b006e486a344eamr844593ejy.385.1652376326789; 
 Thu, 12 May 2022 10:25:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkO2bWJfbp++FcCFlg5bevVajI3fRX7t1CigVB6BHCpt5cTlgp3xFW4i+CxtGCZfy4dNh8zw==
X-Received: by 2002:a17:906:a219:b0:6e4:86a3:44ea with SMTP id
 r25-20020a170906a21900b006e486a344eamr844557ejy.385.1652376326495; 
 Thu, 12 May 2022 10:25:26 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a50ce4f000000b0042a2ccdd2b8sm1782490edj.70.2022.05.12.10.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 10:25:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 08/27] tests/qtest/libqos/pci: Introduce pio_limit
Date: Thu, 12 May 2022 19:24:46 +0200
Message-Id: <20220512172505.1065394-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512172505.1065394-1-pbonzini@redhat.com>
References: <20220512172505.1065394-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

At the moment the IO space limit is hardcoded to
QPCI_PIO_LIMIT = 0x10000. When accesses are performed to a bar,
the base address of this latter is compared against the limit
to decide whether we perform an IO or a memory access.

On ARM, we cannot keep this PIO limit as the arm-virt machine
uses [0x3eff0000, 0x3f000000 ] for the IO space map and we
are mandated to allocate at 0x0.

Add a new flag in QPCIBar indicating whether it is an IO bar
or a memory bar. This flag is set on QPCIBar allocation and
provisionned based on the BAR configuration. Then the new flag
is used in access functions and in iomap() function.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220504152025.1785704-2-eric.auger@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/libqos/pci-pc.c    |  1 +
 tests/qtest/libqos/pci-spapr.c |  1 +
 tests/qtest/libqos/pci.c       | 78 ++++++++++++++++++++++------------
 tests/qtest/libqos/pci.h       |  5 +--
 4 files changed, 54 insertions(+), 31 deletions(-)

diff --git a/tests/qtest/libqos/pci-pc.c b/tests/qtest/libqos/pci-pc.c
index e9dd5a57ec..81c2c055ca 100644
--- a/tests/qtest/libqos/pci-pc.c
+++ b/tests/qtest/libqos/pci-pc.c
@@ -150,6 +150,7 @@ void qpci_init_pc(QPCIBusPC *qpci, QTestState *qts, QGuestAllocator *alloc)
 
     qpci->bus.qts = qts;
     qpci->bus.pio_alloc_ptr = 0xc000;
+    qpci->bus.pio_limit = 0x10000;
     qpci->bus.mmio_alloc_ptr = 0xE0000000;
     qpci->bus.mmio_limit = 0x100000000ULL;
 
diff --git a/tests/qtest/libqos/pci-spapr.c b/tests/qtest/libqos/pci-spapr.c
index 76bf9a855d..0f1023e4a7 100644
--- a/tests/qtest/libqos/pci-spapr.c
+++ b/tests/qtest/libqos/pci-spapr.c
@@ -197,6 +197,7 @@ void qpci_init_spapr(QPCIBusSPAPR *qpci, QTestState *qts,
 
     qpci->bus.qts = qts;
     qpci->bus.pio_alloc_ptr = 0xc000;
+    qpci->bus.pio_limit = 0x10000;
     qpci->bus.mmio_alloc_ptr = qpci->mmio32.pci_base;
     qpci->bus.mmio_limit = qpci->mmio32.pci_base + qpci->mmio32.size;
 
diff --git a/tests/qtest/libqos/pci.c b/tests/qtest/libqos/pci.c
index 3a9076ae58..b23d72346b 100644
--- a/tests/qtest/libqos/pci.c
+++ b/tests/qtest/libqos/pci.c
@@ -398,44 +398,56 @@ void qpci_config_writel(QPCIDevice *dev, uint8_t offset, uint32_t value)
 
 uint8_t qpci_io_readb(QPCIDevice *dev, QPCIBar token, uint64_t off)
 {
-    if (token.addr < QPCI_PIO_LIMIT) {
-        return dev->bus->pio_readb(dev->bus, token.addr + off);
+    QPCIBus *bus = dev->bus;
+
+    if (token.is_io) {
+        return bus->pio_readb(bus, token.addr + off);
     } else {
         uint8_t val;
-        dev->bus->memread(dev->bus, token.addr + off, &val, sizeof(val));
+
+        bus->memread(dev->bus, token.addr + off, &val, sizeof(val));
         return val;
     }
 }
 
 uint16_t qpci_io_readw(QPCIDevice *dev, QPCIBar token, uint64_t off)
 {
-    if (token.addr < QPCI_PIO_LIMIT) {
-        return dev->bus->pio_readw(dev->bus, token.addr + off);
+    QPCIBus *bus = dev->bus;
+
+    if (token.is_io) {
+        return bus->pio_readw(bus, token.addr + off);
     } else {
         uint16_t val;
-        dev->bus->memread(dev->bus, token.addr + off, &val, sizeof(val));
+
+        bus->memread(bus, token.addr + off, &val, sizeof(val));
         return le16_to_cpu(val);
     }
 }
 
 uint32_t qpci_io_readl(QPCIDevice *dev, QPCIBar token, uint64_t off)
 {
-    if (token.addr < QPCI_PIO_LIMIT) {
-        return dev->bus->pio_readl(dev->bus, token.addr + off);
+    QPCIBus *bus = dev->bus;
+
+    if (token.is_io) {
+        return bus->pio_readl(bus, token.addr + off);
     } else {
         uint32_t val;
-        dev->bus->memread(dev->bus, token.addr + off, &val, sizeof(val));
+
+        bus->memread(dev->bus, token.addr + off, &val, sizeof(val));
         return le32_to_cpu(val);
     }
 }
 
 uint64_t qpci_io_readq(QPCIDevice *dev, QPCIBar token, uint64_t off)
 {
-    if (token.addr < QPCI_PIO_LIMIT) {
-        return dev->bus->pio_readq(dev->bus, token.addr + off);
+    QPCIBus *bus = dev->bus;
+
+    if (token.is_io) {
+        return bus->pio_readq(bus, token.addr + off);
     } else {
         uint64_t val;
-        dev->bus->memread(dev->bus, token.addr + off, &val, sizeof(val));
+
+        bus->memread(bus, token.addr + off, &val, sizeof(val));
         return le64_to_cpu(val);
     }
 }
@@ -443,57 +455,65 @@ uint64_t qpci_io_readq(QPCIDevice *dev, QPCIBar token, uint64_t off)
 void qpci_io_writeb(QPCIDevice *dev, QPCIBar token, uint64_t off,
                     uint8_t value)
 {
-    if (token.addr < QPCI_PIO_LIMIT) {
-        dev->bus->pio_writeb(dev->bus, token.addr + off, value);
+    QPCIBus *bus = dev->bus;
+
+    if (token.is_io) {
+        bus->pio_writeb(bus, token.addr + off, value);
     } else {
-        dev->bus->memwrite(dev->bus, token.addr + off, &value, sizeof(value));
+        bus->memwrite(bus, token.addr + off, &value, sizeof(value));
     }
 }
 
 void qpci_io_writew(QPCIDevice *dev, QPCIBar token, uint64_t off,
                     uint16_t value)
 {
-    if (token.addr < QPCI_PIO_LIMIT) {
-        dev->bus->pio_writew(dev->bus, token.addr + off, value);
+    QPCIBus *bus = dev->bus;
+
+    if (token.is_io) {
+        bus->pio_writew(bus, token.addr + off, value);
     } else {
         value = cpu_to_le16(value);
-        dev->bus->memwrite(dev->bus, token.addr + off, &value, sizeof(value));
+        bus->memwrite(bus, token.addr + off, &value, sizeof(value));
     }
 }
 
 void qpci_io_writel(QPCIDevice *dev, QPCIBar token, uint64_t off,
                     uint32_t value)
 {
-    if (token.addr < QPCI_PIO_LIMIT) {
-        dev->bus->pio_writel(dev->bus, token.addr + off, value);
+    QPCIBus *bus = dev->bus;
+
+    if (token.is_io) {
+        bus->pio_writel(bus, token.addr + off, value);
     } else {
         value = cpu_to_le32(value);
-        dev->bus->memwrite(dev->bus, token.addr + off, &value, sizeof(value));
+        bus->memwrite(bus, token.addr + off, &value, sizeof(value));
     }
 }
 
 void qpci_io_writeq(QPCIDevice *dev, QPCIBar token, uint64_t off,
                     uint64_t value)
 {
-    if (token.addr < QPCI_PIO_LIMIT) {
-        dev->bus->pio_writeq(dev->bus, token.addr + off, value);
+    QPCIBus *bus = dev->bus;
+
+    if (token.is_io) {
+        bus->pio_writeq(bus, token.addr + off, value);
     } else {
         value = cpu_to_le64(value);
-        dev->bus->memwrite(dev->bus, token.addr + off, &value, sizeof(value));
+        bus->memwrite(bus, token.addr + off, &value, sizeof(value));
     }
 }
 
 void qpci_memread(QPCIDevice *dev, QPCIBar token, uint64_t off,
                   void *buf, size_t len)
 {
-    g_assert(token.addr >= QPCI_PIO_LIMIT);
+    g_assert(!token.is_io);
     dev->bus->memread(dev->bus, token.addr + off, buf, len);
 }
 
 void qpci_memwrite(QPCIDevice *dev, QPCIBar token, uint64_t off,
                    const void *buf, size_t len)
 {
-    g_assert(token.addr >= QPCI_PIO_LIMIT);
+    g_assert(!token.is_io);
     dev->bus->memwrite(dev->bus, token.addr + off, buf, len);
 }
 
@@ -534,9 +554,10 @@ QPCIBar qpci_iomap(QPCIDevice *dev, int barno, uint64_t *sizeptr)
         loc = QEMU_ALIGN_UP(bus->pio_alloc_ptr, size);
 
         g_assert(loc >= bus->pio_alloc_ptr);
-        g_assert(loc + size <= QPCI_PIO_LIMIT); /* Keep PIO below 64kiB */
+        g_assert(loc + size <= bus->pio_limit);
 
         bus->pio_alloc_ptr = loc + size;
+        bar.is_io = true;
 
         qpci_config_writel(dev, bar_reg, loc | PCI_BASE_ADDRESS_SPACE_IO);
     } else {
@@ -547,6 +568,7 @@ QPCIBar qpci_iomap(QPCIDevice *dev, int barno, uint64_t *sizeptr)
         g_assert(loc + size <= bus->mmio_limit);
 
         bus->mmio_alloc_ptr = loc + size;
+        bar.is_io = false;
 
         qpci_config_writel(dev, bar_reg, loc);
     }
@@ -562,7 +584,7 @@ void qpci_iounmap(QPCIDevice *dev, QPCIBar bar)
 
 QPCIBar qpci_legacy_iomap(QPCIDevice *dev, uint16_t addr)
 {
-    QPCIBar bar = { .addr = addr };
+    QPCIBar bar = { .addr = addr, .is_io = true };
     return bar;
 }
 
diff --git a/tests/qtest/libqos/pci.h b/tests/qtest/libqos/pci.h
index e705e06598..a3c657d962 100644
--- a/tests/qtest/libqos/pci.h
+++ b/tests/qtest/libqos/pci.h
@@ -16,8 +16,6 @@
 #include "../libqtest.h"
 #include "qgraph.h"
 
-#define QPCI_PIO_LIMIT    0x10000
-
 #define QPCI_DEVFN(dev, fn) (((dev) << 3) | (fn))
 
 typedef struct QPCIDevice QPCIDevice;
@@ -51,7 +49,7 @@ struct QPCIBus {
                           uint8_t offset, uint32_t value);
 
     QTestState *qts;
-    uint16_t pio_alloc_ptr;
+    uint64_t pio_alloc_ptr, pio_limit;
     uint64_t mmio_alloc_ptr, mmio_limit;
     bool has_buggy_msi; /* TRUE for spapr, FALSE for pci */
 
@@ -59,6 +57,7 @@ struct QPCIBus {
 
 struct QPCIBar {
     uint64_t addr;
+    bool is_io;
 };
 
 struct QPCIDevice
-- 
2.36.0


