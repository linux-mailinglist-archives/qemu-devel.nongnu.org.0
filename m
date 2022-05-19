Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4D252CD19
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 09:32:19 +0200 (CEST)
Received: from localhost ([::1]:57816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nradu-000163-5C
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 03:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nraZ2-0000PA-Sa
 for qemu-devel@nongnu.org; Thu, 19 May 2022 03:27:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nraZ0-0006uc-8V
 for qemu-devel@nongnu.org; Thu, 19 May 2022 03:27:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652945233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xU3yccC+T9c/EBN/pui/BvKu/uj9BOpMrQD/J/b1zxc=;
 b=ceJMU8sZPx+HLjT7uhWYS7jGo0jfp1cTDZTQsNYQJpAVJRi9oPvNPe1I04zO4SQ9tB6kyP
 oOHGm9R5/uMKLy93Do4lVGaB9ehSRdRHpZUTI+koO5JL90OpM9VpTJdevr86nDt3ukAugb
 XJFjh8HBnOcdH+v/gKm92vJhEhhN4+s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-qDLCy7Y8Oc-zxzUV_-PYzw-1; Thu, 19 May 2022 03:27:12 -0400
X-MC-Unique: qDLCy7Y8Oc-zxzUV_-PYzw-1
Received: by mail-wm1-f70.google.com with SMTP id
 205-20020a1c02d6000000b003928cd3853aso4110727wmc.9
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 00:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=xU3yccC+T9c/EBN/pui/BvKu/uj9BOpMrQD/J/b1zxc=;
 b=rdfnMRVhuP+p3zuqfnMQ1WRd7TQnklKCjlEfZLTK1LUUOv+/e5gB2LEzjrJuwnHTiC
 UrjjmlutgX9zTomITrIAvpDjqW0HGkKmP1CxW0vpBzdwAmVzKrmPEFf+fANJfK2rKyoj
 g1kvS3HtsMAdky5+LEcEyb/qGi2gCklWCWElf4rNt1eak9Qa/z7tQ+HoQI7ybv0L+WG0
 rvU7n31XtuEmnNdEgbEO7DZPx9/rv69J9A9TauJwNoT29AziGeJn6i+cxqarDri3AroA
 U91vGrpPG9Xu+c8S7pId7zV4S6aPR2vmV5rkybEfn6pTs4mVVekwfubUuZiS4UUgt5ny
 QkBg==
X-Gm-Message-State: AOAM533s+4hLR8hqrMJaVRoJXDHPW99CHP6PKrmGQ420Dpejh/RLrhQ/
 p84sxERiiV4cPuQiSsUd+vrFpi2JvPZ8WLX8a3cAQPHySe012kKi/eXi8LSk8kbz6xegGmzfm+A
 9/V8krgdx2XW/I8U=
X-Received: by 2002:adf:fd0e:0:b0:20d:110b:5c52 with SMTP id
 e14-20020adffd0e000000b0020d110b5c52mr2950268wrr.82.1652945230962; 
 Thu, 19 May 2022 00:27:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPs7kcXmJ/doOzFGeEzwGu7wHWfztr8xplj8EAwfYIsFwFH5paWMrtf0JAXgLnhXn+vLPCCg==
X-Received: by 2002:adf:fd0e:0:b0:20d:110b:5c52 with SMTP id
 e14-20020adffd0e000000b0020d110b5c52mr2950248wrr.82.1652945230715; 
 Thu, 19 May 2022 00:27:10 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-176-97.web.vodafone.de.
 [109.43.176.97]) by smtp.gmail.com with ESMTPSA id
 u8-20020a5d6da8000000b0020d10a249eesm4283009wrs.13.2022.05.19.00.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 00:27:10 -0700 (PDT)
Message-ID: <0fa5a892-0053-4172-60f3-d6e5a49a23fd@redhat.com>
Date: Thu, 19 May 2022 09:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/3] ui: Switch "-display sdl" to use the QAPI parser
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 libvir-list@redhat.com, =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?=
 <berrange@redhat.com>, Ryan El Kochta <relkochta@gmail.com>
References: <20220518134446.211632-1-thuth@redhat.com>
 <20220518134446.211632-3-thuth@redhat.com> <87pmkakhdk.fsf@pond.sub.org>
 <f1e31bd1-551e-0366-8a59-d012b23bb88e@redhat.com>
 <fa3d97ca-ae63-30aa-4b0b-10f786069e15@redhat.com>
In-Reply-To: <fa3d97ca-ae63-30aa-4b0b-10f786069e15@redhat.com>
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

On 19/05/2022 09.08, Thomas Huth wrote:
> On 19/05/2022 08.39, Thomas Huth wrote:
>> On 18/05/2022 17.08, Markus Armbruster wrote:
>>> Thomas Huth <thuth@redhat.com> writes:
>>>
>>>> The "-display sdl" option still uses a hand-crafted parser for its
>>>> parameters since we didn't want to drag an interface we considered
>>>> somewhat flawed into the QAPI schema. Since the flaws are gone now,
>>>> it's time to QAPIfy.
>>>>
>>>> This introduces the new "DisplaySDL" QAPI struct that is used to hold
>>>> the parameters that are unique to the SDL display. The only specific
>>>> parameter is currently "grab-mod" that is used to specify the required
>>>> modifier keys to escape from the mouse grabbing mode.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>   qapi/ui.json            | 27 +++++++++++++++-
>>>>   include/sysemu/sysemu.h |  2 --
>>>>   softmmu/globals.c       |  2 --
>>>>   softmmu/vl.c            | 70 +----------------------------------------
>>>>   ui/sdl2.c               | 10 ++++++
>>>>   5 files changed, 37 insertions(+), 74 deletions(-)
>>>>
>>>> diff --git a/qapi/ui.json b/qapi/ui.json
>>>> index 11a827d10f..a244e26e0f 100644
>>>> --- a/qapi/ui.json
>>>> +++ b/qapi/ui.json
>>>> @@ -1295,6 +1295,30 @@
>>>>         '*swap-opt-cmd': 'bool'
>>>>     } }
>>>> +##
>>>> +# @GrabMod:
>>>> +#
>>>> +# Set of modifier keys that need to be hold for shortcut key actions.
>>>> +#
>>>> +# Since: 7.1
>>>> +##
>>>> +{ 'enum'  : 'GrabMod',
>>>> +  'data'  : [ 'lctrl-lalt', 'lshift-lctrl-lalt', 'rctrl' ] }
>>>
>>> This is fine now.  If we ever generalize to "arbitrary set of modifier
>>> keys", it'll become somewhat awkward.  No objection from me.

Oh well, I just noticed that we already have a GrabToggleKeys enum in 
qapi/common.json ... I wonder whether I should try to use that instead? It 
seems to be used in a slightly different context, though, if I get that 
right ...?

  Thomas


