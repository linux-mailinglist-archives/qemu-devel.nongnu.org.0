Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2864C7771
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:19:59 +0100 (CET)
Received: from localhost ([::1]:40282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkco-0005jL-ON
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:19:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkUs-0007yP-Vv
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:47 -0500
Received: from [2607:f8b0:4864:20::130] (port=44979
 helo=mail-il1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkUq-0006Xb-QV
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:46 -0500
Received: by mail-il1-x130.google.com with SMTP id 9so10621640ily.11
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ogh2FUndj4MIrU/iCsiac6cM3XenhFOByuX1UWjQajU=;
 b=1hMCN8hgSH+0KUpzsV/qTmjlSqzHljBW7Bdp7EMcRxsyuwa3sBEFSIbala+VIbhbHZ
 f/tRDWzi7hFBu6VughJ+pohNZ3Y4cJodHMxIuZQHv6b3praO/vnsY3VLmZKwIrcI39bZ
 H92NqnI5GT3shHqsXh1DtIb3CzPtPx4SvbflTCYaBHrXulra58PyXXOIr3bpqSCWAIgT
 Ng5WBzy+XWFSFSYVYM8/24eIVfWI9kMnkXkBihUA/Fx4zpKFEq4fnS9uRxiQYjnJhwSJ
 vgGDI4WjiXYAp26J2iR1R4sSWiYMpTw1H99amZT5guxkZuBt3chhTOzAj8hnWCMdLArd
 XOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ogh2FUndj4MIrU/iCsiac6cM3XenhFOByuX1UWjQajU=;
 b=47ZfEVqQJUtoSTHEuu0ZCzmpEXfsl7cXbnO1Iynn/S+MHj+2RkzgnYNQLKhwUkxcag
 ntM16bUsMn4pejV5ZL87kA0qPWeXDkm379BwKp3mZPRZsk3Il+FFoeOSC0jjGCtTOgYQ
 MgHz8aD/dxDhFK5lBIW7oE9m2rHW2sTo2/ivmu6AyR7Ti0bH5ogNMAjn0d7vDEFs88hY
 1hCI3ySCje+xzQrEh2ib1meQb1tVSyjXucxgy8ZTnz4AigLlab5ovcxhxj4oM2SditPx
 OTxAo2FAqbgrlfn7lopP9iZAPKwj4jscqpflmoKE/NcX0vWC7pruh9IVKgLJx2Cc1Nt8
 zrbg==
X-Gm-Message-State: AOAM533Q5FDNSyNzwoxCxVghnd5lCXEJv4EfNZh2pNucdoKqVTX8jIXj
 nKr9L7PGkHgB7YjycOdv+hKQGezgFqLMkw==
X-Google-Smtp-Source: ABdhPJyrP2lp5GsnU8TFKXdY6c057sAh8xbJx78eqQNxWAHb7u2EnqsuaiXhl+1IcD6y9Li22VKraw==
X-Received: by 2002:a92:ca47:0:b0:2c2:8ecc:aac8 with SMTP id
 q7-20020a92ca47000000b002c28eccaac8mr19540837ilo.306.1646071903427; 
 Mon, 28 Feb 2022 10:11:43 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 s13-20020a6bdc0d000000b006408888551dsm6015396ioc.8.2022.02.28.10.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:11:43 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/16] bsd-user/x86_64/target_arch_cpu.h: int $80 never was a
 BSD system call on amd64
Date: Mon, 28 Feb 2022 11:12:00 -0700
Message-Id: <20220228181214.2602-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220228181214.2602-1-imp@bsdimp.com>
References: <20220228181214.2602-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::130
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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

Although initial versions of NetBSD did use int $80, it was replaced by
syscall before any releases. OpenBSD and FreeBSD always did syscall.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/x86_64/target_arch_cpu.h | 58 -------------------------------
 1 file changed, 58 deletions(-)

diff --git a/bsd-user/x86_64/target_arch_cpu.h b/bsd-user/x86_64/target_arch_cpu.h
index 0a9c0f08946..9dc52d5afc4 100644
--- a/bsd-user/x86_64/target_arch_cpu.h
+++ b/bsd-user/x86_64/target_arch_cpu.h
@@ -124,64 +124,6 @@ static inline void target_cpu_loop(CPUX86State *env)
         process_queued_cpu_work(cs);
 
         switch (trapnr) {
-        case 0x80:
-            /* syscall from int $0x80 */
-            if (bsd_type == target_freebsd) {
-                abi_ulong params = (abi_ulong) env->regs[R_ESP] +
-                    sizeof(int32_t);
-                int32_t syscall_nr = env->regs[R_EAX];
-                int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
-
-                if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
-                    get_user_s32(syscall_nr, params);
-                    params += sizeof(int32_t);
-                } else if (syscall_nr == TARGET_FREEBSD_NR___syscall) {
-                    get_user_s32(syscall_nr, params);
-                    params += sizeof(int64_t);
-                }
-                get_user_s32(arg1, params);
-                params += sizeof(int32_t);
-                get_user_s32(arg2, params);
-                params += sizeof(int32_t);
-                get_user_s32(arg3, params);
-                params += sizeof(int32_t);
-                get_user_s32(arg4, params);
-                params += sizeof(int32_t);
-                get_user_s32(arg5, params);
-                params += sizeof(int32_t);
-                get_user_s32(arg6, params);
-                params += sizeof(int32_t);
-                get_user_s32(arg7, params);
-                params += sizeof(int32_t);
-                get_user_s32(arg8, params);
-                env->regs[R_EAX] = do_freebsd_syscall(env,
-                                                      syscall_nr,
-                                                      arg1,
-                                                      arg2,
-                                                      arg3,
-                                                      arg4,
-                                                      arg5,
-                                                      arg6,
-                                                      arg7,
-                                                      arg8);
-            } else { /* if (bsd_type == target_openbsd) */
-                env->regs[R_EAX] = do_openbsd_syscall(env,
-                                                      env->regs[R_EAX],
-                                                      env->regs[R_EBX],
-                                                      env->regs[R_ECX],
-                                                      env->regs[R_EDX],
-                                                      env->regs[R_ESI],
-                                                      env->regs[R_EDI],
-                                                      env->regs[R_EBP]);
-            }
-            if (((abi_ulong)env->regs[R_EAX]) >= (abi_ulong)(-515)) {
-                env->regs[R_EAX] = -env->regs[R_EAX];
-                env->eflags |= CC_C;
-            } else {
-                env->eflags &= ~CC_C;
-            }
-            break;
-
         case EXCP_SYSCALL:
             /* syscall from syscall instruction */
             if (bsd_type == target_freebsd) {
-- 
2.33.1


