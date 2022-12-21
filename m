Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012EA653985
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 00:00:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87oO-0003lc-Tm; Wed, 21 Dec 2022 17:43:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87oM-0003gh-Cb
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:42 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87oK-0000Xf-L2
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662620; x=1703198620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VhJier8Sfagp/2bmB4q0y6I9QpcKcN4XDbRExd/aw3w=;
 b=antRW9gBNc5stWhGzJVONiRVhwmi47geXXf0RY+NhaoHXxyfUrFzwYYK
 CfdTH/g1PSID0w5EpXut6JChJUVXhQutwGr50w9qIoEm2oFp3hgSDL3WE
 7euo+y6qlX/rnMZykF3XUfR8WkAnyYz0RmbbMrr6EE8/oMAUdqu8mr/Bq
 dtjUTAkfNCkf/7cjbZFJGeogCFcaX7eCszKbhtTtr/Eiu5NVOPzxPFcA/
 yKZgUBxFPlNH4W8jT7t/TsXV2NqAm8iOFr8lpeyBmq+JUIf1Z6l+ifQ8j
 ZHp0L7HYoQ396jcH6L5FxLgJN7tbHsnsjjAZ9jdgPB17qLf2XExcDbRnF Q==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561495"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:42:07 +0800
IronPort-SDR: OQUdYYNh586igROC4PeeyW7/y6vZwxI2Gc6a/wmjRuAp+Fkl4ZE3BHgUMSgpqhtHcUmxKMYKUi
 HscQHyKhmPAFe1GLHu5mECmfg6AIYpj9+UfDclmnwtPQFSR2Bxc38a1IGUGltuBR5UNecIfSzJ
 +GaY10LM1qChKNyv4pDKyidHPfDvEopc4Eq5lMA7Jv9z9owfVWbq0j5N/564RTbdyCOsM8bS9e
 8g1e9M5m4HpmVsylqkFB4EuEQehu86aY3UK49DEYmc+6dIHAUejbRS/LIWnXO5Vp8bxyeBDOUq
 NXs=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:54:36 -0800
IronPort-SDR: snyH7ROqbBUGc3JjaJzViaHxePyy+PM6VwB6pZGFGEGS+EW0HgHmOtHT75pR9yy7KuA6z44ZPV
 FIxmDWjmOC4fc7AsGbIPgIvkGF005S2inmWoImJJOnfw9tjzuS2QAjk7ipgkG39ly4dZzt+q4d
 lIlK87juAeiKRQKBsUk1bGvI6hn6X1JM49QxMoV8RXDyXbA+Asky57Dfy2we/HUx8AkVeiPeYF
 2Ctarb00wORkKYYd9K7ViJ9I+ikSuR6ZvYkHWOrAI+Fd83G4LDUj6f8NyA0gR9ZKwLHfpG6tCK
 8D8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:42:08 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpNH4m2Sz1RvTp
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:42:07 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662527; x=1674254528; bh=VhJier8Sfagp/2bmB4
 q0y6I9QpcKcN4XDbRExd/aw3w=; b=BopMnilRKEQaocOeiHsUhDyOWj8gRN9Lud
 FoyiQR4ocr7XnsVLGtF/BhAMQxlORT6aNNbPlc9q3Lt25OWvrw4XZ6jcF5bjZvey
 L1svd1kVh2mKERWwDP38NBj0A0JtB7gE+0/z1MqXJD+MOlrAn3R9RpTUovRXk2J4
 nMdL1hbXWlJGWRQslw8snxmnYn4EmQgRkdvbcS6Yj8sZpQOijKolO+at/bzwlI1N
 JlJttf48CLcLQizCm6OC4xnRlxnmaJ0ASfa3C98z8lbRsbVwZfZuH/3MfN4QufQp
 8Tj8lcnU4/lQ5tYjJEC+Nu3/UUkV78FlplmpTTcs6SrEIR7c03eg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id zrVY1hhkK_x8 for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:42:07 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpNF3hvmz1RvLy;
 Wed, 21 Dec 2022 14:42:05 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 45/45] hw/intc: sifive_plic: Fix the pending register range
 check
Date: Thu, 22 Dec 2022 08:40:22 +1000
Message-Id: <20221221224022.425831-46-alistair.francis@opensource.wdc.com>
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

The pending register upper limit is currently set to
plic->num_sources >> 3, which is wrong, e.g.: considering
plic->num_sources is 7, the upper limit becomes 0 which fails
the range check if reading the pending register at pending_base.

Fixes: 1e24429e40df ("SiFive RISC-V PLIC Block")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-16-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 1a792cc3f5..5522ede2cf 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -143,7 +143,8 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr=
 addr, unsigned size)
         uint32_t irq =3D (addr - plic->priority_base) >> 2;
=20
         return plic->source_priority[irq];
-    } else if (addr_between(addr, plic->pending_base, plic->num_sources =
>> 3)) {
+    } else if (addr_between(addr, plic->pending_base,
+                            (plic->num_sources + 31) >> 3)) {
         uint32_t word =3D (addr - plic->pending_base) >> 2;
=20
         return plic->pending[word];
@@ -202,7 +203,7 @@ static void sifive_plic_write(void *opaque, hwaddr ad=
dr, uint64_t value,
             sifive_plic_update(plic);
         }
     } else if (addr_between(addr, plic->pending_base,
-                            plic->num_sources >> 3)) {
+                            (plic->num_sources + 31) >> 3)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid pending write: 0x%" HWADDR_PRIx "",
                       __func__, addr);
--=20
2.38.1


