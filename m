Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840902F47B7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 10:39:42 +0100 (CET)
Received: from localhost ([::1]:41582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzccv-0006Q3-IW
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 04:39:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1kzcXK-0000hm-7u
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:33:54 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1kzcXG-000427-0A
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:33:54 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DG2KT1kG5zl3x5;
 Wed, 13 Jan 2021 17:32:29 +0800 (CST)
Received: from [10.108.235.13] (10.108.235.13) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Wed, 13 Jan 2021 17:33:35 +0800
Subject: [PATCH V3 4/4] bsd-user: do not use C99 // comments
References: <b820b729-88a8-1103-b7a7-b66b637947d9@huawei.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>
From: shiliyang <shiliyang@huawei.com>
Message-ID: <ec2505ff-e9bf-ea26-060f-7b2744a6f482@huawei.com>
Date: Wed, 13 Jan 2021 17:33:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <b820b729-88a8-1103-b7a7-b66b637947d9@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.235.13]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=shiliyang@huawei.com;
 helo=szxga04-in.huawei.com
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
ERROR: do not use C99 // comments

Signed-off-by: Liyang Shi <shiliyang@huawei.com>

---
 bsd-user/elfload.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index fab9da757c..ff571088f7 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -1010,7 +1010,7 @@ static const char *lookup_symbolxx(struct syminfo *s, target_ulong orig_addr)
     struct elf_sym *syms = s->disas_symtab.elf64;
 #endif

-    // binary search
+    /* binary search */
     struct elf_sym *sym;

     sym = bsearch(&orig_addr, syms, s->disas_num_syms, sizeof(*syms), symfind);
@@ -1092,7 +1092,7 @@ static void load_symbols(struct elfhdr *hdr, int fd)
 #ifdef BSWAP_NEEDED
         bswap_sym(syms + i);
 #endif
-        // Throw away entries which we do not need.
+        /* Throw away entries which we do not need. */
         if (syms[i].st_shndx == SHN_UNDEF ||
                 syms[i].st_shndx >= SHN_LORESERVE ||
                 ELF_ST_TYPE(syms[i].st_info) != STT_FUNC) {
-- 
2.29.1.59.gf9b6481aed


