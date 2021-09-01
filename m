Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE2F3FD718
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 11:44:17 +0200 (CEST)
Received: from localhost ([::1]:49818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLMn2-0004m4-5c
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 05:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mLMky-0001yl-Sp; Wed, 01 Sep 2021 05:42:08 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:51025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mLMkw-0000cu-76; Wed, 01 Sep 2021 05:42:08 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.147])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0E7A0BBDD90E;
 Wed,  1 Sep 2021 11:41:56 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 1 Sep
 2021 11:41:55 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005cb01edc2-9a74-4a0e-848e-ec1443db859a,
 5EBA00A5E723AF1D17FBD8632F6684B6834AEADC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 0/8] ppc: cleanups  
Date: Wed, 1 Sep 2021 11:41:45 +0200
Message-ID: <20210901094153.227671-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 15dfef41-998d-4960-90bc-f440eaa2bf85
X-Ovh-Tracer-Id: 5396156780839996323
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedvuedtvdeikeekuefhkedujeejgffggffhtefglefgveevfeeghfdvgedtleevnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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

Hello,

This is a small series taking into account the comments made by David
and Greg while reviewing the pnv/p10 series.

It also adds a POWER10 DD2 CPU to the pseries machine.

Thanks,

C.

Cédric Le Goater (8):
  docs/system: ppc: Update the URL for OpenPOWER firmware images
  ppc/spapr: Add a POWER10 DD2 CPU
  ppc/pnv: Add a comment on the "primary-topology-index" property
  ppc/pnv: Remove useless variable
  ppc/pnv: Add an assert when calculating the RAM distribution on chips
  ppc/xive: Export priority_to_ipb() helper
  ppc/xive: Export xive_tctx_word2() helper
  ppc/pnv: Rename "id" to "quad-id" in PnvQuad

 docs/system/ppc/powernv.rst |  3 +--
 include/hw/ppc/pnv_core.h   |  2 +-
 include/hw/ppc/xive.h       | 16 ++++++++++++++++
 hw/intc/xive.c              | 26 ++++++--------------------
 hw/ppc/pnv.c                | 13 +++++++------
 hw/ppc/pnv_core.c           |  4 ++--
 hw/ppc/pnv_xscom.c          |  4 ++++
 hw/ppc/spapr_cpu_core.c     |  1 +
 8 files changed, 38 insertions(+), 31 deletions(-)

-- 
2.31.1


