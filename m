Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883B2644137
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 11:27:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2V9H-0007EV-Or; Tue, 06 Dec 2022 05:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1p2V93-0007Dt-CF
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:25:49 -0500
Received: from mail-out-3.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1p2V8t-00028m-SK
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 05:25:45 -0500
X-IPAS-Result: =?us-ascii?q?A2CWDgDNF49j/5sagoZaHgEBCxIMQIFRhQmETpIynCOBf?=
 =?us-ascii?q?Q8BAQEBAQEBAQEIAUQEAQGFAQIChREmOgQNAQIEAQEBAQMCAwEBAQEBAQMBA?=
 =?us-ascii?q?QYBAQEBAQEGBIEdhS9GhlgnDwFBBTAFAiYCXw4Fgn6DI61KgTKBAYRxnE0JA?=
 =?us-ascii?q?YEKLYkHgk6IEoEVgnOFVjCDCoJnBIEUlgEObhw3AwkDBwUsHUADCxgNFjIKE?=
 =?us-ascii?q?zI1HEwrHBsHgQwqKBUDBAQDAgYTAyACDSgxFAQpEw0rJm0JAgMhZgMDBCgsA?=
 =?us-ascii?q?wlAByYmPAdWNwUDAg8gOAYDCQMCH1R0LxIUBQMLFSUIBUkECDcFBlMSAgoRE?=
 =?us-ascii?q?g8sRQ5IPjkWBidBATAODhMDXUsdgQEEYDmBFS8umxOBD4EegSABwy8Hgh+iD?=
 =?us-ascii?q?kyWfQKSHZdAohKBGIQoAgQCBAUCFoF8CYFycYM2UhcCD5xxdDsCBwEKAQEDC?=
 =?us-ascii?q?YofAQE?=
IronPort-Data: A9a23:mYsGtq6NO1CTCtqFzLorNwxRtGfGchMFZxGqfqrLsTDasY5as4F+v
 mpKWjrTPK3YY2v0c9hzYY+3pk8Cup+Ez9NmHFZo/nwzZn8b8sCt6fZ1j6vTF37IcpeTHBoPA
 +E2MISowBUcFyeEzvuVGuG96yM6jMlkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1rlV
 eja/ouOZjdJ5xYuajhOsvjb9ks11BjPkGpwUmIWNKgjUGD2yiF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum1hK6b5Ofbi1q/UTe5I5mbqZGORcP49m+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVPKCSDXjCCd86HJW1DGxvJ/MRw3BKgBwLpGWyZk1
 flbGhlYO3hvh8ruqF66YtNTuuQOHIzQZsY1/Gt/0TGcBPpgTZ2rr6fivIQEmm5r3oYUQ7CHO
 pdxhTlHNXwsZzVTPV0WAYl4huClhnzydxVCt06V4KM+6Gjeykp93dABNfKMJY3VGZoEwxfwS
 mTu4nulHjYRMoKlwGS8onW1o9/EsiPxV9dHfFG/3rsw6LGJ/UQKBRgLEFe2v/S9oki5Xd1ZN
 goT4CVGhbA/6EGxCNz0ThG1pHqsuh8aUsBXVeog52mwJrH8+RmFBmUUCyUbLdZgrtAqRXkj2
 hmFkrsFGABSjVFcclrFnp/8kN94EXJ9wbMqDcPccTY43g==
IronPort-HdrOrdr: A9a23:qJMHZaNWdrSG88BcTvujsMiBIKoaSvp037BL7SxMoHluGfBw+P
 rAoB1273HJYVQqOE3I6OrgBEDoexq1n/NICO8qTNWftWLdyQiVxe9ZnOzf6gylNyri9vNMkY
 dMGpIObuEY1GIK6PoSNjPId+od/A==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.96,222,1665439200"; d="scan'208";a="179747959"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-3.itc.rwth-aachen.de with ESMTP; 06 Dec 2022 11:25:30 +0100
Received: from localhost.localdomain (2a02:908:1088:5920:7fc5:a897:a756:e2fb)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Tue, 6 Dec 2022 11:25:30 +0100
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v6 0/7] Add ARM Cortex-R52 CPU
Date: Tue, 6 Dec 2022 11:24:57 +0100
Message-ID: <20221206102504.165775-1-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:7fc5:a897:a756:e2fb]
X-ClientProxiedBy: rwthex-s2-a.rwth-ad.de (2a00:8a60:1:e500::26:154) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:48;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-3.itc.rwth-aachen.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

Sorry for the "Reviewed-by" messup. I missed that on the explanation
page. Thanks again for the review :)

v6:
patch 5:
- I also changed HPRENR from ARM_CP_ALIAS to ARM_CP_NO_RAW.
  Its state is also present in the HPRLAR registers,
  but it doesn't make sense to access it raw. (I think)
- I'm freeing the PRBAR/... strings explicitly now since
  I don't know how to use autofree in this setup correctly.
  Maybe {} around the part were the string is created/used,
  such that it is dropped at }?



Tobias Röhmel (7):
  target/arm: Don't add all MIDR aliases for cores that implement PMSA
  target/arm: Make RVBAR available for all ARMv8 CPUs
  target/arm: Make stage_2_format for cache attributes optional
  target/arm: Enable TTBCR_EAE for ARMv8-R AArch32
  target/arm: Add PMSAv8r registers
  target/arm: Add PMSAv8r functionality
  target/arm: Add ARM Cortex-R52 CPU

 target/arm/cpu.c          |  34 +++-
 target/arm/cpu.h          |   6 +
 target/arm/cpu_tcg.c      |  42 +++++
 target/arm/debug_helper.c |   3 +
 target/arm/helper.c       | 336 ++++++++++++++++++++++++++++++++++++--
 target/arm/internals.h    |   4 +
 target/arm/machine.c      |  28 ++++
 target/arm/ptw.c          | 136 ++++++++++++---
 target/arm/tlb_helper.c   |   4 +
 9 files changed, 553 insertions(+), 40 deletions(-)

-- 
2.34.1


