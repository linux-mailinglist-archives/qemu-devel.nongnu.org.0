Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6364210FDB9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 13:35:26 +0100 (CET)
Received: from localhost ([::1]:52720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ic7On-0002At-ED
	for lists+qemu-devel@lfdr.de; Tue, 03 Dec 2019 07:35:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48812)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhengxiang9@huawei.com>) id 1ic7JL-00083A-As
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 07:29:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhengxiang9@huawei.com>) id 1ic7JJ-0003f9-Ls
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 07:29:46 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:40888 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
 id 1ic7JC-0003Q6-Fn; Tue, 03 Dec 2019 07:29:39 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 493BF2DA8E0A56A3B62F;
 Tue,  3 Dec 2019 20:29:31 +0800 (CST)
Received: from HGHY4Z004218071.china.huawei.com (10.133.224.57) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Tue, 3 Dec 2019 20:29:21 +0800
From: Xiang Zheng <zhengxiang9@huawei.com>
To: <peter.maydell@linaro.org>, <thuth@redhat.com>, <lvivier@redhat.com>
Subject: [PATCH 0/5] tests: Enable fw_cfg tests on AArch64
Date: Tue, 3 Dec 2019 20:27:48 +0800
Message-ID: <20191203122753.19792-1-zhengxiang9@huawei.com>
X-Mailer: git-send-email 2.15.1.windows.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: lersek@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kraxel@redhat.com, wanghaibin.wang@huawei.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are quite a few tests disabled on AArch64 such as fw_cfg-tests.
This patch series fix some problems in test code and adapt it to
virt machine.

Xiang Zheng (5):
  tests: fw_cfg: Rename pc_fw_cfg_* to fw_cfg_*
  tests: fw_cfg: Support read/write of fw_cfg registers on aarch64
  tests: fw_cfg: Use virt as default machine in fw_cfg-test.c
  hw/arm/virt: Add FW_CFG_RAM_SIZE and FW_CFG_MAX_CPUS into fw_cfg
  tests: Enable fw_cfg test on aarch64

 hw/arm/virt.c            |   3 ++
 tests/Makefile.include   |   1 +
 tests/fw_cfg-test.c      | 113 ++++++++++++++++++++++++++-------------
 tests/hd-geo-test.c      |   6 +--
 tests/libqos/fw_cfg.c    |  17 +++++-
 tests/libqos/fw_cfg.h    |  20 +++++--
 tests/libqos/malloc-pc.c |   4 +-
 7 files changed, 115 insertions(+), 49 deletions(-)

-- 
2.19.1



