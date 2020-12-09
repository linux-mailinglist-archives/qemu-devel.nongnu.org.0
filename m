Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92412D392E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 04:18:06 +0100 (CET)
Received: from localhost ([::1]:57448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmpzR-0001KC-RF
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 22:18:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kmpuM-0004wH-Kj; Tue, 08 Dec 2020 22:12:50 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kmpu7-0008N5-I4; Tue, 08 Dec 2020 22:12:50 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CrMXd4G5Kzhpbc;
 Wed,  9 Dec 2020 11:12:01 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Wed, 9 Dec 2020
 11:12:17 +0800
From: zhouyang <zhouyang789@huawei.com>
To: <alex.bennee@linaro.org>
Subject: [PATCH v2 3/5] contrib: Add spaces around operator
Date: Wed, 9 Dec 2020 11:04:45 +0800
Message-ID: <20201209030447.2135652-4-zhouyang789@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201209030447.2135652-1-zhouyang789@huawei.com>
References: <20201209030447.2135652-1-zhouyang789@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=zhouyang789@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I am reading contrib related code and found some style problems while
check the code using checkpatch.pl. This commit fixs the issue below:
ERROR: spaces required around that '*'

Signed-off-by: zhouyang <zhouyang789@huawei.com>
---
 contrib/ivshmem-server/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/ivshmem-server/main.c b/contrib/ivshmem-server/main.c
index ee08c4ced0..224dbeb547 100644
--- a/contrib/ivshmem-server/main.c
+++ b/contrib/ivshmem-server/main.c
@@ -17,7 +17,7 @@
 #define IVSHMEM_SERVER_DEFAULT_PID_FILE       "/var/run/ivshmem-server.pid"
 #define IVSHMEM_SERVER_DEFAULT_UNIX_SOCK_PATH "/tmp/ivshmem_socket"
 #define IVSHMEM_SERVER_DEFAULT_SHM_PATH       "ivshmem"
-#define IVSHMEM_SERVER_DEFAULT_SHM_SIZE       (4*1024*1024)
+#define IVSHMEM_SERVER_DEFAULT_SHM_SIZE       (4 * 1024 * 1024)
 #define IVSHMEM_SERVER_DEFAULT_N_VECTORS      1
 
 /* used to quit on signal SIGTERM */
-- 
2.23.0


