Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BEB10FDE7
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 13:42:37 +0100 (CET)
Received: from localhost ([::1]:52772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ic7Vj-00067Q-Kp
	for lists+qemu-devel@lfdr.de; Tue, 03 Dec 2019 07:42:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48906)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhengxiang9@huawei.com>) id 1ic7JV-00084O-9m
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 07:29:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhengxiang9@huawei.com>) id 1ic7JN-0003iy-Lk
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 07:29:51 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:41160 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
 id 1ic7JI-0003Zf-5o; Tue, 03 Dec 2019 07:29:44 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4CC09DFCF0713DAA2A47;
 Tue,  3 Dec 2019 20:29:36 +0800 (CST)
Received: from HGHY4Z004218071.china.huawei.com (10.133.224.57) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Tue, 3 Dec 2019 20:29:25 +0800
From: Xiang Zheng <zhengxiang9@huawei.com>
To: <peter.maydell@linaro.org>, <thuth@redhat.com>, <lvivier@redhat.com>
Subject: [PATCH 5/5] tests: Enable fw_cfg test on aarch64
Date: Tue, 3 Dec 2019 20:27:53 +0800
Message-ID: <20191203122753.19792-6-zhengxiang9@huawei.com>
X-Mailer: git-send-email 2.15.1.windows.2
In-Reply-To: <20191203122753.19792-1-zhengxiang9@huawei.com>
References: <20191203122753.19792-1-zhengxiang9@huawei.com>
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

Now turn on the fw_cfg test for aarch64.

Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
---
 tests/Makefile.include | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 8566f5f119..180e0ed2b7 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -276,6 +276,7 @@ check-qtest-aarch64-y += tests/arm-cpu-features$(EXESUF)
 check-qtest-aarch64-y += tests/numa-test$(EXESUF)
 check-qtest-aarch64-y += tests/boot-serial-test$(EXESUF)
 check-qtest-aarch64-y += tests/migration-test$(EXESUF)
+check-qtest-aarch64-y += tests/fw_cfg-test$(EXESUF)
 # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make test unconditional
 ifneq ($(ARCH),arm)
 check-qtest-aarch64-y += tests/bios-tables-test$(EXESUF)
-- 
2.19.1



