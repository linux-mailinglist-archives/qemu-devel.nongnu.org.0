Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85246671ACD
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 12:36:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI6io-0004c0-7r; Wed, 18 Jan 2023 06:35:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI6iE-0004WC-8N
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:34:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI6iB-0007Wo-8N
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674041673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dYNMcfAX0BLL+XCo/BYEEwgqgUcrj4uRnGWW+k846rA=;
 b=IKYVV5/TG0q5WcMv482gFKiU0xdEfkHMmfzoQmE7/bxua3nHuYwXQhY+h4R7y1brCtA4n+
 gNVsQoetxjhk6soNvY/Ou8Wt0y58+fF87EG+JZUbWJIXV9BB9zT6MtLchDJTV02dixGkmu
 eK8aK5jXE2mV379UD92qmU0/05bV2uY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-iTLMDCYsOXmhXaDXp3jQ_g-1; Wed, 18 Jan 2023 06:34:30 -0500
X-MC-Unique: iTLMDCYsOXmhXaDXp3jQ_g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2F461C08974;
 Wed, 18 Jan 2023 11:34:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B52EF492B00;
 Wed, 18 Jan 2023 11:34:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 7/9] tests/qtest/libqos/e1000e: Remove duplicate register
 definitions
Date: Wed, 18 Jan 2023 12:34:16 +0100
Message-Id: <20230118113418.1650416-8-thuth@redhat.com>
In-Reply-To: <20230118113418.1650416-1-thuth@redhat.com>
References: <20230118113418.1650416-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Akihiko Odaki <akihiko.odaki@daynix.com>

The register definitions in tests/qtest/libqos/e1000e.h had names
different from hw/net/e1000_regs.h, which made it hard to understand
what test codes corresponds to the implementation. Use
hw/net/e1000_regs.h from tests/qtest/libqos/e1000e.c to remove
these duplications.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230114035919.35251-20-akihiko.odaki@daynix.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqos/e1000e.h |  5 -----
 tests/qtest/libqos/e1000e.c | 20 ++++++++++----------
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/tests/qtest/libqos/e1000e.h b/tests/qtest/libqos/e1000e.h
index 3bf285af42..091ce139da 100644
--- a/tests/qtest/libqos/e1000e.h
+++ b/tests/qtest/libqos/e1000e.h
@@ -25,11 +25,6 @@
 #define E1000E_RX0_MSG_ID           (0)
 #define E1000E_TX0_MSG_ID           (1)
 
-#define E1000E_TDLEN    (0x3808)
-#define E1000E_TDT      (0x3818)
-#define E1000E_RDLEN    (0x2808)
-#define E1000E_RDT      (0x2818)
-
 typedef struct QE1000E QE1000E;
 typedef struct QE1000E_PCI QE1000E_PCI;
 
diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
index b90eb2d5e0..28fb3052aa 100644
--- a/tests/qtest/libqos/e1000e.c
+++ b/tests/qtest/libqos/e1000e.c
@@ -51,13 +51,13 @@ static uint32_t e1000e_macreg_read(QE1000E *d, uint32_t reg)
 void e1000e_tx_ring_push(QE1000E *d, void *descr)
 {
     QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
-    uint32_t tail = e1000e_macreg_read(d, E1000E_TDT);
-    uint32_t len = e1000e_macreg_read(d, E1000E_TDLEN) / E1000_RING_DESC_LEN;
+    uint32_t tail = e1000e_macreg_read(d, E1000_TDT);
+    uint32_t len = e1000e_macreg_read(d, E1000_TDLEN) / E1000_RING_DESC_LEN;
 
     qtest_memwrite(d_pci->pci_dev.bus->qts,
                    d->tx_ring + tail * E1000_RING_DESC_LEN,
                    descr, E1000_RING_DESC_LEN);
-    e1000e_macreg_write(d, E1000E_TDT, (tail + 1) % len);
+    e1000e_macreg_write(d, E1000_TDT, (tail + 1) % len);
 
     /* Read WB data for the packet transmitted */
     qtest_memread(d_pci->pci_dev.bus->qts,
@@ -68,13 +68,13 @@ void e1000e_tx_ring_push(QE1000E *d, void *descr)
 void e1000e_rx_ring_push(QE1000E *d, void *descr)
 {
     QE1000E_PCI *d_pci = container_of(d, QE1000E_PCI, e1000e);
-    uint32_t tail = e1000e_macreg_read(d, E1000E_RDT);
-    uint32_t len = e1000e_macreg_read(d, E1000E_RDLEN) / E1000_RING_DESC_LEN;
+    uint32_t tail = e1000e_macreg_read(d, E1000_RDT);
+    uint32_t len = e1000e_macreg_read(d, E1000_RDLEN) / E1000_RING_DESC_LEN;
 
     qtest_memwrite(d_pci->pci_dev.bus->qts,
                    d->rx_ring + tail * E1000_RING_DESC_LEN,
                    descr, E1000_RING_DESC_LEN);
-    e1000e_macreg_write(d, E1000E_RDT, (tail + 1) % len);
+    e1000e_macreg_write(d, E1000_RDT, (tail + 1) % len);
 
     /* Read WB data for the packet received */
     qtest_memread(d_pci->pci_dev.bus->qts,
@@ -145,8 +145,8 @@ static void e1000e_pci_start_hw(QOSGraphObject *obj)
                            (uint32_t) d->e1000e.tx_ring);
     e1000e_macreg_write(&d->e1000e, E1000_TDBAH,
                            (uint32_t) (d->e1000e.tx_ring >> 32));
-    e1000e_macreg_write(&d->e1000e, E1000E_TDLEN, E1000E_RING_LEN);
-    e1000e_macreg_write(&d->e1000e, E1000E_TDT, 0);
+    e1000e_macreg_write(&d->e1000e, E1000_TDLEN, E1000E_RING_LEN);
+    e1000e_macreg_write(&d->e1000e, E1000_TDT, 0);
     e1000e_macreg_write(&d->e1000e, E1000_TDH, 0);
 
     /* Enable transmit */
@@ -156,8 +156,8 @@ static void e1000e_pci_start_hw(QOSGraphObject *obj)
                            (uint32_t)d->e1000e.rx_ring);
     e1000e_macreg_write(&d->e1000e, E1000_RDBAH,
                            (uint32_t)(d->e1000e.rx_ring >> 32));
-    e1000e_macreg_write(&d->e1000e, E1000E_RDLEN, E1000E_RING_LEN);
-    e1000e_macreg_write(&d->e1000e, E1000E_RDT, 0);
+    e1000e_macreg_write(&d->e1000e, E1000_RDLEN, E1000E_RING_LEN);
+    e1000e_macreg_write(&d->e1000e, E1000_RDT, 0);
     e1000e_macreg_write(&d->e1000e, E1000_RDH, 0);
 
     /* Enable receive */
-- 
2.31.1


