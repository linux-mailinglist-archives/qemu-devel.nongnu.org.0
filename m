Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7ED52CF12
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 11:12:51 +0200 (CEST)
Received: from localhost ([::1]:56496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrcDB-0005Mn-Q2
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 05:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrcAW-0003si-2Y
 for qemu-devel@nongnu.org; Thu, 19 May 2022 05:10:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrcAT-0004j9-QG
 for qemu-devel@nongnu.org; Thu, 19 May 2022 05:10:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652951399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EfB0FCgk6eSMb0q4FV+DUNsPgKpoIf8OP9BlTtYMcYM=;
 b=K2evqg9bwRLSA+v0/NfNNzLbYjObIP5ntC9zWh7LIrUTC2OENcwOIdAxz485RXkoyxIDNE
 8fCEEnLtc72BX2mOR/z4PR2VQScqpZcNBWRsmi0al88lGhfijAL/4cLV4Fhxnc2gC/hVwY
 zq99yckhtqNfsbNWS4lXOtkCTec+S9w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-Y8i0KUDoPuiJFXGHnhKVdQ-1; Thu, 19 May 2022 05:09:58 -0400
X-MC-Unique: Y8i0KUDoPuiJFXGHnhKVdQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 m26-20020a7bcb9a000000b0039455e871b6so1600312wmi.8
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 02:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EfB0FCgk6eSMb0q4FV+DUNsPgKpoIf8OP9BlTtYMcYM=;
 b=FoOPFzwXQiHp0W8mdXliDRX4NF/xK+a7U7CDd7XMDtCpcBk6HLXsq/vH7r2tN6nnM6
 s0fiqeDgJpDSGYkYGLyVofhPvMAirvkn5CRM1XgIJeTLCreVK/CQZe5wfEptgplfT+bL
 2HYDCmLgGw3vL265QwoQHUOcUZR2N2zF7kHw6s6rI6vv56rCiScRgKXtVn6QiIDOyh+E
 ixiE+Ss50Sb6sxuRkjxl7ZxuHcmNvPGwUjN3AS+pNtExsR6E58lnAhHaXPxUkZc3LbBY
 RacOtsLdJQdOXZJ0EIEXVbLx4dBQAnIeVlVIND51xITdAD+PUycTEM2Yu56bgOls0/F1
 55ug==
X-Gm-Message-State: AOAM533dpmd1j6EmWrXgsDRfyu2twcQc2Cd6g/A5r2CuC9o4p92gZ/hh
 E23jm5WPHsQZMJDlRwmvVkJcUUvMxggqLIyG8nm96JWSZ5CoPygic/kPdfb8Pppdt8tJH79ZrjG
 hwY5+9lBGqWNu/w8=
X-Received: by 2002:adf:f887:0:b0:20d:104c:66f4 with SMTP id
 u7-20020adff887000000b0020d104c66f4mr3144258wrp.528.1652951396742; 
 Thu, 19 May 2022 02:09:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye/G3nqLRkwybYTdh9ZpS4dDiqtfTXqV1KujAI7W/3A8aM5B7U0iov4TpvArzNrtXrSDlORw==
X-Received: by 2002:adf:f887:0:b0:20d:104c:66f4 with SMTP id
 u7-20020adff887000000b0020d104c66f4mr3144235wrp.528.1652951396501; 
 Thu, 19 May 2022 02:09:56 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-176-97.web.vodafone.de.
 [109.43.176.97]) by smtp.gmail.com with ESMTPSA id
 j17-20020a05600c489100b003942a244ed0sm3527694wmp.21.2022.05.19.02.09.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 02:09:55 -0700 (PDT)
Message-ID: <1a958cf7-d5c8-2bba-5860-37ad92586dcd@redhat.com>
Date: Thu, 19 May 2022 11:09:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/3] ui: Switch "-display sdl" to use the QAPI parser
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 libvir-list@redhat.com, Ryan El Kochta <relkochta@gmail.com>
References: <20220518134446.211632-1-thuth@redhat.com>
 <20220518134446.211632-3-thuth@redhat.com> <87pmkakhdk.fsf@pond.sub.org>
 <f1e31bd1-551e-0366-8a59-d012b23bb88e@redhat.com>
 <fa3d97ca-ae63-30aa-4b0b-10f786069e15@redhat.com>
 <0fa5a892-0053-4172-60f3-d6e5a49a23fd@redhat.com>
 <YoX3AFUoXCFxI4Sa@redhat.com> <87o7zthpcr.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87o7zthpcr.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 19/05/2022 10.57, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
>> On Thu, May 19, 2022 at 09:27:08AM +0200, Thomas Huth wrote:
>>> On 19/05/2022 09.08, Thomas Huth wrote:
>>>> On 19/05/2022 08.39, Thomas Huth wrote:
>>>>> On 18/05/2022 17.08, Markus Armbruster wrote:
>>>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>>>
>>>>>>> The "-display sdl" option still uses a hand-crafted parser for its
>>>>>>> parameters since we didn't want to drag an interface we considered
>>>>>>> somewhat flawed into the QAPI schema. Since the flaws are gone now,
>>>>>>> it's time to QAPIfy.
>>>>>>>
>>>>>>> This introduces the new "DisplaySDL" QAPI struct that is used to hold
>>>>>>> the parameters that are unique to the SDL display. The only specific
>>>>>>> parameter is currently "grab-mod" that is used to specify the required
>>>>>>> modifier keys to escape from the mouse grabbing mode.
>>>>>>>
>>>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>>>> ---
>>>>>>>    qapi/ui.json            | 27 +++++++++++++++-
>>>>>>>    include/sysemu/sysemu.h |  2 --
>>>>>>>    softmmu/globals.c       |  2 --
>>>>>>>    softmmu/vl.c            | 70 +----------------------------------------
>>>>>>>    ui/sdl2.c               | 10 ++++++
>>>>>>>    5 files changed, 37 insertions(+), 74 deletions(-)
>>>>>>>
>>>>>>> diff --git a/qapi/ui.json b/qapi/ui.json
>>>>>>> index 11a827d10f..a244e26e0f 100644
>>>>>>> --- a/qapi/ui.json
>>>>>>> +++ b/qapi/ui.json
>>>>>>> @@ -1295,6 +1295,30 @@
>>>>>>>          '*swap-opt-cmd': 'bool'
>>>>>>>      } }
>>>>>>> +##
>>>>>>> +# @GrabMod:
>>>>>>> +#
>>>>>>> +# Set of modifier keys that need to be hold for shortcut key actions.
>>>>>>> +#
>>>>>>> +# Since: 7.1
>>>>>>> +##
>>>>>>> +{ 'enum'  : 'GrabMod',
>>>>>>> +  'data'  : [ 'lctrl-lalt', 'lshift-lctrl-lalt', 'rctrl' ] }
>>>>>>
>>>>>> This is fine now.  If we ever generalize to "arbitrary set of modifier
>>>>>> keys", it'll become somewhat awkward.  No objection from me.
>>>
>>> Oh well, I just noticed that we already have a GrabToggleKeys enum in
>>> qapi/common.json ... I wonder whether I should try to use that instead? It
>>> seems to be used in a slightly different context, though, if I get that
>>> right ...?
>>
>> It also doesn't distinguish left & right control/alt/shift keys
>> for some reason.  So you would end up having to add more enum
>> entries for SDL, none of which overlap with existing enum entries.
>> Rather a pity, as the consistency would have been nice
> 
> Speaking of consistency: stick to the key names we use in QKeyCode?
> Sadly, they contain '_'.

The "grab-mod" with the current name already exists, so if we want to switch 
to those names, we need to deprecate the current ones again ... and the 
enums would really look ugly in the code, too, e.g. CTRL_L_ALT_L ... hard to 
tell where the "L" really belongs to ... so I'd rather stick with the 
current names, I think.

  Thomas


