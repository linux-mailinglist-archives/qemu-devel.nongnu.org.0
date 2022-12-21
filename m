Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5614865391D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:55:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87nt-00032e-N9; Wed, 21 Dec 2022 17:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87ng-0002mx-Fz
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:02 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87nU-0000bf-S4
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:42:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662568; x=1703198568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WRx6Vvid93Q1T1mtyE/QThVhuj/pNvv5e8rHnvs+X88=;
 b=PGOR3o5eSyv7oncX2VfeE4y5xdQE8pER+2Iu4BwnXAp4KZqP6h8JpO2I
 1wLEK+4esnP3Vr6Q6GDMZrVrDT1ZoxrKbwcKHcOAVEzRr4OKG7m+Xk+3I
 7rWLHXfjTS/1QpMVWIQRr4fhOkXEAxxou0kqqknvpLr0Z9zqDP4njLrZ8
 BMK0ijy34M6knIeWfgOlerpcjNy820DkwFO6XO8QE8MPLxQyg3cNkUlBf
 aWjmPmh23riyI9Wu1S5Aa31/N6tfjAZS2sufxtj68ilmoQ7TzVAPrmp+T
 C2T3KPwnIUXLZpsvcqi+BkKKoDPIaCLLAqX4fLDygW1ojJKBpGxQWso59 Q==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561432"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:41 +0800
IronPort-SDR: w+b+SMuGHpB67mvhoomvxuqZ/UJ0QDfTTXLnuI6P3fRROA7sP2TzQuoa1ym3yQN+hv/Rxj2h3w
 NCFsroOVKrnlgyPmP+6tVZa9aL6MXUybD/BrGHr6M+eiIJcLL1JCmyYV8dEnIx4sT3bjCvIFlR
 YSzqlf4rj6UBCvd/Fz3M3sJ0sl7S73mlgARcdZwAr1wDkPuqBGOR3v/NReEQp/m9xJjsFdQgVV
 3iXK01SMT6nqqLdN4Qd77K6InNnmfxJui32IVpoKQVhcSqggktB7eNEISJcUkkvtuxEkFTEwTN
 lzQ=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:54:10 -0800
IronPort-SDR: 4FnK90paQittOio5B1GbHk9ZOd71eiAOXqN7S7IBqi1rY/F/qP/VDGNEoACrhkfL+sDPpCfdMS
 zLVTPCRYmQV6HZiKJtcLSeQ4nzs09WkANn9IbtB42zPyRE0WBmK5iTWRJGwLCmV8uvRzsrlELk
 RQe6iw7c41PZK5ZYsXEnwKnS4zQ6kj8/U5ywHED1JVEgIzLN9IsoBigqo5XCikJ+RnM7SOCPdY
 7kxEM69oV1akYy0x/5R5rBsoTZJud3eD5/qzv1Ct0bLG9Rw48xmgp76B5HS/vzcB2uGA/nzdoi
 YP0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:42 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpMp0H5Qz1RvTr
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:42 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662501; x=1674254502; bh=WRx6Vvid93Q1T1mtyE
 /QThVhuj/pNvv5e8rHnvs+X88=; b=oLNrxfJwajpa2b5RCg6/jdHpfiVVCGuJGO
 XlLut9g6JrsKI60vvMHg8bFTH6ZgoAIQX0ozBpFXTVFrDaAeaBow6wuJCh1S0/d4
 vChA8slQdN8V8EV3UjIFib3yivvziqDWHHw+CWCzyt9dtv5mKorw0nbqXLIO0fR/
 Vb8L31S140tBI6DcvvL2YKVKfLoqrzTrXDhImUnBTSxxi8YKKQ5rJt8+tlpxlpK5
 To14KKLT/qqk9O31LGt6tH7CGdqBAXsSr/vc0J4QA+E7I1Q9ER664081RS7e1sKg
 USKI+21bZ3rLVjNN2Gh+YmZvg5tQcYhZDDeTTgovA2HophYWurpw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Q5iJ5yd_lmEM for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:41 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpMl60qvz1Rwrq;
 Wed, 21 Dec 2022 14:41:39 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 34/45] hw/riscv: spike: Remove misleading comments
Date: Thu, 22 Dec 2022 08:40:11 +1000
Message-Id: <20221221224022.425831-35-alistair.francis@opensource.wdc.com>
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

PLIC is not included in the 'spike' machine.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-5-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/spike.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 1e1d752c00..13946acf0d 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -8,7 +8,6 @@
  *
  * 0) HTIF Console and Poweroff
  * 1) CLINT (Timer and IPI)
- * 2) PLIC (Platform Level Interrupt Controller)
  *
  * This program is free software; you can redistribute it and/or modify =
it
  * under the terms and conditions of the GNU General Public License,
--=20
2.38.1


