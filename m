Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FA336A1F6
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:12:24 +0200 (CEST)
Received: from localhost ([::1]:38014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKtL-0001cr-DZ
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKif-0005hp-2e
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:21 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:42994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiE-0004J6-2N
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:20 -0400
Received: by mail-io1-xd34.google.com with SMTP id s16so46514992iog.9
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VZAtilvnIeDP+jP8/xPOGjIu8lTW/AxOvqbnMGjlqJY=;
 b=hyQFuJYC0YCa/sebF6Oe3Y6bfMkzIt9nn9KyqpB3STYk4ZzaRP3idtxVwncKA/UdHA
 Uzq1qOQqeN2HhqDjcfuDo3WVYtkpxyBhvwExyG2eiPWZA4a94vi+teM+8CRgggveB3il
 wlEYBUqkDFGXCdIp/JgdIjpzdYnmoOq/XLrbWVwBED0yj96XcQPeuNeSl3z+8THXmsdP
 C+1GnKLRqYIAnZmHYF69A4HnWgxGWUK63ABhUl9u2cgJUrhwy0fKTt3LevOZAEAM0nNU
 gYbiutBWhSAoCzh8cXLq2OmYI/+VKwrTxSOf3hPPyksHnLLBSDT7UI/KLFswKjuzu1NM
 Z5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VZAtilvnIeDP+jP8/xPOGjIu8lTW/AxOvqbnMGjlqJY=;
 b=p4+ybcjpajzKlu8zRiRIE1XTbNCjVaoPsNXZ2qxjGuq7KGP8H79q0s+fNgH243pB0d
 b89sXMF7NGBUq7h7P59sNsxXSzD7aIP0lbmY0AwtCZD3vfed0VYetZphfyk22nlOM5nN
 4g76ALtJyhY2IZirzEabHO14/lHNOC1zlj3BYX8DKNMeuj8/8d6Ql88qqpeZWdIZNXja
 +I7NaLmCX654FEy7fIi5Ff72uxCWEKO40msPNhmYpYmRceUFLk2v/928r4eHBpJjsyUw
 TCHT4EmEO/kWz15aRzasrgHguL3/VtHDu6O1W1dwxycUWTDvOEHkNUpNIDbzjE8aPDVD
 avGA==
X-Gm-Message-State: AOAM531yDG1T4IOQXGc9v9xyjYTJvfZDjQr/epRM9ppwC3xpTYzmWVLu
 gpFriab+UxnDkBOcyclT8ijUVV6jvWxU0Oth
X-Google-Smtp-Source: ABdhPJxNSoVxlH2LjADbtQotAs5CBrEnBVzXUApo9Gw1wyalUvwAIj5UL1mPnB06V4KCKJJTkMTzfQ==
X-Received: by 2002:a6b:f901:: with SMTP id j1mr7633021iog.100.1619280052055; 
 Sat, 24 Apr 2021 09:00:52 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:51 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 30/48] bsd-user: style tweak: fix block comments
Date: Sat, 24 Apr 2021 09:59:58 -0600
Message-Id: <20210424160016.15200-31-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 51 ++++++++++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 0ac1b92706..0ff06d7349 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -23,8 +23,6 @@
 #include "bsd-mman.h"
 #include "exec/exec-all.h"
 
-//#define DEBUG_MMAP
-
 static pthread_mutex_t mmap_mutex = PTHREAD_MUTEX_INITIALIZER;
 static __thread int mmap_lock_count;
 
@@ -165,8 +163,10 @@ static int mmap_frag(abi_ulong real_start,
 
     prot_new = prot | prot1;
     if (!(flags & MAP_ANON)) {
-        /* msync() won't work here, so we return an error if write is
-           possible while it is a shared mapping */
+        /*
+         * msync() won't work here, so we return an error if write is possible
+         * while it is a shared mapping
+         */
         if ((flags & TARGET_BSD_MAP_FLAGMASK) == MAP_SHARED &&
             (prot & PROT_WRITE))
             return -1;
@@ -194,12 +194,13 @@ static abi_ulong mmap_next_start = 0x40000000;
 
 unsigned long last_brk;
 
-/* find a free memory area of size 'size'. The search starts at
-   'start'. If 'start' == 0, then a default start address is used.
-   Return -1 if error.
-*/
-/* page_init() marks pages used by the host as reserved to be sure not
-   to use them. */
+/*
+ * find a free memory area of size 'size'. The search starts at 'start'. If
+ * 'start' == 0, then a default start address is used.  Return -1 if error.
+ *
+ * page_init() marks pages used by the host as reserved to be sure not to use
+ * them.
+ */
 static abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size)
 {
     abi_ulong addr, addr1, addr_start;
@@ -208,11 +209,12 @@ static abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size)
 
     new_brk = (unsigned long)sbrk(0);
     if (last_brk && last_brk < new_brk && last_brk == (target_ulong)last_brk) {
-        /* This is a hack to catch the host allocating memory with brk().
-           If it uses mmap then we loose.
-           FIXME: We really want to avoid the host allocating memory in
-           the first place, and maybe leave some slack to avoid switching
-           to mmap.  */
+        /*
+         * This is a hack to catch the host allocating memory with brk().  If it
+         * uses mmap then we loose.
+         * FIXME: We really want to avoid the host allocating memory in the
+         * first place, and maybe leave some slack to avoid switching to mmap.
+         */
         page_set_flags(last_brk & TARGET_PAGE_MASK,
                        TARGET_PAGE_ALIGN(new_brk),
                        PAGE_RESERVED);
@@ -298,9 +300,10 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
             errno = ENOMEM;
             goto fail;
         }
-        /* Note: we prefer to control the mapping address. It is
-           especially important if qemu_host_page_size >
-           qemu_real_host_page_size */
+        /*
+         * Note: we prefer to control the mapping address. It is specially
+         * important if qemu_host_page_size > qemu_real_host_page_size
+         */
         p = mmap(g2h_untagged(mmap_start),
                  host_len, prot, flags | MAP_FIXED, fd, host_offset);
         if (p == MAP_FAILED)
@@ -329,12 +332,16 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
             }
         }
 
-        /* worst case: we cannot map the file because the offset is not
-           aligned, so we read it */
+        /*
+         * worst case: we cannot map the file because the offset is not aligned,
+         * so we read it
+         */
         if (!(flags & MAP_ANON) &&
             (offset & ~qemu_host_page_mask) != (start & ~qemu_host_page_mask)) {
-            /* msync() won't work here, so we return an error if write is
-               possible while it is a shared mapping */
+            /*
+             * msync() won't work here, so we return an error if write is
+             * possible while it is a shared mapping
+             */
             if ((flags & TARGET_BSD_MAP_FLAGMASK) == MAP_SHARED &&
                 (prot & PROT_WRITE)) {
                 errno = EINVAL;
-- 
2.22.1


