Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E365982C67
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 09:13:23 +0200 (CEST)
Received: from localhost ([::1]:59376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hutet-0000vM-4Y
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 03:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39666)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hutcm-0005tH-HY
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 03:11:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hutcl-0002Gp-EH
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 03:11:12 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40800)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hutcl-0002G1-7g
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 03:11:11 -0400
Received: by mail-wm1-x344.google.com with SMTP id v19so75314301wmj.5
 for <qemu-devel@nongnu.org>; Tue, 06 Aug 2019 00:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TcocXI61yPYShryckVHC8C3lt7n1GolpIL0mLOqSWCU=;
 b=WkaeL0TIQfvhMzvxXoGIj/J1yCIQuDdTAJhsZstex0fUQgLKLA2ZbUIgb+CnVvRQ9M
 AZdgU1ob/jHy+cj6UQkCwngnufzW3TM85D2stPb5Dw/kVTb0Wi8OEt9wNW5RcQ2846Zk
 Opz2PjMeURcS36k0Rr1nH7rmMpysETph5PSdV6vQ/fZ2PgjFqd5CL/11hW5YFJvCyQDR
 rMR7Aq/zbKx2iQGRX2QZElCdzm0C6v0y1O4vZFnVbocUl78ZoSgpMM3CP0hu0Z1rJkzR
 cx63Wvhhl/j9DYuNZ8rgucwfwVyExVyeIsrMEc7ODN/6PhhI9t67JGhiIGXo6h34BdrM
 Pt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TcocXI61yPYShryckVHC8C3lt7n1GolpIL0mLOqSWCU=;
 b=FcriZyq2L9NM7Q5y5wK0WXNmHv9AdYuAmCdhlJFh5AMWSmp2UVcBrpoUXZ5N5YH9pV
 Fj2r9kODd+3qc5SD5O2hmOCrcOgM50yJGt7SaMRm3iBaKP9mzoNk7hyrJTwswHESy6CA
 LXFUOtENU8wecKdNA7+z/z/ccpRDhj5YMo3cBGSK+G2RPvxm2ONOAEjvKSDmiGXAhyP4
 r8KJfxEjfDrfcsa7GuIMWUATbph6yh/7w9pun+xxNRBzbkEUTUrzmNw4eQUyhYPQZOqP
 LMKmpe+cxZTw7JMQvBm0mUNaOEcNo4x8s1BHQqxLhNo/ffTKb64tvuZkuCwt5GhT8h7R
 79Ag==
X-Gm-Message-State: APjAAAWGTEyoEMz3r3u2Qc9GGu66JN1jE20K1DAgSlVQ+gfTm0mSjBgG
 b7he4LhkE9SM+cQCr5M86NLM3q3l
X-Google-Smtp-Source: APXvYqyBUz87UAYiwQNFN/4eRs+JrTcPSyaIRear8F61tCtyzL9CwqQeIjQ1uf51KbTg3udN+r5oNg==
X-Received: by 2002:a1c:7e85:: with SMTP id z127mr2884825wmc.95.1565075469998; 
 Tue, 06 Aug 2019 00:11:09 -0700 (PDT)
Received: from 640k.localdomain.com ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id z6sm74944037wrw.2.2019.08.06.00.11.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 00:11:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Aug 2019 09:11:05 +0200
Message-Id: <1565075466-14943-3-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1565075466-14943-1-git-send-email-pbonzini@redhat.com>
References: <1565075466-14943-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PATCH 2/3] module: return success on module load
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Let the caller know of load success.

Note that this also changes slightly the behaviour of the function to
try loading on subsequent calls if the previous ones failed.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/module.h |  2 +-
 util/module.c         | 14 +++++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index db30653..65ba596 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -65,6 +65,6 @@ void register_module_init(void (*fn)(void), module_init_type type);
 void register_dso_module_init(void (*fn)(void), module_init_type type);
 
 void module_call_init(module_init_type type);
-void module_load_one(const char *prefix, const char *lib_name);
+bool module_load_one(const char *prefix, const char *lib_name);
 
 #endif
diff --git a/util/module.c b/util/module.c
index ca9885c..e9fe3e5 100644
--- a/util/module.c
+++ b/util/module.c
@@ -156,8 +156,10 @@ out:
 }
 #endif
 
-void module_load_one(const char *prefix, const char *lib_name)
+bool module_load_one(const char *prefix, const char *lib_name)
 {
+    bool success = false;
+
 #ifdef CONFIG_MODULES
     char *fname = NULL;
     char *exec_dir;
@@ -170,7 +172,7 @@ void module_load_one(const char *prefix, const char *lib_name)
 
     if (!g_module_supported()) {
         fprintf(stderr, "Module is not supported by system.\n");
-        return;
+        return false;
     }
 
     if (!loaded_modules) {
@@ -181,7 +183,7 @@ void module_load_one(const char *prefix, const char *lib_name)
 
     if (!g_hash_table_add(loaded_modules, module_name)) {
         g_free(module_name);
-        return;
+        return true;
     }
 
     exec_dir = qemu_get_exec_dir();
@@ -205,13 +207,19 @@ void module_load_one(const char *prefix, const char *lib_name)
         fname = NULL;
         /* Try loading until loaded a module file */
         if (!ret) {
+            success = true;
             break;
         }
     }
 
+    if (!success) {
+        g_hash_table_remove(loaded_modules, module_name);
+    }
+
     for (i = 0; i < n_dirs; i++) {
         g_free(dirs[i]);
     }
 
 #endif
+    return success;
 }
-- 
1.8.3.1



