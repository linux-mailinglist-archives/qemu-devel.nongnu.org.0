Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6906499DD
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 09:04:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4dnN-0000MJ-1Y; Mon, 12 Dec 2022 03:04:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4dn0-0000Kh-Oc
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:03:58 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4dmx-0001Zj-Ti
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:03:53 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so4440138wmh.0
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 00:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gUfCtbh3cl/odd2fgaDaAZ5M71KPbUootDMJ3DsjExU=;
 b=TT3/LUy8eF/yXrm3f1TZQNDh3zwMxLgF5IDkEOcyBaG/jp9/Sc5x6NDA5Qzo77v9rZ
 peQp4K1DJshvYBNEDerqxVScZWqbKT7mBp3kPmK61wxkmvDr1saIplgCTYyj4hnoVXjh
 GIAiD6AeCyU6nLbt9Rh40lCuuTjpXPUeABrnXjCdj8Yk4zqG29l/C6EoJyfH8nKIU1Gq
 QjJyIUaW6zU7BuOF2bnJOblcLbM5FpTxAScXKTSDGKavgFJY8QwLeFIxO3pCGFzhkYmy
 ciiVuI5l/1GelUXUMM5ec/Ku+qi6rVeDR1yShiqS5MOLOjtiG1h09DZR2mnI8ShoYuqQ
 y7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gUfCtbh3cl/odd2fgaDaAZ5M71KPbUootDMJ3DsjExU=;
 b=s/bbYcEZxjSYmkDv63lErHZIapgyHE5MqaKafW/3WN9E63i8gJp8Ch8k+4OocRN8kk
 GKfvgE57ZkMgETXBp7u3w1sHuSoL5gN1gHLbVoTlGBz32xQwUYNSuWbpZ4hEPU+5bamp
 DiZeYVv283JTTsdQpr2cpgV0aAOFGOZ5oOx71JVQYZefuBGjQrrIfLouD6mYoduoJZZC
 i1674vyfORvsvwzj83UOPPBcN9CCIlT1q4BDV3egdsDIe2bh2vZsoI5K2ciy86uBnoWe
 /1p0BFEr+YzNoOgwnYWygUKFgAfgMz8rjJ56d0sNaHNZyefhQ9Z1aq6v+nYIyvezWrGq
 6wug==
X-Gm-Message-State: ANoB5plALAjrsMZQtRbJT7REhn5F3IwXkbKF8FyaIcjEDg5l3NYKrYQq
 VzeKqip3kkAedpCGEkn8599SAw==
X-Google-Smtp-Source: AA0mqf5IcMHOpUja57s4d6Qrfx0YMMUBjWswz3YWSwqfg15vClON7+gjNfHhj8VMOyMxRCJvY8R0xw==
X-Received: by 2002:a7b:c417:0:b0:3c6:e63e:8155 with SMTP id
 k23-20020a7bc417000000b003c6e63e8155mr11125131wmi.12.1670832230292; 
 Mon, 12 Dec 2022 00:03:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o25-20020a05600c511900b003c6f8d30e40sm8788139wms.31.2022.12.12.00.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 00:03:49 -0800 (PST)
Message-ID: <0c93d5c5-3252-4a9f-0abf-c0ea39453ae6@linaro.org>
Date: Mon, 12 Dec 2022 09:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3] hw/rtc/mc146818rtc: Make this rtc device target
 independent
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Michael S Tsirkin <mst@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
References: <20221212075600.17408-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221212075600.17408-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 12/12/22 08:56, Thomas Huth wrote:
> The only reason for this code being target dependent is the apic-related
> code in rtc_policy_slew_deliver_irq(). Since these apic functions are rather
> simple, we can easily move them into a new, separate file (apic_irqcount.c)
> which will always be compiled and linked if either APIC or the mc146818 device
> are required. This way we can get rid of the #ifdef TARGET_I386 switches in
> mc146818rtc.c and declare it in the softmmu_ss instead of specific_ss, so
> that the code only gets compiled once for all targets.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v3: Move TYPE_APIC_COMMON from apic_internal.h to apic.h and use it

Ah, clever.

>   include/hw/i386/apic.h          |  2 ++
>   include/hw/i386/apic_internal.h |  2 --
>   include/hw/rtc/mc146818rtc.h    |  1 +
>   hw/intc/apic_common.c           | 27 -----------------
>   hw/intc/apic_irqcount.c         | 53 +++++++++++++++++++++++++++++++++
>   hw/rtc/mc146818rtc.c            | 25 +++++-----------
>   hw/intc/meson.build             |  6 +++-
>   hw/rtc/meson.build              |  3 +-
>   8 files changed, 69 insertions(+), 50 deletions(-)
>   create mode 100644 hw/intc/apic_irqcount.c


