Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7254A6A69
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 04:04:20 +0100 (CET)
Received: from localhost ([::1]:35382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF5wR-0000hk-BC
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 22:04:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0kH-0001Hf-0g
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:31:25 -0500
Received: from [2607:f8b0:4864:20::42c] (port=33456
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0kD-0003oX-D7
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:31:24 -0500
Received: by mail-pf1-x42c.google.com with SMTP id i186so14561499pfe.0
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 13:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=y3yNP3yvR2r5aTOtr2bjL2dtTO8d3WOz2BhY4hHb27E=;
 b=LUtl8IyaSubwStEvIV8onfIu4NwwrLvFAaRhgZbgs59WnxZzYW3EBXE0fgsyp70z0Q
 MzvLLyWvbhpW2AGQXNIkcXPFE+foAoxo4VPAGBcwVoTOD3wNjvFiZ9EhIkkdJob0I1K6
 SqDHeQWWQ5byA2c6FpEzVxqwnbUULewaqPpwAJGzF9qY/kfrr6/0j9hHHr7lfoleMhbl
 5DWaIK0+kLkbpdbyHmh97xL6yogoLBWeEtIy218ULNONOokmZYvpZmpocCykWyhWL7jK
 EanhGH9Xho3uMhHyBkQCrLwI5fe/WHCKPc9KyizQvacrTDjK7L23BfdGgSQoZJ45IygP
 rZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y3yNP3yvR2r5aTOtr2bjL2dtTO8d3WOz2BhY4hHb27E=;
 b=rOicOYC93yZheC8zbKGbnCZceGrwmkSJfIOPYq+jx9eV4+0b8nS0zTfkg7U9YXzgSJ
 vJni33RrKDJrwSgbNfvNWsR5ake60zaTZTc+Nr0cc33hhJ1L5/fp/qes6kyYfrtfEF+Q
 HwFZwOVlhElIIg2RNpKqsTp535ndrN2pA6zcLVngRY6vK6517G4D9FHATahYrpUBWwpg
 bpNVUsJIhQ6VNodCYdmSlp7bUDR6C9t9dR5sROFESCTFC66Gm4FDpiqK7hU2sojQ70zH
 sTAGHE6gQJxJ9BiEvexWICbJjv8yIzwIVkFzhcY4yn+93swxxdgQt/udFvpspwl1S4J0
 P5qg==
X-Gm-Message-State: AOAM5302niIn5mHRQ+bMTyXZTKjC+jkjsRY9cMPLDUAIzDgLc5BrPWlZ
 VJMkaq0B+3C+MyMV+2RmL5rb5A==
X-Google-Smtp-Source: ABdhPJxTiLBR2K2vMnOdxzK5Th8ur5lVV4oOZa9D1Zypj8LRh7qWylJJE47WvNwhrQnedQk8r80+XA==
X-Received: by 2002:a05:6a00:170d:: with SMTP id
 h13mr27238041pfc.39.1643751077720; 
 Tue, 01 Feb 2022 13:31:17 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:4f14:faaf:dae:66e4?
 ([2001:8003:3a49:fd00:4f14:faaf:dae:66e4])
 by smtp.gmail.com with ESMTPSA id j4sm23236591pfc.217.2022.02.01.13.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 13:31:17 -0800 (PST)
Message-ID: <7da40d0d-24cf-e39d-a2a7-d2efdafd0a5a@linaro.org>
Date: Wed, 2 Feb 2022 08:31:11 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 16/22] bsd-user/freebsd/os-syscall.c: Tracing and error
 boilerplate
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-17-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-17-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Kyle Evans <kevans@freebsd.org>, def@FreeBSD.org, jrtc27@FreeBSD.org,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 22:14, Warner Losh wrote:
> Add in the tracing and this system call not implemented boilerplate.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-syscall.c | 27 ++++++++++++++++++++++++++-
>   1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
> index d49945f0fcc..fcfa6221182 100644
> --- a/bsd-user/freebsd/os-syscall.c
> +++ b/bsd-user/freebsd/os-syscall.c
> @@ -200,7 +200,32 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
>                               abi_long arg5, abi_long arg6, abi_long arg7,
>                               abi_long arg8)
>   {
> -    return 0;
> +    CPUState *cpu = env_cpu(cpu_env);
> +    abi_long ret;
> +
> +#ifdef DEBUG
> +    gemu_log("freebsd syscall %d\n", num);
> +#endif
> +    trace_guest_user_syscall(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
> +    if (do_strace) {
> +        print_freebsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
> +    }
> +
> +    switch (num) {
> +    default:
> +        gemu_log("qemu: unsupported syscall: %d\n", num);
> +        ret = -TARGET_ENOSYS;
> +        break;
> +    }
> +
> +#ifdef DEBUG
> +    gemu_log(" = %ld\n", ret);
> +#endif
> +    if (do_strace) {
> +        print_freebsd_syscall_ret(num, ret);
> +    }
> +    trace_guest_user_syscall_ret(cpu, num, ret);
> +    return ret;
>   }

I think it's simpler to put the logging in a wrapper function, so that one can return from 
the switch rather than be required to break.


r~

