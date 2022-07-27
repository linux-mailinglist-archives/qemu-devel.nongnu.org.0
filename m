Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD6F58286B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 16:18:41 +0200 (CEST)
Received: from localhost ([::1]:34152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGhrz-0005lf-9h
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 10:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oGhks-0000ap-Fk; Wed, 27 Jul 2022 10:11:19 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:34518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oGhkp-0001P4-L1; Wed, 27 Jul 2022 10:11:18 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-10e615a36b0so1207986fac.1; 
 Wed, 27 Jul 2022 07:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ejUSe6ITp3kFe9yB2MeJwLytQJRl7fVwa53xZoWFZvI=;
 b=PltL+jimoFesoNCcsSRqgBebVxGwXs1o5Gd2He2albh1eWh10e9iWMtxCCMACUlERh
 Hn9RRMnY3A1FEdM74WCaez7iLgz01w+h67z4O5pQZJRgjzMeGdxQGyTH794hiU5TmIDO
 pCcJIO5EKft5h2xr1lQ0QK0i9Nsl0CfC2Z/zvCC2Ak6oZgjr+EBZqozhj/Q6st8ywerb
 cb93zxekpHkVTjB8zkI+QVPWYxkAVpuU4+UOokFFRSPyQtz0U5Qu1uo8QVISAu5FmPIA
 8tSDldWOIKtT1s+Zt7cwoJ/wkNoqk71sK/VdFu1+3o6Sb/7/JAWKX+jqOu8NDEjl1J/T
 oKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ejUSe6ITp3kFe9yB2MeJwLytQJRl7fVwa53xZoWFZvI=;
 b=2prESZ0qRrO6WWWTdXkt2axegNjc6RrYyJGUCAp3redly89y/3YK1ijkdONRiFy/pd
 +DxHQqPEPQSMkN/bC9IJTNPbZzubOYa4mHCX08wcLvO2KScUKBRc0OEoEPtR/HC7uORR
 g9KGbxomOw/nXbSjEPLIe+yEJfzPKpkKTzBN7Nbkxt+qoFv7RxLocRLlwXNxvZtHoIL9
 JqCvV1qthM000W6aqVzDY6myod/QxtMRxTzhGYJgJEZxLgWW2JNE5hbi7ue6jaoCS0+v
 DNZrgFtiU+fFV7jSe0ktduOjQsKqou7aRjMu5+mUBnhXPgHGTIKHMpD2sFc7sW3o6t4r
 FK0A==
X-Gm-Message-State: AJIora9kNIY/clOXnkkBSGZCv+pnFvq9grBvXEvR0hf7BRWqS3wQZalv
 bvu6dg6gVywjX2TDAsZCar8=
X-Google-Smtp-Source: AGRyM1v9ZtqJlPjpc5UmLmR/LxzR/VdDQ+0Z0q0a6t+vqW6svReELc8ynPig37bzR6saPsZnmKnf3w==
X-Received: by 2002:a05:6870:1c7:b0:10e:3855:7930 with SMTP id
 n7-20020a05687001c700b0010e38557930mr2169019oad.50.1658931073896; 
 Wed, 27 Jul 2022 07:11:13 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:1396:b354:ef67:bd69:305a?
 ([2804:431:c7c7:1396:b354:ef67:bd69:305a])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a056870708f00b0010e3f390ecasm1977303oae.16.2022.07.27.07.11.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 07:11:13 -0700 (PDT)
Message-ID: <067b069a-4930-f5a9-2ce7-d4eb225c0825@gmail.com>
Date: Wed, 27 Jul 2022 11:11:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC 1/2] hw/ppc/ppc440_uc: Initialize length passed to
 cpu_physical_memory_map()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20220726182341.1888115-1-peter.maydell@linaro.org>
 <20220726182341.1888115-2-peter.maydell@linaro.org>
 <CAFEAcA8s9vgBFVuDVVednC4cv5Q4M7L+uTCc74tEmdht4ss+pA@mail.gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <CAFEAcA8s9vgBFVuDVVednC4cv5Q4M7L+uTCc74tEmdht4ss+pA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
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



On 7/26/22 15:24, Peter Maydell wrote:
> On Tue, 26 Jul 2022 at 19:23, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> In dcr_write_dma(), there is code that uses cpu_physical_memory_map()
>> to implement a DMA transfer.  That function takes a 'plen' argument,
>> which points to a hwaddr which is used for both input and output: the
>> caller must set it to the size of the range it wants to map, and on
>> return it is updated to the actual length mapped. The dcr_write_dma()
>> code fails to initialize rlen and wlen, so will end up mapping an
>> unpredictable amount of memory.
>>
>> Initialize the length values correctly, and check that we managed to
>> map the entire range before using the fast-path memmove().
>>
>> This was spotted by Coverity, which points out that we never
>> initialized the variables before using them.
>>
>> Fixes: Coverity CID 1487137
> 
> Also CID 1487150 (it reports the wlen and rlen issues separately).

I amended in tree:


     Fixes: Coverity CID 1487137, 1487150


I also believe that this Coverity fix isn't dependent on patch 2, which
apparently will take longer to get reviewed, so it's fine to take it
now.



Thanks,


Daniel




> 
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> -- PMM

