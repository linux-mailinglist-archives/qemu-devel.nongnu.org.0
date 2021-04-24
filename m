Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB1736A1FB
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:14:15 +0200 (CEST)
Received: from localhost ([::1]:44840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKv8-0004SV-B6
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiE-0005ao-Ni
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:55 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:46653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKi4-0004Fo-6c
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:54 -0400
Received: by mail-il1-x130.google.com with SMTP id l19so2612298ilk.13
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Ra4ojyBQiRXbq3yO7fIMnjiQqytgyVg+dy0QRHbDHg=;
 b=oaIhamePoTgLpLs/c3J67Eljwzu3KJl0sCiCq3uS1djja5i/gIza+yXuPSHDYHvLH9
 KLtKhpd3O0e6O5JIxxI5xwSXhwAQ3Dan8B9a/DUbcLt2d0D0f8PF63NGaT5Lmxlu8MeV
 TCAAzBOGPtdrHhbqOB2L4QSXv4jrfjJyfliJLEqDH/wd/xn7DWz5zrLnHOQZTs1U5Pgy
 iNjeCcdW+xriHZFJfPegBOpDN21XlTg7eUEKRBkFnWhMXoU/jWBu5XXZgedPkvgyPkDj
 QC9WJixaa4cOgysfGr+TBGj8JsK5hJxllor9YiIOTvbi8NDQ7wky4KkGNmZJDyqqoFHH
 h1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Ra4ojyBQiRXbq3yO7fIMnjiQqytgyVg+dy0QRHbDHg=;
 b=eriy6bYSxPHYUwwz35+tguQLhkpdZ/Rpm1qxF84iHy5tjCMVH3SYs1DrEKb613qvBv
 +4Ktxj7DDn6Aaor5gALexRVGdn+9GAzQKkvxEHP9uT/2tduCAEXPwEP+i60y/dmCibhc
 J+/XXJpTRyXu6CAuEx0QMht/METv4LohgpUcO+L7/Ci2f1I3h6mrWpGwzLkpndCfziHu
 MLnU48pL7KyEgJm3wZBMM8Asz+RHADmzMm45qUChtCFJ0paHwdyyoHOvD6LG5+BoogIc
 r5y34BdHZQDAto8+4Tbi/Lc+eHYz8rNg8JxyF7qQbqyM5uNhx+75At1SGPo5OQmYi3Bx
 ww6w==
X-Gm-Message-State: AOAM530GTUeijMRuC05OQc7X7E1h3v3kMxipIjioN5Kq1UXJSem+oOwV
 uZY2J3BuXCYsapqhzfwecpfqk6RXMcMsJ0V5
X-Google-Smtp-Source: ABdhPJxU32facO63Yg4uSmLrZkyKK36klE/46kGqhZuA5eFCpdb8q6cCW5c3/a1X/iqgQeSvGpRM/g==
X-Received: by 2002:a05:6e02:eb4:: with SMTP id
 u20mr7572769ilj.182.1619280041391; 
 Sat, 24 Apr 2021 09:00:41 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:40 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/48] bsd-user: style tweak: Use preferred block comments
Date: Sat, 24 Apr 2021 09:59:46 -0600
Message-Id: <20210424160016.15200-19-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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

Use the preferred block comment style.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 3c6c0ec687..60a62e016a 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -51,9 +51,11 @@ const char *qemu_uname_release;
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
@@ -263,13 +265,17 @@ void cpu_loop(CPUX86State *env)
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
@@ -847,9 +853,11 @@ int main(int argc, char **argv)
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


