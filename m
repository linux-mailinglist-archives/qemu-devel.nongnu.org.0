Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 566C7369B81
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:46:26 +0200 (CEST)
Received: from localhost ([::1]:55068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2gz-00040G-Bm
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2ac-00058R-Bb
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:39:50 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:39470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2aZ-0007vn-5Y
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:39:50 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 65-20020a9d03470000b02902808b4aec6dso41637628otv.6
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=15YT+ApyZHI2KGADjA4ZvpKC21Gl1pivpnfS2CDPjro=;
 b=FuoLsVtvW4pduZs+iKKjKsXTrqaeaOlvlZ2GRIFgJXBOb+sVHy4INTJgQWsJCb5FoT
 XBSJcd4b9JDSjYJTY+ICkusNPr6nz+XD+10gLgoVYPCFb+lURmouYI2UowdehM6GjCjm
 D1TWVfhcP53yQOhJ/Tb3p4sFysSHq3IarzziM9SnK3nTgXrmSXlf3M6FkxoLypR1QdAr
 4oeOgK5wv773qnEdYLpIa9D9D39BxfNPh6bmHEe5D72JaK8jzNR/QRlDkB6QyPVeA/pA
 sFZoI065VOXzHvbDB2yarlkuiydUULcgLmmUqT6LOu94xo/nUzcQz+OXvNTHIkk119lq
 34mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=15YT+ApyZHI2KGADjA4ZvpKC21Gl1pivpnfS2CDPjro=;
 b=YPfO7JfXWmcMAmzhtvJFXRitUa0EvDf1s579dsUskIXMmRD7G5e8vmWi1qzjYqFWkl
 wdGfg7y4JwAWecmc9y/jXNBmJnxJRE2E16tsAtKJYfJdZ943rYQbKyX0ElYk5r/qvmuD
 iPFbTTBu69apJzhJclKkwv4lcf5Mnb4a+WnVYaoqKiDv56Q/Zbzi/eGMEIAGgWz2I+lI
 CfeDj2l/9F/gMtGHA0t0HlpfDlIhUCNuiaYuKzZ/SSsvEJfr8AU32IiB+JxuvpUbbbcV
 ABHkefO0DXEwPiYMe35O6+lFEU8mBJukCt/1w4zYoxT5E3Vyco0zhdSRU9d96lCJTtn3
 rNSQ==
X-Gm-Message-State: AOAM531QCutSWJdhy1JM9rekaAOSulU3xDDkYTjF1inEWpSrS7QcrZE1
 nP+iowGOdi7WjNMgD61CeUvkv9Byph+ra7Y2
X-Google-Smtp-Source: ABdhPJz+G28ZbLz2wdrqtxJ1IK/et0Gu1H/a+z1xZRIuIOE1/F9ak2al9znpczGTE1mxDiMEQsB5yA==
X-Received: by 2002:a9d:6483:: with SMTP id g3mr4877158otl.332.1619210385861; 
 Fri, 23 Apr 2021 13:39:45 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id m127sm1511911oib.32.2021.04.23.13.39.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:39:45 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 04/24] bsd-user: style tweak: keyword space (
Date: Fri, 23 Apr 2021 14:39:30 -0600
Message-Id: <20210423203935.78225-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210423203935.78225-1-imp@bsdimp.com>
References: <20210423203935.78225-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::329;
 envelope-from=imp@bsdimp.com; helo=mail-ot1-x329.google.com
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
 bsd-user/mmap.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 01ec808003..0ac1b92706 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -93,11 +93,11 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
     if (start > host_start) {
         /* handle host page containing start */
         prot1 = prot;
-        for(addr = host_start; addr < start; addr += TARGET_PAGE_SIZE) {
+        for (addr = host_start; addr < start; addr += TARGET_PAGE_SIZE) {
             prot1 |= page_get_flags(addr);
         }
         if (host_end == host_start + qemu_host_page_size) {
-            for(addr = end; addr < host_end; addr += TARGET_PAGE_SIZE) {
+            for (addr = end; addr < host_end; addr += TARGET_PAGE_SIZE) {
                 prot1 |= page_get_flags(addr);
             }
             end = host_end;
@@ -110,7 +110,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
     }
     if (end < host_end) {
         prot1 = prot;
-        for(addr = end; addr < host_end; addr += TARGET_PAGE_SIZE) {
+        for (addr = end; addr < host_end; addr += TARGET_PAGE_SIZE) {
             prot1 |= page_get_flags(addr);
         }
         ret = mprotect(g2h_untagged(host_end - qemu_host_page_size),
@@ -148,7 +148,7 @@ static int mmap_frag(abi_ulong real_start,
 
     /* get the protection of the target pages outside the mapping */
     prot1 = 0;
-    for(addr = real_start; addr < real_end; addr++) {
+    for (addr = real_start; addr < real_end; addr++) {
         if (addr < start || addr >= end)
             prot1 |= page_get_flags(addr);
     }
@@ -225,9 +225,9 @@ static abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size)
     if (addr == 0)
         addr = mmap_next_start;
     addr_start = addr;
-    for(;;) {
+    for (;;) {
         prot = 0;
-        for(addr1 = addr; addr1 < (addr + size); addr1 += TARGET_PAGE_SIZE) {
+        for (addr1 = addr; addr1 < (addr + size); addr1 += TARGET_PAGE_SIZE) {
             prot |= page_get_flags(addr1);
         }
         if (prot == 0)
@@ -262,7 +262,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
             printf("MAP_FIXED ");
         if (flags & MAP_ANON)
             printf("MAP_ANON ");
-        switch(flags & TARGET_BSD_MAP_FLAGMASK) {
+        switch (flags & TARGET_BSD_MAP_FLAGMASK) {
         case MAP_PRIVATE:
             printf("MAP_PRIVATE ");
             break;
@@ -321,7 +321,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         end = start + len;
         real_end = HOST_PAGE_ALIGN(end);
 
-        for(addr = real_start; addr < real_end; addr += TARGET_PAGE_SIZE) {
+        for (addr = real_start; addr < real_end; addr += TARGET_PAGE_SIZE) {
             flg = page_get_flags(addr);
             if (flg & PAGE_RESERVED) {
                 errno = ENXIO;
@@ -433,11 +433,11 @@ int target_munmap(abi_ulong start, abi_ulong len)
     if (start > real_start) {
         /* handle host page containing start */
         prot = 0;
-        for(addr = real_start; addr < start; addr += TARGET_PAGE_SIZE) {
+        for (addr = real_start; addr < start; addr += TARGET_PAGE_SIZE) {
             prot |= page_get_flags(addr);
         }
         if (real_end == real_start + qemu_host_page_size) {
-            for(addr = end; addr < real_end; addr += TARGET_PAGE_SIZE) {
+            for (addr = end; addr < real_end; addr += TARGET_PAGE_SIZE) {
                 prot |= page_get_flags(addr);
             }
             end = real_end;
@@ -447,7 +447,7 @@ int target_munmap(abi_ulong start, abi_ulong len)
     }
     if (end < real_end) {
         prot = 0;
-        for(addr = end; addr < real_end; addr += TARGET_PAGE_SIZE) {
+        for (addr = end; addr < real_end; addr += TARGET_PAGE_SIZE) {
             prot |= page_get_flags(addr);
         }
         if (prot != 0)
-- 
2.22.1


