Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69122369B76
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:44:39 +0200 (CEST)
Received: from localhost ([::1]:49690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2fG-0001rF-Fe
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2b1-0005s8-TW
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:16 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:41852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2ay-0008AH-BP
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:14 -0400
Received: by mail-io1-xd35.google.com with SMTP id f21so13970270ioh.8
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bsSkw7GH59nQ031zI/zjszqrhH3zAgQJ1pZYMcLiL7g=;
 b=iYn9o8UFrheSGxUzANEl4Vth+0GDJJWYBK9CCWLGvx3aZ5VtJ8zUD3j5TcnK7QdGIk
 zosvMkOCWm7YULh/WvugMlI3GJ6DdQN+peTyoUhpV7bWfI+oFMmKnqd21S4Q6C3XOAvD
 pppwNAUrcbJwL3SMFprPuHYlK5tVem/BRlOSymEvrofCGNDAaVVEMi99P3yA4LpjEwEy
 iANz//DA0EfZbhIHjOu+j7Efa0neXKk25YPMCRF5FhF3CdowFTMYBDyknvEoXclbK0XS
 kQvSri22H3xjSnuxPwi7gUjiK75cbvvEH+7J6RSL52MjfGgkl995KXQEKmiUhVMqOM4c
 opzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bsSkw7GH59nQ031zI/zjszqrhH3zAgQJ1pZYMcLiL7g=;
 b=e+tRC8q7yPG6Y88pZvJiE+kVAHM3rtsiN09uWaNwbGFKX0rQe2tPQfeitHC5DePAS3
 BQxURqGGKInJpatlkc/0ecBKxs0qVGPAyR9Ke7vOgt3LUv6AoopwJQxoudpbPQy14GBj
 8QVPWfmIVGVhVLJ1pOekI4oCXGhScDMLRcg/asnG1NX6JmT/HF9eLyKiUIokay33QFKi
 v1qzK8ejasWxVqKvO24aHrefWrcE81nagcuPo9LCzdCSN5P//R5f3Qjn6tV2rxvTTzaX
 CKdZotGkj/UOsn+wQxhFk3IJgfKV/THWJ8L8ZVh3++RQRltDOWnB/d2JK+zvYrz5gpOU
 tXfA==
X-Gm-Message-State: AOAM5315gY4bwm8/z1XZpzP961L2WcWvp1QEW5ZXx3hMBaAPWE9GyvRV
 1fvJrNTWksSRVdTUlMW5S7yEBzOoBa+222Yq
X-Google-Smtp-Source: ABdhPJwZLe0f45BeRWX86YGaO6s18l+veEgtz0q4YtDwGA1Bb1lvjkCQdKiXp6FDYe+EQUmF23QDUQ==
X-Received: by 2002:a02:c76c:: with SMTP id k12mr5270089jao.58.1619210410426; 
 Fri, 23 Apr 2021 13:40:10 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id n1sm3201308ion.22.2021.04.23.13.40.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:40:09 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 11/24] bsd-user: style tweak: if 0 -> ifdef notyet for code
 needed in future
Date: Fri, 23 Apr 2021 14:39:46 -0600
Message-Id: <20210423203959.78275-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210423203959.78275-1-imp@bsdimp.com>
References: <20210423203959.78275-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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
 bsd-user/elfload.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 87154283ef..07a00ddbd5 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -1270,7 +1270,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
               ibcs2_interpreter = 1;
             }
 
-#if 0
+#ifdef notyet
             printf("Using ELF interpreter %s\n", path(elf_interpreter));
 #endif
             if (retval >= 0) {
@@ -1529,7 +1529,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
 
     padzero(elf_bss, elf_brk);
 
-#if 0
+#ifdef notyet
     printf("(start_brk) %x\n" , info->start_brk);
     printf("(end_code) %x\n" , info->end_code);
     printf("(start_code) %x\n" , info->start_code);
-- 
2.22.1


