Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652A258F57D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 03:05:48 +0200 (CEST)
Received: from localhost ([::1]:54196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLwdn-0007KV-7H
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 21:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2146f6254=wilfred.mallawa@opensource.wdc.com>)
 id 1oLuim-0000aq-MP
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 19:02:40 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:32574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2146f6254=wilfred.mallawa@opensource.wdc.com>)
 id 1oLuiZ-0004Qd-G0
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 19:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660172547; x=1691708547;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0vdSw+Rdt9Z/Qr6KlA7e9PvKVitzNyAkTLtTd92Pti8=;
 b=pw0BOsvvBkPMFQFozs4+v8M1t1lw6+2nLIttyiR8Gm60yVTeoR295lm1
 l6qmDwuRSFj/TBBxYHubL07NY6NcOklKsXI435+Ca85F92pCag8b1wpNm
 t88H0xRZwHWVoay0KKfSb32KNwWybLYrNx1ElR41Ga7NxMxT8lVB1NNk2
 zSOdnqh3V9b9yhPlcNfhXbtviiwbVOty3qsByeJOlQ0Bz6zX1FIbE6SOM
 JzcR47FA8nFnQpbzR8i2waDMToSHGJ/ptwZF7AcImgx3R+gAO3Tw50uld
 zmkmr+nrbSdArw7A3YBmz7Jmv1lAjBkiLaux8iWCsCeDnXgt1u2qlRAeb g==;
X-IronPort-AV: E=Sophos;i="5.93,228,1654531200"; d="scan'208";a="320480951"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2022 07:02:09 +0800
IronPort-SDR: jPziFc8HstvAy76dfIUPTNRiGBXkR6h064H87/Wn1kFAIlHLo2+g+I6wMa9auUyi2/4Wputik3
 6ckUCLAuyHvodvapyHhA1I/ZdWWRQukxS+VPfbN15U1aqXkEmOcTEnczfXtg99tfxSCjVRUUJ2
 U08/8VFbYUdFiRMdFavodFmUFexDLGVUCkf4K7qZpiaJV7RIMuENsebRzuiCguuktoYWSmprSf
 Nqhc4QMcFzygSFJ18UKLjL8pGiqX+Fj4euSE78SUdchw3MbjaTcO0Q9eGNUxj7lFG4ZR9JRXTc
 fjiZXqjobL4Kvq1WJmujfBs+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 15:17:44 -0700
IronPort-SDR: SfpCy0MjV19YZcFbF+IwN3j4z6k1nU/klWNWnT8r/lhaDQiSu/fwsOK86PU7vLx0VVTD3C7VNU
 JhetPJ6MIBU3KnmBoLB215NafqcJlgTs4wt/DUtYlfVBLzldDxxSVRdH4nHZuMgodJybGmXZB9
 Er2yEgzjyIEAxkEf7j8SAI2aySOXCPfT3VDm1Tm7iVxvmk0FvEARu9qJ7Z4PhbyM8aIoegihNJ
 9j/ndndQDHp02aThIJoDKb2EAAFWtLusUfImu6tYSHnpyKeYNvDOAAPHJFMRU8OenIBuOnedVy
 AS0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 16:02:10 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M356n05T2z1Rwnm
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 16:02:08 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1660172528;
 x=1662764529; bh=0vdSw+Rdt9Z/Qr6KlA7e9PvKVitzNyAkTLtTd92Pti8=; b=
 i/8xA+upysNEOc5sQQUo85qlcTP0xNipSOlaHJox1z2/N+8HSVy6NAknI1x2wKw3
 Od/4EDFACkzTM0mB4gEkXO6pko3pl0vrAgDQUTOFKt0gi+CoURih51LZojBBhnfi
 7RnVBzX8ktf6HHnXWgm5ZMTEN0zTkjQ/CzZPSMN60w6MhCMcP+1XaqcaJH2wJX3A
 0tzjzwtsjIq7pFvm5NQoc5kodG37/whT9kYPxNlqyRnAfPI5JxVv+BaIfDYQEgP7
 MZruFIDsrutVHEkflfENn2BhaiZUXP1RkFR387HsY2vqiDO5/kGc15OxAmnNeXSM
 KuH5Iq/IrvI008mAn+9vBw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 7QtH_BRG1Rbt for <qemu-devel@nongnu.org>;
 Wed, 10 Aug 2022 16:02:08 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.24])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M356k32lYz1RtVk;
 Wed, 10 Aug 2022 16:02:05 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH 1/3] hw/ssi: fixup typos in ibex_spi_host
Date: Thu, 11 Aug 2022 09:01:58 +1000
Message-Id: <20220810230200.149398-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=2146f6254=wilfred.mallawa@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 10 Aug 2022 20:58:23 -0400
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

This patch fixes up minor typos in ibex_spi_host

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 hw/ssi/ibex_spi_host.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index d14580b409..601041d719 100644
--- a/hw/ssi/ibex_spi_host.c
+++ b/hw/ssi/ibex_spi_host.c
@@ -172,7 +172,7 @@ static void ibex_spi_host_irq(IbexSPIHostState *s)
                         & R_INTR_STATE_SPI_EVENT_MASK;
     int err_irq =3D 0, event_irq =3D 0;
=20
-    /* Error IRQ enabled and Error IRQ Cleared*/
+    /* Error IRQ enabled and Error IRQ Cleared */
     if (error_en && !err_pending) {
         /* Event enabled, Interrupt Test Error */
         if (s->regs[IBEX_SPI_HOST_INTR_TEST] & R_INTR_TEST_ERROR_MASK) {
@@ -434,7 +434,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr =
addr,
     case IBEX_SPI_HOST_TXDATA:
         /*
          * This is a hardware `feature` where
-         * the first word written TXDATA after init is omitted entirely
+         * the first word written to TXDATA after init is omitted entire=
ly
          */
         if (s->init_status) {
             s->init_status =3D false;
@@ -487,7 +487,7 @@ static void ibex_spi_host_write(void *opaque, hwaddr =
addr,
         break;
     case IBEX_SPI_HOST_ERROR_STATUS:
     /*
-     *  Indicates that any errors that have occurred.
+     *  Indicates any errors that have occurred.
      *  When an error occurs, the corresponding bit must be cleared
      *  here before issuing any further commands
      */
--=20
2.37.1


