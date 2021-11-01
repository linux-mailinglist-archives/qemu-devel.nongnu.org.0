Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78B54421C4
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:40:20 +0100 (CET)
Received: from localhost ([::1]:34924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhe6N-0006l1-D1
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mhc6G-0000SA-6n
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:32:05 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:43489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mhc6B-0003Ez-NX
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:32:02 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.36])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C4C3F20B1C;
 Mon,  1 Nov 2021 18:31:47 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 1 Nov
 2021 19:31:47 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0046ec24ab5-77db-45a8-8f94-7e61cfe2ffba,
 19968099C3D5961E0A9C4B5796ED635FC82F5468) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] MAINTAINERS: Change status to Odd Fixes
Date: Mon, 1 Nov 2021 19:31:46 +0100
Message-ID: <20211101183146.684471-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 529cebba-7ef7-4331-a0c5-6f9e888c38db
X-Ovh-Tracer-Id: 3644256524635179814
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvdehvddgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefvdeutddvieekkeeuhfekudejjefggffghfetgfelgfevveefgefhvdegtdelveenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I haven't done any Aspeed development for a couple of years now and
maintaining the Aspeed QEMU machines has been a side project since.
I don't have time anymore.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 05a3451f115b..193e5c908a29 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1036,12 +1036,11 @@ F: hw/arm/msf2-som.c
 F: docs/system/arm/emcraft-sf2.rst
 
 ASPEED BMCs
-M: Cédric Le Goater <clg@kaod.org>
 M: Peter Maydell <peter.maydell@linaro.org>
 R: Andrew Jeffery <andrew@aj.id.au>
 R: Joel Stanley <joel@jms.id.au>
 L: qemu-arm@nongnu.org
-S: Maintained
+S: Odd Fixes
 F: hw/*/*aspeed*
 F: hw/misc/pca9552.c
 F: include/hw/*/*aspeed*
-- 
2.31.1


