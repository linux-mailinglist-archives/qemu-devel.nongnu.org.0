Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5574F52CF25
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 11:16:13 +0200 (CEST)
Received: from localhost ([::1]:59012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrcGS-0007Bb-E6
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 05:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrcEN-0006VQ-BJ
 for qemu-devel@nongnu.org; Thu, 19 May 2022 05:14:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrcEJ-0005Um-S3
 for qemu-devel@nongnu.org; Thu, 19 May 2022 05:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652951632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XAdr9c6N3AhhP3ASvPQ5vc8zLzcuzNOCYREirDkTi5o=;
 b=U0yrCO98l1w5mlRRunZjnxercUL/074cnzgwfMs+tf8fR78K6i3sheU01vzJF929lwiRYn
 rUn1Hhh5SyECTgmNheoMOQHcSJ3Dzodzo5BPd4Y2sZWG7G/hLvb8JPjzwKpb+z32qb8rXJ
 E4hRQwX2KBT9wVz3fN9r4fLal4ucQ+c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-x_2LVSxqNuuNIT4Cs7bPtw-1; Thu, 19 May 2022 05:13:45 -0400
X-MC-Unique: x_2LVSxqNuuNIT4Cs7bPtw-1
Received: by mail-wm1-f71.google.com with SMTP id
 m124-20020a1c2682000000b00393fcd2722dso1612431wmm.4
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 02:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XAdr9c6N3AhhP3ASvPQ5vc8zLzcuzNOCYREirDkTi5o=;
 b=vJgpd7xWe3oM78Pxr1CFAzrK+I+SxwWVZr7T4V0JMAnAtWbvNRfj8/mkvvo6ryvV5I
 l3XYdKDi3i87rluee6Crov9+R52J2tskXGMkBgLM3yla1XFpLKYemE9pf0yTSw4qMgO1
 357BZd3ToR22dcLgCbmt/RLZKB736ghdvL26BbDdIQ1JNF3YyqunlyghaPREn70/hgHe
 2cYFrGjTNIDdb40sm6R3LIpXbeNb1bNFkNhnmV3LAzsJZxNLPQdOLmhxJfYPbZmLi1wM
 XrQ7wgh+chWJOfaDC4Jmjgnzqpbc3YHOGisuN3Hf6pYVZ5QCMARnsByhOvOhraJQKVr0
 Z9mQ==
X-Gm-Message-State: AOAM531RjlpfOzr5IFh0Uj43fwpWPvaFO2rtIgTnKCJXpDb5xSrr+9Oy
 Rjmmxr724sYm8yM2+6rbZACd+ng6jo5DDHEjQJYCKIBNdNOgRUQ3jAUj/Wf+VsEfxPuxkncnfAU
 OG2sp6L+mYqSJIFY=
X-Received: by 2002:adf:eb82:0:b0:20c:a2eb:5fe6 with SMTP id
 t2-20020adfeb82000000b0020ca2eb5fe6mr3129023wrn.563.1652951624180; 
 Thu, 19 May 2022 02:13:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGQQs4MF2OLhD/oAV644LGIrZQkoUn7kZe0eQUtS4kGnSXENIFe6HWlZkCdWzURSLQe+Bobg==
X-Received: by 2002:adf:eb82:0:b0:20c:a2eb:5fe6 with SMTP id
 t2-20020adfeb82000000b0020ca2eb5fe6mr3129008wrn.563.1652951623999; 
 Thu, 19 May 2022 02:13:43 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-176-97.web.vodafone.de.
 [109.43.176.97]) by smtp.gmail.com with ESMTPSA id
 s10-20020adf978a000000b0020c5253d902sm4765833wrb.78.2022.05.19.02.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 02:13:43 -0700 (PDT)
Message-ID: <b5a5a79f-c8bb-267f-71ab-f93c89e487be@redhat.com>
Date: Thu, 19 May 2022 11:13:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/3] ui: Switch "-display sdl" to use the QAPI parser
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, libvir-list@redhat.com,
 Ryan El Kochta <relkochta@gmail.com>
References: <20220518134446.211632-1-thuth@redhat.com>
 <20220518134446.211632-3-thuth@redhat.com> <87pmkakhdk.fsf@pond.sub.org>
 <f1e31bd1-551e-0366-8a59-d012b23bb88e@redhat.com>
 <fa3d97ca-ae63-30aa-4b0b-10f786069e15@redhat.com>
 <0fa5a892-0053-4172-60f3-d6e5a49a23fd@redhat.com>
 <YoX3AFUoXCFxI4Sa@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YoX3AFUoXCFxI4Sa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 19/05/2022 09.51, Daniel P. Berrangé wrote:
> On Thu, May 19, 2022 at 09:27:08AM +0200, Thomas Huth wrote:
>> On 19/05/2022 09.08, Thomas Huth wrote:
>>> On 19/05/2022 08.39, Thomas Huth wrote:
>>>> On 18/05/2022 17.08, Markus Armbruster wrote:
>>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>>
>>>>>> The "-display sdl" option still uses a hand-crafted parser for its
>>>>>> parameters since we didn't want to drag an interface we considered
>>>>>> somewhat flawed into the QAPI schema. Since the flaws are gone now,
>>>>>> it's time to QAPIfy.
>>>>>>
>>>>>> This introduces the new "DisplaySDL" QAPI struct that is used to hold
>>>>>> the parameters that are unique to the SDL display. The only specific
>>>>>> parameter is currently "grab-mod" that is used to specify the required
>>>>>> modifier keys to escape from the mouse grabbing mode.
>>>>>>
>>>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>>>> ---
>>>>>>    qapi/ui.json            | 27 +++++++++++++++-
>>>>>>    include/sysemu/sysemu.h |  2 --
>>>>>>    softmmu/globals.c       |  2 --
>>>>>>    softmmu/vl.c            | 70 +----------------------------------------
>>>>>>    ui/sdl2.c               | 10 ++++++
>>>>>>    5 files changed, 37 insertions(+), 74 deletions(-)
>>>>>>
>>>>>> diff --git a/qapi/ui.json b/qapi/ui.json
>>>>>> index 11a827d10f..a244e26e0f 100644
>>>>>> --- a/qapi/ui.json
>>>>>> +++ b/qapi/ui.json
>>>>>> @@ -1295,6 +1295,30 @@
>>>>>>          '*swap-opt-cmd': 'bool'
>>>>>>      } }
>>>>>> +##
>>>>>> +# @GrabMod:
>>>>>> +#
>>>>>> +# Set of modifier keys that need to be hold for shortcut key actions.
>>>>>> +#
>>>>>> +# Since: 7.1
>>>>>> +##
>>>>>> +{ 'enum'  : 'GrabMod',
>>>>>> +  'data'  : [ 'lctrl-lalt', 'lshift-lctrl-lalt', 'rctrl' ] }
>>>>>
>>>>> This is fine now.  If we ever generalize to "arbitrary set of modifier
>>>>> keys", it'll become somewhat awkward.  No objection from me.
>>
>> Oh well, I just noticed that we already have a GrabToggleKeys enum in
>> qapi/common.json ... I wonder whether I should try to use that instead? It
>> seems to be used in a slightly different context, though, if I get that
>> right ...?
> 
> It also doesn't distinguish left & right control/alt/shift keys
> for some reason.  So you would end up having to add more enum
> entries for SDL, none of which overlap with existing enum entries.

We could also extend the SDL code to work with the other combos from 
GrabToggleKeys, I guess.

> Rather a pity, as the consistency would have been nice

I wonder which way would cause less "WTF?" situations in the future ... if 
we have one enum with slightly different naming between the entries, or if 
we have two enums that seems to be there for the same or at least very 
similar things, which still have still inconsistent namings between the 
entries...
I'm slightly inclined to go for the unified GrabToggleKeys enum, I think...

  Thomas


