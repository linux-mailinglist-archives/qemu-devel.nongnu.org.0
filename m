Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B4D423DB4
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 14:27:18 +0200 (CEST)
Received: from localhost ([::1]:44506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY60z-0007nI-Jl
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 08:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mY5yg-0006zJ-E3
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 08:24:54 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:52765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mY5yQ-0007JZ-4C
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 08:24:50 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MeTHG-1n63DI2XGm-00aVtQ; Wed, 06 Oct 2021 14:24:32 +0200
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211004211928.15803-1-mark.cave-ayland@ilande.co.uk>
 <20211004211928.15803-9-mark.cave-ayland@ilande.co.uk>
 <7994e73e-cbda-1bd1-68c4-250dd951ed51@vivier.eu>
 <66384935-4c8f-8220-8593-bfde37d05e1d@ilande.co.uk>
 <15fba2fe-77b0-78f4-ea55-9438ce976c18@vivier.eu>
 <52fe2fc5-b4fb-8888-9b80-0e362c52ebb5@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 08/12] macfb: add common monitor modes supported by the
 MacOS toolbox ROM
Message-ID: <3a798740-d39e-f2b8-8b3c-1a4814f184ea@vivier.eu>
Date: Wed, 6 Oct 2021 14:24:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <52fe2fc5-b4fb-8888-9b80-0e362c52ebb5@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BANymFVwcLuHN7EznIo02RGbB2srq9Ngx+AiOFjxTvhqQ/iv6O/
 nyC4k0i+g9wUJkv1Ga12RcQSotCJrfUe6ejoVpMzjQJ0tSA/uE+WRPLwCi7ft6KBw2p3KvA
 9OA3mo5v4Zng57tkvs2Pcwxw4pjwSpKTHz6cKxOe/7YAnN+AxkoJQI3KzHVJAeAZDW8ztdg
 eqnCgF8Eav5X890OJGTSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EzI+SmYvGuc=:EE8+1Cy8PiM9LaUBJGvk+b
 rmBFUmPD6WuhbhgnDigT3ahB7PZPJSkPVYCdI+FCmhhJXuLCflgABXpt6WLtY0oeXoe2OkEKP
 UFFgLirznjZsbX5JodR//SYo/RR2vJ97q5rcPuU7m/DyjQiFzEKDI3AVfGjSUsitJLCnn/lcR
 bAODWPJkxUJTnjRciRRjcM8ZuiMgXBO7qU0e7SzmINEMrcjIjgkycNcOXsOUst78BZRQZq48t
 1K3fPDEN5sCIy1jvL9O1EwjUzQq63TcyEEHfuwqz2U+ZvdAPimTkEt8rsJ86eZR7QN5hHtXP+
 T+OmdXc9McFLH+iBYkIq/rmtgs7HeF25lvGABa6gOVp0P7YY2mTsU2pqKe/ck0T1MuP20+wiU
 SN7SZJO5RCyDFc3J0aKwwtK3fRKaViRdhle+cZ24eBFMU+yzg+gMTW/5HyOnw117H476aZR9B
 f/QhqiVxzBSGQIJLAUUU7XZUoUauMoHu7NE8NGwBTG7WSNk6+PvfUbETWj+B36GC/InO7Qsx+
 BCqQUtF8C3/GUbYWCmASG5irj4BpPK0K2kGbgTZmfmhDAuukUHvt2BhHVQxBGcVM4ncc36vog
 hCe3NSPdxWEhbsxfBLDG1OBqEMaypl6fdRJYTQg56DLPUW817C5cOH2jvf0AHTsBsCCABch5u
 HEYeJrhLVG1Ar50KF+s12HN43l3QnVP3Bf8r4O9m1uGwuSRbAijVoeBAfa4Rv8L+nNsAUPio/
 M+G/6415/jjjppOnS4RCvVyl2uOoJJS0FHdKWA==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) NICE_REPLY_A=-1.964,
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

Le 05/10/2021 à 17:33, Mark Cave-Ayland a écrit :
> On 05/10/2021 16:08, Laurent Vivier wrote:
> 
>> Le 05/10/2021 à 13:38, Mark Cave-Ayland a écrit :
>>> On 05/10/2021 10:50, Laurent Vivier wrote:
>>>
>>>> Le 04/10/2021 à 23:19, Mark Cave-Ayland a écrit :
>>>>> The monitor modes table is found by experimenting with the Monitors Control
>>>>> Panel in MacOS and analysing the reads/writes. From this it can be found that
>>>>> the mode is controlled by writes to the DAFB_MODE_CTRL1 and DAFB_MODE_CTRL2
>>>>> registers.
>>>>>
>>>>> Implement the first block of DAFB registers as a register array including the
>>>>> existing sense register, the newly discovered control registers above, and also
>>>>> the DAFB_MODE_VADDR1 and DAFB_MODE_VADDR2 registers which are used by NetBSD to
>>>>> determine the current video mode.
>>>>>
>>>>> These experiments also show that the offset of the start of video RAM and the
>>>>> stride can change depending upon the monitor mode, so update macfb_draw_graphic()
>>>>> and both the BI_MAC_VADDR and BI_MAC_VROW bootinfo for the q800 machine
>>>>> accordingly.
>>>>>
>>>>> Finally update macfb_common_realize() so that only the resolution and depth
>>>>> supported by the display type can be specified on the command line.
>>>>>
>>>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>>>>> ---
>>>>>    hw/display/macfb.c         | 124 ++++++++++++++++++++++++++++++++-----
>>>>>    hw/display/trace-events    |   1 +
>>>>>    hw/m68k/q800.c             |  11 ++--
>>>>>    include/hw/display/macfb.h |  16 ++++-
>>>>>    4 files changed, 131 insertions(+), 21 deletions(-)
>>>>>
>>>>> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
>>>>> index f98bcdec2d..357fe18be5 100644
>>>>> --- a/hw/display/macfb.c
>>>>> +++ b/hw/display/macfb.c
>>>>>
>>>> ...
>>>>> +static MacFbMode *macfb_find_mode(MacfbDisplayType display_type,
>>>>> +                                  uint16_t width, uint16_t height,
>>>>> +                                  uint8_t depth)
>>>>> +{
>>>>> +    MacFbMode *macfb_mode;
>>>>> +    int i;
>>>>> +
>>>>> +    for (i = 0; i < ARRAY_SIZE(macfb_mode_table); i++) {
>>>>> +        macfb_mode = &macfb_mode_table[i];
>>>>> +
>>>>> +        if (display_type == macfb_mode->type && width == macfb_mode->width &&
>>>>> +                height == macfb_mode->height && depth == macfb_mode->depth) {
>>>>> +            return macfb_mode;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    return NULL;
>>>>> +}
>>>>> +
>>>>
>>>> I misunderstood this part when I reviewed v1...
>>>>
>>>> It means you have to provide the monitor type to QEMU to switch from the default mode?
>>>
>>> Not as such: both the MacOS toolbox ROM and MacOS itself offer a fixed set of resolutions and depths
>>> based upon the display type. What I've done for now is default the display type to VGA since it
>>> offers both 640x480 and 800x600 in 1, 2, 4, 8, 16 and 24-bit colour which should cover the most
>>> common use of cases of people wanting to boot using the MacOS toolbox ROM.
>>>
>>> Even if you specify a default on the command line, MacOS still only cares about the display type and
>>> will allow you to change the resolution and depth dynamically, remembering the last resolution and
>>> depth across reboots.
>>>
>>> During testing I found that having access to the 1152x870 resolution offered by the Apple 21"
>>> monitor display type was useful to allow larger screen sizes, although only up to 8-bit depth so I
>>> added a bit of code that will switch from a VGA display type to a 21" display type if the graphics
>>> resolution is set to 1152x870x8.
>>>
>>> Finally if you boot a Linux kernel directly using -kernel then the provided XxYxD is placed directly
>>> into the relevant bootinfo fields with a VGA display type, unless a resolution of 1152x870x8 is
>>> specified in which case the 21" display type is used as above.
>>>
>>>> But, as a user, how do we know which modes are allowed with which resolution?
>>>>
>>>> Is possible to try to set internally the type here according to the resolution?
>>>>
>>>> Could you provide an command line example how to start the q800 with the 1152x870 resolution?
>>>
>>> Sure - simply add "-g 1152x870x8" to your command line. If the -g parameter is omitted then the
>>> display type will default to VGA.
>>>
>>
>> Thank you for the explanation.
>>
>> Perhaps you can add in the error message the list of the available mode and depth?
>> (it's not a blocker for the series, it can be added later)
>>
>> As an user, it's hard to know what are the allowed values.
> 
> This is where it becomes a bit trickier, since technically booting Linux with -kernel you can use
> any supported values as long as everything fits in the video RAM which is why there isn't currently
> a hard-coded list :)
> 

We need the list of "supported values". I don't want to read the code or try values combination
until it works.

In a perfect world, I would like to be able to use any value I want with "-kernel".

For instance I was using "-g 1200x800x24" and it was working fine.

Now I have:

qemu-system-m68k: unknown display mode: width 1200, height 800, depth 24

If it's not possible (because the original hardware cannot provide it, and we don't know the base
address or things like that), we don't need the list of the display id, but the list of available
modes: (width,height,depth).

Rougly, something like:

qemu-system-m68k: unknown display mode: width 1200, height 800, depth 24
Available modes:
    1152x870x8
    1152x870x4
    1152x870x2
    1152x870x1
    800x600x24
    800x600x8
    800x600x4
    800x600x2
    800x600x1
    640x480x24
    640x480x8
    640x480x4
    640x480x2
    640x480x1

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index 5b8812e9e7d8..4b352eb89c3f 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -438,6 +438,26 @@ static MacFbMode *macfb_find_mode(MacfbDisplayType display_type,
     return NULL;
 }

+static gchar *macfb_mode_list(void)
+{
+    gchar *list = NULL;
+    gchar *mode;
+    MacFbMode *macfb_mode;
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(macfb_mode_table); i++) {
+        macfb_mode = &macfb_mode_table[i];
+
+        mode = g_strdup_printf("    %dx%dx%d\n", macfb_mode->width,
+                               macfb_mode->height, macfb_mode->depth);
+        list = g_strconcat(mode, list, NULL);
+        g_free(mode);
+    }
+
+    return list;
+}
+
+
 static void macfb_update_display(void *opaque)
 {
     MacfbState *s = opaque;
@@ -620,8 +640,13 @@ static bool macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)

     s->mode = macfb_find_mode(s->type, s->width, s->height, s->depth);
     if (!s->mode) {
+        gchar *list;
         error_setg(errp, "unknown display mode: width %d, height %d, depth %d",
                    s->width, s->height, s->depth);
+        list =  macfb_mode_list();
+        error_append_hint(errp, "Available modes:\n%s", list);
+        g_free(list);
+
         return false;
     }


Thanks,
Laurent


