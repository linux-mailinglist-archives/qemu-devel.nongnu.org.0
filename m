Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F114378C0
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 16:08:55 +0200 (CEST)
Received: from localhost ([::1]:34282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdvE6-0008Hz-5c
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 10:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdunN-00035R-CM
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:41:17 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:39739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdunL-0001jp-5m
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:41:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634910074; x=1666446074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qBaB/YIUyNKJ3Gukdg5PeIIi3JOIfMFicRvc0MZlu/s=;
 b=gfe0LDFiDdAgH1CO2SyO2AecANQ281zXoKax1hay373Y0PM7zrXGvck6
 kjDwXk9fN3LzuvuIwqt9FM1r1Lt+Tz4iEU2lq+Z50rYrp58WD5AgpIG+N
 vtUfc2G6bnuL9LgyKfhd9medpMJLZrbs/E2if84jJNm4VqRoIOIRhyjl3
 1DfnMvU509E8bW1Nu9wRM8iJ90av+lOr6t1XjuQgdBZpJvuistsUghj+X
 gNoXMmCdAMaUbzWxBRuC39y38gcksMPMsj3qXCkvxSFokd9x7SB5Cy9vy
 Mp2W6yAW/vTO4UHqv4X30X/VjQwqKH7IxJGaKO/+jbKZpGbN6gqTnTtgY g==;
X-IronPort-AV: E=Sophos;i="5.87,173,1631548800"; d="scan'208";a="183617917"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:40:54 +0800
IronPort-SDR: WaCnUH2hTmLLKigpgIA6hbXdiESqM+DxkSgerdFRlu0qj2WZMkvsnx5o6AGyyq33zsn3qbVX3X
 BZBKAHR6YgePL/ZggGE0sLo7AEb02TTvlZGK3Ip/tKP9lQugYMrAAEpz47FAcYXT6ixTIRKz44
 A2QqPfAw/fpE0+prOMC5skwa87XjnRQjqOwkss/HRZZl1Eax4z60kRezeNWicK/QJAtyFpgUpX
 9zFWaWGCJ4xz9uFCHYR5ieBJKTc6okc/Y7+oVC4dag8iT4iGnZx8oQf91C+lg7EmZXyq7+rcTH
 b+5FkNdikWDkWguIDgH06xdE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:16:29 -0700
IronPort-SDR: Cax6qIpEQZii2wsXh0LJg7ilyjtjSBL+iR7j6ku4zfEbr6qa2b0qvoEdYbM4B3ZhlssV/PhlFE
 rs08wEW1BNJa77nak9Qm2cWorqtrBz6deLdFxy852+E2h0qf4Tf+fdgZBgGUkIjvyhXR5YPd5o
 TwyJOMvDTCo8KZ4OtEMeoV6kULKdOItzbkemHF9E9l7C/z0DhHa/D30O7cbtzkR35povbBf18l
 kXg03hiYLGpOleqp7YiYc9meSCd/SLOona0E8zcExE0AvsS61prxXKUJtFx53sk/PX8qUIgGbC
 3tY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:40:55 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQTy51mVz1RtVm
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:40:54 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634910054; x=1637502055; bh=qBaB/YIUyNKJ3Gukdg
 5PeIIi3JOIfMFicRvc0MZlu/s=; b=LnJ5wxQDE/dfWLiyvI6UKZ/sXM0QBKfWzm
 pLajWdWUOak0F3TTrbUd98S2dr1StKWgK04Z2wDSe6zVTzM/uPsrWKKslan+i5uy
 GUtY4+belQc9YVKq917xIC+ikSQUiaO4QjxpTRYaleIBY1/IMttwSlRMZp74pBlI
 QOhXBaS8TWttYdm65emMR/47kapBT7qX0b4TOr/v6nEvFXekOkFgv5r7kGY7abgH
 oG2kp6vtiv/fx0v18QTUirO8c0BW99krUB6YcMAxRWBU4vnoQTAxbQJYxr4syZhh
 Xj+s3iNDtQrU829y4dhcWGTuxoR2sat6H0pY6ky3dwpU4KRXzTPQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 39F8PtUzVytz for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:40:54 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQTt6Z62z1RtVl;
 Fri, 22 Oct 2021 06:40:50 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 27/33] hw/intc: sifive_plic: Cleanup the irq_request function
Date: Fri, 22 Oct 2021 23:38:06 +1000
Message-Id: <20211022133812.3972903-28-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 4200da222a65c89ed1ba35f754dcca7fdd9f08d6.1634524691.git.alist=
air.francis@wdc.com
---
 hw/intc/sifive_plic.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index d77a5ced23..877e76877c 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -412,12 +412,10 @@ static void parse_hart_config(SiFivePLICState *plic=
)
=20
 static void sifive_plic_irq_request(void *opaque, int irq, int level)
 {
-    SiFivePLICState *plic =3D opaque;
-    if (RISCV_DEBUG_PLIC) {
-        qemu_log("sifive_plic_irq_request: irq=3D%d level=3D%d\n", irq, =
level);
-    }
-    sifive_plic_set_pending(plic, irq, level > 0);
-    sifive_plic_update(plic);
+    SiFivePLICState *s =3D opaque;
+
+    sifive_plic_set_pending(s, irq, level > 0);
+    sifive_plic_update(s);
 }
=20
 static void sifive_plic_realize(DeviceState *dev, Error **errp)
--=20
2.31.1


