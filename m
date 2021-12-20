Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C90047A4D0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:02:35 +0100 (CET)
Received: from localhost ([::1]:48958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBko-0006c3-Ly
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:02:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAmj-0004DN-Vm
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:32 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAmO-0008G0-MZ
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976409; x=1671512409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=or3HiD5Tuo8dOhfxNewF26wApNPYYy9MklqgKxi+xGQ=;
 b=GQerRLaB4448RjPSLj02Uzf3KGGHQCH6kvTTCwvu4soPN+9Z2Qli14rk
 3CzZ1tP4dGGPcMu79iFQVPZgX4CqmEisYqXJktl+142uyds+/IzQA3Oi1
 cOAlYrmAPu/H/tqiri3Y0JMTrSjIXK3YJt85/rtBcuEXmBpp2sqv+hTqV
 7SM+/wAgnh5aDM/Gg+YNftlgYeEycd+z7stsgdF3SLVaN7pe0NR/VURQ/
 aGkGSWCKK7+x0b5KR3htuKuQcwa3FXNmSNeksvx6XqtGvHgk0owxoLyE4
 424hFoEOQNbeEmmD4ECal+e7cXxiGuXJmbTdm/B/Zvsc7D2Velj/r+VLT g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680082"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:00:09 +0800
IronPort-SDR: KAKUSgjaKx/QaWHhsG85+pzU22yvj+BOrGEQmUlYAtH9d0MBXRliFB5645+M9S5iBgNGQSPixs
 kdpX7rKzwTI4QX7Y1xi3qgEGQMwYY4F85cy2MWOUNnXRiFZrQJWIX7cvedNyU2GKcFp8gNNmf4
 rEnN589abdOhHLCOeGyNfB7t4jzENCkJl7gGFH12/xcykg0KabZHPgg4Iepc7mnuEeM7W4vNY9
 V77fqO5tZEWrccwnyJW+d1Za8sxQcBKASOH4L4+NS+PMbMIFabiwwt+8DC5CwdgREnzLDo5FW+
 xSlXhs5WUKyqdaFHvRzQu6hY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:32:57 -0800
IronPort-SDR: dIXctnH38KAQUxd4/LZrD6M/9ml9sj6DHdLC940SWcDJLG8O+cSp8c3IACVewimljX/BgjS4Cf
 Xm2FZvOJP9I61/hBvEiSF2xawMBtMdPiOQc54yEqVPYFvjMtWbPli3p2nGqQ68qIEteyE+enli
 LsRLU0DJuGpMT+B0sv9ozyODlhMlG3b88gTWI7Ns/lsuZrpiDKpRvT0l0p0BuzkbmEwsA/Tt8Z
 4hqD+cL1W5sqxM92JRLuKIz2lfsc2+j1c8pGASFWeKTWUjNccNgrpp+Y68ueYhLr6pjNFMrlr7
 FNg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:00:09 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS7q50Xpz1RwFN
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:00:07 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976407; x=1642568408; bh=or3HiD5Tuo8dOhfxNe
 wF26wApNPYYy9MklqgKxi+xGQ=; b=bvclgwkPohYN/iJb6BXfjLz0d6zCQMbfag
 KXQrnu6WlTz96aTGgT0A+daaLHPyLv8DDcXmrIyKLdlXc67dNm6je45nTggQT3Kb
 m2jIFVBuMTOjxy0M5cKqOTsOgmNbwSGWVm5orfyCtpid8v7d1nqqg2ojZcWDBT3+
 msU47sd1/lhQr8n6Om7T6h3dBYUTO0xGK+sRBqeXtsqOOj6t8zUTB0n6VE0mrFHe
 TMgca3RxXpJCpzS0YNckRGal9/bL/NAdusNQ2QEw4am6VoiZE4BJbrWZlOxFHE6h
 ZU/qabkHCaXWwNLwx3rkzjz0q/YvM8YzTXcXa+xXGoAGjAXY2pNQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ZiWjkZHw7kCO for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:00:07 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS7m2Pl5z1RtVG;
 Sun, 19 Dec 2021 21:00:03 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 41/88] target/riscv: rvv-1.0: element index instruction
Date: Mon, 20 Dec 2021 14:56:18 +1000
Message-Id: <20211220045705.62174-42-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Message-Id: <20211210075704.23951-34-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3ac5162aeb..ab274dcde1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -633,7 +633,7 @@ vmsbf_m         010100 . ..... 00001 010 ..... 101011=
1 @r2_vm
 vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
 viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
-vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
+vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
 vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
--=20
2.31.1


