Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0D44405E7
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:51:57 +0200 (CEST)
Received: from localhost ([::1]:49526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgbfA-0001kD-Qd
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgbT7-0008Uu-Py
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:39:34 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgbT6-0002e3-1v
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:39:29 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 j128-20020a1c2386000000b003301a98dd62so4513015wmj.5
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 16:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7RdWM0L1YV3H8jj/rzwzYUus+GijL4AFVwSXGBzynds=;
 b=M3xhQp5KPPZ5qDkase5qrQPFYSGjERMzFkGs3okVt9NVNrT8VafXNtZseHqs5zOp2C
 x6DIYGf2Nf+vsNQm3WzgHC8H+lgh/kdeX2sCVQLBLeCQwh2mIVyzPVmb5PQM1BLZSrEU
 OYADP0ygSTrqtKDNlwcj5SGQ7qSfZgTTsZIcmNyjCNa9adW2mEwEuv7oISZOimBaes5S
 uqwRKIBtyr6UJlAyXPxdRRPSzzFwzl4/++pax+pVnEmsLg8lyIq8qz3SsgCY4hQOQjXG
 ddKQgbwH5284sYBlC94/vFk81/GJaxTIJbnaFdcO7U5yuDz7h6l0Uj4ybgIb0NSwr9tt
 lstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7RdWM0L1YV3H8jj/rzwzYUus+GijL4AFVwSXGBzynds=;
 b=y3SQ/Pzvy/+sRafYy+5PFH5Cwda2It1yqJomw0hw8Ywk3rQ5DISq/AdDUqfl45E8Rx
 Rs97WryEIHs26aesynQGQiFyuHuaNwqLswTYEaHdRmv0EuOAJlI99FrTS10zVJDTZUTM
 kHNkNKw+oZpa+NdruQufjfIVOfc/ApXpB9poWBxVBe8Gjl29DI87Soszu/ZeYMxutkGf
 wceKYTMmxkHThkDb7LtPJCPmOiSx4JzUTSFZIEfITlLIHWBd1DgttnO7p/dM/WFRD9P7
 wQYiymNFJRLM8QW8BHySxafL7FMJvezjB3EedUCXdp9GE9vvnLWVtfC3owYXpga81eFT
 n3yg==
X-Gm-Message-State: AOAM5335Mg0fXXjqvVqUHmGjHF+iKlDEjJMSFoxJgraJ5xv54GSNW4mb
 Ha8CAkUKj71dywcvxRFHsgw=
X-Google-Smtp-Source: ABdhPJzB0qi2owqteqW6rJxFGFzTXpy5jVB69VnuswzPrcyNk74QCzgL+w4GLLoGpg4IhLF/zsaalw==
X-Received: by 2002:a1c:7fd0:: with SMTP id a199mr22889436wmd.96.1635550763704; 
 Fri, 29 Oct 2021 16:39:23 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f20sm7875588wmq.38.2021.10.29.16.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 16:39:23 -0700 (PDT)
Message-ID: <62425d7c-a974-ce4a-0503-b6ebb6993087@amsat.org>
Date: Sat, 30 Oct 2021 01:39:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 53/67] linux-user/hppa: Remove POWERPC_EXCP_ALIGN
 handling
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-54-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211015041053.2769193-54-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Typo s/hppa/ppc/ in subject.

On 10/15/21 06:10, Richard Henderson wrote:
> We will raise SIGBUS directly from cpu_loop_exit_sigbus.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/ppc/cpu_loop.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
> index 840b23736b..483e669300 100644
> --- a/linux-user/ppc/cpu_loop.c
> +++ b/linux-user/ppc/cpu_loop.c
> @@ -162,14 +162,6 @@ void cpu_loop(CPUPPCState *env)
>              cpu_abort(cs, "External interrupt while in user mode. "
>                        "Aborting\n");
>              break;
> -        case POWERPC_EXCP_ALIGN:    /* Alignment exception                   */
> -            /* XXX: check this */
> -            info.si_signo = TARGET_SIGBUS;
> -            info.si_errno = 0;
> -            info.si_code = TARGET_BUS_ADRALN;
> -            info._sifields._sigfault._addr = env->nip;
> -            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> -            break;
>          case POWERPC_EXCP_PROGRAM:  /* Program exception                     */
>          case POWERPC_EXCP_HV_EMU:   /* HV emulation                          */
>              /* XXX: check this */
> 


