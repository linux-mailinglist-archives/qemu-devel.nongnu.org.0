Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3BC47A50D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:36:16 +0100 (CET)
Received: from localhost ([::1]:54944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzCHP-00077o-KK
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:36:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAoi-0004cv-U1
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:32 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAoc-0008Lj-7r
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976546; x=1671512546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XXsZ1sDt9Y1UWViQTGzTqkjUvwz9P19dL1jWozfUgNM=;
 b=ZpsGHwBkEc7I6UAXWmHIX3a6in4BUMSlSefqdsu1PtODKEZFep11WQY7
 lUW2itlD42iVoGyWekg3mfHq2aEoGmLwR8IfFB34u8BNfMRQosi1WoyiX
 CIfLH1z2YTda1K23GuMEelASJndcS6/q+12RdUZX2EOnwrDKRMsHwh3oi
 hhuLJxZtUfV8s/zvSAN1Zz7vMABei1zootG0gkbILnyuoaUi4O0rcsjXt
 +ptqdVnY26w2ZAOzzlb6MCLq/my6vf3g5biMbKcSXIwO4d6HNel9gIZh9
 7RJb0nabs8CmgVS1Q6oEGnaA+7Kwj+2o0ZuZgpyTPGQ5lQHAg1Yr9JtU5 A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680240"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:01:29 +0800
IronPort-SDR: slJjM3ouckrhH22tzJYFBI7oadT3t7oT5thL09bKxiX9W4NGr+B0PP2UFOCpxDUTNVLKO8I40T
 qVoLoEhkqzGtaEDns9ShI+0F8Qk+KqsLMg8RHBhJRJ/z+MLOln87Jv4CRuT1fAsQKLogcs4qad
 Yr3ztBVLk/cdFzZ58eqLMtecePCcmBhO+A49IAgFnX18Ixq3q0CtxU/7psuq0gwOWS13r0vvgw
 36Hp84uuTl+gdb0hdDh+bWGf1A+qP3WLtrE2GNXCArhHaX7FzI2i3aLo2gJB+v0tm5oSRugfGH
 TnU6rfyQAHl698Bl4gXPMLKx
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:34:17 -0800
IronPort-SDR: lIs+MZZMpEcSyIMWHZsHFVO5rNCng4iToJKwaBxr9K6J2aeuZNcQxrGdlf8BBPb6ut8VUeWE2q
 wxCZP+H6A5/U3GDdNc9ikR3UVi85kzydD9ZCgnLQ0H6bX9+O+5yxcGMaah839oV9I1DhU0zgxZ
 umBdA74xa7Cz4dBXmjEkf/B2lQFf7cqrEO7LJw5U9mo5f7kLhuePfHW9XX+pnfTSOFaVYBPbgq
 7GIDAyakurcj08wPlVrBoW1pELqO8wt6R/fao+2mChux74zqvFfI9UiutR/R0gsqgpmH5UUq2D
 jb8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:01:28 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS9N1D6rz1Rwns
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:01:28 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976487; x=1642568488; bh=XXsZ1sDt9Y1UWViQTG
 zTqkjUvwz9P19dL1jWozfUgNM=; b=WA7DPE4aBgkaIcy7RT/sO01Q0CSIvpR+c0
 7k+RuLN1eTbYiCzcPQFiBQbxVAMnp+JHzd35fuE5n3uU9OsG0TaRzm52xZed+RcU
 nsEHWK/iypx5pgrvfygo5+aIIXgiFFeaTmCmsPh0G7eHKTIPJINR2oQJWWIxIt75
 7ACTeQ+F6OySoenOvvWBFgABLehaeJw4MHb/zmydoDy7eHN8wUzemO0ZyT+CNzvY
 nkbJ3rGYg0/MD1KyP01N5E1In6Cdaz3VaPlyhvjOi3ndIBRBJVjV9SV6lb8lYAtL
 Z7hUq9JOF5rGxabrRVTLnjx1XZJJQte5/bBF8y9ROdzlagnyjcsA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id RQ0a3f4YGokT for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:01:27 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS9J5qntz1RtVG;
 Sun, 19 Dec 2021 21:01:24 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 62/88] target/riscv: rvv-1.0: widening floating-point reduction
 instructions
Date: Mon, 20 Dec 2021 14:56:39 +1000
Message-Id: <20211220045705.62174-63-alistair.francis@opensource.wdc.com>
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

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211210075704.23951-55-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 998247d71d..b43234ed3f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2648,7 +2648,14 @@ GEN_OPFVV_TRANS(vfredmax_vs, freduction_check)
 GEN_OPFVV_TRANS(vfredmin_vs, freduction_check)
=20
 /* Vector Widening Floating-Point Reduction Instructions */
-GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
+static bool freduction_widen_check(DisasContext *s, arg_rmrr *a)
+{
+    return reduction_widen_check(s, a) &&
+           require_scale_rvf(s) &&
+           (s->sew !=3D MO_8);
+}
+
+GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, freduction_widen_check)
=20
 /*
  *** Vector Mask Operations
--=20
2.31.1


