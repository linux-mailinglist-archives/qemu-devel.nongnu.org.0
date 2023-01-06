Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FB765FA28
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:27:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdCf-0001xy-Rw; Thu, 05 Jan 2023 22:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCe-0001wu-9v
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:32 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCc-0008VI-Gi
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974930; x=1704510930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rL6AwTAvWzO+VfVXQ0hUsGB9eO50MD6CzaOEvS/RPEM=;
 b=UDZC6euAZDmHS4BlJ8y4Hbd/mVf8AminETmSo7Hva/9SWvXkiwpOuRgt
 kBi3S+sgf1avcqFSwrkWh1PstiREmeejk1MZzDWQwnXBydsfNR86UWtdK
 h8oAr+qc9FGtoip3Qk0VDMTpxNPfkGJNJ1HYsY9SRt+ELkz2dWJwIh45Z
 fjhdkT0wlxB4kuNn7SFXZrJC8eaXJZMyl5GeG/6sGU2hBoPQu7WperIz3
 BYf1L0sy9EW8YdQc1Yjup3a4JGf1mSmr53wrsThVIvKa2ODZ8fjpO6l6A
 MS+TFNXRaMuqkNxuRf//drEZji0VbjiWPj+tXNA1iGemZz34ixN7OyJhB g==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254803"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:44 +0800
IronPort-SDR: CDUFxp1PTuZUyQ7k7J+JrVJaAQ5HvSNBFu/jr8v/rxFrR1CMn4jsRZBoJFx/8/1shITRDYuLHa
 bArNwueSNRItvrUmRI0NoAZKWALdPSX3fLzWMxWcPvrcuyRfAlwlP8QTVrlBZcKfyDU/UZniTU
 b4g8TsP0TyR01muXPSOvcwaPx/GT/j3gfq1jdQdSC/sahHi82TOQZxSlRXppvCjW30PGZrj/ZI
 hPEVOe912lCky+EnYNP07+v8Ar/Mkn6dC6HEndM1RV1Kcpkh75lyI5GpVnvVO5J6GLIec99Nzf
 Gzs=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:55 -0800
IronPort-SDR: dtN7bSIeCKWeZeZRdj+w4601oFv21AjeAeqaRV3cRlYMy1kt50Rx1L55+HOQ5I643H0YP3NJsu
 PAFij+2mbFAqKLA6e8asgr5BaCRIu1PtZyjb+hQl5kcyc8ZipSjdm6IqsyWVVtbPgCfglFPy5K
 CBhstQfFIyfmTpMgEMER52PRnhJo4s62DA2rFOQZX3g33OrAfzp8RK75JzbEpyGev62gxobua2
 tvXn9/u++NAJZqv9Z4mA2BhiI2EaoaZ8EBPmQfQvpcI/djiadbOLYRMpXJte0FptR+sMflfR9P
 0ng=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:46 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7jw4v2Gz1RwqL
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:44 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974884; x=1675566885; bh=rL6AwTAvWzO+VfVXQ0
 hUsGB9eO50MD6CzaOEvS/RPEM=; b=JHWOKT8hsk1bUfwc+foKRk16apGa4GVHL2
 fJp2aRb8XUu0haPj1W3Jmv4hi9ugKMNUbl/UKwuPCrHKUgtjbIG2nLahvgy6Cvz9
 XsAiOScw//MZICUsbppmVGYjGKGb+2iP5PVIqbv93iOeCZ3JL8ojsrXXB8dmMI6W
 +GpVeZVXANRrEm1T31c3i1+gt1/55HRD9F6Ogs9CZ2n8w+ffYy9PIs3kcGXK92vU
 0+SMmK3CKHcxxHMXVTE4lfuVnjM6jTKtnLgdp0bWaftXuy15QBxNTeB4WDMQapv8
 VU2s9Xsx/FNCxerDfGMG7QgVXeD6ErMF6vhInVDcU8dS9BHbWJpw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id DyZ-iJy9CMHL for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:44 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7jt6yWsz1RvLy;
 Thu,  5 Jan 2023 19:14:42 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 23/43] target/riscv: Fix mret exception cause when no pmp
 rule is configured
Date: Fri,  6 Jan 2023 13:13:37 +1000
Message-Id: <20230106031357.777790-24-alistair.francis@opensource.wdc.com>
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
2.39.0


