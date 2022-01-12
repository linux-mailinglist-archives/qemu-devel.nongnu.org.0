Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1C348C723
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:22:39 +0100 (CET)
Received: from localhost ([::1]:40120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7fSQ-00049s-2h
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:22:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n7edh-0000yt-HP; Wed, 12 Jan 2022 09:30:13 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:36297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n7edf-0008Vl-7j; Wed, 12 Jan 2022 09:30:12 -0500
Received: from [192.168.100.1] ([82.142.23.158]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MEUaQ-1n9IWk00gE-00Fz45; Wed, 12 Jan 2022 15:29:56 +0100
Message-ID: <e101fbe8-c69c-7735-3fd0-acee907754fe@vivier.eu>
Date: Wed, 12 Jan 2022 15:29:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] hw/timer/etraxfs_timer: Add vmstate for ETRAX timers
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211106105623.510868-1-f4bug@amsat.org>
 <8f417138-a3bb-7d07-bda9-db4740550f2f@amsat.org>
 <5cad7d04-1699-35d2-8d96-b236d451101d@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <5cad7d04-1699-35d2-8d96-b236d451101d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HnckyyjiOMuT6mK5hqSBm9WaY9oW4j9NyzSev3thmgdxbM5eHHL
 kQpx8Po1F7x/cRmWj6usIAr48IH8PSd9y8oDidBn1dK1J0D47JVLTsvQXUb5+c8sOa1Qac7
 X/+DO7g+wLxY3QLv+SD+JbeAIkuRXEhvSbSYjZ2cO+0BLC33zmilIR0q+F27uRlSIvwGCoe
 aZxkxAi5c1sbafyqIpEQw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pV3a0Jc+3Xc=:ATSERb5ArCPpAuI3ACoFpb
 N9FvuwG+sI3NQygbiU3REgFCjhM+Be31jm3KwcBjYo8DTE/k7+8SSOEB9Je4A0vJOfrkeUazz
 VS1/baHpqdGSvW1VIEB/mq2S+Dk+8PdxI4rNgUrNj0rRjGo+Phd7J2ZNiVT4J0WuDNWuYNIEs
 DDrUnrgEp0Tb+l/ZYYhX19oQwTYU6+pFTn7GmwiJqNoV8kpdfEsvwl+SGhFBP6izXmqhaElCE
 usyjhMy27ktfinBE+SMnrEUMoKc/x+irvj/MFm3MtbbiFd6KVkIf+Qkft1dhn99R3mnbNRITF
 LwS8v9BYxryS0Zwzvs/t/Wh4IGhnLw+0WWTH7JlaGwLHNrOOml9pV1yWeZvFoAzWuDa0HMXaF
 aeCqK41g3R9zhVTGj7lIaes5bjmGoEWA51nZhSSecyuZGTH1DBVoy7dm5cRUiSfpw9/tsaCMy
 2qhZ3kYsCOEjYDrWNL4IURsrd3JtqxPF/gRg6SnnBJRFo9D3kuUJvbfeRoO0gt3eC4/PhfEan
 ePUA1GECEJSgq5TnRkVCTgqj+nlhpdACc4mHoKu+ySmnOZNm12Pi8IYsfWYJ/RkKtyxtYsq6R
 RXIFjIIfqdXb/fheE2eh3P0oPzJBiypQCV3/UY/xT680g3DFSyG67GG1o57fghl8H/tggPe7Z
 fwUavST4YuG2Fi5UziTOTHtlPk1i9hRBi7M2XnpKB6c7iwLRvze8DGZkDj2WJbDYBR8g=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/12/2021 à 03:28, Richard Henderson a écrit :
> On 12/17/21 3:37 PM, Philippe Mathieu-Daudé wrote:
>> ping?
>>
>> On 11/6/21 11:56, Philippe Mathieu-Daudé wrote:
>>> Add the vmstate for the ETRAX timers.
>>> This is in theory a migration compatibility break
>>> for the 'AXIS devboard 88' CRIS machine.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>   hw/timer/etraxfs_timer.c | 34 +++++++++++++++++++++++++++++++++-
>>>   1 file changed, 33 insertions(+), 1 deletion(-)
> 
> 
> In that it matches another similar timer device:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
>>> +static const VMStateDescription vmstate_etraxfs = {
>>> +    .name = "etraxfs",
>>> +    .version_id = 0,
>>> +    .minimum_version_id = 0,
>>> +    .fields = (VMStateField[]) {
>>> +        VMSTATE_PTIMER(ptimer_t0, ETRAXTimerState),
>>> +        VMSTATE_PTIMER(ptimer_t1, ETRAXTimerState),
>>> +        VMSTATE_PTIMER(ptimer_wd, ETRAXTimerState),
>>> +
>>> +        VMSTATE_UINT32(wd_hits, ETRAXTimerState),
>>> +
>>> +        VMSTATE_UINT32(rw_tmr0_div, ETRAXTimerState),
>>> +        VMSTATE_UINT32(r_tmr0_data, ETRAXTimerState),
>>> +        VMSTATE_UINT32(rw_tmr0_ctrl, ETRAXTimerState),
>>> +
>>> +        VMSTATE_UINT32(rw_tmr1_div, ETRAXTimerState),
>>> +        VMSTATE_UINT32(r_tmr1_data, ETRAXTimerState),
>>> +        VMSTATE_UINT32(rw_tmr1_ctrl, ETRAXTimerState),
>>> +
>>> +        VMSTATE_UINT32(rw_wd_ctrl, ETRAXTimerState),
>>> +
>>> +        VMSTATE_UINT32(rw_intr_mask, ETRAXTimerState),
>>> +        VMSTATE_UINT32(rw_ack_intr, ETRAXTimerState),
>>> +        VMSTATE_UINT32(r_intr, ETRAXTimerState),
>>> +        VMSTATE_UINT32(r_masked_intr, ETRAXTimerState),
>>> +
>>> +        VMSTATE_END_OF_LIST()
>>> +    }
>>> +};
> 
> What I don't understand is how these controls get applied to qemu_irq after vmload, here or in any 
> other device.  It seems like we should have some post_load hook that calls timer_update_irq, etc.
> 

FWIW, in VMSTATE_PTIMER(), we use a vmstate_ptimer struct that registers a vmstate_info_timer with 
VMSTATE_TIMER_PTR(). vmstate_info_timer uses timer_get() to update or delete the timer when it is 
loaded.

Applied to my trivial-patches branch.

Thanks,
Laurent



