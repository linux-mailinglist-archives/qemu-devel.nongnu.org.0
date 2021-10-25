Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A13438DFF
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 06:09:11 +0200 (CEST)
Received: from localhost ([::1]:46460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1merIM-0008Cb-3e
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 00:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9254359e1=alistair.francis@opensource.wdc.com>)
 id 1merGb-0007Qc-3j
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 00:07:21 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:53165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9254359e1=alistair.francis@opensource.wdc.com>)
 id 1merGY-0003zX-W5
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 00:07:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635134838; x=1666670838;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G7htI3MtEAFSj41q9Py1+gLkw7fayjtsx/xaen0p8EY=;
 b=oy1hDgqICAiaukja3cHUgGsMmP/ddWgs54erUOSqAyRBpUiaweOXUqIx
 OEBwe5pupXkTm42HBqOEkp9QfILzcsPzBhH43XhEdpFpfT4qzz7vl1yd7
 cE4iBDQtY7XgP6Pya1QTDw+LsdZ5344O5shqY1ViYAUi72xIL3AlEmRaZ
 ftM2KFN9Y9guS7bstRHJ/+vFirKrf6NUTNYFI4FDVbMHmqql9MiiAVBpQ
 pT+uskmiDpQLQNhd3mZ+i98kczmARF2GLLWLSgULJKbhGpAn/OOd6mV/N
 SFlhRaMiNeFVx0wWTN1xLWaEcaUY6gVE0mZOn290n+EnIKOqx6sDRxm7Q w==;
X-IronPort-AV: E=Sophos;i="5.87,179,1631548800"; d="scan'208";a="182751321"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 Oct 2021 12:07:11 +0800
IronPort-SDR: IOx0hr9RDGZVirfAWmzUyraxyu49iAwQe8zwnqCMeklTyR6Dl5U6tPhuZUKG9cJ4sKcHDVmAem
 X3+ouevX3pdWAr2h0mnXUAmzWcaFsDi/3Sl7B+3kaKwqklIG/8doqwKSK2/QPXhbgrt0xQvwss
 Tj6VaOONDBKCVlxxVGJCnPpI8ZjWcyMwcte9i8F4ZQIlIpUR3SvBmhGwchmN9pZkorJeoxmsNr
 CMF5s3Hakt6pCIwmUDXYnTAyF6HSuPjxhW6aE0vdRmnNrpL4RurmFHsdrUtwfXnHnz7VA/FWKf
 cWcUL8giFHmm0zcPbqvLi/IP
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2021 20:41:10 -0700
IronPort-SDR: X18YVC3FglVNxWDw1WVbuYO70a7Bf6ishlOiiwK2ZfKehZ2GCtv+GfK0K54I8l9bArKlZUZenb
 7+LawLadBorj6ZlWo+EJHmcCAfMwfYgO+AmmpbEwdzPq1TD7TEw1yuFvfa+L6w7GXN5yu/Lb+l
 Pfo0MFvfQkfl1NnEPqZRCD+mlwsKC5wKFALVgPdxh21w/2tQBiTa+XjSkOL4gBFEJZKRtB3eCm
 DOLGEt0QaecjsicxG/gWr8KY0Xf12NEqeuToaYhf6hL4my9FetxcdEXnPPBBKN26C0Tw7Qxb9+
 uEw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2021 21:07:11 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Hd1cb1jdyz1RtVw
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 21:07:11 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1635134830;
 x=1637726831; bh=G7htI3MtEAFSj41q9Py1+gLkw7fayjtsx/xaen0p8EY=; b=
 E+lzbxc65+r/gXJUC3hu0zFSDXHYeJZ18oycc1x5kLbWoqy3SWJX59a/j7QxcP6z
 zwZWhPE6jXTkABy2UXLRq5dnx3CMZ3a0aymlAZTeQYrAZgE0EI+eJG5NcLmUB0u/
 Po0dNJkcsHmomWue17Cl+mDsmifRw3FZOFcTB+6y6DI9he2stltC88i+omUlPaGP
 moDyOHmmGpiQ8jcxJbOPejHCg4hcByDnBALl+jkzNOmlrk/tZEdmLqeWg9xXIJDN
 GbPr93cnuu54TQndOwE+gBwoSHIHztN0/NrhUucMqMJFu9ZX7o1G83E1dg74Nurw
 MM6waaMryWwUxRzajg1NgA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id UdqOyloOlPol for <qemu-devel@nongnu.org>;
 Sun, 24 Oct 2021 21:07:10 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Hd1cV6z1nz1RtVl;
 Sun, 24 Oct 2021 21:07:06 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] hw/riscv: opentitan: Fixup the PLIC context addresses
Date: Mon, 25 Oct 2021 14:06:57 +1000
Message-Id: <20211025040657.262696-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9254359e1=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Fixup the PLIC context address to correctly support the threshold and
claim register.

Fixes: ef63100648 ("hw/riscv: opentitan: Update to the latest build")
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/opentitan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 83e1511f28..c531450b9f 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -161,8 +161,8 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
     qdev_prop_set_uint32(DEVICE(&s->plic), "pending-base", 0x1000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "enable-base", 0x2000);
     qdev_prop_set_uint32(DEVICE(&s->plic), "enable-stride", 0x18);
-    qdev_prop_set_uint32(DEVICE(&s->plic), "context-base", 0x200004);
-    qdev_prop_set_uint32(DEVICE(&s->plic), "context-stride", 4);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "context-base", 0x200000);
+    qdev_prop_set_uint32(DEVICE(&s->plic), "context-stride", 8);
     qdev_prop_set_uint32(DEVICE(&s->plic), "aperture-size", memmap[IBEX_=
DEV_PLIC].size);
=20
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->plic), errp)) {
--=20
2.31.1


