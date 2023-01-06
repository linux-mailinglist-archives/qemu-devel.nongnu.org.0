Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB3265FA4A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:30:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdCa-0001kc-8U; Thu, 05 Jan 2023 22:15:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCD-0001Q0-3U
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:06 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdC8-00088M-9R
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974900; x=1704510900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0y06Eloy4qYCTZrO2klxBInbenlq8L6lxdT3Guv1tac=;
 b=g962ORAY1CmebJBIzIchoSPf/VrRrM1mRAX0QI1gu57RuFc43hxEWD+s
 leFcjFCP6gDjrg240Z6T0jemc3A4JftuuEgpxsH00khkznsixTtCj90wQ
 6cjitdQRVRMtHVOMO5UG4w+wGK0VkY/sPpRB9yiFaIYQkhsQZgaNU42L6
 0Omj58XF/ofn4gmmo2ycUnHGCTYY3N5GFDDZczMHXrqbQ/vgUPmRo0R6S
 Xdv50wsDqUC1uZa5KtZrpJxypcJJAkO4OXCCaCwNpgo2Oe7M/0DwENXpH
 diVfcPmbRe9eEmB6dMyS9DWfRYbEUs3Yu3f91gvs8b/0JUT9o4HhFfnih g==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254788"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:34 +0800
IronPort-SDR: aT+y7vZ3Xq9nwL3b0iy1VqrzYoz+9bYyKRCth6DuuuXJorrh9m+lgccQBmXPBEwaEme7bfV54I
 P5kpd2riM7Uj31A9rBzFkEuQOTUFXDGaulGn0LW80ElH/KzfQ8XW+5jzgIVRzq94xxDrzf7ClD
 6XMHrIyJNxxGCH4mGpoeM3ZciLyCb15M6wfCiIkHldgM3oYfJhuFrnwMrPo/N3bzh87IKi5lVc
 9Y2Og3zSMmYsrMhPTdJkGv+c3oXdcrPtVRjh9WSu2wSxazMim6Ox61JyBYiOQE5r9kMI9FZige
 /Bc=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:45 -0800
IronPort-SDR: +XMUlIEUpBgFaw5rHhZpTPv75DxcYctGdZbI8GNkW8dDGFiLgkK6ogI59aVMRg5CAWN/5AEEP+
 56NUcet7bKnyC+1FZ9NyHM6yXJKhBtpOL4UXwjUDV7sV/BQ20fnIInM8M/CQs1ewpHrKYIw7mY
 NXChRaGMeK4DmrMapytAXBUg12Er+zKvg2FW+06OxEtNPpscRRv9z/V3z/zY3m79Or3Ae3cl4x
 HRo5dbICRygj6Ly3/8HiA+kdk1tsJ/lBSmXELpnyx6GNa+nWeJYJ7TKt6eg3DX8xWM5CUmTjJ/
 rKI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:36 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7jk24Nyz1RvTp
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:34 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974873; x=1675566874; bh=0y06Eloy4qYCTZrO2k
 lxBInbenlq8L6lxdT3Guv1tac=; b=ctgKui3hfmF+6RE7L2R+pUcUjtwtItH5PR
 S+tInav90jEf5Rea8IY8zHWdCp94rP2++dsPSuzRhuA9BQ6SY5WVmIxWkew74dzB
 xKU7wGwhalgss3PVRIMPP5Xe0U17y3nE9ot4vGXy695jTAvrnuSC3eBiEylF+NRN
 4rVRsdiU/mMKaVeg/EnwyZQg5DGMaumSeTctchS0uCgyYiFTgn+1uEIXeJCp4Wu4
 tBk4dPKWMyAlWV+9GV7wGs1QrKb7/Zy0ZjW1FBwwbXOt2ar3SLe9cpzN6KZm6L2e
 0KJ70ZX/QEEkrmB8XJFuGOCSGhLicxWqxRtV5hhkpgswvAjQiAZA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id k5FO-j2RYBdB for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:33 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7jh58Gwz1RvLy;
 Thu,  5 Jan 2023 19:14:32 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Jim Shu <jim.shu@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 17/43] target/riscv: support cache-related PMU events in
 virtual mode
Date: Fri,  6 Jan 2023 13:13:31 +1000
Message-Id: <20230106031357.777790-18-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
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
2.39.0


