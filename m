Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08065FB3EE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:54:53 +0200 (CEST)
Received: from localhost ([::1]:59398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiFie-0006RW-Je
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiERP-0000hw-Ml
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 08:32:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiERN-0001BX-6L
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 08:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665491576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+DGXCH36N0+WI9tdQGbdNXB0xNGpbja2rbo2Cq/AJdA=;
 b=Hn8knvMOfvgtc4pJhbM/tv2JeqRHHuJ+yCElbQTNMGcfuhsQkilXj97PgsV6bV/QEBbkM0
 XaDj0pECLdFte/42Olu5oe3BqZkm6hGBLhp1JHTiKabOIQK2AYHF1+oNwQ54eVguGmpg9a
 fnVDKAsuCM+pyKcfYClUqexLMiSioKQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-395-Kx90foOqPRClm7eR3SnLoA-1; Tue, 11 Oct 2022 08:32:55 -0400
X-MC-Unique: Kx90foOqPRClm7eR3SnLoA-1
Received: by mail-wr1-f69.google.com with SMTP id
 k30-20020adfb35e000000b0022e04708c18so3824726wrd.22
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 05:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+DGXCH36N0+WI9tdQGbdNXB0xNGpbja2rbo2Cq/AJdA=;
 b=YM2uigRDE4DRBPOVlZD54y460O93kbfG2ESBEGUEWM1/N5EyAxfCazSSu7e5eF/JZ7
 Spl5VzVHEEZwP/Ly+oSbtAiAPbgyAei+MIk8mJBfGtBJO0A4R162xoPs626o/zGwm7cw
 GFkbcQiCUYeB4j0F3sRhIVYCYT+RPCPAzxxr49FHqus8AbqPlyqz7vU2oGWcDxoD7Lgr
 1cbjSc9vXmxJgL5aDp0HYGj9wSig3tkGhGS2IQyW44hKHNcMM5l/CiEyHv9dS3aaaqpB
 PFayAjBPCZnVRV7Zl2CaV2knYiR0+Xf/JjrqcmA51A0khuFAPEFY+uC44J4xTW3hhwwY
 /zfw==
X-Gm-Message-State: ACrzQf2NYkPm5oYyecDEPJ3b5pdr6pg6d5h5TrZZ4unLX+r0kplhnNCk
 l7mkbEAvcbFhM/3QiAJ8297lHwNTpCJQlpCknT0paVYeP/Islo3M/iCJ0cj5cmTHus5R0Vf/18w
 +aOHAd3dSCduL21A=
X-Received: by 2002:a1c:19c4:0:b0:3b4:a1da:76c3 with SMTP id
 187-20020a1c19c4000000b003b4a1da76c3mr22963165wmz.106.1665491574109; 
 Tue, 11 Oct 2022 05:32:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6tlqWZtlTEF4eC7SdN1bGfU00FJPapgCVozGklZ8O5OMpPk/qxNzN7xHdJFChgb800UmuKQA==
X-Received: by 2002:a1c:19c4:0:b0:3b4:a1da:76c3 with SMTP id
 187-20020a1c19c4000000b003b4a1da76c3mr22963138wmz.106.1665491573856; 
 Tue, 11 Oct 2022 05:32:53 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-11.web.vodafone.de.
 [109.43.176.11]) by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b003b477532e66sm2789555wmq.2.2022.10.11.05.32.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 05:32:53 -0700 (PDT)
Message-ID: <493cbb25-94b3-46e6-65b0-a9f45b8bf248@redhat.com>
Date: Tue, 11 Oct 2022 14:32:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 08/18] accel/qtest: Support qtest accelerator for
 Windows
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng
 <bin.meng@windriver.com>, Eduardo Habkost <eduardo@habkost.net>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <20221006151927.2079583-9-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221006151927.2079583-9-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.934, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 06/10/2022 17.19, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> Currently signal SIGIPI [=SIGUSR1] is used to kick the dummy CPU
> when qtest accelerator is used. However SIGUSR1 is unsupported on
> Windows. To support Windows, we add a QemuSemaphore CPUState::sem
> to kick the dummy CPU instead for Windows.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
> 
> Changes in v5:
> - restore to v1 version which does not touch the posix implementation
> 
>   include/hw/core/cpu.h   |  1 +
>   accel/dummy-cpus.c      | 14 ++++++++++++--
>   softmmu/cpus.c          |  9 +++++----
>   accel/meson.build       |  1 +
>   accel/qtest/meson.build |  1 +
>   5 files changed, 20 insertions(+), 6 deletions(-)
...
> diff --git a/accel/meson.build b/accel/meson.build
> index b9a963cf80..b21c85dc0a 100644
> --- a/accel/meson.build
> +++ b/accel/meson.build
> @@ -17,4 +17,5 @@ dummy_ss.add(files(
>   ))
>   
>   specific_ss.add_all(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'], if_true: dummy_ss)
> +specific_ss.add_all(when: ['CONFIG_WIN32'], if_true: dummy_ss)

Sorry for not noticing it earlier, but I just noticed that this likely 
should also only be added for softmmu builds on Windows?

So instead of adding a new line, I'd rather simply remove the CONFIG_POSIX 
from the previous line?

>   specific_ss.add_all(when: ['CONFIG_XEN'], if_true: dummy_ss)
> diff --git a/accel/qtest/meson.build b/accel/qtest/meson.build
> index 4c65600293..a4876fc0f2 100644
> --- a/accel/qtest/meson.build
> +++ b/accel/qtest/meson.build
> @@ -1,2 +1,3 @@
>   qtest_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'],
>                       if_true: files('qtest.c'))
> +qtest_module_ss.add(when: ['CONFIG_WIN32'], if_true: files('qtest.c'))

Dito, rather remove the CONFIG_POSIX in the previous line?

  Thomas


