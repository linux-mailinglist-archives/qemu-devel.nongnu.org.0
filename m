Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254F24CD619
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:14:29 +0100 (CET)
Received: from localhost ([::1]:48958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8hQ-0006Pe-6p
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:14:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ89L-00015d-Ny
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:39:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ89J-0000WP-If
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:39:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2c9S+S6IpsBoCVea/PfI2CEqwPpLfLPV5fPeo9+uWlA=;
 b=UM1R9yS6eQcRuUoGDp+vLxkm0yI8JrPD6aPPMKSnrxPPiGfeRevmf+Rr4e7BWCRMorrWX2
 qXTn42RLnd2Le8oBa8NVozqq1IFJ1vGI/AB7z+udxM2OuT8IaleFCOD835ziIE0O6Wr8eT
 bxwAOg2m1T2OfSHzxe5Nj/aMX6w5d60=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-le-Sw3OiOH2joDMhKYgPJw-1; Fri, 04 Mar 2022 08:39:12 -0500
X-MC-Unique: le-Sw3OiOH2joDMhKYgPJw-1
Received: by mail-wr1-f69.google.com with SMTP id
 w2-20020adfbac2000000b001ea99ca4c50so3400238wrg.11
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:39:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2c9S+S6IpsBoCVea/PfI2CEqwPpLfLPV5fPeo9+uWlA=;
 b=UFLGcAuxNXw062YdXFpZEpxUqEubLZda/RyRx8MVbYJgzrT4n22Wxe07tpNacq/x3r
 JoYtprUfKTxQQ3LqxqBJouN/Ifu9WwGMTulhfeHTUSoq8mV5NIEeHMxWKEtskc+10bYy
 Lmb5P8PzQQELxQPNHLsaP+pGLW0Q+A1+riSxC/8PmQuQu4jrGjmZqV3EXZeWNkXI1o5p
 mMl11fO0EtESmZKI3yAwXefUmufRapLE2lBQDY3Qn9RTeEUVrrDgSBobEB75nFRY31dx
 RcP2zogfLCJmPgbg3BRm9daLHPhhu7/mj48ZA2tXgt0iWx8jZzvhXSRWxGKuofahKfjh
 hsPA==
X-Gm-Message-State: AOAM531pjHI//Kn9DU+Pzb84ptl+MORnTz05AkczFRj7z+0bWoRPqYXh
 ilSJs14wt7u8dTb3PA0nsOaJUQR/NUHSrN1jPpg6DvbqCY1BXh7kOm1KcuiItRVlnM37hqr4tGP
 R76uscqugbMBDhRAMGu/54Gi3iRDP2TToZrB9T6xwVuvH8m2LkyNMB1sYlb0i
X-Received: by 2002:a1c:f211:0:b0:381:6c60:742f with SMTP id
 s17-20020a1cf211000000b003816c60742fmr7785674wmc.130.1646401149002; 
 Fri, 04 Mar 2022 05:39:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzi4doI9IPoHCLSmsRqD7QeC9oQD3wk0zia3gWYxEO4KEDpkLL93mptWS7MwG1VDBSqdCrq/A==
X-Received: by 2002:a1c:f211:0:b0:381:6c60:742f with SMTP id
 s17-20020a1cf211000000b003816c60742fmr7785644wmc.130.1646401148656; 
 Fri, 04 Mar 2022 05:39:08 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 w2-20020adfbac2000000b001f00a723202sm7988864wrg.72.2022.03.04.05.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:39:04 -0800 (PST)
Date: Fri, 4 Mar 2022 08:39:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/45] tests/qtest/libqos/pci: Introduce pio_limit
Message-ID: <20220304133556.233983-14-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
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
Message-Id: <20220210145254.157790-3-eric.auger@redhat.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqos/pci.h       |  5 +--
 tests/qtest/libqos/pci-pc.c    |  1 +
 tests/qtest/libqos/pci-spapr.c |  1 +
 tests/qtest/libqos/pci.c       | 78 ++++++++++++++++++++++------------
 4 files changed, 54 insertions(+), 31 deletions(-)

diff --git a/tests/qtest/libqos/pci.h b/tests/qtest/libqos/pci.h
index becb800f9e..44f6806fe4 100644
--- a/tests/qtest/libqos/pci.h
+++ b/tests/qtest/libqos/pci.h
@@ -16,8 +16,6 @@
 #include "libqtest.h"
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
diff --git a/tests/qtest/libqos/pci-pc.c b/tests/qtest/libqos/pci-pc.c
index f97844289f..8051a0881a 100644
--- a/tests/qtest/libqos/pci-pc.c
+++ b/tests/qtest/libqos/pci-pc.c
@@ -150,6 +150,7 @@ void qpci_init_pc(QPCIBusPC *qpci, QTestState *qts, QGuestAllocator *alloc)
 
     qpci->bus.qts = qts;
     qpci->bus.pio_alloc_ptr = 0xc000;
+    qpci->bus.pio_limit = 0x10000;
     qpci->bus.mmio_alloc_ptr = 0xE0000000;
     qpci->bus.mmio_limit = 0x100000000ULL;
 
diff --git a/tests/qtest/libqos/pci-spapr.c b/tests/qtest/libqos/pci-spapr.c
index 262226985f..870ffdd8b5 100644
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
 
-- 
MST


