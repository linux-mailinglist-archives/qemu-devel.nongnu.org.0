Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762FF3FD164
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:36:27 +0200 (CEST)
Received: from localhost ([::1]:51690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLG70-0003e8-Fv
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFjj-0007Pu-Ur
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:12:24 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:10421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFji-0000YF-DU
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462342; x=1661998342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D7cKtAsSC5vzXpL6QcdCBJqs+dg9FCiXrFk9rhQcOR0=;
 b=j1e0znPJ3A9lnZoUlkXFfn5bXlaZ4os9dxCxrlglmZNfIlm0FKBeNCgW
 r3k37b9TVoAL27fgG7LlQ3k6dbD/SfkNn0quO+i5/ZMrhAbL6KafGVaSF
 gEFDZr6Ob11c6Cfhn5nu8tqwAoanWRMKYNMTzJArYAUtHs/P6IK+axJi8
 o5pGeEhUUPJ9XfqiuUGtRg2Si80CxWQC+zHxfHwy3aXSK3UI62bN6xYrT
 CsB/rSnQUguyR5VdAMd3eVOMt1lhbuqsBBIzdqi+BuJUgsextpPJrsIYd
 3hiW2o/9BZ267wsSkvgslCorFRO+GcwIv6jnP2yBxnP0amONniP4O48JS g==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178011749"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:12:20 +0800
IronPort-SDR: 5kUQF2AfSRFVEaP7BovSDqrqB9rVfvtdE8ITqe510viFqHbI/ktzB9F8YdUkEGdsbtSszGU6Gg
 25O8q/5OzwUkaIn5ch9S9k5MLWDNt7RkfNZCbS7594Fm8hT5gaSy4hsl2v2uviiCyJ9NhjScKL
 nxc0pIbRKGzOmVyoyS4BEQrFlts9wtJkCc5XC6OcKUXklKxPmVKABi4D4c18vfEi9w3pxKbIOH
 1JUDyr1zVE/YoaeUt4JziLzhsQxCAop1SufPxtFGqNgW8nLntUMHfbZ6VMNd2WP7VQn2PxT7ZM
 zHVPnYajWQFW0c/5f2m/YEIO
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:49:08 -0700
IronPort-SDR: zTn5YFs/W8zx/NRAciHQ+GA2CQ2bzAu1nFqnFva5RMypRdrDojsFoXXuTTUG7ajpu9m9l+apox
 VPHeD0qPf9HNsm8Dt6wkWii5Uvei5rGpK6SsbLIq+4EEM7vwg1YJxfTHu3dgBbdsACrX0/i749
 IfaqXbzq2LxOrIaVA5lsuq6uFf7WYu7rdBQYAWEGaGlKFHBXW9OTC2Up0FxqmJCTq+0YvPujcS
 PkKRY0aNZ6dAV34x+inlsoJxBw7k1dJrGsr2YgUavrUi3F0jCrxlyjTShIzKBbY2owKC3cWA0W
 XyM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:12:20 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Gznd0111Lz1RvmJ
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:12:20 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462334; x=1633054335; bh=D7cKtAsSC5vzXpL6Qc
 dCBJqs+dg9FCiXrFk9rhQcOR0=; b=eqwN/etlUaWi0Lhx9E9/MTMu1E4vojYrjL
 NXQ1Hl3ZiFVJYbHZahkzdQci3hA34FNLVcoW8By8K5BELxDpyGbjvbvq/BDbIcCk
 JUnqBxUcZjEotlNyamHs9DNmN8oXp/cxQ+mGbkuIBMlon0huyHX0DzJpTlo05M6H
 Iw3uluHNbPZWhZpTqzW4SzrImR/gylQ1gXJOyEuqDf9aaHUkkEqvMHdRoB49DMKX
 UeRRwi8TNqG7mRHiCYFN9bVpfHFihoXLKDnOmQzg7weOpyQHGXa1UCBvlnP8nsUo
 +mYX5dSRWb7K5rek9GhOEKtkUwmkkVejkItfy1jVzZA2TkrV0C2A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id j0cjHeyJ6hD9 for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:12:14 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Gzncn5SBCz1Rvl9;
 Tue, 31 Aug 2021 19:12:08 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 22/33] target/riscv: Use extracts for sraiw and srliw
Date: Wed,  1 Sep 2021 12:09:47 +1000
Message-Id: <20210901020958.458454-23-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

These operations can be done in one instruction on some hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210823195529.560295-14-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index e4726e618c..9e8d99be51 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -347,18 +347,28 @@ static bool trans_slliw(DisasContext *ctx, arg_slli=
w *a)
     return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
 }
=20
+static void gen_srliw(TCGv dst, TCGv src, target_long shamt)
+{
+    tcg_gen_extract_tl(dst, src, shamt, 32 - shamt);
+}
+
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
     REQUIRE_64BIT(ctx);
     ctx->w =3D true;
-    return gen_shift_imm_fn(ctx, a, EXT_ZERO, tcg_gen_shri_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_srliw);
+}
+
+static void gen_sraiw(TCGv dst, TCGv src, target_long shamt)
+{
+    tcg_gen_sextract_tl(dst, src, shamt, 32 - shamt);
 }
=20
 static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
     REQUIRE_64BIT(ctx);
     ctx->w =3D true;
-    return gen_shift_imm_fn(ctx, a, EXT_SIGN, tcg_gen_sari_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_sraiw);
 }
=20
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
--=20
2.31.1


