Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E4B4A5B2B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:29:41 +0100 (CET)
Received: from localhost ([::1]:44536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErLv-0005ua-Uv
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:29:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7p-00051s-FC
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:05 -0500
Received: from [2607:f8b0:4864:20::135] (port=41553
 helo=mail-il1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7k-0003XB-65
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:04 -0500
Received: by mail-il1-x135.google.com with SMTP id 15so13954580ilg.8
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ncWnqsf+UN/vyTIxU3XOpWl26IcR1Ir0CJ6FYV9kHjk=;
 b=WsYlcgV8rDZQYoO4LtYd5nvESi/HctmamCRVeW6WkNnGtjdQxn2XkyhfCFQ2Qa7lke
 jsad4M75XuaErmv+A+Dj+2OiOz1XGenApSigxX7Tq/lGfyoy0oFxSTo/VLkYzcuhRM8s
 9Zqs0t9UJgVSmCIacNRsxBi1Tu5l0eK0ZIYa2MC/uZK0JZRN+Hq58pjE9eOoQ0y54rv2
 iyjWBLDyDj2XGcMQBJ+F5eAfGi149S+l6B+ZaUV4jXNyWsh6SeydCyQGcMTSexkymLGn
 e1QjIX/XXHDhg7PXBfNSQcRY68KkBX6oRfT5/m+x4KRW3hDasrn+3jOr3ehoVFqOGjGk
 wiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ncWnqsf+UN/vyTIxU3XOpWl26IcR1Ir0CJ6FYV9kHjk=;
 b=qNvLqoTJ9MgopIRHFY8SEHYX8DCA7L5ziQxgloSMaX1hNVAdRMMtF+IHBiRJcl5k50
 YbF8mWhs6U570fE0O37EfB39mdJoTgoIgar9+K6YAzKzpPxi6VusVtInXO3uqpBiBPK9
 0mCxTtK9wUeDCyPIZDvj8FnAgqriMdAR7CjWogJr+2G3RbGbej+9r/8haFzKGo0Px7MM
 Ch14aUsWsNf84BfnEYzB69pFaCcF7gd8pxxLIKaXfexY7MAQjQesUpoGY5NNjcaEeUII
 YhAXdVp4lH3Z9Nqe58cY9q9UbN8Vj0afHUEOOPRgN3oE61h9U1/y0o40wl4xxILZxrO5
 PZwQ==
X-Gm-Message-State: AOAM5313g8a+yVjEqFsSqFdCfE/GTiI2ZCbTosNcWOu5Bdqv2Pqqm0UN
 gV2ynmuahY5eQd8TVLUc6v4yk1pjWtcOkA==
X-Google-Smtp-Source: ABdhPJxcLyIjXRCtVogEUjbhUC40uAds2717xINVKF1k9Wbt1oOKnNxyESgZTIUveBU/DqJTO89k4Q==
X-Received: by 2002:a05:6e02:b41:: with SMTP id
 f1mr15109068ilu.193.1643714093502; 
 Tue, 01 Feb 2022 03:14:53 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:14:53 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/22] bsd-user/arm/target_arch_cpu.h: Only support FreeBSD
 sys calls
Date: Tue,  1 Feb 2022 04:14:38 -0700
Message-Id: <20220201111455.52511-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::135
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
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

Since we don't build on OpenBSD, only do FreeBSD system calls here. In
the future, we'll need to move this to some place like
bsd-user/freebsd/arm/mumble.h, but until then just leave this
inline. This reflects changes to the upstream.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_cpu.h | 139 ++++++++++++++++-----------------
 1 file changed, 66 insertions(+), 73 deletions(-)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index b087db48fa4..afb7814a8d1 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -40,7 +40,6 @@ static inline void target_cpu_init(CPUARMState *env,
 static inline void target_cpu_loop(CPUARMState *env)
 {
     int trapnr, si_signo, si_code;
-    unsigned int n;
     CPUState *cs = env_cpu(env);
 
     for (;;) {
@@ -66,82 +65,76 @@ static inline void target_cpu_loop(CPUARMState *env)
             break;
         case EXCP_SWI:
             {
-                n = env->regs[7];
-                if (bsd_type == target_freebsd) {
-                    int ret;
-                    abi_ulong params = get_sp_from_cpustate(env);
-                    int32_t syscall_nr = n;
-                    int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
+                int ret;
+                abi_ulong params = get_sp_from_cpustate(env);
+                int32_t syscall_nr = env->regs[7];
+                int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
 
-                    /* See arm/arm/syscall.c cpu_fetch_syscall_args() */
-                    if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
-                        syscall_nr = env->regs[0];
-                        arg1 = env->regs[1];
-                        arg2 = env->regs[2];
-                        arg3 = env->regs[3];
-                        get_user_s32(arg4, params);
-                        params += sizeof(int32_t);
-                        get_user_s32(arg5, params);
-                        params += sizeof(int32_t);
-                        get_user_s32(arg6, params);
-                        params += sizeof(int32_t);
-                        get_user_s32(arg7, params);
-                        arg8 = 0;
-                    } else if (syscall_nr == TARGET_FREEBSD_NR___syscall) {
-                        syscall_nr = env->regs[0];
-                        arg1 = env->regs[2];
-                        arg2 = env->regs[3];
-                        get_user_s32(arg3, params);
-                        params += sizeof(int32_t);
-                        get_user_s32(arg4, params);
-                        params += sizeof(int32_t);
-                        get_user_s32(arg5, params);
-                        params += sizeof(int32_t);
-                        get_user_s32(arg6, params);
-                        arg7 = 0;
-                        arg8 = 0;
-                    } else {
-                        arg1 = env->regs[0];
-                        arg2 = env->regs[1];
-                        arg3 = env->regs[2];
-                        arg4 = env->regs[3];
-                        get_user_s32(arg5, params);
-                        params += sizeof(int32_t);
-                        get_user_s32(arg6, params);
-                        params += sizeof(int32_t);
-                        get_user_s32(arg7, params);
-                        params += sizeof(int32_t);
-                        get_user_s32(arg8, params);
-                    }
-                    ret = do_freebsd_syscall(env, syscall_nr, arg1, arg2, arg3,
-                            arg4, arg5, arg6, arg7, arg8);
+                /* See arm/arm/syscall.c cpu_fetch_syscall_args() */
+                if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
+                    syscall_nr = env->regs[0];
+                    arg1 = env->regs[1];
+                    arg2 = env->regs[2];
+                    arg3 = env->regs[3];
+                    get_user_s32(arg4, params);
+                    params += sizeof(int32_t);
+                    get_user_s32(arg5, params);
+                    params += sizeof(int32_t);
+                    get_user_s32(arg6, params);
+                    params += sizeof(int32_t);
+                    get_user_s32(arg7, params);
+                    arg8 = 0;
+                } else if (syscall_nr == TARGET_FREEBSD_NR___syscall) {
+                    syscall_nr = env->regs[0];
+                    arg1 = env->regs[2];
+                    arg2 = env->regs[3];
+                    get_user_s32(arg3, params);
+                    params += sizeof(int32_t);
+                    get_user_s32(arg4, params);
+                    params += sizeof(int32_t);
+                    get_user_s32(arg5, params);
+                    params += sizeof(int32_t);
+                    get_user_s32(arg6, params);
+                    arg7 = 0;
+                    arg8 = 0;
+                } else {
+                    arg1 = env->regs[0];
+                    arg2 = env->regs[1];
+                    arg3 = env->regs[2];
+                    arg4 = env->regs[3];
+                    get_user_s32(arg5, params);
+                    params += sizeof(int32_t);
+                    get_user_s32(arg6, params);
+                    params += sizeof(int32_t);
+                    get_user_s32(arg7, params);
+                    params += sizeof(int32_t);
+                    get_user_s32(arg8, params);
+                }
+                ret = do_freebsd_syscall(env, syscall_nr, arg1, arg2, arg3,
+                                         arg4, arg5, arg6, arg7, arg8);
+                /*
+                 * Compare to arm/arm/vm_machdep.c
+                 * cpu_set_syscall_retval()
+                 */
+                if (-TARGET_EJUSTRETURN == ret) {
                     /*
-                     * Compare to arm/arm/vm_machdep.c
-                     * cpu_set_syscall_retval()
+                     * Returning from a successful sigreturn syscall.
+                     * Avoid clobbering register state.
                      */
-                    if (-TARGET_EJUSTRETURN == ret) {
-                        /*
-                         * Returning from a successful sigreturn syscall.
-                         * Avoid clobbering register state.
-                         */
-                        break;
-                    }
-                    if (-TARGET_ERESTART == ret) {
-                        env->regs[15] -= env->thumb ? 2 : 4;
-                        break;
-                    }
-                    if ((unsigned int)ret >= (unsigned int)(-515)) {
-                        ret = -ret;
-                        cpsr_write(env, CPSR_C, CPSR_C, CPSRWriteByInstr);
-                        env->regs[0] = ret;
-                    } else {
-                        cpsr_write(env, 0, CPSR_C, CPSRWriteByInstr);
-                        env->regs[0] = ret; /* XXX need to handle lseek()? */
-                        /* env->regs[1] = 0; */
-                    }
+                    break;
+                }
+                if (-TARGET_ERESTART == ret) {
+                    env->regs[15] -= env->thumb ? 2 : 4;
+                    break;
+                }
+                if ((unsigned int)ret >= (unsigned int)(-515)) {
+                    ret = -ret;
+                    cpsr_write(env, CPSR_C, CPSR_C, CPSRWriteByInstr);
+                    env->regs[0] = ret;
                 } else {
-                    fprintf(stderr, "qemu: bsd_type (= %d) syscall "
-                            "not supported\n", bsd_type);
+                    cpsr_write(env, 0, CPSR_C, CPSRWriteByInstr);
+                    env->regs[0] = ret; /* XXX need to handle lseek()? */
+                    /* env->regs[1] = 0; */
                 }
             }
             break;
-- 
2.33.1


