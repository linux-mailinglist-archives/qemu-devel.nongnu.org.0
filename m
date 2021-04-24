Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859B636A1ED
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:08:20 +0200 (CEST)
Received: from localhost ([::1]:53656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKpP-0004Zt-JF
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhx-0005UP-NA
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:38 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:40749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhr-0004C6-7F
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:37 -0400
Received: by mail-il1-x131.google.com with SMTP id c18so43123492iln.7
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XCvW0RvcGPuNbJcgTUYRtSCfe0vwlmcMwLQDKxcnt5Q=;
 b=mjNn6xIKCbI25FZmLLvwQWsPtwpLUpM7yBKcNtYJY5ilBkT8V+uxWlk+zPafhex1fs
 HSWvSTps3bPDmzFfU0uoczwHlw3wbs33pgPHDCcEnS2OrXXjToJO1qL/BPVFk4k9XdLm
 ggjq/K3Ch+mPpEvgFGfOHJ/vmKZgOyYccfzpKuZ3iQQBQqnzYkeKtovEFRI3oLAqXgOK
 2XdXV4aspzAUvAfiZPP8BKG5XeogN7IOtcjFPMZqIY7haqY1HIqtSUV69xSidK3Og0OE
 ldXFXXPW3D/5YW5nbsQeRH2xAgi23i5CnHukROt+M8lpuzzqbT7Ldqv6RQWHvKUlIaGt
 6w5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XCvW0RvcGPuNbJcgTUYRtSCfe0vwlmcMwLQDKxcnt5Q=;
 b=fVDCmHOrKpmKltwKXSOlk+OELExr5LJCW+0tQVP9aj0mStB66mOrXd2neU/+4XkjDT
 nUFjQGysMgJAFw2BSPyLnbbdSeKcyDho4gAkmARBEbFI0dmkL4ieRuSj7PEGa1731LLD
 3iF1qaag1zmc99tPU79AsLh0//lzksZshqwWfFaJ6490Yb3q4MpMNUFGFOp8pIcPCJIe
 uoRg8ZtfXwXZFqNnx+c78c01v2OJFST6dLE7PLlLDKKFHrWBCww0vd7scCdGHSGI8Uwj
 UnnxDzjbixB0lvAdiGnJuiUSdmLoKVl3NJ5qzi+SM0oju500QVhr6CaM8yA4HSHKiNwD
 lbUg==
X-Gm-Message-State: AOAM532nYRucG5qplw6BOQHg+EN1uoYc3p2/TFnfYiMDjLvkEIFMFdv+
 Vbc/oqre9N29mJocX+2+mxzZ7u/nXBTAFyHb
X-Google-Smtp-Source: ABdhPJxS6atWWrufXrW3yELAswKiwr/T/RnWr/ikA6beQq2w0/ubwbrhQcOc+p+QF/jBVUzAMKIpZg==
X-Received: by 2002:a05:6e02:1809:: with SMTP id
 a9mr7191430ilv.184.1619280029932; 
 Sat, 24 Apr 2021 09:00:29 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:29 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/48] bsd-user: style tweak: keyword space (
Date: Sat, 24 Apr 2021 09:59:32 -0600
Message-Id: <20210424160016.15200-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
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
 arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

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


