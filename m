Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 402D94C4203
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 11:14:18 +0100 (CET)
Received: from localhost ([::1]:54618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNXc9-00085v-9A
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 05:14:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNXYd-0005bz-Fu; Fri, 25 Feb 2022 05:10:40 -0500
Received: from [2607:f8b0:4864:20::c35] (port=34453
 helo=mail-oo1-xc35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNXYW-0003gV-V1; Fri, 25 Feb 2022 05:10:39 -0500
Received: by mail-oo1-xc35.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso5657670ooi.1; 
 Fri, 25 Feb 2022 02:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hIoCVIe4yrBZ7mQwrqZ1GW3Tc9Wk9MXGL3fxDziBhX8=;
 b=Z4XXUdfYSFWRsAbL/yA4UfdCAxRcXjKBXzdvLajXXUKzpDcT+tAnqATSrlsGTpNcin
 KdMXThGU0YwSwZfCiwss1E/vh9S4tWip7+CyT6XE8+6VzGbWQ5BbQ6cUR0thElU3/Xf4
 qgpC4Zxu4Fkccgb/8c7Sh9rMHuwQssYOLHap2MGzQlgUfO7k1QR1DsWf8Qm6CDjELDL7
 S9rSoqFP1dWFjpW2frycH+ZTgtR3N5D3OB8Lzhtq0jlKiTsZG/pg8UYBqQYh7ZMxxGXq
 b7M9VX+ry86XV7dIkjLTrd0r0WoNHwepvIL8h/Cqpa82hpeTI+MOzuDx0IXapy7u6JvG
 vDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hIoCVIe4yrBZ7mQwrqZ1GW3Tc9Wk9MXGL3fxDziBhX8=;
 b=bixV9DLUfFjWs0mCLosrzq/poKGenQV9BD6hesk+Ww+901uY9iTiGAMilAgijQeIAC
 cD95SQmcwVM3l6QlM8QPFq89YhfENhdSWAf8iM4z0lfQOYV8ePlfsBI9lzwBU7eoBZt+
 kB0dJYMZjZIwwlwmcXn1gREzdyk7ffWDfKI8beFz2KKYHH2JuVIbtFQPTCrsbxxVKxKc
 WJtycqzp/6FOmzTfZApsjD7W9vHtCx9ofeQXu7c9UmTkogTq56PUXPKpMh0h0LL8xqSS
 UqW642CYF9Ju+qAe1QqSa7IVj1u6S7b98KzSWSpfLbJBgC3oCyZ9RzNNgaBeIW6hmcFJ
 9aKQ==
X-Gm-Message-State: AOAM531yxPd+erins0cASY45exKOCwUnX431V06FyvNaCrT64Ugxy8JP
 6FZAkASOB6hTEnnODv4zUWE=
X-Google-Smtp-Source: ABdhPJxCahi8QpWCiwjBuAZptV3GeFJa6ODGCScvUCn986Xkavct+GYll3NJ5wZt7yyxXHE0ptbU/Q==
X-Received: by 2002:a4a:d153:0:b0:31c:aacf:7279 with SMTP id
 o19-20020a4ad153000000b0031caacf7279mr2401618oor.62.1645783820077; 
 Fri, 25 Feb 2022 02:10:20 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377?
 ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a9d5907000000b005afa4058a4csm957990oth.1.2022.02.25.02.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 02:10:19 -0800 (PST)
Message-ID: <5fd7ee92-0e65-6d16-8b49-a1c209a48aff@gmail.com>
Date: Fri, 25 Feb 2022 07:10:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v13 4/4] target/ppc: trigger PERFM EBBs from power8-pmu.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220224201900.1037465-1-danielhb413@gmail.com>
 <20220224201900.1037465-5-danielhb413@gmail.com>
 <46d03746-80a0-f7c5-54b8-fbdd4b13c132@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <46d03746-80a0-f7c5-54b8-fbdd4b13c132@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/24/22 18:45, Richard Henderson wrote:
> On 2/24/22 10:19, Daniel Henrique Barboza wrote:
>> +void helper_ebb_perfm_excp(CPUPPCState *env)
> 
> Please reserve the prefix "helper_" for something that is called from tcg generated code, which this is not.

The prefix is due to the fact that this is being declared as a translation
helper in target/ppc/helper.h, which is also part of the problem you mentioned.

I'll rename the function and not declare it as a translation helper.


Thanks,


Daniel

> 
> 
> r~

