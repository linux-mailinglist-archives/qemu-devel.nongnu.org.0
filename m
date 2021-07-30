Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3613DB1C3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 05:09:48 +0200 (CEST)
Received: from localhost ([::1]:34056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9IuA-0006f0-Tr
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 23:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m9It3-0004Rr-Nv; Thu, 29 Jul 2021 23:08:37 -0400
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139]:33708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1m9It2-0000JJ-6K; Thu, 29 Jul 2021 23:08:37 -0400
IronPort-SDR: eZQEjNG0yatZVO2v1o2O+xbKJOF7HxAMe9AWKQZGbYRqs8pjzWD4jQoEQc9qrTR3D5hVL7lRjq
 QTkhigqx2l6lOWi/nedL/nwPhyCFxBYSEBKTrzXKgCSOWLZifUJFr8d0nJEl3vMeCeu1NLbYh7
 XF/eAkt1jmUdbVbP1nVQda2fk/rHqy2Puz3vhe5DsOMgj3x9Th9ilhMBs4QG/wFNP0M3mPgVen
 sqUWtJuADJJQHiLu7ztAxeGWkZ0reJ4qokxXj4gMozidOiHlSm8PFaX110yP8A1JPDcUs2lmoZ
 ujN2dq2d3/4IyTdNGBl1h85M
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="38459305"
X-IronPort-AV: E=Sophos;i="5.84,280,1620658800"; d="scan'208";a="38459305"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
 by esa6.hc1455-7.c3s2.iphmx.com with ESMTP; 30 Jul 2021 12:08:33 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com
 [192.168.83.66])
 by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E2D706DAE6;
 Fri, 30 Jul 2021 12:08:31 +0900 (JST)
Received: from oym-om3.fujitsu.com (oym-om3.o.css.fujitsu.com [10.85.58.163])
 by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 33B23E3338;
 Fri, 30 Jul 2021 12:08:31 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by oym-om3.fujitsu.com (Postfix) with ESMTP id F35104007084D;
 Fri, 30 Jul 2021 12:08:30 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] Add support for Fujitsu A64FX processor
Date: Fri, 30 Jul 2021 12:08:18 +0900
Message-Id: <20210730030821.231106-1-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Received-SPF: pass client-ip=68.232.139.139;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa6.hc1455-7.c3s2.iphmx.com
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
Cc: ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the v2 patch series.

v2:
No features have been added or removed from the v1 patch series. Removal
of unused definitions that were added in excess, and consolidation of
patches for the purpose of functional consistency.

For patch 1, ARM_FEATURE_A64FX is not used in the v1 patch series, so it
was deleted this time, and will be added again when it is used.

For patch 2, since the a64fx_cp_reginfo structure is not used in the v1
patch series, I deleted the empty definition and added the TODO in the
aarch64_a64fx_initfn function. Also fixed the appearance, and cleaned up
and removed some things for patch consistency.

For patch 3, a64fx was added to docs/system/arm/virt.rst and
hw/arm/virt.c respectively, as a modification to the patch consistency
cleanup done in patch 2.

Shuuichirou Ishii (3):
  target-arm: delete ARM_FEATURE_A64FX
  target-arm: cpu64: Add support for Fujitsu A64FX
  target-arm: Add A64FX processor support to virt machine

 hw/arm/virt.c      |  2 +-
 target/arm/cpu.h   |  1 -
 target/arm/cpu64.c | 10 +++-------
 3 files changed, 4 insertions(+), 9 deletions(-)

-- 
2.27.0


