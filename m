Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D105662DB09
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 13:37:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ove7f-00006b-VK; Thu, 17 Nov 2022 07:36:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ove7d-00005E-Hc
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 07:36:01 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ove7c-0004rB-0y
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 07:36:01 -0500
Received: by mail-wm1-x32a.google.com with SMTP id v7so1314094wmn.0
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 04:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GTi207hJypWRogL7kEGXVr7Qp6Muoo9NZCYfZ0ivVPo=;
 b=NWMs9atQ7rKELq0KHNpim+kJcprPe5n98gN9ep+vhQL8ZihesgjWRvXGJUym5smqm/
 K+by/0BqPGDdQIo4imZXvwDzm4o16E6fr+hnPKKQMGiQZZFKHZpz1Yyxx57eV/F51hFr
 BaRNMi1sKEhu0U20itu+lHRCxT9X5Hr/CHbUuiLCFAiZ0PTUjw8uk8M2SWXNOiRMyMd2
 pKB1lrcTNVuFtzm2JAs7HKvDAuVkD6Ki7B1nizW6MqJAL6D35JVAuh51gbZCXFMf7AL5
 yt6kUGM761+k7OWGe2N0Z7qg10eiUwl2RHghPwGiJfjzhCBnAToZniHbVJb+wN3Z4h8/
 X9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GTi207hJypWRogL7kEGXVr7Qp6Muoo9NZCYfZ0ivVPo=;
 b=N7K8ODVorlmT+346oyu55ar3M+uEUXZkambDIqVH4y8vi8OiWKLGehAXFhnIb/bb9w
 vseCamiheKS1CJkWYP/27ThbyDV37JMIrB2J+hYZyZx6HP+wDKaPoePYkQweLFISzMSr
 674fKv0lhp2nKoCj3LGjorxoWylTRrrWyzV6YW75Cpi9QomO3EBYMGKR44dRVNl8qI1l
 vmqei5Qo3tZlTNuEE6sJ7GrV5YgDdRQuEnwNQpv1yA92wKjHedcdZWpYV7n7Gyzy+V9m
 BDQxyHKOfQfNlM0Z5QtI87CJptg1aIGpg2kDuO78pgEuwhjEVb5r9+38pypJQYw5ZFcR
 kbUQ==
X-Gm-Message-State: ANoB5plT0bYIXZsUsc/u6XzhzDiH6BjjLTqZ7+vzLsf9ZQfAoALpGhr9
 7b75hcGrGbXAkO5MrpBxbyoDwA==
X-Google-Smtp-Source: AA0mqf5pskwzSCVIpY6Nx5vrk33ryhSlWak8dawjOUdbqGSjJ/v1wdsaQrEFzzegPU7mm/SC7/vPQw==
X-Received: by 2002:a05:600c:4f48:b0:3cf:54f4:eea with SMTP id
 m8-20020a05600c4f4800b003cf54f40eeamr1602783wmq.105.1668688557678; 
 Thu, 17 Nov 2022 04:35:57 -0800 (PST)
Received: from [192.168.189.175] (58.red-88-29-172.dynamicip.rima-tde.net.
 [88.29.172.58]) by smtp.gmail.com with ESMTPSA id
 t65-20020a1c4644000000b003cfa622a18asm5487582wma.3.2022.11.17.04.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 04:35:56 -0800 (PST)
Message-ID: <36fdf2bc-e2b9-283b-d415-9ba10759edf0@linaro.org>
Date: Thu, 17 Nov 2022 13:35:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [RFC PATCH] tests/avocado: move aarch64 boot_linux tcg tests and
 slim down
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, thuth@redhat.com,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221117121900.3922169-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221117121900.3922169-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 17/11/22 13:19, Alex Bennée wrote:
> The boot_linux tests download and run a full cloud image boot and
> start a full distro. While the ability to test the full boot chain is
> worthwhile it is perhaps a little too heavy weight and causes issues
> in CI. Fix this by dropping the TCG tests in boot_linux and replacing
> them with a alpine linux ISO boot in machine_aarch64_virt.
> 
> This boots a fully loaded -cpu max with all the bells and whistles in
> 41s on my machine. A full debug build takes around 250s on my machine
> so we set a more generous timeout to cover that.
> 
> We do drop testing for lesser GIC versions although there is some
> coverage for that already in the boot_xen.py tests. If we want to
> introduce more comprehensive testing we can do it with a custom kernel
> and initrd rather than a full distro boot.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/boot_linux.py           | 43 +++++--------------------
>   tests/avocado/machine_aarch64_virt.py | 46 ++++++++++++++++++++++++++-
>   2 files changed, 53 insertions(+), 36 deletions(-)
I'd rather keep the current tests but:
   1/ rename them as '_cloud_image',
   2/ skip them on CI
and 3/ add the '_alpine' tests to run on CI.

