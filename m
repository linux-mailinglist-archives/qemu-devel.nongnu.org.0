Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4314750ACF5
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:50:54 +0200 (CEST)
Received: from localhost ([::1]:49284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhVd-0002Nh-B7
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJQ-0007kG-58
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:16 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJO-0005V8-CL
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587894; x=1682123894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iEoKxEagVtDboj6y1cxqsma5Bz1Cu3f9t3vEDTHmk50=;
 b=qjjCMMVP10vgqXIjANSBDZcBsCyqtI7RGlDGN8XBLaSZBdXSqdXRcSYv
 5PyhQizZ6KgdCFSaCJS30L2JUeh1dFibBNXJs3+0VTPvlIql5Mq3h/aHn
 HSPDLJXzOg1/GtYTIsUztTSEKhB6Ty9hF+dSS5i9Zl1iWyy+YVmldTHoe
 YTNAYdFskwoF1k+ZYpcW/FBzbycpqYmOkMYnR15hTLutm06eAWmPdRkJn
 vCB9esnnYWT8B9dmwxpsDdukCPxsC57gwhbXjV8SXVM6z8s02wnU+92zg
 6kbxVj6lCoup2zr99MYrqTCFfwaLBqFMhTOcJP7aUDo3Jg+7zgEspPhEE A==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="310483410"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:38:13 +0800
IronPort-SDR: uB7wE1Duho+8PeSPIPm9O+TAwupgL08Ff8ijl0GEdkziwAZt4Ksr7gle1yUZyfGzWtb2U/Zpni
 DBRrcoEAvV2MymeXDBII1i/nKjDvlbu8CaN4oR15+NgAKjq44Eb6cgO8cAAnbDdUTPWHjcBvqA
 dD1AuVTBmN8isLQVb3aQCKvtkG4qblukdE9gNJsqijxZfv696XRNvzmCBDeD2Tesdl+ROb5MY4
 nqZHprLarmsUvnFZVzM6S2gyecgBIOQ70DM8Pz7SzIb2hQ1V2PPW/BQsHLXh5/djP7I1d44VCZ
 IM0GTG4jmhh6wcdfeGAG0P4+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:08:30 -0700
IronPort-SDR: hv5Xk+GUdKsIgRJYlAXCgc8mEcrEjWS1rPuR7eKLqKa+DGSZ1Zm0Yfs6uGBLAIU/qJrZrs8ZkP
 xckWN8pW1MXIK3WWwEO7S4C6ifAdoEsXEErcl6qlYsHdsJVU+zd4p0CmX6qDXS+gIZmC8fMcvd
 O3JDNMo7RewRFtWGfMKHHn4BDFTVHZWrT1a12Xe1Q3OOa3K8958J5e2dAZEi5km1Z5eaX8oWzb
 NnED4pNiF/66IFAjHGZqw/wx9eG9atY/FjEHtU9WRJloio5tpcr1FlJTtTsockB+neRb2tdEmW
 fFc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:38:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwVs2Kkzz1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:38:13 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587892; x=1653179893; bh=iEoKxEagVtDboj6y1c
 xqsma5Bz1Cu3f9t3vEDTHmk50=; b=Hj78LIYkLsodSBhlynbeKiTw0ZXDFde4Rr
 kp6GhUEYyrXj8ovrvnfo8lPSKliOxSjdbD+uKXs+95JAThT0iY5PUfMDW93RWsBF
 4pyWOTPnBYxzLJ0r4FYTouEW/9HDFJgL1Y5+0B6mR/Sjg9FGXdBrJZsVJy8lc681
 RFdj61eVZjwQJOZdbuCzzkE0ubjVXmmeGzVNa9pY+K7b5UnAxh6kJ3MHUZr1OM1t
 OyCcaRUmzLJa6DPGjxTGvAtvu5RKdYIbO7S7q1ZQJx+S4Pjqoxfhdv1g/EqQjpPk
 tfDG0shOardJhOcDlHdLZihTmQgz0oIoOQErS9NfVwgce8CEvC0w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id XnHvALWRff0N for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:38:12 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwVp61M0z1Rvlx;
 Thu, 21 Apr 2022 17:38:10 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Nicolas Pitre <nico@fluxnic.net>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 19/31] target/riscv/pmp: fix NAPOT range computation overflow
Date: Fri, 22 Apr 2022 10:36:44 +1000
Message-Id: <20220422003656.1648121-20-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Nicolas Pitre <nico@fluxnic.net>

There is an overflow with the current code where a pmpaddr value of
0x1fffffff is decoded as sa=3D0 and ea=3D0 whereas it should be sa=3D0 an=
d
ea=3D0xffffffff.

Fix that by simplifying the computation. There is in fact no need for
ctz64() nor special case for -1 to achieve proper results.

Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <rq81o86n-17ps-92no-p65o-79o88476266@syhkavp.arg>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/pmp.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 81b61bb65c..151da3fa08 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -141,17 +141,9 @@ static void pmp_decode_napot(target_ulong a, target_=
ulong *sa, target_ulong *ea)
        0111...1111   2^(XLEN+2)-byte NAPOT range
        1111...1111   Reserved
     */
-    if (a =3D=3D -1) {
-        *sa =3D 0u;
-        *ea =3D -1;
-        return;
-    } else {
-        target_ulong t1 =3D ctz64(~a);
-        target_ulong base =3D (a & ~(((target_ulong)1 << t1) - 1)) << 2;
-        target_ulong range =3D ((target_ulong)1 << (t1 + 3)) - 1;
-        *sa =3D base;
-        *ea =3D base + range;
-    }
+    a =3D (a << 2) | 0x3;
+    *sa =3D a & (a + 1);
+    *ea =3D a | (a + 1);
 }
=20
 void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index)
--=20
2.35.1


