Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570595F8EF4
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Oct 2022 23:24:15 +0200 (CEST)
Received: from localhost ([::1]:55026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohdmP-0007BZ-WC
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 17:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ohdke-0004wl-EE; Sun, 09 Oct 2022 17:22:24 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:43594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ohdkc-0000St-Nj; Sun, 09 Oct 2022 17:22:24 -0400
Received: by mail-oi1-x22c.google.com with SMTP id g10so3834290oif.10;
 Sun, 09 Oct 2022 14:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AFKyPfZPwB0t12WItzt+LYYfbaC1i9IWPneAGDHehLg=;
 b=Bp6WfXKLV8ZWfF2YvnMzWDBgfKGMAg+tMfLrFFAXHEil9P9G3cNiHLeeb+XKehWrL8
 5g0fCy7/OMXIawJaoTgLVO+JsNbM0A4yfJj0ZYwGfOmPv/ic6yWOzbkY6rCPhADGxii8
 7l1h6HqnGxw0UKBF6ZlIZrAlMhBl7qlQxJyscSdN2/W6pkYHcy3jVJONyLV/IuEdrb6r
 j7Lrf6apzu9iVHwTzkAJ5TM9aeXOJ4XrxjY7xAJG9Q1rmoFxHUn8mz+ZULJsRBpxzJ4P
 VD08yJMtQtUgHQTXpI1ow3kIwdhWIVRluXpCe876v1dV0VuSWyLigy5OxIo47BMIjFqa
 RL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AFKyPfZPwB0t12WItzt+LYYfbaC1i9IWPneAGDHehLg=;
 b=8DzsX2ka5YJgYl6WPhh3h96UkdgqMgpggqAstWa6rn2BsKR279t8qjqDW7emmzDmc4
 zhUdtir0bdjG+cSGkq0z+bFalzUl7c2dl7L8yde19kCMN5PPVQRnJ9ErWExxzta72LpY
 8F9NaxxbvNPry3oaVEgCNU492DzI+F9MZPPPE+BIGtLrFwnyL40/MomGEe77PsNEVKTN
 G5azXbO+JM1kSnQRx1hBG76mDZgMfuTgbyTWZ3F1yNLGQezHGP15H5sy/2ECtwXtvjrp
 eW6JmB2UfZkFaCwZ1wEugUFmzdpqs30PIpfO9KioktoFcRT/aGhj6h9w7kf8ahhdJk9H
 Av/Q==
X-Gm-Message-State: ACrzQf1Dd2lmg34OKUQRTe9ey5JcOUJoNxW22NLrupAUT4jA5A3FCMCj
 g7WQUW/O4XJiaRcFA6DUQmQ=
X-Google-Smtp-Source: AMsMyM4IpWndg1LVVCMs6HaUoHar+mp+vLREJooNIi3yd47/pBRTKg8oiQRvz/AXEl257wLt7BK/VQ==
X-Received: by 2002:a05:6808:bca:b0:350:b366:157 with SMTP id
 o10-20020a0568080bca00b00350b3660157mr7670571oik.3.1665350540148; 
 Sun, 09 Oct 2022 14:22:20 -0700 (PDT)
Received: from [192.168.10.102] ([179.247.162.105])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a056870414e00b00127a6357bd5sm4262223oad.49.2022.10.09.14.22.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Oct 2022 14:22:18 -0700 (PDT)
Message-ID: <5ffbb774-d1bb-c7f6-3f0b-c9869ad9fc4d@gmail.com>
Date: Sun, 9 Oct 2022 18:22:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 00/13] ppc/e500: Add support for two types of flash,
 cleanup
To: Bin Meng <bmeng.cn@gmail.com>, Bernhard Beschow <shentey@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20221003203142.24355-1-shentey@gmail.com>
 <da8a2a03-0e54-fe81-7a13-cd5e79d69d18@amsat.org>
 <ba62aabc-0023-c5e6-d156-67d027bb6ff3@gmail.com>
 <45BEF5EF-3259-4B50-8F17-115C31A0D3EB@gmail.com>
 <CAEUhbmXPo67x67ckQSYGb4XNg+TbWYn1NT+Xap8qzCLAm+zA=Q@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <CAEUhbmXPo67x67ckQSYGb4XNg+TbWYn1NT+Xap8qzCLAm+zA=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.934,
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



On 10/9/22 00:30, Bin Meng wrote:
> On Sun, Oct 9, 2022 at 12:11 AM Bernhard Beschow <shentey@gmail.com> wrote:
>>
>> Am 4. Oktober 2022 12:43:35 UTC schrieb Daniel Henrique Barboza <danielhb413@gmail.com>:
>>> Hey,
>>>
>>> On 10/3/22 18:27, Philippe Mathieu-Daudé wrote:
>>>> Hi Daniel,
>>>>
>>>> On 3/10/22 22:31, Bernhard Beschow wrote:
>>>>> Cover letter:
>>>>> ~~~~~~~~~~~~~
>>>>>
>>>>> This series adds support for -pflash and direct SD card access to the
>>>>> PPC e500 boards. The idea is to increase compatibility with "real" firmware
>>>>> images where only the bare minimum of drivers is compiled in.
>>>>
>>>>> Bernhard Beschow (13):
>>>>>     hw/ppc/meson: Allow e500 boards to be enabled separately
>>>>>     hw/gpio/meson: Introduce dedicated config switch for hw/gpio/mpc8xxx
>>>>>     docs/system/ppc/ppce500: Add heading for networking chapter
>>>>>     hw/ppc/e500: Reduce usage of sysbus API
>>>>>     hw/ppc/mpc8544ds: Rename wrongly named method
>>>>>     hw/ppc/mpc8544ds: Add platform bus
>>>>>     hw/ppc/e500: Remove if statement which is now always true
>>>>
>>>> This first part is mostly reviewed and can already go via your
>>>> ppc-next queue.
>>>
>>> We're missing an ACK in patch 6/13:
>>>
>>> hw/ppc/mpc8544ds: Add platform bus
>>
>> Bin: Ping?
>>
> 
> Sorry for the delay. I have provided the R-b to this patch.

Thanks for the review.

Patches 1-7 queued in gitlab.com/danielhb/qemu/tree/ppc-next.


Daniel

> 
> Regards,
> Bin

