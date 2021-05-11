Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CFA37A591
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 13:19:35 +0200 (CEST)
Received: from localhost ([::1]:51656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQQI-0000nn-IV
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 07:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPY9-0004aV-Nx
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:23:38 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPY7-0006TG-Uz
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:23:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728615; x=1652264615;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hm1PZz5zTe2h985zHWYZPUO7Ex1Xb0pRXXDGBKNcQMc=;
 b=iB1JMC7O0CEvCuD5Wyl8NpsLwUHwREA9lbmPX4Dh7IpNFSno7l4H7dMF
 41eKndIy6mDleGnTGkxkTTmw37FwgknphDrTt2W0DtVfXen/pg8pzCq5n
 bJRC1yPMWEeCWFy1eC9cDrHVRoA+Q3CuwAs2ap0DdPuOBc/S9FFcrp5bU
 WAeZC0YM4cd5VM3olEFk2uUSXZ6IQs8yTbh3phYgeSp0vGZBTrR0LO0kK
 u3QNEk156gWS5wzfskGz0r1DxF2ftUNKcVaOv6WfnRYeEA24P1lfCT71r
 18irauS8U5SoS67XgVGREDL/tTGPb7EH4ehxfpqdk6z2WzzWwoCvOdoq5 A==;
IronPort-SDR: Bqk4oZEe8M8ok184uOt97z6r6ynpGIV9K9QVOM6gwI7kiFzBxjPth2GPjZxTo5MgifVUPUXuQ8
 nykTmyNNSIXJFFcLt3tKfHeMV77lr+tL/EsITcS8Q6vXemHpiyfEgbgZV3zv8POkyuFYVstXmr
 LC+etDe63HFor1PbBP1izDV4Qmc38hyGn6cJ62jH2NraNSgWqpgvAFxq6wht1jlJZdkS1qQ9aw
 3Tagaz719vXLM4sJTZQzrLzMjWY0UYGzyWbLdFsjuV/VbfFlzOxNrVRjjwP62ZbIHi7C1T7x4+
 eS0=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735527"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:22:19 +0800
IronPort-SDR: nQRTfTcM29Og3lgT6lBsEM3GGoLSIIuErIHQweNRPXniSYJTUyUWT5SxDBVuRhz95Xc+2PpAwD
 gRx0GCX/sPfBh09T0NLjgs5MjoyWQhHX9aWBo2U7uP8k8tXYHH/+zNfIoUwg3rW31ZOmgp2Kvo
 6TWFo9NcMD/tQKM8aKoRPk7NkU8ORXajGOasfTMlyIs2pBiWiRTK5x8FfPeRCnE24hG1c3uCme
 leaaib4GhzMyj/1UPKypGTOLQ+FWkXEdK9uCQxWXROPfQmXLv7UiNnSpP152uxDGPP7jInUJtj
 KAgsC7UBIYlzdYktzZ7w0wvD
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:02:18 -0700
IronPort-SDR: zMKZSO+fHpfohjH/kuuvG3upQoSZMUE0mtUqQrP+A2zgJQAxWsQ7h2sDgrI8Y58fio/Iv6szkb
 Xv8Fr2qKOPrKtUFsBHuMzXqTB4T6CYrSekmO9qcrgF4/+P75RMwQLjJzHGXh3fNk6lazJuznGS
 Ioah6lctruNl37nGUooaN9yWCJ3C9KMqkyh5Q7n9v0gfgSnRdlKl4DlIl4PllEJ8dH3KowY5rP
 LBK836tMQPc+QMn3a8UcHZCKC4fD7mCOgrjFyHwMDU/TP0pkjf8GMEyeTt/qthy1JN5FEFu6t8
 GS8=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:22:17 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 42/42] target/riscv: Fix the RV64H decode comment
Date: Tue, 11 May 2021 20:19:51 +1000
Message-Id: <20210511101951.165287-43-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BugLink: https://gitlab.com/qemu-project/qemu/-/issues/47
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 024ce841221c1d15c74b253512428c4baca7e4ba.1619234854.git.alistair.francis@wdc.com
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index fecf0f15d5..8901ba1e1b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -288,7 +288,7 @@ hsv_w       0110101  .....  ..... 100 00000 1110011 @r2_s
 hfence_gvma 0110001  .....  ..... 000 00000 1110011 @hfence_gvma
 hfence_vvma 0010001  .....  ..... 000 00000 1110011 @hfence_vvma
 
-# *** RV32H Base Instruction Set ***
+# *** RV64H Base Instruction Set ***
 hlv_wu    0110100  00001   ..... 100 ..... 1110011 @r2
 hlv_d     0110110  00000   ..... 100 ..... 1110011 @r2
 hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
-- 
2.31.1


