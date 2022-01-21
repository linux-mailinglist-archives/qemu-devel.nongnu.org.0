Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67696495AFF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 08:43:40 +0100 (CET)
Received: from localhost ([::1]:46396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAoa9-0002SD-A4
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 02:43:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmzD-0007DB-AL
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:01:28 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmyX-0004KU-1U
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744841; x=1674280841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u+Bp9ae/P3qsRq0gAJWyKt9O86uLA0K1OEuBNZJ6N+I=;
 b=oJeuv0ofKxkO3dxGbvg2Qg25PftRXrSg5wd631As/5K6GobfytFUkDm3
 kbY3dEQ+nZVYFdXO+NhRSfkRAl6bFS/GBzbvQQSKz3WyaV56D0sd2huiN
 LTOALAf5uenDgAn6gqQdrqAkw1uCpHoPNitmWW/0SO27PT086gIYxQqCa
 PpwFvhSEMVwnzP8/DaiLqibNWyOS0zsn/ODYXewiDZeXrrNDJBMxYu/Mm
 LGbnDi3HEPGCuwRXQGiuh2XF0pacU/As37en/+boTy1LQLI3UNrIdSZxy
 uzKm3zUTtV/I+n1zuH1wqpddu5MciR5hWVrvje/79dEOLzFdp2RtnzDF9 A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295082957"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:00:38 +0800
IronPort-SDR: lT6GELsYTNu0Mp3qqVgGkdxh1bA9vuUcs1freJMZlOF38f+V0tQVr+nWZHOGiXlslNrN2hWisH
 OZTAizWcjsWVxDCbs71RFfZSYllTU4eV+4ShSKq13RvebWG2xmgUQyq8XoUCv7g5Qdcd5cI9JL
 KmevEOaxFsD3adK2EMh0GNxQStgQmLxdz+noG/o5jus/oRtzROgk73zPHKyYPg2wz3JYRjDFN7
 ZPpCvgyNx0WQeJAjTWQS+2+3zcT6CFKDzzZn3MB0RrG/pltNM8lietLlczAfCFoqu0tTUFnnT+
 s49boB0bFYYMwV4ZXuPaPAmK
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:34:05 -0800
IronPort-SDR: 7H4zY/Nk59QywU0Mw0IP3qVfFSXSsBV3BxTDvlkurEQrrpsKGtgXTlkKdWHi51wQlKqPGUIhXO
 J7wA8fTkrQP3tGuU769SCgcPcmoF2UlAfcoG1lHxWEWsBC+vZGLvpR8Q7JiNP7GO41JoYNmsHP
 94uj33WtykF8I+WWl30PtmbeIb2fe0yvPzRJ5uZKmjU/EHOJNbSzcGBWSWZRjgY7s1aDqthWay
 RpeqPupHQgnyqd7PGpGWFt4cOR0ZIJW8/eTw0oxnay0qW0hYB0eow8LlWBts4pduQHtjwS0Pcd
 Csg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:00:37 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7ys5DpLz1SVny
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:00:37 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744837; x=1645336838; bh=u+Bp9ae/P3qsRq0gAJ
 WyKt9O86uLA0K1OEuBNZJ6N+I=; b=rU4hVYq7EHMvuB2DURAmOk2aSINLM2fUH/
 vG6yTFqcf7UDWN4qN+okO/p5EnM6mQnTEuG3Lnda3TUGI+vA7JZyRJE597/FYgma
 qwL0jGRcw4D+BzwZys3mZPk7SlGoGeKk56EWQT/lbtKrC+3N8LNUUQeDNz/PfUbD
 3Iv5b1YYCcc9kgGLv6/CJZIQ9kVbrie9bcOk9yqsfJDrrNxhr1fRMXD00/U4OKrV
 5kwGz57O02C/fGpdBWzxbspxhlKGPQtdSMKFaRX8gwlivwpoULzLNehVLy1Zi5cE
 yvCheEFd8vX3UfhJZxMKjtZKWPNp3hb2BjsH+e67mEtxOv9vAJHA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 82Za8dwLqDJG for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:00:37 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7yp3DkTz1RvlN;
 Thu, 20 Jan 2022 22:00:34 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 27/61] target/riscv: rvv-1.0: Add Zve64f support for narrowing
 type-convert insns
Date: Fri, 21 Jan 2022 15:57:56 +1000
Message-Id: <20220121055830.3164408-28-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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

Vector narrowing conversion instructions are provided to and from all
supported integer EEWs for Zve64f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220118014522.13613-10-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 58f12366dd..9fa3862620 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2826,14 +2826,16 @@ static bool opfxv_narrow_check(DisasContext *s, a=
rg_rmr *a)
 {
     return opfv_narrow_check(s, a) &&
            require_rvf(s) &&
-           (s->sew !=3D MO_64);
+           (s->sew !=3D MO_64) &&
+           require_zve64f(s);
 }
=20
 static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
 {
     return opfv_narrow_check(s, a) &&
            require_scale_rvf(s) &&
-           (s->sew !=3D MO_8);
+           (s->sew !=3D MO_8) &&
+           require_scale_zve64f(s);
 }
=20
 #define GEN_OPFV_NARROW_TRANS(NAME, CHECK, HELPER, FRM)            \
@@ -2882,7 +2884,8 @@ static bool opxfv_narrow_check(DisasContext *s, arg=
_rmr *a)
            require_scale_rvf(s) &&
            vext_check_isa_ill(s) &&
            /* OPFV narrowing instructions ignore vs1 check */
-           vext_check_sd(s, a->rd, a->rs2, a->vm);
+           vext_check_sd(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve64f(s);
 }
=20
 #define GEN_OPXFV_NARROW_TRANS(NAME, HELPER, FRM)                  \
--=20
2.31.1


