Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC125315B9
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 21:26:43 +0200 (CEST)
Received: from localhost ([::1]:37048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntDhS-0008Cz-QK
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 15:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntDen-0005zR-Qq
 for qemu-devel@nongnu.org; Mon, 23 May 2022 15:23:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntDej-00005k-Uy
 for qemu-devel@nongnu.org; Mon, 23 May 2022 15:23:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653333833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAqcVnPP56e/4CsXoJKrdQqEGyIMMFz3Fvx2Q+wBSWI=;
 b=XbGqrUpI9pocSI8AEfCM6UStA4LMEy3DA5cZk9BwV4jXT8Y/m5SupAA+DtafGlpPP5TQd9
 VRd4uhW1h8pa6SX44T/oDe+qRcoRD1wVKyUcxruzJhAUbbe/B4aLc1ju51fF5d8QMk5Bzv
 Nm0dIbydk12pnzzIy2YiKctTna8qBoA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-q4PK-N4ROM6ypID3r5piaA-1; Mon, 23 May 2022 15:23:52 -0400
X-MC-Unique: q4PK-N4ROM6ypID3r5piaA-1
Received: by mail-wm1-f70.google.com with SMTP id
 o23-20020a05600c511700b0039747b0216fso123291wms.0
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 12:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=FAqcVnPP56e/4CsXoJKrdQqEGyIMMFz3Fvx2Q+wBSWI=;
 b=majkoyyEFjQsDCZiTmtR/egi4f+qEV1UzgTMQEoNlZ+MWRHks9+q1TInnuDkACUcZo
 MiIGufCMD7RUJKDxCia7u7aTmmLRK7gK5jCXdp0UrCwm8X3JkwbJrTluc38a5AuH2vvO
 f/ht7mpWEkwjGRwtfYIXJfAM8mItQPUm7W6Who2jI0Aj8nWULziwRLzEUMlvBmqWoFdt
 bzttS1LOKUD+ec4mS/i5umTA7LQo1yrggMz45Q2JQF7FOrJjF2ss4nJwgJCXIEMbE0Gf
 dAbZuOnZZtVUdgToMOb7tt6/o7rCkKG25KNb//ywkoHKHRyqVwHyapKewwRJ7ELXyL1w
 tfJQ==
X-Gm-Message-State: AOAM5336vQJbsP4Lzolt0yPKOr7v06Z3IPgBcOkkB8wQmEgAFSIO6N5e
 4Vlm80zFANAdGlTfTfw+S2plEQBtmzalPFf3s0fdviwhSw+UV8Pz/sUeviUNfLnm3MtIQGzaupK
 SeZKpQXGT9mxyY10=
X-Received: by 2002:a1c:29c3:0:b0:350:9797:b38f with SMTP id
 p186-20020a1c29c3000000b003509797b38fmr530554wmp.22.1653333830822; 
 Mon, 23 May 2022 12:23:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVKF4frujlucvtHZ/LRB5OquJrSnB8wdzlyHICwF2jGR336Zkpssb/iBMfSvuY+1aMOSV74g==
X-Received: by 2002:a1c:29c3:0:b0:350:9797:b38f with SMTP id
 p186-20020a1c29c3000000b003509797b38fmr530532wmp.22.1653333830507; 
 Mon, 23 May 2022 12:23:50 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 f13-20020a7bc8cd000000b003974df805c7sm163902wml.8.2022.05.23.12.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 12:23:50 -0700 (PDT)
Message-ID: <dd189cec-06ed-5015-cab5-99abd3f69ecf@redhat.com>
Date: Mon, 23 May 2022 21:23:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220519155625.1414365-1-thuth@redhat.com>
 <20220519155625.1414365-3-thuth@redhat.com> <87v8tw7470.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 2/3] ui: Switch "-display sdl" to use the QAPI parser
In-Reply-To: <87v8tw7470.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 23/05/2022 15.45, Markus Armbruster wrote:
> Thomas Huth <thuth@redhat.com> writes:
> 
>> The "-display sdl" option still uses a hand-crafted parser for its
>> parameters since we didn't want to drag an interface we considered
>> somewhat flawed into the QAPI schema. Since the flaws are gone now,
>> it's time to QAPIfy.
>>
>> This introduces the new "DisplaySDL" QAPI struct that is used to hold
>> the parameters that are unique to the SDL display. The only specific
>> parameter is currently "grab-mod" that is used to specify the required
>> modifier keys to escape from the mouse grabbing mode.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   qapi/ui.json            | 26 ++++++++++++++-
>>   include/sysemu/sysemu.h |  2 --
>>   softmmu/globals.c       |  2 --
>>   softmmu/vl.c            | 70 +----------------------------------------
>>   ui/sdl2.c               | 10 ++++++
>>   5 files changed, 36 insertions(+), 74 deletions(-)
>>
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index 11a827d10f..413371d5e8 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -1295,6 +1295,29 @@
>>         '*swap-opt-cmd': 'bool'
>>     } }
>>   
>> +##
>> +# @HotKeyMod:
>> +#
>> +# Set of modifier keys that need to be held for shortcut key actions.
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'enum'  : 'HotKeyMod',
>> +  'data'  : [ 'lctrl-lalt', 'lshift-lctrl-lalt', 'rctrl' ] }
> 
> I have a somewhat uneasy feeling about encoding what is essentially a
> subset of the sets of modifier keys as an enumeration, but it's what we
> have to do to QAPIfy existing grab-mod.

Well, that's exactly what you suggested here:

  https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg03401.html

So I really don't understand your uneasy feeling now?

...
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index 57ab9d5322..484e9d9921 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -1056,75 +1056,7 @@ static void parse_display(const char *p)
>>           exit(0);
>>       }
>>   
>> -    if (strstart(p, "sdl", &opts)) {
>> -        /*
>> -         * sdl DisplayType needs hand-crafted parser instead of
>> -         * parse_display_qapi() due to some options not in
>> -         * DisplayOptions, specifically:
>> -         *   - ctrl_grab + alt_grab
>> -         *     They can't be moved into the QAPI since they use underscores,
>> -         *     thus they will get replaced by "grab-mod" in the long term
>> -         */
>> -#if defined(CONFIG_SDL)
>> -        dpy.type = DISPLAY_TYPE_SDL;
>> -        while (*opts) {
>> -            const char *nextopt;
>> -
>> -            if (strstart(opts, ",grab-mod=", &nextopt)) {
>> -                opts = nextopt;
>> -                if (strstart(opts, "lshift-lctrl-lalt", &nextopt)) {
>> -                    alt_grab = 1;
>> -                } else if (strstart(opts, "rctrl", &nextopt)) {
>> -                    ctrl_grab = 1;
>> -                } else {
>> -                    goto invalid_sdl_args;
>> -                }
>> -            } else if (strstart(opts, ",window-close=", &nextopt)) {
>> -                opts = nextopt;
>> -                dpy.has_window_close = true;
>> -                if (strstart(opts, "on", &nextopt)) {
>> -                    dpy.window_close = true;
>> -                } else if (strstart(opts, "off", &nextopt)) {
>> -                    dpy.window_close = false;
>> -                } else {
>> -                    goto invalid_sdl_args;
>> -                }
>> -            } else if (strstart(opts, ",show-cursor=", &nextopt)) {
>> -                opts = nextopt;
>> -                dpy.has_show_cursor = true;
>> -                if (strstart(opts, "on", &nextopt)) {
>> -                    dpy.show_cursor = true;
>> -                } else if (strstart(opts, "off", &nextopt)) {
>> -                    dpy.show_cursor = false;
>> -                } else {
>> -                    goto invalid_sdl_args;
>> -                }
>> -            } else if (strstart(opts, ",gl=", &nextopt)) {
>> -                opts = nextopt;
>> -                dpy.has_gl = true;
>> -                if (strstart(opts, "on", &nextopt)) {
>> -                    dpy.gl = DISPLAYGL_MODE_ON;
>> -                } else if (strstart(opts, "core", &nextopt)) {
>> -                    dpy.gl = DISPLAYGL_MODE_CORE;
>> -                } else if (strstart(opts, "es", &nextopt)) {
>> -                    dpy.gl = DISPLAYGL_MODE_ES;
>> -                } else if (strstart(opts, "off", &nextopt)) {
>> -                    dpy.gl = DISPLAYGL_MODE_OFF;
>> -                } else {
>> -                    goto invalid_sdl_args;
>> -                }
>> -            } else {
>> -            invalid_sdl_args:
>> -                error_report("invalid SDL option string");
>> -                exit(1);
>> -            }
>> -            opts = nextopt;
>> -        }
>> -#else
>> -        error_report("SDL display supported is not available in this binary");
>> -        exit(1);
>> -#endif
> 
> When CONFIG_SDL is off, the error message changes from
> 
>      qemu-system-x86_64: -display sdl: SDL display supported is not available in this binary
> 
> to
> 
>      qemu-system-x86_64: -display sdl: Parameter 'type' does not accept value 'sdl'
> 
> I don't mind, but I'd suggest to mention it in the commit message.

I can do that if I have to respin this series for some other reasons. 
Otherwise, I don't think this really severe enough to justify a v4.

> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 

Thanks!

  Thomas


