Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E2F469408
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 11:40:44 +0100 (CET)
Received: from localhost ([::1]:37692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBQI-0005JN-Cu
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 05:40:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muBNA-0001Bn-R7
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:37:29 -0500
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:46571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muBN7-0001mw-CT
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:37:28 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.191])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 704BD20B46;
 Mon,  6 Dec 2021 10:37:16 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 6 Dec
 2021 11:37:15 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00199785c49-895c-44a9-8d2f-1630b5bdff77,
 4EE5CA355A73348BB336A65EF5ADB9B11F7CB924) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 03/15] ppc: Add trace-events for DCR accesses
Date: Mon, 6 Dec 2021 11:37:00 +0100
Message-ID: <20211206103712.1866296-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211206103712.1866296-1-clg@kaod.org>
References: <20211206103712.1866296-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 84d6f805-5cdb-4948-86bc-433b30716a83
X-Ovh-Tracer-Id: 16707228719071398764
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc.c        | 2 ++
 hw/ppc/trace-events | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index e8127599c907..818d75798584 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -1367,6 +1367,7 @@ int ppc_dcr_read (ppc_dcr_t *dcr_env, int dcrn, uint32_t *valp)
     if (dcr->dcr_read == NULL)
         goto error;
     *valp = (*dcr->dcr_read)(dcr->opaque, dcrn);
+    trace_ppc_dcr_read(dcrn, *valp);
 
     return 0;
 
@@ -1386,6 +1387,7 @@ int ppc_dcr_write (ppc_dcr_t *dcr_env, int dcrn, uint32_t val)
     dcr = &dcr_env->dcrn[dcrn];
     if (dcr->dcr_write == NULL)
         goto error;
+    trace_ppc_dcr_write(dcrn, val);
     (*dcr->dcr_write)(dcr->opaque, dcrn, val);
 
     return 0;
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index 3bf43fa340fe..602adb83157b 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -119,6 +119,9 @@ ppc_irq_set_state(const char *name, uint32_t level) "\"%s\" level %d"
 ppc_irq_reset(const char *name) "%s"
 ppc_irq_cpu(const char *action) "%s"
 
+ppc_dcr_read(uint32_t addr, uint32_t val) "DRCN[0x%x] -> 0x%x"
+ppc_dcr_write(uint32_t addr, uint32_t val) "DRCN[0x%x] <- 0x%x"
+
 # prep_systemio.c
 prep_systemio_read(uint32_t addr, uint32_t val) "read addr=0x%x val=0x%x"
 prep_systemio_write(uint32_t addr, uint32_t val) "write addr=0x%x val=0x%x"
-- 
2.31.1


