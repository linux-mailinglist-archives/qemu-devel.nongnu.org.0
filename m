Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8DE6538E2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:42:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87mS-000868-2i; Wed, 21 Dec 2022 17:41:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mN-0007xd-DU
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:39 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mL-0000Xf-G0
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662497; x=1703198497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X5pPuQ/7QbzlG3f/0UBJxpkHOFrd2/Xcw9qJolUpEC0=;
 b=YH5cKhMEUzCXC4nN1cePZ+WaFjsZiG2zTV9dZy+K42hD3FT3pJR9Z4B9
 QNQOeQSQCHSnfO8tEUZBqlSRF9vUoJVBvyI2HhbqyQq9zt4mlPnX6qsnh
 fmik3iRde+CM7hjmvX+2+ipvq+NVf98Yp13yRFOii0ipWwpfjKEmkKMA6
 KxpoEGjhSGmwRl0rrtBe6VjXAAOZ+1m5GPTNhDwrYtD3VCZCK+nKRl4OE
 c5dXX68iSH7ThvhhfW2E3w7DCOghxDNDDl2IXhZNyGRLdLkQ9wgxCgjPR
 7RT3XM0W7p0xfTecIPIG7gKZzTb5lZd1+Jq+DZAdP9LcKdCZ7K6dUm5RF Q==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561355"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:09 +0800
IronPort-SDR: Qh1NanBN/idTI5plb8HkED4UGryZdRij+IpFdp6gnoyfVnNIoRRIovLljn7DKsRknhtvbeoVOn
 x33M+yfYySukxTNaNnHVc/hsWWNIZg+LF0/hV+xoGxgW25UoouU9YG45j21OVAevvqVO7pdZ+a
 rhP/FZ9Sb2ARZ/W4LLuqy5a84cg6LHV+WKlr/o5vQwafR4mdaRjmEGIgThKr7xOd1T/lYsD97U
 gYP7/2yJHO2808Ruh5MJoYRTRKS/miYrqjAK/Idis01l60Dd5Dhh4YN9mQmdn99hdyuJFCkWux
 SRA=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:38 -0800
IronPort-SDR: DYC5e/1fBfeZ/V+TQ1TSYiTbovnQxjB4TyxiVsXqJ4I347CZ60ZOsHs9rrId93xtQoCVLsVDP3
 mI6Nb3win/eBHdmPscCWryPipZEIp0inTjNKdUYxj16jSO4Xpq7ludSRUakWHr9iuIHJZ7OWDR
 65i9v/inhTAjmSdcwTpF06yzPnFrWN6SH4M5fSPQf3nUoUqR20sPXoUBeEroXvHD30DiXW7efa
 3MfLg6c9ZiV2ehb9QxMldxddPuzDluVLeLY58Q5dybXkUBjnRTxfpAC+Hxv6114qi0He29Z6wP
 8vA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:10 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpM91zfZz1RvLy
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:09 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662468; x=1674254469; bh=X5pPuQ/7QbzlG3f/0U
 BJxpkHOFrd2/Xcw9qJolUpEC0=; b=Cip+ZIhDRtSNzcA15XGsuaOPq9YG1Bx+J+
 arfOscxmnZT3kZemtWnFr2u1ooIkzsAOAAxdOgX4bVE6cGj6JhriUkwmdWnmkCXC
 hSdbvPDbZ5EjvEa/BBdL3MH4yHSktAeaDW2RwK11sjtybDYNJc/+j7gIJuG8pMcN
 4IkD3Kt8S9FDm09RWBlVxkVTmzdcEzddY8vOrpNHSC5wT4+WyKLmo0noomlDZphP
 t0oiDDneBge0d6M+ToaWDtnoNkzUlYFQT3bckMG79Ea/a2j4otA0RqMcNb0ujG+8
 URlFA0G6f9A1LP1JjjdBXiWTrF6XsVCbn1I6JkRwAulLiAxZhO3w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id NrevDY_dKFCQ for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:08 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpM741FLz1RvTp;
 Wed, 21 Dec 2022 14:41:07 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Jim Shu <jim.shu@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 19/45] target/riscv: support cache-related PMU events in
 virtual mode
Date: Thu, 22 Dec 2022 08:39:56 +1000
Message-Id: <20221221224022.425831-20-alistair.francis@opensource.wdc.com>
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

From: Jim Shu <jim.shu@sifive.com>

let tlb_fill() function also increments PMU counter when it is from
two-stage translation, so QEMU could also monitor these PMU events when
CPU runs in VS/VU mode (like running guest OS).

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221123090635.6574-1-jim.shu@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 427d4d4386..1ff6ab5746 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1258,6 +1258,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address=
, int size,
         }
     }
=20
+    pmu_tlb_fill_incr_ctr(cpu, access_type);
     if (riscv_cpu_virt_enabled(env) ||
         ((riscv_cpu_two_stage_lookup(mmu_idx) || two_stage_lookup) &&
          access_type !=3D MMU_INST_FETCH)) {
@@ -1321,7 +1322,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address=
, int size,
             }
         }
     } else {
-        pmu_tlb_fill_incr_ctr(cpu, access_type);
         /* Single stage lookup */
         ret =3D get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, fa=
lse);
--=20
2.38.1


