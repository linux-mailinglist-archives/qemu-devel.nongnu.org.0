Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB35947A439
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:15:00 +0100 (CET)
Received: from localhost ([::1]:52142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzB0l-0007wr-Qu
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:14:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkn-0000BX-Ve
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:30 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:7934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAkg-00086b-LX
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:58:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976303; x=1671512303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O/6+Omk92hGEkgiA22zsmobV6r0Wqpi4OSAOxArHL3I=;
 b=XZw0ALTKM/nogWA6z3KF7eEHR8oZSahM4ggUfcC7ZeU6uY1bmuedgsoS
 4/YnHm6f6gaBc/+6xRX9cljEVdB8Z3iqt+1WSOiDbho49TmqdMJjYtUZD
 3/2FL9VEl3U6ft8auORgwDrkXwO1EHGiCxFGgLDCiS3pEB7zMJaPEExLw
 +oM/Nq7O3BgqTe5TbaDklkHeYl0DBt5pgYA+mrsb2oainY+QoSXi0oJA5
 K4xWScGO9iHVWb1agc7t2vz37tQOH4Cm9vIETesr5Lco1iqYmHR+zZxdY
 D+25MVvbkOxt7HL0cIIPLvMaJvxYaDePAyMGAsI7dJMUdxr5JDbWMdPBc g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="187626131"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:58:18 +0800
IronPort-SDR: bQ/G3/H6Tshir+mE1WrY5dovxxNINSOnDSkvfncQNHD3qVjZ7ZGdfYWLpoy63GD+ymnd8tW6h3
 Isy0dl8yVRhYC5hkBLeeHQTb+KJyH644vmawlFsr45isHxsHG0Zkwh8uGlgFPPf7WbqaW4RTHY
 SqtyCAfFM51reHXHlha1YkYR4i26SgYOfMzhkfGgXuR7NzILiwzAIxbXPZz3JXPRuhHIwOK2p+
 gzb5CkSMC+As9JPVBUumRQBeoZRsnb7x677JRyFpEj6pOWlokczjlpONAPVhWVzbqkB5Tznv7t
 D6FVsyEdfaWIqaAHSEicyyns
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:32:34 -0800
IronPort-SDR: ZPoLqpVDRPz4Nn6m5Z71CiNKBICOmue7sZOu9kHa1pMlrxaJ79Ux3KIIRlniE+8H7jRd9NAxpH
 DwZF08sdu6bBXS6+rrMbJIFGxV7oPWoJ6VQ13SH1/k4sDPEUfR32YW8P4l5hAIqC5ZzgSfeCPR
 EpJf2l8M8iWs874T+C+teARSrFyye3vrXhPjaDbT1A6BKZwDJqjOe/6reEWOVB3iIb6p7y0KVe
 cJ762EFD5gA5QRWamIJHUDapf8bYdGwIolQHRrBFLzbNKu0whRmoxWj9VbJAlD+AhnBdyvb/MR
 0a8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:58:18 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS5j2ckJz1RvTh
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:58:17 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976297; x=1642568298; bh=O/6+Omk92hGEkgiA22
 zsmobV6r0Wqpi4OSAOxArHL3I=; b=mFbCy/5p7v0WZAppni5oEB3PUbdVPxPzYp
 4NIldVV346u5Vdu5xpSoELVb4qWAyDJ/z/g6CbXDELzAyu3L9CaRrt3iUc6aSAAH
 2OCfn1tfzfocpBcRregURVABjF2zLCR+JuM25yY1wj7OGDxz0ocyMoB3fciCPoFi
 uEv0Sq1vcgfGasrnVlgEkd1CAjFvZkx+vi0hWSdzqkqCiscqGUh9Z6m7+7mxdAPn
 kGNMJ+KojNFc+HhPg0oIuP7j3d2VAGK9vu8CjA0h153y2TZ91N55DJalbDWatqzn
 n1mcDab/6rKgLmp9+32fZwVBIghYUq86s5M4ENs9t9qKWUMbxwYw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id PylgQTyHrzcR for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:58:17 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS5d5BRPz1RtVG;
 Sun, 19 Dec 2021 20:58:13 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 14/88] target/riscv: rvv-1.0: introduce writable misa.v field
Date: Mon, 20 Dec 2021 14:55:51 +1000
Message-Id: <20211220045705.62174-15-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Implementations may have a writable misa.v field. Analogous to the way
in which the floating-point unit is handled, the mstatus.vs field may
exist even if misa.v is clear.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-7-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 83f4dbd824..bc149add6c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -643,7 +643,7 @@ static RISCVException write_misa(CPURISCVState *env, =
int csrno,
     val &=3D env->misa_ext_mask;
=20
     /* Mask extensions that are not supported by QEMU */
-    val &=3D (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    val &=3D (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV)=
;
=20
     /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
     if ((val & RVD) && !(val & RVF)) {
--=20
2.31.1


