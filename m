Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF04C6483BD
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 15:27:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3eKX-00035r-Gs; Fri, 09 Dec 2022 09:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3eKV-00035Q-E1
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:26:23 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3eKT-0006em-DV
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 09:26:22 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 n9-20020a05600c3b8900b003d0944dba41so3554019wms.4
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 06:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r4eZoFWjDSaBgS/bsBVAGsAwbmlTsC9e8KhFB8lrLBs=;
 b=kEYGVGq7fv3X0vMnHMV8JH/LkDtMXiO1H37W3Rf+bakTLPwoL3hj0FfnpIjPUnfGBT
 4yAUR566tkoBVYebTgo/dXYm/lP1yOBtbFGMYy6fHu44HC5qkJADPNlm4NFLgpWg8Bux
 jeD0RwhIC4hIJy5+ulSlLqTgAKn8lUbfK/bclRaMr1Oh1otz0ZuAjdgUGaWy/kjBV6do
 6ZYsfuaoJ7fTVOean3RBxFWoiO+bMWqDtQNKsECzaD9Inmrcgohzx1FYOunV7klrL+nS
 O3PVcoROo+NWbxhxSJF42u12KY6Dl7x+4cnYyl9K8UVEPFWzKbvPxeIttcsd0G6NAg+O
 GDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r4eZoFWjDSaBgS/bsBVAGsAwbmlTsC9e8KhFB8lrLBs=;
 b=R/tS+UU4y6AkUjpCrcea8N448gt9aCOKRI0BMDn76pIF10tJVjk3kgM+27x0BkzWIh
 IEUU1dE/N3HMXe5e7daJI9FYSC/aOwV/g39bciujQsXMnfDVrrRrNkww56SIYb24+qWi
 SehpV0UCP6UcBMFEakQH8a36p+vjoLJqtRcxR9bnUZuKJOWMNop8d4lq8cUSCmHXFCbu
 XiNmkYRtYWm35ZXps96Wc/rEa4bOlID7B3asc3Ax+3ISVZDb5mmk6Kh2woJVkxIOXNrn
 uvLOmEIhS5oXrrO+i1MsKND75ue6cTd6hTGTTx9TaHc8brzRTH8Mi52qXNCTztU0FozA
 UWow==
X-Gm-Message-State: ANoB5pmvXiyKlRxAbnslCvtZWz8BEGnofZ7CnMkxqueRUW2Pg/5KTVF4
 fxnMl5B2G2cqaa3kTribpDJSWw==
X-Google-Smtp-Source: AA0mqf60zKxpmYpOgg2Cuq385tAnFlnBaozdVz5leZ66I0lp6xtQwrQU6ttz27lvNXo41+BilZD3sA==
X-Received: by 2002:a05:600c:2101:b0:3cf:e850:4451 with SMTP id
 u1-20020a05600c210100b003cfe8504451mr4946239wml.9.1670595978985; 
 Fri, 09 Dec 2022 06:26:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k4-20020a5d66c4000000b002365254ea42sm1555299wrw.1.2022.12.09.06.26.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 06:26:18 -0800 (PST)
Message-ID: <5c7889c9-2bd4-0f82-cbc5-f9e172743e44@linaro.org>
Date: Fri, 9 Dec 2022 15:26:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 for-8.0] hw/rtc/mc146818rtc: Make this rtc device
 target independent
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Michael S Tsirkin <mst@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
References: <20221209111556.110757-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209111556.110757-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
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

On 9/12/22 12:15, Thomas Huth wrote:
> The only reason for this code being target dependent is the apic-related
> code in rtc_policy_slew_deliver_irq(). Since these apic functions are rather
> simple, we can easily move them into a new, separate file (apic_irqcount.c)
> which will always be compiled and linked if either APIC or the mc146818 device
> are required. This way we can get rid of the #ifdef TARGET_I386 switches in
> mc146818rtc.c and declare it in the softmmu_ss instead of specific_ss, so
> that the code only gets compiled once for all targets.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2: Move the apic functions into a separate file instead of using
>       an ugly function pointer
> 
>   include/hw/i386/apic.h          |  1 +
>   include/hw/i386/apic_internal.h |  1 -
>   include/hw/rtc/mc146818rtc.h    |  1 +
>   hw/intc/apic_common.c           | 27 -----------------
>   hw/intc/apic_irqcount.c         | 53 +++++++++++++++++++++++++++++++++
>   hw/rtc/mc146818rtc.c            | 25 +++++-----------
>   hw/intc/meson.build             |  6 +++-
>   hw/rtc/meson.build              |  3 +-
>   8 files changed, 68 insertions(+), 49 deletions(-)
>   create mode 100644 hw/intc/apic_irqcount.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


