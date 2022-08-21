Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE2359B6D3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 01:47:10 +0200 (CEST)
Received: from localhost ([::1]:42178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPuer-00077J-D2
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 19:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=225a36311=wilfred.mallawa@opensource.wdc.com>)
 id 1oPuao-0001Bh-I6
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:42:58 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:20656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=225a36311=wilfred.mallawa@opensource.wdc.com>)
 id 1oPual-0003As-Fi
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1661125375; x=1692661375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YOQjuP0GwYm+xsEBe9XVUk27tsNs57ziEwBkqS6jfJw=;
 b=kmRy/QBJMBgWrBik7/1z6CnZPr9dLJsXpQ4msbKPJUeYYVxtA3owwDxR
 bvOzTE15woF5rzrkQZck6JDwxNIzbA5Hq9mK49KM2+tCfXkn8uFjjJZsh
 fEdrKHP1U+QvTK/lW7quQ99CHRdEktRlnJsAaVpQRoeH+A3jHCpPtwwX4
 7yxDbgu6e/5WahyJ6hMD3/IQ+5BPlCIghGN1mho86hLLBXF0JL5ZsfdV2
 kZZ0oHcZynrnxbs03wsqMsF7PXU4h7DItKr3Hh/3shsfUhe1g7ecQdU/6
 qnuQQBIVT7K8J/wiTA0RJGy+J0e8HQ7Nlt1VZZgWljl27Ca8cNb+pCmVh g==;
X-IronPort-AV: E=Sophos;i="5.93,253,1654531200"; d="scan'208";a="313551461"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Aug 2022 07:42:51 +0800
IronPort-SDR: FDYGbf12Qs/NQoeVh6a4eS8Vkf4cNqP2iUVch3Bv7JbxcrcOS+JiTpXHPzrohqDYLQDUNjp9Nn
 lpcn+jDmeMz4hkWFivz6FlZ7P0lBQ/G9ssAQxdtHdOLIQmE31ZNp6QiBe8+xpv/bt9OGAQdvsZ
 DV5CMS3EZVoso84jjaJ2ynUDMhMKitRCwO4Z42VR0pBFLcTVnZGF6TERusRoATEGYo5zk4OmON
 a6eS1Zl7e3gDdDIPh9RPCTlR0ed8NpFDG7GVODae2gl/OBxYQuVwQ9I0HcbVnC4R9FOJodau7P
 fcQ6pS1UUk4qBnX2LzvG0SJ2
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Aug 2022 16:03:32 -0700
IronPort-SDR: qYAndgsO1rjZL0aQru0WtFzphrFcmplue0Snc/rrR2tgxLWBleNT2loeXv0xI3FI/eONemMTh7
 5fm/M2eKzlJH8UnEmRlLQ+BXfv042HCQMcLpCc2nLRQDjbCG+9VuEp8jHypqLpAn9vBPOYkyPH
 bhAIxngI2F762M47u2c5wEjRstx8WUJG6rWClEOnv1Xj42XqeWkbqljf6tOqSBc2EuuypLrJAW
 lkPW1jTAUQ5i1uafRORcvyNi4XQfgNcDfdgcj9RLUbTi3EPWqznC0nzGZYE4DjaK4bDpLRofrk
 HjI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Aug 2022 16:42:51 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M9sVf6S4tz1Rwnl
 for <qemu-devel@nongnu.org>; Sun, 21 Aug 2022 16:42:50 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1661125370; x=1663717371; bh=YOQjuP0GwYm+xsEBe9
 XVUk27tsNs57ziEwBkqS6jfJw=; b=IAOti9gW6EkAmp7q0O6MHxuBGnjatRRnUZ
 Yd51dDEmhF0btiFMblzVjiPHhW8eOts4cLrU6gK68SotZJKqjvuzarKbM5WHxVBB
 uq2HWzSe+ZE1KW3Un53cWUmrPwkcIE9JYKuyCz9n2mdXUpcgzPIjJ0aXLCXPo9Te
 MCCPpwrxFBDPRF022WAMMO8mFj1ifM/VaDAAsj8J4k6gXPVqFzsYXifCmiWGz/vb
 BwcLL/Z6r5GKzQrrcvnjhkLzPHAC5eYL0FpQMA1esi6ZLINePMeVxffI8BeCzoB1
 79IrVqDhwdN2QJxaPJGJqWpt6P0Ek3/dSUBTWI0ECrPKu34swa5g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id LLbnHC9-wY5d for <qemu-devel@nongnu.org>;
 Sun, 21 Aug 2022 16:42:50 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M9sVb5Gdxz1RtVk;
 Sun, 21 Aug 2022 16:42:47 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 1/4] hw/ssi: ibex_spi: fixup typos in ibex_spi_host
Date: Mon, 22 Aug 2022 09:41:58 +1000
Message-Id: <20220821234200.34052-2-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220821234200.34052-1-wilfred.mallawa@opensource.wdc.com>
References: <20220821234200.34052-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=225a36311=wilfred.mallawa@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch fixes up minor typos in ibex_spi_host

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
2.37.2


