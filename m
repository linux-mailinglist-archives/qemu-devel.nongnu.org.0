Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 954973FD717
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 11:44:10 +0200 (CEST)
Received: from localhost ([::1]:49698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLMmv-0004hQ-IU
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 05:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mLMky-0001yU-7D; Wed, 01 Sep 2021 05:42:08 -0400
Received: from smtpout1.mo3005.mail-out.ovh.net ([79.137.123.220]:53539
 helo=smtpout1.3005.mail-out.ovh.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mLMkw-0000dv-Ez; Wed, 01 Sep 2021 05:42:07 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.132])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 9220F13ECA7;
 Wed,  1 Sep 2021 09:41:57 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 1 Sep
 2021 11:41:56 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005750508bd-8aa1-4347-81a9-d673430c1784,
 5EBA00A5E723AF1D17FBD8632F6684B6834AEADC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 3/8] ppc/pnv: Add a comment on the "primary-topology-index"
 property
Date: Wed, 1 Sep 2021 11:41:48 +0200
Message-ID: <20210901094153.227671-4-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901094153.227671-1-clg@kaod.org>
References: <20210901094153.227671-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 52c7af14-e2ad-418a-8481-aa262ffd6177
X-Ovh-Tracer-Id: 5396719728784018339
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepiefgvddvffffveelfeeghfehgeetuddtgfeuveefffelgeelvdeuhfetteeukeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.3005.mail-out.ovh.net
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On P10, the chip id is calculated from the "Primary topology table
index". See skiboot commits for more information [1].

This information is extracted from the hdata on real systems which
QEMU needs to emulate. Add this property for all machines even if it
is only used on POWER10.

[1] https://github.com/open-power/skiboot/commit/2ce3f083f399
    https://github.com/open-power/skiboot/commit/a2d4d7f9e14a

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv_xscom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ppc/pnv_xscom.c b/hw/ppc/pnv_xscom.c
index faa488e3117a..9ce018dbc279 100644
--- a/hw/ppc/pnv_xscom.c
+++ b/hw/ppc/pnv_xscom.c
@@ -284,6 +284,10 @@ int pnv_dt_xscom(PnvChip *chip, void *fdt, int root_offset,
     _FDT(xscom_offset);
     g_free(name);
     _FDT((fdt_setprop_cell(fdt, xscom_offset, "ibm,chip-id", chip->chip_id)));
+    /*
+     * On P10, the xscom bus id has been deprecated and the chip id is
+     * calculated from the "Primary topology table index". See skiboot.
+     */
     _FDT((fdt_setprop_cell(fdt, xscom_offset, "ibm,primary-topology-index",
                            chip->chip_id)));
     _FDT((fdt_setprop_cell(fdt, xscom_offset, "#address-cells", 1)));
-- 
2.31.1


