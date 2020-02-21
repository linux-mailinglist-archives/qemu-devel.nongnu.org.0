Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9335C168984
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 22:47:23 +0100 (CET)
Received: from localhost ([::1]:36568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5G8o-0005AV-19
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 16:47:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36480)
 by lists.gnu.org with esmtp (Exim 4.90_1) (envelope-from
 <3qk9QXgYKCoM51hu6pnvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--yuanzi.bounces.google.com>)
 id 1j5G7q-0004id-0Q
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 16:46:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from
 <3qk9QXgYKCoM51hu6pnvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--yuanzi.bounces.google.com>)
 id 1j5G7o-0000xJ-PI
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 16:46:21 -0500
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a]:43768)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from
 <3qk9QXgYKCoM51hu6pnvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--yuanzi.bounces.google.com>)
 id 1j5G7o-0000wU-GO
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 16:46:20 -0500
Received: by mail-pj1-x104a.google.com with SMTP id i3so1733584pjx.8
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 13:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=fi959EXaB76t7wi24tDnZlL6uaaa5akWttvkNwT+h64=;
 b=DAUH0UAMT1iFtOKftRl9dIIFU218ii2cFaDaBwGaurXqo/naafK7HPqtXRAQ7jaL5x
 tukWZUUfuQlA5y/fNpsRhy5ezbQ6zT9yTQycLrulKUgOxpPpH9K17qKBDV11qSw7Ec2Y
 YpiWuyxAiEpAgvennsi7+2UtZaMKlzgnuOfqeqa4qWgNXAJy9TF7hKKgL7ygzNge3Rzq
 l9LVwQnzi6Fnx0YeRyi2GaWT3IVijmZPcPZghtEC24NasI7xoIOo0hCLpotl/9yLq9i+
 GwP+cGbPUsuw7inllupyYYQP5088JS+Iy4FqIeobtfe+Pc9IQL2oaKpeu+yUDb/o+oJf
 Ke7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=fi959EXaB76t7wi24tDnZlL6uaaa5akWttvkNwT+h64=;
 b=OYrfdxtiavw6IpKE8suzjiUXyGyRg/SOZGoKyG1+AnCjIjJb95+uibtZ5YreACkVAI
 /hsNCUxbcFqCvWzwcef9iK6tJbnq0KGmD4+PJ/bN+GNuvvDpzFywO6OSFwBeo6sS8R/q
 wpCMiC5tbeH+gfSIrTDvgO4fGAGVvOvUtg3bezOyr9Ym4yGX56LAVYnRQZ/Cq7u7wjvV
 k3saCXuOzgcb5Xxdz+7jr0NtKgxoT56hGN18xYED9ofYsgyqBWR4FdESliF5EyTP0eqw
 uaTqTjlVZjwUyWr2LL8Uo8300R89C09bmZTKGPzMf0Y7NXYWHjSvB0tPFhVwJEkby/BB
 EdRQ==
X-Gm-Message-State: APjAAAWHDA6Qh1E2LKMXQyLgrAoLU1HLi3Xpqy223Oz4OFPutRMqKcMi
 swyUWALTsIzSfSslyl8lKk7I970VJQh7uRoRdOrCo3m68NyDlu0+TPWqCNRkzTD9HnE1T6oXvaV
 EldLyCy2Mqr+kpQhAw66yCK989teJ9u2ZL/GrjnSljzDx5v1mgUG4gmJVaglF
X-Google-Smtp-Source: APXvYqyvFZLNhABUFu6QYlAbvf/POMbpw5g8kvYFpbfqu7tcHhqT80U27HqP+e/ADSd1G/VbNQjDQRcBCog=
X-Received: by 2002:a65:5c44:: with SMTP id v4mr42131361pgr.340.1582321578537; 
 Fri, 21 Feb 2020 13:46:18 -0800 (PST)
Date: Fri, 21 Feb 2020 13:46:14 -0800
Message-Id: <20200221214614.165338-1-yuanzi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH] linux-user: Add an argument QEMU_MMAP_BASE to set custom mmap
 base address in qemu user mode
From: Lirong Yuan <yuanzi@google.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Lirong Yuan <yuanzi@google.com>, Riku Voipio <riku.voipio@iki.fi>, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::104a
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change allows us to set custom base address for guest programs. It is needed to allow qemu to work with Thread Sanitizer (TSan), which has specific boundary definitions for memory mappings on different platforms:
https://github.com/llvm/llvm-project/blob/master/compiler-rt/lib/tsan/rtl/tsan_platform.h

Signed-off-by: Lirong Yuan <yuanzi@google.com>
---
 linux-user/main.c | 12 ++++++++++++
 linux-user/mmap.c |  3 ++-
 linux-user/qemu.h |  5 +++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index fba833aac9..dfcd867399 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -336,6 +336,16 @@ static void handle_arg_guest_base(const char *arg)
     have_guest_base = 1;
 }
 
+static void handle_arg_mmap_base(const char *arg)
+{
+    mmap_base = strtoul(arg, NULL, 0);
+    if (mmap_base == 0) {
+        fprintf(stderr, "Invalid mmap_base: %s\n", arg);
+        exit(EXIT_FAILURE);
+    }
+    mmap_next_start = mmap_base;
+}
+
 static void handle_arg_reserved_va(const char *arg)
 {
     char *p;
@@ -440,6 +450,8 @@ static const struct qemu_argument arg_table[] = {
      "uname",      "set qemu uname release string to 'uname'"},
     {"B",          "QEMU_GUEST_BASE",  true,  handle_arg_guest_base,
      "address",    "set guest_base address to 'address'"},
+    {"mmap_base",  "QEMU_MMAP_BASE",   true,  handle_arg_mmap_base,
+     "",           "begin allocating guest pages at this host address"},
     {"R",          "QEMU_RESERVED_VA", true,  handle_arg_reserved_va,
      "size",       "reserve 'size' bytes for guest virtual address space"},
     {"d",          "QEMU_LOG",         true,  handle_arg_log,
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 8685f02e7e..3f35543acf 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -189,6 +189,7 @@ static int mmap_frag(abi_ulong real_start,
 # define TASK_UNMAPPED_BASE  0x40000000
 #endif
 abi_ulong mmap_next_start = TASK_UNMAPPED_BASE;
+abi_ulong mmap_base = TASK_UNMAPPED_BASE;
 
 unsigned long last_brk;
 
@@ -299,7 +300,7 @@ abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size, abi_ulong align)
 
             if ((addr & (align - 1)) == 0) {
                 /* Success.  */
-                if (start == mmap_next_start && addr >= TASK_UNMAPPED_BASE) {
+                if (start == mmap_next_start && addr >= mmap_base) {
                     mmap_next_start = addr + size;
                 }
                 return addr;
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 560a68090e..83c00cfea2 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -161,6 +161,11 @@ void task_settid(TaskState *);
 void stop_all_tasks(void);
 extern const char *qemu_uname_release;
 extern unsigned long mmap_min_addr;
+/*
+ * mmap_base is minimum address to use when allocating guest pages. All guest
+ * pages will be allocated at this (guest) address or higher addresses.
+ */
+extern abi_ulong mmap_base;
 
 /* ??? See if we can avoid exposing so much of the loader internals.  */
 
-- 
2.25.0.265.gbab2e86ba0-goog


