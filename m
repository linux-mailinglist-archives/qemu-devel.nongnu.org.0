Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A524A5B5E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:44:32 +0100 (CET)
Received: from localhost ([::1]:49358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEraI-0003Ns-SZ
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:44:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7q-00054U-6h
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:06 -0500
Received: from [2607:f8b0:4864:20::12c] (port=33530
 helo=mail-il1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7k-0003Wy-BB
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:05 -0500
Received: by mail-il1-x12c.google.com with SMTP id o10so13999690ilh.0
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u/RdOufxsgAVRIFnGmjXk9mwEobZpTAulFytqYBcPis=;
 b=MMxRLKHvUfKXn1Ez0xmYBNJq6iumcWo1WqvCTdBxYp7d+o3VmaUlicST1IYN0l8giX
 Fs1skyfdc3gcjrZDoPc6QJ3niHTF6sZ3cKuRh7Xnp01dC9tmjsYJc1ZzIGp2Os9ILq5C
 deHtsyxofcoLJ7TCXQqSArB5l6O9NLug62ghBTIKjNgi2OqCam/KzywU17mE+T2porPD
 Y3xJooMKR9F+sV4jcwJD7Wakm9h4JyoT+OKZ62PEPrGeYQdE+Ko8Ek4bCNW5l1VlnBO1
 i0tNR4SskIkWCOGKUsQQrdIP/lzNNSBQRYhEITNcG8tfTKq1jPMP5tqB2pC+83aG0vzC
 YLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u/RdOufxsgAVRIFnGmjXk9mwEobZpTAulFytqYBcPis=;
 b=leMUb0j6O5U9hmMm0Eop8InPwS6nuaH2rPYEsIocq3Tssc+JcedhM2bNVOtv25C4hW
 JW0FH3Lttv5++dSP5m0Lzuizzwy4djinluXPXbMg+z1yJLvGVheyXYx2sWH4O6eRm2yI
 casNObwesN6B6F+8GcZKygMV2z/Mj9TzzFXr5KbKRL8TnT4ySJfoYyGY/3xR0YsKmnv6
 pH69+UXPXQ13DxEC/iwqSkHJ9zJ4Ui36STkX+E/iXoZlkqEx4MZuBuJyHqGAaLKnz3T9
 zY3T7uRmVzdvrN186IExb07HEQZ1urAa8mLJmD5bxo4RpmfofiSyn7p/BDXgoIfCtqCZ
 GM8w==
X-Gm-Message-State: AOAM530nEn86wX6sKFdOYTpILP5Oy1/pLHwNOzdH3KW3TiVpTu+pCNYc
 zP2mg4k7xT/vjKv+I20dz8bQK9HSsOKXDg==
X-Google-Smtp-Source: ABdhPJykweJeg5TomQPGiz74kexpgbEtYfsf3GPeXaZ7k1Zi4k/OupDphaTR/NtY2Y/FqhXV4jKIPw==
X-Received: by 2002:a05:6e02:1786:: with SMTP id
 y6mr1786445ilu.152.1643714091619; 
 Tue, 01 Feb 2022 03:14:51 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:14:51 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/22] bsd-user/x86_64/target_arch_cpu.h: Remove openbsd
 syscall
Date: Tue,  1 Feb 2022 04:14:36 -0700
Message-Id: <20220201111455.52511-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This doesn't build on openbsd at the moment, and this could
should arguably be in bsd-user/*bsd/x86_64 somewhere. Until
we refactor to support OpenBSD/NetBSD again, drop it here.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/x86_64/target_arch_cpu.h | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/bsd-user/x86_64/target_arch_cpu.h b/bsd-user/x86_64/target_arch_cpu.h
index 9dc52d5afc4..5be2f02416e 100644
--- a/bsd-user/x86_64/target_arch_cpu.h
+++ b/bsd-user/x86_64/target_arch_cpu.h
@@ -126,25 +126,14 @@ static inline void target_cpu_loop(CPUX86State *env)
         switch (trapnr) {
         case EXCP_SYSCALL:
             /* syscall from syscall instruction */
-            if (bsd_type == target_freebsd) {
-                env->regs[R_EAX] = do_freebsd_syscall(env,
-                                                      env->regs[R_EAX],
-                                                      env->regs[R_EDI],
-                                                      env->regs[R_ESI],
-                                                      env->regs[R_EDX],
-                                                      env->regs[R_ECX],
-                                                      env->regs[8],
-                                                      env->regs[9], 0, 0);
-            } else { /* if (bsd_type == target_openbsd) */
-                env->regs[R_EAX] = do_openbsd_syscall(env,
-                                                      env->regs[R_EAX],
-                                                      env->regs[R_EDI],
-                                                      env->regs[R_ESI],
-                                                      env->regs[R_EDX],
-                                                      env->regs[10],
-                                                      env->regs[8],
-                                                      env->regs[9]);
-            }
+            env->regs[R_EAX] = do_freebsd_syscall(env,
+                                                  env->regs[R_EAX],
+                                                  env->regs[R_EDI],
+                                                  env->regs[R_ESI],
+                                                  env->regs[R_EDX],
+                                                  env->regs[R_ECX],
+                                                  env->regs[8],
+                                                  env->regs[9], 0, 0);
             env->eip = env->exception_next_eip;
             if (((abi_ulong)env->regs[R_EAX]) >= (abi_ulong)(-515)) {
                 env->regs[R_EAX] = -env->regs[R_EAX];
-- 
2.33.1


