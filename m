Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F73650651
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:21:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75jV-0000Pq-Ef; Sun, 18 Dec 2022 21:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jT-0000LU-7l
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:23 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jR-00017E-IK
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416301; x=1702952301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X5pPuQ/7QbzlG3f/0UBJxpkHOFrd2/Xcw9qJolUpEC0=;
 b=oZ/BohvabFrvBSMLxwHz3784+kFOMQT5/wOX6mq26+E+wDD6+VTFuuKF
 VgQoJystHzN3axI3MhPoKLA0IYgQB3XG0UvD0P/RdB+uXdwA+h/N4XTMi
 Ua1IOCHeoJSgfN/WDrHd8zM4BQLF+52y+NPosMciAuoR3VeDjZ50U8LNg
 Uqs1gw0mYl/WCbRwIEzaO9I/Vtv8ZIvUZfRm2fo6c85bgyISrajUV7lMK
 eUsrWsceGxoyv9bjQSwJJCA4EPCfHWCnPB0JAmE7prQvqR2ZP/JSpzW3J
 qfmadAn0g4/Y44J9dWTka6ypt+JuHpKH+e9h+VdMDDenqbMcp/7Len15r A==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199346"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:17:59 +0800
IronPort-SDR: 8XihbuEPnSa3Hz8u3YYF+fqLuSOjZLu8yo6SgAzytRTx1V4agEwCgrzqQk4KC02zs02hnt5IGM
 gMnbewf6e7Vk453ihHo4HluA3Ja5tCOZep59Hx2nAYUSFTOQ+/dhWfmQyMGr5MSwe+SLQEB9Tw
 3l4p1SF3yI6bdaZPKWs+HB8ZnNc8+11iCCbSKjMbV3SdXhn+P7ymgPlm1ZRHFn0ZGOHLu6Btim
 d+9CxH8MUau7v7MUUh9nUS9LcLq8hz60pZPgZTb2dDhVYxVsUewKYW0GaSTVatlDrsrt6n7rOY
 QJo=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:30:31 -0800
IronPort-SDR: rOWCq+xQgUGdl4Ybgm0R6mPNAtHgNtPhS0LTaBhcpUrWuZfZZaspp7I19AgUiahzUAXhMC9DcH
 oQGNKdAVTUiDVlTMmJN5GgugTZxnyUD8prUdOZZqXaygFtd328C1uBBVBVr4ajDoZFnEH5wUrT
 G1o5wMeLUR4BAqvDl7mcmWmpPwqTYxB7QAb6LaTZUJjEHPY3GLFQjGJNtRk4BlaB2fgzyQCqNr
 GS+svyMCVtd78blOiiTbReYBPUIDhsV4UPpRBWSz3N9upGaA9+e8oZSiRXQcoKtjc3FPTGtUFa
 XFI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:17:59 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3Jk734Hz1Rwt8
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:17:58 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416278; x=1674008279; bh=X5pPuQ/7QbzlG3f/0U
 BJxpkHOFrd2/Xcw9qJolUpEC0=; b=QR7NbzoOptI2jrduYWNRHuD5IFr4SeaVxq
 ezByUXbZtyD/1VQGyVKZGqR5GqzFU7RoTPy5o42MtR6QOsi0mSjM+4Kod9gaTBWM
 nhnSDIozFpHH+DSE9Ge65aHssR5IrRCSlXN+RbtlWxzFUbaPmwKVV4A3m/xyeKJH
 v7czCgctZJ1j0UlWA2Xly1cB6cI3f/0Xn0pIII8YfEKdNtVPqFFsvRi0o7k+k6JG
 4UrSVG+1HgwT0rYxvPFjn72yft8R8I6pp7XGrTjEaa5mU3fGXzWzcBsE41JBASPu
 2VbO4Bu0be5x6Q8QxM6rMZth9rfMntdxG6jd+JcPCSXb7qmDS/nw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id RE_ln3QTMSTU for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:17:58 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3Jj1hZjz1RvTp;
 Sun, 18 Dec 2022 18:17:56 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Jim Shu <jim.shu@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 19/45] target/riscv: support cache-related PMU events in
 virtual mode
Date: Mon, 19 Dec 2022 12:16:37 +1000
Message-Id: <20221219021703.20473-20-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
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


