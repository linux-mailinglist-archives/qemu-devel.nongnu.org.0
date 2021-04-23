Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BF1369B8E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:50:30 +0200 (CEST)
Received: from localhost ([::1]:38550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2kv-0000Qi-5y
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2b8-0005th-7X
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:23 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:45052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2b2-0008C8-3h
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:20 -0400
Received: by mail-il1-x136.google.com with SMTP id i22so37050989ila.11
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vig8iW0/Swd4+9E5pXiJN31r0Gkde0pAJpq+5ENBE+8=;
 b=c1OUGaRmXiPtedwJ+FjvOXTTBWZEErDlbJtL11N8TokP05HdnzJ6GUlJCTjvBDgsMi
 wKQqBftyeLExVYCS7tr5bfMkGmmv+FLCpOFs5kbNKsJ6Wvo4vaELgNt1Ha5laVXE9S4X
 h3DzrQxAmEmFRFIpbG/TXyioMl7ZWsX0HY8bkSjSlO7XnXLR0ty0N0SWJ52QMA6knbh9
 yha+TvojkdduLdXfhlsG06jyuq8lEzbKO0aYy0xJcWdlraePdWpESWopcrspleHyvd5O
 Pddbqx1CjWnlf4BMlKrXC17nljdPb2SyVra7mei/Eqo/kx3Y1c7eW2UEThOsJIf/6lbb
 drQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vig8iW0/Swd4+9E5pXiJN31r0Gkde0pAJpq+5ENBE+8=;
 b=fI09wxht5OEARYJZ0bke95/vW1ub77rNqFMSkEhfGCrtlMyPNuGbuuF0TYcO2I8rZY
 f+qBRcu/1sxJv+Tqe1zh+uZq4eC+C8yzG/A+u9rRm+JqjjnO1l8VUZ6Qsf8l4VSMzNie
 VdytyDgXKNS6f0ChmLVNyDEyB5pTQNfbPo16fm4O6cxEtUqfO1p4JueVoTUJo4noNj/x
 Vp2f60clNjVlvMwfW9bRIpW8Qflw8uuiYUyXp9g1K7M6xwi+pPgo3qrcISX5cx++54n/
 CgUxnt9wZVkakdg+/HTQKPi9TbvgsRN01r3iyxv9R5sY5Hr8fKA1zGSlhVeXRXVC6ILC
 L8fg==
X-Gm-Message-State: AOAM531DKIpusSm1BzQaglqmQ2vY73UaR/wdexDpG+hiP8ju30VNXXFs
 78LhIEgJ3C0HCcrufSDpbIfXACedgIVJ3vrg
X-Google-Smtp-Source: ABdhPJwyWb/UElhOGUB3+lOMEEoNBA2bMAeUav4w2rFIB9V1kPc9YcEaG+DDHBPd7WQUT95Er97UZA==
X-Received: by 2002:a92:1948:: with SMTP id e8mr4208793ilm.145.1619210414635; 
 Fri, 23 Apr 2021 13:40:14 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id n1sm3201308ion.22.2021.04.23.13.40.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:40:13 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 16/24] bsd-user: Use preferred block comments
Date: Fri, 23 Apr 2021 14:39:51 -0600
Message-Id: <20210423203959.78275-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210423203959.78275-1-imp@bsdimp.com>
References: <20210423203959.78275-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
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

Use the preferred block comment style.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 91603f5ac2..5958b07e62 100644
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
@@ -371,13 +373,17 @@ void cpu_loop(CPUX86State *env)
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
@@ -990,9 +996,11 @@ int main(int argc, char **argv)
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


