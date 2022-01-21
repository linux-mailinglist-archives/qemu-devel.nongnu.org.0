Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D3C495BF8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 09:33:22 +0100 (CET)
Received: from localhost ([::1]:50114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nApMH-0000p7-F2
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 03:33:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0T-00082p-7R
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:41 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn03-0004AK-5k
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744935; x=1674280935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g61FRhgwubVdApbJjnjVPGeYZMaZEBNpPxb+6LxcFGo=;
 b=l09lZYN4DUEI+ipo7mdJ5Rp1m3TUf5aEfDS//26HNO9/2yMhh4+o/54M
 I6I79OCSDUbz9fZ24SARm2n2qcmhdlH+22GXpYBFCpkq+GkQYklBQaFrl
 4CoBWu31nhjXd4HYPonjYiNHhj2esk8HepPZhCzgylxxQDtBUsfBOYU16
 EkwG+tuBXIsiGJulD1sfMruLpn5vtbKWk+HuXBCMBFztUX+ahQAokAs2P
 Q/bzskWBXfBxs9u/u9DeYvRpROy7mQZ24dTljxEqk8Rmk7+srUGyJAvUZ
 T1I3nuamovaktcJl+zN5jvdOwSKAceKQ+iPt+5RL/UbW+t5sk7pHI6WkM w==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083007"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:01:03 +0800
IronPort-SDR: ANJh385/MRjvhrEgkEDUSW4OSzwUXSAdekAp5VqmjsQfuPrilvMqgXI/fkzo6mEKUPBlCaZNhj
 W/KCu63yfKAnIZ1/hF3S4rOIN2JdET1jz+5uv19i81dugHS6Sy3SQGKBuKYX1VJHDTdz/LxU+J
 +JbImm38QOxb7A/zs7+rc8MWjP6NS2AOzaq2d99fzJa8QD+nbuG5fKtGu1dCpg1TCuawjjZdid
 LGiYEFSxK12vMx7brfTNqzGe53po+jTjyOEYS6Sq82YJbio5SWMUSBakrZ/2kmMiHVk8R+LwkQ
 Yi/1Imethf0WavMO4E/F49ND
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:34:31 -0800
IronPort-SDR: i4FWiz09r4t2tOnCcqIqHD9Qgk2fyNmrJQv3rpRpobtdlE/1YqD0ewa/zJCFhR+3w1CEBHPaI4
 FHng/9m9ABsd+eeFCJHDr2dsoke0YCQeSaxgn4abGNvmD35IdPgRZT+1Xt2cpdmJp56tLJES2V
 ubgfLsmaTwey6F/v43vUuo2xKEOhaPZfTqJ9xAyV/QPowtnkyAguE6Ki5CoV8S6wBafKQlHWEC
 jltGLl2B9MqTSPhRLLbmRX08fYq9kuk/WRKYW9E+ctFXJlxVwEmDnCMA6c94hxp3kC93mDRfci
 mCI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:01:03 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7zM3VdKz1SVny
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:01:03 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744863; x=1645336864; bh=g61FRhgwubVdApbJjn
 jVPGeYZMaZEBNpPxb+6LxcFGo=; b=IzuhDQDL+8ntBylSS1+V9x7UYDYivRV+FF
 PzsQPUznquaTlzjOmlaoRU4VC9rKvJb5XJZYCEWT6Ye6rdc+5u3InwmQGTPlkAnT
 ByH0jzL+vjnCl2LTpkggFXzvwTiei1kBHZDCta9+vy74D0wlQYL+5Y366rPWNs9h
 p6ZGWZOyyh+CPotEM43TeljNHrk6kVZFHXwxUsUAN86EbhGWtLG13VQdjcoDXAsI
 JmRQ6Vnx+RomWcFwpzEIRUAW1jx/4e+KEGajoRNHpiK0PncA5TCdvQFPv1Mgg/oy
 f0MgohaeBXFqjM9UeOm3i7/667XoYo0OCwyf8XSBixkKZ+0YfKzw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id L_eCa49bKcYx for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:01:03 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7zJ1H0Tz1RvlN;
 Thu, 20 Jan 2022 22:00:59 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 34/61] target/riscv: rvv-1.0: Add Zve32f support for narrowing
 type-convert insns
Date: Fri, 21 Jan 2022 15:58:03 +1000
Message-Id: <20220121055830.3164408-35-alistair.francis@opensource.wdc.com>
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
supported integer EEWs for Zve32f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220118014522.13613-17-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index f2d3c9e8b9..7a040b3089 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2862,6 +2862,7 @@ static bool opfxv_narrow_check(DisasContext *s, arg=
_rmr *a)
     return opfv_narrow_check(s, a) &&
            require_rvf(s) &&
            (s->sew !=3D MO_64) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
=20
@@ -2870,6 +2871,7 @@ static bool opffv_narrow_check(DisasContext *s, arg=
_rmr *a)
     return opfv_narrow_check(s, a) &&
            require_scale_rvf(s) &&
            (s->sew !=3D MO_8) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
=20
@@ -2920,6 +2922,7 @@ static bool opxfv_narrow_check(DisasContext *s, arg=
_rmr *a)
            vext_check_isa_ill(s) &&
            /* OPFV narrowing instructions ignore vs1 check */
            vext_check_sd(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
=20
--=20
2.31.1


