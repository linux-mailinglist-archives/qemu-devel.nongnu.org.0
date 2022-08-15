Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4C6592809
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 05:20:04 +0200 (CEST)
Received: from localhost ([::1]:46000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNQe3-0000ih-Kw
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 23:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=219596703=wilfred.mallawa@opensource.wdc.com>)
 id 1oNQbY-0004DS-3B
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 23:17:28 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:17405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=219596703=wilfred.mallawa@opensource.wdc.com>)
 id 1oNQbV-0007Lw-FM
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 23:17:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660533445; x=1692069445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w4GzVfAkvrf4UkgJX3Gd2cdwXyJJ91gEYqXUW4q6J+0=;
 b=mzC0FOpiutKRGxfcaREX8NpswC8UWMjlQvB7Vr6UkYZg4S3QmGiAu+8A
 XS6dQhkHFP9bsShxuLGvIJgdqyTy1atVGheFdhiUR16U5G6JIze/BxglM
 GxrOIZlF7BONBsYjKDuybnAtdWgV81X+OIGMvwhTKdBSgt6i06CiQ4fJB
 V69S10Ww3B+2Jm4Adb9evF+QCFlQVvzJ2PLZ4QDDtXp22ENlcYotDrva7
 /Deq1kHgYcSfme2kDoYT4/wc8I7LfL3/OA73WkLGssJ0AVRbrDEjk15l/
 vCd6SKWezxIQ/9q/wXEzzLx+GCcJVfq6d26w926Qf9QwPx70m7uqNljla Q==;
X-IronPort-AV: E=Sophos;i="5.93,237,1654531200"; d="scan'208";a="208696400"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Aug 2022 11:17:19 +0800
IronPort-SDR: ncLEoKfXHMbUwFDfP+/nCKsWPWFMqNZ7hQOBzwx21jg61b1UUct5/1Vp5lTAjxRuDp9MplO/PZ
 zayNg2Ol6aNi2RXKaY6J0vGO9DiUQmKDf7O1ZeZ6lwlpnwRgF4KZQcTwHdmz7JZfIIrObQoGBX
 l+BQa/4BAtG+cJ0ezfcz8+vGi88+j4WOZGch1/eb2fs0HJoIDSjTInQc2bi8XcFJh/b/t52y8j
 n8ZXfoir5uLS23ROlGRwe62zwFkiKOVKLXBvU6URbNN0L+b5aYLELrDff6quhqM78R6q8Jx/jZ
 +VlFeuQ0KWeW7uLfjQTccC04
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2022 19:38:09 -0700
IronPort-SDR: i527UIb3yiuM4jgHWQ5gJXUJ5as/RNuuayyYbaRU0RaB8FN+ocvwQclhFl//kjgipCzQp3D2T4
 TqPqwVCag/lPyNsXSg0WTB/pv+JyXSMvyfjPhB+B6XuT5FBHGuDhMBsmtlSERj6H8vcv7+JVoO
 s1j2+R4JodvdRfwpzT/6LcbjBgd2kV2MqAu634wa9ODxQH+cNVN4+CBq85/6gdUEkt5XIZAbRI
 9hvtJQydm0VKrgSft/kSMvkVeGKIOt7OsYEJL6X1CYk9cb+22hFjP90rzAB06RM50jcs2KtOnH
 V6U=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2022 20:17:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M5fbM5Cmgz1Rwnm
 for <qemu-devel@nongnu.org>; Sun, 14 Aug 2022 20:17:19 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1660533439; x=1663125440; bh=w4GzVfAkvrf4UkgJX3
 Gd2cdwXyJJ91gEYqXUW4q6J+0=; b=ejr17W+ZHwlN2idAZ6lsD5Q+Gpj/nRUc2I
 4o6enwmGZqjJ14zBVXCaWe4lJ2CVyKPVCXMBxDyKGimAe441kekcY6zqKua2CGgG
 1xjzIbxyu2xIeGHnJHw2Y9TJpIJDKFfFwJiXJ0EVmYyVqAqDTctPKdv+CdN1fYuy
 /kKfMhGY/kZPfsfnWQiCvrR808KUQiijU0YlEcn3jRoI7+sT8PS1pRbiw+dWgRL2
 oXEYPCN+VThFSFibWcVmZlhqjFimVl9MTQOCKeqU2HSJlVwdrTVt7M1ECu3UGqLv
 lap/xh8naFlCXe9ucIm9x9kUJVFiSrT2bTeTNu6e9+GGmHhwU5qg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id BPxGs787c4m9 for <qemu-devel@nongnu.org>;
 Sun, 14 Aug 2022 20:17:19 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M5fbJ4v6Dz1RtVk;
 Sun, 14 Aug 2022 20:17:16 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 1/4] hw/ssi: ibex_spi: fixup typos in ibex_spi_host
Date: Mon, 15 Aug 2022 13:16:22 +1000
Message-Id: <20220815031624.170857-2-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815031624.170857-1-wilfred.mallawa@opensource.wdc.com>
References: <20220815031624.170857-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=219596703=wilfred.mallawa@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
2.37.1


