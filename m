Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF24E6538E8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:43:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87mo-0000j5-Us; Wed, 21 Dec 2022 17:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mm-0000gc-Dx
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:42:04 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mk-0000Xf-1a
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662521; x=1703198521;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CAdCSxJeKKq8tYmIBqs3LqQExUqaPNsJrRGHQLOgr7o=;
 b=fANgUzOGw/oJm+gPx/y5MhqgsXFy08HFl76Af+ef6t8y9uafeuRYK9Af
 cIMk9PKEgu/JOy9xQhmuQ/XiNAO51+7Y9ptd5w9hZ6z6vHdCjWMR3YN6t
 2YLWDbbZGCfQvNl0Tz+cqYmbxj0kNY1fZRfHXTE47UfZDrgHKbl/zvTLL
 yA60nCnyw23giXt77qNClkazzDrpnh9FrzPrBuDPT48b0b8baq1cyV0Ae
 czlR6eeYH37QS5VVnt1ORjjPuvlitpL4TvueFppwWZ5/S6gDqn4R/1kjo
 KAl+xKOh4o7Kw4LZGexsqMhz5E3U0YGawuJBWZE+xA0EU8zF2+njlAW+P w==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561381"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:21 +0800
IronPort-SDR: lDAIjVTCULF00aUWE7eQopV2DmSqpvFml6knrYYIuG0HiV7zBIxOBytzwuzB+rBZxgxQEimtsz
 5qraN9hOAi9wh1kRMHcnGfnFWfhmdLWhlW7GA5UKKmJ1c2djM6id3yhl0D809BzIuMZhivASuT
 F/be9kxxQpDMOvs9Bi/M7yIS8tLId31RHqFCfaQrYgusQNTyH4dHosgCKMhPAa4hybwh7qqgEt
 R48x/GQUMtrmJIlK+Q8f/lRXygM7cHIvv4JZWjHul3EImGkJucHZkkfzAoNaBQ1xqb7Y/4H57k
 5P4=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:50 -0800
IronPort-SDR: t0HO1NjFXcnc2UazOqYLpYy4ZZMWuN3wPsUXnplDU1WTYNMgt762Ui4rvwE4kO7fLs103Bhiiz
 iBlEp4jcC0oonMP8iu4H/LcDzakCpssZlonQGekDSlxa0BB7WtAOYM+lDH0IOOkavqVRE0jh5I
 oPHPsx14hXFyGF32vs9xW1G24+g8Ax2iNOg2dDkM9DHfDpAO9eizAZmeeeqjaFqhT2NBUlGkuY
 zpo7cPZ2rv5J9j2zt/NBA/mKdBjDJHAte+SBTbiniXnRlD69Xa4dZILYaKRhQlNKWUeSvWrk1N
 chE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:21 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpMP1w9Wz1RvTp
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:21 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662480; x=1674254481; bh=CAdCSxJeKKq8tYmIBq
 s3LqQExUqaPNsJrRGHQLOgr7o=; b=NQtsQxIItQ4r2o9k8ZGqdjg+YnoFoIf+qu
 2CDm2Q9+EVAYAHY7y0nriII6U5KXFPB2jnJjBt0G15k9hxvuXcAZUqWUV39BeGmf
 1Rp8Adcj5lcC8F2zwzBaQp5li3noL/2YStyUN6eYEbGO85PwiS57sv2luB6FwHBi
 lRMpvPVK6R4cw6qLqHRrmT8x9TYj+NE9VolqieHGQKl/Kdbx0+YGYYH6veS6hv3q
 97RjfaGaBDyy7wwATnv0bcY1x2LT7NGb3WQ/9Q0GoL0IoIsa4nkM0K6R2IyppCz7
 Ic+PtdHfW7eV04UP2Ck3mR4Q8LFy3xm8NyWrTij9bNNymeuC2j+A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2rBFbCqcJm5C for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:20 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpML5t2qz1RvLy;
 Wed, 21 Dec 2022 14:41:18 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 25/45] target/riscv: Fix mret exception cause when no pmp
 rule is configured
Date: Thu, 22 Dec 2022 08:40:02 +1000
Message-Id: <20221221224022.425831-26-alistair.francis@opensource.wdc.com>
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

The priv spec v1.12 says:

  If no PMP entry matches an M-mode access, the access succeeds. If
  no PMP entry matches an S-mode or U-mode access, but at least one
  PMP entry is implemented, the access fails. Failed accesses generate
  an instruction, load, or store access-fault exception.

At present the exception cause is set to 'illegal instruction' but
should have been 'instruction access fault'.

Fixes: d102f19a2085 ("target/riscv/pmp: Raise exception if no PMP entry i=
s configured")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221205065303.204095-1-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/op_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 09f1f5185d..d7af7f056b 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -202,7 +202,7 @@ target_ulong helper_mret(CPURISCVState *env)
=20
     if (riscv_feature(env, RISCV_FEATURE_PMP) &&
         !pmp_get_num_rules(env) && (prev_priv !=3D PRV_M)) {
-        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
+        riscv_raise_exception(env, RISCV_EXCP_INST_ACCESS_FAULT, GETPC()=
);
     }
=20
     target_ulong prev_virt =3D get_field(env->mstatus, MSTATUS_MPV);
--=20
2.38.1


