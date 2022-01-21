Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC413495B37
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 08:53:50 +0100 (CET)
Received: from localhost ([::1]:51842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAok1-0006N3-RE
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 02:53:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn02-0007UP-TT
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:17 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmzo-0004KU-VR
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744921; x=1674280921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y+5u59Ng5aXuSfhsc6LCexaztL1VPg+1H4mkATgL70I=;
 b=q/MnNTnZ3xCABg/fttmT+XDOGLJB2DysU2hd+cezZlVCaG//qcJPYwEl
 KODDR92km3ecrBlWAH7toI+UDpx9gGVQrLF7SkhdiTCjajC6WQuDgea9i
 nj4nH1kzVn2AuVG6oeUssJObZAbo3k/UGURXCDhM5ilpozl6rLBCItllK
 FbQ3Fqw5xhCYwKNLWFSz6g/8dYx7Iiaf7iG3R0NOy6h5YQegO9Sgmwz9u
 2fUrKxYK0oGqyee24NaguZIWBt9s2DPMJK/ivbM/a6RjDnuvAK31UPyK8
 Bl2Tyyv20dgjFz2FC7ZG53A39w7hd9dt0MNuRXF7rAYbAcjNhVNocltbt w==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295082979"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:00:48 +0800
IronPort-SDR: /DsQH5FLSVXndaqR4wiNF/1MNQG3OubVzSjJc3wHgGA0xs5HY+h5ffGQz1paKe5PdChYhIeSCa
 7DDZTjjF7jrbGpsk5M4KWaaYScjsFwQdxPCH8h9pckGAPLX1iUdeENT/2nmjVBkE/X5tmAfLXn
 Yb1X+awIrFQr5bUZshWEwNAk72FNFUpu77aaOTrJGGDKfspxIBbbZpDya4T0Gfm0f2C98s5Fzc
 MerKp8jvq2WkosYhyYCUgHi1j5zYg8C71xHGj4iQPb1hptw0zViBLEQm43wIfZX/YZgCTI1JA1
 Wsg4ZcWX6BRub3Qo2V+axIa7
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:34:16 -0800
IronPort-SDR: t87nX0gvKv+GcqQl90WG1pE5ow314/XKO25aE6PR+MjPwsdyG0YNpPc3pdMSU/n7YPUdXus3nS
 QHMxexmGOdgal0FCJp6aW6CP13L2zXTFKKO1hvNllud9V4er79yEw1KWXq6WwSqBd0Ct/ZFnNn
 klcrbD8EfNt8UmjpxHLszzSNSsvoP5c82nC8+SxISq+Yr7LjQXAfT5yoXmgG/npZSGo6stFYRU
 pFggrj/0fe7S1umW6drJukgCzfE4GD7YORZvCoLCmgzAXMtpoQd+FReqh9z5ZmymfgCbXWbDQs
 qsk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:00:48 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7z420Vjz1SVnx
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:00:48 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744847; x=1645336848; bh=y+5u59Ng5aXuSfhsc6
 LCexaztL1VPg+1H4mkATgL70I=; b=YYleumBf9wugwpPYzI6R7SZkXOLFXOlbyY
 INVUzf3FF9/gmEB0+s6xPDsbyrxmRbHFxaU7jzAOdm6C0Ek0aWFcAFx3XqkOvJ5G
 gS6jhXoyhakawjbr7Uqgfze91wghodxhixMSxd4rqYIjvjca+ZBqrmVxDPpFCMlI
 /J2jr2XkP6BkXLnMkTjAXI67L0ZrF5QCB/J/ns8cSeRTT3qm5EZFrK2lRHLXnAi+
 8oCFgHJWBUUdCWTlJiRaNgb822iA7DWoP7P6BnAwHEZC24E5BrXX+otUjM9Xh9SW
 CSDibG5WYJz3jpE7Jfpae2clEANdpd3ZfSWIkfG2U8dEF8iCaPbA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id hgrncKzzVwtE for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:00:47 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7z12ftmz1RvlN;
 Thu, 20 Jan 2022 22:00:44 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 30/61] target/riscv: rvv-1.0: Add Zve32f support for
 configuration insns
Date: Fri, 21 Jan 2022 15:57:59 +1000
Message-Id: <20220121055830.3164408-31-alistair.francis@opensource.wdc.com>
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

All Zve* extensions support the vector configuration instructions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220118014522.13613-13-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 9fa3862620..fd6e74c232 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -152,7 +152,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs=
1, TCGv s2)
     TCGv s1, dst;
=20
     if (!require_rvv(s) ||
-        !(has_ext(s, RVV) || s->ext_zve64f)) {
+        !(has_ext(s, RVV) || s->ext_zve32f || s->ext_zve64f)) {
         return false;
     }
=20
@@ -188,7 +188,7 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv=
 s1, TCGv s2)
     TCGv dst;
=20
     if (!require_rvv(s) ||
-        !(has_ext(s, RVV) || s->ext_zve64f)) {
+        !(has_ext(s, RVV) || s->ext_zve32f || s->ext_zve64f)) {
         return false;
     }
=20
--=20
2.31.1


