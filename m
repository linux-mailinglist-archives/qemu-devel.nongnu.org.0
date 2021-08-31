Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B79A3FC436
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 10:32:13 +0200 (CEST)
Received: from localhost ([::1]:55882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKzBj-000861-Lv
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 04:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKz9Q-0005qD-Is; Tue, 31 Aug 2021 04:29:48 -0400
Received: from esa3.hc1455-7.c3s2.iphmx.com ([207.54.90.49]:47902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKz9O-0007v0-B0; Tue, 31 Aug 2021 04:29:47 -0400
IronPort-SDR: QHWrKT6cM8w2TaeiB51ftQXV4gybvFeW9XHs0414HDs7b92H4jfEEWT8Wov1tQKIhkalnBX7vP
 mc54C0f6uTN8C5CzLW1IEXVP0jbyrH59xBCDHA2MTdDsHorjOmDwm1cKygcVpaaNSgA7owvJhW
 Jycs16xm9FpE6g4aPvvI29WCxwCbQ0muLhxEdeiKpboOaqvqNU8AzNcvy0ygjKTP7B1JHq9ln+
 sQNaM0EYh0NSN1metTznsaskVkLznWUqzqiB6h4pQWT4WIScpQT0i1G/1jtIyUGTFGC8/2nEtf
 Lve2d1dYovQCB1lB15Y/jZ8X
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="42534146"
X-IronPort-AV: E=Sophos;i="5.84,365,1620658800"; d="scan'208";a="42534146"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
 by esa3.hc1455-7.c3s2.iphmx.com with ESMTP; 31 Aug 2021 17:29:41 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com
 [192.168.83.65])
 by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A6646AB6C;
 Tue, 31 Aug 2021 17:29:40 +0900 (JST)
Received: from oym-om3.fujitsu.com (oym-om3.o.css.fujitsu.com [10.85.58.163])
 by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CB68DC554D;
 Tue, 31 Aug 2021 17:29:39 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by oym-om3.fujitsu.com (Postfix) with ESMTP id 9F2B34019865E;
 Tue, 31 Aug 2021 17:29:39 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org,
	drjones@redhat.com,
	qemu-arm@nongnu.org
Subject: [PATCH v6 0/3] Add support for Fujitsu A64FX processor
Date: Tue, 31 Aug 2021 17:29:37 +0900
Message-Id: <20210831082940.2811719-1-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Received-SPF: pass client-ip=207.54.90.49;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa3.hc1455-7.c3s2.iphmx.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, ishii.shuuichir@fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the v6 patch series.

v6:
For patch 1[1/3], added the commit messages that the Identification registers
value are defined based on FX700, and has been tested and confirmed.

v5:
A64FX supports only 128, 256, and 512bit SVE vector lengths,
but the QEMU implementation prior to v4 did not have an API
to specify a specific vector length.
Andrew has implemented an API (cpu->sve_vq_supported, commit:5401b1e08d
etc) to solve this, so we have changed the implementation to use that API.

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
The Identification registers value are defined based on the FX700,
and have been tested and confirmed.

For patch 2, A64FX processor can now be used by specifying the -cpu
a64fx option when the -macine virt option is specified.

For patch 3, added A64FX processor related tests.

Shuuichirou Ishii (3):
  target-arm: Add support for Fujitsu A64FX
  hw/arm/virt: target-arm: Add A64FX processor support to virt machine
  tests/arm-cpu-features: Add A64FX processor related

 docs/system/arm/virt.rst       |  1 +
 hw/arm/virt.c                  |  1 +
 target/arm/cpu64.c             | 48 ++++++++++++++++++++++++++++++++++
 tests/qtest/arm-cpu-features.c | 13 +++++++++
 4 files changed, 63 insertions(+)

-- 
2.27.0


