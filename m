Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D1D6538ED
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:43:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87mY-0008NC-N5; Wed, 21 Dec 2022 17:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mW-0008I6-0K
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:48 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mU-0000bf-8N
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662505; x=1703198505;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o8dl9X7n0QpbDK6OlU8v1kgM0gsCxofq6AuWFPs0GJo=;
 b=SeeMuvry/YMtARIT5j5eLMYzKBWaeSkwtUCpxDGql9V8Lvtd80h0CQgC
 pCjxx9ivh38dKbLFsL0dhe4jiC7l/S2ZNAEHOYeDIeReB/J+eIOZtVpJV
 gt7e+5/+5C6kax+oxcSoJbWclL9mwWagz+UP8dAgoSkupzxfkXVx58M0y
 hQt9mnCZ0NdR+woUS0GtMMr3bdlU5y2Q4Oy5cgYzwcqAunc1me4vEB/c3
 Gwj0oh3VI/EJNlb82+i5nyUpSzjFkPxA2B5HE0idhZj+8lEZ8PbUxBv4V
 f8YYqfUavbqOBg4ir7+LvgupH9eK3vKJdq0E3fZvYJkQEvv9DWKloeNAk A==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561359"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:10 +0800
IronPort-SDR: xBZV9oLqiiOkT8+4WksH4ywyM4DxsWIV/5KtP0PDDU2AkpodgdJ3BmVpXs/FZI52HCYYBiknex
 px3DTs84+dKrytkQTfMqkzWXE6TWkiywA9OYEXInsl9gr1nH+8e2E97knxRfhiJuSd97ZKu5OA
 hRk1fjeIvWIlEiWugJpeTsuUCX8/Ni3XArAdz84A3ywwlA/Pj2pJXEF9zcfFUVVxZm1zBiVVV/
 amB7uorouMljGG6XVr2auZbG5eDe6MJQP9rlHIZ56nk1nVSMfcxcEuE1NIHbfOeayIxNojJBDM
 Dhc=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:39 -0800
IronPort-SDR: w41Dg3wU/z6FasqicUy8JZPnIqgodtFDB8fEhMGhaR+6pi9OiiZurmnDgo6GXsDDorkElCs2LS
 QQES1I02EaMclqgkw/6voUCug6lqBYU6EEb9jlacO997Otm5Ei03HOIuIkp1lW0bSJy53YsP/U
 5xE5oEIB6wjElhiez3sjN6OCChntzEdVd02jEZjQeKM79hTBuchTEXfSMIge3+hfsA+in4HjGE
 DsH1BKWIRKxZ3xOx/5Ga611Veld2G4zFhmr166ImJyGf4aH7zLkAk8GtmB/ewFaaD0xWWNZQTp
 u04=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:11 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpMB62Pnz1RvLy
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:10 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662470; x=1674254471; bh=o8dl9X7n0QpbDK6OlU
 8v1kgM0gsCxofq6AuWFPs0GJo=; b=Uqe726wgOJP2rEp1lo3zqhGEoaU7ot5KFp
 NkncKSWFY8rz+h9A6miou/VULtWsJb0gxjYGdSRHgvhOylTOkSSZwycf+XnsgkQ4
 YLvq//TrmuZHyD3VaZ0LREl+ZPVGK6ifwkEzAIx5IKaiyPVNw3bA1Pc/o5X1npJb
 2HXTmKYEIsnzBktwONscZh0QRhgUzlsPUxR1tBtgmeqD5ewPIzPZZVVayC4W+Q8t
 wtiSFbjcKYaaXQ6dRhZXTgTcj4lxBysd8bm4mggv0DPu+PRHlDZuBobL+rbW/YiU
 USMTItvGXyhi21BG6/0/VOhZJJpQh2syj/kKhKdRPJC6Lm6+H+og==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id cMZ3jEi052Mb for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:10 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpM92Bk3z1Rwrq;
 Wed, 21 Dec 2022 14:41:09 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 20/45] target/riscv: Add some comments for sstatus CSR in
 riscv_cpu_dump_state()
Date: Thu, 22 Dec 2022 08:39:57 +1000
Message-Id: <20221221224022.425831-21-alistair.francis@opensource.wdc.com>
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

sstatus register dump is currently missing in riscv_cpu_dump_state().
As sstatus is a copy of mstatus, which is described in the priv spec,
it seems redundant to print the same information twice.

Add some comments for this to let people know this is intentional.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221125050354.3166023-1-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6fe176e483..b2c132e269 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -382,6 +382,10 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE =
*f, int flags)
             CSR_MHARTID,
             CSR_MSTATUS,
             CSR_MSTATUSH,
+            /*
+             * CSR_SSTATUS is intentionally omitted here as its value
+             * can be figured out by looking at CSR_MSTATUS
+             */
             CSR_HSTATUS,
             CSR_VSSTATUS,
             CSR_MIP,
--=20
2.38.1


