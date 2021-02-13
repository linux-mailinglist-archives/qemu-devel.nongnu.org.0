Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5826E31AB94
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:17:07 +0100 (CET)
Received: from localhost ([::1]:43550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAunK-0002WD-DS
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:17:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaX-00021Y-9i
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:53 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaT-00068K-HW
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:53 -0500
Received: by mail-wm1-x32b.google.com with SMTP id j11so2124024wmi.3
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JoWQMOuWzGJ9C8YfVjNEnIHvIhyf/DhQli8PgjLqUuo=;
 b=bQYdBhhDlU0+J+7Q+qfbdn1KmB0pAhriiMrZv2v7M7olX5sbo6x8bOAjAgOFm0W5wd
 96EZM9Itutasovwjf3ycGGoATN0GqDkJKz2GG/okRLpidjntEaN141nRDizEI6R1SWre
 VtWn92bhzzssiYGqZ5nrAwMt1hWKobk817Ti0gaDBFsVblzwAFFhHPBHDtigrS63AyLm
 fMRiV0gqeashOn97MStxOniL2QcfKE9o31ceTr2PF6PL7oEe6B/b75I/90s6x9kszvLR
 X1u5t9BPfNjWSvf7qNvMs4+uugJ2wNN7rGW2XamVel4wuw3XtzJ8K5AxzoU3Go3VRzt0
 BTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JoWQMOuWzGJ9C8YfVjNEnIHvIhyf/DhQli8PgjLqUuo=;
 b=TYYJI/XDq3Ac+SkKPOzufkcfhnOH+XFJv/MkaQv0svCq5+WStC1K1LjV0SVseoX8Vv
 gYrK0du4e8TZv7ofAwKmeg0P904tXpxD5zwhbeGt0ocaGeyeDUo5bwi6iLqjibRtN0Z0
 +t61UjgmkAe64ZV7okYQ0rNFjR+5GNoIGbBY1EhmI72ogaCXAHAjx9F3KiyjDT+zI0BD
 N95kfhcQv/pUNfw6cXMrhU0cpD4Ce6AqQdyBdF3IfZgbuFQKkzlZpsXp+mzbxC53+nSD
 3fYUk3bpdCpvJf/Q78xXcFUzmiu7NcA19m41zA2RQ5V4x+36/VaaehUyj6m2L9ZTR4qM
 q4pg==
X-Gm-Message-State: AOAM530EHzqWpIZj3I7mh1ymaF45H36jMZmntFYjRkoLYC7Ko4YZ+n2Z
 p9Ell2fhErDjVfMxNE+lOoirDg==
X-Google-Smtp-Source: ABdhPJxgL8u6MfIACK2/a9Vz9vB7mWFulAGUkNUOJ7/+kHFmEXjP9EsCW3NBUVLC+CfDZXoK+9ckcw==
X-Received: by 2002:a1c:8152:: with SMTP id c79mr6664015wmd.121.1613221423487; 
 Sat, 13 Feb 2021 05:03:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e16sm18361362wrt.36.2021.02.13.05.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:03:40 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3AA991FFA6;
 Sat, 13 Feb 2021 13:03:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 18/23] accel/tcg: re-factor non-RAM execution code
Date: Sat, 13 Feb 2021 13:03:20 +0000
Message-Id: <20210213130325.14781-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213130325.14781-1-alex.bennee@linaro.org>
References: <20210213130325.14781-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no real need to use CF_NOCACHE here. As long as the TB isn't
linked to other TBs or included in the QHT or jump cache then it will
only get executed once.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210209182749.31323-10-alex.bennee@linaro.org>
Message-Id: <20210210221053.18050-19-alex.bennee@linaro.org>
---
 accel/tcg/translate-all.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index b8ad95aa1b..7e62d8ad97 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1778,7 +1778,8 @@ static inline void tb_page_add(PageDesc *p, TranslationBlock *tb,
 #endif
 }
 
-/* add a new TB and link it to the physical page tables. phys_page2 is
+/*
+ * Add a new TB and link it to the physical page tables. phys_page2 is
  * (-1) to indicate that only one page contains the TB.
  *
  * Called with mmap_lock held for user-mode emulation.
@@ -1797,17 +1798,6 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
 
     assert_memory_lock();
 
-    if (phys_pc == -1) {
-        /*
-         * If the TB is not associated with a physical RAM page then
-         * it must be a temporary one-insn TB, and we have nothing to do
-         * except fill in the page_addr[] fields.
-         */
-        assert(tb->cflags & CF_NOCACHE);
-        tb->page_addr[0] = tb->page_addr[1] = -1;
-        return tb;
-    }
-
     /*
      * Add the TB to the page list, acquiring first the pages's locks.
      * We keep the locks held until after inserting the TB in the hash table,
@@ -1880,9 +1870,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     phys_pc = get_page_addr_code(env, pc);
 
     if (phys_pc == -1) {
-        /* Generate a temporary TB with 1 insn in it */
-        cflags &= ~CF_COUNT_MASK;
-        cflags |= CF_NOCACHE | 1;
+        /* Generate a one-shot TB with 1 insn in it */
+        cflags = (cflags & ~CF_COUNT_MASK) | 1;
     }
 
     cflags &= ~CF_CLUSTER_MASK;
@@ -2096,6 +2085,17 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
         tb_reset_jump(tb, 1);
     }
 
+    /*
+     * If the TB is not associated with a physical RAM page then
+     * it must be a temporary one-insn TB, and we have nothing to do
+     * except fill in the page_addr[] fields. Return early before
+     * attempting to link to other TBs or add to the lookup table.
+     */
+    if (phys_pc == -1) {
+        tb->page_addr[0] = tb->page_addr[1] = -1;
+        return tb;
+    }
+
     /* check next page if needed */
     virt_page2 = (pc + tb->size - 1) & TARGET_PAGE_MASK;
     phys_page2 = -1;
-- 
2.20.1


