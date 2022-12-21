Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB931653922
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:56:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87oE-0003MV-Kk; Wed, 21 Dec 2022 17:43:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87o5-0003FG-VE
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:26 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87o3-0000bf-Kw
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662603; x=1703198603;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RignxIYbKCPHxUnIhIqB+bDCTC2InNMQAhk2vcktKns=;
 b=dtA6JLN+puNEw1iyGv5Sfhl7C51FMh8re3LD9aX0Z0D/hUs93nHWEWkE
 yz9SXdr6KJuNnUhSKJlsXenIYruMZtwFeRcZNLfiun+U0ZNbCApYxbHtg
 9nE1TfgIc2j+sfqQDNwgXcp33oWyu6+wDbM8HxuBYQG1hCY++MhNVe28s
 hp/5q02gbrjl6GihdYGf8d8aOsDOCJZbHqQQtqXJfrpgUZiPcZ/QLRC97
 u0HJ5JgQxiMgqDIxUZh32hY3676RSOGsvp0uCxUG/xdiY+2MLNnhqiDFR
 K2ZWtSQozzPJCIXx4PVQym++uJ2smpPPtW46vrZrJu3opnry1ZHrm2jht Q==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561463"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:54 +0800
IronPort-SDR: yc7WDHUB8mYcjBvl/buc0nQttWwpYg26EUBTD7Kvl+QRvqpZJGhhEgbnt1+6Y92XhjEFVuSSpi
 DdSzWlbCwocK0WLmY0qvuq+5kvPfL6pD/objkmUFV+NwYLwFboZyRGP9lRVzDPu1L1wzPvFb8K
 tR5qEwuGfsqfib7RO1kZmFkNOBylLvwfhh7DTu/+GiDsKQ6t0RUfOvcHj3igIorf+/lCJJsEl4
 hVd3vGO31qLuKJkRMl+QRcHDmI1ko/MJv49g1iIlAz/SxpMJjQdS3bbUqtbDB0ooa6j7TrPCdY
 wx0=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:54:23 -0800
IronPort-SDR: 3BmY6GyVImqwGwBAsGMl+nWsB6OWhjLrBOXWj+IjvVQxr3XnEPDMh2NnP1GjAM7Nwzx4qWUEux
 RgyuoyUBkKnkFAOFmZwj2MoMXmCI13ofpeBg5ROCz17alARdfxxsRQk6Lb+fEjzCFHTYdAmfPL
 CaxsgIINUuSeo4BeBzZhoFjC6ih39gfb2uCsJ11if1BbZ3XBC0PbwRPFUsY4pfhl7mH5Lb380w
 xBD/WzbXbdH1YTROe5+VEXWGwzSUNPu+qWDd3dUUWMY93c/6vbY7+cmFSK+Qh7LnIDmNthMe0b
 lcM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:55 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpN25C70z1RvTr
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:54 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662514; x=1674254515; bh=RignxIYbKCPHxUnIhI
 qB+bDCTC2InNMQAhk2vcktKns=; b=nYFLLVdk44ihmkKisefJU4LOOibfLaCvZZ
 hJaDu3ma5BeVezzVAA/8X6WERvtaKItBROyGrVuvawiXoXlxxMTElCTmJ0Dg6Cr2
 z9NT2nPeovpFFuYhMPueP6Q79+eDQDZbEiJabqGvhQk9A1ZkIxAsbLt77njKYq32
 EnR+EW6cEi9PRd16CyP3zLs7BwPHdVEUDPduZk5RdvKxG49azKogYXvcs/XsjYea
 4WbflW3uA8N+IRGzNnGxjUV37sM34ar/faIxay7Bgzfy9096QI5JuvuhC7w4QG/e
 Yw89zL8n+GaU9tfCXy3Gj8x22WZSbBLVn7edUrpeXJPS4mr9zJyw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id kE8tCdMBm5oM for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:54 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpMz5n08z1RvLy;
 Wed, 21 Dec 2022 14:41:51 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 40/45] hw/riscv: sifive_e: Fix the number of interrupt
 sources of PLIC
Date: Thu, 22 Dec 2022 08:40:17 +1000
Message-Id: <20221221224022.425831-41-alistair.francis@opensource.wdc.com>
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

From: Bin Meng <bmeng@tinylab.org>

Per chapter 10 in Freedom E310 manuals [1][2][3], E310 G002 and G003
supports 52 interrupt sources while G000 supports 51 interrupt sources.

We use the value of G002 and G003, so it is 53 (including source 0).

[1] G000 manual:
https://sifive.cdn.prismic.io/sifive/4faf3e34-4a42-4c2f-be9e-c77baa4928c7=
_fe310-g000-manual-v3p2.pdf

[2] G002 manual:
https://sifive.cdn.prismic.io/sifive/034760b5-ac6a-4b1c-911c-f4148bb2c4a5=
_fe310-g002-v1p5.pdf

[3] G003 manual:
https://sifive.cdn.prismic.io/sifive/3af39c59-6498-471e-9dab-5355a0d539eb=
_fe310-g003-manual.pdf

Fixes: eb637edb1241 ("SiFive Freedom E Series RISC-V Machine")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-11-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/sifive_e.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index d738745925..9e58247fd8 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -82,7 +82,12 @@ enum {
 };
=20
 #define SIFIVE_E_PLIC_HART_CONFIG "M"
-#define SIFIVE_E_PLIC_NUM_SOURCES 127
+/*
+ * Freedom E310 G002 and G003 supports 52 interrupt sources while
+ * Freedom E310 G000 supports 51 interrupt sources. We use the value
+ * of G002 and G003, so it is 53 (including interrupt source 0).
+ */
+#define SIFIVE_E_PLIC_NUM_SOURCES 53
 #define SIFIVE_E_PLIC_NUM_PRIORITIES 7
 #define SIFIVE_E_PLIC_PRIORITY_BASE 0x04
 #define SIFIVE_E_PLIC_PENDING_BASE 0x1000
--=20
2.38.1


