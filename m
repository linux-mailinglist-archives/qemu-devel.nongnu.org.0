Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8BD302483
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 12:57:47 +0100 (CET)
Received: from localhost ([::1]:41804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l40V8-00089U-AR
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 06:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l40Tw-0007by-Vd
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:56:34 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:33957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1l40Tu-00047v-NS
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:56:32 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mxlmw-1lvHWk0sX8-00zEn3; Mon, 25 Jan 2021 12:56:20 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201220112615.933036-1-laurent@vivier.eu>
 <20201220112615.933036-5-laurent@vivier.eu>
 <32a18f3f-4cf1-d12d-9ff1-5a70adcf09cf@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 4/7] m68k: add an interrupt controller
Message-ID: <07f0985b-fa01-f0f9-fb4c-ff1e413a8d54@vivier.eu>
Date: Mon, 25 Jan 2021 12:56:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <32a18f3f-4cf1-d12d-9ff1-5a70adcf09cf@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:B41A7Lygv92R3Kx2fDakyiDEOBqzoR2GXZd8eCw3dsk8a0iOyTn
 wZ/v26W8x8oSKiPxLiveoOV2R94jXeuOlzNE8uqWfrBmh2qyNdOxEM0G00X3YRaz8NgjHcY
 o70QmOiYl5Stdo390yUtVTYdJXfQ8CC4a+FHcJxeRIVETjCOzuxPNVkkzWiy72i7wWTPGkS
 mt3fGOLhj4X67aXpYo8Yg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kz8EzE9ZC20=:RnsioDEb58VPqPI9tp2qvV
 lhqw2ZRJ++O4UyxTLGXa00KPE1A+ibSXxJ/pmk9cbltj9u93usKt2Szjoi5sF+fukYURuwLQc
 pDz7IFxqOMPp5YxKxz+pBQB31KmV3dKz9DsU6e7Jaq4Ayi7y7BkbOUlDoSCXmeg82HUhaMmkQ
 Q5IMK7jxDjbOU49a0dFThbmNsD82jRPcWtZHFpLe4tV7TjNssVEzhqgkj7SD0v92v9mMjXr+k
 gbSrG+36KzZmcEwPt2eV2Vgi8VnM3zknl2wjTpZQAzvIkpOofmG3xEwlif8f62YYi1co5Qt33
 AHDoEoXeBG1nXPrsRqfErwumwNsw6tMsfcDeiFFXf5X5xM5BkN9r5g6Xfyf2vT0hc/lDf/zmt
 fOMemQLu/6ewxJQ/DcdDOVzzNfolEbx+BhaBwLS9PeDLo1S7yrD4RV56xSiWQ6Hw4ISUU0a8E
 X39InpZ6Aw==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/01/2021 à 17:46, Philippe Mathieu-Daudé a écrit :
> On 12/20/20 12:26 PM, Laurent Vivier wrote:
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>> ---
>>  include/hw/intc/m68k_irqc.h |  28 +++++++++
>>  hw/intc/m68k_irqc.c         | 120 ++++++++++++++++++++++++++++++++++++
> 
> Missing MAINTAINERS entries?

new devices are added in patch 7 (where I add the machine and the section in MAINTAINER), but I've
missed this one. Thanks.

> 
>>  hw/intc/Kconfig             |   3 +
>>  hw/intc/meson.build         |   1 +
>>  4 files changed, 152 insertions(+)
>>  create mode 100644 include/hw/intc/m68k_irqc.h
>>  create mode 100644 hw/intc/m68k_irqc.c
>>
>> diff --git a/include/hw/intc/m68k_irqc.h b/include/hw/intc/m68k_irqc.h
>> new file mode 100644
>> index 000000000000..c40b1b4df8fa
>> --- /dev/null
>> +++ b/include/hw/intc/m68k_irqc.h
>> @@ -0,0 +1,28 @@
>> +/*
>> + * SPDX-License-Identifer: GPL-2.0-or-later
>> + *
>> + * QEMU Motorla 680x0 IRQ Controller
> 
> Typo "Motorola".

Thank you (there is another typo: "q800_irq_register_types" that must be renamed)

> Are there any specs to refer at?
> 

There is no specs. It's a (generic) copy of the GLUE device we already have for q800.

I don't update Q800 because the GLUE device may disappear because Q800 uses actually djMEMC that is
also a memory controller (I have that in my q800-dev branch, but for the moment it's only needed for
the MacROM and Mark is working on that).

Thanks,
Laurent



