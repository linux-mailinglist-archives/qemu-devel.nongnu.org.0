Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 339C459D136
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 08:24:48 +0200 (CEST)
Received: from localhost ([::1]:50110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQNLD-0006fq-3w
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 02:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2270691b0=wilfred.mallawa@opensource.wdc.com>)
 id 1oQN9d-00086T-BV
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 02:12:49 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:49381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2270691b0=wilfred.mallawa@opensource.wdc.com>)
 id 1oQN9Z-0000k2-6m
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 02:12:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1661235165; x=1692771165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YOQjuP0GwYm+xsEBe9XVUk27tsNs57ziEwBkqS6jfJw=;
 b=ibuBh+NWuPRezzYLMiXn+EYmUy5PxGQC8oyQxsuxIDheBfk1nozP4TPP
 VaJAlnwMOmeTh/kVC7h+C4o0fxxSd0PqTuzXKvyi6zTYnSbtbFB9iidHY
 IepQIuLYWce8jSHHyiU9uoZgQ43h7WLu4UYWvhza1K5yn3v63QJadTZ44
 NlyncWE08DDUoFJRmGs7B4FL/QZL3yPyAJRSQV+WcPVd+UWZoZquT4wMC
 nX5881caZjJidkbdMGwwSuHcSLr8J5YMDxXlKk4+Y0UjN6qiPCg5oJ/cA
 KTdH3fYu2gvwaM9D7RVlDLEWEBKUn2HixfCO9INrg4rbkKq9cCDzK87jq Q==;
X-IronPort-AV: E=Sophos;i="5.93,256,1654531200"; d="scan'208";a="313671693"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 23 Aug 2022 14:12:36 +0800
IronPort-SDR: y9OsYeTu0oi7RVOqDAkiWqsIlD80eBJNn4sLbatIu2DZCEp7obe3qPZ+itnJulV7P7QbREuzsj
 lL3NyY1WWgT3FxytPkGHkktDNSQfJvTbw8PsZBxS08Pq9ph6joYVsAuRUE9e0o3K6+Sshj6lqG
 eDjG1wCucug5ritmyMjAapXgFfI1d1HHFcRahvfXG844GyQhedVbR1Y7vKCJLtinDSqhm3jA+m
 l3IFLNg5pjpqRwD9ttxTypCCyy8YbcHDloYf3AtuWhw/BqQhaU1SUJ6oeLH/4qj/uRMiY5LNFE
 00W1QxFaYonp7xpCZD0kIu0J
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Aug 2022 22:27:54 -0700
IronPort-SDR: ADcqS/gJK5zUb9m3+uCi8qOZ/0Mg/k6wUiomxzzCeUiGIErOoBJrXiIHI07qEXZ1mZhfpSzFUC
 XN0iJjhKJq2DUUW5Sm7Gcj64wFnhwaz3W7qxzU43tdgPulYJJBf72ArBxFmudW0jhCM+VA7xep
 A8WChILdvH4GRZ9mdYAtNITT2bSnNE9rTid1TTAWKkRet64eWv9LH+RZU4eL1TpwPUyi6H0Bqf
 pZ8bCEacwIgJd44Xt4i5D1pi4qUyLn85ItwrmpBR048JJ2gzg+qbmoaQJY4JXzQjReez1oo2eE
 rkY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Aug 2022 23:12:36 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MBf5w0pF1z1Rwnx
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 23:12:36 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1661235155; x=1663827156; bh=YOQjuP0GwYm+xsEBe9
 XVUk27tsNs57ziEwBkqS6jfJw=; b=WaG6+m9WzzkUdQ+mzsZxecZqk+kldKRSF4
 OXFRgzfmEAqy9TqM1hM+ajRMnhSI5t4HAx37ZByS+OYbe6/h7oPmWO1AJr+UI7Hv
 RHA2g/AegA0VlOLsTpUZcvGAPZeqAOXdkASR5YyecDU/Jj07mX2pxT7CLkZaEtRp
 1ABoHy/JX9OokY1Ayvr1gWuGtMyTqP1p32HnmcJThb9On5eG4JS4wm/KlgTdCc+a
 clSVmD1UhLzUEZZW0PVuJsbsAajzPDf7bwEjkH8Mf1fGxm6ysok1zHDtKAikVgIh
 mEqbvYmRduG7mNE4A9KyWTomXL4aSr6qqlbb7Yan4u5MFqKRTt4w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id eT3ljb20g4u6 for <qemu-devel@nongnu.org>;
 Mon, 22 Aug 2022 23:12:35 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MBf5r48wYz1RtVk;
 Mon, 22 Aug 2022 23:12:32 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 1/4] hw/ssi: ibex_spi: fixup typos in ibex_spi_host
Date: Tue, 23 Aug 2022 16:12:00 +1000
Message-Id: <20220823061201.132342-2-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220823061201.132342-1-wilfred.mallawa@opensource.wdc.com>
References: <20220823061201.132342-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=2270691b0=wilfred.mallawa@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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
2.37.2


