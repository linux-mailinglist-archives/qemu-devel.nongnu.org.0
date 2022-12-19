Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488A2650655
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:23:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75jt-0001Vm-Cb; Sun, 18 Dec 2022 21:18:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jr-0001TY-Qf
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:47 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jp-00017E-WF
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416325; x=1702952325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CAdCSxJeKKq8tYmIBqs3LqQExUqaPNsJrRGHQLOgr7o=;
 b=fCNiqm+csuNE2iJWrLrSM8bgqIFTNEwpOe4yMa77nKOaVPSZCQ4N9slP
 cnBLG43VRqsolouPviToNFmcnsmc2sDPt4GzKRg6EG8ZWFCnpBL5hyj3k
 T4oovFu5yUDLzTqSXOKoChxEUvXBKkqSXSFOEQvehQunQdwkpy9s3HVV0
 MsGzmYEwqS5Q1usAjXN+WRsJmQy0nr5tDkY2GozxuJchxxA92C6iPP6gJ
 y5yNZEeunxE0AYpQyVpT2unCrPRez+wDWCnvsOMg1a/vLKqc3oZEjxl2I
 rDhTwTMPmYprnqatKa99dxI0bvzlfcOe+ss/pt+eFY14UQHWmcg6pHIFz Q==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199379"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:12 +0800
IronPort-SDR: nJ1nLkowLbEyfzOxZOT6hjC9g/ZtyJkQkj3UShS8XdrrYN9feKI/fuNBxiqykiE/aHfQBIncVO
 S6ej1KrODpGwarpz/hO7QGhuhu7aWEIqQvLgm2IwTLPzSqRlNebFb258HxIbfx7XyuzuYh6ddV
 kFEq+URbxW7Hyul90pFMnFk2EUwv90vwevlpBkWYLXufpf2TR6Pkwij9o2sLB4D/sn2GsPhUVF
 t9QTZ5f2d0wG9S96ddHED8Fo5GznzkWOEe3SJL46viiBSzhPD0nKV0hi6c6h3svsfwuJ+1gA48
 20k=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:30:45 -0800
IronPort-SDR: XiIq7EiJMov6FA6qd8vT1L/pVy9cHjcy7X5DPBMItdPz05ylaoTYWJOvBCR3JCBpM+nzDDTNPM
 Vl5zJQYYfk4zoT0Ri1DGcKGOlDjVjOPpXjWBkNmFTooLkdrdncFniJSCbNStxoJZwdjhBKvNNP
 sGN+cnz/DDFqrcFAhmAVvQnpKaULAv6z4v8mRpCwNjkpyDyyyD0Ih59aMGPLvfFgSCmmDCxW6A
 GJNuJF8bl+sNJdfhH1Kt+McrCddaYBlWwv+gcWAddvaERc5x7APWVsPVrXxRwBIe7dS4eCT9BM
 sNw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:12 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3K02Yb2z1Rwrq
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:12 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416291; x=1674008292; bh=CAdCSxJeKKq8tYmIBq
 s3LqQExUqaPNsJrRGHQLOgr7o=; b=IIK20VZ0h8Oe+E3fJlXgbSTUMeowfOrmTD
 pmGo/0crOdfrSaeQrMLT6lP+x7+0eLbnlXQDQxLdTXugIdpNmNkIpWHEZbc/zWcd
 BsiT0wMnCXx1UkOGK4EvUqOSHWiASgSz2mkEqAL86JnPFSvBVzsmgblzI9yyECtQ
 EB1IINDPC9yaZiQU6Th6K3Y7FS4w1NCz8fkIUS7zOgm2jBFyG5uKQUR9/rKZ688s
 LYxOWDLflTI26ubKSG6vWb9KJ7F/WE0vFuklRM1sLJqv6Lp+4VyLaLjyoUfEUBp0
 B1CfSG13LUJvYP2qQKcq2BdfEWP6JS6ICEInK9S+eomVpP+4l/Bw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 073jZ2Nuh2SW for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:11 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3Jy0WB0z1RvTp;
 Sun, 18 Dec 2022 18:18:09 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 25/45] target/riscv: Fix mret exception cause when no pmp rule
 is configured
Date: Mon, 19 Dec 2022 12:16:43 +1000
Message-Id: <20221219021703.20473-26-alistair.francis@opensource.wdc.com>
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


