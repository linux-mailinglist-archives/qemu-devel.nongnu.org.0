Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D63344F54A
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 21:41:49 +0100 (CET)
Received: from localhost ([::1]:58656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlzqL-0003R8-RX
	for lists+qemu-devel@lfdr.de; Sat, 13 Nov 2021 15:41:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1mlzpR-0002l8-0u
 for qemu-devel@nongnu.org; Sat, 13 Nov 2021 15:40:49 -0500
Received: from [2607:f938:3000:8::2] (port=14141 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1mlzpO-0004AT-Py
 for qemu-devel@nongnu.org; Sat, 13 Nov 2021 15:40:48 -0500
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4Hs6m74Vdjz8PbN;
 Sat, 13 Nov 2021 15:40:39 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=08d9+qSZ8
 C/VNKmlTjUOPYCy6ZE=; b=i5YZnzuYPD4Ol2VGAbLuv2Zb+9YzcaivHYvQYXNTM
 Y42XAJ2oWJGs8+WuEaowLCAeTsuJKQXHp9hQnE6aHsdvGoM1iaGZ3zs84c07dh+U
 smxo4g89pVdmLAlsMJQh7oZSt3ZOhduWgXR9WQUPUQvnFmiuuBHOS8Yvk8mlBxUj
 ok=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=XAG
 dN/SkxpI9G7Fq4OTGyvpHg/iqxLxuKQpy4bgJw7IRlpiSCy1gXAHts5vmYPEY9Wx
 XKNvH6RCBNsZJDyxyE1/7onJ4Fd+2BwSq3SSQ9toZCvEEpXNe2Kr5dVtKMVnFgaq
 wGzBg7uuZh/F4gXvWhxFqzPPq0BhACBlIGUNkMc4=
Received: from [192.168.6.70]
 (bras-base-toroon2719w-grc-40-174-88-240-196.dsl.bell.ca [174.88.240.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4Hs6m73fDnz8PbK;
 Sat, 13 Nov 2021 15:40:39 -0500 (EST)
Message-ID: <73252f43-1e30-7c0b-bcc7-1df399290e10@comstyle.com>
Date: Sat, 13 Nov 2021 15:40:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PATCH] audio: Add sndio backend
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
References: <YYdh3l1HTh+kpONa@humpty.home.comstyle.com>
 <2813395.O5pCCIcrDs@silver>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <2813395.O5pCCIcrDs@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f938:3000:8::2
 (failed)
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.852,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/2021 8:03 AM, Christian Schoenebeck wrote:

> On Sonntag, 7. November 2021 06:19:26 CET Brad Smith wrote:
>> audio: Add sndio backend
>>
>> Add a sndio backend.
> Hi Brad!
>
>> sndio is the native API used by OpenBSD, although it has been ported to
>> other *BSD's and Linux (packages for Ubuntu, Debian, Void, Arch, etc.).
>>
>> The C code is from Alexandre Ratchov <alex@caoua.org> and the rest of
>> the bits are from me.
> A Signed-off-by: line is mandatory for all QEMU patches:
> https://wiki.qemu.org/Contribute/SubmitAPatch
Ah, I was not aware of that. I usually include it but it was an 
oversight this time.
> Also, it should be clear from the patches who did what exactly, either by
> splitting the patches up and assigning the respective authors accordingly, or
> by making the person with the most relevant work the patch author and
> describing in the commit log additional authors and what they have added/
> changed, along with their Signed-off-by: line:
>
> Signed-off-by: Alexandre Ratchov <alex@caoua.org>
> [Brad Smith: - Added foo
>               - Some other change]
> Signed-off-by: Brad Smith <brad@comstyle.com>
I think I'll go with this.
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/
> Documentation/SubmittingPatches?
> id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297
>
> Please CC those involved authors.
Will do.
>> ---
>>   audio/audio.c          |   1 +
>>   audio/audio_template.h |   2 +
>>   audio/meson.build      |   1 +
>>   audio/sndioaudio.c     | 555 +++++++++++++++++++++++++++++++++++++++++
>>   meson.build            |   7 +
>>   meson_options.txt      |   4 +-
>>   qapi/audio.json        |  25 +-
>>   qemu-options.hx        |   8 +
>>   tests/vm/freebsd       |   3 +
>>   9 files changed, 604 insertions(+), 2 deletions(-)
> An additional subsection for this backend should be added to MAINTAINERS.
I did not add anything here as I figured it implies a certain level of 
obligation. His time
available varies quite a bit (especially at the current time) and I 
wasn't sure if it's
appropriate listing him.
>>   create mode 100644 audio/sndioaudio.c
>>
>> diff --git a/audio/audio.c b/audio/audio.c
>> index 54a153c0ef..bad1ceb69e 100644
>> --- a/audio/audio.c
>> +++ b/audio/audio.c
>> @@ -2005,6 +2005,7 @@ void audio_create_pdos(Audiodev *dev)
>>           CASE(OSS, oss, Oss);
>>           CASE(PA, pa, Pa);
>>           CASE(SDL, sdl, Sdl);
>> +        CASE(SNDIO, sndio, );
>>           CASE(SPICE, spice, );
>>           CASE(WAV, wav, );
>>
>> diff --git a/audio/audio_template.h b/audio/audio_template.h
>> index c6714946aa..ecc5a0bc6d 100644
>> --- a/audio/audio_template.h
>> +++ b/audio/audio_template.h
>> @@ -337,6 +337,8 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_,
>> TYPE)(Audiodev *dev) return
>> qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.TYPE); case
>> AUDIODEV_DRIVER_SDL:
>>           return qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.TYPE);
>> +    case AUDIODEV_DRIVER_SNDIO:
>> +        return dev->u.sndio.TYPE;
>>       case AUDIODEV_DRIVER_SPICE:
>>           return dev->u.spice.TYPE;
>>       case AUDIODEV_DRIVER_WAV:
>> diff --git a/audio/meson.build b/audio/meson.build
>> index 462533bb8c..e24c86e7e6 100644
>> --- a/audio/meson.build
>> +++ b/audio/meson.build
>> @@ -17,6 +17,7 @@ foreach m : [
>>     ['pa', pulse, files('paaudio.c')],
>>     ['sdl', sdl, files('sdlaudio.c')],
>>     ['jack', jack, files('jackaudio.c')],
>> +  ['sndio', sndio, files('sndioaudio.c')],
>>     ['spice', spice, files('spiceaudio.c')]
>>   ]
>>     if m[1].found()
>> diff --git a/audio/sndioaudio.c b/audio/sndioaudio.c
>> new file mode 100644
>> index 0000000000..204af07781
>> --- /dev/null
>> +++ b/audio/sndioaudio.c
>> @@ -0,0 +1,555 @@
>> +/*
>> + * Copyright (c) 2019 Alexandre Ratchov <alex@caoua.org>
>> + *
> It is quite common for new source files in QEMU to have an authors list
> section in the header here like:
>
>    * Autors:
>    *  Alexandre Ratchov <alex@caoua.org>

I was looking through the tree and all of the examples I came across 
were using this
with a Copyright for a company as opposed to an individual. What would 
be the
format?

> That way scripts/get_maintainer.pl can suggest those people as well in case
> they are not explicitly listed in MAINTAINERS. Does not seem to be mandatory
> for QEMU though. Just saying.

