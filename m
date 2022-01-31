Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8016F4A5387
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 00:50:16 +0100 (CET)
Received: from localhost ([::1]:36684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEgR5-0005m3-1k
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 18:50:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEgOw-0004Xh-5K
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 18:48:02 -0500
Received: from [2607:f8b0:4864:20::534] (port=44696
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEgOu-00028f-7I
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 18:48:01 -0500
Received: by mail-pg1-x534.google.com with SMTP id h23so13690327pgk.11
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 15:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jgArsUrz37iCvbWVgY4Vp6E0Oin8r6z/hyR89uevgz8=;
 b=gdr8Hn53U6zWd7a5aP5WMHmaVGaoH4iSZHRVE8eYm8AG1PTlwT7CvKMtJ4qbLZngqo
 g6SI736MF3peCPr3z8jOFmD8eSXC+Yw5JaTyPZXj5jAuxbB792xbKXAoQET46zBZ+n3R
 DAMMUzTQLy4xhJCseXh+O9Czmz3Ya4WbH3lcAyXKpc2w50pOuyvkFXAfTAuxUUzmzWoU
 MzOwjF1DS3MejRco+gH3qcJ+SHD3on/9HXdyKXW+XGEC1vMPByVW2pHF+VPbjvPaP+Nx
 cprxNNw4x0jy9ZZ+qR/BjtyEB0H/cF2TjKS4Ar3CFuew6aYRcobzv+RcmjkxLfXwTuWv
 C1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jgArsUrz37iCvbWVgY4Vp6E0Oin8r6z/hyR89uevgz8=;
 b=3aaaZl4i/m5WDaQVlujAUjJXCYmQnk2EzWOUr1UZScwkxNs0DopWY8hJrJiwQHFZZr
 ToQ6PvxuDqUr9LH+qENPUxITvVCani91/0uFHugZV9GURr4OkCqVtG395jG2AJGVHX/3
 6CTd0NgYvshtomgX7JSW8EW9YIRdCHeWDxXbvQI5vEIgXm6csgjAA2ElYt937HQq/Dy3
 7Km+cnrpwG54smzzFP6q1rSjx95xix9bvICvYlwXGmrmyCc8VejG2GsMxZETmoSAKrri
 BOF4XSBDGw0xX6pMw4H5gxAmHWHSkQUmatjF/beMXp5GOeseqwQW/C2v5LGETX+1f7oR
 sjhg==
X-Gm-Message-State: AOAM532RknprEp2rV7mJTREfJ3AAhyVyU0gkSOb1DmhvwLMjJff3dRXW
 gwzhoplkM/fvuuebO2sCUcA=
X-Google-Smtp-Source: ABdhPJzYiUxk4q8eJxOTXwWUiBL4HvrGI+AnV8jFziJCYmOs31+EhfvgKO45V+KE7wOCOLpb03UvZw==
X-Received: by 2002:a63:285:: with SMTP id 127mr18472494pgc.67.1643672871119; 
 Mon, 31 Jan 2022 15:47:51 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id 79sm18909595pfv.117.2022.01.31.15.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 15:47:50 -0800 (PST)
Message-ID: <f14f723c-f8a7-cd95-2854-69dddad56926@amsat.org>
Date: Tue, 1 Feb 2022 00:47:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/3] memory: Make memory_region_is_mapped() succeed
 when mapped via an alias
Content-Language: en-US
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20211102164317.45658-1-david@redhat.com>
 <20211102164317.45658-3-david@redhat.com>
 <CAPan3Wpgm94iHRCz3uGvUZYV37W=e4_d7UMqc81hY1cxB-zs1w@mail.gmail.com>
 <0039f019-2bf4-577c-2ab4-f0a2f6f5ef1b@amsat.org>
 <CAPan3Wpg3TOvOCFauru9YPH4U4JW+9yyxHmy=sptmv5zpMifwg@mail.gmail.com>
In-Reply-To: <CAPan3Wpg3TOvOCFauru9YPH4U4JW+9yyxHmy=sptmv5zpMifwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

On 31/1/22 20:20, Niek Linnenbank wrote:
> Hi Philippe,
> 
> On Mon, Jan 31, 2022 at 12:29 AM Philippe Mathieu-Daudé <f4bug@amsat.org 
> <mailto:f4bug@amsat.org>> wrote:
> 
>     Hi Niek!
> 
>     (+Mark FYI)
> 
>     On 30/1/22 23:50, Niek Linnenbank wrote:
>      > Hi David,
>      >
>      > While I realize my response is quite late, I wanted to report
>     this error
>      > I found when running the acceptance
>      > tests for the orangepi-pc machine using avocado:
> 
>     Unfortunately I only run the full SD/MMC tests when I send a SD/MMC pull
>     request, so missed that here.
> 
> 
> I understand. These tests are behind the AVOCADO_ALLOW_LARGE_STORAGE 
> flag in avocado, so I guess they
> don't run on gitlab as well, but I'm not sure about that.

Indeed they don't run on GitLab due to that flag, but I run them locally
before sending a SD/MMC pull request (along with older images that are
not available anymore on the internet but are still in my local Avocado
cache).

>      > Basically the two tests freeze during the part where the U-Boot
>      > bootloader needs to detect the amount of memory. We model this in
>     the
>      > hw/misc/allwinner-h3-dramc.c file.
>      > And when running the machine manually it shows an assert on
>      > 'alias->mapped_via_alias >= 0'. When running manually via gdb, I was
>      > able to collect this backtrace:
>      >
>      > $ gdb ./build/qemu-system-arm
>      > ...
>      > gdb) run -M orangepi-pc -nographic
>      > ./Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img
>      > ...
>      > U-Boot SPL 2020.04-armbian (Sep 02 2020 - 10:16:13 +0200)
>      > DRAM:
>      > qemu-system-arm: ../softmmu/memory.c:2588:
>     memory_region_del_subregion:
>      > Assertion `alias->mapped_via_alias >= 0' failed.
>     ...
> 
>      > So it seems that the hw/misc/allwinner-h3-dramc.c file is using
>     the call
>      > memory_region_set_address, where internally we are calling
>      > memory_region_del_subregion.
>      > The allwinner-h3-dramc.c file does use
>      > memory_region_add_subregion_overlap once in the realize function,
>     but
>      > might use the memory_region_set_address multiple times.
>      > It looks to me this is the path where the assert comes in. If I
>     revert
>      > this patch on current master, the machine boots without the
>     assertion.
>      >
>      > Would you be able to help out how we can best resolve this?
>     Ofcourse, if
>      > there is anything needed to be changed on the
>     allwinner-h3-dramc.c file,
>      > I would be happy to prepare a patch for that.
> 
>     David's patch LGTM and I think your model might be somehow abusing the
>     memory API, but I'd like to read on the DRAMCOM Control Register to
>     understand the allwinner_h3_dramc_map_rows() logic. I couldn't find a
>     reference looking at Allwinner_H3_Datasheet_V1.2.pdf.
>     I wonder if we could ignore implementing it.
> 
> 
> Yes David's fix using memory_region_add_subregion_common inside 
> memory_region_readd_subregion resolves the issue indeed.

Great.

> Well the allwinner-h3-dramc.c module works OK for now, but it can 
> certainly use improvements indeed.
> And you're right, unfortunately the DRAMCOM device isn't documented in 
> the datasheet as far as I know.

OK :/

>     Your use case is typically what I tried to solve with this model:
>     https://lore.kernel.org/qemu-devel/20210419094329.1402767-2-f4bug@amsat.org/
> 
>     In your case, @span_size is your amount of DRAM, and @region_size is the
>     area u-boot is scanning (and @offset is zero).
>     Could that work, or is DRAMCOM doing much more?
> 
> 
> The current model in allwinner-h3-dramc.c is roughly based on the code 
> that is present in U-Boot in the file arm/arm/mach-sunxi/dram_sunxi_dw.c.
> It implements the low-level initialization of the memory controller, and 
> when running using Qemu the most important thing it needs to do is
> detect the amount of memory. If it cannot accomplish this task, the 
> U-Boot SPL won't boot properly or crash later. So what we have in
> the allwinner-h3-dramc.c implementation comes from the information and 
> code in the dram_sunxi_dw.c file in U-Boot, not the datasheet.

OK, this is a good start point. I'll look at the memory accesses
(certainly not today, but that problem is of my interest).

> The proposal you send with span_size/region_size looks interesting 
> indeed. It would be great if this could help
> simplify the code in allwinner-h3-dramc.c. But it would require some 
> effort to figure out if it can indeed replace the current
> behavior.

Regards,

Phil.

