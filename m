Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 268BB602BF3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 14:43:08 +0200 (CEST)
Received: from localhost ([::1]:57944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oklw2-0001Yg-5k
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 08:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oklRP-0007dh-Jj
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:11:31 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oklRM-0006gE-Rf
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:11:26 -0400
Received: by mail-wr1-x431.google.com with SMTP id bp11so23117718wrb.9
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 05:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2/nk4aOolpJzSQa6IIzTJjD18sRNab+T5lJNM0jkBvg=;
 b=k7WRtDC0eczfj4bIexNmk93dd0R4PaCmxiM3IXsUAPr/ag5EuCH2CkKv4SvfhwHpcw
 7rZNtoevpHVrmLnYnCHAh/knK/RlSGWSXE/EfMP2tjg77e3BaPnUyZD31r2cUxlcD1+9
 KHtseJMkSEedKfJmdgiiGuPSy0K8AWjZrRyiIuD4FT0XaITHbpBrbaAg0uGFppu16/6A
 FjJWzzvZo62XA+IOlzb7sUfV05SPRs4zCEGYpC+1Sr/ITcPv1VpL6hzSqqpxUJSqzrQO
 BAxyRtTLNQrnB5l2KGg/6fY+fO4H18b8zyTytZPeq7VyM/dcAaZ5jkldjMC5BLHexh8Q
 43rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2/nk4aOolpJzSQa6IIzTJjD18sRNab+T5lJNM0jkBvg=;
 b=QXZc0vjz6Z84StBDeI8pzfC+Gb6SzZFEZ4L5DFeNlUgh0Rt+xdS9w1GhA/60E2s5l0
 sUgeIgmKBfldetzHe8JicuJBtwhobwEkJgGij2nQ3R9eEs+Idq8ry48j7LzZBOHus5Hq
 yUbooqwm85F0ZF5rqDrrnp95w3slRZPVnE02s079FzCpfN+CLbi3ASvMhqt1WoOcU+D/
 Gk7JqD1kAT0hHDuA8uOlizxwHhB10YiPDtZhu3CtWfuZqx91HbXTiyTuv0NpZ5o76gxg
 sR+4o0JqJ3TfC5X3qrImWuEWlp1GgxMupSSv2K0o/ng5Zw0v6h+IQBPlHNmkHf/dvSBD
 GbhA==
X-Gm-Message-State: ACrzQf1eBljw6TBWg7rhYhv8SwW1t6oiqV5bQB4XiaIR9yfld0Zq1elL
 Zhyn1r3VFJ64ef9ySWAyUIo/sg==
X-Google-Smtp-Source: AMsMyM7Pu4O8R1CFFvLQhqIkAXWDoJrJzuk8laySFviJkE3AF6S/kvwVJnnZRcNeENWnAymxZVJMAw==
X-Received: by 2002:adf:dbc5:0:b0:22c:c605:3b81 with SMTP id
 e5-20020adfdbc5000000b0022cc6053b81mr1691655wrj.218.1666095082309; 
 Tue, 18 Oct 2022 05:11:22 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003b4e009deb2sm15377792wmc.41.2022.10.18.05.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 05:11:21 -0700 (PDT)
Message-ID: <8266adb1-ea48-4ef7-eadc-9aa1e1dde842@linaro.org>
Date: Tue, 18 Oct 2022 14:11:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 21/28] qapi run-state: Elide redundant has_FOO in
 generated C
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
 <20221018062849.3420573-22-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221018062849.3420573-22-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/10/22 08:28, Markus Armbruster wrote:
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for qapi/run-state.json.
> 
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.

The rationale here is qapi free() has always be able to deal with a NULL
argument (commit fb3182ce6e "qapi: add qapi-types.py code generator"
from Tue Jul 19 14:50:40 2011).

> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   softmmu/runstate.c     | 18 +++++-------------
>   scripts/qapi/schema.py |  1 -
>   2 files changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index 1e68680b9d..682a810d3c 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c

> @@ -517,13 +514,8 @@ void qemu_system_guest_panicked(GuestPanicInformation *info)
>   void qemu_system_guest_crashloaded(GuestPanicInformation *info)
>   {
>       qemu_log_mask(LOG_GUEST_ERROR, "Guest crash loaded");
> -
> -    qapi_event_send_guest_crashloaded(GUEST_PANIC_ACTION_RUN,
> -                                   !!info, info);
> -
> -    if (info) {
> -        qapi_free_GuestPanicInformation(info);
> -    }
> +    qapi_event_send_guest_crashloaded(GUEST_PANIC_ACTION_RUN, info);
> +    qapi_free_GuestPanicInformation(info);
>   }

Preferably updating the commit description:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

