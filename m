Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4618F696582
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:57:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRvn8-00044i-7P; Tue, 14 Feb 2023 08:56:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRvmz-00044L-0G
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:56:09 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRvmv-0005Ye-UE
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:56:08 -0500
Received: by mail-wm1-x32c.google.com with SMTP id z13so11044843wmp.2
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bp13dcZ7G9ut3u8dgXyXtzoqmHnPsuxFPoWyK/LXd88=;
 b=DsUDdaoWXrNsUTSm4r49sl+PIk1j1q+xVGGDojXMhUFlMgRPbhQ6s3jO4zH+8lBXGd
 gVincEtYKRxgqsFQMXrxHu71Mpk575wAea5oFy40anj7hz5U7kFYMVb1WeAjB/ZFWgPj
 F4Hj2KWv9bGP8tTcuZpMo6IjeHUnIRx65n2FOOnpEfkbLATMIQSnF9mcp3L82GG8w20u
 cOUAXxgONmPpEdNxElGeeidagef01/AQ95cp3vD7YTaFcQghxnMt3X1YLK9NrjrvgmZE
 iyv5Ue6/M+EIkugWbNNOy3gHIsAlHCdMhBd57pInq4JvEOnoyYLBBJPxasvYAS9zfF6Z
 +OWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bp13dcZ7G9ut3u8dgXyXtzoqmHnPsuxFPoWyK/LXd88=;
 b=llEIcFhFSjEN7oEUIIA1Auyfmla3jFWRNWTiJB2hplvlGINAFPa+b4rQJi72a2YSUw
 onCTquH8ba0LrMqrBdeSxs0qlxpB+5jPb015OOkPR06mhzreTmF3G83RtV1appcJkhF7
 FlQOs8QGvKRrOt/vQzYX8+X+MUHojl/bVyvEkpde/bm+mR2QJDmuzWQ7AHdErSM1IcI+
 tXWKL0R3/3qztK6GYucakkUWeQRBYgSl0SFzkn3MuS15ZkfSnpHmCAjerd7BOYysr1oK
 WhWjq9el0R/kxEL+lTciQd/JGqfhHx/JMFWmUdPq7jGavYR1Kg4GuQkmKK3zbBpU8T6y
 lXiA==
X-Gm-Message-State: AO0yUKW/jsUZBoIniSKS93C0VRy0hQWsnSkFLlxGODjRsLWU1SpI00V6
 n6ff1/J4u1FfyJZR94lrC2a5Ww==
X-Google-Smtp-Source: AK7set80l+SD2sBc8XcsKjG1xC7xYk4acRmZz0e6eNrXOT2Kf3cziVrDIuRAxVQbsJ5LBtCtKg3N4Q==
X-Received: by 2002:a05:600c:1652:b0:3dc:16d4:a99f with SMTP id
 o18-20020a05600c165200b003dc16d4a99fmr2028543wmn.8.1676382962924; 
 Tue, 14 Feb 2023 05:56:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c328f00b003dc5b59ed7asm16502171wmp.11.2023.02.14.05.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 05:56:02 -0800 (PST)
Message-ID: <9509eb04-16a3-9b29-f676-940f5d51d263@linaro.org>
Date: Tue, 14 Feb 2023 14:56:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v4 14/16] qapi: deprecate "device" field of DEVICE_* events
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>, eduardo@habkost.net,
 antonkuchin@yandex-team.ru, mst@redhat.com,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 den-plotnikov@yandex-team.ru, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, eblake@redhat.com
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-15-vsementsov@yandex-team.ru>
 <Y+pFe4bRCqbJJbp0@redhat.com> <87bklwoce9.fsf@pond.sub.org>
 <Y+tTgpoz/o0nDu9r@angien.pipo.sk> <Y+ttBkTvDv1T7qi1@redhat.com>
 <87ttzojwl7.fsf@pond.sub.org>
 <73444fb8-49a7-fc2f-091e-6f65e916fa58@linaro.org>
 <87o7pwigqn.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87o7pwigqn.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 14/2/23 13:17, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 14/2/23 12:49, Markus Armbruster wrote:
>>> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> [...]
> 
>>>> What's the documented way to construct a QOM path, given only an ID  as
>>>> input ?
>>>
>>> QOM paths a gap in our documentation, even though the composition tree
>>> structure has been stable since day one, and is de facto ABI.
>>>
>>> Short answer: "/machine/peripheral/ID".
>>>
>>> Long answer follows.
>>>
>>> We have three "containers" under /machine that serve as parents for
>>> devices:
>>>
>>> * /machine/peripheral/
>>>
>>>    Parent of user-created devices with ID.  Children are named "ID".
>>>
>>>    Put there by qdev_set_id(), called from qdev_device_add_from_qdict().
>>>
>>>    On "user-created": Nothing stops board code to abuse qdev_set_id() for
>>>    onboard devices, directly or indirectly, but it really, really
>>>    shouldn't.
>>>
>>> * /machine/peripheral-anon/
>>>
>>>    Parent of user-created devices without ID.  Children are named
>>>    "device[N]", where N counts up from zero.
>>>
>>>    Put there by qdev_set_id(), called from qdev_device_add_from_qdict().
>>>
>>>    Again, abuse by board code is possible, but would be wrong.
>>>
>>>    Beware: a particular device's N changes when the set of devices
>>>    created before it grows or shrinks.  Messing with the machine type can
>>>    change it (different onboard devices).
>>>
>>> * /machine/unattached/
>>>
>>>    Surrogate parent of onboard devices created without a parent.
>>>
>>>    Put there by device_set_realized() (general case),
>>>    qdev_connect_gpio_out_named() (input pins) , memory_region_do_init()
>>>    (memory regions), qemu_create_machine() (the main sysbus).
>>>
>>>    I believe this container was created as a convenience, so we don't
>>>    have to retrofit parents to existing code.  Probably abused ever
>>>    since.
>>
>> Are you suggesting this is a stable interface and we can not move
>> devices (like from /machine/unattached/ to /machine/peripheral/)
>> without going thru the deprecation process?
> 
> Difficult question!
> 
> The point of not changing interfaces incompatibly without a grace period
> / deprecation process is not breaking users of the interface.
> 
> When an interface has always worked a certain way, its users may well
> depend on it, whether it's documented or not.
> 
> The question to ask is always "will this break users?"
> 
> For documented aspects, we generally assume it will.  Doesn't mean we
> can simply assume "won't" for undocumented aspects.
> 
> Does this make sense?

Yes, but I never considered the QOM paths as a stable interface...
I'm very surprised.

"Automatically assigned to /machine/unattached/" doesn't seem
quite stable...

