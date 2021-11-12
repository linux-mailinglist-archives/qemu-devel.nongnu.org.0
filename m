Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1A644E57E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 12:20:08 +0100 (CET)
Received: from localhost ([::1]:60380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlUbH-00043A-Vg
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 06:20:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mlUXH-0005dh-8x
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:16:03 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:41449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mlUXF-00078K-Fc
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:15:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.98])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id C42F3206AC;
 Fri, 12 Nov 2021 11:15:45 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 12 Nov
 2021 12:15:45 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0041c05b51a-fd6d-4c8c-ad3b-23f665eaf822,
 F9CF0200ECD1631E1678AE6CCE6AA99FD507468A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>
Subject: [PULL 0/3] ppc 6.2 queue
Date: Fri, 12 Nov 2021 12:15:40 +0100
Message-ID: <20211112111543.2556837-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 60e50262-2660-4eaa-9e1a-8d5e07fb677b
X-Ovh-Tracer-Id: 5539709019270646566
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrvdefgddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeutdeikeeklefguddvieejueejhfehfeejtdelgedtheetjeetuddutdejfeejkeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 0a70bcf18caf7a61d480f8448723c15209d128ef:

  Update version for v6.2.0-rc0 release (2021-11-09 18:22:57 +0100)

are available in the Git repository at:

  https://github.com/legoater/qemu/ tags/pull-ppc-20211112

for you to fetch changes up to d139786e1b3d67991e6cb49a8a59bb2182350285:

  ppc/mmu_helper.c: do not truncate 'ea' in booke206_invalidate_ea_tlb() (2021-11-11 11:35:13 +0100)

----------------------------------------------------------------
ppc 6.2 queue :

* Fix of a regression in floating point load instructions (Matheus)
* Associativity fix for pseries machine (Daniel)
* tlbivax fix for BookE machines (Danel)

----------------------------------------------------------------
Daniel Henrique Barboza (2):
      spapr_numa.c: fix FORM1 distance-less nodes
      ppc/mmu_helper.c: do not truncate 'ea' in booke206_invalidate_ea_tlb()

Matheus Ferst (1):
      target/ppc: Fix register update on lf[sd]u[x]/stf[sd]u[x]

 hw/ppc/spapr_numa.c                | 62 +++++++++++++++++++-------------------
 target/ppc/mmu_helper.c            |  2 +-
 target/ppc/translate/fp-impl.c.inc |  2 +-
 3 files changed, 33 insertions(+), 33 deletions(-)

