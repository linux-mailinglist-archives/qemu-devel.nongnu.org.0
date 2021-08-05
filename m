Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8A13E0F39
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 09:32:32 +0200 (CEST)
Received: from localhost ([::1]:51052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBXrj-0005Tx-Rm
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 03:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mBXqF-0002nD-2F; Thu, 05 Aug 2021 03:30:59 -0400
Received: from esa4.hc1455-7.c3s2.iphmx.com ([68.232.139.117]:21524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mBXqD-00045y-79; Thu, 05 Aug 2021 03:30:58 -0400
IronPort-SDR: apHBzlpypUKmFqoDvAtsYxsGspDFNS6wG8G32UmxdmPPUl3DbBT6jlwdBMDzcIrPxoETRDfMSf
 8XMo3ciUbrTxlQPGwUVxy3nR54qxN9z4ujyri83VSMIBdj45qpiop5+eNHLWJNktA+JXDQmPgw
 T/IXs3/j3Go+jo1PBzUcTxvcV35brBc9RP/WtxKdqxRldHFGgJtuDgBGeegnSVxZOLuxGWy7OG
 2HTP6+o2p5kYQV/IisTNs7XoW8S97FSiTuWRDizpa6mvzm4DrUjmEW268ZPtP4zRzsCgA9ksuw
 xBBTLKCcU/7FprjvW85X9FEi
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="39050093"
X-IronPort-AV: E=Sophos;i="5.84,296,1620658800"; d="scan'208";a="39050093"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
 by esa4.hc1455-7.c3s2.iphmx.com with ESMTP; 05 Aug 2021 16:30:51 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com
 [192.168.83.66])
 by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D33E6AB6A;
 Thu,  5 Aug 2021 16:30:50 +0900 (JST)
Received: from yto-om2.fujitsu.com (yto-om2.o.css.fujitsu.com [10.128.89.163])
 by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DAA66E37C2;
 Thu,  5 Aug 2021 16:30:49 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by yto-om2.fujitsu.com (Postfix) with ESMTP id B022B400C23D1;
 Thu,  5 Aug 2021 16:30:49 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] Add support for Fujitsu A64FX processor
Date: Thu,  5 Aug 2021 16:30:42 +0900
Message-Id: <20210805073045.916622-1-ishii.shuuichir@fujitsu.com>
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
Cc: ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the v3 patch series.

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

For patch 2, A64FX processor can now be used by specifying the -cpu
a64fx option when the -macine virt option is specified.

For patch 3, added A64FX processor related tests.

Shuuichirou Ishii (3):
  target-arm: cpu64: Add support for Fujitsu A64FX
  hw/arm/virt: target-arm: Add A64FX processor support to virt machine
  tests/arm-cpu-features: Add A64FX processor related tests

 docs/system/arm/virt.rst       |  1 +
 hw/arm/virt.c                  |  1 +
 target/arm/cpu64.c             | 44 ++++++++++++++++++++++++++++++++++
 tests/qtest/arm-cpu-features.c |  3 +++
 4 files changed, 49 insertions(+)

-- 
2.27.0


