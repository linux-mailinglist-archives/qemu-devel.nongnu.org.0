Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF1C37CFDD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:34:04 +0200 (CEST)
Received: from localhost ([::1]:36018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgskF-0000iV-VW
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUg-0007OW-Ls
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:58 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:38602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUU-0008MU-GN
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:58 -0400
Received: by mail-il1-x12d.google.com with SMTP id c3so20816037ils.5
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+CUmFkP2o3lErLZkJ9Syb5R++GYvoD8jrEJtgqEheiI=;
 b=SMlDoMHBX/NYzeZHJpBlXjvmnrhjFaBHFnlbtwx0kolgB0yc91NDzNH9D66O1HAekt
 gZlHBCqUnGpKZMJPpVrKkSFE43QGnFmxsUpujjOiBNsrBtoBTetfqCn8Vmqe2IzD26SM
 MylklBGSGwX0ct7jCb1XE3yAVl1f9zub+nAPH9lczbpbc9b0LNW1xmUgXegySPyzaaGB
 AXCnuDGqVauePioe7Ba3tBuTbOanUZuzegRetF5mBK7pSUEJRo4XeQd6M1/T5B6vol+U
 PMDfYgcHnOgw2Rfeb6u5Wn8lguWn4BqHSV65Py7T3I2/sH1pKzTGuYHiTLcc5n/6RmzG
 Q7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+CUmFkP2o3lErLZkJ9Syb5R++GYvoD8jrEJtgqEheiI=;
 b=noCD8ZCz9nbf9/8WJioiaB+74sbwHti2tXOTaLA1SH0lE3m78LFY1Bu3TGzjgvErKt
 9ghitNcg8rSVv2eqeUClpMF64C+jsopMhuQolkdUgQM73N7vDEQ+rtMl5OKweNMxB736
 cKZm75C0J0wfMPWqujv6MrqFx+e9kaOoIwFH4ZvRcXLhuQpFWWlWV/KMEMdjGKddwfMm
 e1h5EJ7mBbA7oAYLKKbRR9Aj9MU6ZMoDLzXgqIbRGwOUE0rvrp9kcMwiVjVKME/OLO7A
 oktqf96pE9D8A/SBF0R5H+msTUjpf0uOS5Ndry4uJrQYEe193bQLB9bzSkFYsdKb9BUs
 8d+Q==
X-Gm-Message-State: AOAM533DYorLVUuWWi9fwpYS+ZaAKsZSb10IXzG8iJ+4v0jUBBayG55a
 IICpDl/qCSvpYPtx47W3aRIWT7PNCv7zLw==
X-Google-Smtp-Source: ABdhPJyiWCkf2qz1BrVqi973+cjYqtYsZjD1hHNNbo6kS0D4YEBuEZMJZ/FaiFtP2jzyrRDvPipcmQ==
X-Received: by 2002:a92:c0cd:: with SMTP id t13mr22917713ilf.280.1620839863989; 
 Wed, 12 May 2021 10:17:43 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d2sm192064ile.18.2021.05.12.10.17.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 10:17:43 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/20] bsd-user: style tweak: keyword space (
Date: Wed, 12 May 2021 11:17:17 -0600
Message-Id: <20210512171720.46744-18-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210512171720.46744-1-imp@bsdimp.com>
References: <20210512171720.46744-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


