Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2645E72B6
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 06:12:15 +0200 (CEST)
Received: from localhost ([::1]:52262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oba2w-0007WO-1a
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 00:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyE-0001QU-0F
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:22 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:63924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyB-0005cr-IN
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663906039; x=1695442039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p6+YXUCXUGeZxwmJkeAS3Bk65F/JmDABn0hfm3dL3wI=;
 b=JM3oAOfsehweSVp9XKTuFqTSeJDq3WN/K+3o6yUt+9Otk+x1yd9RhrhE
 8O2WIMK0Z9eC6b0YzjM1JNThPJ4zpzqoBMxbiS1jgSt0yUmm+HEYs6oOd
 8/brBwxEjOUERc7Pmb6SKDsIRnzFxa73VWATwyggnB2vPSJ9Lhb3byZkV
 hMnBLlxAV3xopZQ1S+dxYj+hI6mNZxz/2XNARwdsiRiiaLzsg0XkWDBMr
 AhXz3cGu6hKcosHaqR9WR6xKioLPjb10x0dZDpCzaZzYPcXZTuMDTaMr/
 NXTEBJVjCNcLJ1ckCvqXRQU5wOpAfeHhrSbbGzS8YGgNi49+39Jj1hyOp w==;
X-IronPort-AV: E=Sophos;i="5.93,337,1654531200"; d="scan'208";a="212510437"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Sep 2022 12:07:15 +0800
IronPort-SDR: /ZlEZ2SfCV6crCcs6Sql0spwdo8SXsEKvOseQFbf3LbuwV5eT/AkFVE+ge1CTBZzR+gd1oN44F
 nSiPh8b7kRRXajvFFGP0M2FXXI2Gg+6yxtJ4tISjkcAL6JLJmbABXPAIA40iowjsEx3iRaZbTW
 vN141Dp/cUVVaKMv94+dBrkyHmYdTN+7soUeWGr1wlLwERTf5RbvxhOUD+J3YQsW7eFMXwwEIX
 E17nKCQCXM3J5n7Ubk7rXXfVxwmlgq6N2NzAl96b7gJTOIXNo5q2VVKf++El8F3uuASj9rNoNx
 UGjWGc+HZxzfTykWYkzFO6Se
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 20:27:18 -0700
IronPort-SDR: tkjojc3xANSf5PcIdfo/6cwdazQdw3cryGHzNoaku/rRLGuqsPIcRN6eAYbuBe4lJ9PKhbpzEb
 cXa2IjFsnSt3u6HkSbPQ256ABfwcM668cYz4qu8BrX3BWvwX4Un23T+vtWaPDLhLBpeUUQRCEr
 pnG+/toZdBDddjev2VKi1jIJlIkrwBgUtMvdorhUyeYzRdftjziikhi3bJRQXczbDaQZ/9r2wS
 c0vyVqMhWdUQz4hI/G4lj24x64trShnKvwMXTLupclHJHpLYW5rG8CjqM0Vi9tN0K6onXUtyaL
 5gg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 21:07:15 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MYdrz30vwz1Rwrq
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 21:07:15 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1663906034; x=1666498035; bh=p6+YXUCXUGeZxwmJke
 AS3Bk65F/JmDABn0hfm3dL3wI=; b=QdYxnzG2dqZah3KeyFi8XqydKwY2O7i3zu
 bke2CVHHgN9R1vXPJEh9eg17vwvHT2ZuMx72LDHGmRvynuYB9tXha1tZPnBaqeBx
 SkQF/yzl86GNd57qQOC6VR3Z+hOE+U4frZu10TOjoOuXtwK+RW+/WT38qZBzclB6
 S1WQygpf/NgItY8cOO8gcYLYnzfVqBINQyoakXPe64AlqcFRwrtEOIsOlPwyUhEd
 sQha5RkVFjTygMIJOaXH8Ks01S4yZavrAILxk8cwjiiSUt5LLejpVxf6dLg2VLnB
 bHqR6SVMi+ObmxMBEW923XfdGA9F28rFetk1EtrOYKoaScEbiBmw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id wDFeFADPsOxV for <qemu-devel@nongnu.org>;
 Thu, 22 Sep 2022 21:07:14 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MYdrw2Dzqz1RvTr;
 Thu, 22 Sep 2022 21:07:11 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PULL 01/12] hw/ssi: ibex_spi: fixup typos in ibex_spi_host
Date: Fri, 23 Sep 2022 14:06:53 +1000
Message-Id: <20220923040704.428285-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
References: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=2580c328f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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


