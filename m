Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14DF2E0B43
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 15:01:06 +0100 (CET)
Received: from localhost ([::1]:40570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kriDp-0006LW-NY
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 09:01:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBZ-0001mi-QP; Tue, 22 Dec 2020 03:38:25 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1krdBY-0002kE-6C; Tue, 22 Dec 2020 03:38:25 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4D0V7y60kbz7Jcd;
 Tue, 22 Dec 2020 16:37:18 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Tue, 22 Dec 2020
 16:37:53 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <jasowang@redhat.com>
Subject: [PATCH 6/9] net: Transfer tabs to spcaes
Date: Tue, 22 Dec 2020 16:23:37 +0800
Message-ID: <20201222082340.67405-7-zhanghan64@huawei.com>
X-Mailer: git-send-email 2.29.1.59.gf9b6481aed
In-Reply-To: <20201222082340.67405-1-zhanghan64@huawei.com>
References: <20201222082340.67405-1-zhanghan64@huawei.com>
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
X-Mailman-Approved-At: Tue, 22 Dec 2020 08:55:42 -0500
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
 hang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Code indent use spaces instead of tabs.

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
---
 net/tap-linux.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/tap-linux.h b/net/tap-linux.h
index 2f36d100fc..db72960c19 100644
--- a/net/tap-linux.h
+++ b/net/tap-linux.h
@@ -44,10 +44,10 @@
 #define IFF_DETACH_QUEUE 0x0400
 
 /* Features for GSO (TUNSETOFFLOAD). */
-#define TUN_F_CSUM	0x01	/* You can hand me unchecksummed packets. */
-#define TUN_F_TSO4	0x02	/* I can handle TSO for IPv4 packets */
-#define TUN_F_TSO6	0x04	/* I can handle TSO for IPv6 packets */
-#define TUN_F_TSO_ECN	0x08	/* I can handle TSO with ECN bits. */
-#define TUN_F_UFO	0x10	/* I can handle UFO packets */
+#define TUN_F_CSUM      0x01    /* You can hand me unchecksummed packets. */
+#define TUN_F_TSO4      0x02    /* I can handle TSO for IPv4 packets */
+#define TUN_F_TSO6      0x04    /* I can handle TSO for IPv6 packets */
+#define TUN_F_TSO_ECN   0x08    /* I can handle TSO with ECN bits. */
+#define TUN_F_UFO       0x10    /* I can handle UFO packets */
 
 #endif /* QEMU_TAP_LINUX_H */
-- 
2.29.1.59.gf9b6481aed


