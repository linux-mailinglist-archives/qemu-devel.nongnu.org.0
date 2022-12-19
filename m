Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403826507FB
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 08:13:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7AJK-000387-IV; Mon, 19 Dec 2022 02:11:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7AJH-00037i-RE
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 02:11:40 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7AJF-0000Un-Ml
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 02:11:39 -0500
Received: by mail-wr1-x42d.google.com with SMTP id m14so7660305wrh.7
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 23:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H5I31qkZ7p1489OZgspN+JeWeaY8KJiMv52GUO7JOAg=;
 b=Ea62ilntYbyzrjakcr+sK14GeEG/RTqCWydosGTv1BE4dMM8Db63NgkAGxH0EdZz0j
 9HYMSqYc+jdPyJy/R+p/L7qCD+6FG9t9Hd6LSPE5SFdd7xJziyzwaBz8Ik2tfKVuMkr3
 +pY195bbgp6xiKCIjWBhGszu5j1Q/4U5YvP9wQkFRNAENbJ6W5vOnjDakd7i7QARXwXl
 x23Op33PUm9nhPGtH5yCcgMZj/aH24dkaSnS7XgfKRmgIJCAoCBpEKqEnpyzDdPpunhz
 GXVTc3gPat7WbHbPBjoJZmAEZDRfPbl7tp5P8qKhkPCBTU2vARkK3H8icxkCyB+YKtR3
 pJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H5I31qkZ7p1489OZgspN+JeWeaY8KJiMv52GUO7JOAg=;
 b=DmT3/RnCI1QLCGrwIsKpUn8vUe+J60B1aewU3xWh1y2buiE9tw6C98tfI0qDZHk4X0
 Gw+5GlUjdaIN/dPNrX/K69PEP8fN8Z0ucNT55ps7WFWIYx2EY9qQWG7hwPXikFQCK3BR
 bPDjCJMXl+90WdzNNJQwMwlVsB8B945v+ZNq6mYwi/fDF6HsahbLy8RDUFpKsy59a24V
 YX9QItA/mqlA0bp4xs3j9aobr/DPU4aS7I3ERtdyo/V2FDBJz6IggX3Q4W1ibvfjppJR
 xnnx+A48p6LZvZUhjJ/jUzJX8dfTSlzovogsITfRIsHvZGLatlfK09Bl/cQLe5qBOMfx
 73Rg==
X-Gm-Message-State: ANoB5pnDGCjMABXuPSFALqsEDL9zqeYgcTPBq78Gc6yoiDyNyaoJccvj
 TdfXF3qolBfcwPSK/lNHGRbE4A==
X-Google-Smtp-Source: AA0mqf5u+TBZrfW5nsTzZT88YDPkAt0zIAIWRQBBE1LCHQ7X/m2gpSmLJLBdQUAlA/XiKPqakuoqKA==
X-Received: by 2002:adf:f4cc:0:b0:242:7214:55e4 with SMTP id
 h12-20020adff4cc000000b00242721455e4mr25473275wrp.46.1671433895621; 
 Sun, 18 Dec 2022 23:11:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v5-20020a5d59c5000000b00241fea203b6sm9061008wry.87.2022.12.18.23.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 23:11:35 -0800 (PST)
Message-ID: <11d8c4e0-c516-ed28-2df3-d613111ad53c@linaro.org>
Date: Mon, 19 Dec 2022 08:11:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 0/7] Enable Cubieboard A10 boot SPL from SD card
Content-Language: en-US
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
 <e05afcc8-8d86-b942-6702-8ba4887c44db@linaro.org>
 <CABtshVRUevNjOucUwtKW-sccUAADRe-9JBbYHd8UMGf0YPJXSw@mail.gmail.com>
 <CABtshVSY+UxMEfh_=NCw9ws0VrEnjkgzoMspg4wfG9Jr_ZZc=w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CABtshVSY+UxMEfh_=NCw9ws0VrEnjkgzoMspg4wfG9Jr_ZZc=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/12/22 23:57, Strahinja Jankovic wrote:
> Hi,
> 
> I just looked around a bit more. Would OpenWrt image be acceptable?

Sure.

> It looks like there are releases for cubieboard that are kept for a
> longer time, and I just checked that they work properly, so I could
> add them to the acceptance test.
> 
> Best regards,
> Strahinja
> 
> On Sun, Dec 18, 2022 at 11:34 PM Strahinja Jankovic
> <strahinjapjankovic@gmail.com> wrote:
>>
>> Hi,
>>
>>
>> On Sun, Dec 18, 2022 at 11:17 PM Philippe Mathieu-Daudé
>> <philmd@linaro.org> wrote:
>>>
>>> On 18/12/22 22:19, Strahinja Jankovic wrote:
>>>> This patch series adds missing Allwinner A10 modules needed for
>>>> successful SPL boot:
>>>> - Clock controller module
>>>> - DRAM controller
>>>> - I2C0 controller (added also for Allwinner H3 since it is the same)
>>>> - AXP-209 connected to I2C0 bus
>>>>
>>>> It also updates Allwinner A10 emulation so SPL is copied from attached
>>>> SD card if `-kernel` parameter is not passed when starting QEMU
>>>> (approach adapted from Allwinner H3 implementation).
>>>>
>>>> Boot from SD card has been tested with Cubieboard Armbian SD card image and custom
>>>> Yocto image built for Cubieboard.
>>>> Example usage for Armbian image:
>>>> qemu-system-arm -M cubieboard -nographic -sd ~/Armbian_22.11.0-trunk_Cubieboard_kinetic_edge_6.0.7.img
>>>
>>> As a follow-up, could you add a test similar to
>>> test_arm_orangepi_bionic_20_08() in tests/avocado/boot_linux_console.py?
>>>
>>> This test could be refactored as do_test_arm_allwinner_armbian(), called
>>> for orangepi and cubieboard with the corresponding url / hash.
>>
>> I was planning to do it (I already have a patch for cubieboard), but
>> there is a problem with finding a stable-enough image for cubieboard
>> for automated testing.
>> Unfortunately, Cubieboard does not have supported Armbian images as
>> OrangePi-PC has (it only has weekly builds).

Developers shouldn't worry about that but focus on the testing. The
QEMU project doesn't have dedicated sysadmin / storage, but if it had
it should be their problem, not yours. Meanwhile such a test is still
useful. Artifacts come with their hash, so can be uploaded elsewhere
later.

>> From the images that can
>> be found on archive.armbian.com, there is only one bionic image
>> (21.02) and it won't boot because it hangs due to the musb issue (I
>> tried both with my patches and without, by extracting
>> kernel/dtb/initrd).

Similar approach:
https://lore.kernel.org/qemu-devel/20201018205551.1537927-4-f4bug@amsat.org/

>> Other images are focal, but for some reason, in
>> those images it is impossible to interrupt U-Boot (tested with 21.08),
>> so I could not append to bootcmd to make boot process more verbose and
>> easier to monitor for automated testing.
>>
>> That is why, for now, I would suggest not updating the SPL/SD boot
>> test for Cubieboard.

Niek can tell how many times his tests catched regressions for his
OrangePi machine; I remember at least 3 occasions :)

Regards,

Phil.

