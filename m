Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780C95EBB20
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:07:41 +0200 (CEST)
Received: from localhost ([::1]:43426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4gu-0007gq-F2
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47l-00050p-Fj
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:21 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47i-0001Eu-TK
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260278; x=1695796278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p6+YXUCXUGeZxwmJkeAS3Bk65F/JmDABn0hfm3dL3wI=;
 b=PFTir6cITNJwtAN1+cz/WLvH0YNix9HyHk9/lbZ15O8QNUAeRbvtQqao
 hFGJ0QfvdtVqR18CMSjtU7e6UFpCSV5kcdK7SxLQ960QSPnnFOatdvLfN
 YVfWBVxCu4vcp6sv6Pl0h+XHKhucgMjYeouPGsAwl0LYyCLF1qW1NuIFt
 IHrKyaaxiqpfhsI14bai7DNH8W6joVlJ889yIsV4PMzb19SOJUa1ijOSv
 Ia6sYXvM2BB0oPME+habWbnBK4Ii8CYF/G3fUl6VdtAq3UTbTPlS+9kai
 KABHKgrnCBbo50jUBx8W10bWGWAWMbGKeltExxvDNhhF2z4/QbnYCwws5 A==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530799"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:11 +0800
IronPort-SDR: /YuoxRtWfvJ0w4fyOpbKtATFyNHsiKi+wsX+HhLkRL888DYJccHcIcL5JTAIivbbgL0qt6x4B7
 Ey+oRHyTXnJxALZajQPLJD5nDl8X7/EHl2/Jr6X3AC+j2KtNLHwz9gKmRPdr2a0M+L7FBIHzi6
 xDGm9RfqZgqYbFx08nJgvyTUQTUHxjYoyBsjDqwjIUARFLckZdX+us47Tvk0ZwkJfy1rMvBCRx
 5xh6bON2uswlfC16GLvAa7KOEYqTjaYbcmkFryzKju1WqJ3fqNE5CZ7LCzPF/3+W+Io5D0qWjI
 tSOLvZRbOr4NXOBvCcx/RSxj
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:08 -0700
IronPort-SDR: yG92UJxTvB7JPXGN3WXPQg/7dSBwdaseBEfpm1e2oqsM2StjfU6ALNmRC15DQ9MPq1giAc8eap
 HmjN5ycBrSAGqVlKmlIzmEUvQzz0SCyd36k66d/tYRAYkEBuRrEazKqho0gMSembifoZkjYGmw
 /6u8yoGm8tBPQhaVYH/BmZq9lmnJzw0ypT3+d0Lmg+x1r3gaD5uiHoWWMn7Ee15DOZZKQ5QNuD
 ATwkcwTufvE9en1VzA9ePwiHnFk7iSpkOTaY6EFf6e+eKweDFjx+o9QxiKMmizSqhbaIB37XC5
 sT8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:11 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8sB6Rggz1RwqL
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:10 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664260270; x=1666852271; bh=p6+YXUCXUGeZxwmJke
 AS3Bk65F/JmDABn0hfm3dL3wI=; b=qYQH1+NfCCiHGiWGfEoKUDL00CRgHXpq7q
 AwtS1aKjg/LFdYQ78tj5dAonuxLz/tOELEb0LchebVb+DShrfpOq/Ha3qsdBCUZ2
 hMTpVhz9S6pBQ+Zm7hsVY7HQm2lrdchyHaZD3iGlCVi+OGhmYmQQevyCC0GUQPpM
 LKMmWvM2yIhhgyJgceaoHsaJtsyq5vEyp7yRrBQx6jnlQzv4X7n9kl+md2NMSqKe
 t0sRPodtci3Y/qG+GIsCDvq7vDAIKlnRTU2Y3/e1PZYSpcoEKAwVjVrgK2xYTogj
 3W1REx4kw23PnPdFY1rtG+I/syERjRV3WCBQph7N88b19cpQfbJA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id iUhYyVUuZZdl for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:10 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8s90KY4z1RvTp;
 Mon, 26 Sep 2022 23:31:08 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PULL v2 01/22] hw/ssi: ibex_spi: fixup typos in ibex_spi_host
Date: Tue, 27 Sep 2022 16:30:43 +1000
Message-Id: <20220927063104.2846825-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
References: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=262caef14=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

This patch fixes up minor typos in ibex_spi_host

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Message-Id: <20220823061201.132342-2-wilfred.mallawa@opensource.wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
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
2.37.3


