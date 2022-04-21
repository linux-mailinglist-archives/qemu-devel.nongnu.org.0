Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E198350990D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:28:01 +0200 (CEST)
Received: from localhost ([::1]:44244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhREP-0004Jz-0v
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSA-0005hv-8L
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:11 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQS7-0007xw-IB
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523087; x=1682059087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iEoKxEagVtDboj6y1cxqsma5Bz1Cu3f9t3vEDTHmk50=;
 b=QIGhrUWGWl6ZHOtFDnaPkJlvjv1qlefD9YqK8HgpDRNVnNuGvcrotHz6
 c7c/zKbFzaKaE5m9bsnKdzDr/COCDsIYMYQ7MBDXJBRYcjsHINBFIN6Y3
 rb2ilPymVCVJnKZ8TsZHwxzo5wFQXvTJsLcm8jIQ4J1Fea8ML0owHkR4h
 LIVoJ2oD17LQI5Ii5Bi3mAaJ1PZM5wkN3hDKwEUeCYCqxSlWiAr0/4PpV
 4rJf1rhP9S3G9yvGki8LtYNTWNafKm9V3Id7oiHAmw9wTzR+YK53/V+xG
 KB2KJdpLMGjPh4ih5LS3QjHN4f2UoxT+dxgVtw+/ZTeoa1BgzJecNpLRY g==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302640005"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:37:44 +0800
IronPort-SDR: EHqDmCofxWj2l2M601AzJ4Fm4m5TLRH/iD5ou9r1Or3dFQc4qwwNKyWEXEzSIbAt1HKl97/EZK
 hWU34MK5njmN7Qr0LgMY6UXCdEbgvi9LUURJXSqe87ml1OVAXo/g1oz2Y7pMRJVQl09qPXI/84
 LqE7uM2Ihmq3c3vm9HnURg1/k/VXZ7DjKEP5tj87QgpxFIJi+wY8OR7sU+5i5CnEMeDrnzv2iY
 eMkOs1tU71Cv+/fgNkkDKynqvJ4FCnChSMlZTVF469r+kzxk1F4gtv7WCSDt6gT5Y49FNMkzn9
 dn/NSSkATDGF7qdsi/pQNE9z
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:08:47 -0700
IronPort-SDR: ImaWAqrgzywzVByMT/Gi6fWndiX30HxLSyD7uQHOyuIAiepwo2j84g+LNfHXlTZZD4KI1omwgi
 YGvCiLyMuDJSan+1A4ZoEXlIiJHM6dBLGNiNHQ4ObqEWeUwUaAffQo8la+Tim5ISOal7/9iUUb
 XeNRtRnqbnzbRc+J4jRe5UTYxZ8UaWQf6y+0D27BJyTe54Jqbe82F8s5bd2Q+g25KwRKZyeHG3
 zq0gwimEdkNo2YKy4pn9l0lnzJbL3ttbkn7XzXIQUQnwv7vmQIs6kucL+Mw5roBWwgiFG2eZxv
 6Cg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:37:45 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSX84XCTz1Rwrw
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:37:44 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523064; x=1653115065; bh=iEoKxEagVtDboj6y1c
 xqsma5Bz1Cu3f9t3vEDTHmk50=; b=hLPLOFB3zlX9jDcmT3qWqo7/v7sURkGBnz
 XuL6Nyl6Iv5o9CEM7N6uajDuQKAgI+lUGouz0meNx6LF2Qfj4ReS+EQxiXZaHqEZ
 S2zfbjkhVBGTARDMKUi8sZ7tCOli8D6bgpFjq+9PVDRIM1nUurqR/9Up+eQp3/ez
 zG7K1jYHRPo6DK9xnkFmVdg7UBbf5aE1x6bh/ygi/fsa9LgU5gr0ZJLGK32M+FLZ
 uKUh4dehBF0Jnyi27nBsHYjOqTApw8SF+jp4QMXnLt/wl8SUMY+3vcQJep4WlYjw
 DkJM4+mWaKUslCyu4XK0FbFsQUr5m38mHLXZxgW4tfJN0w4rlnxw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id KEKi0nHkruMr for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:37:44 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSX63PjPz1Rvlx;
 Wed, 20 Apr 2022 23:37:42 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Nicolas Pitre <nico@fluxnic.net>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 19/31] target/riscv/pmp: fix NAPOT range computation overflow
Date: Thu, 21 Apr 2022 16:36:18 +1000
Message-Id: <20220421063630.1033608-20-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


