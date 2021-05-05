Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ED2374BE1
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:28:10 +0200 (CEST)
Received: from localhost ([::1]:56454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leQw5-0005v3-Cw
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQt4-00011X-8t
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:02 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQt2-0000wu-73
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257100; x=1651793100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F35Wlg7ThlZkm1vRHn1Yuy4izpGJ5nEtQpXZGyOoRmY=;
 b=EX+I1nSbid/NsT7fNaYUUERlTdM2S3f7zYywjTwyNO+PSRD+obUDykMN
 YTwAce8dwAN8cfzrCwFx999Wyp16234wS/5H7DuTf4mcubISUuk5Z+N22
 eqMwu7B8pT8k4Aa086iApS15/zKcxA00DYCWKhqW+4q9jMuqRgocsxDo1
 tYQ/Ny7lcP8+jGQVHsA0AqXKEOQWzS9fo7zyIhHSIScpYyMXBT0UwXotE
 1/v2Z4QBPgTklvHaLlTNhAyYNAHD5OtUv0lnzBSHpJh9NzoG7mVajYHCz
 tIV/ugduS8tb9va3UF5JnTgK3mbfG4vpsNEjtmDQ5IpFTghpxm9RPYauU w==;
IronPort-SDR: weaxqkPhQiioZxpv6az5xNKAIp8U8N1vv0ZEZBgsGDMZhUroisrZ6gc/Wvvt/506q/CwG4qSYy
 xdMLk0h3VQEPeqr4GePsvRD+xnH2LIZh3FVLx9eBmivwOC3kTsZx/HGHjYxiWvbhHwr3CHUKlQ
 FABGfR3Pm2AVoXZws2psmM2Bqvz6+WiedIW0lTaKIADYd6Jb8vIQPMdyrqfBAhsmbRx5G6U1K0
 C3I4cfYVCSdcdwcOljppAfAvNYz3QuVi8FC9BOgTrmnEl3ekQo0x7NiOYC8C89jutvFrelgQZG
 pL4=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166585965"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:24:49 +0800
IronPort-SDR: NSULJZ3ZHjHNKgdZcPmSZNQfEYzjesAkASOfkCL1CIqjiOH3U+SRLIn5B/a+1ZwyXW1O119Jty
 hZsz2322quciz5bMhYv2QMpItNoRmta5dESAmJCUkU/Qjgjo2IY6d9p8GTI8fsISN5B8YQ4JXa
 uCUMXfWGfPXRV0voBfDdWdfSfmDBPC7JCAl89GPyqbNhwDdbtapC9Y6ngM73o1DQQpBxmAN+1F
 WPYY36pGZicQC8B/QYK/k3FKLDsf7KyDl4d8eYjtVqTlPNs8DNMPk0qDPVz2/jfbqAE2wwMZGp
 iujj00mvNfBeKbUoMxxvytpf
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:03:29 -0700
IronPort-SDR: DqMbLKVDKvNkxFZxZETphj0eHKTIxbeEUvGduAKcInZa0rspQw51TT7kf+cM34yGIHJsn0RzW9
 5srt24wvMPp3LCRyXkuEGXA35JM+tLZAF5YEeYtARTJ1bl0tJ0PUjMkbNqpbrFszzAWJjFANu8
 HSbWoeNmoWzkKX+btKf3+gye+I+IOIiggTbmllvEEOHpcTl/QwtYjQC+GoiTzDkEfUHgd4VPoO
 Nq/6Av1Vp6o2FpwlXFu2UVdj8WMN1YRPeRBCUZRdyAI837EGhogn0bYnoWqFPveXgywrBkQqJD
 8fI=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:24:47 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 27/42] target/riscv: Add ePMP support for the Ibex CPU
Date: Thu,  6 May 2021 09:22:57 +1000
Message-Id: <20210505232312.4175486-28-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The physical Ibex CPU has ePMP support and it's enabled for the
OpenTitan machine so let's enable ePMP support for the Ibex CPU in QEMU.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: d426baabab0c9361ed2e989dbe416e417a551fd1.1618812899.git.alistair.francis@wdc.com
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 66787d019c..4bf6a00636 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -202,6 +202,7 @@ static void rv32_ibex_cpu_init(Object *obj)
     set_misa(env, RV32 | RVI | RVM | RVC | RVU);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     qdev_prop_set_bit(DEVICE(obj), "mmu", false);
+    qdev_prop_set_bit(DEVICE(obj), "x-epmp", true);
 }
 
 static void rv32_imafcu_nommu_cpu_init(Object *obj)
-- 
2.31.1


