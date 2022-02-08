Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3824AE4E9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 23:49:49 +0100 (CET)
Received: from localhost ([::1]:45640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHZIy-0000gv-DP
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 17:49:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZHC-0007cV-B7
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:47:59 -0500
Received: from [2607:f8b0:4864:20::42d] (port=40853
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZHA-0006qq-3U
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:47:57 -0500
Received: by mail-pf1-x42d.google.com with SMTP id a39so145401pfx.7
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 14:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2jnxXPjBY7k26CMWo7jzPK9vUITTTf5gHh3RNVRtRD0=;
 b=zUuLmKuJLljooxCslbS/8W3z/O+KssivPrlCPz7oR8r9W15BVmEq9z0fUVsH+RW8x5
 lM5I6ZtCO7lEsXJ7cIaoN3ODw69tZYit0z+/yMBm1wrZOfVwjvlsfI02pcbWFzxX4C8z
 Nioik82iEfQVuFDjFaHVxwH9ZZAYm63V8gaXZ/9nCmKsi7wxFqupMI5lJqpGZhzc7nGL
 p2RmGEktY2PX/NMvItZJ4l9y9CDyzOXWu6BQ+Bm4hWzHtq+T+rv7qIbczJmKgDsRISbw
 hmZTe8F1en2DHIrV0CAgp4E1TzVHXZPulc5v/THbCPPlbv4LrJZKnui5FxARB2YGWOlB
 ll0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2jnxXPjBY7k26CMWo7jzPK9vUITTTf5gHh3RNVRtRD0=;
 b=Va8knkE0efG2Le67TSZKNxG0I1JmK2eKyRFFKopSLDxvms0zMFKECOmljFZ8R0U38R
 1ApKk8z+lTHTdZxUPXFeCat7kPl+lLYAPoXSaeoAmWqIz0YUu4KfdO7emkVrqaI19IDs
 fZ/CNrzk+k2HhAiD3NlnPVM5sFQaSLEXNukFrMqUzu6Ls+DtOt0diUM1YveHZUKXlDo/
 dOR6wYheBYoFRcuWagNz96wXerqm5mkEhgtDrC1bs4RQuz6fDfEvli/OLHH1fJl5pA9L
 dDU2lZE/cv7GAjBBdBPRuBpWFxCx1wzZgDRF7vubi4e2dwGtX1fizWA6HkxoyjydCJSh
 s8Kw==
X-Gm-Message-State: AOAM531v2lmcY3EgGR1GAQEzbvpBsDtQ2gqotkF0gMaZr6lkHevujxTy
 25w2eq72Rk7To6GjOSczxUsLYw==
X-Google-Smtp-Source: ABdhPJxDos1W4f1wSLbXkW6I32apayHq74+bYZnwrY4vyoyfWak1nrVLzwCDvi876WMUO4yZ5U22sw==
X-Received: by 2002:a63:285:: with SMTP id 127mr5210937pgc.67.1644360474071;
 Tue, 08 Feb 2022 14:47:54 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id l11sm1973517pjm.23.2022.02.08.14.47.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 14:47:53 -0800 (PST)
Message-ID: <c2b76df6-688c-c286-4c6c-d9e4492318a5@linaro.org>
Date: Wed, 9 Feb 2022 09:47:48 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 12/13] exec/cpu-all: Restrict cpu_copy() to user emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220208152243.16452-1-f4bug@amsat.org>
 <20220208152243.16452-13-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208152243.16452-13-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/22 02:22, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/exec/cpu-all.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index c0f0fab28a..84188febfa 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -296,10 +296,11 @@ void *page_alloc_target_data(target_ulong address, size_t size);
>    * at @address, as per page_alloc_target_data.
>    */
>   void *page_get_target_data(target_ulong address);
> -#endif
>   
>   CPUArchState *cpu_copy(CPUArchState *env);
>   
> +#endif /* CONFIG_USER_ONLY */
> +

Alternately, move it to linux-user/user-internals.h.


r~

