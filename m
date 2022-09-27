Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3995EBB6C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:25:47 +0200 (CEST)
Received: from localhost ([::1]:40368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4yQ-0008D8-7S
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47u-00058X-NE
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:31 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47p-0001F1-Lm
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260285; x=1695796285;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rGwlR4H3pAHbNK6RHizCRzWAmLwAdBJ0/NRbGNOIiKc=;
 b=jpp8srqblcBzPnr0chPd6dE9d/iyCSrDSWSQ+4JK9QabCySMvyKqRD0F
 Vxa08oWSLbcb5B7AlcZCaGxr5E8ZB80AuctojUB16c/i4J+pR7zFoAi3j
 HjdV6b5Vr4dHlnJa2BeQEXZxNQdJhczmGVrC+bIzTBNU0TM8glCPmwcgu
 2ss+2xA427FZe13TXKuCE1UaGkCwbgdc3Q989zHh1ciZbnBYFfezb1qV+
 LJ3dIBUVPcXe7KNxcvTCVVZPhELN6kTsvbWCkNAhOhpyv30+dAr6hPH3j
 TQr6+DS6WkbpGrNnECQwhtBH2BPWk+S+dy8qMoZ3tI2dlycigdRh7ClwU w==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530865"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:24 +0800
IronPort-SDR: hLVScpRA/91DxnyMnbRVdan264UlaU76QUyB/zVah/GQ4Vn4tqRO7XKzeKJ8Zj45COS+8/4BaF
 SmDKgc4WVJL7JwIe2iHdxK/C6AjqVDOGb4d93sd2tIYygyhLkzpEYR4OjvGZRFef7yWqzocVUf
 K4hSiik+V3Xc7xcjJ57UOSfe5MRar97oC49CMGUe8JTvBv2iMhyv04g4R4fZA18jjkDDkrdCes
 Xns3Za1gRyT33nQedMCXfSiM4hi7duZZbPNTLt/hm4uxf3vBEZRbG7cql37sOixD0/Jel1uCX3
 trRIKJ74A1D9RjX9F55r6SeY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:21 -0700
IronPort-SDR: W9nHXuL5LuAZ8KE6sgiANtGSRPxE+Q3kGegEhe0BSpFeoAJe+wLmFW0QLNBWOagtvUTS7W+Scq
 xVZ7m/Ryx/VVyZaoB9MN6lRPZ+gswdTDOeTgEIcXux9grEA+KyTXaAOg4i4oknF+/jzElCgyVY
 HrZhb8QGURKNUqBRnYcKga3kpQiVasjpFd8wEaX5clU91Hzlw1DX0YLPCSdtHbaKI/yeUoRjhj
 ykl+V6s15SSCiIR9xLeTx2sYbiG9Ltwwpdob8Gc9rcNVhYlxLlWBS8+FnZmdnQRZMFs9C/ttM/
 UVo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:24 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8sR5Kwmz1RvTp
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:23 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664260283; x=1666852284; bh=rGwlR4H3pAHbNK6RHi
 zCRzWAmLwAdBJ0/NRbGNOIiKc=; b=HXGLexN+VXPrXWJJSemZZ7mhjl5jYqIfbt
 0ggoRAWxR1TKytqRuuJ8kvzoyEODe6w6S63stCc5s7LwAS84hHMFUGoqr5mcHIhe
 SfZaieNTkvQ/zuvx/QOHIfXLOLFnrnQh5Un40hfrb3g+/zjgyoLCDRF3l5SP6MgC
 1CFmbTCUB5bDS8jRTvz/ammmAFwbM83JhAS+eDwrtzApNpvHKNFyb0LKBSNvL0U7
 WTeOmXIKAW9MFCzBWJM3RiEg/2LpEyWLK0nFkmMgDP/VOHNwNI9tUYe0EluAR4HL
 0Ja87unXqxhHaYkqZ4J+SFhuXdrKuWXtv1KRb2qVLsKHrqzjSEGA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id E3e6AiyzhnVV for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:23 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8sQ3MTkz1RvLy;
 Mon, 26 Sep 2022 23:31:22 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 09/22] hw/riscv: opentitan: Fixup resetvec
Date: Tue, 27 Sep 2022 16:30:51 +1000
Message-Id: <20220927063104.2846825-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
References: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=262caef14=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


