Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A2F4A63CE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 19:28:13 +0100 (CET)
Received: from localhost ([::1]:53690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nExsy-0007QT-Fr
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 13:28:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEvxT-0002aS-Rr
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:24:44 -0500
Received: from mx2.freebsd.org ([96.47.72.81]:37653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEvxS-00075Q-5E
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:24:43 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 966EE7BF08
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:24:40 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Jp9Hr3K0Nz4ZG7
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:24:40 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1643732680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FJ6bBlGz7zDSpWToQYvoHZ/hjJSENjm3ANKW9boDbok=;
 b=nAzUhOHlN1ScrRL7vmtKa/du0fa1+MqTCn8agV45uzKXfq6SyOlW5HLh3herQcvltDcrzR
 Ho0Dxwty0pSF25qMpdb3pCBSBuR3k3rfY9ZFZN/L+En9woSm7iOztkWLFPyfNBPqXT4Xym
 ayW8kl2d8ob8GXxlCDsNvg4RkeDaEp4/FtrIJSa5uYYfX/hevWlnsWT7Jc3n80pNDLoctp
 lR1XBqPQpzqr03xHleYSyHtsgPOKYmn4k9Gs9shHyPurGxALWqlBvpPVNNF//mwamaQ88g
 zLS8ahdHVXSY8Pzyz61UsEcNakFXlHyEp96Y1l7vIlchhyznyrpETQGHTSWZMw==
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 4DA732E746
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:24:40 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f172.google.com with SMTP id 71so15571426qkf.4
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:24:40 -0800 (PST)
X-Gm-Message-State: AOAM531TVt0wpE5R5Ycqy/zTlJjcrC0f+EUlsTzMbN01IqFq3ycxLIbo
 4HqP1Shly5BdiTOWoTH07Mh0Xhh4BdSblV2FCZI=
X-Google-Smtp-Source: ABdhPJwnDK+QyY3fVaHFxyN9rRfsr5LagRmXv55Ofd8ZD0C2HflZGMqNVWazXf3cre5ni49L4l9og0SfuzMZsSCcsZ0=
X-Received: by 2002:a05:620a:1997:: with SMTP id
 bm23mr17306936qkb.488.1643732679572; 
 Tue, 01 Feb 2022 08:24:39 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-5-imp@bsdimp.com>
In-Reply-To: <20220201111455.52511-5-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 1 Feb 2022 10:24:28 -0600
X-Gmail-Original-Message-ID: <CACNAnaHnmAM540NxaejZyK0cJ=gpvaBZL9JbFQOvJy23y0=UMQ@mail.gmail.com>
Message-ID: <CACNAnaHnmAM540NxaejZyK0cJ=gpvaBZL9JbFQOvJy23y0=UMQ@mail.gmail.com>
Subject: Re: [PATCH 04/22] bsd-user/i386/target_arch_cpu.h: Remove openbsd
 syscall
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1643732680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FJ6bBlGz7zDSpWToQYvoHZ/hjJSENjm3ANKW9boDbok=;
 b=q3GyXMOXqND93I7oyXxeNxteuvlnabDrFNyF3qrpk5Fy5DrVmichzYQPObZ5ayvPF1J307
 T9sfOZAlsRWyI4SzHX+Jj9uIKKJTTxyvKvCUMmZcJOulH0dcMV1DYvT9hDZGfdlfysBrzj
 i/hBSYx0O3hbvVXHdXMHn+EpOJRIBmxmqE2yGph9vj5/3OOQrZpCrLzLimFDAvFyfEwugH
 HhbYd+mw+KG8uD0BB/ZBoHW75WyI0S85QTemaxksyDy8IKpX2bSV9Xc+3B1LEamAgmy8IX
 ALNTQUe60V0jXZBZu3Dq7ysgN7Pap46quedNwFqpaHuvmwA9jJPLLfDiOumDDg==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1643732680; a=rsa-sha256; cv=none;
 b=ktLPgcZHoNSnck4Z91cX+zQwygSJ3snrpbGHJFdhi52s/RzafUQLW+Uespv/yXNksRyVnH
 hXnI6HgE68S7PnU7KS5yjsvofc/zWY5c7anHMviDvXbs4rIJDxvnmEpbe2cpskxWwgcguS
 /DiujSmoA+6mZ1NLZtpMOOue2YfGzsJyXWL2cbKkAKTnlhB01mBbnmpqIr0eXIifJW9Umq
 qiQT6YL2zOaoGrUrMS1ewVMfwOPhwMt62R3ga3Jv5R7OXGHhAXW1vbuLd+uOfcI3VTkZlm
 3CLf+cpX9mYn5Yq9HSlENXbxeS1RzMQYdNLruGDkgzXnpKx+pSKWpjVCJzk6Rw==
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
> This doesn't build on openbsd at the moment, and this could
> should arguably be in bsd-user/*bsd/i386 somewhere. Until

could or should, let's pick one and drop the other. :-)

> we refactor to support OpenBSD/NetBSD again, drop it here.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/i386/target_arch_cpu.h | 84 +++++++++++++++------------------
>  1 file changed, 37 insertions(+), 47 deletions(-)
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

> diff --git a/bsd-user/i386/target_arch_cpu.h b/bsd-user/i386/target_arch_cpu.h
> index 3cbf69d8af2..9da22202d48 100644
> --- a/bsd-user/i386/target_arch_cpu.h
> +++ b/bsd-user/i386/target_arch_cpu.h
> @@ -116,55 +116,45 @@ static inline void target_cpu_loop(CPUX86State *env)
>          process_queued_cpu_work(cs);
>
>          switch (trapnr) {
> -        case 0x80:
> +        case 0x80: {
>              /* syscall from int $0x80 */
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
> +            abi_ulong params = (abi_ulong) env->regs[R_ESP] +
> +                sizeof(int32_t);
> +            int32_t syscall_nr = env->regs[R_EAX];
> +            int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
> +
> +            if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
> +                get_user_s32(syscall_nr, params);
>                  params += sizeof(int32_t);
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
> +            } else if (syscall_nr == TARGET_FREEBSD_NR___syscall) {
> +                get_user_s32(syscall_nr, params);
> +                params += sizeof(int64_t);
> +            }
> +            get_user_s32(arg1, params);
> +            params += sizeof(int32_t);
> +            get_user_s32(arg2, params);
> +            params += sizeof(int32_t);
> +            get_user_s32(arg3, params);
> +            params += sizeof(int32_t);
> +            get_user_s32(arg4, params);
> +            params += sizeof(int32_t);
> +            get_user_s32(arg5, params);
> +            params += sizeof(int32_t);
> +            get_user_s32(arg6, params);
> +            params += sizeof(int32_t);
> +            get_user_s32(arg7, params);
> +            params += sizeof(int32_t);
> +            get_user_s32(arg8, params);
> +            env->regs[R_EAX] = do_freebsd_syscall(env,
> +                                                  syscall_nr,
> +                                                  arg1,
> +                                                  arg2,
> +                                                  arg3,
> +                                                  arg4,
> +                                                  arg5,
> +                                                  arg6,
> +                                                  arg7,
> +                                                  arg8);
>              }
>              if (((abi_ulong)env->regs[R_EAX]) >= (abi_ulong)(-515)) {
>                  env->regs[R_EAX] = -env->regs[R_EAX];
> --
> 2.33.1
>

