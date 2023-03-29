Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357F76CD941
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 14:20:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phUlx-0000xQ-TO; Wed, 29 Mar 2023 08:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phUlw-0000xF-67
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 08:19:24 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phUlu-0005Bd-Ik
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 08:19:23 -0400
Received: by mail-wm1-x330.google.com with SMTP id s13so8769834wmr.4
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 05:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680092360;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GwnHkWHfwL0YsjcR0oDqyt5L6zxT/q3dc7ahpthQ5n0=;
 b=p/GrUAzXvDbb89XPSoi19GVzrlPyb0DmfuENCnVSr9mXZLCVlUm0hE0mNTEPY/k8J9
 w44rkKKkrzpioNsEWvIdJmDODdxw6tyKmtk5Pf2QiU7A/0XftzCPFRde69YvNEZo8Qu+
 sCs9St1+YH5thZPx7qhmJ0cgLR/Ty0CZdPoaCiw4ajTccNhN+1/GLWrTyRtXvztysCcB
 IR/EbN8r0arRs+foZw+sQEPRf94hHeJwd7TFIlQmYnys8E648h7E2S5fzvyzntLD9BLJ
 /qLvA1oXJ9A9f9XwztjN8nrEyU/PjvQtFRbNPYn2ei6L7zdWScMTyxte32jpiGsi3VOX
 gg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680092360;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GwnHkWHfwL0YsjcR0oDqyt5L6zxT/q3dc7ahpthQ5n0=;
 b=OGqZNucgv5IMZND+69DV3eE9z74BNopPFh5AjJpLhSlEVDYsFVA6ibKAzR91meqpBX
 Mj2HUtEOeRzy14HGpv86maO6tsC6nwx6spQ3Q7CJHKIjgeFSXKpjFQzNBNkoQEcy8oK7
 pGkjbbZNFf/GnpUsfv/Gb0zmoLGRNQ/EPyrlDyXeKxhkkLwWMVZcV8upsSfJunbFhjOY
 /0rjUpxxUUl4kCtUD/ketSL733rDE/tapnDXlFRoJLLnxcEQzlEM8aCVvmMkUQeieQvH
 owZLKsHoQDh/G2XzL+xBxuqCGBOmgLVzRg2YjpCE7Tr3jbaweWVsaqD/yCePGkf6tIYG
 fUXQ==
X-Gm-Message-State: AO0yUKV67JusYc63+yc5egUuPzSvJF1cLWU8qIyhr9gSSfxwHfr/MgcA
 PdaDrHuKAT+oM7d+GspR7piHjA==
X-Google-Smtp-Source: AK7set/hh+Y3if1/yUb04b06GQFX2YDLYUf1Ewzx8uxeGI2htw87dfGWgutKeY7i7TY2xBZ9P1cg2g==
X-Received: by 2002:a7b:c7ce:0:b0:3ee:5147:3acc with SMTP id
 z14-20020a7bc7ce000000b003ee51473accmr15834407wmk.36.1680092360224; 
 Wed, 29 Mar 2023 05:19:20 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k4-20020a05600c1c8400b003ee610d1ce9sm2359483wms.34.2023.03.29.05.19.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 05:19:19 -0700 (PDT)
Message-ID: <f83cced2-06dd-3e56-43dc-f76ad10deb56@linaro.org>
Date: Wed, 29 Mar 2023 14:19:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] linux-user: preserve incoming order of environment
 variables in the target
Content-Language: en-US
To: Andreas Schwab <schwab@suse.de>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
References: <mvmmt3vu8bz.fsf@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <mvmmt3vu8bz.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 29/3/23 13:04, Andreas Schwab wrote:
> Do not reverse the order of envionment variables in the target environ

"environment"

> array relative to the incoming environ order.  Some testsuites depend on a
> specific order, even though it is not defined by any standard.
> 
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>   linux-user/main.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 4b18461969..d0ede3f990 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -691,8 +691,13 @@ int main(int argc, char **argv, char **envp)
>       envlist = envlist_create();
>   
>       /* add current environment into the list */
> +    /* envlist_setenv adds to the front of the list; to preserve environ
> +       order add from back to front */
>       for (wrk = environ; *wrk != NULL; wrk++) {
> -        (void) envlist_setenv(envlist, *wrk);
> +        continue;
> +    }
> +    while (wrk != environ) {
> +        (void) envlist_setenv(envlist, *--wrk);
>       }

Preferably using a dumber form (easier to review IMHO):

         while (wrk != environ) {
            wrk--;
            (void) envlist_setenv(envlist, *wrk);
         }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


