Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16875650648
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:20:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75kF-0001qx-GZ; Sun, 18 Dec 2022 21:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75k7-0001iQ-3u
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:19:06 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75k5-0001Ed-3s
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416340; x=1702952340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RignxIYbKCPHxUnIhIqB+bDCTC2InNMQAhk2vcktKns=;
 b=BT0cGAUYt4gghnDYc5Yj+CP0N1ErSi9T0+g40fg5IsbBnqUvVNgDN7qy
 X82s8QhKkCblSHvYuFoCI26Vfte5VHgh/PofYFr/7W/kPuR/XUFcqP21D
 tEUz9qz14aXsT3c406/Gsyzg7imQajlf2v1v3hxFYz/hgBBpBwMCea57X
 6VyiWGUIfi9WbrJgwLIMp2jkGIVRMKNb6UNmkrhWjh+zVKrxl/Mb+Qh1C
 2spr5cXio2XQtMl8tpg1gHM4Cl5yoJ2whL4notgSwz9rTIOLpAi3NhoAO
 JJ1KMeoB5c/GfY2klPrBkSuGttkdhLD0wQda9N9/NF3fTAJxHA+GHlbe2 Q==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="331056826"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:49 +0800
IronPort-SDR: Gltl9f+SfyfNKuQZuTC0DQCTcJ8/Gw9bt/8NJjAQRHFQOLFy6pI3jReJRWQ5AIQ0eLeU0VYJUH
 IZhTzwVXtJYOpMvcJjXmbFsils3P3TdDvZXxL5+PgAZWx17c6vjaHeOzAopIk236yi+qpbQ+dL
 /90eNnJM+j4gxbtRr7Y8TJslTod7JnER2dxn0i9h+lSqvQtHdhqUwaFdp4zMtkgFyvBIrI/zJt
 eHwf9RKwPdodXpTS5FP/Reb1p3lCbOYHa1M43W7rJTD5dIvMDRPJutMlZW3Jt63uveDiYvnadk
 10I=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:37:06 -0800
IronPort-SDR: eAa8oui0tWLmTtUlr7HhJb9C9o8Sp1upsUL7AbA7itW4z97O6AlSM4gi4aC0e43yX/ZD9rNqF8
 3kCPgr+YdohPpiezQQkk/LTNQTJ9clMJmPnT5vdaEZph0u7SaeEemSsBM9gGs3VmCVni8jzoaw
 bq/zFHB8ojKiN5KEnQeIqiVXq80oTS6jK4RaxLMByWNCUdTyVhDTqn8Y0noW66+wdTBCpQ9r/o
 q0VBWbciz9YkpK2MLqGvKc6MxycNCq7YwZ1sebbXb5caaue/6qQqvOk9V6tKjvrtraP11KB7Ur
 2Do=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:50 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3Kj4Yz2z1Rwt8
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:49 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416328; x=1674008329; bh=RignxIYbKCPHxUnIhI
 qB+bDCTC2InNMQAhk2vcktKns=; b=PYDJjHjNLC1rQdCKSVMqpDaBmtKXMv5VCU
 FzsIMHg91WUgbZ6ZWWv2dnozHgGAiWzoWOsv/2LuZmOZ+hrOUcjj0TE0ZF7HYS5s
 QARuHAm27tgrZz+QueiM9wk/7xKE3olmTMWJ6uBcsDTOXU3iNZdXvv8E0fiu5dIh
 qa6MyAqqp2j2mvTJgzwOZ7+4VwvnlhpUDEnAdm+HlK9Usp6gDeKkoQLRUd1shsJx
 pp/xiiazyfYY4yc4sAkR7N/44sa5wC7KYzpAD2sXv7x0dxWAPNqMLqjBlAtuNwHh
 Zfk2BjG81PJ7fvDxE0sef3MVy7kAvkxoaqCwA6QmYk7GnTXm0wQw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id apQe3xcL83fh for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:48 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3Kf5xKWz1RvTp;
 Sun, 18 Dec 2022 18:18:46 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 40/45] hw/riscv: sifive_e: Fix the number of interrupt sources
 of PLIC
Date: Mon, 19 Dec 2022 12:16:58 +1000
Message-Id: <20221219021703.20473-41-alistair.francis@opensource.wdc.com>
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

Per chapter 10 in Freedom E310 manuals [1][2][3], E310 G002 and G003
supports 52 interrupt sources while G000 supports 51 interrupt sources.

We use the value of G002 and G003, so it is 53 (including source 0).

[1] G000 manual:
https://sifive.cdn.prismic.io/sifive/4faf3e34-4a42-4c2f-be9e-c77baa4928c7=
_fe310-g000-manual-v3p2.pdf

[2] G002 manual:
https://sifive.cdn.prismic.io/sifive/034760b5-ac6a-4b1c-911c-f4148bb2c4a5=
_fe310-g002-v1p5.pdf

[3] G003 manual:
https://sifive.cdn.prismic.io/sifive/3af39c59-6498-471e-9dab-5355a0d539eb=
_fe310-g003-manual.pdf

Fixes: eb637edb1241 ("SiFive Freedom E Series RISC-V Machine")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-11-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/sifive_e.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index d738745925..9e58247fd8 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -82,7 +82,12 @@ enum {
 };
=20
 #define SIFIVE_E_PLIC_HART_CONFIG "M"
-#define SIFIVE_E_PLIC_NUM_SOURCES 127
+/*
+ * Freedom E310 G002 and G003 supports 52 interrupt sources while
+ * Freedom E310 G000 supports 51 interrupt sources. We use the value
+ * of G002 and G003, so it is 53 (including interrupt source 0).
+ */
+#define SIFIVE_E_PLIC_NUM_SOURCES 53
 #define SIFIVE_E_PLIC_NUM_PRIORITIES 7
 #define SIFIVE_E_PLIC_PRIORITY_BASE 0x04
 #define SIFIVE_E_PLIC_PENDING_BASE 0x1000
--=20
2.38.1


