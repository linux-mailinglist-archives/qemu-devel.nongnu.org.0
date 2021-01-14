Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF662F5C84
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 09:36:54 +0100 (CET)
Received: from localhost ([::1]:38174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzy7h-0004pD-Fs
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 03:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1kzxyO-0004SX-QX; Thu, 14 Jan 2021 03:27:16 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1kzxyM-0006fx-OR; Thu, 14 Jan 2021 03:27:16 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DGcpS339Qz7VDb;
 Thu, 14 Jan 2021 16:26:08 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Thu, 14 Jan 2021
 16:26:59 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <kraxel@redhat.com>
Subject: [PATCH 6/6] audio: Suspect code indent for conditional statements
Date: Thu, 14 Jan 2021 16:10:59 +0800
Message-ID: <20210114081059.19632-7-zhanghan64@huawei.com>
X-Mailer: git-send-email 2.29.1.59.gf9b6481aed
In-Reply-To: <20210114081059.19632-1-zhanghan64@huawei.com>
References: <20210114081059.19632-1-zhanghan64@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhanghan64@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: hunongda@huawei.com, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, alex.chen@huawei.com,
 zhanghan64@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix code indent.

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
---
 audio/paaudio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index b052084698..7ea9f637c2 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -437,7 +437,7 @@ static pa_stream *qpa_simple_new (
     }
 
     if (r < 0) {
-      goto fail;
+        goto fail;
     }
 
     pa_threaded_mainloop_unlock(c->mainloop);
-- 
2.29.1.59.gf9b6481aed


