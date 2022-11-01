Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38F9615021
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:11:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opubO-0001Mm-Ot; Tue, 01 Nov 2022 12:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opubN-0001Lq-4x
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 12:59:01 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opub7-0005WJ-Ob
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 12:59:00 -0400
Received: by mail-wr1-x42f.google.com with SMTP id a14so20998721wru.5
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 09:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XF0x13GT70JzdbiK8C3YLqyxWaXwZzEIsu+JZztc2O0=;
 b=BFC1tJghMKu/uqMhrmNNI3TCO88qAsVxmLZJERzmWGGKdVp0QeJgmpRjkedOxMfcsS
 AaQyQ1n1VscuSQJKm3svJJ9jMNSfxUNtWYPr8UvsQtpM7l3WVplwO4ADs+4JskajZipg
 M6hXgeOvsBKRvzwtXCR2qX/7NApipno2jBNY+MTaUDjPX8CX5DVZYL/yT3hZL2tO0ETv
 QfT4R78BOQT1wvCbobqf34e6lta4B+MoYueJnJWEVoiAQoSGZDIkuV4M7SzMyLHGrSUG
 cSVsHxYfjg7aQEAiceBplg81v6EkFSy8rGJ7vyizy0WODG8GNF9XYRUv2Nqng2aP6yEn
 /msQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XF0x13GT70JzdbiK8C3YLqyxWaXwZzEIsu+JZztc2O0=;
 b=t2V+hWtcd3nn5ZtenkSmoSC3/DZYkMyvrrVuzbM5QYpGO76iTG1av6UzsibXuMQ+jM
 NaRL+RM2seygKOXgB6X7iPW22yV4siuyrWe77swAT+Aayj9MCHxsVcfqE87qpHqnjmUx
 MQ4Y9ednv/C/pnJPkso8jjziGCyrLjXSD7abmJ5GPXGPzxlWtQP8FHHxl/RLZkXsNu5g
 71+bLJvRIQ/HqYbJgfV62oGuJk3PNXFH8ybKiT41SBssndrShJiUqaU2v26sjBUTHgo/
 T7IhvJjxViFmEIRFpPSCW8lMEWkH3dV+aKEwPvL0rbM0uvYVRHg887J9/teu1NAiXQdB
 aD9g==
X-Gm-Message-State: ACrzQf266adKnLe80yJedJiKaSw4AUMUKlzjSXKwHuSwprI+ma3WwYaN
 Ey4GIW86D5MozGOVqd8krYU0pw==
X-Google-Smtp-Source: AMsMyM6YrKrE4yMqUopmjpvaVx5vgneOoSqcGsuOznqRVusny6uOjR9KuaomzbhI3ecRGq4wkV/UuA==
X-Received: by 2002:a5d:6c6b:0:b0:225:dde:ab40 with SMTP id
 r11-20020a5d6c6b000000b002250ddeab40mr12400978wrz.690.1667321923772; 
 Tue, 01 Nov 2022 09:58:43 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 az24-20020adfe198000000b0022e035a4e93sm10780193wrb.87.2022.11.01.09.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 09:58:43 -0700 (PDT)
Message-ID: <7ee7386e-f754-083a-42e3-44b84bf4908a@linaro.org>
Date: Tue, 1 Nov 2022 17:58:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v5 0/6] ppc/e500: Add support for two types of flash,
 cleanup
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20221031115402.91912-1-philmd@linaro.org>
 <CAG4p6K5Kmcq6o5NwuvL-oFQtw80VXw_WX-2zUCjUnP=e2g0Q4g@mail.gmail.com>
 <AAFF66C6-6254-44FB-96B8-97B08F413C95@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <AAFF66C6-6254-44FB-96B8-97B08F413C95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/11/22 17:01, Bernhard Beschow wrote:
> Am 1. November 2022 10:41:51 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>> On Mon, Oct 31, 2022 at 12:54 PM Philippe Mathieu-Daudé <philmd@linaro.org>
>> wrote:
>>
>>> This is a respin of Bernhard's v4 with Freescale eSDHC implemented
>>> as an 'UNIMP' region. See v4 cover here:
>>>
>>> https://lore.kernel.org/qemu-devel/20221018210146.193159-1-shentey@gmail.com/
>>>
>>> Only tested with the ppce500 machine (no further regression testing).
>>>
>>> Since v4:
>>> - Do not rename ESDHC_* definitions to USDHC_*
>>> - Do not modify SDHCIState structure
>>>
>>
>> Works beautifully, both for the buildroot load and for my proprietary load.
>> So:
>> Tested-by: Bernhard Beschow<shentey@gmail.com>
>>
>>>
>>> Bernhard Beschow (4):
>>>    hw/block/pflash_cfi0{1, 2}: Error out if device length isn't a power
>>>      of two
>>>    docs/system/ppc/ppce500: Use qemu-system-ppc64 across the board(s)
>>>    hw/ppc/e500: Implement pflash handling
>>>    hw/ppc/e500: Add Freescale eSDHC to e500plat
>>>
>>> Philippe Mathieu-Daudé (2):
>>>    hw/sd/sdhci: MMIO region is implemented in 32-bit accesses
>>>    hw/sd/sdhci: Map host controller interface in host endianess
> 
> Hi Phil,
> 
> Is there a chance to get this in for 7.2?

Well 1/ can you review patch #1 and 2/ we need to figure out what to do 
with patch #2 :) Can you point me to the CCSR datasheet?

