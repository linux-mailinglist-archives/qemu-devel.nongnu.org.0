Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0524B6A13AB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:20:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVKsk-0004ux-NH; Thu, 23 Feb 2023 18:20:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKsi-0004uo-PP
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:20:08 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVKsg-0000yA-Jd
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:20:08 -0500
Received: by mail-wm1-x32e.google.com with SMTP id c18so5621180wmr.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WqGF690u0B0WCRnxY2IFW+J1axMl5roCM+DMsV+/9ws=;
 b=Pp+HE3YikA2l4CtqskAlEX5w1YF8T8axpq/UEqbCPENc9LvjIhl2MQtbHVkZzscq+5
 Gb72MkkXV0p3nH9CdBsTqOAoOCyflDch7ac6dwQdPWyhpaURBKyEoiI0R5j8dYZOpIB/
 dvK1GFS/GxUllEeHNx0LHiB0GdXs3HiuRSwU3O5FP6SqZ/DrT+dO1joxdj71Zw+Rj6OW
 JNfUQPEAF5bmmzU4l45AlZLaAQ997dl3uj3UL1lrYR+XS9Loo2D8R+5kliDzMQSOVlQJ
 0K05b0NuSS9xrvr8JfFR2t2o3y8dyOSbttDZa/XHNVqT1zDQydJRE11swlj4RFMEBiNW
 hTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WqGF690u0B0WCRnxY2IFW+J1axMl5roCM+DMsV+/9ws=;
 b=Gsmyo0dSVhBFPpP1q//TRupkaDbcYdhqRTj42nXr5HSRPKcYiAVAPfXgUImhEmzpRN
 9OKsU6ZlSs3sMJpTwne2EqPOvnJ19hS+3Y/huOq0ZJiUq/vqBXWsUIbDaWSfbDtm7asu
 bmgLyUy7rBGcYLBslEWM5UIfVCoWQqKFLm+pgzcmeLGGFUGlUcm41tPZpumWygc0vhb0
 4goy9/gGWvHnkzyNMldGIrOQYW0LIfKXGuwf9DZtDSMPv/b91gD7vstQS9cctWUa05R1
 Lg35E5LU7UqmeRg2Niss/SurQkKjY98eKVRpsB7Y68l6Ty7LlZ/Jnq+FOaA+waPHEtkT
 qB4w==
X-Gm-Message-State: AO0yUKW2cGq1/ROA8xyM1UuFWrLHj8CGXX/97J2F3T6yekmYaEBMc6RG
 P6X3NRB7g0IRuJSZwvzFvVAKbdkgw+e69IHV
X-Google-Smtp-Source: AK7set/3wewiEYiMnyuRSDj+fpz2aqiUsDD+sc0d2igJnItZue4a7ONb3A2xNk3lz7yzYPXaKGEsgw==
X-Received: by 2002:a05:600c:13ca:b0:3e2:9b5:c2c3 with SMTP id
 e10-20020a05600c13ca00b003e209b5c2c3mr10191370wmg.22.1677194404961; 
 Thu, 23 Feb 2023 15:20:04 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c4f9100b003e876122dc1sm760732wmq.47.2023.02.23.15.20.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 15:20:04 -0800 (PST)
Message-ID: <d9c11ba1-a6b2-ad93-7485-4b0953895b90@linaro.org>
Date: Fri, 24 Feb 2023 00:20:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] linux-user: Fix unaligned memory access in
 prlimit64 syscall
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>
References: <20230223231137.186344-1-iii@linux.ibm.com>
 <20230223231137.186344-2-iii@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230223231137.186344-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 24/2/23 00:11, Ilya Leoshkevich wrote:
> target_rlimit64 contains uint64_t fields, so it's 8-byte aligned on
> some hosts, while some guests may align their respective type on a
> 4-byte boundary. This may lead to an unaligned access, which is an UB.
> 
> Fix by defining the fields as abi_ullong. This makes the host alignment
> match that of the guest, and lets the compiler know that it should emit
> code that can deal with the guest alignment.
> 
> While at it, also use __get_user() and __put_user() instead of
> tswap64().
> 
> Fixes: 163a05a8398b ("linux-user: Implement prlimit64 syscall")
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   linux-user/generic/target_resource.h | 4 ++--
>   linux-user/syscall.c                 | 8 ++++----
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/linux-user/generic/target_resource.h b/linux-user/generic/target_resource.h
> index 539d8c46772..37d3eb09b3b 100644
> --- a/linux-user/generic/target_resource.h
> +++ b/linux-user/generic/target_resource.h
> @@ -12,8 +12,8 @@ struct target_rlimit {
>   };
>   
>   struct target_rlimit64 {
> -    uint64_t rlim_cur;
> -    uint64_t rlim_max;
> +    abi_ullong rlim_cur;
> +    abi_ullong rlim_max;
>   };
>   
>   #define TARGET_RLIM_INFINITY    ((abi_ulong)-1)
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index a6c426d73cf..1f7a272799b 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -12886,8 +12886,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>               if (!lock_user_struct(VERIFY_READ, target_rnew, arg3, 1)) {
>                   return -TARGET_EFAULT;
>               }
> -            rnew.rlim_cur = tswap64(target_rnew->rlim_cur);
> -            rnew.rlim_max = tswap64(target_rnew->rlim_max);
> +            __get_user(rnew.rlim_cur, &target_rnew->rlim_cur);
> +            __get_user(rnew.rlim_max, &target_rnew->rlim_max);

Thanks,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


