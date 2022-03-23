Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C4C4E5AE0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 22:49:32 +0100 (CET)
Received: from localhost ([::1]:34294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX8rD-0004nS-5B
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 17:49:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nX8pv-0003Jw-C8; Wed, 23 Mar 2022 17:48:11 -0400
Received: from [2001:4860:4864:20::35] (port=41479
 helo=mail-oa1-x35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nX8ps-0005y6-Kc; Wed, 23 Mar 2022 17:48:11 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-dd9d3e7901so3110252fac.8; 
 Wed, 23 Mar 2022 14:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BVEd7obbmlFjVY+qTNZgC5w59DppQBSiV5o/Yn+7Xvg=;
 b=qso3xBLjXf+k0i1nlAt5xajJ2XwGNsEkN6N9D5ww2FTo2ypSeblS2zSsBM2HulIeWF
 ugxSDQMZEN5k18tJAQomjlfILb1GyjdZxHY28YKblCLvtNr2swUYlk3f9JDOnGD3/xVS
 7Gqa6JP6eSbHko11GWLlEeFRTx3y3YEWCn2ykLk6ooua/bOKbAMa6mTZt4bKlxRoOPTY
 xscl3lXfSyQjuUytpK+FH3WZAFldrHrtgPkk2fwgRT8MbUtH7zzt83w7KEjNWBwegCkc
 RodaReUjFEMmQtLk7lCOI114vWnS50Az1VX3o0+GVqxvE6xYMzklUD6fKMd9utsvdIBR
 0AUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BVEd7obbmlFjVY+qTNZgC5w59DppQBSiV5o/Yn+7Xvg=;
 b=K8V2J81EvhE2hKgexEAG3m9uo/nQ8E+2LuSKHLHlXipjVraoPFJ1Zvwf6iVYGWxW4Y
 ZajYt0HEAvqnUUz8jazK7VGRHS29hZW9b5QBoGVFYcyzWZtsid5trBcQAQ/pLqjmXfGE
 0xEcxCzVSY2KZ39EYTpJF0lDA6aLWn/3inQ2B6tATK4MznCAlbyB+Sw/y2hcSYFhsAfk
 7uBMKg7Nxa/T1go1bXEdm/j/9AlPG4pHOGVP0+5PEhQ70+PNLwteqnKk94skbyXzwtzS
 1p0CLD88w7DUygSAlLA8JdlWLCYwSWSpHoKbp+F7bWjK1hD50PSSkMi3MDYsypd8iTK1
 55Nw==
X-Gm-Message-State: AOAM533gLgiHTSPnwRmoFQmmeA5LbNJ3OhaAgKJah0T2heXo2xVzreuU
 JGx9wiJeyiND3gTxGSsuLs0=
X-Google-Smtp-Source: ABdhPJzTBfK1iznesjjNo0+FzHvSyvgjB9/BrbaKf9pAQvh8YqYDj5PzaWVL57q1lSMyWShqjoYgGg==
X-Received: by 2002:a05:6870:4341:b0:d3:1412:8ecb with SMTP id
 x1-20020a056870434100b000d314128ecbmr1079992oah.36.1648072077736; 
 Wed, 23 Mar 2022 14:47:57 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96?
 ([2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96])
 by smtp.gmail.com with ESMTPSA id
 fw15-20020a056870080f00b000ddc3ec2533sm488249oab.9.2022.03.23.14.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 14:47:57 -0700 (PDT)
Message-ID: <eedf6fa4-b3cc-2849-45cf-1addf6f9ded6@gmail.com>
Date: Wed, 23 Mar 2022 18:47:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 0/4] use dc->vmsd with spapr devices vmstate
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <20220322183854.196063-1-danielhb413@gmail.com>
 <Yjp8uQECaWzan3bS@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <Yjp8uQECaWzan3bS@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::35
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/22/22 22:49, David Gibson wrote:
> On Tue, Mar 22, 2022 at 03:38:50PM -0300, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> This short series converts some spapr devices to use the dc->vmsd
>> interface to register the vmstate. For most of them it was needed
>> to use qdev_set_legacy_instance_id() to keep compatibility with the
>> instance_id being used for awhile.
>>
>> Although no functional changes were made the resulting code is a bit
>> shorter and maintainable. After these patches there are only 3 places
>> where vmstate_register() APIs are being used.
>>
>> No behavior changes were detected when testing migration scenarios with
>> hotplug/unplug of devices.
> 
> Looks good tome.

It looked good to me until, after further testing, I noticed that patch 03
breaks backward migration:

qemu_loadvm_state_section_startfull 560 (spapr_iommu) 0 2
qemu-system-ppc64: Unknown savevm section or instance 'spapr_iommu' 0. Make sure
that your current VM setup matches your saved VM setup, including any hotplugged devices

qemu-system-ppc64: load of migration failed: Invalid argument

I made a follow-up in the instance_id discussion [1] about it. For now patches 1-3 are
compromised. Only patch 04 is worth considering because the spapr_nvdimm device isn't
setting a custom instance_id.


[1] https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg05942.html



Thanks,


Daniel

> 

