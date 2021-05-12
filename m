Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF66637CFCB
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:32:49 +0200 (CEST)
Received: from localhost ([::1]:59978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsj3-0006Ga-1M
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUO-00077D-TK
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:45 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:40600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUG-0008II-FT
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:38 -0400
Received: by mail-io1-xd36.google.com with SMTP id z24so22425746ioj.7
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tLJeaEkFF9pn0rRHnoKamSr74c8lvvgr12qL9qBzFfY=;
 b=kjqFQKtR7CmkT3t0IYqZv/kWwnV5dHxsWGlT0i7waBIJfpAJs14wcIrB3Z25du/zMJ
 /xcvyxgBCxRZv+ocp6GXQR31/719kPEjPbiiEwsa+QeR/XFlX0Oq72LjnfrW1gz20hMi
 M0OUjUi4yZSUzdZ54UBuWUZ8SXTLc2BSaxrejWPnWylfn1UMOpmrsex9WBNTkFWZuY/H
 9vpEzCNvEY2mN2NtSscuZj8EgiZi35BT10ypWE5axH/zmWyo2MtNGoVZb6kRCppIaHXp
 P3HOEgNaVdn89wbS6fAx+mNVsMbc4D158rOrC0C/9oc6wbDR4B9yoXOMgQjDfogotWtp
 jrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tLJeaEkFF9pn0rRHnoKamSr74c8lvvgr12qL9qBzFfY=;
 b=WsUNsdpQCAJmwN0M9yrR4cex5oBCPkkts5rpay/Mf/6EO2Ga5lWoBZH6UMcyMw8Kdf
 N6ufK7gCBEa9PiWfwyOG6dzOPRTSSoTQX4zlbZjFP5TeJOUWxt11pmx6NCtABMmFIisi
 0NAqu0b0UAbFI2i5V5T9Q4HjDWYROO2R7E4ggVMeZRZeRx/1GCBgWYWmaLM/VHu1wSCI
 gL+ybpmCjG7JY+WgMsTpcdyJ8+QO8oMrEQFyyIzfk7wdDDdYOq3QzDJ6JLSAmzQrI1z7
 H8qB4Mcxq7r0eMMrLLrKHM9c/9iLPB93AGPJNVtxgunlTv7CkAR860DVYJ7Z47tsHRMM
 FTHQ==
X-Gm-Message-State: AOAM530ty1rK3XDD16se6/zmmxfGA4OjRJ0Vs1juoE/A9639BrZDDiG5
 sqmhYd67X26wD8WyCf7S4g17JRp5A5e5Rg==
X-Google-Smtp-Source: ABdhPJw/0MxfRbhmwlNDIXrj2/yZuz1yW3GcV/I8OPY1WUtGFCAVzxXJQUB3upCXeTRhCyCqsUPnZg==
X-Received: by 2002:a6b:d11a:: with SMTP id l26mr27228993iob.88.1620839851211; 
 Wed, 12 May 2021 10:17:31 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d2sm192064ile.18.2021.05.12.10.17.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 10:17:30 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/20] bsd-user: style tweak: Use preferred block comments
Date: Wed, 12 May 2021 11:17:04 -0600
Message-Id: <20210512171720.46744-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210512171720.46744-1-imp@bsdimp.com>
References: <20210512171720.46744-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
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

Use the preferred block comment style.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index c342dd7829..cd1c26516b 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -50,9 +50,11 @@ const char *qemu_uname_release;
 extern char **environ;
 enum BSDType bsd_type;
 
-/* XXX: on x86 MAP_GROWSDOWN only works if ESP <= address + 32, so
-   we allocate a bigger stack. Need a better solution, for example
-   by remapping the process stack directly at the right place */
+/*
+ * XXX: on x86 MAP_GROWSDOWN only works if ESP <= address + 32, so
+ * we allocate a bigger stack. Need a better solution, for example
+ * by remapping the process stack directly at the right place
+ */
 unsigned long x86_stack_size = 512 * 1024;
 
 void gemu_log(const char *fmt, ...)
@@ -262,13 +264,17 @@ void cpu_loop(CPUX86State *env)
 #define SPARC64_STACK_BIAS 2047
 
 /* #define DEBUG_WIN */
-/* WARNING: dealing with register windows _is_ complicated. More info
-   can be found at http://www.sics.se/~psm/sparcstack.html */
+/*
+ * WARNING: dealing with register windows _is_ complicated. More info
+ * can be found at http://www.sics.se/~psm/sparcstack.html
+ */
 static inline int get_reg_index(CPUSPARCState *env, int cwp, int index)
 {
     index = (index + cwp * 16) % (16 * env->nwindows);
-    /* wrap handling : if cwp is on the last window, then we use the
-       registers 'after' the end */
+    /*
+     * wrap handling : if cwp is on the last window, then we use the
+     * registers 'after' the end
+     */
     if (index < 8 && env->cwp == env->nwindows - 1)
         index += 16 * env->nwindows;
     return index;
@@ -846,9 +852,11 @@ int main(int argc, char **argv)
     syscall_init();
     signal_init();
 
-    /* Now that we've loaded the binary, GUEST_BASE is fixed.  Delay
-       generating the prologue until now so that the prologue can take
-       the real value of GUEST_BASE into account.  */
+    /*
+     * Now that we've loaded the binary, GUEST_BASE is fixed.  Delay
+     * generating the prologue until now so that the prologue can take
+     * the real value of GUEST_BASE into account.
+     */
     tcg_prologue_init(tcg_ctx);
     tcg_region_init();
 
-- 
2.22.1


