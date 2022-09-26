Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8CF5EAFE7
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:30:00 +0200 (CEST)
Received: from localhost ([::1]:35564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocsrf-0001b0-CG
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocrxw-0001Dl-TF; Mon, 26 Sep 2022 13:32:27 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:38578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocrxv-0001BG-4Q; Mon, 26 Sep 2022 13:32:24 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1278624b7c4so10157490fac.5; 
 Mon, 26 Sep 2022 10:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=1COUk03JMQc+RqyoiqQMW43SL7Ckc+bGAlfjSN2dOIs=;
 b=XykdnyBi6lVFzHqTtoidWdimO6WeQWkjx5J9NJc0ieOGh0Hx4P3fMvzCBVt87O4+RI
 Iq1b8FZKrulEZjeBokglY33HPsG7Ys+PbETwdnEJAuK5hjtYiZriDpjxHLlxiIFYZGZa
 K/BSTMYp3s/A5OA2QLX9urf2wxnHj9SW3cGxXsNCoDOH7h7q6SRJfCJ2GaAxmRAiYDMN
 +o6htsZoVGE+70wO94ISf4+ww5UL7nTdExgJ7gB/l12ubOGL3NEnmqiFC2ucFOnQdPLa
 zXTsUTP2gt3FXaMJF6hbp1g6H5Ewwyi1VnVIirzD7NsvaktjEgQB94LlAv0Y+/J9gzYz
 zzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=1COUk03JMQc+RqyoiqQMW43SL7Ckc+bGAlfjSN2dOIs=;
 b=kpXRCoqqX8jQIihYh3LaeoCzMeUbT+Pn6mTG38wN+vMcoAf4pJIj9t8WMUn2MnneV9
 VDt3o6oUDbuLBmG9RxyNAApWQaK++of8QMI5fpPawPAvm1zCm1mi75i/P1dWtY3j2TqR
 qVQ/4JOABAelvwjRvuGdenSqLuEdO9zbXji5IArbyCvqoYvlNzZrYRY3JaS7bB60z4L3
 ypuogrhjyiaccCH3KD417wvojBUQ/aEqFnLJpz5kkzp0k0MIl0XPe3SQpFtmsl8zI6p7
 EvqVWIyL7Bf2EEPZFcF1JgQPnC+KfNAkNfo3xwq2L8Ceb+zTZmAX4sBabhS2tHNfuhQ9
 a0QA==
X-Gm-Message-State: ACrzQf3ek8FgYX2D6ECOhugoQslQGxoud31g/Nl03N74OJEHnXCDlw0M
 6jSZLA+Av21Gyva3ULxCHa4=
X-Google-Smtp-Source: AMsMyM4c8/gf9yMB/yLG85OZtpniiw01NfCRIW8+3jQQuhWCM9Oz9eLJK/6qLMg1FudotnAhjLf1Dg==
X-Received: by 2002:a05:6870:562c:b0:127:bbe4:3f35 with SMTP id
 m44-20020a056870562c00b00127bbe43f35mr19700664oao.284.1664213540843; 
 Mon, 26 Sep 2022 10:32:20 -0700 (PDT)
Received: from [192.168.10.102] (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 l9-20020a056870218900b0012b298699dbsm9325106oae.1.2022.09.26.10.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 10:32:20 -0700 (PDT)
Message-ID: <692bbaaf-2e34-8827-f2a6-73bf5c599099@gmail.com>
Date: Mon, 26 Sep 2022 14:32:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v6 00/25] ppc4xx_sdram QOMify and clean ups
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, Peter Maydell <peter.maydell@linaro.org>
References: <cover.1664021647.git.balaton@eik.bme.hu>
 <6ad5fa00-ac5c-3fd9-48fd-c2cb93daeb21@gmail.com>
In-Reply-To: <6ad5fa00-ac5c-3fd9-48fd-c2cb93daeb21@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/26/22 14:09, Daniel Henrique Barboza wrote:
> Zoltan,
> 
> I've started to push some patches to ppc-next. Patches 1-13 are already pushed
> and I'm running tests on patches 14-17. Assuming everything is ok we'll be
> left with patches 18-25 to work on.

Patches 01-17 queued in ppc-next.

If a next version is needed you can resend just 18-25.


Thanks,


Daniel

> 
> 
> Thanks,
> 
> 
> Daniel
> 
> On 9/24/22 09:27, BALATON Zoltan wrote:
>> This is the end of the QOMify series started by Cédric. This series
>> handles the SDRAM controller models to clean them up, QOMify and unify
>> them and at least partially clean up the mess that has accumulated
>> around these in the past. This includes the not yet merged patches
>> from the last series and new ones that change the DDR2 version used by
>> sam460ex.
>>
>> v6: Split patch moving sdram controller models together into smaller steps
>> v5: Add functions the enable sdram controller and call it from boards
>> v4: address more review comments
>> v3: Fix patches that got squashed during rebase
>> v2: address some review comments and try to avoid compile problem with
>> gcc 12.2 (untested)
>>
>> BALATON Zoltan (25):
>>    ppc440_bamboo: Remove unnecessary memsets
>>    ppc4xx: Introduce Ppc4xxSdramBank struct
>>    ppc4xx_sdram: Get rid of the init RAM hack
>>    ppc4xx: Use Ppc4xxSdramBank in ppc4xx_sdram_banks()
>>    ppc440_bamboo: Add missing 4 MiB valid memory size
>>    ppc4xx_sdram: Move size check to ppc4xx_sdram_init()
>>    ppc4xx_sdram: QOM'ify
>>    ppc4xx_sdram: Drop extra zeros for readability
>>    ppc440_sdram: Split off map/unmap of sdram banks for later reuse
>>    ppc440_sdram: Implement enable bit in the DDR2 SDRAM controller
>>    ppc440_sdram: Get rid of the init RAM hack
>>    ppc440_sdram: Rename local variable for readability
>>    ppc4xx_sdram: Rename functions to prevent name clashes
>>    ppc440_sdram: Move RAM size check to ppc440_sdram_init
>>    ppc440_sdram: QOM'ify
>>    ppc440_uc.c: Move some macros to ppc4xx.h
>>    ppc440_uc.c: Remove unneeded parenthesis
>>    ppc440_uc.c: Move DDR2 SDRAM controller model to ppc4xx_sdram.c
>>    ppc4xx_devs.c: Move DDR SDRAM controller model to ppc4xx_sdram.c
>>    ppc4xx_sdram: Move ppc4xx_sdram_banks() to ppc4xx_sdram.c
>>    ppc4xx_sdram: Use hwaddr for memory bank size
>>    ppc4xx_sdram: Rename local state variable for brevity
>>    ppc4xx_sdram: Generalise bank setup
>>    ppc4xx_sdram: Convert DDR SDRAM controller to new bank handling
>>    ppc4xx_sdram: Add errp parameter to ppc4xx_sdram_banks()
>>
>>   hw/ppc/meson.build      |   3 +-
>>   hw/ppc/ppc405.h         |   8 +-
>>   hw/ppc/ppc405_boards.c  |  13 +-
>>   hw/ppc/ppc405_uc.c      |  33 +-
>>   hw/ppc/ppc440.h         |   4 -
>>   hw/ppc/ppc440_bamboo.c  |  25 +-
>>   hw/ppc/ppc440_uc.c      | 267 +-------------
>>   hw/ppc/ppc4xx_devs.c    | 413 ----------------------
>>   hw/ppc/ppc4xx_sdram.c   | 753 ++++++++++++++++++++++++++++++++++++++++
>>   hw/ppc/sam460ex.c       |  44 +--
>>   hw/ppc/trace-events     |   1 +
>>   include/hw/ppc/ppc4xx.h |  65 +++-
>>   12 files changed, 859 insertions(+), 770 deletions(-)
>>   create mode 100644 hw/ppc/ppc4xx_sdram.c
>>

