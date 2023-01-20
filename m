Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC367674E3A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:41:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm0B-0007oo-JA; Fri, 20 Jan 2023 02:39:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIlzw-0007gh-HJ
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:40 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIlzu-0004mQ-NT
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:39:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200378; x=1705736378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RrU4nYJ19k3rIFe7CmhKAO0jzgTQSTnqBRFFTnuBj1o=;
 b=lANIbTVJLDujEcqfkqpf/SSo76KN0psxStUJxS7mtV98CPKNluF7VyYb
 vZMH02TQx9tnPPRHLgMmnTlNm+OeS6pGwA/XBuPX68RQ2DbQmydbufSdc
 Gb3I29BCBlfgjxpBVju/uU00xPbllqEVgDJCdV/Z/wR4KSuDaoAlRRk6Q
 A9/Yv28NEMv2fCr5rw7YelHcFpoQCPivaKxKR2n8/qGTEh++x62zf++Ki
 m84y+r1uZrW1nO0sdCgXij7zVol9dWc7VAeiTMZoyt8J67KNuq1L0twcF
 o/sH4GGQGBEbpTGSgk1c63MH34J37CcCbikTy0x2UubnTmKLn6VXQLRVo g==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176688"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:39:38 +0800
IronPort-SDR: 5dx5WeeyrIQg3rMwOZrT9b5plfzwp4ED2xXylba2Ds5YhJwCmcpGvJuzvacUgiMuFyC137x6Y4
 oxquQ0ZbPM9ir9f/4kexjbedIVoCIVSDQEN3RtyMCG81X3Ni9phpAyTwAcVqjiLapb3bGc5vNi
 AYC2fwnYWTA/yDp8I7FJobkzu5py+llTjs4jGUxkJauOg68dA+E5578OmxiwEYVzIUjqR3PM4z
 QbmUsTZUDv1gpNebiaoqsWVNM0yQRIB8ibIW6ym/fhJQQd4ypfY2BT+/cASok/gRxELwwnK/jg
 T/A=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:57:16 -0800
IronPort-SDR: TGlvJomurB+wlpdSfwUrRuWA8941haz451NCTr4MjK8MYQJratztrFOg5lAMnqg/0MZbv5AHlK
 KCYnrFNVabNNmRlUl6aUGqwQFFndjkVUHTmLktQIx3zRihVLIe+0itCOuN7FuoVlBhg7+kWz6C
 vrXYQ0ewlsxPAkneg2YRcX0iTM4qTjmX9V+0cb0AOFW5pr0xt+t5MjkGva7o+tVZFGmCm7bxHa
 2kJedDlQC99DEdA3MtLvMF6iQ+YI7RCHd4F3OmA0J/c1NPyrdciP3Pd6LEA0cf5oap6PMbeYzX
 jbI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:39:38 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyrx55hgsz1RwqL
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:39:37 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200377; x=1676792378; bh=RrU4nYJ19k3rIFe7Cm
 hKAO0jzgTQSTnqBRFFTnuBj1o=; b=XxVtEOj4yXpNWM/I+CwbYZo7WQ+hXNx6ZU
 f7DEjTpT2QvbvCLHCcMpZCELkms1eabcq4LHh8iAIHMXt8MCmaGCAomfs9FPkbJc
 awgFjkMaymRBGabgcCOp+fBy8++o2CHMsfI8UKg0bInAx6jCdfncBxdo1srJIo/B
 lnksJo/5MzGXm8kSLeDSksWb0zX6rN3yi8CtbQDljXTSbAoE3rC4rtQpzhplstQ2
 vk5x41lqBEL+p9Ox1aUsPU3rZ2QTxTgEjf+YPouTbNTXlhsys9rXqwwr7o/g03U0
 CaT2tCguZ1/T8vUkjl1jdQ1H1h/0ArzNs/8hVuiks02o2dgMS8iQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3Af8MlrJK_Vt for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:39:37 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyrx366c7z1RvTp;
 Thu, 19 Jan 2023 23:39:35 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 08/37] hw/riscv: spike: Remove the out-of-date comments
Date: Fri, 20 Jan 2023 17:38:44 +1000
Message-Id: <20230120073913.1028407-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=37747d9ec=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bmeng@tinylab.org>

Spike machine now supports OpenSBI plain binary bios image, so the
comments are no longer valid.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221229091828.1945072-9-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/spike.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index fb4152c2a2..df9f070707 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -255,11 +255,6 @@ static void spike_board_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
                                 mask_rom);
=20
-    /*
-     * Not like other RISC-V machines that use plain binary bios images,
-     * keeping ELF files here was intentional because BIN files don't wo=
rk
-     * for the Spike machine as HTIF emulation depends on ELF parsing.
-     */
     if (riscv_is_32bit(&s->soc[0])) {
         firmware_end_addr =3D riscv_find_and_load_firmware(machine,
                                     RISCV32_BIOS_BIN, memmap[SPIKE_DRAM]=
.base,
--=20
2.39.0


