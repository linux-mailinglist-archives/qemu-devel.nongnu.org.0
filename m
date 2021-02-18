Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C01831E42A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 03:02:49 +0100 (CET)
Received: from localhost ([::1]:38174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCYeW-0000Nn-CH
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 21:02:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYcV-0006z1-Us
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:43 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:40590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYcU-0008KW-4T
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613613643; x=1645149643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gY9KvPN3VV8jEuwvY35c0G0XjvoRDGj1JGKnk31n4Kw=;
 b=p4fzlOyJ3k2vTOBOjtvI/x+aEIBkGTCOD7PSuWEWCKtyzoAkLHX0xBSk
 bHJOiWrdKcTPYvibr3Ft7j70vHAGunXMWHOgqb4fgzijhEcZ/PMiqgvdp
 ttpaWBGawWN2EPr25+LQZEnk5iwdGI6IvhEWcg4tOanWrvXNaE9b77Mqy
 CexDv/pziKSt1MXw6zuIib8N4C6oHNSHAL8Dp5tlC75NJ+DAZ1BmDRiX/
 XnnWUErahq4ZgDr/yv8bYy3DTgqT94WlZECXBLjssMZxrOgp3R8A0xErc
 vgEulLVhp3oTMQbz32/ofcKzKsV2sRLCJCVaBNNICcFpy6ondJYNhKlB0 A==;
IronPort-SDR: 650eDjVvWa8k0C9ovwndNMD4RsM2rBDr0Mibg9HQ6ekbCRukyZOZ+eVBSjaLZ3S+PpFaQbvCCv
 h5R5rLTBNSwNj2MNe6KWeaPQNrF0cT1SwxNDH7aFIkGQNNdogOBJjgL9ZW+hqtBNh5LQliYfbn
 +FHdav7pW23wKW0K+y1TL3xXiJV4Hx6+D0bk8fUJoU4fZs3Xztbv85uuyKazHdzxFQmbkFpsmw
 YFKOLAl6uTSePIe7FacNjPuQDyBQEmPSf+cDhS6duXrrkF+cUMRsvNF0rOPYQk3tp69hZSztcy
 Fak=
X-IronPort-AV: E=Sophos;i="5.81,185,1610380800"; d="scan'208";a="161392143"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2021 10:00:01 +0800
IronPort-SDR: PmQffHx3oLyovVCKQxe0p2/wKqc56ANW9DPP30aPxUieR9yRxCOHE9oN1ryLGH+rLGKjm1hvr0
 6Cda/LztKRW2v8E6x/CVPlSO0rigOYBtC6V0uIyrzHPPx6Um2LMaH7YNX9rqFKYPqBQB6CrnP/
 P1H4Ai07l/qPy7tWJz5GJydY9f/DIPPeEJbFVmhvrW1Clfi8SqAVQHZZM1sfrcvRQn9mkmuVUq
 i7WQleDpIt+kZm+JZIjPCD5Qm5czJ26eVu7YrgKN8f3GYPmlMfE+TvoWqCA39+w7y7FecRnWlX
 kl7JzCUzPPhVgSC4l+5YEXGa
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 17:43:30 -0800
IronPort-SDR: 3BgCwFksUAGY28LC8zfZkMJlf+0JH9mMEpXsScKkNOyUcUbAdrBAjYknf5FTrv1YT0xfczVsqn
 kXQl8wDyvqcStn9E5dwTTtMYwaBRq6RlE3Fioo2Fsoe0mHmG7YyPQuFxJUdUkuW2373XZKMcQs
 pfTcnsUn3JAcO3nXH0e1NdkewEHcLSt8tvvwR7nzSd9uI2uNIyZ60s3i/IYeLYBritaNkLWbT5
 KSCfZ9hrBqg5hf8H6q6l1Ep90C6BuOtDI/IG0mBHGaw13FGaJtxFlsq8hHb08U4I8ASKWVRUun
 vzc=
WDCIronportException: Internal
Received: from cn57xfd72.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.43])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Feb 2021 18:00:01 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 15/19] MAINTAINERS: Add a SiFive machine section
Date: Wed, 17 Feb 2021 17:59:30 -0800
Message-Id: <20210218015934.1623959-16-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210218015934.1623959-1-alistair.francis@wdc.com>
References: <20210218015934.1623959-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=6763bdb70=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Message-id: 6bc077e5ae4a9512c8adf81ae194718f2f17c402.1612836645.git.alistair.francis@wdc.com
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 68ee271792..3543a03343 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1363,6 +1363,15 @@ F: include/hw/misc/mchp_pfsoc_dmc.h
 F: include/hw/misc/mchp_pfsoc_ioscb.h
 F: include/hw/misc/mchp_pfsoc_sysreg.h
 
+SiFive Machines
+M: Alistair Francis <Alistair.Francis@wdc.com>
+M: Bin Meng <bin.meng@windriver.com>
+M: Palmer Dabbelt <palmer@dabbelt.com>
+L: qemu-riscv@nongnu.org
+S: Supported
+F: hw/*/*sifive*.c
+F: include/hw/*/*sifive*.h
+
 RX Machines
 -----------
 rx-gdbsim
-- 
2.30.0


