Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9882C57E499
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 18:42:38 +0200 (CEST)
Received: from localhost ([::1]:47678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEvjZ-0005Cv-Ly
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 12:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oEvhf-0003Ii-7P
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 12:40:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:54858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oEvhc-0000Fy-Uk
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 12:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ytWm4Np3B0uXMmY9ptHunsFc0bdR71DapK1EnyXkvrQ=; b=mhyn/gdSle5QBPH2+errdb9Bgl
 FxIZ8SNdxAKTlW+q6yAai8OdbOSvoalDBAjO88oj4erVplegT4RRlVx0oZ3FEgeVweOIK3lYh5yB/
 69FC7Rk8kWbYbLzP1b1vaZ6eHzBG5IusnUtj64K+ZkWKGhjmoHhsrchdiodAzeOy/sgv5SjCFs1te
 LUpHdPi+2DbKQAtHEkX0Re+U/kvwrDYQdXBfcBS8oKP81gUjjyLXqsIaDWeKJezVoQB0sNJNiz77T
 XSvWw8jvJfqtdyoqBMjIKROW5EWNWgCcROZFgUyRcm2WUEgWO1QwlyN4fhD218Vn2IDf6h69hke7p
 xG2Mp8pa9JSechoSWYNsP0UcBld5qIugYmJyjom3w/CfnamKVKBgTYBooPgyzsnr9gvYDBB64iE6f
 cYdcb7VXgm4bccpqOOyEvlg+vglG4crwPre9zFmxXONrG2a64Dcm6hb5Amv5zqMqNo3hk8h1lC2iT
 +9eHPMHbl6LvAhSEwTH3/cczMWVZNbcPhSdgdCoOWfi47mJSAyobD0TPfbJdiShiLTVcKHAOcR3V7
 Kt1qaYlVJLVR9kkPLDtCURWV4Ygssko2o4mlwbjs3biwhQjf+wRV/D3zv6OwDQn3jFRIh9FZ1OQXP
 Azg1qMuvqSH/xjlaAreHfMpP6qXO6M67UZIHA5pio=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oEvgJ-0000Hv-2n; Fri, 22 Jul 2022 17:39:15 +0100
Message-ID: <2e4c3403-1171-eaa5-3380-2afc385c21a6@ilande.co.uk>
Date: Fri, 22 Jul 2022 17:40:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <e4c8ced1-3ef4-8956-ead5-91110d3cb38c@ilande.co.uk>
 <20220616120715.uksbwjynvb6usjhu@sirius.home.kraxel.org>
 <b93a1312-2272-d7b4-5a45-d04a7fd35840@ilande.co.uk>
 <20220617095558.xggyv6qk7igofii4@sirius.home.kraxel.org>
 <CAMxuvawyO4uViOTUpji553dkqzRmvoL3YbDXXjd3Ca8SMmWxoA@mail.gmail.com>
 <CABLmASGnjbqwueo9T-Ed7x3srS9BME+C18vSfOP955cZtf=i6w@mail.gmail.com>
 <CAMxuvayg9S3Z8UL8gGLF+6p=j2sFi58RZpTFNB8NcQbzmx_u9Q@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAMxuvayg9S3Z8UL8gGLF+6p=j2sFi58RZpTFNB8NcQbzmx_u9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: Corrupted display changing screen colour depth in
 qemu-system-ppc/MacOS
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 22/07/2022 14:44, Marc-André Lureau wrote:

> Hi
> 
> On Fri, Jul 22, 2022 at 4:28 PM Howard Spoelstra <hsp.cat7@gmail.com> wrote:
>>
>>
>>
>> On Fri, Jun 17, 2022 at 2:38 PM Marc-André Lureau <marcandre.lureau@redhat.com> wrote:
>>>
>>> Hi
>>>
>>> On Fri, Jun 17, 2022 at 1:56 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>>>>
>>>>    Hi,
>>>>
>>>>>> Can you try ditch the QEMU_ALLOCATED_FLAG check added by the commit?
>>>>>
>>>>> Commit cb8962c146 drops the QEMU_ALLOCATED_FLAG check: if I add it back in
>>>>> with the following diff on top then everything works again:
>>>>
>>>> Ah, the other way around.
>>>>
>>>>> diff --git a/ui/console.c b/ui/console.c
>>>>> index 365a2c14b8..decae4287f 100644
>>>>> --- a/ui/console.c
>>>>> +++ b/ui/console.c
>>>>> @@ -2400,11 +2400,12 @@ static void vc_chr_open(Chardev *chr,
>>>>>
>>>>>   void qemu_console_resize(QemuConsole *s, int width, int height)
>>>>>   {
>>>>> -    DisplaySurface *surface;
>>>>> +    DisplaySurface *surface = qemu_console_surface(s);
>>>>>
>>>>>       assert(s->console_type == GRAPHIC_CONSOLE);
>>>>>
>>>>> -    if (qemu_console_get_width(s, -1) == width &&
>>>>> +    if (surface && (surface->flags & QEMU_ALLOCATED_FLAG) &&
>>>>> +        qemu_console_get_width(s, -1) == width &&
>>>>>           qemu_console_get_height(s, -1) == height) {
>>>>>           return;
>>>>>       }
>>>>>
>>>>>> Which depth changes triggers this?  Going from direct color to a
>>>>>> paletted mode?
>>>>>
>>>>> A quick test suggests anything that isn't 32-bit colour is affected.
>>>>
>>>> Hmm, I think the commit should simply be reverted.
>>>>
>>>> Short-cutting the qemu_console_resize() call is only valid in case the
>>>> current surface was created by qemu_console_resize() too.  When it is
>>>> something else -- typically a surface backed by vga vram -- it's not.
>>>> Looking at the QEMU_ALLOCATED_FLAG checks exactly that ...
>>>
>>> Oh ok, it might be worth adding a comment to clarify that. By
>>> reverting, we are going back to the situation where
>>> qemu_console_resize() will create a needless surface when rendering
>>> with GL. As I tried to explain in the commit message, it will need
>>> more changes to prevent that. I can take a look later.
>>>
>>
>> Hi Marc-André,
>>
>> I wondered whether you've had a chance to look at this?
>>
> 
> No, it's not clear to me how to reproduce it. Someone that can
> actually test it should send a patch with some comments to explain it.

Unfortunately I don't know anything about the host display code, but I think I should 
be able to come up with some Forth to run from the command line that will reproduce 
the issue with qemu-system-ppc. Let me see if I can come up with something...


ATB,

Mark.

