Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C25469421
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 11:47:06 +0100 (CET)
Received: from localhost ([::1]:54950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBWT-0008Vm-Ch
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 05:47:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muBNC-0001CV-Eh
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:37:31 -0500
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:51061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muBN8-0001n8-B6
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:37:30 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.191])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 3D02C20B35;
 Mon,  6 Dec 2021 10:37:16 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 6 Dec
 2021 11:37:15 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0010f909b6d-337c-41e0-82a3-92dc338de346,
 4EE5CA355A73348BB336A65EF5ADB9B11F7CB924) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 02/15] ppc: Mark the 'taihu' machine as deprecated
Date: Mon, 6 Dec 2021 11:36:59 +0100
Message-ID: <20211206103712.1866296-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211206103712.1866296-1-clg@kaod.org>
References: <20211206103712.1866296-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8d4bf1be-0e54-40c2-9f94-711d6d0353bf
X-Ovh-Tracer-Id: 16706947242965830508
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The PPC 405 CPU is a system-on-a-chip, so all 405 machines are very similar,
except for some external periphery. However, the periphery of the 'taihu'
machine is hardly emulated at all (e.g. neither the LCD nor the USB part had
been implemented), so there is not much value added by this board. The users
can use the 'ref405ep' machine to test their PPC405 code instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20211203164904.290954-2-thuth@redhat.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 docs/about/deprecated.rst | 9 +++++++++
 hw/ppc/ppc405_boards.c    | 1 +
 2 files changed, 10 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index ff7488cb63b9..5693abb663e3 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -315,6 +315,15 @@ This machine is deprecated because we have enough AST2500 based OpenPOWER
 machines. It can be easily replaced by the ``witherspoon-bmc`` or the
 ``romulus-bmc`` machines.
 
+PPC 405 ``taihu`` machine (since 7.0)
+'''''''''''''''''''''''''''''''''''''
+
+The PPC 405 CPU is a system-on-a-chip, so all 405 machines are very similar,
+except for some external periphery. However, the periphery of the ``taihu``
+machine is hardly emulated at all (e.g. neither the LCD nor the USB part had
+been implemented), so there is not much value added by this board. Use the
+``ref405ep`` machine instead.
+
 Backend options
 ---------------
 
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index b4249f4626e6..f1623aa622a6 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -547,6 +547,7 @@ static void taihu_class_init(ObjectClass *oc, void *data)
     mc->init = taihu_405ep_init;
     mc->default_ram_size = 0x08000000;
     mc->default_ram_id = "taihu_405ep.ram";
+    mc->deprecation_reason = "incomplete, use 'ref405ep' instead";
 }
 
 static const TypeInfo taihu_type = {
-- 
2.31.1


