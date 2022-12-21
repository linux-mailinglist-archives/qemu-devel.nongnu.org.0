Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC2F653925
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:56:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87nO-0002MX-Ot; Wed, 21 Dec 2022 17:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87nL-0002F3-Tt
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:42:39 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87nK-0000bQ-5o
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:42:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662557; x=1703198557;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QikRAc9jhPx+8qjwv2aF1TI8bV2sm7YwxCfz1ApfiCc=;
 b=im8bAhOu6dI2LBMP2SvIO+Najm1yxpSspaK/N72WHG7ocjMPKVc3NIfI
 8lqrwpEQ1hYJqvLHJB2XG5LKUpOgok07fYHNBGCp7ZpGEWng3gcTDSk4d
 Mnse6uteXIkkOufNieDw1R9cxK8HX8xV3sHF+wSCL4G2gpxcK/QAHWnql
 jBgRViUAkFkDtIX3GW2bHGV4Q3Y7aA/P/RQYnqtWRPyn9HxjbINKsHfCX
 AHdk04IQTeoNgsjBLfpkdL5cNUlgTmbiWaJNdytJcyj8G+jp6cgCKDOU+
 tHqE+5nswX3Cz8ZNCN/QdNq2EtbUHfInqHxUVHHH9GqnLpYDvvZom1FPh g==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561420"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:37 +0800
IronPort-SDR: N8iU1YrajXH3y7VG2+Ym3Edrg2ZGUYi2MjObVmYzhwSAXwYFCM+AedimvXrqvr7dxeLyVzrl7a
 Z0E9PXWda7FBtfbYsyTMQobvrDztgfiukQBJ8tpKspjVcTMhNhJYUPORmIEr8FxARqvKTRcsh+
 VLcNG3JYqmTTfFld7mlwKZlrjXfEO9qKjWWAUJxUC5oJwDK8dRjieXBATuDpmUjtIRjUfGAACe
 0XN75aurn7Xm4AHX2qf7TQvfeaQTX5Yp8NJEeZafRfCjzAJCEyz5NV0oD3jqb9GcE24FDT0ZU/
 UGQ=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:54:06 -0800
IronPort-SDR: Ar7EvfYlP8k9K7vz3iq3BKYAbz04liOH9mdKAHJYDLedQBBeKX7ZEXqgjm+QEw8gi7mVmcgZZk
 erW3DRn7LS/p1vSooCCnvNG6M81waYTxVlOzoDTFfltHAN1LNyl+lLUoMnwhL263nrN4LexMgS
 MsbFcCaR9Ao5rcXhcwyLPdwiJgzPVzZMZ9KgTcJK2uFFqvyZEkrTwPN4ra4eORf8QupEh2LlKd
 aQ75Er3T6KVkfosvJu9XZdG9wDgKc2jEoR5HSGlBAjs05BhPJ+0lcG1OVE38ccLsmxx5O6p/36
 MqY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:37 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpMj1rgcz1RwtC
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:37 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662496; x=1674254497; bh=QikRAc9jhPx+8qjwv2
 aF1TI8bV2sm7YwxCfz1ApfiCc=; b=TBY2ug0cEFg9DuK76oobOOcTSvzknBB5XT
 mwyeCzi7R5zRXoJ5ZWln5ZPOJc+ftaLU7GVEM9nnF1wHyJuGyMaryCsx8FCQ3hTi
 Msa1zo6yNd8fbLue2T1N3z1c5TM4lNOV7hqLZNH/0UPcP+f9KTLB7ItJgP21D8eR
 Hh5b/BiOY8Tci63duK6VEc//ENnw6VBBO5/bjnS2kG2MITWnwpChzI+9iHoCeHY3
 gs1lkYVxD/eUMQagaIX5wuN99NyVgCJVEbZcVbIenVGzMzN5keJevWsdFrkn4qg5
 Hmc/6/7JFHplMxPgPB8bhvRibRTosHpJsTNQONytAVbJbCLNKdyg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id IarlFg4J0a2p for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:36 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpMg2Lbrz1Rwt8;
 Wed, 21 Dec 2022 14:41:35 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 32/45] hw/riscv: Fix opentitan dependency to SIFIVE_PLIC
Date: Thu, 22 Dec 2022 08:40:09 +1000
Message-Id: <20221221224022.425831-33-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bmeng@tinylab.org>

Since commit ef6310064820 ("hw/riscv: opentitan: Update to the latest bui=
ld")
the IBEX PLIC model was replaced with the SiFive PLIC model in the
'opentitan' machine but we forgot the add the dependency there.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-3-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 167dc4cca6..1e4b58024f 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -19,6 +19,7 @@ config MICROCHIP_PFSOC
 config OPENTITAN
     bool
     select IBEX
+    select SIFIVE_PLIC
     select UNIMP
=20
 config SHAKTI_C
--=20
2.38.1


