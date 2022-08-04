Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0363589A58
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 12:17:50 +0200 (CEST)
Received: from localhost ([::1]:50032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJXvJ-0003jD-C8
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 06:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJXlV-0002cR-JE; Thu, 04 Aug 2022 06:07:50 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:45971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJXlT-0003DT-Nx; Thu, 04 Aug 2022 06:07:41 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id m67so13005179vsc.12;
 Thu, 04 Aug 2022 03:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=TP3WX0uY4n52iFxkdxdzU/hBQRpMMo/Y8CLSE2b3UBU=;
 b=TYDEo4UnbtKK/VSOnGo4vxwaRBdg7/gQDajQJfUrQvGAn2X8ZbJIfpFDicbq0noEvL
 PMLSi+CefqBCGvjTxrNGWJfVfQKWnRoutAA0x4BFgttl7Vg+zcgDuEcCR1I0u+bPQGPA
 cSx2OKSgqkMH40X6jBESQJb0REWqfjUvfLU/wBhVfkNNlOqv/759bN1qAWfZ6uKpy5Mw
 yWSZwMqUMpgtimdgFvFZmPrxJyFSlrgso0nmlTcekUPDLbzxLFjgMklpfCBPpS60eMNv
 TrmfrxDjwex7xw+dReQD/rbTwlquIOYwQgeWM0zzOgUSp5JGP1gevsh8lfJECVNqmMpH
 HvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=TP3WX0uY4n52iFxkdxdzU/hBQRpMMo/Y8CLSE2b3UBU=;
 b=b0CyF2p9dp62izfhvfUh3oNB139hYSXMmvVLX0S+3+dUEgw2Z4ZscEm4sOvvWaDE2f
 eWr/wlk0qn1iryrBs8CPsWK4rnpfuGRYSH/0ZqNObF8pPf6MusrcuiP2j5rtrR0iS0aU
 Tms2/+UwCKDfhJo/L6hTi4YTjgVK+ln21NXz9LdmJL8qjjuMa/mLADbn/GZaXI8S9gTe
 7GRVlDzNNJh9Q/aWs/KkH9dK0k0fr0aIbCc8huNWjb6MtGaODIJjWeG2Pnz6jLd9h3H1
 7qeKrILeFI1jdfWjOjNTn6wZo41TkEfQG8LQgWDF28Vdg6lVmpNxVA5CniMXvMdcKT2S
 P8Lw==
X-Gm-Message-State: ACgBeo00rxQsjQPw+SrdZkDt0YmJTHSakYZouH4TBqOrhReP7arcXMJU
 D462vANMjhOop3a0DsT3Bx6wvSVUolQ=
X-Google-Smtp-Source: AA6agR7OJTCS6COH2znIlj+NSkUIpDdXh//bmlbFpgOH95YniRP5B0iXgIvNuqYIwbJ45YInmQmCuQ==
X-Received: by 2002:a05:6102:2321:b0:357:c4aa:9877 with SMTP id
 b1-20020a056102232100b00357c4aa9877mr303038vsa.56.1659607657857; 
 Thu, 04 Aug 2022 03:07:37 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:52e2:fb25:323c:5709:7237?
 ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 f64-20020a676a43000000b0038712af0dbesm300032vsc.22.2022.08.04.03.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 03:07:37 -0700 (PDT)
Message-ID: <d240289b-f03b-9678-6b7a-2a710ad8a82c@gmail.com>
Date: Thu, 4 Aug 2022 07:07:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 00/20] ppc: QOM'ify 405 board
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220803132844.2370514-1-clg@kaod.org>
 <6e3b8380-56bb-c9af-47f3-c37611484917@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <6e3b8380-56bb-c9af-47f3-c37611484917@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 8/4/22 03:07, Cédric Le Goater wrote:
> Daniel,
> 
> On 8/3/22 15:28, Cédric Le Goater wrote:
>> Hello,
>>
>> Here is large series QOM'ifying the PPC405 board. It introduces a new
>> generic machine and SoC models, converts the current device models to
>> QOM and populates the SoC. The process is quite mechanical without too
>> much issues to handle. The noisy part is the initial patch introducing
>> the SoC realize routine.
>>
>> What's left ?
>>
>> * The DCR read/writre handlers are attached in table to the CPU
>>    instance. We could probably rework the whole with a specific address
>>    space and memory regions handling the implemented registers. I don't
>>    think this is necessary.
>>
>> * the SDRAM mappings are very baroque and certainly could be simplified.
>>    I think we should QOMify the ppc440 machines before addressing this
>>    part.
> 
> 
> I will resend a v3 taking into account the comments (and fixes) from you
> and Zoltan.

I'll get whatever pending fixes we have for the freeze and send a PR including
the mal_irqs[] fix today. I'll be less stuff to worry about for this series.


Daniel

> 
> Also, the PPC405 controller has 2 SDRAM banks, I should try to model
> that with a single bank default. The ppc4xx_sdram_init() routine is
> a bit of a pain to do anything clean really.
> 
> 
> Thanks,
> 
> C.
> 
> 
> 
>> Changes in v2 :
>>
>>   - docs/about/removed-features.rst update
>>   - Fix compile breakage (uic)
>>   - Fix CPU reset, which breaking u-boot boot
>>   - Changed prefix of memory regions to "ppc405"
>>   - Reduced the number of RAM banks to 1. Second was a dummy one to
>>     please ppc405ep_init()
>>
>> Cédric Le Goater (20):
>>    ppc/ppc405: Remove taihu machine
>>    ppc/ppc405: Introduce a PPC405 generic machine
>>    ppc/ppc405: Move devices under the ref405ep machine
>>    ppc/ppc405: Introduce a PPC405 SoC
>>    ppc/ppc405: Start QOMification of the SoC
>>    ppc/ppc405: QOM'ify CPU
>>    ppc/ppc405: QOM'ify CPC
>>    ppc/ppc405: QOM'ify GPT
>>    ppc/ppc405: QOM'ify OCM
>>    ppc/ppc405: QOM'ify GPIO
>>    ppc/ppc405: QOM'ify DMA
>>    ppc/ppc405: QOM'ify EBC
>>    ppc/ppc405: QOM'ify OPBA
>>    ppc/ppc405: QOM'ify POB
>>    ppc/ppc405: QOM'ify PLB
>>    ppc/ppc405: QOM'ify MAL
>>    ppc/ppc405: QOM'ify FPGA
>>    ppc/ppc405: QOM'ify UIC
>>    ppc/ppc405: QOM'ify I2C
>>    ppc/ppc4xx: Fix sdram trace events
>>
>>   docs/about/deprecated.rst       |   9 -
>>   docs/about/removed-features.rst |   6 +
>>   docs/system/ppc/embedded.rst    |   1 -
>>   hw/ppc/ppc405.h                 | 210 ++++++++-
>>   include/hw/ppc/ppc4xx.h         |  29 ++
>>   hw/ppc/ppc405_boards.c          | 366 ++++-----------
>>   hw/ppc/ppc405_uc.c              | 799 +++++++++++++++++++-------------
>>   hw/ppc/ppc4xx_devs.c            | 124 +++--
>>   MAINTAINERS                     |   2 +-
>>   9 files changed, 894 insertions(+), 652 deletions(-)
>>
> 

