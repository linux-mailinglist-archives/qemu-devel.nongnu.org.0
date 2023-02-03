Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BF868950B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 11:17:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNt7l-0004F6-Gs; Fri, 03 Feb 2023 05:16:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pNt7V-0004BF-Hc
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:16:43 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1pNt7T-0002uH-1v
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:16:37 -0500
Received: by mail-pl1-x634.google.com with SMTP id n13so4732688plf.11
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 02:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XRxaPOsXVswuJvNg1Q6zu5h0enTs+I+recppKoCU3Ds=;
 b=QiU0MkYNfbUzI/dOMcsD6/4JUMdpn8uH2OIFswyDRsKvNIS0GbACitEZKcG2Zx3gH9
 wCCMIr8bL92/gGNko2oqK9XO8Hw9ioeEjbciK4yQWJTqQDlqh6XAONO2Md04TuofLJfc
 wPC/M22gpn8qfB25jS5r4NOz8nS2dp4nuzu8AsjTebDfyEwOjPx6eFBQgj8qOd5yCqxZ
 BdjUWJw9DJ/Ehyf23xWddzZThwpZjY5DdSYN/JNG0COTuYxQ7p0MZxZB28i1rbtVeAVw
 xzvSJQesPrcRZm+wdRqoLCmufgEOfgHBLW1gKklWXQ8EXhH1blHs1z2aAZ5AwJWYDDp+
 qarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XRxaPOsXVswuJvNg1Q6zu5h0enTs+I+recppKoCU3Ds=;
 b=YQWrxd9sLe8MKpEz50eZF5AkjhAdqB/6sYQkRCfig84dfEObq/BNOv/JxQZZ8zn3Sc
 ArhufFGnRIQoJc5b/GbgKXsZgyDClrVTpzmNEWdSOA1rL3EYcIxaeI9kdqeB3eIbupGL
 T5O1bkPIs9TczLRTg3wX9sGAVnffyWwuoclaWno34lsYzCS/3S9vYnmvdvFRKvMdw/a6
 oE9DrZ+hzrFYGjEakR0l7w+1qsePfMS3Q79xCuyWxHnZ6bJ+eLvYjNlUQ2BhgNmM8aqd
 S5Pj76bSQA6kN8L3MYa7ecEDYdx4FX2IFEWT2Hchev9pIUobIkW5+6na9tW8u/TXPFkP
 UAuA==
X-Gm-Message-State: AO0yUKW9Dmfs9Gs+N8EOZRaow3tQ8HJxHVmytM9do/YuiUl8qbXMqcjf
 WlhvplZKucCqLeU01q4RNVM=
X-Google-Smtp-Source: AK7set8PrKCHqwy7xiPh36+F/PtkVHDl0r8dd0k6E0J43TP7+jpj4U7grGp0MarjCWvnOVr9NYvj2w==
X-Received: by 2002:a17:902:f14d:b0:198:dd32:f0e1 with SMTP id
 d13-20020a170902f14d00b00198dd32f0e1mr1653310plb.0.1675419391817; 
 Fri, 03 Feb 2023 02:16:31 -0800 (PST)
Received: from [10.213.81.57] ([157.82.194.11])
 by smtp.gmail.com with ESMTPSA id
 ji21-20020a170903325500b001945b984341sm1219425plb.100.2023.02.03.02.16.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 02:16:31 -0800 (PST)
Message-ID: <499a1290-1e90-20ef-881d-9434cbce8115@gmail.com>
Date: Fri, 3 Feb 2023 19:16:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Display update issue on M1 Macs
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Joelle van Dyne <j@getutm.app>
References: <5921db6f-0760-c380-7af2-5710a0cd479d@eik.bme.hu>
 <3bad40aa-7920-0484-ca23-b9d424ad56f6@eik.bme.hu>
 <28025639-840a-1e19-01d5-c817235ca423@gmail.com>
 <08497582-3b11-1311-48d6-1e2db8c93559@eik.bme.hu>
 <7380ee42-8b39-8c5d-ba60-652d411c49b1@gmail.com>
 <5d385b04-ea56-5e30-9bcd-82c0b63f2dd4@eik.bme.hu>
 <b0c72670-b6f9-0f63-9bb1-1a1bf27ffe8e@gmail.com>
 <b8403b65-7c55-20fb-1ee5-730e4eb9833c@eik.bme.hu>
 <08551d7d-c17e-7a35-3908-e2b8b3465366@gmail.com>
 <386b21f7-ce14-3237-5f51-7ec1d7d86411@eik.bme.hu>
 <483662d9-2565-db44-0e19-fb9128f28bde@eik.bme.hu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <483662d9-2565-db44-0e19-fb9128f28bde@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2023/02/02 19:51, BALATON Zoltan wrote:
> On Tue, 31 Jan 2023, BALATON Zoltan wrote:
>> On Tue, 31 Jan 2023, Akihiko Odaki wrote:
> [...]
> To summarise previous discussion:
> 
> - There's a problem on Apple M1 Macs with sm501 and ati-vga 2d accel 
> functions drawing from device model into the video memory of the 
> emulated card which is not shown on screen when the display update 
> callback is called from another thread. This works on x86_64 host so I 
> suspect it may be related to missing memory synchronisation that ARM may 
> need.
> 
> - This can be reproduced running AmigaOS4 on sam460ex or MorphOS (demo 
> iso downliadable from their web site) on sam460ex, pegasos2 or 
> mac99,via=pmu with -device ati-vga,romfile="" as described here: 
> http://zero.eik.bme.hu/~balaton/qemu/amiga/
> 
> - I can't test it myself lacking hardware so I have to rely on reports 
> from people who have this hardware so there may be some uncertainity in 
> the info I get.
> 
> - We have confirmed it's not related to a known race condition as 
> disabling dirty tracking and always doing full updates of whole screen 
> did not fix it:
> 
>>>>>>>>> But there is an exception: 
>>>>>>>>> memory_region_snapshot_and_clear_dirty() releases iothread 
>>>>>>>>> lock, and that broke raspi3b display device:
>>>>>>>>> https://lore.kernel.org/qemu-devel/CAFEAcA9odnPo2LPip295Uztri7JfoVnQbkJ=Wn+k8dQneB_ynQ@mail.gmail.com/T/
>>>>>>>>>
>>>>>>>>> It is unexpected that gfx_update() callback releases iothread 
>>>>>>>>> lock so it may break things in peculiar ways.
>>>>>>>>>
>>>>>>>>> Peter, is there any change in the situation regarding the race 
>>>>>>>>> introduced by memory_region_snapshot_and_clear_dirty()?
>>>>>>>>>
>>>>>>>>> For now, to workaround the issue, I think you can create 
>>>>>>>>> another mutex and make the entire sm501_2d_engine_write() and 
>>>>>>>>> sm501_update_display() critical sections.
>>>>>>>>
>>>>>>>> Interesting thread but not sure it's the same problem so this 
>>>>>>>> workaround may not be enough to fix my issue. Here's a video 
>>>>>>>> posted by one of the people who reported it showing the problem 
>>>>>>>> on M1 Mac:
>>>>>>>>
>>>>>>>> https://www.youtube.com/watch?v=FDqoNbp6PQs
>>>>>>>>
>>>>>>>> and here's how it looks like on other machines:
>>>>>>>>
>>>>>>>> https://www.youtube.com/watch?v=ML7-F4HNFKQ
>>>>>>>>
>>>>>>>> There are also videos showing it running on RPi 4 and G5 Mac 
>>>>>>>> without this issue so it seems to only happen on Apple Silicon 
>>>>>>>> M1 Macs. What's strange is that graphics elements are not just 
>>>>>>>> delayed which I think should happen with missing thread 
>>>>>>>> synchronisation where the update callback would miss some pixels 
>>>>>>>> rendered during it's running but subsequent update callbacks 
>>>>>>>> would eventually draw those, woudn't they? Also setting 
>>>>>>>> full_update to 1 in sm501_update_display() callback to disable 
>>>>>>>> dirty tracking does not fix the problem. So it looks like as if 
>>>>>>>> sm501_2d_operation() running on one CPU core only writes data to 
>>>>>>>> the local cache of that core which sm501_update_display() 
>>>>>>>> running on other core can't see, so maybe some cache 
>>>>>>>> synchronisation is needed in memory_region_set_dirty() or if 
>>>>>>>> that's already there maybe I should call it for all changes not 
>>>>>>>> only those in the visible display area? I'm still not sure I 
>>>>>>>> understand the problem and don't know what could be a fix for it 
>>>>>>>> so anything to test to identify the issue better might also 
>>>>>>>> bring us closer to a solution.
>>>>>>>
>>>>>>> If you set full_update to 1, you may also comment out 
>>>>>>> memory_region_snapshot_and_clear_dirty() and 
>>>>>>> memory_region_snapshot_get_dirty() to avoid the iothread mutex 
>>>>>>> being unlocked. The iothread mutex should ensure cache coherency 
>>>>>>> as well.
>>>>>>>
>>>>>>> But as you say, it's weird that the rendered result is not just 
>>>>>>> delayed but missed. That may imply other possibilities (e.g., the 
>>>>>>> results are overwritten by someone else). If the problem persists 
>>>>>>> after commenting out memory_region_snapshot_and_clear_dirty() and 
>>>>>>> memory_region_snapshot_get_dirty(), I think you can assume the 
>>>>>>> inter-thread coherency between sm501_2d_operation() and 
>>>>>>> sm501_update_display() is not causing the problem.
>>>>>>
>>>>>> I've asked people who reported and can reproduce it to test this 
>>>>>> but it did not change anything so confirmed it's not that race 
>>>>>> condition but looks more like some cache inconsistency maybe. Any 
>>>>>> other ideas?
>>>>>
>>>>> I can come up with two important differences between x86 and Arm 
>>>>> which can affect the execution of QEMU:
>>>>> 1. Memory model. Arm uses a memory model more relaxed than x86 so 
>>>>> it is more sensitive for synchronization failures among threads.
>>>>> 2. Different instructions. TCG uses JIT so differences in 
>>>>> instructions matter.
>>>>>
>>>>> We should be able to exclude 1) as a potential cause of the 
>>>>> problem. iothread mutex should take care of race condition and even 
>>>>> cache coherency problem; mutex includes memory barrier functionality.
> [...]
>>>>> For difference 2), you may try to use TCI. You can find details of 
>>>>> TCI in tcg/tci/README.
>>>>
>>>> This was tested and also with TCI got the same results just much 
>>>> slower.
>>>>
>>>>> The common sense tells, however, the memory model is usually the 
>>>>> cause of the problem when you see behavioral differences between 
>>>>> x86 and Arm, and TCG should work fine with both of x86 and Arm as 
>>>>> they should have been tested well.
> [...]
>>> Fortunately macOS provides Rosetta 2 for x86 emulation on Apple M1, 
>>> which makes it possible to compare x86 and Arm without concerning the 
>>> difference of the microarchitecture.
>>
>> We've tried that before and even running x86 QEMU on M1 with Rosetta 2 
>> it was the same so it's probably not something about the code itself 
>> but how it's
> 
> As this was odd I've asked to re-test this and now I'm told at least 
> QEMU 5.1 x86_64 build from emaculation.com is working with Rosetta on M1 
> Mac so this suggests it may be a problem with memory sync but still 
> don't know where and what to try. We're now try newer X86_64 builds to 
> see if it broke somewhere along the way.
> 
> Anybody else with an M1 Mac wants to help testing? Can you reproduce the 
> same with UTM with MorphOS and ati-vga? Here's what I've got showing the 
> problem: https://www.youtube.com/watch?v=j5Ag5_Yq-Mk
> 
> Regards,
> BALATON Zoltan

Hi,

I finally reproduced the issue with MorphOS and ati-vga and figured out 
its cause.

The problem is that pixman_blt() is disabled because its backend is 
written in GNU assembly, and GNU assembler is not available on macOS. 
There is no fallback written in C, unfortunately. The issue is tracked 
by the upstream at:
https://gitlab.freedesktop.org/pixman/pixman/-/issues/59

I hit the same problem on Asahi Linux, which is based on Arch Linux ARM. 
It is because Arch Linux copied PKGBUILD from x86 Arch Linux, which 
disables Arm backends. It is easy to enable the backend for the platform 
so I proposed a change at:
https://github.com/archlinuxarm/PKGBUILDs/pull/1985

Regards,
Akihiko Odaki

