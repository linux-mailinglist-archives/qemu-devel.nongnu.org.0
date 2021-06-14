Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C633A6B7D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 18:17:48 +0200 (CEST)
Received: from localhost ([::1]:40798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lspHX-0005tP-3W
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 12:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lspGM-00052b-1r; Mon, 14 Jun 2021 12:16:34 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:45717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lspGK-0005tL-0A; Mon, 14 Jun 2021 12:16:33 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 v206-20020a1cded70000b02901a586d3fa23so301319wmg.4; 
 Mon, 14 Jun 2021 09:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E+naFnkTSRmRfd3F8hhwPsH4QJ9sXeaqxMI2TVhvYu8=;
 b=qFCOH5bdtTqPKHjNsniz5a2T4lokjs4h0R5hI2oWShbWzIhQVQsviCzt9yn9doQCl/
 Nj6nEdklWLbBzcxlGwJxAXe4Ofq7uyxhnBZKYqJNb7DkuXghsaa/bzmyTaS/EElzmTZn
 JMc9BjUWy4A/8He/p1mzp2Cwq+guGhcATe3/kXDh7RaHZ3pLmXhc44u1ba4uirxPdyIJ
 3lnbHYawyoDnNAFOZYsRciEjsbz9Mqj7viG/0JdLJomfk8l8x8YfUAl/TcE0/7zPJjqI
 QhdlNR60o3dmmtqK6hKAfAfLsprHEWGQ1UkXdxMdfqNYXLxAQqmCFP5rm2ChJO35MIWb
 WtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E+naFnkTSRmRfd3F8hhwPsH4QJ9sXeaqxMI2TVhvYu8=;
 b=EXjIcfkGjL16BxC/GJEYBJSR2JeRAWdTFIDsaBgs180nkOqzErqCCCL/38G75os2xz
 HVXZa4FjsOIuKvo1Sc01pijDDcX/4XW2ZFGcfPHd5Jgplq2E011O9e8WDSOFEckiR+H7
 6oareOUrKohY4CgT71ihkP6cFjrW8ZHNZWm824Y90zZo5BDiYVA5wtqakD26i3ExTksI
 RzwIGXQw2sVrexQDPXkp0tmx5j0M1NOebCkoFx3di60zivsWS5R616ix9goQ+Uhu/tbT
 wfaVpKhxk6F42ZtwMJHImDVQT6GpR9XZWyzmPs0ulKG6R7+PHIKYr7N2Iy4byctUDt0Y
 r2UA==
X-Gm-Message-State: AOAM530tRXHlMkELx2TLKyD7vyKDYrBgfn0gvm2KHiVN7YKRWDvT26Ol
 YtvoYGcQi7kdmxcNxxVcjHo=
X-Google-Smtp-Source: ABdhPJz9ePfCFWjMlByGoDfkYBBMEvPMuMUAnKuzlJ7tJ0ALml3fFs0WXJNxJIfQMa14Bq1G7NUezg==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr33809787wmk.97.1623687390280; 
 Mon, 14 Jun 2021 09:16:30 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id h9sm13254629wmb.35.2021.06.14.09.16.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 09:16:29 -0700 (PDT)
Subject: Re: [PATCH 0/2] STM32VLDISCOVERY Machine Model
To: Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20210608161028.4159582-1-erdnaxe@crans.org>
 <CAFEAcA_Dx+7Gt-7bzRu7t27xQs-59oo2jnpybroPqN-46ak0Kw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d9833bea-412b-1c45-660b-80d138d50658@amsat.org>
Date: Mon, 14 Jun 2021 18:16:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Dx+7Gt-7bzRu7t27xQs-59oo2jnpybroPqN-46ak0Kw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:STM32F100" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 6:05 PM, Peter Maydell wrote:
> On Tue, 8 Jun 2021 at 17:10, Alexandre Iooss <erdnaxe@crans.org> wrote:
>>
>> This patch series adds the STM32VLDISCOVERY Machine to QEMU
>>
>> Information on the board is available at:
>> https://www.st.com/en/evaluation-tools/stm32vldiscovery.html
>>
>> Alexandre Iooss (2):
>>   stm32f100: Add the stm32f100 SoC
>>   stm32vldiscovery: Add the STM32VLDISCOVERY Machine
>>
>>  MAINTAINERS                             |  12 ++
>>  default-configs/devices/arm-softmmu.mak |   1 +
>>  hw/arm/Kconfig                          |  10 ++
>>  hw/arm/meson.build                      |   2 +
>>  hw/arm/stm32f100_soc.c                  | 182 ++++++++++++++++++++++++
>>  hw/arm/stm32vldiscovery.c               |  66 +++++++++
>>  include/hw/arm/stm32f100_soc.h          |  58 ++++++++
>>  7 files changed, 331 insertions(+)
>>  create mode 100644 hw/arm/stm32f100_soc.c
>>  create mode 100644 hw/arm/stm32vldiscovery.c
>>  create mode 100644 include/hw/arm/stm32f100_soc.h
> 
> Looks generally OK to me, but cc'ing Alistair who wrote the
> STM32F405 model in case he wants to have a look at it.

The SoC in the STM32Fxxx family seems very similar.

Maybe OK for this one but next machines should consider reuse
components. Alexandre, if you plan to add more SoC, you might
want to look at how the abstract TYPE_ATMEGA_MCU handles multiples
MCU of the same family.

Regards,

Phil.

