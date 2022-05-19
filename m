Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5CB52CC28
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 08:48:06 +0200 (CEST)
Received: from localhost ([::1]:40498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrZx6-0002jG-B2
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 02:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrZox-0001JD-4O
 for qemu-devel@nongnu.org; Thu, 19 May 2022 02:39:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrZou-00082j-2p
 for qemu-devel@nongnu.org; Thu, 19 May 2022 02:39:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652942375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iCVAc2uUaXVbBbNdnoCxIf3hVZdicWdERAKMXD1m0LI=;
 b=Trezay3VL0o8bWU0zi0v3FKhW+EDkVl9P3bVTnE0Q8l21FDH4tBGwajFuZq2xjzA9uqABL
 qMHk/xnMLJ8/gT457gZucqTedklMnjS+Vo1lnLunFAcC6f3aUNkPsfNz3trz34QpGIed0L
 BDWIlsqL77cuWZ9RGBEZvzP0c7kjzfQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-OUxcGwO5Ncey1SkwB997XA-1; Thu, 19 May 2022 02:39:33 -0400
X-MC-Unique: OUxcGwO5Ncey1SkwB997XA-1
Received: by mail-wr1-f72.google.com with SMTP id
 h3-20020adffa83000000b0020e5f0b8090so1163741wrr.19
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 23:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iCVAc2uUaXVbBbNdnoCxIf3hVZdicWdERAKMXD1m0LI=;
 b=GzYdsRShMjnm9yq/MMUpYhSPToi75nSgoJq5D6/PbScUvWwKRa4c/44QD7kYuYGJTE
 W56VOrWztZibR/AeiIkYs9dT7snJ1Oq2peZe/Ajk9r63+GdPbNPN80EqbAbrlrWvy9FA
 gKMYabWac7JF0NmaXKqPlSW7nHIsZrd2FGAQvyX5Ukolg8KiUj7D4mA5BVghG9Re3bgO
 uXgCBGmIjIHTHp88OFjq9INyktb+kdYd1plMABprAvWuybnp9fvZybsWQsab9aq8PsJD
 198cQXh0dQfXPwMpttgtfhthzKhRo45mIww9XUR9rdmo3hz3Rn1CpmR2hMRoO2dUA8Tw
 vJOg==
X-Gm-Message-State: AOAM532BV1jvrLT84dYquvojlulbiGf21NUXkF+u+s1hEX2K5pdBvfYh
 yqTZtHDpsCSm5su4ZcW1Ft6rWX94Wy+atPjTIJroFT9X0AQY92+JJreZfGo5yq2p5QGFdEJeF1p
 MabIn+12aV8G6Xzk=
X-Received: by 2002:adf:d1c2:0:b0:20c:a916:490e with SMTP id
 b2-20020adfd1c2000000b0020ca916490emr2551497wrd.403.1652942371853; 
 Wed, 18 May 2022 23:39:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzijKUKuD0HtVsIaA66caF2vkhIv94lPhGO4OltVlZReNUg2docRDc2Rpv2XRn83eZpHlT5IA==
X-Received: by 2002:adf:d1c2:0:b0:20c:a916:490e with SMTP id
 b2-20020adfd1c2000000b0020ca916490emr2551475wrd.403.1652942371615; 
 Wed, 18 May 2022 23:39:31 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-176-97.web.vodafone.de.
 [109.43.176.97]) by smtp.gmail.com with ESMTPSA id
 j33-20020a05600c1c2100b00394832af31csm9168519wms.0.2022.05.18.23.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 23:39:31 -0700 (PDT)
Message-ID: <f1e31bd1-551e-0366-8a59-d012b23bb88e@redhat.com>
Date: Thu, 19 May 2022 08:39:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/3] ui: Switch "-display sdl" to use the QAPI parser
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 libvir-list@redhat.com, =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?=
 <berrange@redhat.com>
References: <20220518134446.211632-1-thuth@redhat.com>
 <20220518134446.211632-3-thuth@redhat.com> <87pmkakhdk.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87pmkakhdk.fsf@pond.sub.org>
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

On 18/05/2022 17.08, Markus Armbruster wrote:
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
>>   qapi/ui.json            | 27 +++++++++++++++-
>>   include/sysemu/sysemu.h |  2 --
>>   softmmu/globals.c       |  2 --
>>   softmmu/vl.c            | 70 +----------------------------------------
>>   ui/sdl2.c               | 10 ++++++
>>   5 files changed, 37 insertions(+), 74 deletions(-)
>>
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index 11a827d10f..a244e26e0f 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -1295,6 +1295,30 @@
>>         '*swap-opt-cmd': 'bool'
>>     } }
>>   
>> +##
>> +# @GrabMod:
>> +#
>> +# Set of modifier keys that need to be hold for shortcut key actions.
>> +#
>> +# Since: 7.1
>> +##
>> +{ 'enum'  : 'GrabMod',
>> +  'data'  : [ 'lctrl-lalt', 'lshift-lctrl-lalt', 'rctrl' ] }
> 
> This is fine now.  If we ever generalize to "arbitrary set of modifier
> keys", it'll become somewhat awkward.  No objection from me.
> 
>> +
>> +##
>> +# @DisplaySDL:
>> +#
>> +# SDL2 display options.
>> +#
>> +# @grab-mod:  String with modifier keys that should be pressed together with
> 
> s/String with modifier keys/Modifier keys/
> 
>> +#             the "G" key to release the mouse grab. Only "lshift-lctrl-lalt"
>> +#             and "rctrl" are currently supported.
> 
> Why do we define lctrl-lalt if it's not supported?

It's the default value if you don't specify the grab-mod parameter. So it's 
supported, you get this mode if you use "grab-mod=lctrl-lalt" or no grab-mod 
parameter at all.

  Thomas


