Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF00615127
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:57:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opvUw-0005LJ-TB; Tue, 01 Nov 2022 13:56:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opvUs-0005KV-Px
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 13:56:22 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opvUr-0000RH-1X
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 13:56:22 -0400
Received: by mail-wm1-x32a.google.com with SMTP id v7so3525339wmn.0
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 10:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uidMepTKhBD3BTq0eV+FrpCwdIoJ32ZnTWLspv+qh/o=;
 b=rGLJZEBIi8/DIjLeLAt0ar3Abru6xHJWqx5Kqoo4y0LHTHQgCCe2dKAYacKr39Zpj8
 bhsFE9xbZuw2UfL3aW+eg+C0oFcBbVpveXEGc5btWP3AY35050O1iNw+cwAgi6I7rZfU
 TS/uz5weJsHW2f6vJ8C4jnUH+OyoWsmFc6v+dLdKai2pBYRMwbwDLuzcWkg0iJIyFNwh
 Setv+fNU/iJTXiqiSjo8PXpJDG63BnE5mDnf4t5s+CsM7qD3dKA6KEL8/gG92lrnS+b4
 Z40+EFMXih51AUvRymoDyqSB1/ja71TBjf0dYjGKFNu9/XtP3yVV2YBikn1QzdHYfITa
 RKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uidMepTKhBD3BTq0eV+FrpCwdIoJ32ZnTWLspv+qh/o=;
 b=vIhDeGjDOVzuf6lvPI+4F/o4TrTjKrTp5rpSJNM5dy0BzTkr/Ix7KIiKB83JCQMBkf
 uY0aJPSEhiUzoAxoSkxtH1bphYsIQoHH81cy+DYJm+ndV3IUUc0iA5vHPtKrIaAng2ko
 3jCgnmG/9VG4GtGfv8Q46Hwz7Onqb2Z5itW3eN7fV1kj1WKU5nK/dtRV1/Ti7NTrfOiR
 lQF20xeRI/mqVtgTKaHzUF6x0sIf1VmnZx6CtXqkqobdoymvsZgeYrNUZl0LIfuCzG5B
 nqtsosxzmm8g5O+MKS/5RqJB9dZxQwP3LcTRugy9dhONPX8LE3sCi/X0uaMZ85s46XB0
 EyrA==
X-Gm-Message-State: ACrzQf3xwuF5j1GO5JRjctTEc4V5k/nVMo3j8+w9ag/DizHQlAQXzQfp
 jHe3yWlnjYU5mLVz15c6jxtfPg==
X-Google-Smtp-Source: AMsMyM6Q91aXoZKmOGg/7Qxrxg/SaDO+lHu1PvZV6nBf0xturbtKIc1WiJBS9y3xC7z5LPO0FevVzg==
X-Received: by 2002:a05:600c:21a:b0:3cf:6e78:8e89 with SMTP id
 26-20020a05600c021a00b003cf6e788e89mr9141791wmi.46.1667325379449; 
 Tue, 01 Nov 2022 10:56:19 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k18-20020adfe3d2000000b00236705daefesm10565631wrm.39.2022.11.01.10.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Nov 2022 10:56:18 -0700 (PDT)
Message-ID: <f87c8b11-0f58-7e79-5c15-7d1d9dfaa148@linaro.org>
Date: Tue, 1 Nov 2022 18:56:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v5 0/6] ppc/e500: Add support for two types of flash,
 cleanup
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20221031115402.91912-1-philmd@linaro.org>
 <CAG4p6K5Kmcq6o5NwuvL-oFQtw80VXw_WX-2zUCjUnP=e2g0Q4g@mail.gmail.com>
 <AAFF66C6-6254-44FB-96B8-97B08F413C95@gmail.com>
 <7ee7386e-f754-083a-42e3-44b84bf4908a@linaro.org>
 <b476934e-20b8-91f5-b0e1-0d84f3ba2707@linaro.org>
In-Reply-To: <b476934e-20b8-91f5-b0e1-0d84f3ba2707@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/11/22 18:43, Philippe Mathieu-Daudé wrote:
> On 1/11/22 17:58, Philippe Mathieu-Daudé wrote:
>> On 1/11/22 17:01, Bernhard Beschow wrote:
>>> Am 1. November 2022 10:41:51 UTC schrieb Bernhard Beschow 
>>> <shentey@gmail.com>:
>>>> On Mon, Oct 31, 2022 at 12:54 PM Philippe Mathieu-Daudé 
>>>> <philmd@linaro.org>
>>>> wrote:
>>>>
>>>>> This is a respin of Bernhard's v4 with Freescale eSDHC implemented
>>>>> as an 'UNIMP' region. See v4 cover here:
>>>>>
>>>>> https://lore.kernel.org/qemu-devel/20221018210146.193159-1-shentey@gmail.com/
> 
>>> Hi Phil,
>>>
>>> Is there a chance to get this in for 7.2?
>>
>> Well 1/ can you review patch #1 and 2/ we need to figure out what to 
>> do with patch #2 :) Can you point me to the CCSR datasheet?
> 
> Maybe I found it, I'm looking at the "MPC8544E PowerQUICC III Integrated 
> Host Processor Family Reference Manual, Rev. 1".

On "Table 2-11. CCSR Block Base Address Map" I see the 0x2_7000–0x3_0FFF 
region marked as 'Reserved'. How does the eSDHC end mapped there?

