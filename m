Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC5452CC97
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 09:12:38 +0200 (CEST)
Received: from localhost ([::1]:50462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nraKp-000333-Mf
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 03:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nraHF-0001bE-WE
 for qemu-devel@nongnu.org; Thu, 19 May 2022 03:08:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nraHC-00042A-6O
 for qemu-devel@nongnu.org; Thu, 19 May 2022 03:08:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652944129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cmd9GYfQ/Daf6ZuIPJoznN9xxt2p4Kl1srZZXn8atRA=;
 b=SlxOG1qFenMBcL7V/EHStYxs4p/DhVK8J2r4JZL5Zt/0FT94T6NCZtxeO6B72Cen5m7anG
 wDkp2axkFwoPWRXUrAjU19D/FtDGG9k0MfFRrZmkUIvwtYwBl85UXERHs7733u/4Zk7iNz
 VSEgwWwW76EotuG5EeCbNL4vvH8Kn5Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-JA0XolGENhGPg7F7VpsDEg-1; Thu, 19 May 2022 03:08:47 -0400
X-MC-Unique: JA0XolGENhGPg7F7VpsDEg-1
Received: by mail-wr1-f70.google.com with SMTP id
 p10-20020adfaa0a000000b0020c4829af5fso1192976wrd.16
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 00:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=cmd9GYfQ/Daf6ZuIPJoznN9xxt2p4Kl1srZZXn8atRA=;
 b=RdjN5g40edINs+DyO6OF0djieR6InhTAiBpjLMK9e04JbdgtRC+mnH/7ng+w2xyVA0
 eBTIwk2iZ9CsFZI5bu28daNt0q1W8Q+GTQT8oOTup8t3wwcKOadNF0WpUSjTE5gOhyyM
 7veI8c6ZfVQz+6m7d6V85NL/Wqn6BqnPlc7fstzMnxrhVmhcILEvn4hBem4kj+ZHsGH2
 rMw8rFH5bfhuyNFT54wnPvezELmDUulP0YU9nOsMGVckJljq4o+NvTdIqbKcbMSxq42P
 Czum+TRG2zOPFraCUfGLghBPJGRUG+2iMXSqlt8Rad2hE+h9oAufmCJdSmOB6mhTR+5Q
 zjMw==
X-Gm-Message-State: AOAM5300uwNZn4N3zo7GgxcqYHunIvs49YtJowplkB10zRRH9c3QS8b6
 Tn9ul5HmUUx4iXxdK2ikfNui5nXrC1LGesQcppt5UgB8h/zgIxudQjBEk8Tkn0F6YGO5Ht2Lu6B
 t038IyHM/w2G73wU=
X-Received: by 2002:a05:600c:354c:b0:394:586f:694f with SMTP id
 i12-20020a05600c354c00b00394586f694fmr2402304wmq.159.1652944126794; 
 Thu, 19 May 2022 00:08:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxROF5+yNUWxHfMmEVVFD4xUs3ngKVPwWRkKQ3MPh7Zxnhxzg7yIfH4Z4lrkP45DsV+pereUA==
X-Received: by 2002:a05:600c:354c:b0:394:586f:694f with SMTP id
 i12-20020a05600c354c00b00394586f694fmr2402281wmq.159.1652944126548; 
 Thu, 19 May 2022 00:08:46 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-176-97.web.vodafone.de.
 [109.43.176.97]) by smtp.gmail.com with ESMTPSA id
 t12-20020adfba4c000000b0020c5253d91esm3919213wrg.106.2022.05.19.00.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 00:08:45 -0700 (PDT)
Message-ID: <fa3d97ca-ae63-30aa-4b0b-10f786069e15@redhat.com>
Date: Thu, 19 May 2022 09:08:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 2/3] ui: Switch "-display sdl" to use the QAPI parser
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 libvir-list@redhat.com, =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?=
 <berrange@redhat.com>
References: <20220518134446.211632-1-thuth@redhat.com>
 <20220518134446.211632-3-thuth@redhat.com> <87pmkakhdk.fsf@pond.sub.org>
 <f1e31bd1-551e-0366-8a59-d012b23bb88e@redhat.com>
In-Reply-To: <f1e31bd1-551e-0366-8a59-d012b23bb88e@redhat.com>
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

On 19/05/2022 08.39, Thomas Huth wrote:
> On 18/05/2022 17.08, Markus Armbruster wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>>
>>> The "-display sdl" option still uses a hand-crafted parser for its
>>> parameters since we didn't want to drag an interface we considered
>>> somewhat flawed into the QAPI schema. Since the flaws are gone now,
>>> it's time to QAPIfy.
>>>
>>> This introduces the new "DisplaySDL" QAPI struct that is used to hold
>>> the parameters that are unique to the SDL display. The only specific
>>> parameter is currently "grab-mod" that is used to specify the required
>>> modifier keys to escape from the mouse grabbing mode.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   qapi/ui.json            | 27 +++++++++++++++-
>>>   include/sysemu/sysemu.h |  2 --
>>>   softmmu/globals.c       |  2 --
>>>   softmmu/vl.c            | 70 +----------------------------------------
>>>   ui/sdl2.c               | 10 ++++++
>>>   5 files changed, 37 insertions(+), 74 deletions(-)
>>>
>>> diff --git a/qapi/ui.json b/qapi/ui.json
>>> index 11a827d10f..a244e26e0f 100644
>>> --- a/qapi/ui.json
>>> +++ b/qapi/ui.json
>>> @@ -1295,6 +1295,30 @@
>>>         '*swap-opt-cmd': 'bool'
>>>     } }
>>> +##
>>> +# @GrabMod:
>>> +#
>>> +# Set of modifier keys that need to be hold for shortcut key actions.
>>> +#
>>> +# Since: 7.1
>>> +##
>>> +{ 'enum'  : 'GrabMod',
>>> +  'data'  : [ 'lctrl-lalt', 'lshift-lctrl-lalt', 'rctrl' ] }
>>
>> This is fine now.  If we ever generalize to "arbitrary set of modifier
>> keys", it'll become somewhat awkward.  No objection from me.
>>
>>> +
>>> +##
>>> +# @DisplaySDL:
>>> +#
>>> +# SDL2 display options.
>>> +#
>>> +# @grab-mod:  String with modifier keys that should be pressed together 
>>> with
>>
>> s/String with modifier keys/Modifier keys/
>>
>>> +#             the "G" key to release the mouse grab. Only 
>>> "lshift-lctrl-lalt"
>>> +#             and "rctrl" are currently supported.
>>
>> Why do we define lctrl-lalt if it's not supported?
> 
> It's the default value if you don't specify the grab-mod parameter. So it's 
> supported, you get this mode if you use "grab-mod=lctrl-lalt" or no grab-mod 
> parameter at all.

Forgot to mention: I'll drop that sentence in v3. Since there is the enum 
now, people can look up the valid combinations there instead.

  Thomas


