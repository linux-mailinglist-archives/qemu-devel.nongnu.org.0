Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFA24AC545
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 17:17:39 +0100 (CET)
Received: from localhost ([::1]:53684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH6ht-0003Ef-W0
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 11:17:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nH6X0-0004Dg-7W; Mon, 07 Feb 2022 11:06:22 -0500
Received: from [2607:f8b0:4864:20::436] (port=41644
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nH6Wx-0007YW-WF; Mon, 07 Feb 2022 11:06:21 -0500
Received: by mail-pf1-x436.google.com with SMTP id i30so13715098pfk.8;
 Mon, 07 Feb 2022 08:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qJ/GakoKhkSqpKMIem6tPqLETidwhvfmDZeaIsRNjpM=;
 b=ZnKYf6NffylCiV9ou4MYukvcUmf3dgS2T0uIiT7bYkON1PXvXBuEs/hWbEAlaDHSPz
 KuXEQtt1+NH0U6zCEXpw3++GS/P1QH+z2rsX65w1twlN19yqd+LYnmZC29d/Bg+SO+5p
 J9Me20AlyoQmTWxNt3jCA4c/byX8FzEOgHJZl4qUmPY9M6/mVK96b+JZOUs+mZLl9Srm
 9bvqVfRsZx7/6o58jSBov2SDV9yxYB4vktE0XXKd7luCqXe1DOzXo0HxYTWYKJNeo4tK
 mSmmQxF7OiVz/iFwyevX+pAxsgmcqWodm2utphIqItSMqG9UQSVRP29Cpgvg2P9L5qhm
 mP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qJ/GakoKhkSqpKMIem6tPqLETidwhvfmDZeaIsRNjpM=;
 b=QZwlDtd2XG9GIP623x4yygxeUhwjX6Zd5PNczIz0kj4OTrIxTs/r/ZMKwu5A4QiOS8
 TLgiG9oJWbLhnR9M0p05OcQaLKvH2Efxnou66XTiT60pehZfA96oudEyzM1jah/aSjp4
 YI6qZ0jTBurire2D4apSUGZ7wMbraIdWE8W41VikY3RW77XfUOTy0cfw9hStSUuhaOj4
 QwsMPPmstqdmYlJ/dD0xZSZU+fgowVySJtmqvy+Qylvp8HotQqq5F/2UmCdFnXdLsjDb
 302xF54U1hKPHsxcb7ixWT3G7FBvQOZ0nW4n5rNk2zcNVNx1ABrea07Dvrl4ae8/eyth
 opNQ==
X-Gm-Message-State: AOAM532H13OdB+bNF+sfY7ufu3aX14N08MP1SbClF+8arjpCcFuNJ1xC
 mNT6fDgPh1jY/fmU9XT1nuU=
X-Google-Smtp-Source: ABdhPJyXbvEeyFvPRGoucUaIqjNLBn2klC4VyN6DYFGtxtz87ywKkH7kCf6ltSFfiqm+TCHR3HlVRQ==
X-Received: by 2002:a63:96:: with SMTP id 144mr71909pga.19.1644249974881;
 Mon, 07 Feb 2022 08:06:14 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id pf4sm24884455pjb.35.2022.02.07.08.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 08:06:14 -0800 (PST)
Message-ID: <cc73e2f0-97e1-f9c5-1a89-45ff2b0a2aeb@amsat.org>
Date: Mon, 7 Feb 2022 17:06:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 06/16] hw/arm/xlnx-zcu102: Don't enable PSCI conduit when
 booting guest in EL3
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Rob Herring <robh@kernel.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting
 <kfting@nuvoton.com>, Alistair Francis <alistair@alistair23.me>,
 Andre Przywara <andre.przywara@arm.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-7-peter.maydell@linaro.org>
 <2c67bde5-65b2-0af0-afde-7353a4fe2a1b@csgraf.de>
 <CAFEAcA9DcHXRkA7gCihU6LrOc40EOHnVnTeEcf4+xSfG22eJ-g@mail.gmail.com>
 <44ec9504-a7ef-6805-ae94-4435e5a37735@csgraf.de>
 <CAJy5ezqUtLphzH_WKmW8dR34=k-g5dmuevuZY42GfnD-R-uCqg@mail.gmail.com>
 <a6caa3b0-89ae-d482-62f5-2cada740a60e@csgraf.de>
In-Reply-To: <a6caa3b0-89ae-d482-62f5-2cada740a60e@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 7/2/22 16:59, Alexander Graf wrote:
> 
> On 07.02.22 16:52, Edgar E. Iglesias wrote:

>> Both Versal and ZynqMP require MicroBlaze firmware to run the 
>> reference implementations of Trusted Firmware. We never supported this 
>> in upstream QEMU but we do support it with our fork (by running 
>> multiple QEMU instances co-simulating).
>>
>> Having said that, we do have tons of EL3 test-cases that we use to 
>> validate QEMU that run with EL3 enabled in upstream.
>>
>> So there's two user flows:
>> 1. Direct boots using QEMUs builtin PSCI (Most users use this to run 
>> Linux, Xen, U-boot, etc)
>> 2. Firmware boot at EL3 without QEMUs builtin PSCI (Mostly used by 
>> test-code)
>>
>> Number #2 is the one affected here and that by accident used to have 
>> the builtin PSCI support enabled but now requires more power control 
>> modelling to keep working.
>> Unless I'm missing something, the -kernel boots will continue to use 
>> the builtin PSCI implementation.
> 
> 
> So nobody is using upstream QEMU to validate and prototype ATF/EL1s/EL0s 
> code? That's a shame :). I suppose there is little value without the 
> bitstream emulation and R cluster. Do you have plans to bring multi 
> process emulation upstream some day to enable these there?

The R cluster is already in mainstream, isn't it?

