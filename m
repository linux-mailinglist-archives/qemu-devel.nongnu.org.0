Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE7B36A227
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:37:39 +0200 (CEST)
Received: from localhost ([::1]:55488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLHm-0007G9-5X
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKik-0005sU-Ih
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:26 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:36856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiL-0004K7-2D
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:26 -0400
Received: by mail-il1-x129.google.com with SMTP id p15so7428748iln.3
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PoD849iWu2bWzUO4nDp3ypRtrOgwVSOKxnGpOs50MwI=;
 b=mEl+ZmJJuP1I+HHS24xHqPTNt46fOAytxuS2BzPRoQdq4d9ctivGgAO53yn5FZVWa0
 xomQR/IgtGqghnXGUqZW9JaqU9W9iezwiu6R+SP6crA5qTDj3CLhzOGQHiOlzE9eoq/J
 s1FH9J8ci21i/fsAMTPfwzW8rlpC7aCAIpNq4+C/6zybDami18khy65bZwEDJDYaQwru
 F43ZNUexuEgoC5AAOIKMXfmosf+cyJt4mnogi/n2fzFYZ7omk+VaKE2MtERCFlpgvdA4
 Y7gj8wkxszJQ0oNJduCgG9mVKbIH69pH36+W82a38Qx9unEQYk7VYa6dNAR8BlgZwbz+
 R1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PoD849iWu2bWzUO4nDp3ypRtrOgwVSOKxnGpOs50MwI=;
 b=KZqj/u6NR9faOhYQjAwHEUwZ+7KvyzpKq5ZVIMk5Ra4vvcCSoVrNTd3M5Jk2nBDKne
 izMF49OiHGE4tHHaeEhhVDZXXsmK+knJUpesOtriWT3ad7124LgLg2bRyzP6tHPe+GG6
 laEFzFNYhvTVizKNUoi2TKf+TSgQkHU2YDHF9xYMMseEinECvBH7/J440JH5PPs9imOR
 gBa1se8wlBn0BF4sg10Jgc5zydL9pArW0lkJ6nJuJM+qYvBvvtPR29YON/JdiLT6EENC
 8YH6u+O496gXKH8L1Xlz2ogD9KDVssAQ0kV94egIhQsbVVBzfbtkZhl2us1WEFhwcTRs
 wA9Q==
X-Gm-Message-State: AOAM530utTjTtOYrQV/ZQLUwF2VsVFVM816zGnic9cJQi0nSJzA9MbmF
 SsEwKbK4PwzQ9gPegBK270w529i0fAPtCJyB
X-Google-Smtp-Source: ABdhPJwAbJC2AUMdjMLr/LX8L1iwupKcPy8P/5K2qa/8ePrNYKmD++LAH8hS04O/Nvk2XiexhXiISQ==
X-Received: by 2002:a05:6e02:1808:: with SMTP id
 a8mr7058458ilv.175.1619280058488; 
 Sat, 24 Apr 2021 09:00:58 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:58 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 38/48] bsd-user: style tweak: use {} for all if statements,
 format else correctly
Date: Sat, 24 Apr 2021 10:00:06 -0600
Message-Id: <20210424160016.15200-39-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
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
 bsd-user/uaccess.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/bsd-user/uaccess.c b/bsd-user/uaccess.c
index aab5e995a9..2e8ad2982f 100644
--- a/bsd-user/uaccess.c
+++ b/bsd-user/uaccess.c
@@ -54,8 +54,9 @@ abi_long target_strlen(abi_ulong guest_addr1)
     for (;;) {
         max_len = TARGET_PAGE_SIZE - (guest_addr & ~TARGET_PAGE_MASK);
         ptr = lock_user(VERIFY_READ, guest_addr, max_len, 1);
-        if (!ptr)
+        if (!ptr) {
             return -TARGET_EFAULT;
+        }
         len = qemu_strnlen((const char *)ptr, max_len);
         unlock_user(ptr, guest_addr, 0);
         guest_addr += len;
@@ -63,8 +64,9 @@ abi_long target_strlen(abi_ulong guest_addr1)
         if (guest_addr == 0 ||
             (guest_addr - guest_addr1) > 0x7fffffff)
             return -TARGET_EFAULT;
-        if (len != max_len)
+        if (len != max_len) {
             break;
+        }
     }
     return guest_addr - guest_addr1;
 }
-- 
2.22.1


