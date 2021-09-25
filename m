Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C7741811E
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 12:49:58 +0200 (CEST)
Received: from localhost ([::1]:47558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU5Fl-0007mv-GU
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 06:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU5C7-0004hp-Sy
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:46:12 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU5C6-0003vI-Cj
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:46:11 -0400
Received: by mail-wr1-x434.google.com with SMTP id t28so21774206wra.7
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 03:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=elHxdEhbpYEJnOqVH8NRDQ9fAi7vccMh49KFMt41Zr8=;
 b=LhsArdXlZP06LgRSjp1Nkpt2x42rcceERcQ/GeKc/H33/1OBdzEZP6A5Enz66ZcDAD
 urBzb8O2gGJifTXmnunMcmap7TB8KtSLjaRumoQiL/LPxaIGHH2c6UgDgz139+mYpsu1
 nnWQ9MWmbJ+mdCr/BXtti1yuTbchw5z40/5p0/5KZ86JD0GO3mZbBCxJ/JGa5ns51qXN
 z9xzobjFmFFawd7iZNm4Y5OfzLHfU2gUuk7mfBmOCJi4jMZn1AHAMKN6xGk57Xjf6Rl+
 aBbD5VIZppO1EaKR2xC+qgCTypB2zw/E9F506rbnNsIBt/a32Xrx3B5+0aIlAZmPfd2y
 LnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=elHxdEhbpYEJnOqVH8NRDQ9fAi7vccMh49KFMt41Zr8=;
 b=VNWrwZHv1JV8ywBWHlo/oX/x9Q1j8izzQCf/LqejGHHjxRdLb4iEDvD5nIjMxWDqbT
 Fv3F8uvXEfeJ415c1hMODcbIW0TOA+Xs+ce3r9UZLEeCmKkORy1dCdvPBiQBrofhY2dD
 o1fWa6IzI3zXAYE6NkatWOrd65V/Xf7joSf/Exu6DU40kKp4jCfo9igBiEFnzqAmvFBT
 7YLOMsRSNAgPV2b5s9U4kxiUGziHXLONoU0lUEsVBwRHzmVgug6os4YjmaeNsYlNMZ0L
 PG2MTRu82DZJsnJ/fXzcGFeAJe5o1c2ZG1Pvh0XIpWV5zvvrhDE6Q22gZGgd7DMZdNvZ
 KKoQ==
X-Gm-Message-State: AOAM533URCrgpvbso386zl7i+eepOoMWRC65wI9VOCX7N5JLpcbrnsuH
 ZqH6P3QlyoMxtGqUoyovUNQ=
X-Google-Smtp-Source: ABdhPJwEmHNBI39y8CpJAIq4/CMK0O/+8LoaNZdfGrAcGGpgCMic3bbCX4yeOaqZiAu4cuy7XNFIdg==
X-Received: by 2002:adf:d1eb:: with SMTP id g11mr16703305wrd.194.1632566768753; 
 Sat, 25 Sep 2021 03:46:08 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id o17sm7378189wrs.25.2021.09.25.03.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 03:46:08 -0700 (PDT)
Message-ID: <64e8f0f5-1239-fc04-1c58-189421212f2c@amsat.org>
Date: Sat, 25 Sep 2021 12:46:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 12/14] bsd-user/sysarch: Provide a per-arch framework for
 sysarch syscall
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-13-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210922061438.27645-13-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Warner,

On 9/22/21 08:14, Warner Losh wrote:
> Add the missing glue to pull in do_freebsd_sysarch to call
> do_freebsd_arch_sysarch. Put it in os-sys.c, which will be used for
> sysctl and sysarch system calls because they are mostly arch specific.
> 
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/freebsd/meson.build |  3 +++
>   bsd-user/freebsd/os-sys.c    | 28 ++++++++++++++++++++++++++++
>   bsd-user/meson.build         |  6 ++++++
>   bsd-user/qemu.h              |  3 +++
>   bsd-user/syscall.c           |  7 -------
>   5 files changed, 40 insertions(+), 7 deletions(-)
>   create mode 100644 bsd-user/freebsd/meson.build
>   create mode 100644 bsd-user/freebsd/os-sys.c

> +/* sysarch() is architecture dependent. */
> +abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2)
> +{
> +
> +    return do_freebsd_arch_sysarch(cpu_env, arg1, arg2);
> +}
> diff --git a/bsd-user/meson.build b/bsd-user/meson.build
> index 0369549340..561913de05 100644
> --- a/bsd-user/meson.build
> +++ b/bsd-user/meson.build
> @@ -8,3 +8,9 @@ bsd_user_ss.add(files(
>     'syscall.c',
>     'uaccess.c',
>   ))
> +
> +# Pull in the OS-specific build glue, if any
> +if fs.exists(targetos)
> +   subdir(targetos)

I am a bit confused here, we have an optional implementation ...

> +endif
> +
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index 4ee57b91f0..3dde381d5d 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -239,6 +239,9 @@ extern unsigned long target_sgrowsiz;
>   abi_long get_errno(abi_long ret);
>   int is_error(abi_long ret);
>   
> +/* os-sys.c */
> +abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2);

... that is declared as non-optional.

In fact it is called by do_freebsd_syscall(), not restricted to TARGET_I386.

This shouldn't be (meson) optional IMO.

> +
>   /* user access */
>   
>   #define VERIFY_READ  PAGE_READ
> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
> index 9bc72501b2..9f51563abd 100644
> --- a/bsd-user/syscall.c
> +++ b/bsd-user/syscall.c
> @@ -88,13 +88,6 @@ static abi_long do_obreak(abi_ulong new_brk)
>       return 0;
>   }
>   
> -#if defined(TARGET_I386)
> -static abi_long do_freebsd_sysarch(CPUX86State *env, int op, abi_ulong parms)
> -{
> -    do_freebsd_arch_sysarch(env, op, parms);
> -}
> -#endif
> -
>   #ifdef __FreeBSD__
>   /*
>    * XXX this uses the undocumented oidfmt interface to find the kind of
> 

