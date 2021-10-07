Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED92424D74
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 08:55:08 +0200 (CEST)
Received: from localhost ([::1]:54242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNJ5-0002AG-Jh
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 02:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNCU-0002VW-4v
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:48:18 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:36001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNCQ-0002dn-38
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589293; x=1665125293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cOEeNiNBqR+mSzwtM58ML5T6oxTYndhLHLwvNkfjjTQ=;
 b=frll09M8SKGveh7MWRVaY4pSH7jKUmr3r+rl/W/6ueIfqLW7fNvZZWgT
 THD0RTC+8JbXODe4DWDorQv5WdNr8+qLEq5l7uzwT3s1SvOpNMlqBp7MG
 fY7HLa5bRR5yXFKKIpz5TvgK5OL0uIWbaTaIo8sUKOJ1NMTFmduExMltc
 d782rQJAVj6nv5R13Dj49dMUjd5c7BUc1tgDQS3NIIaF6Ro744+n3hEsE
 zpxMhSSMnZN53spX+4mefav1nKxKKf9X1D7UdgNT0COgG9prlx4w6fskx
 81uKihAW30n9tDf5rjkc1d3xMC5GK1qhZCrYmyRNO8yaPRNmcHn5wvdjx w==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="285950648"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:48:12 +0800
IronPort-SDR: 5NaBe2mhQ9/EaFpddBeCIx6S9bSuEZo2+EbGSNZSsSd02795/oRT5cwNvoBps8SYDsIFNEPD9j
 MM+5lsGZh6JeyusjkGXFhkPAH0L3yr2m+jcQfD+ALT4VHFj5okvwcr0waVKhbzbuIlB//SjdsQ
 CvF42zuYVrZMisCMYbFJM0VBNqEPThnK6kdtAIznRwmeZLxvX+TD+o2AHKy89cFOfpV28oqic9
 W5d3w19fCIVFDllgcWNWZtTwNn4t8s6ZjJeqkHY5zGO9iGOCN3xgP8I3aUHJFTqTin5/Pf9w/e
 /eotJTnFz3zY0fL+m0B4uYrH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:22:34 -0700
IronPort-SDR: bfNcUw8wnZ/hKgZLZv4ndgimdEQvNFilMmp5HvnlUttuP/iOC01DlgRl1U4sbUKlAwsi8CrmZQ
 PcMYfdmdXoKQw8k6HRlV7gGDpuE7yujTBlFMqRjahk6mn9jW0gV0P66JY89I6DGpOUlhgUD+Wk
 b387TRXiaNkF8KF3Ptnf/kPNmfFCsJyBBM3sArxaIGXbxxoLHu/bjf5sup+kfZcXndz8k+nhWL
 h9wDujuYDc6StjXb64GCe8uLhAQXPcCQedRrcwwRUaZHQlFfz6RHfsEnrq5C2mdy35xonqUyAX
 o1s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:48:13 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ22h3nT8z1RvmH
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:48:12 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1633589292; x=1636181293; bh=cOEeNiNBqR+mSzwtM5
 8ML5T6oxTYndhLHLwvNkfjjTQ=; b=saJOahxixfWJNVxXcs8Kfkr3rSGyYoWbxn
 UhytdfqR7662pKiN+ufaC15QPQXtwMv/P+KbLdCFlz1FJbajINPizlMoif5zJZiZ
 rJv0ZnANqRD8PkAbVJAWd1FIIso7UFLE43W8MliCxC4BAVxd9qJQZUaywRXYAmXO
 9fnhHeAjJaGCgH2NCf7fG3HWSqbiNF1oqt52+FdqqZIrbGOP0c/kUxFcphOBw2eR
 6Lzf0jTxrtewe2UlucckSdEs/W/mr5Zun7t+AxXuqBnV0DPWit6oUYpk3ROSGBbU
 i40ncx2XweGEtTw3SbEilK7ZF1JA8cMBiXYdX37IIEyAHeXsl4kg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 28IrYWf59Dvo for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:48:12 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ22b6mtNz1RvTg;
 Wed,  6 Oct 2021 23:48:07 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 01/26] target/riscv: Introduce temporary in gen_add_uw()
Date: Thu,  7 Oct 2021 16:47:26 +1000
Message-Id: <20211007064751.608580-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Following the recent changes in translate.c, gen_add_uw() causes
failures on CF3 and SPEC2017 due to the reuse of arg1.  Fix these
regressions by introducing a temporary.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210911140016.834071-2-philipp.tomsich@vrull.eu
Fixes: 191d1dafae9c ("target/riscv: Add DisasExtend to gen_arith*")
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index b72e76255c..c0a6e25826 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -624,8 +624,10 @@ GEN_TRANS_SHADD_UW(3)
=20
 static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
 {
-    tcg_gen_ext32u_tl(arg1, arg1);
-    tcg_gen_add_tl(ret, arg1, arg2);
+    TCGv t =3D tcg_temp_new();
+    tcg_gen_ext32u_tl(t, arg1);
+    tcg_gen_add_tl(ret, t, arg2);
+    tcg_temp_free(t);
 }
=20
 static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
--=20
2.31.1


