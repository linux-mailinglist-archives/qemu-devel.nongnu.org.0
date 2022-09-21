Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F615E4F86
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 20:35:58 +0200 (CEST)
Received: from localhost ([::1]:57502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob4KC-0006qS-4A
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 14:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1ob4HX-0005MM-LW
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 14:17:13 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1ob4HU-0004Ug-6p
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 14:17:10 -0400
Received: by mail-wr1-x430.google.com with SMTP id t7so11325669wrm.10
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 11:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=JMeQg9xpwl85Q548OF7qKB6+NLxYV9R0oLD++sTOJQ0=;
 b=cAZuAB5srvM7KFehd6pgRxsZEIgOkROOEIJPxBZlMDCpjBAz1PccTRCJZ+iZBp0MkW
 pwE+qvIGd14eyzGgrvW2YdYoUSwfFcq9cz3osh//GX9LTIo0UQrnDcKTK9BJLxQFSO2M
 N699uJnJVb28wYL/8ylshcG26peCmIRoSvvQtdxqeL+eSZo3gncvpcezLvCpEtb/KzF1
 TnrREXe3KD4ISdn4afWxeqWE9Iav16xSI+PtgPDpVgMhFlB3SqPev9dkNBg+6a6+AA/7
 KILyiGdAZuebi2vDhaOSWDfLN/hbrFgssUzMRNH6cs8PCUfmwfltQrQ7FHTLc3osOQ1V
 AvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=JMeQg9xpwl85Q548OF7qKB6+NLxYV9R0oLD++sTOJQ0=;
 b=7VNxypcBQ61ilZlkpghAiGkEYDfai2pC4V9fhmtxS9eyMkvgoO0lY31T5tsHO4oo1X
 ZhzNihamZ2Oi7rEqiQSB0zzYiAUzM/DXbFmDyl20hGvTDd1u5VgzshXIS+aIfWtHf962
 GqvLr+ESPB+kHL5R2R98cJj9sBEWsfA1my9xihjFR5bRDkrjgeej6IwOit7y8RvbFhZc
 TO77bK6IzBFJtG2Xhct/UsGh0lCl5MTugiqxhjEw9ufjgcFi/O3ilZRn3m1hGKjnZ//I
 rNulKcvrrtOc8CCoPXuNxub9jNc0DQGgT8vyYCYKrL3gO7IWMTguV7NKOQNv2vY/3wQE
 6CZg==
X-Gm-Message-State: ACrzQf19esOTSyWB9jquvq8pRLxUMyO9wKg8SQ+k3Y0NCoQ9PPgEICJ+
 0imbFkfL2eGhwRj2930TW18=
X-Google-Smtp-Source: AMsMyM6w7QLJy6e4p+5V+P/vkVfNvGLaUuBXw8TVaTrLIHerrrwPM9HOBh48jPTuXsLJQWf+7OMYTQ==
X-Received: by 2002:adf:fc87:0:b0:228:7e07:73c with SMTP id
 g7-20020adffc87000000b002287e07073cmr17431571wrr.162.1663784225872; 
 Wed, 21 Sep 2022 11:17:05 -0700 (PDT)
Received: from [192.168.33.3] ([147.235.207.82])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c4ece00b003b477532e66sm6613852wmq.2.2022.09.21.11.17.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 11:17:05 -0700 (PDT)
Message-ID: <fffdb5eb-0a84-9bcf-e05a-dbe8872280db@gmail.com>
Date: Wed, 21 Sep 2022 21:17:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 0/1] hw/display: expose linear framebuffer address in
 Bochs VBE registers
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220920154922.248790-1-liavalb@gmail.com>
 <20220921061447.e2ii6q24f2e6n64q@sirius.home.kraxel.org>
From: Liav Albani <liavalb@gmail.com>
In-Reply-To: <20220921061447.e2ii6q24f2e6n64q@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-3.702, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 9/21/22 09:14, Gerd Hoffmann wrote:
> Nope.  Even if you fix the framebuffer address conflict you still have
> the io address conflict.
Yeah, that is why I explicitly said that this is needed to be fixed as 
well in later patches.
> Yep.  That's why isa-pc is pretty much unused these days.

Well, I can't say I use it frequently, but I do test it with the 
SerenityOS kernel and it works pretty well.
The SerenityOS kernel is able to drive an isa-vga device just fine after 
my patches were merged yesterday (in the GitHub pull request I provided 
a link to), so I do see that machine type as a valuable test platform.

> When you want build a sysbus variant of the bochs-display device and
> make that discoverable by the guest somehow (dt or acpi) you can expose
> both io ports and framebuffer address that way.  No need to touch the
> bochs dispi interface for that.
This is an interesting idea. A sysbus-bochs-display device might work 
well as you suggested,
instead of using an isa-vga device.
>
>>    This idea is quite neat in my opinion, because it could speed up the
>>    boot of such VM while still providing sufficient display capabilities
>>    for those we need them. It could help developers to test their OSes
>>    on such hardware setups to ensure multi-monitor configuration works
>>    reliably when there's no PCI bus at all but many framebuffer devices
>>    being used in one VM.
> Why not just use virtio-gpu?

Trying to run this command:
qemu-system-x86_64 -M microvm -m 2048 -device virtio-gpu

Results in:
qemu-system-x86_64: -device virtio-gpu: No 'PCI' bus found for device 
'virtio-gpu-pci'

The idea was to not use PCI at all but still to have multiple 
framebuffer devices. So clearly virtio-gpu
is not usable in this situation.

>
>> 2. This is more related to the SerenityOS project - I prefer to not
>>    hardcode physical addresses at all wherever I can do so. This makes
>>    the code cleaner and more understandable as far as I observe this from
>>    the angle of the person which is not me, that tries to make sense from
>>    the code flow.
> Yea, fully agree, but why continue to use non-discoverable isa bus
> devices then?

On the ISA-PC machine, I still want to be able to boot into a graphical 
environment with the SerenityOS kernel. The only option is
to use the isa-vga device, which works OK.
On the microvm machine, it is really not that important if I use the 
isa-vga device or a sysbus-bochs-display device (when I implement that
device).
I just want to support as many x86 platform configurations as possible - 
modern non-PCI machines, ISA-PC machines and regular i440fx/Q35 machines.

>
>> 3. The costs of adding this feature are pretty negligible compared to
>>    the possible value of this, especially if we apply the idea of running
>>    multiple ISA-VGA devices on one microvm machine. Still, the only major
>>    "issue" that one can point to is the fact that I bump up the Bochs VBE
>>    version number, which could be questionable with how the feature might
>>    be insignificant for many guest OSes out there.
> Touching isa-vga at this point doesn't make sense at all.  We simply
> can't move around the framebuffer without screwing up users.
That's an issue I didn't consider, but this is not a real problem on the 
microvm machine
if you use the device tree approach to expose the resources of the 
device, which in some sense makes it unnecessary
to use the bochs dispi interface to expose the framebuffer physical address.
>
> Also I don't see any actual value in this.  Even considering the
> multiple devices case the patch is a partial solution only (handles
> the framebuffer but not the ioports) which is pointless.
Considering the possibility of exposing the framebuffer address within 
the device tree blob, it is indeed not making more value
to go with this approach. I'm still fond of the idea to create a sysbus 
variant of the bochs-display device, so I might work on that instead :)

Best regards,
Liav


