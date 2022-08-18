Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF99598A86
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 19:34:15 +0200 (CEST)
Received: from localhost ([::1]:53478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOjPK-0002JW-Ec
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 13:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oOjN4-0000eq-Kz; Thu, 18 Aug 2022 13:31:55 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:34731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oOjN2-0007Mq-Bz; Thu, 18 Aug 2022 13:31:54 -0400
Received: by mail-oi1-x22c.google.com with SMTP id q184so2270147oif.1;
 Thu, 18 Aug 2022 10:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=o8SqxisTkGlL2hGUlcH9FDVsBFABjO0p37CDMvViH4Y=;
 b=ZPmlUvjupD0YOf7uhbiLRt4vyRbup1IPlpA3WnTzPhkvHdhXsbLkAAbeZBwycubbhH
 6TzxPeWcKgG781bfciXbvKyjgTkorS3t1Y4sXiT4AubMySacpVvhau8neTwSETXMxsHV
 u43SHQIyhlnaBn6QLtUXygDc2FNvtyVdIrEJneHblWe2l3vQp+9wdeDhPqz4n7ywKRR7
 EpYGNHS4iOCoRt/PPAl9/mKzHsCqtPPSxnXExPoDo4HV+cfanjk5L5pxc4nd28yHl9Tx
 gBL88bXh24Bq9CqGDpL3TVSNAFzd/WhYSdjFZhn8C7ouV3JWN/0J4vNLsDmkzhH5dN2V
 47uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=o8SqxisTkGlL2hGUlcH9FDVsBFABjO0p37CDMvViH4Y=;
 b=x+sQ0/iF4Xil13IHwyVupzx8zKYCD4U+B/w7G0dd9ohXzLSbqIYTX18ypjhq20FQSt
 frKlu/WYjaQVBZS+G0TecDyHUu6qCfHVi0gNOlu2AVhWJk5x65lpQPZRzasOSh+h9+jK
 nqpcplCDgq5IAUn6zkR8WJc1nVERCq0FZJ88JMSfNOwE5qC3ZHWgqcQcC6xY8EbNrCXb
 XEjT6yNldNm9WQp+99e8RMAGNgQvFkUXD5FPvhK59CjxOC7edFeYksHAFSv8FJ0/4FXt
 EcZn9L8uKxXhq6o7wcYLeU2emjrDhgcICmdMDarfohQ1r+n7wiZwyEzP2+PQYN2+Ym9P
 EKYA==
X-Gm-Message-State: ACgBeo05cT4Vz9h/lxjoh0pnc4ZEnACNQm7hrpcihtGE3IQNnErVJ4rV
 1/Uv8lF6+R2dizKdulypfFM=
X-Google-Smtp-Source: AA6agR5jjSj46k7hU+hptOKpv2ImRd9wCegMeEUfRLDsrhfGukGedXynwSiVl6L9ASA8rkvkT3UU2A==
X-Received: by 2002:a05:6808:23c2:b0:345:84e:1c08 with SMTP id
 bq2-20020a05680823c200b00345084e1c08mr3251598oib.270.1660843910156; 
 Thu, 18 Aug 2022 10:31:50 -0700 (PDT)
Received: from [192.168.10.102] ([189.110.115.28])
 by smtp.gmail.com with ESMTPSA id
 el3-20020a056870f68300b00101bc3380a5sm591646oab.12.2022.08.18.10.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 10:31:49 -0700 (PDT)
Message-ID: <dd87ef08-9646-a2f5-9c77-b9761e7ec352@gmail.com>
Date: Thu, 18 Aug 2022 14:31:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 00/31] QOMify PPC4xx devices and minor clean ups
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <cover.1660746880.git.balaton@eik.bme.hu>
 <aed974eb-2723-9a4b-bf36-d16b319bf127@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <aed974eb-2723-9a4b-bf36-d16b319bf127@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
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



On 8/18/22 10:17, Cédric Le Goater wrote:
> Daniel,
> 
> On 8/17/22 17:08, BALATON Zoltan wrote:
>> Hello,
>>
>> This is based on gitlab.com/danielhb/qemu/tree/ppc-7.2
>>
>> This series contains the rest of Cédric's OOM'ify patches modified
>> according my review comments and some other clean ups I've noticed
>> along the way.
> 
> I think patches 01-24 are good for merge.

Queued in gitlab.com/danielhb/qemu/tree/ppc-7.2 (with the v3 of patch 21).


Daniel

> 
>> v2 now also includes the sdram changes after some clean up to simplify
>> it. This should now be the same state as Cédric's series. I shall
>> continue with the ppc440_sdram DDR2 controller model used by the
>> sam460ex but that needs a bit more chnages. But it is independent of
>> this series so this can be merged now and I can follow up later in a
>> separate series.
> 
> I will take a look at the SDRAM changes later.
> 
> Thanks,
> 
> C.
> 
> 
> 
>> Regards,
>> BALATON Zoltan
>>
>> BALATON Zoltan (31):
>>    ppc/ppc4xx: Introduce a DCR device model
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
>>    ppc4xx: Move PLB model to ppc4xx_devs.c
>>    ppc4xx: Rename ppc405-plb to ppc4xx-plb
>>    ppc4xx: Move EBC model to ppc4xx_devs.c
>>    ppc4xx: Rename ppc405-ebc to ppc4xx-ebc
>>    ppc/ppc405: Use an embedded PPCUIC model in SoC state
>>    hw/intc/ppc-uic: Convert ppc-uic to a PPC4xx DCR device
>>    ppc/ppc405: Use an explicit I2C object
>>    ppc/ppc405: QOM'ify FPGA
>>    ppc405: Move machine specific code to ppc405_boards.c
>>    hw/ppc/Kconfig: Remove PPC405 dependency from sam460ex
>>    hw/ppc/Kconfig: Move imply before select
>>    ppc/ppc4xx: Fix sdram trace events
>>    ppc4xx: Fix code style problems reported by checkpatch
>>    ppc440_bamboo: Remove unnecessary memsets
>>    ppc4xx: Introduce Ppc4xxSdramBank struct
>>    ppc4xx_sdram: Get rid of the init RAM hack
>>    ppc4xx: Use Ppc4xxSdramBank in ppc4xx_sdram_banks()
>>    ppc440_bamboo: Add missing 4 MiB valid memory size
>>    ppc4xx_sdram: Move size check to ppc4xx_sdram_init()
>>    ppc4xx_sdram: QOM'ify
>>
>>   hw/intc/ppc-uic.c         |   26 +-
>>   hw/ppc/Kconfig            |    3 +-
>>   hw/ppc/ppc405.h           |  190 +++++--
>>   hw/ppc/ppc405_boards.c    |  384 ++++++++-----
>>   hw/ppc/ppc405_uc.c        | 1078 ++++++++++++-------------------------
>>   hw/ppc/ppc440.h           |    5 +-
>>   hw/ppc/ppc440_bamboo.c    |   63 ++-
>>   hw/ppc/ppc440_uc.c        |   57 +-
>>   hw/ppc/ppc4xx_devs.c      |  670 +++++++++++++++++------
>>   hw/ppc/ppc4xx_pci.c       |   31 +-
>>   hw/ppc/sam460ex.c         |   52 +-
>>   hw/ppc/trace-events       |    3 -
>>   hw/ppc/virtex_ml507.c     |    7 +-
>>   include/hw/intc/ppc-uic.h |    6 +-
>>   include/hw/ppc/ppc4xx.h   |  118 +++-
>>   15 files changed, 1477 insertions(+), 1216 deletions(-)
>>
> 

