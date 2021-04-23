Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D221F3695E0
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 17:14:06 +0200 (CEST)
Received: from localhost ([::1]:40970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZxVN-0000lQ-VQ
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 11:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZxUO-0000Iz-M9
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:13:04 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZxTy-0002Kv-Hs
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:13:04 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so1413798wmy.5
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 08:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=pzCA3TZvFAJA0YyPK7iJgSElokzTsFH/ErIDwBsgJPQ=;
 b=uvv8MJ6xbIwd0SQ4UkgeuwJs6RMV95FjqaBPbDFPoi89i+Hlyg7YC74UxiwNqvxqIV
 HO3uqqt22f5OUT2n63YezAVnR/C+KRrbUc0uMFnn/4MmA/XvZliIgeLhVDs4sq/sTafy
 g/KpjbG0MhNFVAyMpMoxlIt3u43RcLYh/oSbIx211iUuoGqmmMX1WcDsCR16tLNVGVY1
 FEUTPfl26SqsdPBbnv08Sme7gAT8+AWkcKpzpHIHEwUuzGqOiJgVdc39B4epOCcZ4L/v
 hmVes7jlNqklkOGQTZwj53QFn6R2J+/RPtO97yBWV7qSU9Hufe8sZ0/zwyNotj1LY53u
 8wKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=pzCA3TZvFAJA0YyPK7iJgSElokzTsFH/ErIDwBsgJPQ=;
 b=IVW6yxTuiCjhINmZpK3BjQbA3h0leIcsWX04OFncilIdPjS5Y39BIcWUssAL1xkfeo
 rBMOvXzu6CcDYJLlcgVkFtAoolFLw9vtklS6OCYT/Noeqs8HlrJKNqw1s8FX1zYFVtx4
 jNeKTR988fClivzQHgifbIaKGIrimED83Vp2Ql32jAssuKQrn8UE/IF5OKuLHcAhXa/e
 o7wdZj3Ble68qi/Kgu2t/quBxwQd9VCj8DKGqEVlLSuJYTtS8+m9BiQpEfhLph39A5Bq
 ckmooW2IIUD/IwjMA28iuPwv65Pp7zOB27j+xz6uEdHttz1fAEL90VySeuPSIoo52I5E
 VcPA==
X-Gm-Message-State: AOAM531QrtkPvAiEwPF/RD/aaaau5X165NLN16v++aptWCgBp2ww9iCG
 VPaEeze6XBQEn6uXO53wrqMzPw==
X-Google-Smtp-Source: ABdhPJxJvhrLTA7tJVMdeGJn6I8msEDxlsK6TsZTPsf7MQ4EBwboXhMvTCP5LPeaDTmYysrzap0dYg==
X-Received: by 2002:a05:600c:2d56:: with SMTP id
 a22mr4725959wmg.175.1619190757084; 
 Fri, 23 Apr 2021 08:12:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f11sm11068379wmc.6.2021.04.23.08.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 08:12:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8838C1FF7E;
 Fri, 23 Apr 2021 16:12:35 +0100 (BST)
References: <20210422230227.314751-1-richard.henderson@linaro.org>
 <20210422230227.314751-8-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 7/7] linux-user: Tidy TARGET_NR_rt_sigaction
Date: Fri, 23 Apr 2021 16:10:35 +0100
In-reply-to: <20210422230227.314751-8-richard.henderson@linaro.org>
Message-ID: <87fszh6nmk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Initialize variables instead of elses.
> Use an else instead of a goto.
> Add braces.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/syscall.c | 32 +++++++++++++-------------------
>  1 file changed, 13 insertions(+), 19 deletions(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 9bcd485423..c7c3257f40 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -9060,32 +9060,26 @@ static abi_long do_syscall1(void *cpu_env, int nu=
m, abi_long arg1,
>              target_ulong sigsetsize =3D arg4;
>              target_ulong restorer =3D 0;
>  #endif
> -            struct target_sigaction *act;
> -            struct target_sigaction *oact;
> +            struct target_sigaction *act =3D NULL;
> +            struct target_sigaction *oact =3D NULL;
>=20=20
>              if (sigsetsize !=3D sizeof(target_sigset_t)) {
>                  return -TARGET_EINVAL;
>              }
> -            if (arg2) {
> -                if (!lock_user_struct(VERIFY_READ, act, arg2, 1)) {
> -                    return -TARGET_EFAULT;
> -                }
> -            } else {
> -                act =3D NULL;
> +            if (arg2 && !lock_user_struct(VERIFY_READ, act, arg2, 1)) {
> +                return -TARGET_EFAULT;
>              }
> -            if (arg3) {
> -                if (!lock_user_struct(VERIFY_WRITE, oact, arg3, 0)) {
> -                    ret =3D -TARGET_EFAULT;
> -                    goto rt_sigaction_fail;
> +            if (arg3 && !lock_user_struct(VERIFY_WRITE, oact, arg3, 0)) {
> +                ret =3D -TARGET_EFAULT;
> +            } else {
> +                ret =3D get_errno(do_sigaction(arg1, act, oact, restorer=
));
> +                if (oact) {
> +                    unlock_user_struct(oact, arg3, 1);
>                  }

This does make me idly wonder if there is a way to handle unlocking in a
similar way to our autofree and LOCK_GUARD stuff. But that's not getting
in the way of approving of this improvement.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

