Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99851437876
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:56:46 +0200 (CEST)
Received: from localhost ([::1]:33130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdv2L-000580-OK
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdumO-0001XW-VW
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:40:17 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdumL-0001MX-3e
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634910012; x=1666446012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dat5VN+pElCksEeUs1CTWymeVP0zYztbyu2XnGjIbS0=;
 b=fr5iIOpS9ARVImtTt0L8/T4QgMPImPDjvCm47MzgHabsKWAWF7FASV6f
 5LU9kEKQ0gQr0+QHbPQ/ilg1Y7QPazLFPpCD37/XHxeOfhbwSBobh3CxH
 eoiwd0AJ9JyK63E7YYPvKlsJEj6SWw/vEU6C+yZUnxisTP/iVmkWPhqg9
 pZXeHJsG5h5+HZC97MX6xS52qmrZQBv3IzVZkhbkMCtD3l+nazaIo2XeO
 uhCXAi3LlHa0fE1dE3ecBOOvk+y2HSq3DnAYX2NcK5yNa4Mn7jYrt1wRf
 vpQsJ34fRIdlJmEZo/gKrTk6sMPJrTG0X9z7Swie9ieEZFeuSH7D4RjBi w==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="287492731"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:40:11 +0800
IronPort-SDR: m7PKwFUp4iNpprab/3SWxtSfJDjQGOBbqivyhfrWPNLv5RyetImd6KGLDofZmZNGnyCS4OAXyF
 MbdaZcLbiGp9NMRAKX1QrMK7O1RK6cMZjn5Ut7X7sxdr+M51bn5o6nHOkm76e1+7FmudDh7DJ7
 KgyaU6Pdp2A4B3NEprSvz3oTD/ygIH7SDgoauvmNesZdRq7qBGhoI4Rred9BZa8Ss7XhsPSHOi
 ddOxu3CEm9sTEnd8VE2SCsYQf0397Z83THngpGn/T5N2leHjPSQWwoRUX3eev3J1MwYfTaKt4W
 XqOIBBOtCWBNsOV/VsNZ0SHt
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:14:13 -0700
IronPort-SDR: GzpR1HUxCNZV8isPYP5igRk2VdbBeL7bsVwodUxXLlgjRpbGmQDHTuxwiCVp5aiC+s3BodDbzb
 xO4OleDnO0r/JOyqF5c3LMTnGH/QbtjB1CNDL7SYr5smWt593D/3722akXxgXeNjpZH/WlkL2b
 7QQ4UqvcCIKtqKBDurjiPtc12cAvNnB0ryD5Q7tqUqo3/ibU70AtEdlxrCvUoISNf98vc74dq0
 8Q2MKUwE6aLzPRTExFyn6mQpEpuPZTLZG7TS4mCxzjFBYD+/e5DRcI4k6+WHzgau6ZWL3wUQxr
 jRY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:40:12 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQT74SdWz1RtVm
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:40:11 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634910011; x=1637502012; bh=dat5VN+pElCksEeUs1
 CTWymeVP0zYztbyu2XnGjIbS0=; b=AESo0g2BBV2DDmSIv/7YYKd83+gGAqjr4s
 SxY9YFPcmvguup6frERSR8IbzbyIb3t652vAgVv4tMXxHCwt8S0C8tkMSefOnRAI
 qDdegoVfjH/fwk6NmOkPJFwhbYNV/sWcmWu8WmA6Pvnu5vTO22ENLHW3G0+EWU7a
 o1f/PbBsu3LyBMqohvMI2HbRsuZBCX8R8nbgwibqrbWWzQISfBpUHuzTzJxI/fBP
 5THX4GokeI5L31JY4FJyVvTUr1ebvJ4hirEL8TV4WIRSgN+iP5pJjilsVARcDjln
 qQw7kxRpGLUmaqSlroFRKMhorGtPQoZxEXcCzAmpneW/oy84qVAg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id gKKzoLuQi4gL for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:40:11 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQT30WjDz1RtVl;
 Fri, 22 Oct 2021 06:40:06 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: [PULL 18/33] target/riscv: Adjust trans_rev8_32 for riscv64
Date: Fri, 22 Oct 2021 23:37:57 +1000
Message-Id: <20211022133812.3972903-19-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
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

From: Richard Henderson <richard.henderson@linaro.org>

When target_long is 64-bit, we still want a 32-bit bswap for rev8.
Since this opcode is specific to RV32, we need not conditionalize.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211020031709.359469-12-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index 9ef8ab94ad..d6f9e9fc83 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -232,11 +232,16 @@ static bool trans_rol(DisasContext *ctx, arg_rol *a=
)
     return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl);
 }
=20
+static void gen_rev8_32(TCGv ret, TCGv src1)
+{
+    tcg_gen_bswap32_tl(ret, src1, TCG_BSWAP_OS);
+}
+
 static bool trans_rev8_32(DisasContext *ctx, arg_rev8_32 *a)
 {
     REQUIRE_32BIT(ctx);
     REQUIRE_ZBB(ctx);
-    return gen_unary(ctx, a, EXT_NONE, tcg_gen_bswap_tl);
+    return gen_unary(ctx, a, EXT_NONE, gen_rev8_32);
 }
=20
 static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
--=20
2.31.1


