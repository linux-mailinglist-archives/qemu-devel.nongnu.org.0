Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11967609532
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Oct 2022 19:38:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omeir-00089m-CQ
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 13:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1omd2R-0005zi-UW
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 11:37:24 -0400
Received: from mail-out-3.itc.rwth-aachen.de ([2a00:8a60:1:e501::5:48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tobias.roehmel@rwth-aachen.de>)
 id 1omd2N-0006L3-9P
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 11:37:23 -0400
X-IPAS-Result: =?us-ascii?q?A2ANBAAhREVj/5sagoZaHQEBAQEJARIBBQUBQIFPhH6ET?=
 =?us-ascii?q?pIrngALAQEBAQEBAQEBCAFCBAEBhQECAoR3JjgTAQIEAQEBAQMCAwEBAQEBA?=
 =?us-ascii?q?QMBAQYBAQEBAQEGBIEchS9GhkUnDwFBBTAFAiYCXw4Fgn2DIa0UgTKBAYRwi?=
 =?us-ascii?q?XEJAYEHLIhRgiuIBIEVgnOFVjCDCoJmBJo5HDgDCQMHBSwdQAMLHw0WNRgDF?=
 =?us-ascii?q?AMFIQcDGQ8jDQ0EHQwDAwUlAwICGwcCAgMCBhMFAgI1GDQIBAgEKyQPBQIHL?=
 =?us-ascii?q?wUELwIeBAUGEQgCFgIGBAQEBBUCEAgCCCYXBxMzGQEFMicOCSEcKA0FBhMDI?=
 =?us-ascii?q?G8FBzsPKC9pKx0bB4EMKigVAwQEAwIGEwMgAg0pMRQEKRMPLQcpcQkCAyJqA?=
 =?us-ascii?q?wMEKCwDCUAHKCQ8B1g6BQMCECI8BgMJAwIkWXQwEhQFAw0XJggFNxsECDwCB?=
 =?us-ascii?q?QZSEwIKEgMSDy1JD0o+OxcInFh7FIJornCTMweCG6FqTJZ0ApIWlxGjHoQoA?=
 =?us-ascii?q?gQCBAUCFoF4gX5xgzZRFwIPnHJzOwIGAQoBAQMJiwoBAQ?=
IronPort-Data: A9a23:rPjzd6geyxpZlQ6TfwaM6PCNX161EREKZh0ujC45NGQN5FlHY01je
 htvDTiHafnZNjDyL41/aIm08EMG68SAyoRkGwI/qiA8Q35jpJueD7x1DKtR0wC6c5efFhI3t
 63yTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtHR7zml4
 LsemOWCfg74s9JIGjhMsfja8Eo25K6aVA4w5zTSW9ga5DcyqFFIVPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhViroz6ZGBiuVIKM0SWuSWukwRpukoNHKdGNR0H223hc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE8cdgUFMEI7Mk0etLUWMfq
 KQfaz8PYUXW7w626OrTpuhEvPsfDOTbebhF/1sm1y7FDbMvTdbPTs0m5/cBh2t235sWW6yAI
 ZNENFKDbzyZC/FLEksQApM3h6GygXT/djBcgEiKuapy6mHYzAF3lrTgWDbQUoXVGJkOxxrB+
 Aoq+UzJCDMYKfnD1wC/0Vj8lMOUgQzhA9wNQejQGvlCxQf7KnYoIAQbUEb+rfSnh0qWXdVZJ
 EoJvC00osAa7EG3Q8O7WhSprHOAujYYWtxZCep87xuCooLN/geSMXQeST5EZdgOrdI3Tj0s3
 RmCmNaBONB0mKeKVXKQ5vKP93a4fzIKMW9HbCNCQQZtD8TfnbzfRynnFr5LeJNZRPWvcd0s6
 1hmdBQDuog=
IronPort-HdrOrdr: A9a23:7n0egaw5HCSSGE6RHxaxKrPwFb1zdoMgy1knxilNoHtuA6ulfq
 GV7ZAmPHrP41wssR4b9OxoR5PwJ080maQb3WBpB8bBYOCEghrMEGgB1+vfKlTbckXDH4hmu5
 uIGJIeNDSfNzRHZL7BkWqF+t8bsaC6zJw=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.95,176,1661810400"; d="scan'208";a="175431416"
Received: from rwthex-s2-b.rwth-ad.de ([134.130.26.155])
 by mail-in-3.itc.rwth-aachen.de with ESMTP; 23 Oct 2022 17:37:11 +0200
Received: from localhost.localdomain (2a02:908:1088:5920:10a7:3a65:7c9d:55ef)
 by RWTHEX-S2-B.rwth-ad.de (2a00:8a60:1:e500::26:155) with Microsoft
 SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.15; Sun, 23 Oct 2022 17:37:11 +0200
From: <tobias.roehmel@rwth-aachen.de>
To: <qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, =?UTF-8?q?Tobias=20R=C3=B6hmel?=
 <quic_trohmel@quicinc.com>
Subject: [PATCH v4 0/7] Add ARM Cortex-R52 CPU
Date: Sun, 23 Oct 2022 17:36:52 +0200
Message-ID: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2a02:908:1088:5920:10a7:3a65:7c9d:55ef]
X-ClientProxiedBy: rwthex-s4-b.rwth-ad.de (2a00:8a60:1:e500::26:165) To
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tobias Röhmel <quic_trohmel@quicinc.com>

Thanks again for all the help!

Here is v4:
2. Made patch cleaner
3. Changed commit message
4. Replaced V8_R flag with ARM_FEATURE_PMSA|ARM_FEATURE_V8
5.
Reworked the code to use existing pmsav7 variables
Added migration support
Added VSCTLR:
I didn't add any functionality for it because I think
Qemu doesn't model the behaviour it influences.
6.
Lots of cleanup. I think I overcomplicated this a bit because
of a misunderstanding. I thought HCR_VM is independent of enabling
the different MPUs, but I see now that it doesn't make sense to enable
HCR_VM when the MPUs are not enabled. I also think that there is an Error
in the armv8-r manual supplement in Figure C1-3. With all that figured out
the code for pmsav8r doesn't look that different from pmsav7 :)

Tobias Röhmel (7):
  target/arm: Don't add all MIDR aliases for cores that immplement PMSA
  target/arm: Make RVBAR available for all ARMv8 CPUs
  target/arm: Make stage_2_format for cache attributes optional
  target/arm: Enable TTBCR_EAE for ARMv8-R AArch32
  target/arm: Add PMSAv8r registers
  target/arm: Add PMSAv8r functionality
  target/arm: Add ARM Cortex-R52 CPU

 target/arm/cpu.c          |  32 +++-
 target/arm/cpu.h          |  12 ++
 target/arm/cpu_tcg.c      |  42 +++++
 target/arm/debug_helper.c |   3 +
 target/arm/helper.c       | 327 ++++++++++++++++++++++++++++++++++++--
 target/arm/internals.h    |   4 +
 target/arm/machine.c      |  28 ++++
 target/arm/ptw.c          | 148 ++++++++++++++---
 target/arm/tlb_helper.c   |   3 +
 9 files changed, 562 insertions(+), 37 deletions(-)

-- 
2.34.1


