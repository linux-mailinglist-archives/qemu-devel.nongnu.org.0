Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DBE2F97D6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 03:23:35 +0100 (CET)
Received: from localhost ([::1]:51632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1KCc-0005ZS-Ba
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 21:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1l1KA1-0002y9-NI
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:20:53 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1l1K9z-0003j8-TC
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:20:53 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DJwTV3z1wzl6Fv;
 Mon, 18 Jan 2021 10:19:26 +0800 (CST)
Received: from [10.108.235.13] (10.108.235.13) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Mon, 18 Jan 2021 10:20:39 +0800
Subject: [PATCH V4 3/4] bsd-user: do not use C99 // comments
References: <c75512b3-0665-d686-5ea4-248a9819355d@huawei.com>
To: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>
From: shiliyang <shiliyang@huawei.com>
Message-ID: <2d69a2e7-67a2-3660-8ffe-de0962a046af@huawei.com>
Date: Mon, 18 Jan 2021 10:20:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <c75512b3-0665-d686-5ea4-248a9819355d@huawei.com>
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
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, hunongda@huawei.com,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes error messages found by checkpatch.pl:
ERROR: do not use C99 // comments

Signed-off-by: Liyang Shi <shiliyang@huawei.com>
---
 bsd-user/elfload.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index d5cab25607..2842dfe56b 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -390,7 +390,7 @@ static const char *lookup_symbolxx(struct syminfo *s, target_ulong orig_addr)
     struct elf_sym *syms = s->disas_symtab.elf64;
 #endif

-    // binary search
+    /* binary search */
     struct elf_sym *sym;

     sym = bsearch(&orig_addr, syms, s->disas_num_syms, sizeof(*syms), symfind);
@@ -465,7 +465,7 @@ found:
     i = 0;
     while (i < nsyms) {
         bswap_sym(syms + i);
-        // Throw away entries which we do not need.
+        /* Throw away entries which we do not need. */
         if (syms[i].st_shndx == SHN_UNDEF ||
                 syms[i].st_shndx >= SHN_LORESERVE ||
                 ELF_ST_TYPE(syms[i].st_info) != STT_FUNC) {
-- 
2.29.1.59.gf9b6481aed


