Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C06242CCFA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 23:42:39 +0200 (CEST)
Received: from localhost ([::1]:44876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mam1G-0002Z4-CP
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 17:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1malzW-0008PK-1E
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:40:50 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:40221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1malzT-0004pm-I5
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:40:49 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.102])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B1E1F20BDA;
 Wed, 13 Oct 2021 21:40:44 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 13 Oct
 2021 23:40:43 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00537ff6813-e7dc-4927-b804-7649b48eca46,
 ADB6EDD73587FDF9B2583A0B30D51DAD1F8B0393) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 0/3] ppc: Add QOM interface for machine check injection
Date: Wed, 13 Oct 2021 23:40:39 +0200
Message-ID: <20211013214042.618918-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7c85923c-5e38-4c57-9b18-3d282c900280
X-Ovh-Tracer-Id: 5934618410469985187
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefggeekfeeifffhvdejffdtieetleeukeejudduudduhfeghefhheeuleegfedutdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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

This is a rework of Nick's patchset [*] adding mce injection for spapr
and pnv.  

Thanks,

C.

[*] https://lore.kernel.org/qemu-devel/20200325144147.221875-1-npiggin@gmail.com/

Changes :
 - moved definition under "hw/ppc/mce.h"
 - renamed to PPCMceInjection
 - simplified injection call in hmp_mce
 - extended with QMP support 
 - moved code under spapr_cpu_core.c pnv_core.c
 - removed superfluous cpu_synchronize_state()
 - clear previous setting in SPR_SRR1
 

Nicholas Piggin (3):
  ppc: Add QOM interface for machine check injection
  ppc/spapr: Implement mce injection
  ppc/pnv: Implement mce injection

 qapi/misc-target.json           | 26 +++++++++++++++
 include/hw/ppc/mce.h            | 31 ++++++++++++++++++
 include/hw/ppc/pnv_core.h       |  4 +++
 include/hw/ppc/spapr_cpu_core.h |  2 ++
 target/ppc/cpu.h                |  1 +
 hw/ppc/pnv.c                    |  3 ++
 hw/ppc/pnv_core.c               | 27 ++++++++++++++++
 hw/ppc/spapr.c                  |  4 +++
 hw/ppc/spapr_cpu_core.c         | 27 ++++++++++++++++
 target/ppc/excp_helper.c        | 12 +++++++
 target/ppc/monitor.c            | 56 +++++++++++++++++++++++++++++++++
 hmp-commands.hx                 | 20 +++++++++++-
 12 files changed, 212 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/ppc/mce.h

-- 
2.31.1


