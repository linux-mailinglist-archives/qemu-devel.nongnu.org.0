Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4FE4881D7
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:21:06 +0100 (CET)
Received: from localhost ([::1]:36364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6567-0003yC-F7
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:21:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64eS-0000ox-5J
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:28 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:26464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64eQ-0006tA-IC
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621146; x=1673157146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iNA079Ke2Q+2QM782aixO26oTHxyoJfcisdS2ti+t1k=;
 b=QenoIwgSo3Aym6dFqpX15Efm55MNuavN4a3VJ99It1/yWfK51If7u+Ki
 FrNKAC5k+LkO/EVtE4sBxTGAKUs4Qh2MPRJBEwlSytDk3nysJ69koSJ5p
 1I2kL9bq308Gxy/InZLIXFabwJ3Y3hJp+pA/vdTrHRVkwJz+ot1J56uQK
 IKnx23lS39WJv4XSUPOT15IFcF84U0E1JXTc2deR5tb3J05hXfo8v4yP7
 4pZp1tjw7VC3yPywusKXQhQYzfVI3aN4QXcLxyMBZUEm0BhUpLGIeEkwk
 swViRIjEh40P7hc6i+PIO2gQ5bHUCp2xOEzPJ2r1hp0w3kbZWdB8/We+E w==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="294027375"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:52:24 +0800
IronPort-SDR: V0ibW3pDnPD//xkktqgixlFEW01+goozt0+Rat+WKk2lbcWtbYYbOPQFCEcU3QOSEVhoalsG/Q
 ld3bXNaTNnF+wXdUCQp/GC6dBbxh2RJNeV3JCYEfMJpBPc52iPg7BX8Pg6hOyazWg/DsdfSbkq
 OHIuyXfAhzYchSOWMLhP4X9XjIE7hRLj7LTRplFH3FqhRp/KGg1leYFrbhrRNubK5ZcS7isV1a
 KjNUcQKbNGF0GbZemfhYDushV/yLvYwwAUXYdQMVBainhRW8rVvDWp4/Y0D1NxixynT040l6XP
 +UNoWJj0fWHhvtrXOSKM04tn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:24:51 -0800
IronPort-SDR: ldz9jRpCzcGtimLSbc2WftgBiO89SlFTqTI5voyxjvYU+rtXYSOxnWHuN/9u7N1cn7qVWEH/+8
 VK4+0LqwRQTsmt69+lM2muuAYu5jrcZbRxQTAuqDqPsK2wYicrfLwJb+WSp6vxF1j+r0nvD1uf
 mWd6K187YY4BNBLPPl1esj+vazAU4wGfqdWqsX+QLD7kAZDER1opYHKzXfkIgNmLL34NyGBtVC
 /Ce0DhdcyqdQM3WuxjVmo4XE2mDVArYHt6vTrsPyiPEN4LSZv5UGq1AiQyLGBl6Nu/vRQEJGWv
 jZQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:52:25 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8PN3R6Dz1VSkZ
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:52:24 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621144; x=1644213145; bh=iNA079K
 e2Q+2QM782aixO26oTHxyoJfcisdS2ti+t1k=; b=cdrNL+PhdzMopq4zqo+cdvX
 2HzxH8v7Hm5tVAgBQvd5dW9NUvpHM1cDqmdj3hTFz7+AyjYBI/yCKVFJj/T+tRNC
 T9rEaKBOlZLe1UOr90DIGcRlwIALyGqSBNY1V6FlpeWJt1U4j/M0uRuIxuX+qzVo
 +Pyf6Du4wXCM9n1CWYbQ/N6IfOxAoUIzfRFhLNDJ/RDszaJTA4lRga8GQPOXr0kK
 Y+ymoH3Palt2Wp9JrXj9/8LMD87oeB9mnkpfnl5ly14lHZfXiTALAoX+zh9NzOrB
 h832fIrjPFUxIoRwLWU0IOphiPWJT3Bm8lCmG7fX52a+QqELBaJJEj6icgAV0/Q=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 3Nn-76EWMW-x for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:52:24 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8PJ2HDYz1VSkW;
 Fri,  7 Jan 2022 21:52:19 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 18/37] exec/memop: Adding signed quad and octo defines
Date: Sat,  8 Jan 2022 15:50:29 +1000
Message-Id: <20220108055048.3512645-19-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
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

From: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes=
.fr>

Adding defines to handle signed 64-bit and unsigned 128-bit quantities in
memory accesses.

Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220106210108.138226-3-frederic.petrot@univ-grenoble-alpes.f=
r
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/exec/memop.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index 72c2f0ff3d..2a885f3917 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -86,28 +86,35 @@ typedef enum MemOp {
     MO_UW    =3D MO_16,
     MO_UL    =3D MO_32,
     MO_UQ    =3D MO_64,
+    MO_UO    =3D MO_128,
     MO_SB    =3D MO_SIGN | MO_8,
     MO_SW    =3D MO_SIGN | MO_16,
     MO_SL    =3D MO_SIGN | MO_32,
+    MO_SQ    =3D MO_SIGN | MO_64,
+    MO_SO    =3D MO_SIGN | MO_128,
=20
     MO_LEUW  =3D MO_LE | MO_UW,
     MO_LEUL  =3D MO_LE | MO_UL,
     MO_LEUQ  =3D MO_LE | MO_UQ,
     MO_LESW  =3D MO_LE | MO_SW,
     MO_LESL  =3D MO_LE | MO_SL,
+    MO_LESQ  =3D MO_LE | MO_SQ,
=20
     MO_BEUW  =3D MO_BE | MO_UW,
     MO_BEUL  =3D MO_BE | MO_UL,
     MO_BEUQ  =3D MO_BE | MO_UQ,
     MO_BESW  =3D MO_BE | MO_SW,
     MO_BESL  =3D MO_BE | MO_SL,
+    MO_BESQ  =3D MO_BE | MO_SQ,
=20
 #ifdef NEED_CPU_H
     MO_TEUW  =3D MO_TE | MO_UW,
     MO_TEUL  =3D MO_TE | MO_UL,
     MO_TEUQ  =3D MO_TE | MO_UQ,
+    MO_TEUO  =3D MO_TE | MO_UO,
     MO_TESW  =3D MO_TE | MO_SW,
     MO_TESL  =3D MO_TE | MO_SL,
+    MO_TESQ  =3D MO_TE | MO_SQ,
 #endif
=20
     MO_SSIZE =3D MO_SIZE | MO_SIGN,
--=20
2.31.1


