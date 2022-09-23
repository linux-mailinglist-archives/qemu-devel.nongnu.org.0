Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F407A5E72BC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 06:14:43 +0200 (CEST)
Received: from localhost ([::1]:47374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oba5L-00057A-3G
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 00:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyI-0001WS-Br
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:26 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:63921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyF-0005XX-Gc
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663906043; x=1695442043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+KWxvID8/ZnnAhqL8VNp6KtA1Zxp1j2XC5T17FxQj4c=;
 b=QhMWS4u0hnhnHMn57IhG354L8UtHH/tjyhxDNwOL7DClNmQgSUNsDQSZ
 TCdfvrewX1Tg2bhZfZiBay06puHrw/or6N7OKYbi7qBIBiJJnyyxGq5ig
 zDxnpU6hAEjH708rXCcIJrFF24vLrUW0uusNtd1ZKQtWus8URbX2H4HLJ
 8rezaysHeMSJFR1xhu93oIFJD6e9kHZg5ZMLpCkR5zjTfbrZ5SxJJKWEK
 BmwjePmnnwVwHUu6OWxx5V6jFpKwhVM4Jo/Z50gyp/+ryj1CytAXcowTc
 yOY2kpXQVTctqfg7mvwXE4Rb9utu1pqVUJVOwQ6A1vZL4N8Up9lhrTrMf w==;
X-IronPort-AV: E=Sophos;i="5.93,337,1654531200"; d="scan'208";a="212510454"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Sep 2022 12:07:22 +0800
IronPort-SDR: pS0iaDT9o6THNBngfrr2C4ktGnnm1p0Uhhc7pCuzrQW9mwH8DTu3G9vdrOAbU/655guBNEoUnf
 FKK/4WVrSfpJRV+ajYdiGJlG0VfhKs+CjI/qiApNbSVwET/PTb7tbqq669q3cI0Ml/eYxacX5x
 zScmc7btg2++Ah3kP4pSrxe8o4D2X46TuwxvjQWx/pnEuZq2DCwHPoc2qbFo57W+viRwknno1M
 NRxohZ71PzP6ct75vZQfpXQnGQ8U8pMxRKaSaV7U+5gPlob/yzoabwpbZz2j39ni0TmbgMgAJ7
 W5SUhovZsDNFkwsdaplS5Rlk
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 20:27:25 -0700
IronPort-SDR: 1gTktriovkCMjb5cn4dUMWmQ1Eyq3bUH10PqC7gJ1JsRLwrtIKzzP1mX/z2C7fjiGwVDSw7Cmm
 AFzHFrEu9Xx4qNjiKWmAHjZwPiAtSEAZmOolOIZx1R7pso/w2DCoA8Q+to5sEgCl5JIvbEvk5D
 mir+oFa9HFSTITlxuw4rKI+0UimHr+RxXvFMg3lNuuU+U3pTQiZPLvNIKpT1KSu7zO+LcjGIKN
 PsoGgD9NsA2w76L0BKVmikbW+jIXJj4MZDQnN+P6SMvnPBd4sSHMiV0IyoLIm7SpuLnTi293ON
 p6s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 21:07:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MYds61jwpz1Rwrq
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 21:07:22 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1663906041; x=1666498042; bh=+KWxvID8/ZnnAhqL8V
 Np6KtA1Zxp1j2XC5T17FxQj4c=; b=UGx2SVdf+PILSNIk+Lb12PetBFSpwqUjIK
 23Ur3ODryfIeHJqXCE5i14u1TlxvQYBKipWCocViTWUsDxxdSr11fKBCimfMHsI9
 uEjcTQFd5sTs0fC4ZixJ7Ic302OrS2QNNoPsdxNjHkhZtoDeZxAfppZzfJSu10oG
 ENeJD6Rx8lm2g4dL+psgtl+eSj8JCAPo3f/iR1jZsbyTVmEbqYiviowVSbXdSGYo
 yVRRQD8HafgAiDsAqQ88b367cKdXa2CjF92S/+fcUmwq2aP++3a6pzew21a4h4ki
 PJtEh3EETQJH6WMEqiK6szvJsBXoutFlH0ryw9lWw23f+CDAx2sg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id AuOEe3bffjn3 for <qemu-devel@nongnu.org>;
 Thu, 22 Sep 2022 21:07:21 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MYds40Jkvz1RvTp;
 Thu, 22 Sep 2022 21:07:19 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Rahul Pathak <rpathak@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 04/12] target/riscv: Remove sideleg and sedeleg
Date: Fri, 23 Sep 2022 14:06:56 +1000
Message-Id: <20220923040704.428285-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
References: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=2580c328f=alistair.francis@opensource.wdc.com;
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

From: Rahul Pathak <rpathak@ventanamicro.com>

sideleg and sedeleg csrs are not part of riscv isa spec
anymore, these csrs were part of N extension which
is removed from the riscv isa specification.

These commits removed all traces of these csrs from
riscv spec (https://github.com/riscv/riscv-isa-manual) -

commit f8d27f805b65 ("Remove or downgrade more references to N extension =
(#674)")
commit b6cade07034d ("Remove N extension chapter for now")

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220824145255.400040-1-rpathak@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 2 --
 disas/riscv.c           | 2 --
 2 files changed, 4 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7be12cac2e..b762807e4e 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -190,8 +190,6 @@
=20
 /* Supervisor Trap Setup */
 #define CSR_SSTATUS         0x100
-#define CSR_SEDELEG         0x102
-#define CSR_SIDELEG         0x103
 #define CSR_SIE             0x104
 #define CSR_STVEC           0x105
 #define CSR_SCOUNTEREN      0x106
diff --git a/disas/riscv.c b/disas/riscv.c
index 489c2ae5e8..f107d94c4c 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1304,8 +1304,6 @@ static const char *csr_name(int csrno)
     case 0x0043: return "utval";
     case 0x0044: return "uip";
     case 0x0100: return "sstatus";
-    case 0x0102: return "sedeleg";
-    case 0x0103: return "sideleg";
     case 0x0104: return "sie";
     case 0x0105: return "stvec";
     case 0x0106: return "scounteren";
--=20
2.37.3


