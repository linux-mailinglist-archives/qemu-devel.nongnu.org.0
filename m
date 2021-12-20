Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA0647A4C9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:58:50 +0100 (CET)
Received: from localhost ([::1]:42428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBhB-0001pD-ON
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:58:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAna-0004OF-0c
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:01:23 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAnI-0008MN-3L
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976465; x=1671512465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lMcoL3XN+sMLCjqyEKgDYZvPNAIdEwGUnBbJuvnmrQI=;
 b=ByWHgU2ZV/O/uCtD+zSUMZWC6aEylNGpwB9lrWvku5F1UvTqF7gqVQSf
 cy4AKiTIGqh5G+dpgulTx/s4yUksfJThnyL5Ii5LVyRMstE1drnkHmgR7
 2L2yt85fN/je02d8ZXFeGTk+42lK8CakRheDnVzKcIlwBXAvVkU04VVOv
 Q93kcEc5OngX4HeL8d9X3oZEJECSbznDTAw8Q9+cvKYTqCSSIV2HerFRc
 Go7qyveqjvv7BtF8/d9c1riNoudz7umGrnyunc7DdOsE+8W+l6YI0sQRl
 E2e+g4G0jnKCAio9qJSeMN52A8Qf+1S0c2Ahpt9GT1kBaHDnPA/0OQp28 g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680142"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:00:43 +0800
IronPort-SDR: ZNkFDC7rSlhRXrmqMNnCUxa6swLon9lRJasoYFXZ1kCt93bxTVs1zFwqsCelqmZHXhPqcHXdp6
 bF7i5BbwRbthL4yfarMetV/9K2TBdJ/4rT/jxrp1GnKfCrhwAxn+ZuJR5krvJnIVn87ujnz6Es
 awDA5HL66pi5ZG2/iXTCQ5L39DKzjXIekwMhCm24rkNT6F3tB6e3GSqyZY69XdQopASbP8aqMP
 /kvhrnreEq36+ixAkPUfpkoOHUcZrsuz7NUSz9uQJJIyIafzOM2y9Z0Iw/TdnNQzIrdfTdnagp
 UOQWhQI7TdQC+PURsqLciX3t
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:33:31 -0800
IronPort-SDR: L5HH73kYF9Mwc5TAYnMeB62EP0B8gnEJXICZhDqUyfJp9OB+rkwpz550Fesw6ErCqzInC0bHxx
 0fOci0ECBD+i1iTIanp1qtk6/IwOPyWE0s7u3gYsb6RZrs3G3vwDQH1Z4SrD6nFYCP58T4GUv1
 cjhflYTo1BxT92Eo7BHif7XXMtmz38HXfMQnZirPma7g1EfzDpR9ZVJA/3Hr9p+cdNV6CkWdtx
 WBA83XAlC9LOsPVMo2Apy16joDyUbEcAE6mIXRm09rtEbq+ZS0Bfr1KoNillRJbGqq4RPYnkZ+
 Ys0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:00:42 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS8T4wYKz1Rvlf
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:00:41 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976441; x=1642568442; bh=lMcoL3XN+sMLCjqyEK
 gDYZvPNAIdEwGUnBbJuvnmrQI=; b=DAobiiUWvumIvpwtPV/ShpDarhSw/QUSD+
 BzIv/VYHwLNlAfgdbXItuzwVI2Sy0ZWx3keQco1avO2VOVI+8FiGcmAN3kkHSncp
 8kPGD8LzNv7fxt4qVZe3aAEH45ag+SaQQC4iNfnO1XWw5gOpWQBZ+3WMlgCuwy1P
 JJ8IiCiXB5L9bbKFE49FVR8WLFabthIzcL890NYaNRhkEw6lLYi6wvj+NVA6m9xu
 yaz84ZYgTrrXtgag7mYtXaZ16xTtE2VdUjgDXnk6kB+r8d+vVrtnMkIb8rdcLUdt
 mQLXrnflgczZkn1yAB6OfKK5YFaAuqf5xnESFeYg1h6FKSpOfgww==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ecSeButWLrRv for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:00:41 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS8Q09Rrz1RtVG;
 Sun, 19 Dec 2021 21:00:37 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 50/88] target/riscv: rvv-1.0: single-width bit shift
 instructions
Date: Mon, 20 Dec 2021 14:56:27 +1000
Message-Id: <20211220045705.62174-51-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Truncate vsll.vi, vsrl.vi, vsra.vi's immediate values to lg2(SEW) bits.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211210075704.23951-43-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 0076ce5a0a..4894212913 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1685,9 +1685,9 @@ GEN_OPIVX_GVEC_SHIFT_TRANS(vsll_vx,  shls)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsrl_vx,  shrs)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsra_vx,  sars)
=20
-GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_ZX, vsll_vx, shli)
-GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_ZX, vsrl_vx, shri)
-GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_ZX, vsra_vx, sari)
+GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_TRUNC_SEW, vsll_vx, shli)
+GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_TRUNC_SEW, vsrl_vx, shri)
+GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_TRUNC_SEW, vsra_vx, sari)
=20
 /* Vector Narrowing Integer Right Shift Instructions */
 static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
--=20
2.31.1


