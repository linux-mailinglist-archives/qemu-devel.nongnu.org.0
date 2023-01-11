Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443506656C3
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 10:02:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFWz6-00023G-Tb; Wed, 11 Jan 2023 04:01:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWyz-0001wE-3R
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:01:17 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFWyw-0000vR-TK
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:01:16 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so12065632wms.4
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 01:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YseKiHzchM/E9HI4JXEw8KCMkdc46Yvwu+u0m2DvUvY=;
 b=FOJgbjh3VQc3EPHODsOOrZSA9ecu6EuAQ8GwyCasnQNuUesWSIltizJM5Xx/w9p7YZ
 QaGhwzfQOz1xRWRYqd3o06A5bhyvo0TuSniHMr2ewgxvt1IxkofCfiX8snYWg46ZcP32
 /OXOIk+AnnkIoT6iOWXiezL+pMbPPMXizbMdzgNBJ0FuqhGIs2Zh4FIqhjGb59Z6zP4k
 +1Z8+Xd/CRk8LJ71SbjC+t46qHefS3ihlvKpRfb5Sj78no9nSJwsMo2Z+5x4xJUn2YSb
 Uvlbs8x9R4qgY4XKlYg2Q6ro3TSNDBHebNA32+q8iyjvsja9f3uGIPnkry5r/G8+4JW1
 /npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YseKiHzchM/E9HI4JXEw8KCMkdc46Yvwu+u0m2DvUvY=;
 b=5cc6z97Pef9MrzlENBpH/OPlqcz4n819kti0wKK73rU9rYoVwxJ7+jnUQ+DBOoxWgE
 OVD+QvXMn3Cqg1EXiUSjXQJsc2vBOhWvKOUxAHdiquPhLn3Zm9cKyWNF3bZEhsm3uoti
 tVIg9Qvr3QcELeY/K3NRWlNEdXvdlxEaq4kFoH3MAJJzEDh1bm5JJyeiRkveSb/hZAwm
 TQ9q6mzhDY5AVGDtACNQF4XmsuLMtsXfmYQuurDmUNaGwKWH00kiavtARGASJVlUCfcW
 G1ww+tlCbJ2nm/j2f2MlFgyFNwrWlovsnB89+lAhMyP76T4WpaFCNhbrMXm2H4TCbdex
 Jvfg==
X-Gm-Message-State: AFqh2kpPs3TpAS6vHGetYsVejItSjFfb00XhG7QYD5UZz+EJIrZbA8lM
 6P5snLjb9YjWsIhvu6uT6JtsMQ==
X-Google-Smtp-Source: AMrXdXvlwEI9vUXnKJ5Bs8D+NjYCsAbLmA7+L9qnNB6jmuWUywN7nm6is7+SSkhif474ZWKeUPxTLg==
X-Received: by 2002:a05:600c:2e44:b0:3d3:4406:8a3c with SMTP id
 q4-20020a05600c2e4400b003d344068a3cmr51011132wmf.32.1673427672934; 
 Wed, 11 Jan 2023 01:01:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c469000b003d9b87296a9sm24407307wmo.25.2023.01.11.01.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 01:01:12 -0800 (PST)
Message-ID: <ab55c910-5da0-01d9-a097-aaf44ee18cc6@linaro.org>
Date: Wed, 11 Jan 2023 10:01:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 12/18] hw/arm/digic: Replace object_initialize(ARMCPU) by
 object_new(ARMCPU)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, ale@rev.ng,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Rob Herring <robh@kernel.org>,
 Antony Pavlov <antonynpavlov@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Beniamino Galvani <b.galvani@gmail.com>
References: <20230110164406.94366-1-philmd@linaro.org>
 <20230110164406.94366-13-philmd@linaro.org>
 <CAFEAcA-yEN3F3p6W16vfML4dAHzdwSnOS=759MkqQ0qDpArnaw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-yEN3F3p6W16vfML4dAHzdwSnOS=759MkqQ0qDpArnaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 10/1/23 17:52, Peter Maydell wrote:
> On Tue, 10 Jan 2023 at 16:45, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Replace the ARMCPU field in DigicState by a reference to
>> an allocated ARMCPU. Instead of initializing the field
>> with object_initialize(), allocate it with object_new().
>>
>> As we don't access ARMCPU internal fields or size, we can
>> move digic.c from arm_ss[] to the more generic softmmu_ss[].
> 
> I'm not really a fan of this, because it moves away
> from a standard coding pattern we've been using for
> new QOM 'container' devices, where all the sub-components
> of the device are structs embedded in the device's own
> struct. This is as opposed to the old style which tended
> to use "allocate memory for the sub-component and have
> pointers to it". It means the CPU object is now being
> treated differently from all the timers, UARTs, etc.

OK, at least you don't object on patches 1-11/13 :)

I might still post the other parts of this current approach to not
lose them in case I can't find a better way.

Thanks,

Phil.


