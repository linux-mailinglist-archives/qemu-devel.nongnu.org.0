Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF954246AB
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 21:27:57 +0200 (CEST)
Received: from localhost ([::1]:33924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYCa4-0003qh-9w
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 15:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYCXC-0000Q2-GB
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 15:24:58 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:46429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYCXA-0006Fx-Bs
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 15:24:58 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mgebs-1mzXbe1PkS-00h2PB; Wed, 06 Oct 2021 21:24:54 +0200
Subject: Re: [PATCH v2 08/12] macfb: add common monitor modes supported by the
 MacOS toolbox ROM
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211004211928.15803-1-mark.cave-ayland@ilande.co.uk>
 <20211004211928.15803-9-mark.cave-ayland@ilande.co.uk>
 <7994e73e-cbda-1bd1-68c4-250dd951ed51@vivier.eu>
 <66384935-4c8f-8220-8593-bfde37d05e1d@ilande.co.uk>
 <15fba2fe-77b0-78f4-ea55-9438ce976c18@vivier.eu>
 <52fe2fc5-b4fb-8888-9b80-0e362c52ebb5@ilande.co.uk>
 <3a798740-d39e-f2b8-8b3c-1a4814f184ea@vivier.eu>
 <f8d64bc7-fc6e-dd14-4ed5-a55a947ef8cb@ilande.co.uk>
 <fc202c89-cbbc-9d87-b3e2-fcba8a82b495@vivier.eu>
 <20607ac1-a061-e102-0652-33440f13504b@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <07079a9e-f607-f6df-e1f4-70bdffb1e39f@vivier.eu>
Date: Wed, 6 Oct 2021 21:24:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20607ac1-a061-e102-0652-33440f13504b@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XNThpJcWXwNbEIt/Yuv0V2XWLkapdvkvueamQt5aVdwvdDxbSs6
 raSX78FRrODu9dSfubTPwBK99heEwwVdu2LN7hQAPShQRb1LpaBgBY0mtqKvocV9ry+UxAq
 JOjViwNiaKp7A3uI2P5Cgnt4zSIZjqKWjeLEOXg94pOnQXMRPx5AbfgLsJkXcmL/IwwMZSr
 vT85SS8TDM/4xEaQ3SOTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:o4uSvMQ8Gok=:dLKfHmtaVJvom1h5QoOkNn
 d7VkJRHYruF93lHfJpyO8vGdFB1aNBth2R7yo6FC7RvSfnKF144gmey4GUV698bUmPs7TQgRU
 yhdkjwncIvh2PGJT88s0YvGwYdDKT1GUuPvmQFo9XuCB7pakRc4hsedohFHq4vxGw4jZIzepa
 6EaoNRacXagR5zu21nisIT5HTRSwh49eXbSEqk5pbemObVA3SqYn9Z1OFiZeQ3aGH6iw3TddB
 vC2LAfpsfsEXwwRkyKAa+dpg+FbinSwSbFwigMVGyBz+qF/TtSA0zGkfLgFPobqtqFjW1ghEA
 jlnq/008h+mHsvf+OznpKpPOQdFHs4q1VZ/WDSzrTc6Sv1AWuGoNjhWj3SX4tCiHxs7z3z3HN
 QdU57Xsvk72WwOEj7+DuGw3bco9Q053FMso7tR9WpWP/pbNtd6aivyd7qy8J7ZPupV1Yn+HL9
 yvCKGmiSPATatlYIoWaS8H5yWFDKyj/O57NvOrRwgC5GR8XlbCbQrYfZ8cRfjEkstnHWrnY9W
 w3Ppq3zDk4VdLZHzFekDeczaz/WFT+4YDFO4E7xzwS9ZtRA727clDAlCg7khcXDO45WcjIMGy
 0J2JdwcnVACfRbvthf5jcsVQ7HPkjcdi9b1FLjabfzUNh6j19Mms+H9NYaaxALy6sdzPQhWzn
 oC99TPQPmDhgZEbKXFkbG+oYjEqG/cM0RV5Qv9APFYUPC6dnnRDwif0CPcji/DuGB8Td9FaEZ
 OWo1Ahm5MNoP3Z6RBRDzZosR6RSANvOYgC95VA==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.964,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 06/10/2021 à 18:09, Mark Cave-Ayland a écrit :
> On 06/10/2021 16:46, Laurent Vivier wrote:
>> Le 06/10/2021 à 15:54, Mark Cave-Ayland a écrit :
>>> On 06/10/2021 13:24, Laurent Vivier wrote:
>>>
>>>>> This is where it becomes a bit trickier, since technically booting Linux with -kernel you can use
>>>>> any supported values as long as everything fits in the video RAM which is why there isn't
>>>>> currently
>>>>> a hard-coded list :)
>>>>>
>>>>
>>>> We need the list of "supported values". I don't want to read the code or try values combination
>>>> until it works.
>>>>
>>>> In a perfect world, I would like to be able to use any value I want with "-kernel".
>>>>
>>>> For instance I was using "-g 1200x800x24" and it was working fine.
>>>>
>>>> Now I have:
>>>>
>>>> qemu-system-m68k: unknown display mode: width 1200, height 800, depth 24
>>>>
>>>> If it's not possible (because the original hardware cannot provide it, and we don't know the base
>>>> address or things like that), we don't need the list of the display id, but the list of available
>>>> modes: (width,height,depth).
>>>>
>>>> Rougly, something like:
>>>>
>>>> qemu-system-m68k: unknown display mode: width 1200, height 800, depth 24
>>>> Available modes:
>>>>       1152x870x8
>>>>       1152x870x4
>>>>       1152x870x2
>>>>       1152x870x1
>>>>       800x600x24
>>>>       800x600x8
>>>>       800x600x4
>>>>       800x600x2
>>>>       800x600x1
>>>>       640x480x24
>>>>       640x480x8
>>>>       640x480x4
>>>>       640x480x2
>>>>       640x480x1
>>>>
>>>> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
>>>> index 5b8812e9e7d8..4b352eb89c3f 100644
>>>> --- a/hw/display/macfb.c
>>>> +++ b/hw/display/macfb.c
>>>> @@ -438,6 +438,26 @@ static MacFbMode *macfb_find_mode(MacfbDisplayType display_type,
>>>>        return NULL;
>>>>    }
>>>>
>>>> +static gchar *macfb_mode_list(void)
>>>> +{
>>>> +    gchar *list = NULL;
>>>> +    gchar *mode;
>>>> +    MacFbMode *macfb_mode;
>>>> +    int i;
>>>> +
>>>> +    for (i = 0; i < ARRAY_SIZE(macfb_mode_table); i++) {
>>>> +        macfb_mode = &macfb_mode_table[i];
>>>> +
>>>> +        mode = g_strdup_printf("    %dx%dx%d\n", macfb_mode->width,
>>>> +                               macfb_mode->height, macfb_mode->depth);
>>>> +        list = g_strconcat(mode, list, NULL);
>>>> +        g_free(mode);
>>>> +    }
>>>> +
>>>> +    return list;
>>>> +}
>>>> +
>>>> +
>>>>    static void macfb_update_display(void *opaque)
>>>>    {
>>>>        MacfbState *s = opaque;
>>>> @@ -620,8 +640,13 @@ static bool macfb_common_realize(DeviceState *dev, MacfbState *s, Error
>>>> **errp)
>>>>
>>>>        s->mode = macfb_find_mode(s->type, s->width, s->height, s->depth);
>>>>        if (!s->mode) {
>>>> +        gchar *list;
>>>>            error_setg(errp, "unknown display mode: width %d, height %d, depth %d",
>>>>                       s->width, s->height, s->depth);
>>>> +        list =  macfb_mode_list();
>>>> +        error_append_hint(errp, "Available modes:\n%s", list);
>>>> +        g_free(list);
>>>> +
>>>>            return false;
>>>>        }
>>>
>>> Hi Laurent,
>>>
>>> Thanks for the example - I can certainly squash this into patch 8.
>>
>> yes, please.
> 
> Okay I'll do that for a v3 (and also split the 1st patch that Phil suggested).
> 
>>> As for allowing extra resolutions via -kernel, since the check is being done in
>>> macfb_common_realize() then it would be possible to add a qdev property that only gets set when
>>> -kernel is used on the command line which bypasses the mode check if you prefer?
>>>
>>
>> I think it can wait and be done by a patch later. For the moment we can focus on MacOS.
>>
>>> I'm not sure that your existing example of "-g 1200x800x24" (or indeed any resolution with 24-bit
>>> depth) with -kernel will still work after this patchset given that the 24-bit encoding scheme has
>>> changed. Presumably this would also need a corresponding change in the bootinfo/kernel framebuffer/X
>>> configuration somewhere?
>>
>> The kernel framebuffer should be easy to fix, if needed, normally we pass the needed information via
>> the bootinfo structure.
>>
>> My X configuration is broken for a while. With debian/sid I've never been able to start X (even on a
>> real q800, I think), and with debian/etch we need a special kernel as the ADB stack has been broken
>> with old kernel. I was not able to start X for a while now...
> 
> FWIW I found that the last set of ADB fixes in mac_via.c actually fixed ADB on old kernels again (I
> was able to use keyboard and mouse on the 4.15 kernel you used for the original patches), so you may
> be able to get debian/etch working in QEMU. I'd expect forcing EMILE into a 24-bit depth on a real
> Quadra 800 would also show the same issue here.
> 

In fact, I was trying the etch kernel, 2.6.32 that was never able to boot before because VBL
interrupt was not implemented. Now, with your series it boots (congratulation) but there is some
other issues in ADB but I don't think it's related to the changes in QEMU.

I've found another kernel on my disk (4.1.39) and I'm able to start a gnome-session with 1152x870x8
mode. ADB works well. There is an issue with gdm that doesn't take characters from the keyboard but
if I start X manually and then gnome-sessions I'm able to play with it.

Thanks,
Laurent

