Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 331123E9E65
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 08:24:10 +0200 (CEST)
Received: from localhost ([::1]:57486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE48P-0008OB-5H
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 02:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mE46I-0004ww-T5; Thu, 12 Aug 2021 02:21:58 -0400
Received: from esa4.hc1455-7.c3s2.iphmx.com ([68.232.139.117]:31997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mE46H-00013a-0K; Thu, 12 Aug 2021 02:21:58 -0400
IronPort-SDR: tCtwidWFow+CLdILVxJtQf7Ufow1iSRUfTUGHQ30qFX82QiX8wqjXkPU7mM73Xe0fPLY+Xd2jb
 v+CFScdr4jldxXRga8KW17ipCnFFWX1GlB+LQRnkOnK5VuZhB2opSv5owvmDYuu2ARFmpswAd0
 VLaaj7yjy1R+iNuBlfnvcVu689oXlpnExrnhfCRgOwTBWHUDvUAkP0oqG1gDd7yJSHBdWrIa/5
 o/RgPPmRMymEQJwDZhDlRffw6WZq0DEnUv6gn8L33B8a9Gi7agMTsbbRkHssZLsaybMKspQnKx
 Q3S7kRjDwOaEEl2qfUiocnsT
X-IronPort-AV: E=McAfee;i="6200,9189,10073"; a="39768468"
X-IronPort-AV: E=Sophos;i="5.84,315,1620658800"; d="scan'208";a="39768468"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
 by esa4.hc1455-7.c3s2.iphmx.com with ESMTP; 12 Aug 2021 15:21:52 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com
 [192.168.83.64])
 by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C611E9E8D;
 Thu, 12 Aug 2021 15:21:51 +0900 (JST)
Received: from yto-om2.fujitsu.com (yto-om2.o.css.fujitsu.com [10.128.89.163])
 by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 80285C9CCF;
 Thu, 12 Aug 2021 15:21:50 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by yto-om2.fujitsu.com (Postfix) with ESMTP id 5F0D94007B7FD;
 Thu, 12 Aug 2021 15:21:50 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 0/3] Add support for Fujitsu A64FX processor
Date: Thu, 12 Aug 2021 15:04:37 +0900
Message-Id: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Received-SPF: pass client-ip=68.232.139.117;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa4.hc1455-7.c3s2.iphmx.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: drjones@redhat.com, qemu-devel@nongnu.org, ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the v4 patch series.

v4:
The following changes have been made to match the SVE specification of
the A64FX processor.
- Implemented internally only the vector lengths of 128, 256, and 512 bit
  supported by the A64FX processor.
- Removed sve and sve-max-vq properties due to the above changes, and
  fixed them so that no explicit options can be specified.

v3:
When we created the v2 patch series, we based it on the v1 patch series
that had not been merged into the upstream, so we created the v3 patch
series as a patch series that can be applied independently.

v2:
No features have been added or removed from the v1 patch series. Removal
of unused definitions that were added in excess, and consolidation of
patches for the purpose of functional consistency.

For patch 1, Implemented Identification registers for A64FX processor.
HPC extension registers will be implemented in the future.
For SVE, the A64FX processor supports only 128,256 and 512bit vector lengths.

For patch 2, A64FX processor can now be used by specifying the -cpu
a64fx option when the -macine virt option is specified.

For patch 3, added A64FX processor related tests.

Shuuichirou Ishii (3):
  target-arm: Add support for Fujitsu A64FX
  hw/arm/virt: target-arm: Add A64FX processor support to virt machine
  tests/arm-cpu-features: Add A64FX processor related tests

 docs/system/arm/virt.rst       |  1 +
 hw/arm/virt.c                  |  1 +
 target/arm/cpu.c               | 27 ++++++++++++++++++----
 target/arm/cpu.h               |  1 +
 target/arm/cpu64.c             | 42 ++++++++++++++++++++++++++++++++++
 tests/qtest/arm-cpu-features.c |  2 ++
 6 files changed, 70 insertions(+), 4 deletions(-)

-- 
2.27.0


