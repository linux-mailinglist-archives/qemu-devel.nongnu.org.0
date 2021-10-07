Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66DD424D96
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 08:58:47 +0200 (CEST)
Received: from localhost ([::1]:34576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNMc-00086N-N7
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 02:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNCd-0002dz-Oa
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:48:27 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:36012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNCb-0002ww-W3
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589305; x=1665125305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oq5STqUMFTm/KaHyE5nsTqZMqG6dIzG9MDoOLPn4Nw4=;
 b=Bq7PJVGW5tNn09byMRgb2JwQWHvwm9JPAMjE2sVc646FTXtBx6EnPTGF
 Worvuh3HMnCJ/VfUOcEpYs8MYFxmMsA2f6M38jQsCN3iEmiUZTGRD/wvH
 mXwBqDWODRQV9P/r6B6av41MjGHQoAMiyBcw+9t6P9Ft/8WIy2nP+vVQ9
 IvJs0xMtMfnl4Az0vv7v7F3VVNQH8sduelXzfpC1mnQc/kpJpxVx/tdH9
 iVjFy3OEvOWv3zVUDBWUPzfHdrM2kvHrW6kEvBXGx+Pf9aQmWBWAHCAOn
 dDQPSPJc5zfhU0ztGozHteDeyb+xUH0fELp8tySpwZVgbGgJyGSj957wr g==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="285950657"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:48:23 +0800
IronPort-SDR: vRLf5U98ZW8L0HY7qwLgtBdhvPOBkx0uTSRoDH7zwBH888rMCUsv8bYEMXM+MX0x+rczc8TV+c
 50PMsXM3OZ5xsjAMc+nviEZIt15gVWS+WTnv+L4hG+yfuNS3vY4RZxXPDYPMs1sHa0PnBG8i7w
 7tYPT+PAyfCebU03WcgFmBHqYH1EbE1S7eH+p+l028RJPbMBqEITp6Dj0bRFmAtxjoQ7GXSkAp
 aX7OnhcI1upVV30cQNk8bxpdH9Ey/PE8WXS9LZ2IepSicUKZfYvd1J9ojRABjwDo1gY4vfdAXO
 sINvUlQ4EiA/MFYjyN4noTR+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:22:45 -0700
IronPort-SDR: FdlZo7D36L7YgLdOoPcmOIxQ8VIGCRR08Cu6NBzieFkQ30z81V5NCXn9q1RxF3gait1VtSAEb7
 8qFgoLTfiorex/5EHwY8n1zj8Uv0JOvRPCWAPfyIDBfZ3QXwJaOZRSMuC2xzpwAdBCXQZebcB5
 o1jARvzL6uqxaelkYKgW3XcZOThOPhR05KTBReL+PxqlICaB1U9y/dh8ob5+YRcImThLUqzTK1
 yPUb7StKOm1HZcamTKEl5mE8GgujTFY1CiIhzCho9X/y7GJeyg7kbY4dM5+IM+uwPcYFEC2c3u
 XUg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:48:24 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ22v3MJpz1Rvll
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:48:23 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1633589303; x=1636181304; bh=oq5STqUMFTm/KaHyE5
 nsTqZMqG6dIzG9MDoOLPn4Nw4=; b=Y8/yR3w5lsihs/Zz4hguqiL9GCEpV7Kn86
 5Kqktam3SJ0Dr4Vw4VWgXwbHU1uCkZ/VLQxCiXqVW3KT/eCklCpUYs+kCSLE6/bl
 oALWiSMw8jZNS6wSzbkmF0DL/8lWHOamJiwqh3Y66EQ+h3HHFbcaiIpcZIECxE/A
 G+YC8KZeoX7pAwwS58IJGO15hDQf4bzr2PKorkL6bJmGZpfFVat6kaSJr5ezlL9H
 l35Qu8TzwwLJSCUnKEgWGMbn61qGHXr8uVCBaKqjelb7jkC0sIdHzBWvYHWjd6A8
 ojhhCw+9xVnNa+hFbG3UfTDzXmBujEqV9/sbnc3vgNUzXUzyks5w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id BRG3oqcnmg4R for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:48:23 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ22p5Xv7z1RvTg;
 Wed,  6 Oct 2021 23:48:18 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 03/26] target/riscv: clwz must ignore high bits (use shift-left
 & changed logic)
Date: Thu,  7 Oct 2021 16:47:28 +1000
Message-Id: <20211007064751.608580-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
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

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

Assume clzw being executed on a register that is not sign-extended, such
as for the following sequence that uses (1ULL << 63) | 392 as the operand
to clzw:
	bseti	a2, zero, 63
	addi	a2, a2, 392
	clzw    a3, a2
The correct result of clzw would be 23, but the current implementation
returns -32 (as it performs a 64bit clz, which results in 0 leading zero
bits, and then subtracts 32).

Fix this by changing the implementation to:
 1. shift the original register up by 32
 2. performs a target-length (64bit) clz
 3. return 32 if no bits are set

Marking this instruction as 'w-form' (i.e., setting ctx->w) would not
correctly model the behaviour, as the instruction should not perform
a zero-extensions on the input (after all, it is not a .uw instruction)
and the result is always in the range 0..32 (so neither a sign-extension
nor a zero-extension on the result will ever be needed).  Consequently,
we do not set ctx->w and mark the instruction as EXT_NONE.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
Message-id: 20210911140016.834071-4-philipp.tomsich@vrull.eu
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index 6c85c89f6d..73d1e45026 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -349,15 +349,17 @@ GEN_TRANS_SHADD(3)
=20
 static void gen_clzw(TCGv ret, TCGv arg1)
 {
-    tcg_gen_clzi_tl(ret, arg1, 64);
-    tcg_gen_subi_tl(ret, ret, 32);
+    TCGv t =3D tcg_temp_new();
+    tcg_gen_shli_tl(t, arg1, 32);
+    tcg_gen_clzi_tl(ret, t, 32);
+    tcg_temp_free(t);
 }
=20
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
     REQUIRE_EXT(ctx, RVB);
-    return gen_unary(ctx, a, EXT_ZERO, gen_clzw);
+    return gen_unary(ctx, a, EXT_NONE, gen_clzw);
 }
=20
 static void gen_ctzw(TCGv ret, TCGv arg1)
--=20
2.31.1


