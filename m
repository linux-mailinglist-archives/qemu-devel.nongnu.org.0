Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDE847A4C6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:58:22 +0100 (CET)
Received: from localhost ([::1]:40310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBgj-0008SJ-5V
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:58:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAm4-0003XE-VV
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:49 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAm2-0008G0-8Q
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 23:59:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976387; x=1671512387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=as6qZyOtmfd2aTMIjj1BB21wpUkQ4hSYCltnbnPU0dE=;
 b=QePFD74Rc9+PD37Ti45w+IOeMCWv8kw2F+oEE9ndzpgkUd8ZyQwqzbxc
 cdGTm4dbzpepYcG2KdeTAZsH+2zMaaDj8/Qj6w/fNPu6ybjn8OLI/yxId
 zN5v6ToGLmcOD16Eqs2jLCGlvlQIrs9hyq15trRRc3axa7oS6/zio2SAT
 7c9Ts25CuMSj6YjmxsxKvIRJEASUbK3OVBu6gnREb6fYIjpTZ5fUJdubR
 S0CsUY5B3eL0OO3oaeZz2rOVmRImR8/iZyoDfZSeEahiwSkjS7e5CrWvy
 MzgO3uo+nmfmbjDKg0Obc+XpRGGhvDmAw4nuoIMdb92HGS7CdU6KfACPD g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680060"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:59:45 +0800
IronPort-SDR: KVoiNMb1EhsGr7yGTCpo5la/8mhTU5jmlFazLOmETBvLWx9yOwWgU1jl0POaYYrdS8+6fe71mM
 gIMtMQR7yHYYaOHHMStnQPIoMKQCK5MreAIyI5by6+MF0z172UWVCbr/ZG0Q7GTl0tMaRSS2PZ
 sIm9fqn1PDFEKZ90fsIIBJiNa5jt4VWAStROHUZxW5TcLbh7b+LfYBcKyNwl9vDganKfPXrTKp
 ieMkc8eLebBD2jm4xgBQ2eVMVJS12cl7TypCU57rj1yoZYOhPOxZlTARarzB2TFJE7BHnjGvS+
 m6+ALIDtAOwgHfHHbzyhRfPd
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:32:33 -0800
IronPort-SDR: uxAV29twkVTL1MN7lX/PGgic1YRLYVKqNI5yy50RA/v8kl6LyllRp6EQTWIwyfSBcyJsKS9g2h
 mI6j7S78An68zroZtIfS/TbSoGrYI0JlTm2Abojj1dBs1jpCgkBsq+sPKLKkItodeVXi4kORWM
 Fd4FUmJc+IxNwZPtRPkoWwN/QeDONygFegBb5na3fUMdX41M6YtQ2h/f8wvD3aELLd1NwuGJIr
 Dc6zAZllrWpUbNkCEsTdNdmS0Xrj8OxqRM6qM6hG+2Q24XfH+ygf7Y57pTwiEEIFdVg4Yzaq85
 7lc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:59:45 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS7N1qtrz1RvTg
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:59:44 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976383; x=1642568384; bh=as6qZyOtmfd2aTMIjj
 1BB21wpUkQ4hSYCltnbnPU0dE=; b=i6dPtvAMo69nUmQDXjy2laulLWFggLLpy9
 M4h2c8IY5tT8rUJeH62Diul1C+baVZVAJRek/F0WEJxnWBgqWUPQbvgeJmmVUu2w
 MpABeuwC6Los8tC5Fjzx33UJM0+NjQwlv2T7RW17zob5PvIlAbcMGID4AFy10twH
 ZwK+W6vB2ezfElbBpRudZELaiNUACIhrC/OyzkS+AF5MFlHiPVjTTuhYZh5Ic5RR
 IZQGO38+by7avR1Y0eslUI39L2uds92o3Pc43Poic4VgRlaib9Ik53A4iGuUCqav
 3sFWTZt+WMIjQ9j/pdx55/TN/BeP7HO3yaV71kOemtFWaKM+XH9w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id YKh827UQ7P_I for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:59:43 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS7J4xGHz1RtVG;
 Sun, 19 Dec 2021 20:59:40 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 35/88] target/riscv: rvv-1.0: floating-point square-root
 instruction
Date: Mon, 20 Dec 2021 14:56:12 +1000
Message-Id: <20211220045705.62174-36-alistair.francis@opensource.wdc.com>
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-28-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7d8441d1f2..92a0e6fe51 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -563,7 +563,7 @@ vfwmsac_vv      111110 . ..... ..... 001 ..... 101011=
1 @r_vm
 vfwmsac_vf      111110 . ..... ..... 101 ..... 1010111 @r_vm
 vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
 vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
-vfsqrt_v        100011 . ..... 00000 001 ..... 1010111 @r2_vm
+vfsqrt_v        010011 . ..... 00000 001 ..... 1010111 @r2_vm
 vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
 vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
 vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
--=20
2.31.1


