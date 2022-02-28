Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9CE4C775F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:14:58 +0100 (CET)
Received: from localhost ([::1]:56658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkXx-000620-Ar
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:14:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkUt-0007zX-Fn
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:47 -0500
Received: from [2607:f8b0:4864:20::133] (port=45603
 helo=mail-il1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkUr-0006Xh-VK
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:47 -0500
Received: by mail-il1-x133.google.com with SMTP id x14so5521704ill.12
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LQyY9HazAmIIQN0Qysba5tizaG3itH2sn2cAotRVJ2c=;
 b=6mbHD7ny/CcDrDTfCHyP9KnvtHwg46ppTSF5YbGwtWTIaDzEX8Q9nhjjd6QKwYNg5O
 d+mS6C/xu2lD4C0nQu/n/VgF5VAGoA8R0koo3Os/9xANScreKSj4SnWUbVQuzuDVjYd8
 gdXPLjAyc1tOt8HBClMyeNOnlHuiG4/RGoM/hdKh4tnAJYp1Ka027Jk2Kt9048xbAtOD
 +cDpf5XdsbQipjStE/g3MLY4l4r3924MSaW/yBApat/3zoFOkdUDsMmPHN+yRnZVuHB9
 9Zn7keGAB+fzisL5f3KGDF49BFYYAIEmSfDt2sQC7NIfnr2Ex7sifhoV6n5rCNOdNScG
 gskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LQyY9HazAmIIQN0Qysba5tizaG3itH2sn2cAotRVJ2c=;
 b=NEW6JNOjtLNlkc2bClEYQcLMZ6PnW32wk1xe9US0wx0JjD0C1DSgyFbYHhEVNkNdul
 XHBcp6IcA8ldiyufu6pe+rMCBlydnqq/FVCezcZpPLlI3RTEQbrwDwjUKMgJ7FRe5OIK
 vMqNc4/4+Hh1V0m/jLQCW60zYBoj7pGuxHDmQWpA2vQ96o2cXQizIW0rtZc7bMUduwVN
 GxOX6oEEhNWGeYjeif+VfAi6U7qOeamjufp3cnq/g0ipYpZh3lfW5p6EEUhAmOvESe3z
 L5o/y7iIJ4V11FSgXMGU4st394LUlRl20kn0GaUGDSSR9XEnta2HpktBzeIFZsoRaT6X
 AUlw==
X-Gm-Message-State: AOAM533jW3soLA8t6wuzOG6myFZlSM1+bf3U6vLMTgZLUK0tFhHprTkR
 rpKkow9qWHAO0/vHMnZqaUQCr5EwhHn53w==
X-Google-Smtp-Source: ABdhPJyhw+suBefyaEzZGZuGI330iDJMSKYJB/J5yoU6T+jLMx6aqPpulT7ThxKdKjxTn22yEBRUzg==
X-Received: by 2002:a05:6e02:164a:b0:2bd:2120:3c05 with SMTP id
 v10-20020a056e02164a00b002bd21203c05mr20855595ilu.253.1646071904641; 
 Mon, 28 Feb 2022 10:11:44 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 s13-20020a6bdc0d000000b006408888551dsm6015396ioc.8.2022.02.28.10.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:11:44 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/16] bsd-user/x86_64/target_arch_cpu.h: Remove openbsd syscall
Date: Mon, 28 Feb 2022 11:12:01 -0700
Message-Id: <20220228181214.2602-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220228181214.2602-1-imp@bsdimp.com>
References: <20220228181214.2602-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::133
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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


