Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314794AAE9A
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 10:34:03 +0100 (CET)
Received: from localhost ([::1]:42192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGdvm-000475-BC
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 04:34:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGdsl-0002u8-QI
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:30:59 -0500
Received: from [2001:41c9:1:41f::167] (port=49242
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGdsh-0002n5-0T
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:30:54 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nGds6-0002bw-3t; Sun, 06 Feb 2022 09:30:18 +0000
Message-ID: <547de7d2-b7a0-5077-acf2-b72e326de544@ilande.co.uk>
Date: Sun, 6 Feb 2022 09:30:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20220203000550.36711-1-f4bug@amsat.org>
 <3ba67c7d-f10b-ae22-61f4-962164ba37b4@ilande.co.uk>
 <63bd68c2-2ae7-726d-616b-893afc71df0@eik.bme.hu>
 <CAFEAcA820MLMqW4k89sgxiyzYdYajnTLfwQg3JoszuTMMSA3uA@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA820MLMqW4k89sgxiyzYdYajnTLfwQg3JoszuTMMSA3uA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2] hw/display/tcx: Mark the VRAM dirty upon reset
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Andreas Gustafsson <gson@gson.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/02/2022 15:39, Peter Maydell wrote:

> On Sat, 5 Feb 2022 at 14:24, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>
>> On Sat, 5 Feb 2022, Mark Cave-Ayland wrote:
>>> On 03/02/2022 00:05, Philippe Mathieu-Daudé via wrote:
>>>
>>>> When resetting we don't want to *reset* the dirty bitmap,
>>>> we want to *set* it to mark the entire VRAM dirty due to
>>>> the memset() call.
>>>>
>>>> Replace memory_region_reset_dirty() by tcx_set_dirty()
>>>> which conveniently set the correct ranges dirty.
>>>>
>>>> Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
>>>> -    memory_region_reset_dirty(&s->vram_mem, 0, MAXX * MAXY * (1 + 4 + 4),
>>>> -                              DIRTY_MEMORY_VGA);
>>>> +    tcx_set_dirty(s, 0, MAXX * MAXY);
>>>>        s->dac_index = 0;
>>>>        s->dac_state = 0;
>>>>        s->cursx = 0xf000; /* Put cursor off screen */
>>>
>>> I don't think the size calculation of MAXX * MAXY is correct when comparing
>>> with above? I think it's easiest just to use the same approach as
>>
>> Xonsidering that the memset has the same length it should be correct as
>> that's what has been changed (assuming tcx_set_dirty works correctly), but
>> maybe there's some trick here I don't know about.
> 
> The memset chosen size seems odd -- MAXX and MAXY are
> constants, but the size of the memory block here is
> s->vram_size * 9, which might be smaller than MAXX * MAXY...
> 
>>> update_palette_entries() here e.g.
>>>
>>>     tcx_set_dirty(s, 0, memory_region_size(&s->vram_mem));
>>
>> This may be an overkill. Although probably does not matter but it's still
>> cleaner to only set dirty what has been changed otherwise you've just
>> disabled dirty tracking. On the other hand, if this is a reset routine do
>> you only want to clear the displayable part of vram or the whole vram?
> 
> I think we should clear the whole of the vram -- it ought to go
> back to the same state as when the device was completed. If I'm
> reading the sun4m board code correctly, the other parts of
> the vram are mapped into the guest address space too.
> 
> So I would go for
>      memset(s->vram, 0, memory_region_size(&s->vram_mem));
>      memory_region_set_dirty(&s->vram_mem, 0, memory_region_size(&s->vram_mem),
>                              DIRTY_MEMORY_VGA);
> 
> We can then delete the MAXX and MAXY defines, which were
> previously used only in these two lines and which don't actually
> have any relationship to the maximum size of the framebuffer.

That makes sense to me. My guess is that MAXX and MAXY were originally used for 
calculations on the original 8-bit framebuffer and the size calculation wasn't 
updated when 24-bit support was added.

> The handling of the vram buffer seems weird in this device overall,
> though -- the memory block is divided into three parts
>   * main vram, one byte per pixel
>   * vram24, four bytes per pixel
>   * cplane, four bytes per pixel
> 
> As far as I can see, only if depth=24 (fixed at device creation
> time) do we use the vram24 and cplane parts. But we create the
> memory block at the same size regardless of depth and we expose
> the vram24 and cplane parts to the guest as sysbus MMIO regions
> that are mapped into guest memory regardless of depth...

(goes and looks)

It does look a bit odd certainly. Without Blue Swirl being around all I can only 
guess as to why everything is configured to use an alias onto a single VRAM memory 
region :/

As for exposing the vram24 and cplane parts, I don't think it matters since 24-bit 
mode is clearly designed to be backwards compatible with 8-bit mode. During 
initialisation OpenBIOS reads the colour depth using the fw_cfg interface and adds 
the registers for that mode into the DT as required so the correct information is 
exposed to the guest.


ATB,

Mark.

