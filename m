Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5189263AA9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 04:39:53 +0200 (CEST)
Received: from localhost ([::1]:49452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGCV6-00086H-EO
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 22:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1kGCUA-0006qC-VE; Wed, 09 Sep 2020 22:38:54 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:49170 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1kGCU8-0003xv-Sr; Wed, 09 Sep 2020 22:38:54 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id F0F31355FCF215498A0B;
 Thu, 10 Sep 2020 10:38:38 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.174.187.46) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Thu, 10 Sep 2020 10:38:32 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] test-vmstate: remove unnecessary code in
 match_interval_mapping_node
Date: Thu, 10 Sep 2020 10:38:18 +0800
Message-ID: <20200910023818.11880-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.46]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=pannengyuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 22:38:39
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: thuth@redhat.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 qemu-trivial@nongnu.org, Pan Nengyuan <pannengyuan@huawei.com>,
 f4bug@amsat.org, dgilbert@redhat.com, eric.auger@redhat.com,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'str' is not used in match_interval_mapping_node(), remove it.

Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
 tests/test-vmstate.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/test-vmstate.c b/tests/test-vmstate.c
index f8de709a0b..1c763015d0 100644
--- a/tests/test-vmstate.c
+++ b/tests/test-vmstate.c
@@ -1055,9 +1055,6 @@ static gboolean match_interval_mapping_node(gpointer key,
     TestGTreeMapping *map_a, *map_b;
     TestGTreeInterval *a, *b;
     struct match_node_data *d = (struct match_node_data *)data;
-    char *str = g_strdup_printf("dest");
-
-    g_free(str);
     a = (TestGTreeInterval *)key;
     b = (TestGTreeInterval *)d->key;
 
-- 
2.21.0.windows.1



