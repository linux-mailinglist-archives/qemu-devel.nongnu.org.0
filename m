Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E1447A50C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:35:34 +0100 (CET)
Received: from localhost ([::1]:53528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzCGj-0006AZ-2a
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:35:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAnv-0004QY-VW
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:01:48 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAnh-0008Lj-Fm
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:01:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976490; x=1671512490;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kZ/bH1FzvCa0Yyzfpm9koKyYxaWN6GneSgfzqj5CvMw=;
 b=kl5NeOPrf8+I/YRWcH1Y83EDrAnsI2m59edALN6WNBLai2f0AEPFQ4We
 2BUvKtTx2S3IwZsZoXI5y//BbXKXhLgiWouF7p8TJeQzgXnmWYwyS+Z6P
 JtbQjsm5CWAPiyJjQyVdctQ/nOxmUFA10BGu/KJpJWtcaZHMDU3D54JW+
 AN9bShT1+X4hpteN67WIQUeWVpq8iX9CCMmr9MWlPy02QAotibL0iRpln
 0wxRQXIMfrpAjRcGxK5Ox4mCF4gW7vn1Eyor+43MoFuZT9G9jsUPk/Z5Z
 utoCpvkjqbRAy+R9vzFOiRebDL+7Cs75aaJ0AHeWFKJiYHD6WgjlkXDdb w==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680169"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:00:58 +0800
IronPort-SDR: tMkFrQjfyt7X2Bq5Bb0oQatF4zfD5iuplAgPHXQd7rczU9REofnv66qSKvWf1uUPCvNF8FNTbU
 +Ai0rqX1GEvHs9GSBTZMNj1DpHrMNPLvBEqxMLNL7unPOahe7v8ZPvc+R+TouP2SJ9OuvqW7w7
 jhtxWzMbX3NP06DqlVzcDrY7GCzT6yCfd0mMbwC/q422Bg0xiWkGkAqzpeueBOe9rCD8HL41XO
 Krvt/Lg3Om2RNryjzaSbkTql9GXSTmFDs3Q31zGvaWUlXMNXblH+5YGNiPEmWot95l+YohXwUh
 FSQC5aO+a+1kXJ8RiHngUF4V
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:33:46 -0800
IronPort-SDR: 2TpD1CJt+oKRX9SoE4WVK3gTCLWBswSErVFnZxLSbqj5vhvmfdo2avIfftalrz16ASS2INxk7L
 b+/5bqjNHzKM7ezPQ0wSSoaeT4jCF3FJRTDuZGGqIw24gHmX//D0Dcq0KSSaFka1BvWWrw0y2j
 20fvqDUcVTWLJF7n/XHj+7SVZYebqV0D/lirhEEVZJwnrE24BAcLbe3n6gRXqSWf06Dam1L4x+
 RFByqkiNhVwjc/jcTnCAMkIx7/2RaZHhueBq7Ur+/ZOxXLw9e1NLkynJeXnLWbGsJljjPMOS6m
 SgM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:00:57 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS8n0Xbjz1RvTg
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:00:57 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976456; x=1642568457; bh=kZ/bH1FzvCa0Yyzfpm
 9koKyYxaWN6GneSgfzqj5CvMw=; b=QWtGLkgk8Esh/FZE31GJjMBAucqHqvpNQ1
 iWf/xyhXhRGyvpS8UM1f1VAla0EaF2SCbGOfilGwkRs+q6JoSiPQNXie4wLlRnK6
 Y13TWY4t6xn5BVU4v4EAL86h6j+xjxgW06za/Z+s6TN7XoSztuUHbkXmqeHJzeS5
 OeXwI6ztB0Jw5GsmizKEO0pDk5BwvV2+HYeglSl+aSlUu8XvoXCf+PwGuXF6XFMR
 lBEDi85ORFRzPG9KuWT4Z+QBm5fIG0mQnTTlbyHJ6LePgisNDPuOKu8I3W7mRgqe
 cDCAE4LeH3RlREYqGqxz5qx6VPx6f+uUIoQTpZ9T/KQ/p5/ASNUg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id P44jID80T_hI for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:00:56 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS8j58tWz1RtVG;
 Sun, 19 Dec 2021 21:00:53 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 54/88] target/riscv: rvv-1.0: single-width saturating add and
 subtract instructions
Date: Mon, 20 Dec 2021 14:56:31 +1000
Message-Id: <20211220045705.62174-55-alistair.francis@opensource.wdc.com>
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

Sign-extend vsaddu.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211210075704.23951-47-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index f6202835ff..ed4554b6a1 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1999,7 +1999,7 @@ GEN_OPIVX_TRANS(vsaddu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vsadd_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssubu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssub_vx,  opivx_check)
-GEN_OPIVI_TRANS(vsaddu_vi, IMM_ZX, vsaddu_vx, opivx_check)
+GEN_OPIVI_TRANS(vsaddu_vi, IMM_SX, vsaddu_vx, opivx_check)
 GEN_OPIVI_TRANS(vsadd_vi, IMM_SX, vsadd_vx, opivx_check)
=20
 /* Vector Single-Width Averaging Add and Subtract */
--=20
2.31.1


