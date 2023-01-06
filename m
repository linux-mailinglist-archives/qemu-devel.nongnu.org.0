Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B720A65FA3F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:29:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdEm-0003RG-PT; Thu, 05 Jan 2023 22:17:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdDU-0002qE-6F
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:16:26 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdDP-0008VI-E6
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:16:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974979; x=1704510979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3c8sKkXAI80VSp6+fbqfjeruwp6G6rD4RbAaX1gI1/U=;
 b=YfJipVo9PWM/+03tTidnbICuo34w2SPIrvnGmTQSncacm5vI6WcDSXrA
 hHkrLBDqNDBnBG5Is9RqOGWpFQqcAe+64DTnN9OIbjQFJ7f7QDCpCGQ+w
 UY/XB8DA122t9u0JVBW/8Cxx6zp1gxCYpdqa46wnuvC1C1KVPGhO6mfsJ
 d+zlR+m4W9m2AbaRrNGP95Dsg8sUeEgorGEpKm7rHGnAx0klI/MfziBDy
 xXxelsrhayIEzj1DAjJy4rYJ0RMZ++YhOrS+Jg8Jik65x1uKVPlSFa3oz
 od9la3QYf+4tuauKVvwSjdS56kdZfuU40TNNNT3E5vg5u91wgLFBPDht/ w==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254842"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:15:12 +0800
IronPort-SDR: Jamql/eEsnxeMHXTTzUjQ1XydmPgrbR3vDftW8A8JBwbPwmVfodLaQWiunzdS1rLLMZWqoKOk9
 lw96D3Mm5aF3Kc+SfSRudyKDPJOmgabiLDknI5ywbNJ+rrujYK9MQKwlZn7A3n/ii9xAS4CLG7
 Dqb6o/qoEXfamkLnBMyFURG547QgotCqYMWCnMsQkP6Xzemzlv7Z4jrWKC28iHyT78qFmaH4n5
 o5sWkc/hUs29gUQjlX1825X+MRjCWQpSoq8WX8Lc4AEXj9dyb7FemJK244+2xc5c1YWYc/bFSb
 XaI=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:27:23 -0800
IronPort-SDR: LPHs7Y8oylEaY0lJKijc0RYlFJEwkoFHZV7wzTz8k4/byDUqEkzMLM5+GOoWdWwqCGyJ4yaCU5
 GiolRadxtG33LuDdnIUPMwqMutGKl+K1YdrF4AefU3cmtAqenNiZGXS2oxEz5ulxPh1X/v9CsK
 m01CYcN2eLqrB/vBWSlVoaL6U5P8jENzVehDpPh6Sf28hO75I+fYTshXRu1Zpu+fj4k3jeR9oF
 6cReVXn8b6BNohbYOK6aOpFJ3jPShq7yHhBF+4i/gXjtJkgdHhCiY+HgLSIY1YhKB7/tQtzSII
 SM4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:15:13 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7kS0rs8z1RwqL
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:15:12 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974911; x=1675566912; bh=3c8sKkXAI80VSp6+fb
 qfjeruwp6G6rD4RbAaX1gI1/U=; b=nnxeMMHy6HKiwnS9VVHojxqyBner+3vIcc
 8K+YLPT2oVQbGxlkwATUgOpQY2MrAlMt1/aLeqZFZCioWzgSMtITTsh4QjhVW/sQ
 tPqFQEL7Q+1EAgdpeMIcxD9OjZHGW0syI7OQ8oHFYDHuKT6GCqHgy9M2oTIrqEIn
 YeJApsNf53/oEVJ3IfNrEFD1eKMEQVgi79vruxf/JOOtykZyMeK9d6e+U36ViCxn
 xwZLbR8uwO+NlmXAX+k6H77bPevgtLPebbRH+WLCHR2qJMCL2liGbccqpGi5Jr44
 gHxVXLEGF/PwcXOM1TqbJwVtmPaI8PJTU7arA1qVMpECDkYhuniw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id JAb2J2nwzHTo for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:15:11 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7kQ1ZK1z1RvLy;
 Thu,  5 Jan 2023 19:15:10 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 38/43] hw/riscv: sifive_e: Fix the number of interrupt
 sources of PLIC
Date: Fri,  6 Jan 2023 13:13:52 +1000
Message-Id: <20230106031357.777790-39-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
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
2.39.0


