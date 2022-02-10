Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BC74B1966
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 00:24:09 +0100 (CET)
Received: from localhost ([::1]:43968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIInI-0006Ye-8G
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 18:24:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIImS-0005sL-16
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:23:16 -0500
Received: from [2607:f8b0:4864:20::42a] (port=33606
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIImM-0004PR-HC
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:23:15 -0500
Received: by mail-pf1-x42a.google.com with SMTP id t36so2204121pfg.0
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 15:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DZ6rKiVqQSpaP7NXBZO3xbh/OSk/V3RPcWORzEiHizw=;
 b=mjkbbKGXF0tEtcKldpcZm8RNKaLeHwdFPjC9W6uTe2lO8TUvX0ujYbTfmkFhJo9YpI
 s7eqnD5AlfTnPfQZqLrQINvtm5Y/w7wl1Cfzb/6OLjUmPnQrhIe6b5qwonB/MGvT0H6K
 FYTvaO++D2JOaO/GUMYVFbJFtL7CVmRy3mm2YwncY5kPoDLzNqsnhvVykWknzaZW2mbK
 6NL15Zz6xSlmbX/n6w5X9p3+OGslN205bwNjZApmKYXuwkfvZHqMBYmJQImYBwLgdfok
 MsllbXfjycKAo8rrhptQiFEnFB4Mg2HdHhmBM0f39WHgQenNGZlSOVEQDt0C15Wr/gbf
 pKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DZ6rKiVqQSpaP7NXBZO3xbh/OSk/V3RPcWORzEiHizw=;
 b=zIqPCcuPOtLdGvJp6XiLselbhlWODyJQelv6gQryzV0/9DVH/5wXy2mXN1L5hU6oSW
 5qM8vk/h/8vCpLpoV7EvNkwM55Fdv90K0UFdAG/kKIBdAda/wTJAwDsFPmrkCh4xHjoe
 G0cAul4rtMd3mzHTwSXsxhWjncGNutJvRjFzVCrRqYjotABZ1yv0rwYYo1bo8ya8+gzV
 YmCJIgStsy2E2XEhugGO4b21XWz9ks2XXxAOqxIUIGB1qT1l0ml9IsXCZPaMEiqU/hSh
 Dbc/XOj2Lk+xRGsg2vb4cJQeuyHFs7ESNf0bqT4d7bzHdAjfRaCCw+AQ4YZNiDv1JT7p
 CPAw==
X-Gm-Message-State: AOAM531Oy0AZxTcFVb5+oD8d7J7KREfVdpbUZimnKr5c3514CJGIU7gS
 /kn5bI+tWhLZ3l2MSRb9qviv7g==
X-Google-Smtp-Source: ABdhPJx6xi7mgVwCBS7BKZ2U5A7+HCSo55QfH00ZPXcAt2C5rakN76iAoaOkX6NJmYR3u2yqx/gRjw==
X-Received: by 2002:a62:e907:: with SMTP id j7mr9965013pfh.3.1644535389121;
 Thu, 10 Feb 2022 15:23:09 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id o9sm21717617pfw.86.2022.02.10.15.23.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 15:23:08 -0800 (PST)
Message-ID: <b8820aa4-f455-ea6f-2e0c-5f062bbe5872@linaro.org>
Date: Fri, 11 Feb 2022 10:23:01 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 9/9] user: Share preexit_cleanup() with linux and bsd
 implementations
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220209230030.93987-1-f4bug@amsat.org>
 <20220209230030.93987-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220209230030.93987-10-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 10:00, Philippe Mathieu-Daudé wrote:
> preexit_cleanup() is not Linux specific, move it to common-user/.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   {linux-user => common-user}/exit.c | 0
>   common-user/meson.build            | 1 +
>   linux-user/meson.build             | 1 -
>   3 files changed, 1 insertion(+), 1 deletion(-)
>   rename {linux-user => common-user}/exit.c (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Of course, the next step is to use the function (cc Warner).


r~

> 
> diff --git a/linux-user/exit.c b/common-user/exit.c
> similarity index 100%
> rename from linux-user/exit.c
> rename to common-user/exit.c
> diff --git a/common-user/meson.build b/common-user/meson.build
> index 26212dda5c..7204f8bd61 100644
> --- a/common-user/meson.build
> +++ b/common-user/meson.build
> @@ -1,6 +1,7 @@
>   common_user_inc += include_directories('host/' / host_arch)
>   
>   user_ss.add(files(
> +  'exit.c',
>     'safe-syscall.S',
>     'safe-syscall-error.c',
>   ))
> diff --git a/linux-user/meson.build b/linux-user/meson.build
> index de4320af05..25756a2518 100644
> --- a/linux-user/meson.build
> +++ b/linux-user/meson.build
> @@ -9,7 +9,6 @@ common_user_inc += include_directories('include')
>   
>   linux_user_ss.add(files(
>     'elfload.c',
> -  'exit.c',
>     'fd-trans.c',
>     'linuxload.c',
>     'main.c',


