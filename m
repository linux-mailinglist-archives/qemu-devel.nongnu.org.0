Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109AD423FAC
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 15:57:20 +0200 (CEST)
Received: from localhost ([::1]:37110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY7Q6-0007Hf-SJ
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 09:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mY7NJ-000623-Qk
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:54:25 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38134
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mY7NH-0002RU-T8
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 09:54:25 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mY7N5-0008NK-56; Wed, 06 Oct 2021 14:54:11 +0100
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211004211928.15803-1-mark.cave-ayland@ilande.co.uk>
 <20211004211928.15803-9-mark.cave-ayland@ilande.co.uk>
 <7994e73e-cbda-1bd1-68c4-250dd951ed51@vivier.eu>
 <66384935-4c8f-8220-8593-bfde37d05e1d@ilande.co.uk>
 <15fba2fe-77b0-78f4-ea55-9438ce976c18@vivier.eu>
 <52fe2fc5-b4fb-8888-9b80-0e362c52ebb5@ilande.co.uk>
 <3a798740-d39e-f2b8-8b3c-1a4814f184ea@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <f8d64bc7-fc6e-dd14-4ed5-a55a947ef8cb@ilande.co.uk>
Date: Wed, 6 Oct 2021 14:54:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <3a798740-d39e-f2b8-8b3c-1a4814f184ea@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 08/12] macfb: add common monitor modes supported by the
 MacOS toolbox ROM
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.964,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 06/10/2021 13:24, Laurent Vivier wrote:

>> This is where it becomes a bit trickier, since technically booting Linux with -kernel you can use
>> any supported values as long as everything fits in the video RAM which is why there isn't currently
>> a hard-coded list :)
>>
> 
> We need the list of "supported values". I don't want to read the code or try values combination
> until it works.
> 
> In a perfect world, I would like to be able to use any value I want with "-kernel".
> 
> For instance I was using "-g 1200x800x24" and it was working fine.
> 
> Now I have:
> 
> qemu-system-m68k: unknown display mode: width 1200, height 800, depth 24
> 
> If it's not possible (because the original hardware cannot provide it, and we don't know the base
> address or things like that), we don't need the list of the display id, but the list of available
> modes: (width,height,depth).
> 
> Rougly, something like:
> 
> qemu-system-m68k: unknown display mode: width 1200, height 800, depth 24
> Available modes:
>      1152x870x8
>      1152x870x4
>      1152x870x2
>      1152x870x1
>      800x600x24
>      800x600x8
>      800x600x4
>      800x600x2
>      800x600x1
>      640x480x24
>      640x480x8
>      640x480x4
>      640x480x2
>      640x480x1
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index 5b8812e9e7d8..4b352eb89c3f 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -438,6 +438,26 @@ static MacFbMode *macfb_find_mode(MacfbDisplayType display_type,
>       return NULL;
>   }
> 
> +static gchar *macfb_mode_list(void)
> +{
> +    gchar *list = NULL;
> +    gchar *mode;
> +    MacFbMode *macfb_mode;
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(macfb_mode_table); i++) {
> +        macfb_mode = &macfb_mode_table[i];
> +
> +        mode = g_strdup_printf("    %dx%dx%d\n", macfb_mode->width,
> +                               macfb_mode->height, macfb_mode->depth);
> +        list = g_strconcat(mode, list, NULL);
> +        g_free(mode);
> +    }
> +
> +    return list;
> +}
> +
> +
>   static void macfb_update_display(void *opaque)
>   {
>       MacfbState *s = opaque;
> @@ -620,8 +640,13 @@ static bool macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
> 
>       s->mode = macfb_find_mode(s->type, s->width, s->height, s->depth);
>       if (!s->mode) {
> +        gchar *list;
>           error_setg(errp, "unknown display mode: width %d, height %d, depth %d",
>                      s->width, s->height, s->depth);
> +        list =  macfb_mode_list();
> +        error_append_hint(errp, "Available modes:\n%s", list);
> +        g_free(list);
> +
>           return false;
>       }

Hi Laurent,

Thanks for the example - I can certainly squash this into patch 8.

As for allowing extra resolutions via -kernel, since the check is being done in 
macfb_common_realize() then it would be possible to add a qdev property that only 
gets set when -kernel is used on the command line which bypasses the mode check if 
you prefer?

I'm not sure that your existing example of "-g 1200x800x24" (or indeed any resolution 
with 24-bit depth) with -kernel will still work after this patchset given that the 
24-bit encoding scheme has changed. Presumably this would also need a corresponding 
change in the bootinfo/kernel framebuffer/X configuration somewhere?


ATB,

Mark.

