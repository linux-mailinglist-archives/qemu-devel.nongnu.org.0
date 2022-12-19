Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E223650670
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:31:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75kZ-0002DK-4k; Sun, 18 Dec 2022 21:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75kQ-0002An-6A
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:19:22 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75kO-0001Ck-Im
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:19:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416360; x=1702952360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FyJflZSfGCFJuxVWGryLkKV05Gzhy7oKc/Efd3wNjjA=;
 b=le1en8ffEN5Kaxd3FWq4frMFTVU/n7r/DIgJV7aAmzJUiMQSozCCBd1U
 AlD33296+oKAiEs3/rJIe9UWdDyqqJRWE0cQJ8sW5ZxpjMZe0uUg0B4G1
 YA14Ag0aITkLa9nvnw4OGl28gAgpbnRvIqtE3BKlMqW8OqLeC/03lF/gM
 FCTNUagIgOC+CScxRdFP7R48vnVQP8C07ZiorP7UjC6U9me3xTAIckE/M
 74RY/Z+ASR2AhVwvHoiDzEeR6tb9q1cCEl/wJs1WPzny8zq2jZmLwVSiG
 55wfU6f9PHZDXxnqiI4vgPLKFA7qR9UxFWBBcOLIgOZ/R6k6JDU/xYKAV A==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="331056843"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:59 +0800
IronPort-SDR: nWFokBQDrmyidz9j0ruvGWeVC2q2NXv+N7cief6FgZknkrQtcdWCO1kXyY4mSrBnea0FR7aVAf
 r7z5210KX2Q5FraCTkDZohwoiGjFv1S4gBSlVAfXrfSIvT1Zjx+HKuUydTRqqNoo2z2MDAUWk9
 Ozc/2biBs8UoIQpHnpxx6SAT1u6wobt1KdzVgp0SLSggGhhLGMKbhB8JdlY4Ab4aaEJ/bbf04g
 fASM/uL6LZ4EPY/TB8hrEgsrxyrbGeOoE5wZC1uP3U+FWAB5QCG+tnFesKc7Cex+tP7b66rnS1
 Oqw=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:37:16 -0800
IronPort-SDR: SppTiwNc5nUwKIXME8IgQ6ktCTh6nw4SVHYxidtBZEOJdgJ4ytQ158imaO5l9WQHf6fmV35ao3
 3MaqNE34YB8TW4GNzVzsacu1V5a2OFv3GuwZQ3ilFcXJV5XDa+HPyWt0Tg+g72c1GGimDaA135
 JjjV0Fr3CZrBWV0fmaIYHFYRX+oHBM/2h+Y3ZFZMRTMeqEj6q7sD5G++1BjmNDRw9J/K4cK78a
 4CO5IQZHg7nVsnifCKDV/XSVic6Qrq0Cj6wVoEx4Ks7tXEbm5YqPcoZqvqxdKlP+ERLGUcDTCu
 gGk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:19:00 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3Kv75Qgz1RwqL
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:59 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416339; x=1674008340; bh=FyJflZSfGCFJuxVWGr
 yLkKV05Gzhy7oKc/Efd3wNjjA=; b=hgKSQ6w1YD4woPX14IL9zCWdW6Ex84HyEg
 NipmoQ8cA4WOltqutv59SP2YIm+ASC1XEYfeh24sU/XBD6SJfaxowsQjyGmGy70C
 ByW1xGPuIcMqEEmPm0y4G/3GtIqgdK1aMSCWZe5FT0UXD/7ScFKRzzKEpCV22G7Q
 8WV8EcLQ/PMEs95zKFv4zjA8iRjKFXbQCX27WXUWQIVbvjjx2G7R7EeWlhac/skt
 qTA/4Y5ZZKla3iP9/LlfWfmDNDeZEFFa79m+Li2NTGuQxqUx0Tc/wKldv1lmW9v5
 jSwwQDDfGJqMjJ6a3T1DsxGlw0NRXgJSKkTjhRYhLeWIKXjcy5UQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id QyrHHTsb-mmL for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:59 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3Ks5fmkz1RvTp;
 Sun, 18 Dec 2022 18:18:57 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 44/45] hw/riscv: opentitan: Drop "hartid-base" and
 "priority-base" initialization
Date: Mon, 19 Dec 2022 12:17:02 +1000
Message-Id: <20221219021703.20473-45-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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


