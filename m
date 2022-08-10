Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DE958F57B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 03:04:27 +0200 (CEST)
Received: from localhost ([::1]:53070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLwcb-0006G2-7V
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 21:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2146f6254=wilfred.mallawa@opensource.wdc.com>)
 id 1oLuiw-0000dk-Qq
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 19:02:50 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:4527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2146f6254=wilfred.mallawa@opensource.wdc.com>)
 id 1oLuit-0004SW-Ac
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 19:02:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660172565; x=1691708565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bJEhpj9iCpmqZwzHRzxHSu1nlyr9NSdi6/fTLMOczEs=;
 b=Pqw4dNAldenCOBVjoGWDazpzmpFsQobiZfEOFRTH9D91Ox10aV4I0dPs
 qJ1t/xqk8v2qnY6Gn42bUwjBVB546M5onAeyZwBVtXB+oTjbOVE/obUki
 A7fQLzPcvJiYtzEJCpgLk/Tr67KyKAGNrFCKLPeWdJcTVms28wMgamHcK
 MB/w35E5rt5c1NbxVw2dDiTGOsIneon6I6Fkcyx0yy0j7wtQCA9T/5TRq
 pzGFT8yQQ49YvH+3hIbbr5VVuaTj6xAYHqeS2dNYBxO/+vhCw4omVIPnq
 Ds65DnZKLNdfe0iDEy+TDEoNuMNk6lSXjf7ShM98Ks5NgV81npvoQHZ6w A==;
X-IronPort-AV: E=Sophos;i="5.93,228,1654531200"; d="scan'208";a="208385269"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2022 07:02:41 +0800
IronPort-SDR: RPWp8w1lp51et9f26WCZkDwVyf4WOYR2WB7u8Ok9WJ1Ec+dFDfO4LHuv0u/R+1Knf8Jfm+xc48
 JpzGjlJtmJKusI+c08tdmvTUcqdrm8kgzr3FPI1GaVXXNhBHanBOK7mC1nB0+47Et0hbWK9cmC
 /aDJKOt9LAGxy+v9FKWA2RD0PL19+VfGcRndzbQYxQyKFd2lUwclLrBBmWjR8YbDpZ1UlnQA1x
 Tt0QsPxoT2xvo1Vch/kJIpqZikazQoMoZ39qMMyhaBrRMt+wz11q79odp66mWgG5AbcRGIKxLI
 1TJ2nxos28iWjd3nqyc4Z85c
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 15:18:17 -0700
IronPort-SDR: SV10BS5ELeUrrEn6znm7czwbv63a20Tf6luqLfy804UUw3rSPZxpxIzbjvmcnyXEDyIj6QsJJ1
 JQ14q87qPz72Odx1tkPliof0VLLGVZYgCf0yGLEkqsn33Or6PqCLvkCWiwgPJ9nDqR7AYaDX8S
 CqEzKah8twiYDhxEQQ7cMNC2hTRY/7+pCg5+AFXdcjap0E7urw9w7g8jK5f4oI5YT2dH0YiAxk
 tCSdBVZ29nEk/Ynwb31pUbQVoNMV5YTQ3uAvXajtg3W5oJjtBSrSasc/Pt8Dsvou76h7lVTnsE
 ggo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 16:02:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M357P4z7Fz1Rw4L
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 16:02:41 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1660172560; x=1662764561; bh=bJEhpj9iCpmqZwzHRz
 xHSu1nlyr9NSdi6/fTLMOczEs=; b=oKwrqMnz672Tr/SYOfighhiE7zswrSnFqZ
 OSPBp3fJonMgAplEm26gGdJ3qORa+RTAr1SF+qcuddJkDhyk/dQ0FYsHcC+Auro0
 Ffh50TZsulfCLDXwuZ2SNXCbU/ix9OhEU3G27mcTf9Pb64DsmN1H/mZ8lSJDsNP5
 lsIVS5aUMasxN1r/zwrqKIMYiJy74KD170kzZcswYJo1AxrAWZGt/LYw3V9bvSgz
 K47xAZoVD80gXXnUcGp+C2P+hrpfb4t0VFAhjah2Eh+g1O+u+u9/jqt+Zqa9WPft
 4u3yQDucjncnyvWIUTEW8xM0QtTa53/K/5GcyZ1Nhex6t9hKtvFA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id UGZ7tsx0StBC for <qemu-devel@nongnu.org>;
 Wed, 10 Aug 2022 16:02:40 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.24])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M357L5JRNz1RtVk;
 Wed, 10 Aug 2022 16:02:38 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH 2/3] hw/ssi: fixup coverity issue
Date: Thu, 11 Aug 2022 09:02:00 +1000
Message-Id: <20220810230200.149398-2-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810230200.149398-1-wilfred.mallawa@opensource.wdc.com>
References: <20220810230200.149398-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=2146f6254=wilfred.mallawa@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 10 Aug 2022 20:58:24 -0400
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

Additionally, the `EVENT_ENABLE` register is correctly updated
to addr of `0x34`.

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg887713.html

Fixes: Coverity CID 1488107

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 hw/ssi/ibex_spi_host.c | 141 +++++++++++++++++++++++------------------
 1 file changed, 78 insertions(+), 63 deletions(-)

diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index 601041d719..8c35bfa95f 100644
--- a/hw/ssi/ibex_spi_host.c
+++ b/hw/ssi/ibex_spi_host.c
@@ -93,7 +93,7 @@ REG32(ERROR_STATUS, 0x30)
     FIELD(ERROR_STATUS, CMDINVAL, 3, 1)
     FIELD(ERROR_STATUS, CSIDINVAL, 4, 1)
     FIELD(ERROR_STATUS, ACCESSINVAL, 5, 1)
-REG32(EVENT_ENABLE, 0x30)
+REG32(EVENT_ENABLE, 0x34)
     FIELD(EVENT_ENABLE, RXFULL, 0, 1)
     FIELD(EVENT_ENABLE, TXEMPTY, 1, 1)
     FIELD(EVENT_ENABLE, RXWM, 2, 1)
@@ -108,18 +108,20 @@ static inline uint8_t div4_round_up(uint8_t dividen=
d)
=20
 static void ibex_spi_rxfifo_reset(IbexSPIHostState *s)
 {
+    uint32_t data =3D s->regs[IBEX_SPI_HOST_STATUS];
     /* Empty the RX FIFO and assert RXEMPTY */
     fifo8_reset(&s->rx_fifo);
-    s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_RXFULL_MASK;
-    s->regs[IBEX_SPI_HOST_STATUS] |=3D R_STATUS_RXEMPTY_MASK;
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
+    data =3D FIELD_DP32(data, STATUS, TXEMPTY, 1);
+    s->regs[IBEX_SPI_HOST_STATUS] =3D data;
 }
=20
 static void ibex_spi_host_reset(DeviceState *dev)
@@ -162,37 +164,41 @@ static void ibex_spi_host_reset(DeviceState *dev)
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
+    bool error_en =3D FIELD_EX32(s->regs[IBEX_SPI_HOST_INTR_ENABLE],
+                               INTR_ENABLE, ERROR);
+
+    bool event_en =3D FIELD_EX32(s->regs[IBEX_SPI_HOST_INTR_ENABLE],
+                               INTR_ENABLE, SPI_EVENT);
+
+    bool err_pending =3D FIELD_EX32(s->regs[IBEX_SPI_HOST_INTR_STATE],
+                                  INTR_STATE, ERROR);
+
+    bool status_pending =3D FIELD_EX32(s->regs[IBEX_SPI_HOST_INTR_STATE]=
,
+                                     INTR_STATE, SPI_EVENT);
+
     int err_irq =3D 0, event_irq =3D 0;
=20
     /* Error IRQ enabled and Error IRQ Cleared */
     if (error_en && !err_pending) {
         /* Event enabled, Interrupt Test Error */
-        if (s->regs[IBEX_SPI_HOST_INTR_TEST] & R_INTR_TEST_ERROR_MASK) {
+        if (FIELD_EX32(s->regs[IBEX_SPI_HOST_INTR_TEST], INTR_TEST,  ERR=
OR)) {
             err_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
-                    &  R_ERROR_ENABLE_CMDBUSY_MASK) &&
-                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
-                    & R_ERROR_STATUS_CMDBUSY_MASK) {
+        } else if (FIELD_EX32(s->regs[IBEX_SPI_HOST_ERROR_ENABLE],
+                              ERROR_ENABLE,  CMDBUSY) &&
+                    FIELD_EX32(s->regs[IBEX_SPI_HOST_ERROR_STATUS],
+                               ERROR_STATUS,  CMDBUSY)) {
             /* Wrote to COMMAND when not READY */
             err_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
-                    &  R_ERROR_ENABLE_CMDINVAL_MASK) &&
-                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
-                    & R_ERROR_STATUS_CMDINVAL_MASK) {
+        } else if (FIELD_EX32(s->regs[IBEX_SPI_HOST_ERROR_ENABLE],
+                              ERROR_ENABLE,  CMDINVAL)  &&
+                    FIELD_EX32(s->regs[IBEX_SPI_HOST_ERROR_STATUS],
+                               ERROR_STATUS,  CMDINVAL)) {
             /* Invalid command segment */
             err_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_ERROR_ENABLE]
-                    & R_ERROR_ENABLE_CSIDINVAL_MASK) &&
-                    s->regs[IBEX_SPI_HOST_ERROR_STATUS]
-                    & R_ERROR_STATUS_CSIDINVAL_MASK) {
+        } else if (FIELD_EX32(s->regs[IBEX_SPI_HOST_ERROR_ENABLE],
+                              ERROR_ENABLE,  CSIDINVAL) &&
+                    FIELD_EX32(s->regs[IBEX_SPI_HOST_ERROR_STATUS],
+                               ERROR_STATUS,  CSIDINVAL)) {
             /* Invalid value for CSID */
             err_irq =3D 1;
         }
@@ -204,22 +210,26 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
=20
     /* Event IRQ Enabled and Event IRQ Cleared */
     if (event_en && !status_pending) {
-        if (s->regs[IBEX_SPI_HOST_INTR_TEST] & R_INTR_TEST_SPI_EVENT_MAS=
K) {
+        if (FIELD_EX32(s->regs[IBEX_SPI_HOST_INTR_TEST],
+                       INTR_STATE,  SPI_EVENT)) {
             /* Event enabled, Interrupt Test Event */
             event_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
-                    & R_EVENT_ENABLE_READY_MASK) &&
-                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_READY_MASK=
)) {
+        } else if (FIELD_EX32(s->regs[IBEX_SPI_HOST_EVENT_ENABLE],
+                              EVENT_ENABLE,  READY) &&
+                    FIELD_EX32(s->regs[IBEX_SPI_HOST_STATUS],
+                               STATUS, READY)) {
             /* SPI Host ready for next command */
             event_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
-                    & R_EVENT_ENABLE_TXEMPTY_MASK) &&
-                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_TXEMPTY_MA=
SK)) {
+        } else if (FIELD_EX32(s->regs[IBEX_SPI_HOST_EVENT_ENABLE],
+                              EVENT_ENABLE,  TXEMPTY) &&
+                    FIELD_EX32(s->regs[IBEX_SPI_HOST_STATUS],
+                               STATUS,  TXEMPTY)) {
             /* SPI TXEMPTY, TXFIFO drained */
             event_irq =3D 1;
-        } else if ((s->regs[IBEX_SPI_HOST_EVENT_ENABLE]
-                    & R_EVENT_ENABLE_RXFULL_MASK) &&
-                    (s->regs[IBEX_SPI_HOST_STATUS] & R_STATUS_RXFULL_MAS=
K)) {
+        } else if (FIELD_EX32(s->regs[IBEX_SPI_HOST_EVENT_ENABLE],
+                              EVENT_ENABLE,  RXFULL) &&
+                    FIELD_EX32(s->regs[IBEX_SPI_HOST_STATUS],
+                               STATUS,  RXFULL)) {
             /* SPI RXFULL, RXFIFO  full */
             event_irq =3D 1;
         }
@@ -232,10 +242,11 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
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
@@ -262,22 +273,23 @@ static void ibex_spi_host_transfer(IbexSPIHostState=
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
+    /* Set TXEMPTY */
+    data =3D FIELD_DP32(data, STATUS, TXEMPTY, 1);
+    /* Drop remaining bytes that exceed segment_len */
+    ibex_spi_txfifo_reset(s);
+    /* Update register status */
+    s->regs[IBEX_SPI_HOST_STATUS] =3D data;
=20
     ibex_spi_host_irq(s);
 }
@@ -340,7 +352,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr =
addr,
 {
     IbexSPIHostState *s =3D opaque;
     uint32_t val32 =3D val64;
-    uint32_t shift_mask =3D 0xff;
+    uint32_t shift_mask =3D 0xff, data;
     uint8_t txqd_len;
=20
     trace_ibex_spi_host_write(addr, size, val64);
@@ -397,21 +409,23 @@ static void ibex_spi_host_write(void *opaque, hwadd=
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
+        if (FIELD_EX32(val32, COMMAND, DIRECTION) !=3D BIDIRECTIONAL_TRA=
NSFER) {
                 qemu_log_mask(LOG_UNIMP,
                           "%s: Rx Only/Tx Only are not supported\n", __f=
unc__);
         }
@@ -452,8 +466,8 @@ static void ibex_spi_host_write(void *opaque, hwaddr =
addr,
                 return;
             }
             /* Byte ordering is set by the IP */
-            if ((s->regs[IBEX_SPI_HOST_STATUS] &
-                R_STATUS_BYTEORDER_MASK) =3D=3D 0) {
+            if (FIELD_EX32(s->regs[IBEX_SPI_HOST_STATUS], STATUS,
+                           BYTEORDER) =3D=3D 0) {
                 /* LE: LSB transmitted first (default for ibex processor=
) */
                 shift_mask =3D 0xff << (i * 8);
             } else {
@@ -465,17 +479,18 @@ static void ibex_spi_host_write(void *opaque, hwadd=
r addr,
             fifo8_push(&s->tx_fifo, (val32 & shift_mask) >> (i * 8));
         }
=20
+        data =3D s->regs[IBEX_SPI_HOST_STATUS];
         /* Reset TXEMPTY */
-        s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_TXEMPTY_MASK;
+        data =3D FIELD_DP32(data, STATUS, TXEMPTY, 0);
         /* Update TXQD */
-        txqd_len =3D (s->regs[IBEX_SPI_HOST_STATUS] &
-                    R_STATUS_TXQD_MASK) >> R_STATUS_TXQD_SHIFT;
+        txqd_len =3D FIELD_EX32(s->regs[IBEX_SPI_HOST_STATUS], STATUS, T=
XQD);
         /* Partial bytes (size < 4) are padded, in words. */
         txqd_len +=3D 1;
-        s->regs[IBEX_SPI_HOST_STATUS] &=3D ~R_STATUS_TXQD_MASK;
-        s->regs[IBEX_SPI_HOST_STATUS] |=3D txqd_len;
+        data =3D FIELD_DP32(data, STATUS, TXQD, txqd_len);
         /* Assert Ready */
-        s->regs[IBEX_SPI_HOST_STATUS] |=3D R_STATUS_READY_MASK;
+        data =3D FIELD_DP32(data, STATUS, READY, 1);
+        /* Update register status */
+        s->regs[IBEX_SPI_HOST_STATUS] =3D data;
         break;
     case IBEX_SPI_HOST_ERROR_ENABLE:
         s->regs[addr] =3D val32;
--=20
2.37.1


