Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6C056436D
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:21:02 +0200 (CEST)
Received: from localhost ([::1]:36316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nMD-0004vw-EP
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEJ-0007uY-6j
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:12:51 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEC-0001pG-Nz
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:12:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656807164; x=1688343164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=313dBeAD/+njONzvGGqB/x71wYKkT7Nvi+L1/eUJaqk=;
 b=RnyD9N/VJQMonnAOi5tiMYM19Z/Sqaq60uq1rHvub/+DrdEc9OQekUJz
 ZLZht3XFrBc8mGSCyqYKLpiAsODm3H7hw6Vv46yljwq2T5fEwo3OOnsGj
 7O5BrkOQwMBHU2hl2AwSYtBthsLDNkZXd79CTyvWsHMlHq5Q/FmmzjgZ5
 jfqN7xz7VYb3FZOn/ka0elL8wMmpCntSarCmEz7cuj/gjdVJb6CYzyqNc
 6pCI71U9A84jSi2fFXJoGuUyjSJqVHKxqQmA3eoitZ42ve2OPflfvH/VD
 UDh9lpFeQ8Tw34+4RG3IM7qJ1KJ4T909rmP9l8Sl223xHv5lkZEfvQh2b w==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="204667214"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:12:42 +0800
IronPort-SDR: UmC7nf6Q5Wa8YHwIA+AD9xs/fyH9e7ZEwC8UHwrzPOYhsmE+cU0V2PHPpVYJJAQvq4FgSYU6/T
 +hC9uSBzcRn2F8IqgRWHFF/6U0AYWaF6l1oFySP6JRgD8ff16ikRSEndEUfUX1OhN8N98H+bhb
 o0qcJOoXuzTh/hML8gmNraqDJkY92cq7MychZX5GijeRMviZyhRkpQQrLJDFH/ZzqKhdpEfA5e
 Cnoa2cbQBGm8jh/hzvroQ1GAmEyQAG/Zrr/sZDlKT3D0jpPHwl4NLrfGp+HYkXdEA/3c6az2mG
 wd3suvAFW+iZ6Ycg+EBP7A5V
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:30:04 -0700
IronPort-SDR: d4oUsDFhkoqw3mPKEyTWMdA36N+RBNAVifOuTaWC3qz89J6dWIbQ5JRPr0e1zNmWV18dRaQDQU
 y1INpSVzu7KRmaRS00dhqlH+1uFI4YY9ORNu6MeczF4lt+BdLiKk1EHwpgLYZu010g3Xx9T1Jb
 J7OLpH6XzklyFgE7ZJ+8WOn4gq9QVbl3o/aIuqMnuC39Msg1F5F/RrSARavhINgDEIpy7EbXZo
 IjECtLBfJiilJ/44EkpwcHLUWcnjtbiZSdxjsc7FOGSQ/ACWv+1+82g7fkiJo/DUz8CnQ33u0l
 rsY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:12:42 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8XB2dlCz1RtVk
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:12:42 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1656807162; x=1659399163; bh=313dBeA
 D/+njONzvGGqB/x71wYKkT7Nvi+L1/eUJaqk=; b=ebyoAjBog8TmC3yy2rbuFU1
 FgWe+8Ix4GhhK4Rvsur+T/UbzNBVjdyADWHpE+PEe/fnBAMD9G50OUp84ohD7m4g
 r9R/6HpzEVRQE8sojFw4Kg4NxjzTeSDpP0GCcee1WQCPVVU7FjTRfttvU8rUk4D4
 xZkk9ZQ7ibSDAGPYGkPKTDwcf9APoUaIKABKCign7pfU2i6T0G6irfypcXqTL4tj
 wo3K/A0LLdvbAbef7zCPXgUoJ/8CVpP51ypv9KrEvxfZNWl9z0ELvOJMyhAA//OK
 rB378FxzExorFsHLGtDxLOeBQZ0ukMT5EiQE0Dh9BaY6kxFqWtUXaRLRFwoDzjw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id UNB4ZV_VgtY9 for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:12:42 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8X83gq7z1Rwnl;
 Sat,  2 Jul 2022 17:12:40 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 01/19] target/riscv: Remove condition guarding register zero
 for auipc and lui
Date: Sun,  3 Jul 2022 10:12:16 +1000
Message-Id: <20220703001234.439716-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
References: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=176813b30=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>

Commit 57c108b8646 introduced gen_set_gpri(), which already contains
a check for if the destination register is 'zero'. The check in auipc
and lui are then redundant. This patch removes those checks.

Signed-off-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220610165517.47517-1-victor.colombo@eldorado.org.br>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index f1342f30f8..c190a59f22 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -32,17 +32,13 @@ static bool trans_c64_illegal(DisasContext *ctx, arg_=
empty *a)
=20
 static bool trans_lui(DisasContext *ctx, arg_lui *a)
 {
-    if (a->rd !=3D 0) {
-        gen_set_gpri(ctx, a->rd, a->imm);
-    }
+    gen_set_gpri(ctx, a->rd, a->imm);
     return true;
 }
=20
 static bool trans_auipc(DisasContext *ctx, arg_auipc *a)
 {
-    if (a->rd !=3D 0) {
-        gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
-    }
+    gen_set_gpri(ctx, a->rd, a->imm + ctx->base.pc_next);
     return true;
 }
=20
--=20
2.36.1


