Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02546A12B5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 23:18:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJuN-0003xV-UF; Thu, 23 Feb 2023 17:17:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJuI-0003x9-MY
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:17:43 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJuG-0006kd-NK
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:17:42 -0500
Received: by mail-wr1-x42c.google.com with SMTP id i11so5946508wrp.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 14:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=69woklkbLBgL8Impvv5OK+7Hh8oZq0AX3Ip6Cooiy80=;
 b=sMgA5FM8hAvDPmodr16VNUooz2kJjva5Y6xCJDVoIu291h9YdSdh9qsLGjzcaTetdO
 EAP9D8SbYQc7g3XuI2bzVRHiIpnO1QoE5TaOF8vKHmP8ExNlexpo7hllAuNBJ4Cg1jn8
 Oj9SLBJ2mhlB4eDjuKcirbNBQym1gHdiY9U5oZSua0hUBJyPymNaJfTtHWISAdUUTNzJ
 d/gv0CfUjVsPdRl6jmDP1R0sqT5QVgsr3TT2RYh4fF25KQMtKgFt2LW2eR1G283ElnE7
 +iBZV1/32ErWAQjbOxeG8ip7QxCDwIaob28pXJ5IRfL/sX7BISMWYJbbrpoWsnVsUlsA
 PLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=69woklkbLBgL8Impvv5OK+7Hh8oZq0AX3Ip6Cooiy80=;
 b=jGMvMPdHzjT2ydoO/jh++rVVYIk4QOc2AW16Ht8vlA0280ah3Wf3z8rqA/VgRFn2p/
 m5au8jgszFepnFDYvLKwIEU4mjBObKrAtOC65eS9QdY4p0MponzykzsYW7OiGQrCzGmC
 B7pHp0WblfZPKytEHaDHRFZakVlq7TqqXr7i6ezw7rVT+RYRDso9WoyRTnLmambMbvCo
 lN19SdJhN0V23IXbHXnp2eNXCXnE04cdm2WGtUM0cdVxAGN1mNcwHVpFkGNxJINZ8dp8
 aS0DG1BALTcc6sBQVfXfZJZ1aEEOIO72n5SQPHp5dqq/ysMZ0SvdthckcfGe4Mh7SfmK
 UqAg==
X-Gm-Message-State: AO0yUKUlebDjvkWUCw4giLhKe5ECPn5Ryrm8I9amPoi8nVoB2VKWdJvr
 24b9+lyfc5mqPYe0D7sOQvUqPA==
X-Google-Smtp-Source: AK7set/TnKtT92tG9uUPaS73+HVH6U9yI8+Du4RGfVWh0xOoYINnXop+MY5j5WWyqquFmlDuYxwhcQ==
X-Received: by 2002:adf:f748:0:b0:2c5:534d:eebb with SMTP id
 z8-20020adff748000000b002c5534deebbmr10806133wrp.13.1677190658944; 
 Thu, 23 Feb 2023 14:17:38 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a5d4c88000000b002c5598c14acsm12422531wrs.6.2023.02.23.14.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 14:17:38 -0800 (PST)
Message-ID: <77733ac2-9d30-8262-f6d4-5b1a169f8003@linaro.org>
Date: Thu, 23 Feb 2023 23:17:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] linux-user: Fix unaligned memory access in prlimit64
 syscall
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>
References: <20230223215834.166055-1-iii@linux.ibm.com>
 <20230223215834.166055-2-iii@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230223215834.166055-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 23/2/23 22:58, Ilya Leoshkevich wrote:
> 32-bit guests may enforce only 4-byte alignment for target_rlimit64,
> whereas 64-bit hosts normally require the 8-byte one. Therefore
> accessing this struct directly is UB.
> 
> Fix by adding a local copy.

Shouldn't we fix that globally in __get_user/__put_user?

> Fixes: 163a05a8398b ("linux-user: Implement prlimit64 syscall")
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   linux-user/syscall.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index a6c426d73cf..8ae7696d8f1 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -12876,7 +12876,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>       case TARGET_NR_prlimit64:
>       {
>           /* args: pid, resource number, ptr to new rlimit, ptr to old rlimit */
> -        struct target_rlimit64 *target_rnew, *target_rold;
> +        struct target_rlimit64 *target_rnew, *target_rold, tmp;
>           struct host_rlimit64 rnew, rold, *rnewp = 0;
>           int resource = target_to_host_resource(arg2);
>   
> @@ -12886,8 +12886,9 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>               if (!lock_user_struct(VERIFY_READ, target_rnew, arg3, 1)) {
>                   return -TARGET_EFAULT;
>               }
> -            rnew.rlim_cur = tswap64(target_rnew->rlim_cur);
> -            rnew.rlim_max = tswap64(target_rnew->rlim_max);
> +            memcpy(&tmp, target_rnew, sizeof(tmp));
> +            rnew.rlim_cur = tswap64(tmp.rlim_cur);
> +            rnew.rlim_max = tswap64(tmp.rlim_max);
>               unlock_user_struct(target_rnew, arg3, 0);
>               rnewp = &rnew;
>           }
> @@ -12897,8 +12898,9 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>               if (!lock_user_struct(VERIFY_WRITE, target_rold, arg4, 1)) {
>                   return -TARGET_EFAULT;
>               }
> -            target_rold->rlim_cur = tswap64(rold.rlim_cur);
> -            target_rold->rlim_max = tswap64(rold.rlim_max);
> +            tmp.rlim_cur = tswap64(rold.rlim_cur);
> +            tmp.rlim_max = tswap64(rold.rlim_max);
> +            memcpy(target_rold, &tmp, sizeof(*target_rold));
>               unlock_user_struct(target_rold, arg4, 1);
>           }
>           return ret;


