Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ED043784B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:46:57 +0200 (CEST)
Received: from localhost ([::1]:35858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdusq-0004mS-4e
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdulF-0007z1-QQ
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:05 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:60325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdulD-0000vk-Fv
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634909944; x=1666445944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XYdaywEPe4fL/1Ff2mytu134Il7CC9k0MP9aLw/zd2o=;
 b=qY/8H5NLRqbHLoj1N5dtVGpDccTAOUpuUkpH+SeeoAbA6P5rt3Cp0bGe
 XhX6fRmKYcrX+Z571RLJx/cdRUozC1C5Y4q3dv3SmmDf5862Ku8hSEJw2
 IswRlO60oWmqUlmSSHvG/X4TFzPNeehc7TZM+vCJHURGI3+8MwraSUFMX
 R3lV1my4UHYiazUARtLB2r0swSmw5cNpXn9/d7y3r05H05Rea8pT7Rf6W
 m7ZmA63asS2d87enrdnt004qRCchWVXZVD6kI0LniepalZkudv2WHHCJL
 VhjKFWVmQ+meRTPm+ZB1ZfwsCS57TAaHAiQrAv3ceUdKnLG8ff2Fjj7Li w==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="184556253"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:39:03 +0800
IronPort-SDR: TTHHlUzXaHD6SPsbkdpm5KrC/wkprUOB21pqQ5++YEPR/xTAi+WWH9ny25kM3AxIV3Mat5FMKW
 YNx0v75Hf59euIvJAy7EYd7XbPQVMrbYHxhzjNvLt0L9mSy01JyCAIvQ6mTamWrCm42vRZp86F
 aEinAxH2P+IUzQ6+4qj5hzZkl4kgL2K1szsXIvWzniAnT6fhbB1OuK/0I0aNKGyBrutQyBzwA8
 QNmAhYJgxhaCKeEdD7K3X53E69BeSrdVnTGhIklyqTYl2EeHiqlzRV4JvIQM+wC9ekJN6T6g0P
 3UUp2YMrImlgFeF2EMgPedi0
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:14:37 -0700
IronPort-SDR: 9PYm1anEc05j3XtIJqZ0WuqIe20Gqv89BEX5snedAAPzJYZSZKP1BgaHd1jUz+DAd76+DhbA0t
 Zn48JqJQ2hecuVfZcGfmEfLxNXmAnynkMrzTRYNMKVQnff8MdJ9BIFNZtuLjp/AM5yFBDKVkdK
 QZ/K9fy27b/D3hYZ6P7YVNVwlSIJ1X6XbqqwAZ+doDqoyqyGbOx8hsQht2viw6fPVt26RMvArD
 gSk+pSIzAnpgmKiQtrUuhinixpqjEUrF/xbqqw1hKPzPUwdFyoiBeI0IqLmoTHADW69NGuJ+Yt
 S9A=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:39:02 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQRn73kWz1RtVm
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:39:01 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634909941; x=1637501942; bh=XYdaywEPe4fL/1Ff2m
 ytu134Il7CC9k0MP9aLw/zd2o=; b=NJnHSN3sVI2+JVDRGfIvzC5rdpPXZyGHkT
 mUoV/kvlCgLNSTvZ8BT4i4WkqqCiXtdReuov838J8aDc+6gC6uFX2HnBiUZZBS0L
 MBGp43zpWS754MgSZittqiyhRGQjik/1xpTXFsYw67oktVNl2vPbsCrxZzovvJDt
 Mv5DVS2TAxKHQLn5bWPInX19DpAWRE2XUTZaj7esn8LiWmYVWbGw5NqMLyzMW+px
 1v/Zvv4Z7FdgJNWA3hVQgyPg9kzQiyQWvpBORbu5ANux5TiUquRGPnaW4TVFT2gX
 HpQr2MvtUca8Sk4craztML9aGmr1dTCNeCEoJV286w2t8320Oy8Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 64fm03kJE9du for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:39:01 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQRj4YDRz1RtVl;
 Fri, 22 Oct 2021 06:38:57 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 05/33] target/riscv: fix TB_FLAGS bits overlapping bug for
 rvv/rvh
Date: Fri, 22 Oct 2021 23:37:44 +1000
Message-Id: <20211022133812.3972903-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
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

From: Frank Chang <frank.chang@sifive.com>

TB_FLAGS mem_idx bits was extended from 2 bits to 3 bits in
commit: c445593, but other TB_FLAGS bits for rvv and rvh were
not shift as well so these bits may overlap with each other when
rvv is enabled.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211015074627.3957162-2-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h       | 14 +++++++-------
 target/riscv/translate.c |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9e55b2f5b1..ce42c83bda 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -378,7 +378,6 @@ void QEMU_NORETURN riscv_raise_exception(CPURISCVStat=
e *env,
 target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
 void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
=20
-#define TB_FLAGS_MMU_MASK   7
 #define TB_FLAGS_PRIV_MMU_MASK                3
 #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
 #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
@@ -387,13 +386,14 @@ typedef CPURISCVState CPUArchState;
 typedef RISCVCPU ArchCPU;
 #include "exec/cpu-all.h"
=20
-FIELD(TB_FLAGS, VL_EQ_VLMAX, 2, 1)
-FIELD(TB_FLAGS, LMUL, 3, 2)
-FIELD(TB_FLAGS, SEW, 5, 3)
-FIELD(TB_FLAGS, VILL, 8, 1)
+FIELD(TB_FLAGS, MEM_IDX, 0, 3)
+FIELD(TB_FLAGS, VL_EQ_VLMAX, 3, 1)
+FIELD(TB_FLAGS, LMUL, 4, 2)
+FIELD(TB_FLAGS, SEW, 6, 3)
+FIELD(TB_FLAGS, VILL, 9, 1)
 /* Is a Hypervisor instruction load/store allowed? */
-FIELD(TB_FLAGS, HLSX, 9, 1)
-FIELD(TB_FLAGS, MSTATUS_HS_FS, 10, 2)
+FIELD(TB_FLAGS, HLSX, 10, 1)
+FIELD(TB_FLAGS, MSTATUS_HS_FS, 11, 2)
=20
 bool riscv_cpu_is_32bit(CPURISCVState *env);
=20
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6d7fbca1fa..62214e97fa 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -501,7 +501,7 @@ static void riscv_tr_init_disas_context(DisasContextB=
ase *dcbase, CPUState *cs)
     uint32_t tb_flags =3D ctx->base.tb->flags;
=20
     ctx->pc_succ_insn =3D ctx->base.pc_first;
-    ctx->mem_idx =3D tb_flags & TB_FLAGS_MMU_MASK;
+    ctx->mem_idx =3D FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
     ctx->mstatus_fs =3D tb_flags & TB_FLAGS_MSTATUS_FS;
     ctx->priv_ver =3D env->priv_ver;
 #if !defined(CONFIG_USER_ONLY)
--=20
2.31.1


