Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6BB6538DC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:42:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87li-0007Nh-Ms; Wed, 21 Dec 2022 17:40:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87ld-0007Lz-NN
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:40:54 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87la-0000bf-Hb
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:40:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662450; x=1703198450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CA4KckVxC2yHEoq4Su2S93cY9ilRgoP8o3uZSJMhlOs=;
 b=NYzENApu+7cHHFDA7B2heKBhlezoJGuBQaCyGzVcCCNUxvghQoSQrzEh
 NDWy+gZk93hAccyhYmwrFTNMFia9bsMomu1yW+t2k3/jUo6XyqlpdJZIT
 m/xA1K+2Y2bZ7XIHfwtgVb9baPxIy39AO1SzCidXDStHZNQ/4LYekKUKT
 RWOZg29bMTI9G4Qo8NkfJWT/Jue9E62qSmw1u/i+dkUoZOPkCb+QeEx2H
 vXn//u0Jn4ElQi6JvN0rvoebluI6DSYKwrfYMCe7PTUuE4Nx9cqPtFROA
 BJoCqkG2Yb+SH+OSzEWDjPfEnpx52sW8Gc36A5UiWPTHcY3CU6cSNb2QZ Q==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561276"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:40:37 +0800
IronPort-SDR: /dQ6uCVwTyzk1kegwZd9h4rdYwqzx2io2jirk9Yjf5nEFbVWHd6Wn0gvFmEqqReI1l6h/5/8Xk
 eWDYr7EeMyLdPgHOfE+EP9qZyyYDJJfPBP5Gi2BFMzQQPeHv1CcBup9PZSpZrp4etMbih2drD2
 2FW2vPLdXqVVHsPZM4kajxtdPMUXvDYCeAIPsMS+MIC4V3RuYPFIiMbruYWKeSrgsQP6CQhEHq
 Mi3LtckMB64/eUmZBAbs9qtYuA9/QET8+AT6F08XC8dAGHNnQwUSWYhiXepl45fNOjarGlUjv2
 h/4=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:05 -0800
IronPort-SDR: iDnPKdkjWlrZ/8F/w8jaCaloQGFOqH4zSAwwtgP8G0YbxuWkN5euQH+R/6PB/qyh5xiHE7ZyZF
 pM1A4234CYOJJZEaypwvxn2f8IXCeof/csigH1BbObqB+wRryTpEl25U3WBGwsxjeou6kA/cLV
 NP7HzHLEzRUxy29oMNGPDJsF2XdmbeCeUmV07gZcgt5bcjjn587jQ+lps+E7yKen8wwlO5693S
 ya6kO4Tli8nrmeFpnoqPJWaQMOPrBTFS3MBSI6sIWi60dR1abXaMWgr0j8tJqvAaaHM77lzQNe
 bi8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:40:37 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpLY0gZ9z1RwqL
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:40:37 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662436; x=1674254437; bh=CA4KckVxC2yHEoq4Su
 2S93cY9ilRgoP8o3uZSJMhlOs=; b=sU1ADYOSQlQqGe8WpgfzupwTRaWRNWBqQK
 Z9Mn2V1SAWj3Gdg2xqkieY1IZGuFViqBySgPrvdLRePamNkLlEDGsE6DqOmDT0xu
 GgzPbasVbFPRt5aGpg4A90Y0yj4c4SBfocTRMSCNScwSZ/KocY/rVynBXmVQ1jit
 NY2P0en4Ri54fHUu7AEx+nTxJfgardFmrwiPZnVrVoY8UgK91AilxyRtCqEbYFCi
 bgUgZNZei3PRCw6qmeu0bo0O0D4W58SJwozJg6MPG233v+t/iTiF5bTVPD6kyGaN
 5qYMePjWrdayTsoFkvaiO19+20SAQMETR3FBXa8a7jCHG2tE0ojg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id dTR53Z5EFMMT for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:40:36 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpLV6v6wz1RvTp;
 Wed, 21 Dec 2022 14:40:34 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 04/45] tcg/riscv: Fix range matched by TCG_CT_CONST_M12
Date: Thu, 22 Dec 2022 08:39:41 +1000
Message-Id: <20221221224022.425831-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

We were matching a signed 13-bit range, not a 12-bit range.
Expand the commentary within the function and be explicit
about all of the ranges.

Reported-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221022095821.2441874-1-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 tcg/riscv/tcg-target.c.inc | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 81a83e45b1..191197853f 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -154,13 +154,26 @@ static bool tcg_target_const_match(int64_t val, TCG=
Type type, int ct)
     if ((ct & TCG_CT_CONST_ZERO) && val =3D=3D 0) {
         return 1;
     }
-    if ((ct & TCG_CT_CONST_S12) && val =3D=3D sextreg(val, 0, 12)) {
+    /*
+     * Sign extended from 12 bits: [-0x800, 0x7ff].
+     * Used for most arithmetic, as this is the isa field.
+     */
+    if ((ct & TCG_CT_CONST_S12) && val >=3D -0x800 && val <=3D 0x7ff) {
         return 1;
     }
-    if ((ct & TCG_CT_CONST_N12) && -val =3D=3D sextreg(-val, 0, 12)) {
+    /*
+     * Sign extended from 12 bits, negated: [-0x7ff, 0x800].
+     * Used for subtraction, where a constant must be handled by ADDI.
+     */
+    if ((ct & TCG_CT_CONST_N12) && val >=3D -0x7ff && val <=3D 0x800) {
         return 1;
     }
-    if ((ct & TCG_CT_CONST_M12) && val >=3D -0xfff && val <=3D 0xfff) {
+    /*
+     * Sign extended from 12 bits, +/- matching: [-0x7ff, 0x7ff].
+     * Used by addsub2, which may need the negative operation,
+     * and requires the modified constant to be representable.
+     */
+    if ((ct & TCG_CT_CONST_M12) && val >=3D -0x7ff && val <=3D 0x7ff) {
         return 1;
     }
     return 0;
--=20
2.38.1


