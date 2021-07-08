Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBBA3C1511
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:21:31 +0200 (CEST)
Received: from localhost ([::1]:45362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1UuA-0001hX-3W
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m1Ut4-0008Us-Da; Thu, 08 Jul 2021 10:20:22 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:43933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m1Ut2-0005Cj-7i; Thu, 08 Jul 2021 10:20:22 -0400
Received: by mail-pf1-x435.google.com with SMTP id a127so5565999pfa.10;
 Thu, 08 Jul 2021 07:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VND23qYk8P1qF3G/Y9XISKE8pp2o1K3pqs3GjmOuLBU=;
 b=XcobesJkJ2ZO0j+u1LAoYBSF6SILZwjw00sRrfqx6/0lHuSst5QsHjnKJ0vlb2+E2k
 0grcxIkdgjUy0k4HcTjxrcXeUMMmGzkWJEj5exEjVLP25VzSLg8tcmoU+pS1gGczdUe0
 ukF2O2egv814m0kReg0RL8/gpK2pZvh4R1/yRN8MaM6il38KnUkme9xJWMM3XkdfRDHD
 7HczMiUXuFCZO9I5v6QRP0XiBSTezGMYm40Enn7VHGYMYmASMZlYydENXrIBFhwspbhy
 iYUNASwPrB6iObCm+00DrONKYi0dbN6Z6MLuXjDBm0gIr5s14Lfb7iz+QjGsNxGJ+hxd
 ls1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VND23qYk8P1qF3G/Y9XISKE8pp2o1K3pqs3GjmOuLBU=;
 b=MzTpNJ1BUBoGXPBKI1W36tKYiDFrzpMT15wykuRR5bCYq4mrhWYcZMn1VhCOkIwbWs
 8YheTkRTG6Gm3Y/CSTSNE0R1IMWsusORftms5IoXNe6sSB62PuPdNorrMgd2JD/MGK1k
 CYXwHTLFyE0uumBv/fu6ZqerIARBRkuKyQe1O5Au+K+YbMnYEOgVZKqCMFr8K4jnjtP/
 pcmmUHFLxqZuW7nU7XO8KtpzXIuX4MVmqMllXEYvKfYOvKpfZ+3eoSwUQ2mxwc7do4zg
 wXu0ZKMjhLLkZUh0D9YzuoMIqoXWMgk0QQsfmlDUkU7aQd1b3ovkl+fVqz+bWQjxVHQd
 e5eA==
X-Gm-Message-State: AOAM530BPELxSTo3NVlITpqK0JB2UCnSDi5o7iiGB++TNSZtMjMBWKth
 RgjyOC46LJGFdGBy9oYRs44=
X-Google-Smtp-Source: ABdhPJwqtMOOixfNp1zu/QRtA3MAzqBQ2jO8eCC4TBqgWNlD7dVH3Bz/S3LLCDS7RfGoCAfIx7xnWQ==
X-Received: by 2002:a63:d47:: with SMTP id 7mr32617182pgn.339.1625754014986;
 Thu, 08 Jul 2021 07:20:14 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c7:7611:8e83:da57:9eca:f0bf?
 ([2804:431:c7c7:7611:8e83:da57:9eca:f0bf])
 by smtp.gmail.com with ESMTPSA id e66sm3072837pfe.161.2021.07.08.07.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 07:20:14 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] qapi/qdev.json: add DEVICE_UNPLUG_ERROR QAPI event
To: Markus Armbruster <armbru@redhat.com>
References: <20210707003314.37110-1-danielhb413@gmail.com>
 <20210707003314.37110-2-danielhb413@gmail.com>
 <87r1g96jtr.fsf@dusky.pond.sub.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <666340f9-3fc9-4b9d-bd0c-bfe9a9f81506@gmail.com>
Date: Thu, 8 Jul 2021 11:20:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87r1g96jtr.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=danielhb413@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eblake@redhat.com, groug@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/8/21 10:01 AM, Markus Armbruster wrote:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> 
>> At this moment we only provide one event to report a hotunplug error,
>> MEM_UNPLUG_ERROR. As of Linux kernel 5.12 and QEMU 6.0.0, the pseries
>> machine is now able to report unplug errors for other device types, such
>> as CPUs.
>>
>> Instead of creating a (device_type)_UNPLUG_ERROR for each new device,
>> create a generic DEVICE_UNPLUG_ERROR event that can be used by all
>> unplug errors in the future.
>>
>> With this new generic event, MEM_UNPLUG_ERROR is now marked as deprecated.
>>
>> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   docs/system/deprecated.rst | 10 ++++++++++
>>   qapi/machine.json          |  6 +++++-
>>   qapi/qdev.json             | 27 ++++++++++++++++++++++++++-
>>   3 files changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
>> index 70e08baff6..ca6c7f9d43 100644
>> --- a/docs/system/deprecated.rst
>> +++ b/docs/system/deprecated.rst
>> @@ -204,6 +204,16 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
>>   (the ISA has never been upstreamed to a compiler toolchain). Therefore
>>   this CPU is also deprecated.
>>   
>> +
>> +QEMU API (QAPI) events
>> +----------------------
>> +
>> +``MEM_UNPLUG_ERROR`` (since 6.1)
>> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>> +
>> +Use the more generic event ``DEVICE_UNPLUG_ERROR`` instead.
>> +
>> +
>>   System emulator machines
>>   ------------------------
>>   
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index c3210ee1fb..a595c753d2 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -1271,6 +1271,9 @@
>>   #
>>   # @msg: Informative message
>>   #
>> +# Features:
>> +# @deprecated: This event is deprecated. Use @DEVICE_UNPLUG_ERROR instead.
>> +#
>>   # Since: 2.4
>>   #
>>   # Example:
>> @@ -1283,7 +1286,8 @@
>>   #
>>   ##
>>   { 'event': 'MEM_UNPLUG_ERROR',
>> -  'data': { 'device': 'str', 'msg': 'str' } }
>> +  'data': { 'device': 'str', 'msg': 'str' },
>> +  'features': ['deprecated'] }
>>   
>>   ##
>>   # @SMPConfiguration:
>> diff --git a/qapi/qdev.json b/qapi/qdev.json
>> index b83178220b..349d7439fa 100644
>> --- a/qapi/qdev.json
>> +++ b/qapi/qdev.json
>> @@ -84,7 +84,9 @@
>>   #        This command merely requests that the guest begin the hot removal
>>   #        process.  Completion of the device removal process is signaled with a
>>   #        DEVICE_DELETED event. Guest reset will automatically complete removal
>> -#        for all devices.
>> +#        for all devices. If an error in the hot removal process is detected,
>> +#        the device will not be removed and a DEVICE_UNPLUG_ERROR event is
>> +#        sent.
> 
> "If an error ... is detected" kind of implies that some errors may go
> undetected.  Let's spell this out more clearly.  Perhaps append "Some
> errors cannot be detected."
> 
> DEVICE_UNPLUG_ERROR's unrelability is awkward.  Best we can do in the
> general case.  Can we do better in special cases, and would it be
> worthwhile?  If yes, it should probably be done on top.
> 
> Two spaces between sentences for consistency with the existing text, please.

Ok!

> 
>>   #
>>   # Since: 0.14
>>   #
>> @@ -124,3 +126,26 @@
>>   ##
>>   { 'event': 'DEVICE_DELETED',
>>     'data': { '*device': 'str', 'path': 'str' } }
>> +
>> +##
>> +# @DEVICE_UNPLUG_ERROR:
>> +#
>> +# Emitted when a device hot unplug error occurs.
>> +#
>> +# @device: device name
>> +#
>> +# @msg: Informative message
>> +#
>> +# Since: 6.1
>> +#
>> +# Example:
>> +#
>> +# <- { "event": "DEVICE_UNPLUG_ERROR"
>> +#      "data": { "device": "dimm1",
>> +#                "msg": "Memory hotunplug rejected by the guest for device dimm1"
>> +#      },
>> +#      "timestamp": { "seconds": 1615570772, "microseconds": 202844 } }
>> +#
>> +##
>> +{ 'event': 'DEVICE_UNPLUG_ERROR',
>> +  'data': { 'device': 'str', 'msg': 'str' } }
> 
> Hmm.
> 
> DEVICE_DELETED provides the device ID if the device has one, and the QOM
> path.  Documentation is less than clear for both (not your patch's
> fault).

Now that you mentioned I realized that I was seeing both 'device' and 'path'
being propagated all this time in this event without noticing it. E.g.:

{"timestamp": {"seconds": 1625617532, "microseconds": 50228}, "event": "DEVICE_DELETED", "data": {"device": "core1", "path": "/machine/peripheral/core1"}}


> 
> DEVICE_UNPLUG_ERROR provides the device ID unconditionally, and doesn't
> provide the QOM path.  What if the device doesn't have a device ID?
> 
> I suspect DEVICE_UNPLUG_ERROR should match DEVICE_DELETED exactly.

Agree. That will allow us to send DEVICE_UNPLUG_ERROR events even if dev->id is
NULL since we're also providing the path.

DEVICE_UNPLUG_ERROR was inspired by MEM_UNPLUG_ERROR since the usage was similar,
but I guess we're better of basing the new event on DEVICE_DELETED API instead.

This will also fix most of your inquiries in patches 2 and 3 as well.


I'll do the proper adjustments and re-send.


> 
> Bonus (for me, not for you): improving the unclear documentation becomes
> your patch's problem.  Here's my attempt:
> 
>     # @device: the device's ID if it has one
>     #
>     # @path: the device's path within the object model
> 

I can make a pre-patch that add this information in DEVICE_DELETED documentation if
you prefer, instead of putting everything into the same patch (since the amended
DEVICE_DELETED docs are useful regardless of this work).



Thanks,



Daniel



