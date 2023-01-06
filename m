Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA4C65FA20
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:25:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdCw-0002GS-19; Thu, 05 Jan 2023 22:15:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCq-0002DE-8V
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:44 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCo-0008VI-Jw
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974942; x=1704510942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A1Rjo6hcQQpoUkKyDvFv/DQGPdBOKNEFqjk8DUJFka0=;
 b=cgb5O2o9rSXy4z8c7BjibZCMMz5WXV32CUCqqkzomv4f/ETbDlXLsbyi
 Y2XRqoT0E0MbTpI0LS7SdXT4pySKFYFb8oiGeco239IENUlkE2QfkNr3Z
 Ul0kExTvu/BaUUpf7JgviUKuD/lqMxNAA7PtwNUwXpiuiN8bx01XreWgA
 D80i2KRiGo/wFUT+rbbtdDKELtMaXXLfIGcfFE1kQcdxN+/3JvcWMSjor
 AXohnjPvDM0TMqZaf1tlwlbiPzti9MtkNU46baRoJoxjzG9/MwsLQlfC4
 jq12kfcLRnFtYvCmQV/C6JHI244gx+L3VocJ49ahSewd0td+Sye4ZDZKF g==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254810"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:49 +0800
IronPort-SDR: hmzLSDlSK6jsLrgLrJLtlyCVdvP/VJ3n1fjk0IiN2hhOBDzkEjN1Ch/TosSrxE2isSUWN9XA0G
 dcCdY/eEX28NydgtYMfUCg5Wcz6e6dyfHgrzjINm3lFUS0vcgRjp+20Fm9ztxhA9skwDhgDCEh
 QF80W/apyGgRTF0psLqnWllTfP1RR8+1uzOjyzyf33ezGBA49K8wm0v82YAVHrpeYKQAY87s+e
 uP6y+f6/r8qVTBOSFwGMHZJdJ/2VsjiA8XNxZ1EDEt6nA8xYK2RqHElsvS3lNZAFqGc0Y99nk9
 kqE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:27:00 -0800
IronPort-SDR: m5eLAiROO0wSJH2hyuMPsXKrv+SbXYKJHyLHddA6U+w/b/E2/5ARskhvkzX7kBAe2ADs6aGJFI
 bvOmrhivcwlLDyytnHTD6lFeK2XnTOdDGIVuaRJ6CF1XLsuGrpIBnyNjsXM46h0AW6DP3Jz2NQ
 EdXbq71IsnuAJarKmMlwrLb8QZNgJk28CSAUxlJIS9TNEOHnkNgo9fxb0oyD8zjCG55WxhZSD+
 fa/PKq++g7chHRJIpuKBq3cahckOXZ+UsUhepenvpdcAc4bjgqTS6agnStWWQGJvBNZWEPdX/R
 Nsw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:51 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7k15Mg8z1RvTp
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:49 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974889; x=1675566890; bh=A1Rjo6hcQQpoUkKyDv
 Fv/DQGPdBOKNEFqjk8DUJFka0=; b=X8AXxGOZxh+wci3Q7jNQvHhYSMcoF84O1I
 UwU7SyOoiUSaNLLAqLO0xzHPPYY2hMAKyJ9JK0QAytcPA/DEkr0V6Fv7TYGv3QJZ
 MDjJqU4vNx4sLTr2Cm0NaPrrTkhY/xP9bUa3CezZuZV8jDNk4TtEA3ZdQiHRTmi/
 GMdeppK3flSBHNBKCv2GwOtZu16GPNOoUKDp8hSlo/LLQhTMyVxkS2sABN0aJvoe
 wuYZ5HvrJt10SKsZ+5HRm+SBJsGjxdie6XHO8qC4S5jR1cyUf4iXWkvOd0m1n7tM
 grU8rldzm30CntaykD8dITmeX11VobPTsdtC7lmL4hhrx+fHkAYA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id nLcOCz6mFkGL for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:49 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7k020jnz1RvTr;
 Thu,  5 Jan 2023 19:14:48 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 26/43] target/riscv: Clear mstatus.MPRV when leaving M-mode
 for priv spec 1.12+
Date: Fri,  6 Jan 2023 13:13:40 +1000
Message-Id: <20230106031357.777790-27-alistair.francis@opensource.wdc.com>
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

From: Bin Meng <bmeng@tinylab.org>

Since priv spec v1.12, MRET and SRET now clear mstatus.MPRV when
leaving M-mode.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221207090037.281452-2-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/op_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index a047d38152..878bcb03b8 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -154,6 +154,9 @@ target_ulong helper_sret(CPURISCVState *env)
                         get_field(mstatus, MSTATUS_SPIE));
     mstatus =3D set_field(mstatus, MSTATUS_SPIE, 1);
     mstatus =3D set_field(mstatus, MSTATUS_SPP, PRV_U);
+    if (env->priv_ver >=3D PRIV_VERSION_1_12_0) {
+        mstatus =3D set_field(mstatus, MSTATUS_MPRV, 0);
+    }
     env->mstatus =3D mstatus;
=20
     if (riscv_has_ext(env, RVH) && !riscv_cpu_virt_enabled(env)) {
@@ -203,6 +206,9 @@ target_ulong helper_mret(CPURISCVState *env)
     mstatus =3D set_field(mstatus, MSTATUS_MPIE, 1);
     mstatus =3D set_field(mstatus, MSTATUS_MPP, PRV_U);
     mstatus =3D set_field(mstatus, MSTATUS_MPV, 0);
+    if ((env->priv_ver >=3D PRIV_VERSION_1_12_0) && (prev_priv !=3D PRV_=
M)) {
+        mstatus =3D set_field(mstatus, MSTATUS_MPRV, 0);
+    }
     env->mstatus =3D mstatus;
     riscv_cpu_set_mode(env, prev_priv);
=20
--=20
2.39.0


