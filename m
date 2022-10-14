Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFB05FEA30
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 10:10:55 +0200 (CEST)
Received: from localhost ([::1]:58834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojFmP-0000ws-JR
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 04:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFb0-0002bC-Bl
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:59:08 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:61598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFax-0001sU-7l
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665734343; x=1697270343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OGwGh9LZz7woRDRU72LLOtvvdTlq5B35RSZogAW/Y44=;
 b=D2yOOiKN+sp71zesz2ZFzMJwZtFr5p62GX4oAENpIAhipXUQuNfBRGLF
 ZScn028aoZ6lOcjYQmy9EIbHqcRZ+keOlqPPpbxBZcdTG2gxQ8Dc5sd8O
 tr4c69wkE5VjnFrbsxkfjcCy5lNwItqp2sMxJ61UVDs9xDsYsmXGqK5ko
 i1CVegPPtRkghoTXXYXpXqKUM9yGyqjj6X4776XuSreK4yKKSIwAbU2xr
 MWH1e/t+Hs+Wz5hAOKg/IzGNR+3cr+TYEjAMNw7Uz+V6H6/kzZLCWeZ89
 Ivf4mHkBwSQxliXJyNJrPjR7Fz4rOXel+ooXnPPZTo9H6ppEkghA1YqBl A==;
X-IronPort-AV: E=Sophos;i="5.95,182,1661788800"; d="scan'208";a="213790423"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Oct 2022 15:59:00 +0800
IronPort-SDR: 27t5Fv73eK/uRzafoGTPfvIZmU/oI4Xu1delgIQnCuCREvcidtA7WTFtmsZpjUUlsGch8FZm0/
 7u1PfGCqV7xYGxO+bk3a6ThgU1mn37fZpjL9+6UjE+2jTl7bHrrgYO/FuDHtQuDV3ObMS5BMmu
 KMvPfIF6F7yYVVFHDNfsbXw97gNmZh6549h3hnN/HA8KKubXUEvoUnYvm7YOMFbTS92BrDDH6w
 ho7IBY0PPr6tAPdsuRDH1UENZx/EDPa6udIHRTPboOKmZCYrT/MVqI81P3YMISUvJhjQWqrayH
 0cf7PSHuVe9o5lOgcaJ7guz8
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 00:12:59 -0700
IronPort-SDR: ZjaJSeXTGMccu6kysi1yZXgzQYmzT73SrHPZEc4D+mFHJaZO9VV2OEoMaeHBDqvDAUGZWzpQDl
 cLLFNm46L0vHoDgjSZY1YClf6Qb2JLHsKqvDgVvXa+CZb9y1ObTQf84mXjU/1ctIHrkPUsa2Zn
 b7HYGsXMQ64+UW4YOEDeBlOqzt0xG4Vcb2oOKKy0QvJSki4Ft0gXy4Skm2tSGjhKVWIb0pFnMs
 NMvDapq9NONcagap/D5coDAMPIpdJjQ+wSj92GLj0pWox0l0uCA+vwcGtz3eOn2XPFKBra+sv7
 R8c=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 00:59:01 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mpf0h3rnBz1RvTp
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 00:59:00 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1665734339; x=1668326340; bh=OGwGh9LZz7woRDRU72
 LLOtvvdTlq5B35RSZogAW/Y44=; b=RJpED85WFgDCym06nQW6mM9FeQvOrQOcKp
 T/g1WjpLC4dBLlCZDIlKjGIqI3D8SRRJHgCVPXGP5vpXwYrOdRozvrrZCgf6mRr+
 IFEu0sWFt+kgapbJdha+ziXdtsnSAvpEABM8+fqiKXf/fh26VL8SUDAnv1DIjicD
 KUucySKZ/PgB0tQbF0u3+yaGhzxV5ZQClme7QRXmKhB+BNt4//thi9KQYw+mtL/p
 ULKYYQUfppe/HIcKRdjGCCt42gcr/pCSQMzyQcC8UgoZm3BqRkC0ZI6/v1FjA6S3
 sTYFvCI8NRyIQtCWbDT6IxsqQLOpCh+CukwW8LcOKYQUhWIFXB0w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id O5JMjw6i9zgx for <qemu-devel@nongnu.org>;
 Fri, 14 Oct 2022 00:58:59 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.19])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mpf0c6hwZz1Rwt8;
 Fri, 14 Oct 2022 00:58:56 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PULL 02/10] hw/ssi: ibex_spi: fixup coverity issue
Date: Fri, 14 Oct 2022 17:58:22 +1000
Message-Id: <20221014075830.914722-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
References: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=2798045df=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch addresses the coverity issues specified in [1],
as suggested, `FIELD_DP32()`/`FIELD_EX32()` macros have been
implemented to clean up the code.

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg887713.html

Fixes: Coverity CID 1488107

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Message-Id: <20220930033241.206581-2-wilfred.mallawa@opensource.wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/ssi/ibex_spi_host.c | 132 +++++++++++++++++++++--------------------
 1 file changed, 68 insertions(+), 64 deletions(-)

diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index 94d7da9cc2..d145a4cdbd 100644
--- a/hw/ssi/ibex_spi_host.c
+++ b/hw/ssi/ibex_spi_host.c
@@ -108,18 +108,22 @@ static inline uint8_t div4_round_up(uint8_t dividen=
d)
=20
 static void ibex_spi_rxfifo_reset(IbexSPIHostState *s)
 {
+    uint32_t data =3D s->regs[IBEX_SPI_HOST_STATUS];
     /* Empty the RX FIFO and assert RXEMPTY */
     fifo8_reset(&s->rx_fifo);
-    s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_RXFULL_MASK;
-    s->regs[IBEX_SPI_HOST_STATUS] |=3D R_STATUS_RXEMPTY_MASK;
+    data =3D FIELD_DP32(data, STATUS, RXFULL, 0);
+    data =3D FIELD_DP32(data, STATUS, RXEMPTY, 1);
+    s->regs[IBEX_SPI_HOST_STATUS] =3D data;
 }
=20
 static void ibex_spi_txfifo_reset(IbexSPIHostState *s)
 {
+    uint32_t data =3D s->regs[IBEX_SPI_HOST_STATUS];
     /* Empty the TX FIFO and assert TXEMPTY */
     fifo8_reset(&s->tx_fifo);
-    s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_TXFULL_MASK;
-    s->regs[IBEX_SPI_HOST_STATUS] |=3D R_STATUS_TXEMPTY_MASK;
+    data =3D FIELD_DP32(data, STATUS, TXFULL, 0);
+    data =3D FIELD_DP32(data, STATUS, TXEMPTY, 1);
+    s->regs[IBEX_SPI_HOST_STATUS] =3D data;
 }
=20
 static void ibex_spi_host_reset(DeviceState *dev)
@@ -162,37 +166,38 @@ static void ibex_spi_host_reset(DeviceState *dev)
  */
 static void ibex_spi_host_irq(IbexSPIHostState *s)
 {
-    bool error_en =3D s->regs[IBEX_SPI_HOST_INTR_ENABLE]
-                    & R_INTR_ENABLE_ERROR_MASK;
-    bool event_en =3D s->regs[IBEX_SPI_HOST_INTR_ENABLE]
-                    & R_INTR_ENABLE_SPI_EVENT_MASK;
-    bool err_pending =3D s->regs[IBEX_SPI_HOST_INTR_STATE]
-                        & R_INTR_STATE_ERROR_MASK;
-    bool status_pending =3D s->regs[IBEX_SPI_HOST_INTR_STATE]
-                        & R_INTR_STATE_SPI_EVENT_MASK;
+    uint32_t intr_test_reg =3D s->regs[IBEX_SPI_HOST_INTR_TEST];
+    uint32_t intr_en_reg =3D s->regs[IBEX_SPI_HOST_INTR_ENABLE];
+    uint32_t intr_state_reg =3D s->regs[IBEX_SPI_HOST_INTR_STATE];
+
+    uint32_t err_en_reg =3D s->regs[IBEX_SPI_HOST_ERROR_ENABLE];
+    uint32_t event_en_reg =3D s->regs[IBEX_SPI_HOST_EVENT_ENABLE];
+    uint32_t err_status_reg =3D s->regs[IBEX_SPI_HOST_ERROR_STATUS];
+    uint32_t status_reg =3D s->regs[IBEX_SPI_HOST_STATUS];
+
+
+    bool error_en =3D FIELD_EX32(intr_en_reg, INTR_ENABLE, ERROR);
+    bool event_en =3D FIELD_EX32(intr_en_reg, INTR_ENABLE, SPI_EVENT);
+    bool err_pending =3D FIELD_EX32(intr_state_reg, INTR_STATE, ERROR);
+    bool status_pending =3D FIELD_EX32(intr_state_reg, INTR_STATE, SPI_E=
VENT);
+
     int err_irq =3D 0, event_irq =3D 0;
=20
     /* Error IRQ enabled and Error IRQ Cleared */
     if (error_en && !err_pending) {
         /* Event enabled, Interrupt Test Error */
-        if (s->regs[IBEX_SPI_HOST_INTR_TEST] & R_INTR_TEST_ERROR_MASK) {
+        if (FIELD_EX32(intr_test_reg, INTR_TEST,  ERROR)) {
             err_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
-                    &  R_ERROR_ENABLE_CMDBUSY_MASK) &&
-                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
-                    & R_ERROR_STATUS_CMDBUSY_MASK) {
+        } else if (FIELD_EX32(err_en_reg, ERROR_ENABLE,  CMDBUSY) &&
+                   FIELD_EX32(err_status_reg, ERROR_STATUS,  CMDBUSY)) {
             /* Wrote to COMMAND when not READY */
             err_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
-                    &  R_ERROR_ENABLE_CMDINVAL_MASK) &&
-                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
-                    & R_ERROR_STATUS_CMDINVAL_MASK) {
+        } else if (FIELD_EX32(err_en_reg, ERROR_ENABLE,  CMDINVAL)  &&
+                   FIELD_EX32(err_status_reg, ERROR_STATUS,  CMDINVAL)) =
{
             /* Invalid command segment */
             err_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
-                    & R_ERROR_ENABLE_CSIDINVAL_MASK) &&
-                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
-                    & R_ERROR_STATUS_CSIDINVAL_MASK) {
+        } else if (FIELD_EX32(err_en_reg, ERROR_ENABLE,  CSIDINVAL) &&
+                   FIELD_EX32(err_status_reg, ERROR_STATUS,  CSIDINVAL))=
 {
             /* Invalid value for CSID */
             err_irq =3D 1;
         }
@@ -204,22 +209,19 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
=20
     /* Event IRQ Enabled and Event IRQ Cleared */
     if (event_en && !status_pending) {
-        if (s->regs[IBEX_SPI_HOST_INTR_TEST] & R_INTR_TEST_SPI_EVENT_MAS=
K) {
+        if (FIELD_EX32(intr_test_reg, INTR_STATE,  SPI_EVENT)) {
             /* Event enabled, Interrupt Test Event */
             event_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
-                    & R_EVENT_ENABLE_READY_MASK) &&
-                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_READY_MASK=
)) {
+        } else if (FIELD_EX32(event_en_reg, EVENT_ENABLE,  READY) &&
+                   FIELD_EX32(status_reg, STATUS, READY)) {
             /* SPI Host ready for next command */
             event_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
-                    & R_EVENT_ENABLE_TXEMPTY_MASK) &&
-                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_TXEMPTY_MA=
SK)) {
+        } else if (FIELD_EX32(event_en_reg, EVENT_ENABLE,  TXEMPTY) &&
+                   FIELD_EX32(status_reg, STATUS,  TXEMPTY)) {
             /* SPI TXEMPTY, TXFIFO drained */
             event_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
-                    & R_EVENT_ENABLE_RXFULL_MASK) &&
-                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_RXFULL_MAS=
K)) {
+        } else if (FIELD_EX32(event_en_reg, EVENT_ENABLE,  RXFULL) &&
+                   FIELD_EX32(status_reg, STATUS,  RXFULL)) {
             /* SPI RXFULL, RXFIFO  full */
             event_irq =3D 1;
         }
@@ -232,10 +234,11 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
=20
 static void ibex_spi_host_transfer(IbexSPIHostState *s)
 {
-    uint32_t rx, tx;
+    uint32_t rx, tx, data;
     /* Get num of one byte transfers */
-    uint8_t segment_len =3D ((s->regs[IBEX_SPI_HOST_COMMAND] & R_COMMAND=
_LEN_MASK)
-                          >> R_COMMAND_LEN_SHIFT);
+    uint8_t segment_len =3D FIELD_EX32(s->regs[IBEX_SPI_HOST_COMMAND],
+                                     COMMAND,  LEN);
+
     while (segment_len > 0) {
         if (fifo8_is_empty(&s->tx_fifo)) {
             /* Assert Stall */
@@ -262,22 +265,21 @@ static void ibex_spi_host_transfer(IbexSPIHostState=
 *s)
         --segment_len;
     }
=20
+    data =3D s->regs[IBEX_SPI_HOST_STATUS];
     /* Assert Ready */
-    s->regs[IBEX_SPI_HOST_STATUS] |=3D R_STATUS_READY_MASK;
+    data =3D FIELD_DP32(data, STATUS, READY, 1);
     /* Set RXQD */
-    s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_RXQD_MASK;
-    s->regs[IBEX_SPI_HOST_STATUS] |=3D (R_STATUS_RXQD_MASK
-                                    & div4_round_up(segment_len));
+    data =3D FIELD_DP32(data, STATUS, RXQD, div4_round_up(segment_len));
     /* Set TXQD */
-    s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_TXQD_MASK;
-    s->regs[IBEX_SPI_HOST_STATUS] |=3D (fifo8_num_used(&s->tx_fifo) / 4)
-                                    & R_STATUS_TXQD_MASK;
+    data =3D FIELD_DP32(data, STATUS, TXQD, fifo8_num_used(&s->tx_fifo) =
/ 4);
     /* Clear TXFULL */
-    s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_TXFULL_MASK;
-    /* Assert TXEMPTY and drop remaining bytes that exceed segment_len *=
/
-    ibex_spi_txfifo_reset(s);
+    data =3D FIELD_DP32(data, STATUS, TXFULL, 0);
     /* Reset RXEMPTY */
-    s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_RXEMPTY_MASK;
+    data =3D FIELD_DP32(data, STATUS, RXEMPTY, 0);
+    /* Update register status */
+    s->regs[IBEX_SPI_HOST_STATUS] =3D data;
+    /* Drop remaining bytes that exceed segment_len */
+    ibex_spi_txfifo_reset(s);
=20
     ibex_spi_host_irq(s);
 }
@@ -340,7 +342,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr =
addr,
 {
     IbexSPIHostState *s =3D opaque;
     uint32_t val32 =3D val64;
-    uint32_t shift_mask =3D 0xff;
+    uint32_t shift_mask =3D 0xff, status =3D 0;
     uint8_t txqd_len;
=20
     trace_ibex_spi_host_write(addr, size, val64);
@@ -397,22 +399,24 @@ static void ibex_spi_host_write(void *opaque, hwadd=
r addr,
         s->regs[addr] =3D val32;
=20
         /* STALL, IP not enabled */
-        if (!(s->regs[IBEX_SPI_HOST_CONTROL] & R_CONTROL_SPIEN_MASK)) {
+        if (!(FIELD_EX32(s->regs[IBEX_SPI_HOST_CONTROL],
+                         CONTROL, SPIEN))) {
             return;
         }
=20
         /* SPI not ready, IRQ Error */
-        if (!(s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_READY_MASK)) {
+        if (!(FIELD_EX32(s->regs[IBEX_SPI_HOST_STATUS],
+                         STATUS, READY))) {
             s->regs[IBEX_SPI_HOST_ERROR_STATUS] |=3D R_ERROR_STATUS_CMDB=
USY_MASK;
             ibex_spi_host_irq(s);
             return;
         }
+
         /* Assert Not Ready */
         s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_READY_MASK;
=20
-        if (((val32 & R_COMMAND_DIRECTION_MASK) >> R_COMMAND_DIRECTION_S=
HIFT)
-            !=3D BIDIRECTIONAL_TRANSFER) {
-                qemu_log_mask(LOG_UNIMP,
+        if (FIELD_EX32(val32, COMMAND, DIRECTION) !=3D BIDIRECTIONAL_TRA=
NSFER) {
+            qemu_log_mask(LOG_UNIMP,
                           "%s: Rx Only/Tx Only are not supported\n", __f=
unc__);
         }
=20
@@ -452,8 +456,8 @@ static void ibex_spi_host_write(void *opaque, hwaddr =
addr,
                 return;
             }
             /* Byte ordering is set by the IP */
-            if ((s->regs[IBEX_SPI_HOST_STATUS] &
-                R_STATUS_BYTEORDER_MASK) =3D=3D 0) {
+            status =3D s->regs[IBEX_SPI_HOST_STATUS];
+            if (FIELD_EX32(status, STATUS, BYTEORDER) =3D=3D 0) {
                 /* LE: LSB transmitted first (default for ibex processor=
) */
                 shift_mask =3D 0xff << (i * 8);
             } else {
@@ -464,18 +468,18 @@ static void ibex_spi_host_write(void *opaque, hwadd=
r addr,
=20
             fifo8_push(&s->tx_fifo, (val32 & shift_mask) >> (i * 8));
         }
-
+        status =3D s->regs[IBEX_SPI_HOST_STATUS];
         /* Reset TXEMPTY */
-        s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_TXEMPTY_MASK;
+        status =3D FIELD_DP32(status, STATUS, TXEMPTY, 0);
         /* Update TXQD */
-        txqd_len =3D (s->regs[IBEX_SPI_HOST_STATUS] &
-                    R_STATUS_TXQD_MASK) >> R_STATUS_TXQD_SHIFT;
+        txqd_len =3D FIELD_EX32(status, STATUS, TXQD);
         /* Partial bytes (size < 4) are padded, in words. */
         txqd_len +=3D 1;
-        s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_TXQD_MASK;
-        s->regs[IBEX_SPI_HOST_STATUS] |=3D txqd_len;
+        status =3D FIELD_DP32(status, STATUS, TXQD, txqd_len);
         /* Assert Ready */
-        s->regs[IBEX_SPI_HOST_STATUS] |=3D R_STATUS_READY_MASK;
+        status =3D FIELD_DP32(status, STATUS, READY, 1);
+        /* Update register status */
+        s->regs[IBEX_SPI_HOST_STATUS] =3D status;
         break;
     case IBEX_SPI_HOST_ERROR_ENABLE:
         s->regs[addr] =3D val32;
--=20
2.37.3


