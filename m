Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBDC571106
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 05:59:16 +0200 (CEST)
Received: from localhost ([::1]:59284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB73L-0001g2-8I
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 23:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oB70S-0005im-UV
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 23:56:16 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oB70Q-0003oS-Da
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 23:56:16 -0400
Received: by mail-pg1-x533.google.com with SMTP id g4so6520268pgc.1
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 20:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZCuD8LXNOmQ44vte1e3HiNDuztygoahjd91M1DbCNtM=;
 b=EFDsyihKN6fcfnEh4eb/bhdyAK2IY2K+rsoF+qSmEKUnE3SXWNJO/oVV+OsGFLcPBr
 NFZJ+ws5QMtERq0lgLkcENb+LLgtQxEAkMtEjbELLNL25Q0X9LgUg/K162bxOL1RjeZc
 fqPa+Euqef0dU6wfH82drB+SNtRFgcJnAiPCTsYpUrgTtU63Jsbs9OgCj1SEdYgbkO+i
 mRsIptganNVUQuulMaL3ry4OWmroVCI1QieH/cKmcgMd8Mklbyyw2mG3IetXPIY1zoHB
 RyjqFVs0TPAE3BOpbyYSeOVoMSjfruc7sFPBpb4d2x+yHjHO5DCOe/bX7CPXoQlPEtsj
 f7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZCuD8LXNOmQ44vte1e3HiNDuztygoahjd91M1DbCNtM=;
 b=B8mGsfWXqZ30XiRL3Vf5ybzaWl7cPgKHwDqpCDDQLwakmJrQYIvSvcjKo8zHClIdMp
 veqxCbIc8DMpVjK9LhOSGU3thQ1T6J0DXrQEuVpayopIUQt4DzirR3IAZcxHeSjPel/e
 O+W3/zkI9165ax5uvIn3RfhAy/mdWUS9jrATk3XMeMS3a00TKb3w/CgUOvwFWsjerFzE
 Vj+fhCXAQHw4n1/F3vwI4ceePH7Tszim7eEsSZ5aj2+queuWhN/dyCIptsiHFdEsKbMx
 wQ2jMFdDH9NGSY7u53tQYOvEiqOpXNNJsmbqnVA4BOt9teeKTiM0RmAv5HaYNzN7pxJQ
 Jw1g==
X-Gm-Message-State: AJIora8c4w2XXfCmbIoNugLG9F3gxN1SS4JL1olmhpjfYeNRGM+DsX9w
 A8my837PJXsBjlP/8aEQ8lY=
X-Google-Smtp-Source: AGRyM1tjAlWIReZP6770OcieQGMtGRlsEIqATyZnlZ6PKVe/YT4lXvN2kIR9G6J1bCWjub57XMv1Qw==
X-Received: by 2002:a63:e556:0:b0:412:3286:faaa with SMTP id
 z22-20020a63e556000000b004123286faaamr18680143pgj.192.1657598172509; 
 Mon, 11 Jul 2022 20:56:12 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a170903124700b0016bee668a5asm5559754plh.161.2022.07.11.20.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 20:56:11 -0700 (PDT)
Message-ID: <414d3d16-9ed2-190b-a3a9-03e648de64e3@gmail.com>
Date: Tue, 12 Jul 2022 12:56:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ui/cocoa: Fix switched_to_fullscreen warning
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, f4bug@amsat.org,
 kraxel@redhat.com
References: <20220702044304.90553-1-peter@pjd.dev>
 <8e54f374-d4bc-36f1-6d1c-470853174aaa@gmail.com>
 <YsYvvnzmg8jU7zip@pdel-mbp.dhcp.thefacebook.com>
 <Ysy61jH53fDEgJfs@pdel-mbp.dhcp.thefacebook.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <Ysy61jH53fDEgJfs@pdel-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2022/07/12 9:05, Peter Delevoryas wrote:
> On Wed, Jul 06, 2022 at 05:58:38PM -0700, Peter Delevoryas wrote:
>> On Sat, Jul 02, 2022 at 11:30:16PM +0900, Akihiko Odaki wrote:
>>> Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>>
>> Just checking in on the status of this: do I need to submit a pull request?
>> Or will this patch be picked up in a miscellaneous pull queue eventually?
> 
> Pinging this thread again, does this change need anyone else to review it?

The patch should be picked up later. You may ping again if there is no 
response after weeks.

Sorry for replying late,
Akihiko Odaki

> 
>>
>>>
>>> On 2022/07/02 13:43, Peter Delevoryas wrote:
>>>> I noticed this error while building QEMU on Mac OS X:
>>>>
>>>>       [1040/1660] Compiling Objective-C object libcommon.fa.p/ui_cocoa.m.o
>>>>       ../ui/cocoa.m:803:17: warning: variable 'switched_to_fullscreen' set but not used [-Wunused-but-set-variable]
>>>>           static bool switched_to_fullscreen = false;
>>>>                       ^
>>>>       1 warning generated.
>>>>
>>>> I think the behavior is fine if you remove "switched_to_fullscreen", I can
>>>> still switch in and out of mouse grabbed mode and fullscreen mode with this
>>>> change, and Command keycodes will only be passed to the guest if the mouse
>>>> is grabbed, which I think is the right behavior. I'm not sure why a static
>>>> piece of state was needed to handle that in the first place. Perhaps the
>>>> refactoring of the flags-state-change fixed that by toggling the Command
>>>> keycode on.
>>>>
>>>> I tested this with an Ubuntu core image on macOS 12.4
>>>>
>>>>       wget https://cdimage.ubuntu.com/ubuntu-core/18/stable/current/ubuntu-core-18-i386.img.xz
>>>>       xz -d ubuntu-core-18-i386.img.xz
>>>>       qemu-system-x86_64 -drive file=ubuntu-core-18.i386.img,format=raw
>>>>
>>>> Fixes: 6d73bb643aa7 ("ui/cocoa: Clear modifiers whenever possible")
>>>> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
>>>> ---
>>>>    ui/cocoa.m | 8 --------
>>>>    1 file changed, 8 deletions(-)
>>>>
>>>> diff --git a/ui/cocoa.m b/ui/cocoa.m
>>>> index 84c84e98fc..13e208b037 100644
>>>> --- a/ui/cocoa.m
>>>> +++ b/ui/cocoa.m
>>>> @@ -800,7 +800,6 @@ - (bool) handleEventLocked:(NSEvent *)event
>>>>        int buttons = 0;
>>>>        int keycode = 0;
>>>>        bool mouse_event = false;
>>>> -    static bool switched_to_fullscreen = false;
>>>>        // Location of event in virtual screen coordinates
>>>>        NSPoint p = [self screenLocationOfEvent:event];
>>>>        NSUInteger modifiers = [event modifierFlags];
>>>> @@ -952,13 +951,6 @@ - (bool) handleEventLocked:(NSEvent *)event
>>>>                // forward command key combos to the host UI unless the mouse is grabbed
>>>>                if (!isMouseGrabbed && ([event modifierFlags] & NSEventModifierFlagCommand)) {
>>>> -                /*
>>>> -                 * Prevent the command key from being stuck down in the guest
>>>> -                 * when using Command-F to switch to full screen mode.
>>>> -                 */
>>>> -                if (keycode == Q_KEY_CODE_F) {
>>>> -                    switched_to_fullscreen = true;
>>>> -                }
>>>>                    return false;
>>>>                }
>>>
>>


