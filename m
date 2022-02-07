Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 674594AC94E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 20:19:31 +0100 (CET)
Received: from localhost ([::1]:58470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH9Xt-0000ql-TG
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 14:19:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nH9Fc-0007HK-C1; Mon, 07 Feb 2022 14:00:51 -0500
Received: from [2607:f8b0:4864:20::62d] (port=36752
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nH9FG-0005fR-4k; Mon, 07 Feb 2022 14:00:19 -0500
Received: by mail-pl1-x62d.google.com with SMTP id x3so11875300pll.3;
 Mon, 07 Feb 2022 11:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3cBu3zciSkpHxRphPpA+dWtNulAQOhgAUbCCR3yQs88=;
 b=DiQOCyooGnpdL/A1l3rdsqJnC1NgbySpNozAqU9JyfHXg514+Zkww4UzmuOjbh59a9
 bzl6Buo5TsB3/bUX6PtDmwWnF18xc/9936/f1vMtGlcDY1Cs24QNB4hhF6R0p0cXKRgY
 XV7wjmw+GZVFp796OsQiW2Ww9AwoZRAaif/+7+w7OgXGgJjq6N2gMFWaO6/r0+aWZMoo
 tLUA3PuSSnsRosGRhgw04JBPs72POntK9gI1M7aSI1FOM5u4agtOVck0/bllctRPW6wD
 yMy5JuDDpb857aJ476w1xsTP8O07e5gR45wVVNmOO9MAPZMEm6WxnlstbTob/B+JJru7
 3tqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3cBu3zciSkpHxRphPpA+dWtNulAQOhgAUbCCR3yQs88=;
 b=piw31azHl3J763J+SGEiKKwQN8MowSypZ71oTg50CXu8WMjytjPn2moK3pAxHWSUWi
 sV4LhccAEhQjHCagbTZF6UT4fxbgO5tPnmWvzYZWmhU7lfwUKZqXaFEZHdVeJxFiDpH3
 sHq8WyvgoDUj8B1x/6/GBPtxsMsOflF6vrQ2J6R3v4CC48nrn1vatrj0C7f9sS2igKQ6
 BPXjG8Y0Aoypj8ppk4gkc/qF68ibEKlSw5EpoCk/LnDqZMBkkd97FGnDpL7C44gpsv4T
 GKV5KAelv/TRxT43WmKZVtBxb+O3425FvC/hEQ2/TzQKkZPOtyEAIJHq71Lhi0xlo/0q
 xD4g==
X-Gm-Message-State: AOAM533yiDLqyAJDioWhirbINGglSbK7qn6A9GgfebndWqe0EGDkyDcG
 ntCwxSNZvh4Slw8bcODf+Pc=
X-Google-Smtp-Source: ABdhPJwSsWSrHQgC7+YG8j35k3kPMtq9VWu70JbZimqLGSbUZEyuokl5W6fFZ6qC/Jb22DMCm3BNoA==
X-Received: by 2002:a17:902:cec5:: with SMTP id d5mr857686plg.96.1644260407338; 
 Mon, 07 Feb 2022 11:00:07 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id y15sm12665760pfi.87.2022.02.07.11.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 11:00:06 -0800 (PST)
Message-ID: <1d1cf0b8-d827-3d68-6b81-f334020d7606@amsat.org>
Date: Mon, 7 Feb 2022 19:59:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 06/16] hw/arm/xlnx-zcu102: Don't enable PSCI conduit when
 booting guest in EL3
Content-Language: en-US
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexander Graf <agraf@csgraf.de>
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
 <cc73e2f0-97e1-f9c5-1a89-45ff2b0a2aeb@amsat.org>
 <0da64aa5-97b3-540b-0fc9-cb9bf670d487@csgraf.de>
 <CAJy5ezrEFifPUWUmSmEmqqUsSdeQpEG+KjyCDJFJROFSKGFDVA@mail.gmail.com>
In-Reply-To: <CAJy5ezrEFifPUWUmSmEmqqUsSdeQpEG+KjyCDJFJROFSKGFDVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62d.google.com
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

On 7/2/22 19:13, Edgar E. Iglesias wrote:
> 
> On Mon, Feb 7, 2022 at 5:24 PM Alexander Graf <agraf@csgraf.de 
> <mailto:agraf@csgraf.de>> wrote:
> 
> 
>     On 07.02.22 17:06, Philippe Mathieu-Daudé wrote:
>      > On 7/2/22 16:59, Alexander Graf wrote:
>      >>
>      >> On 07.02.22 16:52, Edgar E. Iglesias wrote:
>      >
>      >>> Both Versal and ZynqMP require MicroBlaze firmware to run the
>      >>> reference implementations of Trusted Firmware. We never supported
>      >>> this in upstream QEMU but we do support it with our fork (by
>     running
>      >>> multiple QEMU instances co-simulating).
>      >>>
>      >>> Having said that, we do have tons of EL3 test-cases that we use to
>      >>> validate QEMU that run with EL3 enabled in upstream.
>      >>>
>      >>> So there's two user flows:
>      >>> 1. Direct boots using QEMUs builtin PSCI (Most users use this
>     to run
>      >>> Linux, Xen, U-boot, etc)
>      >>> 2. Firmware boot at EL3 without QEMUs builtin PSCI (Mostly used by
>      >>> test-code)
>      >>>
>      >>> Number #2 is the one affected here and that by accident used to
>     have
>      >>> the builtin PSCI support enabled but now requires more power
>     control
>      >>> modelling to keep working.
>      >>> Unless I'm missing something, the -kernel boots will continue
>     to use
>      >>> the builtin PSCI implementation.
>      >>
>      >>
>      >> So nobody is using upstream QEMU to validate and prototype
>      >> ATF/EL1s/EL0s code? That's a shame :). I suppose there is little
>      >> value without the bitstream emulation and R cluster. Do you have
>      >> plans to bring multi process emulation upstream some day to enable
>      >> these there?
>      >
>      > The R cluster is already in mainstream, isn't it?
> 
> 
>     In that case, wouldn't it make sense to build an emulation model of the
>     PMU behavior so that normal ATF works out of the box?
> 
> 
>     Thanks,
> 
>     Alex
> 
> 
> Yes, that makes sense and there are several ways to implement it. To 
> fully support the programmability of the PMU we'd need to model the 
> MicroBlazes together with the ARM cores.
> 
> But PMU support does not really conflict with this patch series, or is 
> there something I'm missing?

My understanding is Alex generically wonders about code coverage, not
about the ZynqMP in particular :)

