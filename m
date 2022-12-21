Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11CD65391E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:55:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87oL-0003cq-Ak; Wed, 21 Dec 2022 17:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87oJ-0003YZ-3B
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:39 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87oH-0000bQ-Dn
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662617; x=1703198617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FyJflZSfGCFJuxVWGryLkKV05Gzhy7oKc/Efd3wNjjA=;
 b=T9ViMiQfiK9lWkKIuKFPYWWb2bwIXY+hMrqbSveETNoMTmi9OaxERVXg
 zVN7+0jsvXwqTZeXQe7I1Iv6YSvT0u0rRHq4ipksdrIKsOrf/VtiJw8Bd
 XY3rP8tqJZcjauaVT+Zxl8/fEG/ed3Yq9ZUE5Kyh39SopQ2OCls15NETa
 /WY6oal+gqtllo/OLQUruGfCdbDQkMoXgqDUWz0zbWgB5I7MKXIoIALmV
 Rax8SBusqQwHcenM7mLQ3VscX3IPrINDY6ut+FwQU+Tw+z52AbBb4+Fxb
 1jk5UBoWzfIcDVS3fvZPwL1cchd0XnIDZHjmbNX0Tz5ObvKBOZ0Fo5Xd/ A==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561489"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:42:05 +0800
IronPort-SDR: WeamRv+2ZHegfcbh9VCiU0JDK8sc851ENBjERbeAKplIeQdGNvie8Fp22kARGMzWXNXo6nu3My
 07eLn3zzLitluf8MsQfcdjJJzoPy2r1XDnslFS6SSRhUd+tZM5qaA8HDCLKoxA8zYGM7tHLibF
 e8TBbCHThCugD9P2ROrFD2IODONn1kabVQYaxPXFIeulwQ+7nc1bJ/zgChW5jNCQuTrjoSzCuk
 ixlEwSPfd5BZINWeUmTTWMYeM5kTxkmsO/yeRlsvKSc3OrUOiq6NZAD9fl02406z6p120h4GXR
 vYg=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:54:34 -0800
IronPort-SDR: LHH1GbZjP9Pq++noQZQ4Z3VSVjH3pZcfg88vG17pvoDC6z83wBV/xztiVcWJDGjMwcWZkjg0lG
 B7fooN4mH3f9N6u+bycIozJotuKCe9INllboMcRqItNb2J6H9DAbpDyvAw4u7uTP+7XuqKQ/61
 5ClFCxRVZWD5Av9E7Mfb9Zr9e8XuRETHIY08X0WbtiUd1SE3TuDlRIdzwcADBoad6GYiA987Xb
 9GTMldCiLi6YLHLFtGz6x4UWmhFwoadScuVFVoFPVyXthepaOQW1HbgBOef4i/aMIXHv6OtTnh
 Mb0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:42:05 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpNF2M4gz1Rwrq
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:42:05 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662524; x=1674254525; bh=FyJflZSfGCFJuxVWGr
 yLkKV05Gzhy7oKc/Efd3wNjjA=; b=JCSlWfjQr1W/9UmtvT+XmqP1sUfxj8dvMj
 MimHdmjW/pLYOrm1QHhzYaTwMoUnU+U048+rRIhljI8+xh9MFmB6bzngnU1p4y7A
 tyT8WU0GA6zdDsyDXzUVzV7rscqowmhFYzYwsmydKBG8vY/lOpUzcO3UQyynJ3Bh
 mCBOkJt9srCyBxJXjfuWhlkl5WzQ8PTNK83YL/fNbTpxGWlljlCL5E7x2cqtx+H/
 oFv8/ilBdJEXQ9ywUwHw1O360YqLjhGpGABmSaR26RHbNhNloaEVGJmXBccMolb8
 XDn2oNOYbf1RvOZBAWvXSUImGC6wuPlb2+ghRNTPUZ1DKV2gttlA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id o_-JkTZ-MLG7 for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:42:04 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpNB4JT2z1RvTp;
 Wed, 21 Dec 2022 14:42:02 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 44/45] hw/riscv: opentitan: Drop "hartid-base" and
 "priority-base" initialization
Date: Thu, 22 Dec 2022 08:40:21 +1000
Message-Id: <20221221224022.425831-45-alistair.francis@opensource.wdc.com>
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

"hartid-base" and "priority-base" are zero by default. There is no
need to initialize them to zero again.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-15-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/opentitan.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 78f895d773..85ffdac5be 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -173,10 +173,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *de=
v_soc, Error **errp)
=20
     /* PLIC */
     qdev_prop_set_string(DEVICE(&s->plic), "hart-config", "M");
-    qdev_prop_set_uint32(DEVICE(&s->plic), "hartid-base", 0);
     qdev_prop_set_uint32(DEVICE(&s->plic), "num-sources", 180);
     qdev_prop_set_uint32(DEVICE(&s->plic), "num-priorities", 3);
-    qdev_prop_set_uint32(DEVICE(&s->plic), "priority-base", 0x00);
     qdev_prop_set_uint32(DEVICE(&s->plic), "pending-base", 0x1000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "enable-base", 0x2000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 32);
--=20
2.38.1


