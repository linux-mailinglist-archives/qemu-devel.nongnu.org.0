Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072884665A5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 15:45:11 +0100 (CET)
Received: from localhost ([::1]:47034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msnKf-0004mE-0M
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 09:45:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1msnIL-0000PW-2m
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:42:45 -0500
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:33161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1msnIG-0005Ev-NF
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 09:42:44 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.21])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id BEE051FE95;
 Thu,  2 Dec 2021 14:42:38 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 2 Dec
 2021 15:42:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0010a1e0a23-1414-4b3f-93f0-9d12e61767e4,
 53AF7497412F6E71185D8D05EFDE7032E43CC10F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 02/14] ppc/pnv: Drop the "num-phbs" property
Date: Thu, 2 Dec 2021 15:42:23 +0100
Message-ID: <20211202144235.1276352-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211202144235.1276352-1-clg@kaod.org>
References: <20211202144235.1276352-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d91dab9a-fa0d-4f2e-9b15-7ed19db3d2ca
X-Ovh-Tracer-Id: 15807071744958892838
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieehgdeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is never used.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index bd768dcc28ad..988b305398b2 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1764,7 +1764,6 @@ static Property pnv_chip_properties[] = {
     DEFINE_PROP_UINT32("nr-cores", PnvChip, nr_cores, 1),
     DEFINE_PROP_UINT64("cores-mask", PnvChip, cores_mask, 0x0),
     DEFINE_PROP_UINT32("nr-threads", PnvChip, nr_threads, 1),
-    DEFINE_PROP_UINT32("num-phbs", PnvChip, num_phbs, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.31.1


