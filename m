Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFA8258E82
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 14:48:53 +0200 (CEST)
Received: from localhost ([::1]:41626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD5iW-0001CD-OQ
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 08:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kD5fP-0004cC-UX
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 08:45:39 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:37563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kD5fM-0001RI-C7
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 08:45:39 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.108])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 892E1563B95D;
 Tue,  1 Sep 2020 14:45:33 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 1 Sep 2020
 14:45:33 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003d0e3953c-bcca-4e9f-adf3-e0c47fa0b0fe,
 38EE1E9FF4E34D4C85F4190D418CEE501B878519) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-devel@nongnu.org>
Subject: [PULL 08/20] ftgmac100: Fix registers that can be read
Date: Tue, 1 Sep 2020 14:45:13 +0200
Message-ID: <20200901124525.220252-9-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200901124525.220252-1-clg@kaod.org>
References: <20200901124525.220252-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7a8a2380-a0b2-4d45-87a3-5a52e0a54a7f
X-Ovh-Tracer-Id: 4786481982425238310
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudefjedgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 08:45:33
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Konrad <konrad.frederic@yahoo.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Receive Ring Base Address Register (RXR_BADR) and the Normal Priority
Transmit Receive Ring Base Address Register (NPTXR_BADR) can also be
read.

Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20200819100956.2216690-10-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/net/ftgmac100.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 5f4b26fc5f3c..0348fcf45676 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -669,6 +669,10 @@ static uint64_t ftgmac100_read(void *opaque, hwaddr addr, unsigned size)
         return s->math[0];
     case FTGMAC100_MATH1:
         return s->math[1];
+    case FTGMAC100_RXR_BADR:
+        return s->rx_ring;
+    case FTGMAC100_NPTXR_BADR:
+        return s->tx_ring;
     case FTGMAC100_ITC:
         return s->itc;
     case FTGMAC100_DBLAC:
-- 
2.25.4


