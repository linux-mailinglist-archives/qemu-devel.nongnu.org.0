Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C99DB3FD71A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 11:44:21 +0200 (CEST)
Received: from localhost ([::1]:50414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLMn6-0005Ac-SK
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 05:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mLMkz-0001zN-PA; Wed, 01 Sep 2021 05:42:09 -0400
Received: from smtpout2.3005.mail-out.ovh.net ([46.105.54.81]:55323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mLMkx-0000e1-Pa; Wed, 01 Sep 2021 05:42:09 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.132])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id A019113ECCB;
 Wed,  1 Sep 2021 09:41:57 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 1 Sep
 2021 11:41:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0055e391a20-8219-40e7-87bd-a55549975717,
 5EBA00A5E723AF1D17FBD8632F6684B6834AEADC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 4/8] ppc/pnv: Remove useless variable
Date: Wed, 1 Sep 2021 11:41:49 +0200
Message-ID: <20210901094153.227671-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901094153.227671-1-clg@kaod.org>
References: <20210901094153.227671-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2a2d3160-d670-4765-8f38-ff48a3b66fca
X-Ovh-Tracer-Id: 5396719729123625891
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout2.3005.mail-out.ovh.net
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 2f5358b70c95..a62e90b15e27 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -838,8 +838,7 @@ static void pnv_init(MachineState *machine)
     for (i = 0; i < pnv->num_chips; i++) {
         char chip_name[32];
         Object *chip = OBJECT(qdev_new(chip_typename));
-        int chip_id = i;
-        uint64_t chip_ram_size =  pnv_chip_get_ram_size(pnv, chip_id);
+        uint64_t chip_ram_size =  pnv_chip_get_ram_size(pnv, i);
 
         pnv->chips[i] = PNV_CHIP(chip);
 
@@ -850,9 +849,9 @@ static void pnv_init(MachineState *machine)
                                 &error_fatal);
         chip_ram_start += chip_ram_size;
 
-        snprintf(chip_name, sizeof(chip_name), "chip[%d]", chip_id);
+        snprintf(chip_name, sizeof(chip_name), "chip[%d]", i);
         object_property_add_child(OBJECT(pnv), chip_name, chip);
-        object_property_set_int(chip, "chip-id", chip_id, &error_fatal);
+        object_property_set_int(chip, "chip-id", i, &error_fatal);
         object_property_set_int(chip, "nr-cores", machine->smp.cores,
                                 &error_fatal);
         object_property_set_int(chip, "nr-threads", machine->smp.threads,
-- 
2.31.1


