Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443D6639AF8
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 14:23:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozHbw-00056Z-AK; Sun, 27 Nov 2022 08:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1ozHbI-0004ut-2i
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 08:21:41 -0500
Received: from mail-out-2a.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1ozHbG-0002QT-6d
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 08:21:39 -0500
X-IPAS-Result: =?us-ascii?q?A2DlBABPY4Nj/5sagoZaHgEBCxIMQINUgwSETpEbgRacN?=
 =?us-ascii?q?YFqDwEBAQEBAQEBAQgBRAQBAYUBAgKFCiY4EwECBAEBAQEDAgMBAQEBAQEDA?=
 =?us-ascii?q?QEGAQEBAQEBBgSBHYUvRoZWJwQLAUEFMAUCJgJfDgWCfYMjrXF/M4EBhHCcT?=
 =?us-ascii?q?QkBgQosiQaCTogSgRWCc4UfNzCDCoJnBJhBHDcDCQMHBSwdQAMLGA0WMgoTM?=
 =?us-ascii?q?hsxJw4JHxwlDQUGEgMgbAUHOg8oL2QrHBsHgQwqKBUDBAQDAgYTAyICDSkxF?=
 =?us-ascii?q?AQpEw0rJ28JAgMiagMDBCgsAwlAByckPAdWOgUDAg8gOAYDCQMCIlRyLxIUB?=
 =?us-ascii?q?QMLFSUIBUsECDkFBlISAgoRAxIPLEUOSD45FgYnQgEwDg4TA11LHYEBBGI5g?=
 =?us-ascii?q?RUxL5lrgyoBAYEOTYw/iEGwFQeCH6IKTJZ7ApIclzeiW0yEKAIEAgQFAhaBe?=
 =?us-ascii?q?YF+cYM2UhcCD49GAQ2NHXQ7AgcBCgEBAwmKHwEB?=
IronPort-Data: A9a23:+gIiOKJm6yE93AlXFE+RjZQlxSXFcZb7ZxGr2PjKsXjdYENShWEBm
 2AaXDjQaf/bZmfyLYwka4Tk9BgP7ZOEz9BlSFMd+CA2RRqmiyZk6fexcx2sZXPCdqUvaGo9s
 q3yv/GZdJhcokf0/0vraP64xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2LBVOCvQ/
 4KsyyHjEAX9gWQtazhLs/vrRC5H5ZwehhtJ5jTSWtgW5Dcyp1FNZLoDKKe4KWfPQ4U8NoZWk
 M6akdlVVkuAl/scIovNfoTTKyXmcZaOVeS6sUe6boD56vR0jnFojvxrZKJ0hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0aBuoNf6zXaDXcO7lknjKVWwxvNVBUwKeogH1f11Ck1y3
 KlNQNwNRkjra+Oe+o2HasRcw/95aeOtJpwDujRpwXfVAJ7KQ7iaGPmMvIQAmm1uwJkTQJ4yZ
 OJAAdZrRAjHaRxGIREND58+meqsrmPgbz0doVuepacxpWTepOB0+OK8a4ONIYDRLSlTtkfJo
 Xv8+W3lO0sxc+2YyQGM1HL3l+CayEsXX6pXTtVU7MVCmVCW2ykfBQMbUXO9pv+2jFP4XMhQQ
 2QM9zYjt+43/V2nQ935dxm5pneeuVgbQdU4LgEhwBuS1qrZ80OCXC0OCCRedNxjvcNwSTFCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:KrOUIK68/RToQ1OMKQPXwD/XdLJyesId70hD6qkXc203TiX4ra
 CTdZsguyMc5Ax8ZJhCo7290cu7MBHhHPdOiOF7V4tKNDOW3VdAR7sC0WKN+VLd8x6SzJ8k6Y
 5QN5JvDMTqAUk/qcrh+gG3H+86xtOK6rqliI7lvhNQZDAvUbFl9hx0G0KgEkNwTBRbHpYYE5
 mR7NdKqlObCBMqhoDRPAhiY8Hz4+P00L/nexQCDx4i5BKjnDOz9aSSKWng4isj
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.96,198,1665439200"; d="scan'208";a="29310343"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-2a.itc.rwth-aachen.de with ESMTP; 27 Nov 2022 14:21:30 +0100
Received: from localhost.localdomain (2a02:908:1088:5920:e2b3:9876:72f1:5569)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Sun, 27 Nov 2022 14:21:30 +0100
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <tobias.roehmel@rwth-aachen.de>
Subject: [PATCH v5 0/7] Add ARM Cortex-R52 CPU
Date: Sun, 27 Nov 2022 14:21:05 +0100
Message-ID: <20221127132112.300331-1-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:e2b3:9876:72f1:5569]
X-ClientProxiedBy: rwthex-s1-a.rwth-ad.de (2a00:8a60:1:e500::26:152) To
 RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155)
Received-SPF: pass client-ip=2a00:8a60:1:e501::5:45;
 envelope-from=tobias.roehmel@rwth-aachen.de;
 helo=mail-out-2a.itc.rwth-aachen.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Tobias Röhmel <tobias.roehmel@rwth-aachen.de>

No worries about the delay. I'm glad you are looking at it :)

v5:
1. Adjusted the spacing as requested
2. Removed cp 15
3. Rebased and put assert back
4. Fixed indention issues
5.
- Made hprbar etc pointers instead of arrays
- Fixed the logic/bound issues
- For the VMSTATE change I looked at pmsav7.drbar which
  is a pointer and is handled as an array. I assume
  this works for hprbar/hprlar
6.
- In pmsav7_use_background_region there are 2 cases were we don't
  want to look at the SCTLR_BR bit (c1.3 in manual supplement):
  - The respective MPU is enabled and
    - We are in the second translation stage
    - We are in EL0
  I think the code does that now and doesn't influence any other
  code. I put the V8 check in there because the function is also
  called from get_phys_addr_pmsav7
- I put the fi->level behaviour back the way it was
- Fixed UWXN/WXN

Tobias Röhmel (7):
  target/arm: Don't add all MIDR aliases for cores that implement PMSA
  target/arm: Make RVBAR available for all ARMv8 CPUs
  target/arm: Make stage_2_format for cache attributes optional
  target/arm: Enable TTBCR_EAE for ARMv8-R AArch32
  target/arm: Add PMSAv8r registers
  target/arm: Add PMSAv8r functionality
  target/arm: Add ARM Cortex-R52 CPU

 target/arm/cpu.c          |  30 +++-
 target/arm/cpu.h          |   6 +
 target/arm/cpu_tcg.c      |  42 +++++
 target/arm/debug_helper.c |   3 +
 target/arm/helper.c       | 333 ++++++++++++++++++++++++++++++++++++--
 target/arm/internals.h    |   4 +
 target/arm/machine.c      |  28 ++++
 target/arm/ptw.c          | 137 +++++++++++++---
 target/arm/tlb_helper.c   |   4 +
 9 files changed, 550 insertions(+), 37 deletions(-)

-- 
2.34.1


