Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACABB2F7150
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 05:00:39 +0100 (CET)
Received: from localhost ([::1]:37676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0GHu-0001Tx-P2
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 23:00:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1l0GFM-0007g9-6b
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:58:00 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1l0GFK-00055Z-Gc
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:57:59 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DH6nK4nRtzj6w2;
 Fri, 15 Jan 2021 11:56:53 +0800 (CST)
Received: from [10.108.235.54] (10.108.235.54) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Fri, 15 Jan 2021 11:57:47 +0800
Subject: [PATCH v2 4/5] softmmu: "foo* bar" should be "foo *bar"
From: chaihaoyu <chaihaoyu1@huawei.com>
To: <qemu-devel@nongnu.org>, <pbonzini@redhat.com>, Peter Xu
 <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <aaa530f5-b7ec-3198-a80b-efb88de20c6c@huawei.com>
Message-ID: <846cf433-1369-b3b8-2df9-46b54ae7eb6e@huawei.com>
Date: Fri, 15 Jan 2021 11:57:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <aaa530f5-b7ec-3198-a80b-efb88de20c6c@huawei.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.235.54]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=chaihaoyu1@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, hunongda@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes error messages found by checkpatch.pl:
"foo* bar" should be "foo *bar"

Signed-off-by: Haoyu Chai <chaihaoyu1@huawei.com>

---
 softmmu/globals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/globals.c b/softmmu/globals.c
index 7d0fc81183..341a7029ff 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -35,7 +35,7 @@

 enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
 int display_opengl;
-const char* keyboard_layout;
+const char *keyboard_layout;
 bool enable_mlock;
 bool enable_cpu_pm;
 int nb_nics;
-- 
2.29.1.59.gf9b6481aed

