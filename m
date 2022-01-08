Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BF848851A
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 18:48:57 +0100 (CET)
Received: from localhost ([::1]:33642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Fpo-0005hN-96
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 12:48:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6Foh-0004yV-20
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 12:47:47 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:59199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6Fof-00085T-Bn
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 12:47:46 -0500
Received: from [192.168.100.1] ([82.142.12.178]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mgefy-1mRQLT0vmO-00h8lW; Sat, 08 Jan 2022 18:47:43 +0100
Message-ID: <d1dd886a-df2c-062a-ab8d-999071f037c4@vivier.eu>
Date: Sat, 8 Jan 2022 18:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220108164147.30813-1-mark.cave-ayland@ilande.co.uk>
 <af5ad708-bdef-af6c-bb38-500f0c62e92a@vivier.eu>
 <48dfc1f0-4a83-2bbb-4c5e-f973b9b7e0b3@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] macfb: fix VRAM dirty memory region logging
In-Reply-To: <48dfc1f0-4a83-2bbb-4c5e-f973b9b7e0b3@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1GhYJFKTdKWbYJ7McVvDlDIfhUZNZhZ/hDD9Str2nLyZ/i2+r/j
 H7e2VqVpy4znlolFNYYPhG1xsbz64OTcPRqhLp3zkso9CjBO0bEb3eRM27D1r+8saNjCuhb
 uY0wFPXcm2BkNOeskHtk05xXsCeK/e3XOYc3iSwpjHqDQZHqnsdfH58Tk9vxhz4iHe8PdlB
 H2QRjDoFwEXNy5HwBlmoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PMadmeFhIGo=:pfEyw1eJVkAqMuSO0q1/d7
 KOxSJOvfrPfYcIpG3UK7Zr7trVe0uKOAToIXR2Z5Kq5UfF+HW+KiSLUT4gN8bbYvVTEE3jNMN
 lf2paE2caQsvEpvqv2mzJHs+SgVBZS7xbz9BenxY/2oLttpQx6jO4uamHOc466OalB+GhmVhg
 tPsJxQyUF+tQBSBBTEtZFbiWXVwro6WtewjtK85lnAEWpNoaPW/Im/qXHO629ggbaCvDKbYkl
 3QoM8J0vkV0wCtRGIxhiJtnYdkLCklpVV9WJ9lgdtgJqUznyacH4X3+PnNysvlFGZLHzcrqXJ
 uOEZMwC520fCSJLLIckbVDIj2hWa5ez43ctGxFRNae9Wsr2T4z1h08NEc2N+JgZhSyKxpWRxo
 KEonEB7bsN7/vx0c0Okwrs0CJNW/Rq8l9DMi9JrubGE0vD4bhxJHijrmqfVnnMOvVVrkTcyez
 oM6Y30rz0bRQTcHp0vZMlX49J6pWszPdqzL3NQh07HXDX3Ve012RtllqOGoS/vlNp8lrPCZoS
 cClP4RJ65ecvyJRvaUK7pjpmY96bAnzyT55k6akHBY7qA+MgUwnjpQ3NJTpu4yJ8t8foh1pa1
 gERDrUarRG8s2AwonhrxammSys14Ca53vAA5Z167UU8jZkKjaN5cyDY7v9BmQyZLGiETvAyoZ
 dbdw2jtZtSdf3H0u8uyPR0PpBgxsRKoo52/Bkmrzif8DHl8EPV8sjJgDx48KS2aCq44c=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 08/01/2022 à 18:15, Mark Cave-Ayland a écrit :
> On 08/01/2022 16:53, Laurent Vivier wrote:
> 
>> Le 08/01/2022 à 17:41, Mark Cave-Ayland a écrit :
>>> The macfb VRAM memory region was configured with coalescing rather than dirty
>>> memory logging enabled, causing some areas of the screen not to redraw after
>>> a full screen update.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> Fixes: 8ac919a065 ("hw/m68k: add Nubus macfb video card")
>>> ---
>>>   hw/display/macfb.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
>>> index 277d3e6633..4bd7c3ad6a 100644
>>> --- a/hw/display/macfb.c
>>> +++ b/hw/display/macfb.c
>>> @@ -661,9 +661,9 @@ static bool macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
>>>       memory_region_init_ram(&s->mem_vram, OBJECT(dev), "macfb-vram",
>>>                              MACFB_VRAM_SIZE, &error_abort);
>>> +    memory_region_set_log(&s->mem_vram, true, DIRTY_MEMORY_VGA);
>>>       s->vram = memory_region_get_ram_ptr(&s->mem_vram);
>>>       s->vram_bit_mask = MACFB_VRAM_SIZE - 1;
>>> -    memory_region_set_coalescing(&s->mem_vram);
>>>       s->vbl_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, macfb_vbl_timer, s);
>>>       macfb_update_mode(s);
>>
>> I understant why you add memory_region_set_log() but I don't understand why you remove 
>> memory_region_set_coalescing().
> 
> Looking at the other display devices, only VGA and cirrus use memory_region_set_coalescing() and 
> that's on the IO ports rather than the VRAM.
 >
> Based upon this my suspicion is that this is mainly a vmexit optimisation when using KVM which isn't 
> relevant here for macfb.

You're right.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Thanks,
Laurent

