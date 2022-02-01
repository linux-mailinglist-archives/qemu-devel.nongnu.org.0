Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38F14A6387
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 19:18:06 +0100 (CET)
Received: from localhost ([::1]:39638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nExjA-00013f-TQ
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 13:18:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEvsh-0007Nl-Le
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:19:59 -0500
Received: from mx2.freebsd.org ([96.47.72.81]:13468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEvsc-0006Ho-5y
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:19:44 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 9972379CFC
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:19:40 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Jp9B43RGdz4Wf5
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:19:40 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1643732380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lcxxs5NEyI8yByf3NZ5UcKKM8aQ+6Qdd2VHjsungyAc=;
 b=tQjPGqP8hlyJOrD+2DI6T/ncfV5QTJ1G3yoXmU67JENkAWapQIbKCL3I9ZuYUSzpuEANEA
 i2gWuTsE2wOjjjUhyQRXLL/Wd+OgmU22SRxG9CbsfE/Rtngbpy49SZq8Jl+dqcX01vU8V8
 tTmuA0z9ah1HgHQhYxbd3QDeInpHQ6bsjQLA6VmktvwVCeRKxaZa8Vw6Ep91Az07YxlPzi
 HSaV5ihgTaPoG0/0TT58oQojsdpmQn/XvlXU5BukqSigSgVnZvUSWrfAMiW/F0Uef40iKi
 pqIWXFcc0fX+Ao37CJX85WoggEiR6bOTCPXXK1sAruT+lp8dsjz/1RT+4qdPoQ==
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 56DD02E740
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:19:40 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f180.google.com with SMTP id x5so1749535qtw.10
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:19:40 -0800 (PST)
X-Gm-Message-State: AOAM530ScE5xp8WdmNzuzhLFFyOm6GEietwQHbnc6eVGB10lVRM7id9x
 p3i4/oYUzq2rmn0B5T86XbwudrYrfPnDCTRUQpE=
X-Google-Smtp-Source: ABdhPJwzWbkhuH6/RWgQJeQWF23zbQbZnFFiFhh4M9VuR+/pV2lGYkB0ZtyN5+nem53U60vTWLrj/c+7WgtXN6BJm2A=
X-Received: by 2002:a05:622a:ca:: with SMTP id
 p10mr14524039qtw.123.1643732379928; 
 Tue, 01 Feb 2022 08:19:39 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-3-imp@bsdimp.com>
In-Reply-To: <20220201111455.52511-3-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 1 Feb 2022 10:19:28 -0600
X-Gmail-Original-Message-ID: <CACNAnaHqqBArT0ZN4gC+q1EnKaoY8nROCMxD04EC0Awva1y_jQ@mail.gmail.com>
Message-ID: <CACNAnaHqqBArT0ZN4gC+q1EnKaoY8nROCMxD04EC0Awva1y_jQ@mail.gmail.com>
Subject: Re: [PATCH 02/22] bsd-user/x86_64/target_arch_cpu.h: int $80 never
 was a BSD system call on amd64
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1643732380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lcxxs5NEyI8yByf3NZ5UcKKM8aQ+6Qdd2VHjsungyAc=;
 b=RfxFJ9JJ3ZBXVRcjspCscADF26gwjZGrm+d2TWO4LlDyL51Jn5oTf7WqAB8iuPtYHQS69T
 gBbUA3tTHn3x20IZpior/XEqSMxeV5dwhK+RVzyxaYILuboGNkBw+XSJTrAvdgQRJJcU7V
 F1FsW4puwV4MToHTfwOXQ3Tz8ELxoENc28ZR26NohYNPPEHwdggyR2u5i8U8YibVJctNNg
 snVkXwa1z7TeQLK1y67QD13ANORrUU3r1FS9rey8OmCM/Dl/E7dKhJ4GPIzetsmwGGdwrC
 6beW/V5tiDcm8if2GwONFN2DVE7bcUJrV+3Z4kkrowgJVmFyZpIO+NuHoqMWGQ==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1643732380; a=rsa-sha256; cv=none;
 b=LGtwfis0d8yTqjc/9DywoQF35lKlpj992PB6QzXDZcKVDPtfyU0C9ZwmT7cQ+s0VOecXoP
 yDz4Q6AVQ7woEex+GgG78D1qClOtgJh+rDAMRi/NCQutwjNamomXay8+/0EKe7y0U7oqZt
 a/neZw6scUcFY+C+c32xyc1tNE0qION4aRo7dnO+2dcJsLhhvnyThwtkcHx327A9n7tbka
 P1C6Wr8ml8Nb+jPwKEe9NCSNEAA3M/g85G7Y4FaLw6OKf04R4Mcwqyq8Q+N2BHavYsx7Qo
 SEjAoKsX/c3Jj6Z9ocz1GhJ+EOsPu9EPj2yh4bQP517wL00WQ1646ljCmq6ZAA==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, def@freebsd.org,
 Jessica Clarke <jrtc27@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 1, 2022 at 5:14 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Although initial versions of NetBSD did use int $80, it was replaced by
> syscall before any releases. OpenBSD and FreeBSD always did syscall.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/x86_64/target_arch_cpu.h | 58 -------------------------------
>  1 file changed, 58 deletions(-)
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

> diff --git a/bsd-user/x86_64/target_arch_cpu.h b/bsd-user/x86_64/target_arch_cpu.h
> index 0a9c0f08946..9dc52d5afc4 100644
> --- a/bsd-user/x86_64/target_arch_cpu.h
> +++ b/bsd-user/x86_64/target_arch_cpu.h
> @@ -124,64 +124,6 @@ static inline void target_cpu_loop(CPUX86State *env)
>          process_queued_cpu_work(cs);
>
>          switch (trapnr) {
> -        case 0x80:
> -            /* syscall from int $0x80 */
> -            if (bsd_type == target_freebsd) {
> -                abi_ulong params = (abi_ulong) env->regs[R_ESP] +
> -                    sizeof(int32_t);
> -                int32_t syscall_nr = env->regs[R_EAX];
> -                int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
> -
> -                if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
> -                    get_user_s32(syscall_nr, params);
> -                    params += sizeof(int32_t);
> -                } else if (syscall_nr == TARGET_FREEBSD_NR___syscall) {
> -                    get_user_s32(syscall_nr, params);
> -                    params += sizeof(int64_t);
> -                }
> -                get_user_s32(arg1, params);
> -                params += sizeof(int32_t);
> -                get_user_s32(arg2, params);
> -                params += sizeof(int32_t);
> -                get_user_s32(arg3, params);
> -                params += sizeof(int32_t);
> -                get_user_s32(arg4, params);
> -                params += sizeof(int32_t);
> -                get_user_s32(arg5, params);
> -                params += sizeof(int32_t);
> -                get_user_s32(arg6, params);
> -                params += sizeof(int32_t);
> -                get_user_s32(arg7, params);
> -                params += sizeof(int32_t);
> -                get_user_s32(arg8, params);
> -                env->regs[R_EAX] = do_freebsd_syscall(env,
> -                                                      syscall_nr,
> -                                                      arg1,
> -                                                      arg2,
> -                                                      arg3,
> -                                                      arg4,
> -                                                      arg5,
> -                                                      arg6,
> -                                                      arg7,
> -                                                      arg8);
> -            } else { /* if (bsd_type == target_openbsd) */
> -                env->regs[R_EAX] = do_openbsd_syscall(env,
> -                                                      env->regs[R_EAX],
> -                                                      env->regs[R_EBX],
> -                                                      env->regs[R_ECX],
> -                                                      env->regs[R_EDX],
> -                                                      env->regs[R_ESI],
> -                                                      env->regs[R_EDI],
> -                                                      env->regs[R_EBP]);
> -            }
> -            if (((abi_ulong)env->regs[R_EAX]) >= (abi_ulong)(-515)) {
> -                env->regs[R_EAX] = -env->regs[R_EAX];
> -                env->eflags |= CC_C;
> -            } else {
> -                env->eflags &= ~CC_C;
> -            }
> -            break;
> -
>          case EXCP_SYSCALL:
>              /* syscall from syscall instruction */
>              if (bsd_type == target_freebsd) {
> --
> 2.33.1
>

