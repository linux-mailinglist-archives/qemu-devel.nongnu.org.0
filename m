Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B07C430E79
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 06:01:16 +0200 (CEST)
Received: from localhost ([::1]:34638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcJpq-0006jv-U3
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 00:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJRq-00076I-JL
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:36:26 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:34436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJRo-0003lD-Rt
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:36:26 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 10D789DEF5
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:36:24 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HXjGH6dnxz3Gqc
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:36:23 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id AD35DD323
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:36:23 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f175.google.com with SMTP id w2so14255218qtn.0
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 20:36:23 -0700 (PDT)
X-Gm-Message-State: AOAM533rC46tNiSsU/PLoNgs46kgJ4/qH89IYrbikK37eftOjtgL36uE
 aPDbJd+yvOLuqJ1dPX9WmRWYEntYXnN66pu3qaA=
X-Google-Smtp-Source: ABdhPJxj7X5hAeseuEwHt1RP4hlaiyedAPbtTJWVGGOapK/aKmfd3InCN4raJDSMKeUc93+aH/c8fhl9yCuxqLwejHA=
X-Received: by 2002:a05:622a:13:: with SMTP id
 x19mr27623951qtw.83.1634528183334; 
 Sun, 17 Oct 2021 20:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-13-imp@bsdimp.com>
In-Reply-To: <20211008231506.17471-13-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 17 Oct 2021 22:36:12 -0500
X-Gmail-Original-Message-ID: <CACNAnaE7=VLGKkTg5PaP0xU78Zc4ApTL4LSh6CHk14wcKEdD=w@mail.gmail.com>
Message-ID: <CACNAnaE7=VLGKkTg5PaP0xU78Zc4ApTL4LSh6CHk14wcKEdD=w@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] bsd-user/sysarch: Move to using
 do_freebsd_arch_sysarch interface
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 8, 2021 at 6:15 PM Warner Losh <imp@bsdimp.com> wrote:
>
> do_freebsd_arch_sysarch() exists in $ARCH/target_arch_sysarch.h for x86.
> Call it from do_freebsd_sysarch() and remove the mostly duplicate
> version in syscall.c. Future changes will move it to os-sys.c and
> support other architectures.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/syscall.c | 45 +--------------------------------------------
>  1 file changed, 1 insertion(+), 44 deletions(-)
>
> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
> index 2fd2ba8330..d3b9f431e2 100644
> --- a/bsd-user/syscall.c
> +++ b/bsd-user/syscall.c
> @@ -91,50 +91,7 @@ static abi_long do_obreak(abi_ulong new_brk)
>  #if defined(TARGET_I386)
>  static abi_long do_freebsd_sysarch(CPUX86State *env, int op, abi_ulong parms)
>  {
> -    abi_long ret = 0;
> -    abi_ulong val;
> -    int idx;
> -
> -    switch (op) {
> -#ifdef TARGET_ABI32
> -    case TARGET_FREEBSD_I386_SET_GSBASE:
> -    case TARGET_FREEBSD_I386_SET_FSBASE:
> -        if (op == TARGET_FREEBSD_I386_SET_GSBASE)
> -#else
> -    case TARGET_FREEBSD_AMD64_SET_GSBASE:
> -    case TARGET_FREEBSD_AMD64_SET_FSBASE:
> -        if (op == TARGET_FREEBSD_AMD64_SET_GSBASE)
> -#endif
> -            idx = R_GS;
> -        else
> -            idx = R_FS;
> -        if (get_user(val, parms, abi_ulong))
> -            return -TARGET_EFAULT;
> -        cpu_x86_load_seg(env, idx, 0);
> -        env->segs[idx].base = val;
> -        break;
> -#ifdef TARGET_ABI32
> -    case TARGET_FREEBSD_I386_GET_GSBASE:
> -    case TARGET_FREEBSD_I386_GET_FSBASE:
> -        if (op == TARGET_FREEBSD_I386_GET_GSBASE)
> -#else
> -    case TARGET_FREEBSD_AMD64_GET_GSBASE:
> -    case TARGET_FREEBSD_AMD64_GET_FSBASE:
> -        if (op == TARGET_FREEBSD_AMD64_GET_GSBASE)
> -#endif
> -            idx = R_GS;
> -        else
> -            idx = R_FS;
> -        val = env->segs[idx].base;
> -        if (put_user(val, parms, abi_ulong))
> -            return -TARGET_EFAULT;
> -        break;
> -    /* XXX handle the others... */
> -    default:
> -        ret = -TARGET_EINVAL;
> -        break;
> -    }
> -    return ret;
> +    do_freebsd_arch_sysarch(env, op, parms);
>  }
>  #endif
>
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

