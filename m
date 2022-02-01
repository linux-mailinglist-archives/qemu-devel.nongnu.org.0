Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028084A6412
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 19:38:00 +0100 (CET)
Received: from localhost ([::1]:41412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEy2Q-00041v-Gh
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 13:37:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEvvr-0001HO-Bd
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:23:03 -0500
Received: from mx2.freebsd.org ([96.47.72.81]:36153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEvvp-0006yv-PP
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:23:03 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 35F707BB6C
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:22:59 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Jp9Fv0Ym4z4Z8j
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:22:59 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1643732579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/elOi+2nW3AOCBmSOKqAftL7oGlaCQ+Z8eGeWVBxbkE=;
 b=ScNz3oc46VL7C+5konLJWQCdyieqqdkAp1F5I9CDeX5QweCns3ILAw49z7iSwwzo32FE1q
 uNvRdn4w3leP36l2c/JH17MsYkh62fBcWoPqvX1l1FkZCMUwpxIhdbr3/7ZCmHlpMTBJuf
 IlRJhS3wRRCwMveDILg+otcd1m0ZYL2ogL3lAEzKvubNIPmXnacmM8twONfEfAnNZCDX6+
 7B4/0bjqjT7iIgDmaalnnq9A2+HbOS05cQgEqhW0IkbttuiYX/e+fnJ9vV+zbvl42CIXb9
 BN40lTAFWgkBXI7tYGyOK67p75//d9DgJjn0Bmu8/KhOWvAd5ayRAjsGmIiiqA==
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id E12C62EEDD
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:22:58 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f41.google.com with SMTP id k9so16423845qvv.9
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:22:58 -0800 (PST)
X-Gm-Message-State: AOAM532fAsEZ97Kp9setQpmU/IaWqBB7gPOk4f929ZvNqFg69UNN+0tX
 BbLmrYIFKxECqhdkgAhKmaYBP78Uzx95poOyc3g=
X-Google-Smtp-Source: ABdhPJybUlnDQUBr0yZ6is2nEQDtgpVdl7ElnfgPKpk3wxHQPtzAC8lNW56c81jIxoqCcGtwXz5k0dQTZcfn9miqbRA=
X-Received: by 2002:a05:6214:226c:: with SMTP id
 gs12mr23426828qvb.33.1643732578027; 
 Tue, 01 Feb 2022 08:22:58 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-4-imp@bsdimp.com>
In-Reply-To: <20220201111455.52511-4-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 1 Feb 2022 10:22:46 -0600
X-Gmail-Original-Message-ID: <CACNAnaF_-sicXeHC_+wU9AQ0u8NUq17HJXt2GvPcxZo2NC-4sg@mail.gmail.com>
Message-ID: <CACNAnaF_-sicXeHC_+wU9AQ0u8NUq17HJXt2GvPcxZo2NC-4sg@mail.gmail.com>
Subject: Re: [PATCH 03/22] bsd-user/x86_64/target_arch_cpu.h: Remove openbsd
 syscall
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1643732579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/elOi+2nW3AOCBmSOKqAftL7oGlaCQ+Z8eGeWVBxbkE=;
 b=s3kxXh3JeIjRdBhaEtIL44ODCNWdP+BIKCCGF2Tw+ipGvaQPVM2yff37WjG2UYwMs/6NUt
 DDz17CdbjaarSceXDZJL4ZQhSWz15G5PeuTjcDS88jii4jSMK/uT5btUV8vJdv/UrMfbdr
 mWPSl5kHig6YbAV4L4/SRDpPTRhD6BDkxk1DbweElU5ipQE98x+v6Cu0evvI3FdwKNSZs4
 9nnU9q5FfGM7A81Z5Bq9OcZUl1ExD0178KIEow9NgRsP2C3REmMuif2WmVuPfohQ7gegh9
 jaKR+h61SQzUnwsjp9lnFNj4SsounqZoD8LyGrOqxIztFNOqiEpBgAv4dkVlfw==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1643732579; a=rsa-sha256; cv=none;
 b=s+N6cYAYTcAhr2uqX+XEZTjT1Ca1dOKKlB26M8ctqvLG8+rfAwPsZGF6pLvIjt/M6cXsNx
 WT5ju8gr40QwDRoo8Egac0lbvppCQbUuJLOb6UzSsWW4V3vd8rbcGWmTqCUPC/WIiw67Hu
 7QiDtBW7KKGdCHwX75wQ4QTay+e+KGzr8drTGPly1YBPozzDAtr0Z5Bh1Ly2/zKsxtM0DK
 sJ27/iksGsZkkyxn7lP1PAYcFzqotYuyixMz+NGbYU5UJMprNZH0/TRdPXy1RoOW8BQXl2
 VjV9HXwIewLVvImNUFK9EyVfTQVjibsiT6qlOx0gTh4+QbB9ob/CDMvNKLg+pw==
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
> should arguably be in bsd-user/*bsd/x86_64 somewhere. Until
> we refactor to support OpenBSD/NetBSD again, drop it here.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/x86_64/target_arch_cpu.h | 27 ++++++++-------------------
>  1 file changed, 8 insertions(+), 19 deletions(-)
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

As a general comment, I'd like to reach out to the others at some
point and gauge interest/ability to participate, but I definitely
agree that it would be better to drop !FreeBSD for now to simplify
upcoming improvements to the common core. I'm not aware of any other
forks that have tried to maintain bsd-user on their platforms.

> diff --git a/bsd-user/x86_64/target_arch_cpu.h b/bsd-user/x86_64/target_arch_cpu.h
> index 9dc52d5afc4..5be2f02416e 100644
> --- a/bsd-user/x86_64/target_arch_cpu.h
> +++ b/bsd-user/x86_64/target_arch_cpu.h
> @@ -126,25 +126,14 @@ static inline void target_cpu_loop(CPUX86State *env)
>          switch (trapnr) {
>          case EXCP_SYSCALL:
>              /* syscall from syscall instruction */
> -            if (bsd_type == target_freebsd) {
> -                env->regs[R_EAX] = do_freebsd_syscall(env,
> -                                                      env->regs[R_EAX],
> -                                                      env->regs[R_EDI],
> -                                                      env->regs[R_ESI],
> -                                                      env->regs[R_EDX],
> -                                                      env->regs[R_ECX],
> -                                                      env->regs[8],
> -                                                      env->regs[9], 0, 0);
> -            } else { /* if (bsd_type == target_openbsd) */
> -                env->regs[R_EAX] = do_openbsd_syscall(env,
> -                                                      env->regs[R_EAX],
> -                                                      env->regs[R_EDI],
> -                                                      env->regs[R_ESI],
> -                                                      env->regs[R_EDX],
> -                                                      env->regs[10],
> -                                                      env->regs[8],
> -                                                      env->regs[9]);
> -            }
> +            env->regs[R_EAX] = do_freebsd_syscall(env,
> +                                                  env->regs[R_EAX],
> +                                                  env->regs[R_EDI],
> +                                                  env->regs[R_ESI],
> +                                                  env->regs[R_EDX],
> +                                                  env->regs[R_ECX],
> +                                                  env->regs[8],
> +                                                  env->regs[9], 0, 0);
>              env->eip = env->exception_next_eip;
>              if (((abi_ulong)env->regs[R_EAX]) >= (abi_ulong)(-515)) {
>                  env->regs[R_EAX] = -env->regs[R_EAX];
> --
> 2.33.1
>

