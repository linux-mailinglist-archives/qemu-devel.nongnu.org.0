Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD78C2AED54
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 10:19:42 +0100 (CET)
Received: from localhost ([::1]:33968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcmI1-0002G0-Jb
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 04:19:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kcmEh-0007Ld-28; Wed, 11 Nov 2020 04:16:15 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kcmEe-0004In-N4; Wed, 11 Nov 2020 04:16:14 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CWJxF6k7vzLwGf;
 Wed, 11 Nov 2020 17:15:45 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Nov 2020
 17:15:48 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 0/3] Fix LGPL information in the file headers
Date: Wed, 11 Nov 2020 02:42:20 +0800
Message-ID: <20201110184223.549499-1-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=ganqixin@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 02:48:17
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, zhang.zhanghailiang@huawei.com, laurent@vivier.eu,
 Gan Qixin <ganqixin@huawei.com>, kuhn.chenqun@huawei.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,
I saw some tasks to replace "LGPL version 2" with "LGPL version 2.1" in BiteSizedTasks. So I modified the file in the test folder that contains "LGPL version 2".

Thanks,
Gan Qixin

Gan Qixin (3):
  tests/migration: Fix LGPL information in the file headers
  tests/acceptance: Fix LGPL information in the file headers
  test: Fix LGPL information in the file headers

 tests/acceptance/pc_cpu_hotplug_props.py   | 2 +-
 tests/acceptance/x86_cpu_model_versions.py | 2 +-
 tests/io-channel-helpers.c                 | 2 +-
 tests/io-channel-helpers.h                 | 2 +-
 tests/migration/guestperf-batch.py         | 2 +-
 tests/migration/guestperf-plot.py          | 2 +-
 tests/migration/guestperf.py               | 2 +-
 tests/migration/guestperf/comparison.py    | 2 +-
 tests/migration/guestperf/engine.py        | 2 +-
 tests/migration/guestperf/hardware.py      | 2 +-
 tests/migration/guestperf/plot.py          | 2 +-
 tests/migration/guestperf/progress.py      | 2 +-
 tests/migration/guestperf/report.py        | 2 +-
 tests/migration/guestperf/scenario.py      | 2 +-
 tests/migration/guestperf/shell.py         | 2 +-
 tests/migration/guestperf/timings.py       | 2 +-
 tests/migration/stress.c                   | 2 +-
 tests/test-base64.c                        | 2 +-
 tests/test-bufferiszero.c                  | 2 +-
 tests/test-crypto-pbkdf.c                  | 2 +-
 tests/test-qgraph.c                        | 2 +-
 tests/test-uuid.c                          | 2 +-
 22 files changed, 22 insertions(+), 22 deletions(-)

-- 
2.23.0


