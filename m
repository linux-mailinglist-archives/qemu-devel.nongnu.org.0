Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDC3400EF7
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 12:08:01 +0200 (CEST)
Received: from localhost ([::1]:32854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMp4C-0005Cy-DX
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 06:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMp19-0003BN-Gr
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:04:51 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:51805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMp17-000536-KA
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:04:51 -0400
Received: by mail-wm1-x330.google.com with SMTP id n39so674991wms.1
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 03:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cqw+PDhQZErp3+fQqzqUUNWpchkBCBXTjyULhp9OL8A=;
 b=vm1c6MqpNXfRoz1nHbfGtwWWQL+FuBpkq91IjXoZ8vAxt7s9mgQU4e4J8jXfWwqEBS
 GFrzWUZPoIgZraokOtWkOiccuBJuyD6DGzDSiN45AnmzhgfsRnjlKvmVGaYnHkcVnI+3
 zND2BMHtTbks9u6lt671IB9r535kHSh7uXzs1Yzom/fEdJbtZexZtP7BcPphGQmfuAJG
 T0QR6/poJ4PNLNMluEMXE1UCmoe75zGNzUBu/Qa7E9YYyf50krPoJZjOM+JD2fl/eEy/
 iBywK/eu5x1r9MEISHl5qJ/akysMCUCUt8opjIruk7imhvXJo77RvapBqdqvSkph5UeK
 4d9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cqw+PDhQZErp3+fQqzqUUNWpchkBCBXTjyULhp9OL8A=;
 b=M6B/mz3ihXyLnia/ZNkD48y/f6uGsRXt7OkG8EaoTyuxdRNv2zYUQ5y27+PSECZKJb
 PvhwRtgY9ll+9IV2V5mp25v5JAK65F0K+pMwivg2Wj0LDijtQ+WUICcaBIZYk1Hgziro
 DAcdpA6AK9PyUYGKV+2wO6J+mHDKAtLctsyFgwtzGz2fw7lw7T9WfymFeNKBIAk9am4d
 ungIzu+KxM5BaE3wd73VqGJHP6h4fxKgWUSoIJCCPMVtaZkjvRNddoE6brcFAisIaCtv
 /AloFA8SWDuXW84nGkqrmWanH5t5+o/oD32iMuNlC+BpgWn9EJOvGgihqmNLrNbxHql/
 iq+A==
X-Gm-Message-State: AOAM531JHOvFVfLTR0L1Nsee4ymOzukNvFAjpvxZhK85DQ7OWiOWpb7Z
 5G2GXJDNxcxtS/XfZxCkOBkUHQ==
X-Google-Smtp-Source: ABdhPJzmW8DMKKpbF+h7QaipviGriYejkNmGv4xnRY10mK3vxfwPg33W/6VXeXgXvpJ1TAYkTmN9Uw==
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr1420515wmq.21.1630836287689; 
 Sun, 05 Sep 2021 03:04:47 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id m186sm4213081wme.48.2021.09.05.03.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 03:04:47 -0700 (PDT)
Subject: Re: [PATCH v4 17/21] LoongArch Linux User Emulation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-18-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4e47e1a7-d946-f8ec-a9a1-aadc6eeb7941@linaro.org>
Date: Sun, 5 Sep 2021 12:04:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630586467-22463-18-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 groug@kaod.org, maobibo@loongson.cn, mrolnik@gmail.com, shorne@gmail.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 2:41 PM, Song Gao wrote:
> +#include "qemu/osdep.h"
> +#include "qemu.h"
> +#include "qemu-common.h"
> +#include "cpu_loop-common.h"
> +#include "elf.h"
> +
> +void cpu_loop(CPULoongArchState *env)
> +{
> +    CPUState *cs = env_cpu(env);
> +    target_siginfo_t info;
> +    int trapnr;
> +    abi_long ret;
> +
> +    for (;;) {
> +        cpu_exec_start(cs);
> +        trapnr = cpu_exec(cs);
> +        cpu_exec_end(cs);
> +        process_queued_cpu_work(cs);
> +
> +        switch (trapnr) {
> +        case EXCP_INTERRUPT:
> +            /* just indicate that signals should be handled asap */
> +            break;
> +        case EXCP_SYSCALL:
> +            env->pc += 4;
> +            ret = do_syscall(env, env->gpr[11],
> +                             env->gpr[4], env->gpr[5],
> +                             env->gpr[6], env->gpr[7],
> +                             env->gpr[8], env->gpr[9],
> +                             -1, -1);
> +            if (ret == -TARGET_ERESTARTSYS) {
> +                env->pc -= 4;
> +                break;
> +            }
> +            if (ret == -TARGET_QEMU_ESIGRETURN) {
> +                /*
> +                 * Returning from a successful sigreturn syscall.
> +                 * Avoid clobbering register state.
> +                 */
> +                break;
> +            }
> +            env->gpr[4] = ret;
> +            break;
> +        case EXCP_ADE:
> +            info.si_signo = TARGET_SIGSEGV;
> +            info.si_errno = 0;
> +            info.si_code = TARGET_SEGV_MAPERR;
> +            info._sifields._sigfault._addr = env->badaddr;
> +            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> +            break;
> +        case EXCP_INE:
> +            info.si_signo = TARGET_SIGILL;
> +            info.si_errno = 0;
> +            info.si_code = 0;
> +            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);

Missing _addr = pc.

> +            break;
> +        case EXCP_FPE:
> +            info.si_signo = TARGET_SIGFPE;
> +            info.si_errno = 0;
> +            info.si_code = TARGET_FPE_FLTUNK;
> +            if (GET_FP_CAUSE(env->fcsr0) & FP_INVALID) {
> +                info.si_code = TARGET_FPE_FLTINV;
> +            } else if (GET_FP_CAUSE(env->fcsr0) & FP_DIV0) {
> +                info.si_code = TARGET_FPE_FLTDIV;
> +            } else if (GET_FP_CAUSE(env->fcsr0) & FP_OVERFLOW) {
> +                info.si_code = TARGET_FPE_FLTOVF;
> +            } else if (GET_FP_CAUSE(env->fcsr0) & FP_UNDERFLOW) {
> +                info.si_code = TARGET_FPE_FLTUND;
> +            } else if (GET_FP_CAUSE(env->fcsr0) & FP_INEXACT) {
> +                info.si_code = TARGET_FPE_FLTRES;
> +            }
> +            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);

Likewise.

> +        case EXCP_BREAK:
> +            info.si_signo = TARGET_SIGTRAP;
> +            info.si_code = TARGET_TRAP_BRKPT;
> +            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);

Likewise.

Note that there are a set of patches on list that introduce a force_sig_fault(signo, code, 
addr) function, so that none of these parameters get missed.

Missing an entry for EXCP_DEBUG, which should share code with EXCP_BREAK.

> +struct sigframe {
> +    uint32_t sf_ass[4];             /* argument save space for o32 */

Surely there is no "o32" for loongarch?

> +    uint32_t sf_code[2];            /* signal trampoline */

Note that there are patches on-list for moving the signal trampoline off of the stack.

> diff --git a/linux-user/loongarch64/termbits.h b/linux-user/loongarch64/termbits.h
> new file mode 100644
> index 0000000..33e74ed
> --- /dev/null
> +++ b/linux-user/loongarch64/termbits.h
> @@ -0,0 +1,229 @@
> +#ifndef LINUX_USER_LOONGARCH_TERMBITS_H
> +#define LINUX_USER_LOONGARCH_TERMBITS_H
> +
> +#define TARGET_NCCS 19

Surely you should be using generic/termbits.h?

We will prefer not to merge a linux-user port that is not upstream, because the ABI may 
change in between.  Can you provide a pointer to your kernel port in the meantime?


r~

