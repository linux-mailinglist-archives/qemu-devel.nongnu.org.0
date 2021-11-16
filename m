Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7C5453C73
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 23:58:24 +0100 (CET)
Received: from localhost ([::1]:47854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn7PD-0001fY-C7
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 17:58:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1mn7Nk-0000c5-Sy
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 17:56:52 -0500
Received: from [2607:f8b0:4864:20::22c] (port=38547
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1mn7Ni-0004JD-3S
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 17:56:52 -0500
Received: by mail-oi1-x22c.google.com with SMTP id r26so1938932oiw.5
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 14:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=azL+vk0NW7QmpIQ35GDO4fKpcsiuZ7h6zSfuNK/pSwo=;
 b=E/Uum3/UBIKvLRjbfRei6q/VwmRGAW8kj56h6JDfnfCThY8cEenZF5uSRbFWQ1FG+2
 zhDcsSnQHQi+ciLFeDCHZ5Nh+uuwjIqqyPd8LB1CXWpyZic6T4j74pTygMc0SrtOumAg
 o3rfp5eTTaqhNud6HSC7NoYq6UgE39zi/kzxxCXAmLaDuFcJDM/EuHnYyZsA5Otp0wf5
 DhWQ79gDojlxgmXz31AdYIk7qCK43sXHa1MEJz2ARjx9RlaDqyOUfaKWuHQGfLpkjCCf
 nvlobWTgMlka2lnymGXxJoeXFyfJaxqdZpCIyUljLVzh4HsV2UAWRYmNkUWlvTZgV2CI
 1vzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=azL+vk0NW7QmpIQ35GDO4fKpcsiuZ7h6zSfuNK/pSwo=;
 b=32m1ZpNR3dpjNTq0Y/+vpyaPo2ys22lGMS2SqKvbial0VhUTnnV7M8rX0+irEjyTnm
 21s8Sf6bszwXY7JeYG1d2erVfOGLhpJ7rEwXr5GSlt7wqL8F7JFeuyPSXLonNhwIPC40
 gAG51q0VMnjtWI5AHI5n69Qh1uXUn2sfe77Q4UoIIYqOOpRmkLnXGncyKeiSIR7PTrbD
 8sI2J3pgqkPs1W546Tf3A/geRb+w7utYjDd/RQM8gKQ6TV72JouAz91avQ0bzp11UPnM
 UCJ4zBGCt/vGIsaVyiKqz1ds2STGIpUYT+kgsPRe48PZOENcVfY9aRlpP59eBhQu8uJO
 kiZw==
X-Gm-Message-State: AOAM533OV8OK4KqQpWjn+VxG6C/4RV9uWWx7W2sscjWuuJc411GR/KDs
 TfKMgBwX8sr4KCm7yAtkTKZYkQiWYL4AXA==
X-Google-Smtp-Source: ABdhPJwmC9IA3XCbg6VbVe0vEXwua3gCZ7KPzRTElMRGH9UUT0IcAiQXc49vWft9z/QRJ/V9skwlWQ==
X-Received: by 2002:a17:90a:2843:: with SMTP id
 p3mr3522096pjf.176.1637102951586; 
 Tue, 16 Nov 2021 14:49:11 -0800 (PST)
Received: from [192.168.10.153] (124-171-108-209.dyn.iinet.net.au.
 [124.171.108.209])
 by smtp.gmail.com with ESMTPSA id c9sm7527482pfm.84.2021.11.16.14.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 14:49:10 -0800 (PST)
Message-ID: <cf010ee6-0a8c-c18b-4c3b-3b4761d2ed69@ozlabs.ru>
Date: Wed, 17 Nov 2021 09:48:07 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20211114005111.515543-1-aik@ozlabs.ru>
 <735870db-c919-5f85-859a-eddbf507005b@kaod.org>
 <e0d2a9bd-1c63-7033-7daf-271fea702d66@redhat.com>
 <5ac387fa-8b6e-7d77-d425-a26f453bcc94@linaro.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <5ac387fa-8b6e-7d77-d425-a26f453bcc94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=aik@ozlabs.ru; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.446, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 17/11/2021 04:28, Richard Henderson wrote:
> On 11/16/21 6:12 PM, Philippe Mathieu-Daudé wrote:
>> On 11/16/21 17:46, Cédric Le Goater wrote:
>>> On 11/14/21 01:51, Alexey Kardashevskiy wrote:
>>>> The following changes since commit
>>>> d139786e1b3d67991e6cb49a8a59bb2182350285:
>>>>
>>>>     ppc/mmu_helper.c: do not truncate 'ea' in
>>>> booke206_invalidate_ea_tlb() (2021-11-11 11:35:13 +0100)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     git@github.com:aik/qemu.git tags/qemu-slof-20211112
>>>>
>>>> for you to fetch changes up to 
>>>> 73944a4bf4ab259b489af8128b4aec525484d642:
>>>>
>>>>     pseries: Update SLOF firmware image (2021-11-13 14:47:56 +1100)
>>>>
>>>> ----------------------------------------------------------------
>>>> Alexey Kardashevskiy (1):
>>>>         pseries: Update SLOF firmware image
>>>>
>>>>    pc-bios/README   |   2 +-
>>>>    pc-bios/slof.bin | Bin 991744 -> 991920 bytes
>>>>    roms/SLOF        |   2 +-
>>>>    3 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> Queued for 7.0.
>>
>> I am not sure this is a good idea, as this will make bisection
>> painful over the release tag.
> 
> It is my understanding that Cedric will rebase for the mainline PR.  At 
> least that's how David was handling subsystem pulls.

Yup. I am doing SLOF updates this way for ages after diifs became quite 
huge to make mailman barfing on the size, and the "subsystem" in the 
subj was the way to reduce the noise Peter had to respond to :)

btw should I be signing those? I am not now.


-- 
Alexey

