Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0B74A5014
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:24:43 +0100 (CET)
Received: from localhost ([::1]:55934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdEA-00008m-SX
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:24:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnc-0004qO-T5
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:16 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=47078
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcna-0002dn-Cr
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:16 -0500
Received: by mail-io1-xd2a.google.com with SMTP id e79so18352527iof.13
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bc6DcyWj3C/koTrEJ9qrW7xAW1qoks2DIh1czZk9FmE=;
 b=WdE0MqagTBN+c8wUZvMuRF0bcnDpk4w2PKZyjgJC/Yyn9MzsUAmHWrUeLMVGuiGJ5W
 HcvOg3B3b2eCIcP2p2rGkFZ6iMpUYjOIPx2XDv6fO7oJ5Ai1gaO58mA1YVSSMFG6RZgB
 BWrDLDAwEj1bMhhsSt3V5ul3LB5CLxrkM6263xYeCAckITOOSapPFjAR93SAAAVss42O
 yZZXBTaqXfowlycfzhxU68f7FpPH9IQcRH34fl9B7nP36Y2BrKA9gHrREPqF4Hb5V0+L
 jtQXW5Fuky3qHPJID6mViF+hBoY18IJctYPsfBghqOD3RbR/2qQh+FTLK5ZFbJmrxQS/
 6i2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bc6DcyWj3C/koTrEJ9qrW7xAW1qoks2DIh1czZk9FmE=;
 b=CSHUyYvIcJyOkB3Pcf6NTx04c5szKD/hySDPq2Zq83sAKYw8TvantMrefSfoPBD739
 N9fvponioRZB4ATIRlnWQpA5CxkeQG0tqqi967Lo4cLZVHY+V6PZZZ7JGTDsy8cMmizc
 0T+cWD/nDBO2xd+F3HR4p6+CxCAAX1PL5RJA/ZQT5r40+XlE4KbprnnFiGgng+4kRUQe
 4v7lGNKUbigkSUGer4dHLOEW5C2B8hfYFhRv98FF903Vbw13NWGHmrWL6rGsiyuovBkf
 BRNcwiqAVXLbwF3MLAjYxLTfruWDhf3EYdkw1xvyAXBv4f+dHBVvVk9brwlpkDIPddMK
 iPww==
X-Gm-Message-State: AOAM530+JVRmwNKe+hH9GY72cFJ8y+6zn0LpXDlm2jkNDuSAAf9tohBP
 QWt3BqgSP+XdaTx7BNzzht6OKVoGv57Hhg==
X-Google-Smtp-Source: ABdhPJxUpY/FL7G+jfntG/FwNVvA9lRe4eB3uat5LLxN8BnrZB91f7GuzJ/cfEbjlA5ccTjIhhZu3g==
X-Received: by 2002:a05:6602:1507:: with SMTP id
 g7mr7083472iow.7.1643659002143; 
 Mon, 31 Jan 2022 11:56:42 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:41 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/40] bsd-user/arm/arget_arch_cpu.h: Move EXCP_DEBUG and
 EXCP_BKPT together
Date: Mon, 31 Jan 2022 12:56:08 -0700
Message-Id: <20220131195636.31991-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement EXCP_DEBUG and EXCP_BKPT the same, as is done in
linux-user. The prior adjustment of register 15 isn't needed, so remove
that. Remove a redunant comment (that code in FreeBSD never handled
break points). It's unclear why BKPT was an alias for system calls,
but FreeBSD doesn't do that today.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index b7f728fd667..05b19ce6119 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -65,19 +65,7 @@ static inline void target_cpu_loop(CPUARMState *env)
             }
             break;
         case EXCP_SWI:
-        case EXCP_BKPT:
             {
-                /*
-                 * system call
-                 * See arm/arm/trap.c cpu_fetch_syscall_args()
-                 */
-                if (trapnr == EXCP_BKPT) {
-                    if (env->thumb) {
-                        env->regs[15] += 2;
-                    } else {
-                        env->regs[15] += 4;
-                    }
-                }
                 n = env->regs[7];
                 if (bsd_type == target_freebsd) {
                     int ret;
@@ -172,14 +160,8 @@ static inline void target_cpu_loop(CPUARMState *env)
             queue_signal(env, info.si_signo, &info);
             break;
         case EXCP_DEBUG:
-            {
-
-                info.si_signo = TARGET_SIGTRAP;
-                info.si_errno = 0;
-                info.si_code = TARGET_TRAP_BRKPT;
-                info.si_addr = env->exception.vaddress;
-                queue_signal(env, info.si_signo, &info);
-            }
+        case EXCP_BKPT:
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->regs[15]);
             break;
         case EXCP_YIELD:
             /* nothing to do here for user-mode, just resume guest code */
-- 
2.33.1


