Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6B547A4D2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:03:40 +0100 (CET)
Received: from localhost ([::1]:51134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBlr-0008BU-E6
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:03:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAnt-0004QW-Hp
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:01:47 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAne-0008MN-PN
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:01:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976487; x=1671512487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NyG5P9NWvJ7p6hfJfGqZlCGIKefBuWqwnNnVTw+94n8=;
 b=da7t0LgMVHZ26dz6x8Yu6Zo7xKWG8jopbREcBpAms5tcztnhVBdiZqPk
 df5CtsphZu2PIFmsIemRnJ9MfXNtUj4+kmvvIcPFqURmD1ldBZdxOT5Vr
 kkkQLEigWAY4sjFczfsq8M22GaGULdA0y0AA/Cp2BrpgSt3lTl5JX2H3+
 qexJ7JBv838p3bbVtIO8Ckkfi4+3JEybsa1sCDzzGMyOvrP7H6owKhWJH
 lHjvRhIlbCi4D7xMie2/u9ujzh/gTn81Q8YjQtbgGyHhnDBOHynWXjaxD
 7USfpqWXvgb7cSIMsxBZ8qrspJRAlwnoneXgKo4tj8MM3tUalA8FPOW5x Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680166"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:00:54 +0800
IronPort-SDR: +JAHjckITSSAYo5MaVur8IQirIyHqdIm5+8H/UJ1L+gINMrD/97e1B70voRs9xCWqgiFINZIfW
 QBZys4tmMYPKbS3R4iWGAD/qvAOR6cDQFQaM9IWtSR+gzrFyTOG4cfFQYDvgCr9FSOdw9B9CTX
 Rx1YQvVdAHSoG5MkWnmdPaVEBJmfpjpDcMjF1D+q1rQIhSEgevb4jWQQomYNo/RfhSO5NxCAL9
 /isCmMgJ0Fz8aCFKftbL3AVROKiOAbD6f9Tqbn5jze8po7CJizgiK7zgM3UY7GyPtjIcL1ThIt
 x+iMfUkKf+5SKvVIil2gBQM3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:33:43 -0800
IronPort-SDR: gBxDObtP+Sd1evvV9bD8DiWJDAawQ9wt5CdcFUJXaqmguVOLfxHAkS9QwdBjlB82RywpnwdqE2
 H40JV9MvvSawELIas1iJp7bxGCSyBvsAxJNL401mlRez/cnQj00eFSyDtf/QPbTbTsoxuzEKfi
 R76lRh5V63o/S/4nQDSH2KhNlTSA8UNZaEhL2uXvUrFqA10SxNQDbPqYjsHyOLX9Oih2VZP1Tg
 ruBMdjXvCX64TkUsZH/IOrbtWdcr+zIKxVJMpVfiYuBLAKA82wj9TNtXnCJu9iAZykooBsgxkZ
 3IE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:00:53 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS8j1g6Zz1Rwns
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:00:53 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976452; x=1642568453; bh=NyG5P9NWvJ7p6hfJfG
 qZlCGIKefBuWqwnNnVTw+94n8=; b=tZrwGVp6E3GnG2JcUVgqyoQU5DDjv+SRQJ
 KNKvyZYOMOQxiNh4YUbgbS4kFXC0oPIIBlh+8lYdiaxe5FMQE3p2Gz29emfkaO5N
 ahItVw70+s4PjxmZbl8BKwOeu/wDmQL8Y1j2I3fhuyiWc16sL2cPhGxd62ixg5bs
 xJQLmz0v1FelVX98qSdq/gjbS/iWbvl3UCjAt8qKVjeJfF2EeexzW7u5oDNBKUcU
 aq7f8paZWNyWS1WKXIZW86D02bGUS2fbK+cGoHLyj5n3rIrAGzp8YSJoiTdwrjHw
 P83tQkO5gRFYOa74A0D0xqA4hhKv5pLizc4hbQvwQQjbAohKqgxA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id a_rRX3Ia1GTh for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:00:52 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS8d6NJbz1RtVG;
 Sun, 19 Dec 2021 21:00:49 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 53/88] target/riscv: rvv-1.0: widening integer multiply-add
 instructions
Date: Mon, 20 Dec 2021 14:56:30 +1000
Message-Id: <20211220045705.62174-54-alistair.francis@opensource.wdc.com>
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
Message-Id: <20211210075704.23951-46-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index a3f1101cd6..7548b71efd 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -474,9 +474,9 @@ vwmaccu_vv      111100 . ..... ..... 010 ..... 101011=
1 @r_vm
 vwmaccu_vx      111100 . ..... ..... 110 ..... 1010111 @r_vm
 vwmacc_vv       111101 . ..... ..... 010 ..... 1010111 @r_vm
 vwmacc_vx       111101 . ..... ..... 110 ..... 1010111 @r_vm
-vwmaccsu_vv     111110 . ..... ..... 010 ..... 1010111 @r_vm
-vwmaccsu_vx     111110 . ..... ..... 110 ..... 1010111 @r_vm
-vwmaccus_vx     111111 . ..... ..... 110 ..... 1010111 @r_vm
+vwmaccsu_vv     111111 . ..... ..... 010 ..... 1010111 @r_vm
+vwmaccsu_vx     111111 . ..... ..... 110 ..... 1010111 @r_vm
+vwmaccus_vx     111110 . ..... ..... 110 ..... 1010111 @r_vm
 vmv_v_v         010111 1 00000 ..... 000 ..... 1010111 @r2
 vmv_v_x         010111 1 00000 ..... 100 ..... 1010111 @r2
 vmv_v_i         010111 1 00000 ..... 011 ..... 1010111 @r2
--=20
2.31.1


