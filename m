Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10379422C48
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 17:22:19 +0200 (CEST)
Received: from localhost ([::1]:34514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXmGo-00035N-30
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 11:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXm3r-00013e-B4
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:08:55 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:53189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXm3l-0005Rv-8A
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 11:08:54 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MpUQm-1n8Bj10ODs-00pqkI; Tue, 05 Oct 2021 17:08:47 +0200
Subject: Re: [PATCH v2 08/12] macfb: add common monitor modes supported by the
 MacOS toolbox ROM
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211004211928.15803-1-mark.cave-ayland@ilande.co.uk>
 <20211004211928.15803-9-mark.cave-ayland@ilande.co.uk>
 <7994e73e-cbda-1bd1-68c4-250dd951ed51@vivier.eu>
 <66384935-4c8f-8220-8593-bfde37d05e1d@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <15fba2fe-77b0-78f4-ea55-9438ce976c18@vivier.eu>
Date: Tue, 5 Oct 2021 17:08:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <66384935-4c8f-8220-8593-bfde37d05e1d@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:huh5tk6W9BZ/TXhgWk8vxBk4mOkwjL/H7r/BRYqVm0XxfNLPkAf
 OsmNJrEFcuxGLSS3CLZP5ryK1PSKc3gzKf4Blaf8mX80CHvBAVillw68GytvQlsdNA/oMa4
 ef867rIFXeqO4EzjVTbtgiQ33EjloWmel9jcSPVFdlIn/Zw7lI3wfOl3fakgakCBPU9witj
 Mv0/4NKlVLnzgQnftImew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YGeUwas0HBU=:SaSiBRTNpZDG1YcfChfbqp
 RD+FLS3NAWgzHfCDm9XRA7zvtWegOhdAY+6tClYpd4XAg7/1NoodafzKCr4iOyesbB6b6A+td
 18eBTgmZ9BBoj1gy+Z9WrW90ObvxxvIXf3iedBcmYiMbpE4u+xy179D9oFQQfyfb4hLogS+dX
 7mVrxj+ljQUSv4qGaccxE5W6uSkka/y761p1uPaZFV6OO0AloJXwNiTWjNYcBADR/sykSrjl5
 Xo2sQkOz1BgGJBmGBHpk6a6bPBmulXqNM5AW1BqcDKK03DaYIc67YBK2+tdzlscLxzFZ2Esuh
 ImnMLUljybqKnbS4tvhf1u0rBuyxtcofBySn9YVkyZMC4cQ+RriRJ6dgJT5z+/7bTXPuCEKvM
 QGJYeefRiFOVhM41R6ZqKtjOI9zJBLcb9bTW7MT32bHWMykZ1rWKcAlhkfopLL7NoHsac5v3l
 2pD6v6uEzxhJ+B0CbYoBAaPLxt3008UueXiU1aX0MHdZsHnljarqpcjo2Lpq/OthefmKfGwkU
 yuj2Xz2CVhEVv2P0u4ikj8tYtPpRBnbqBM18KnsGKYvhopPAen1oRCKuQzBT5wJ2H1bG0WSZC
 Zp9e9kFqaPdPJpBwoYW2ENVHUtTaqQQRl6qxLnaMe6uxSUbpiwCZJ5GcUz1kv+ILAqL5NlJEp
 gbIZexlnnhr9Z6Nu9L5UqPie6El1r4bqY/om93/TwvHCrhDAK3wRWUx6CeXTaG42oWVyiC0Or
 k72wwQPm5FwZOXKEeUUHWANojZW438yaNsaQmA==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Le 05/10/2021 à 13:38, Mark Cave-Ayland a écrit :
> On 05/10/2021 10:50, Laurent Vivier wrote:
> 
>> Le 04/10/2021 à 23:19, Mark Cave-Ayland a écrit :
>>> The monitor modes table is found by experimenting with the Monitors Control
>>> Panel in MacOS and analysing the reads/writes. From this it can be found that
>>> the mode is controlled by writes to the DAFB_MODE_CTRL1 and DAFB_MODE_CTRL2
>>> registers.
>>>
>>> Implement the first block of DAFB registers as a register array including the
>>> existing sense register, the newly discovered control registers above, and also
>>> the DAFB_MODE_VADDR1 and DAFB_MODE_VADDR2 registers which are used by NetBSD to
>>> determine the current video mode.
>>>
>>> These experiments also show that the offset of the start of video RAM and the
>>> stride can change depending upon the monitor mode, so update macfb_draw_graphic()
>>> and both the BI_MAC_VADDR and BI_MAC_VROW bootinfo for the q800 machine
>>> accordingly.
>>>
>>> Finally update macfb_common_realize() so that only the resolution and depth
>>> supported by the display type can be specified on the command line.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>>> ---
>>>   hw/display/macfb.c         | 124 ++++++++++++++++++++++++++++++++-----
>>>   hw/display/trace-events    |   1 +
>>>   hw/m68k/q800.c             |  11 ++--
>>>   include/hw/display/macfb.h |  16 ++++-
>>>   4 files changed, 131 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
>>> index f98bcdec2d..357fe18be5 100644
>>> --- a/hw/display/macfb.c
>>> +++ b/hw/display/macfb.c
>>>
>> ...
>>> +static MacFbMode *macfb_find_mode(MacfbDisplayType display_type,
>>> +                                  uint16_t width, uint16_t height,
>>> +                                  uint8_t depth)
>>> +{
>>> +    MacFbMode *macfb_mode;
>>> +    int i;
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(macfb_mode_table); i++) {
>>> +        macfb_mode = &macfb_mode_table[i];
>>> +
>>> +        if (display_type == macfb_mode->type && width == macfb_mode->width &&
>>> +                height == macfb_mode->height && depth == macfb_mode->depth) {
>>> +            return macfb_mode;
>>> +        }
>>> +    }
>>> +
>>> +    return NULL;
>>> +}
>>> +
>>
>> I misunderstood this part when I reviewed v1...
>>
>> It means you have to provide the monitor type to QEMU to switch from the default mode?
> 
> Not as such: both the MacOS toolbox ROM and MacOS itself offer a fixed set of resolutions and depths
> based upon the display type. What I've done for now is default the display type to VGA since it
> offers both 640x480 and 800x600 in 1, 2, 4, 8, 16 and 24-bit colour which should cover the most
> common use of cases of people wanting to boot using the MacOS toolbox ROM.
> 
> Even if you specify a default on the command line, MacOS still only cares about the display type and
> will allow you to change the resolution and depth dynamically, remembering the last resolution and
> depth across reboots.
> 
> During testing I found that having access to the 1152x870 resolution offered by the Apple 21"
> monitor display type was useful to allow larger screen sizes, although only up to 8-bit depth so I
> added a bit of code that will switch from a VGA display type to a 21" display type if the graphics
> resolution is set to 1152x870x8.
> 
> Finally if you boot a Linux kernel directly using -kernel then the provided XxYxD is placed directly
> into the relevant bootinfo fields with a VGA display type, unless a resolution of 1152x870x8 is
> specified in which case the 21" display type is used as above.
> 
>> But, as a user, how do we know which modes are allowed with which resolution?
>>
>> Is possible to try to set internally the type here according to the resolution?
>>
>> Could you provide an command line example how to start the q800 with the 1152x870 resolution?
> 
> Sure - simply add "-g 1152x870x8" to your command line. If the -g parameter is omitted then the
> display type will default to VGA.
> 

Thank you for the explanation.

Perhaps you can add in the error message the list of the available mode and depth?
(it's not a blocker for the series, it can be added later)

As an user, it's hard to know what are the allowed values.

Thanks,
Laurent

