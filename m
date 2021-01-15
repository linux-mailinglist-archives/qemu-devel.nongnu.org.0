Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2CB2F7154
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 05:02:17 +0100 (CET)
Received: from localhost ([::1]:39836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0GJU-0002VY-Nv
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 23:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1l0GFx-0008Qc-BK
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:58:37 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaihaoyu1@huawei.com>)
 id 1l0GFv-0005IG-7T
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:58:37 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DH6nc1lbBzl504;
 Fri, 15 Jan 2021 11:57:08 +0800 (CST)
Received: from [10.108.235.54] (10.108.235.54) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Fri, 15 Jan 2021 11:58:18 +0800
Subject: [PATCH v2 5/5] softmmu: code indent should never use tabs
From: chaihaoyu <chaihaoyu1@huawei.com>
To: <qemu-devel@nongnu.org>, <pbonzini@redhat.com>, Peter Xu
 <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <aaa530f5-b7ec-3198-a80b-efb88de20c6c@huawei.com>
Message-ID: <4502cbe1-a076-3857-8af1-83112cc3fae4@huawei.com>
Date: Fri, 15 Jan 2021 11:58:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <aaa530f5-b7ec-3198-a80b-efb88de20c6c@huawei.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.235.54]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=chaihaoyu1@huawei.com; helo=szxga04-in.huawei.com
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
Cc: alex.chen@huawei.com, hunongda@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes error messages found by checkpatch.pl:
code indent should never use tabs

Signed-off-by: Haoyu Chai <chaihaoyu1@huawei.com>

---
 softmmu/physmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 43e37660c7..7aed899e3f 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -3273,7 +3273,7 @@ int64_t address_space_cache_init(MemoryRegionCache *cache,
      * cache->xlat and the end of the section.
      */
     diff = int128_sub(cache->mrs.size,
-		      int128_make64(cache->xlat - cache->mrs.offset_within_region));
+                int128_make64(cache->xlat - cache->mrs.offset_within_region));
     l = int128_get64(int128_min(diff, int128_make64(l)));

     mr = cache->mrs.mr;
-- 
2.29.1.59.gf9b6481aed

