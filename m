Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86607674E5D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:44:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm1z-0003RX-4R; Fri, 20 Jan 2023 02:41:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1t-00032w-TF
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:42 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1q-0004pk-D2
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200498; x=1705736498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V1q2bPXNx5watuA0eVCbXFLIyzs7v/eKbDfzC1VncD8=;
 b=V+Zgg8wkJK4mWrgWFjCSDIFiwMI/+T0k85eAQR1Vl+ykzJ5vs4ueDG3r
 0wIaNU606L6jUWCUc9LNKMCIt8xAY5skSnh3MUEoBD1YsajDz0lQbu9io
 WZ/OKNSqlyCTw3L0jd3ral8h5MEeqf27u+SQzenFpt8FYhPZvqiLDYs5h
 wYDdYSPBJlFkIIuQ9AyMO0LXI9gzCc6r/S4NMc1HDdmie5khe2hlBVt4r
 LY8e5vlAcQ1Cl+4P+kRKE//HfFEpbTF3oDKDoUOgXI6yC2WjZ6P5QijMI
 +tlC+pNHCyMuUS9R3qzvRhwODfnAi7T+NtBxdjSoSdEw2MpknmnVfZfaY A==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176774"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:40:35 +0800
IronPort-SDR: roJn0FhaqZ2SKFjvJ3cW/4M7iM9oRhNXeZtbmAo7hmGjkOq+KLejyGHenaMFQdUOorfrFci20T
 A0S4bsCUyH2sNMFM23HTxnolNmCGRhDkm5JkXu9GDdqj6UHbJ1bNvLXzo/xSd1wCsV7hEOOulP
 KMyn3jQ4cMcynW6GbhTdTNcxILUVCG4ck1iFSCgIt1zzyaelb9TVQqD/jZZxkLJgHkK336JT51
 ludiYAQ2eUhJ5bhdo8BviXcG5oYp99AKxSUH5ajB4bJoJ8k223tX+Dwg8tV0AtXFPeiw2udL6q
 zp0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:58:13 -0800
IronPort-SDR: yVDCo1Y9NfM2CTfFzdclPbFZR/YkmuYElWP+Q82ZkV6ihLEl6kQ8lY8duauV1HxrvwLl89RtBz
 qZurbk/7u9LS8AOplGvde8UQsiveSk4U+zuxTirSQJb8rOrJZ4OuI9BjCWlpjG+wJ/nHVsUA4n
 G1tZzo6M2c3Pg7A9KHv0OqUyZWMtMKQbO+bXGnpU8wvMtiyRBmWJ0VcpEklOXhq2gFqcbS3PB4
 7FZcjSsI1ZPtvhCux2XavJmoxcQqBPcHPch4BolQUBWqfk5DMnWYW1q2BO9HbbcduY/iPbGgcS
 Y90=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:40:35 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NyryC2xVHz1RvTr
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:40:35 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200434; x=1676792435; bh=V1q2bPXNx5watuA0eV
 CbXFLIyzs7v/eKbDfzC1VncD8=; b=Ox2/4sAlLf3p1rUZCrP06r2Cy+sZcPzeLz
 ziF9aufQHza4aVuXvs2vvq/5Jrd6bGpHUVnTafPhGBWm5E8hAAG/JakYneDJC3gG
 l9q6N1axDl+pyZ3ty9706dvX4a33TxBwYWYnTZP10Kq+QU6b4yXQHUxOh3zFDSa5
 c745FZ4P39Z6QRKNtelIpOSwQrZk1iVd8y5OVfN2vsP68tvesAAVdZ1tsOKQ2dtl
 uHNAiyHf/YHJKxRnjmuXvdWA49uxtFmT3ItShkiFKSQSiGP51yh+3Cq1cW0Rrflb
 qzftt1yAb/cTpvnIgNE44aAVZho2FKzZTGyOiNHpIvPu9Z4NUK/g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id WUwlz7TzvutL for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:40:34 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyry94Jmkz1RvLy;
 Thu, 19 Jan 2023 23:40:33 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 36/37] target/riscv: Remove helper_set_rod_rounding_mode
Date: Fri, 20 Jan 2023 17:39:12 +1000
Message-Id: <20230120073913.1028407-37-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=37747d9ec=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

From: Richard Henderson <richard.henderson@linaro.org>

The only setting of RISCV_FRM_ROD is from the vector unit,
and now handled by helper_set_rounding_mode_chkfrm.
This helper is now unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230115160657.3169274-3-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h     | 1 -
 target/riscv/fpu_helper.c | 5 -----
 target/riscv/translate.c  | 4 ----
 3 files changed, 10 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 9792ab5086..58a30f03d6 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -4,7 +4,6 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
 /* Floating Point - rounding mode */
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
 DEF_HELPER_FLAGS_2(set_rounding_mode_chkfrm, TCG_CALL_NO_WG, void, env, =
i32)
-DEF_HELPER_FLAGS_1(set_rod_rounding_mode, TCG_CALL_NO_WG, void, env)
=20
 /* Floating Point - fused */
 DEF_HELPER_FLAGS_4(fmadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 96817df8ef..449d236df6 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -118,11 +118,6 @@ void helper_set_rounding_mode_chkfrm(CPURISCVState *=
env, uint32_t rm)
     set_float_rounding_mode(softrm, &env->fp_status);
 }
=20
-void helper_set_rod_rounding_mode(CPURISCVState *env)
-{
-    set_float_rounding_mode(float_round_to_odd, &env->fp_status);
-}
-
 static uint64_t do_fmadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs=
2,
                            uint64_t rs3, int flags)
 {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 493c3815e1..01cc30a365 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -672,10 +672,6 @@ static void gen_set_rm(DisasContext *ctx, int rm)
     }
     ctx->frm =3D rm;
=20
-    if (rm =3D=3D RISCV_FRM_ROD) {
-        gen_helper_set_rod_rounding_mode(cpu_env);
-        return;
-    }
     if (rm =3D=3D RISCV_FRM_DYN) {
         /* The helper will return only if frm valid. */
         ctx->frm_valid =3D true;
--=20
2.39.0


