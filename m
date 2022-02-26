Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489BD4C56F4
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 18:09:43 +0100 (CET)
Received: from localhost ([::1]:33654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO0Zi-0002SI-B3
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 12:09:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XP-0008B4-RH
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:19 -0500
Received: from [2607:f8b0:4864:20::136] (port=35464
 helo=mail-il1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XN-0000PE-3s
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:19 -0500
Received: by mail-il1-x136.google.com with SMTP id j5so6839986ila.2
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 09:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LQyY9HazAmIIQN0Qysba5tizaG3itH2sn2cAotRVJ2c=;
 b=CTdJsv4CHIPDL2dNWv3vlyWxuAn7EHxL8vpL8I9r914Rw+IYewbqXx2wbHLWmsbe0g
 aJqkytERSmLYJChIloLiPmC8Q2hixzwG+awnVi+7rvlxArxzdFfBfI7WeS3eXeEnC9Gt
 VDejYw6ikiATEkKhIpCphwIXYN5M5qe2J8G0AT6fOIxDQ3yk/HIhR7yP78mFlLkv1Bj0
 pYP3Spy1aT+E3h3TXf6t2SYQ9WOFijs3WJQWcUGbqpTrs7r5pjZdoJR7ZZ33IY/l7R9P
 9QlBuLTJcZfFevwVaRr2yTdi+HT2Nh+9JmMZ/Q0SKMZR05mECDeUXZkTMHj+0uTEbTd0
 HI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LQyY9HazAmIIQN0Qysba5tizaG3itH2sn2cAotRVJ2c=;
 b=Z83DbnhZQZFiLUsOMpCcCecBs8M9QSz7dS2GgW4VzpN8Rxp6fV3L1uIpzmIj8n6sm+
 PETX83kePQFC46cfze5bKJq2wSy9uTCOQB1/KQUs1x3/9E+9J3YA0GIX9eA64+0jPDDt
 +HBFPeZRtKZG6DLqlrJSfwfh3xQmbn9lXLI0/nbD6tEFhDk2t7nZv7NK/lsIMTSw0mFd
 57zl2/48AzfCbJKWQUh9TF+R138vT4T0E9G9F5s4Qa7lVsn7Tv7bpHmBFDt1Fx3/Zshh
 nd/3A0Giq8+VDW8vekBUoIw02Ot8McvHReLziWg/hy2CGAmRJKByc9hDNjeICJIHGLQM
 yB4g==
X-Gm-Message-State: AOAM531/Uq2prur1VkVhPjrryZoTIdEQCoAeb7Geb7+c5WkIN9CO558p
 GUI+qNzQ5EOhONWkmE+YTG7BqdAb/bQikA==
X-Google-Smtp-Source: ABdhPJyi6vBczO/q1nbPAZic5DzrKPLaBdlSIRkWqVFC1HSEa5m7Oqg0brGEDwrRXySWk9NQXfEGzw==
X-Received: by 2002:a05:6e02:1a84:b0:2c2:d8e5:a0fe with SMTP id
 k4-20020a056e021a8400b002c2d8e5a0femr361196ilv.140.1645895235957; 
 Sat, 26 Feb 2022 09:07:15 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 e23-20020a6b5017000000b00635b8032d45sm3138764iob.22.2022.02.26.09.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 09:07:15 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/16] bsd-user/x86_64/target_arch_cpu.h: Remove openbsd
 syscall
Date: Sat, 26 Feb 2022 10:07:31 -0700
Message-Id: <20220226170744.76615-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220226170744.76615-1-imp@bsdimp.com>
References: <20220226170744.76615-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::136
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This doesn't build on openbsd at the moment, and this could
should arguably be in bsd-user/*bsd/x86_64 somewhere. Until
we refactor to support OpenBSD/NetBSD again, drop it here.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
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


