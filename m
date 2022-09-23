Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0255E72DC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 06:24:53 +0200 (CEST)
Received: from localhost ([::1]:47430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obaFA-0008Gd-FK
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 00:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyV-0001j4-Qh
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:44 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:63953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyR-0005dr-Af
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663906055; x=1695442055;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rGwlR4H3pAHbNK6RHizCRzWAmLwAdBJ0/NRbGNOIiKc=;
 b=KGRnBQ2SRx+jqiiedH+UW1PiBXzQjccsTLXsiC6aKhjD213g8sOVIoW6
 n91W5CNcTVldxMtOmJ+4s1YwWsCZEX3MuagrGnUQIUX/2EYpW3uyQiNc+
 YvRobeLWvNg6/VZPefCzHI/01TdzNesFYly6Bez3g2FNaqc/8ZTVL+789
 bxQrHmxAOJgGd9hcBzKJXpHfqNlejsuAVBHyFGuikHSEBHRgHzF3mU4Ki
 70+7zpbBE8yZPVpF8PGRvm8CAhbdOwWOYpcP6pgI3SK8KE9PQ/djkOsSO
 2oLd2UvEpUag4naSs67n/L3nkJujihAnLNZglQG73k0ym54PYtOsPlQr6 Q==;
X-IronPort-AV: E=Sophos;i="5.93,337,1654531200"; d="scan'208";a="212510479"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Sep 2022 12:07:34 +0800
IronPort-SDR: qi0TL8xBdYgcnWOPjragi3POUmIaXo7tLqivICmlmj240GqfxcgziH5TiyksoRt1A+ULNGiiM3
 MdQx9p0e173xLDjtW7dX1gXddnq28b1Y8VTLsgi+JBOEuxtFkUssymAXUPTSe9SOVTHznem2x1
 LVmYeZjPMI9b0Ac+lALViL5g3Jb4iVeqiW5lOTzMTxpxXpi75nmAGwtE/vFt5RvhpJnN/ifpX7
 o6kLornX0CUNiTY5hXwPo/dyCW1kuSQeseHJz5O0sSq8/Qh/WzqNWhuoFuo91/xhPCnVvjFg37
 ZC/bfoObIwPVvtO9HetOaOeI
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 20:27:36 -0700
IronPort-SDR: Lv9BLiLKDD0hY6xxvwRn3FOhaTQmVoaPK2p9GClZOLf+vXyRph/4olrFRsyfmOh28ShbVGhOXf
 YCa9eUwy+8p4z2P1sASCio2jmcGLYi2X9IYo8MIdCqj0c9Pb5jgyp2qCwOW/kUAAY9LTP0N5RD
 4KcbEmyV1F8KIJo1gfZ8M7nvY/Oe2J53sHPYsmCDLT/fY/8L9YwMdBQqBrRpZtYS90Zr7Hhene
 mBdF26P/4eSJuGEshHgwqcDSS1KR3qoSUFIv7gu8D9+sns2qGaMICutibvf3POCbrYCsmn/dtE
 x/8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 21:07:34 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MYdsK73JRz1RwqL
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 21:07:33 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1663906053; x=1666498054; bh=rGwlR4H3pAHbNK6RHi
 zCRzWAmLwAdBJ0/NRbGNOIiKc=; b=THY/Q2VSWBQn6ej5USVcbKBG+QfWiqXjT5
 GtM4p1mZ2a/8TFbmXuMv2sOuIIODjmxe2xEMqAoYXtsVll9hpKIge1SSzMOp2XSP
 gjm1t2j1owbxmOQekIROC0M+zLXj1/O6tZydQ8d34ehEuXOyTZAVC89zXPLue+9b
 5QKbDaO9fn3YT2704O/haCD04HIy2MaggVeKgx8s7QYi7F77TESBHl/QLc7O8hU5
 JQBQXj2+AA1HoUItvxtX9TOx1CRYE7QNHqveosbFgw+ckKeePjQX9TKFzWj+Iah/
 2SsO4N1+zUXN2b+zQ+sHBs0fTML031+01y2hYWQsVkE4YxG3BYvg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id HI2eTicwN9uT for <qemu-devel@nongnu.org>;
 Thu, 22 Sep 2022 21:07:33 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MYdsJ2rRPz1RvLy;
 Thu, 22 Sep 2022 21:07:31 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 09/12] hw/riscv: opentitan: Fixup resetvec
Date: Fri, 23 Sep 2022 14:07:01 +1000
Message-Id: <20220923040704.428285-10-alistair.francis@opensource.wdc.com>
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

From: Alistair Francis <alistair.francis@wdc.com>

The resetvec for the OpenTitan machine ended up being set to an out of
date value, so let's fix that and bump it to the correct start address
(after the boot ROM)

Fixes: bf8803c64d75 "hw/riscv: opentitan: bump opentitan version"
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220914101108.82571-3-alistair.francis@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/opentitan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index af13dbe3b1..45c92c9bbc 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -142,7 +142,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
                             &error_abort);
-    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x20000490,
+    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x20000400,
                             &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
=20
--=20
2.37.3


