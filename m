Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA1735078D
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 21:42:19 +0200 (CEST)
Received: from localhost ([::1]:55826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRgjK-00051H-Ce
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 15:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lRghb-0004D5-O4; Wed, 31 Mar 2021 15:40:32 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:37563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lRghS-0006nc-DA; Wed, 31 Mar 2021 15:40:31 -0400
Received: by mail-qk1-x72c.google.com with SMTP id g15so20586662qkl.4;
 Wed, 31 Mar 2021 12:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sdyas/mMOtoFKEelLrCNP/FfyFUBgN2/2aRFGRpPttc=;
 b=eUrJbVsAdk80+HHEwIlmcsb8XE3LKbS0geUQJPHVrCIqy3SFum3yl4hLm1n3vsahNW
 fGwTyK0b/yIJgV8SMEWkh463hc+y5brYeJMuW0RMnb5A7IcqQbr62b4tDgt+ugBKoFEJ
 7lU1/21/J0jWnjm/vKP1fb5aNTXgTxo+88T+Z+wIqNphXTUAUTXFaQJyWsAT+jxW43Dl
 8eq16fbmkQSg/FrEV4MxOaWTFeHcQ0+pvgB4R/pVgwiR8uwwMSs1fHk4GnTWgfhYjRbg
 ZbGaY7QW1T88rqYjHmaxa220XlwQm6Kx8wmcdrD66BS2Phh1uyEsJrpwPQS3RAzkmqmn
 MvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sdyas/mMOtoFKEelLrCNP/FfyFUBgN2/2aRFGRpPttc=;
 b=O1UWpKSl0q4NCxZMkmuPUSEHNglX79gqlAbT6GK3ZXPI82JeQdrPN/yV8MaHExiDvm
 NQgSU/GdjtjRitRkr+51vYVJxRF0Ty48i+T0h3zGROHBnr7IVTwmdQTfgV2iajNnfBfH
 LIiFEC3NmKjzpfvzp5q2RxIrgvHUGqjgSQFyGIPAKXAM8GbKscSGj4XBTPl2+I5u9AKU
 rxFvK4njhdJHbWYFJw87gIqFYydNGggV4uHJVx484kZWjM7zWniGOHptoST5iXbPgt4V
 6AD4Okmw2spPlaHaoecICnHSrcHfIJCkkDbEFgchx51YBKldLBW0n/IJ1brBvSqq9DSe
 D4BQ==
X-Gm-Message-State: AOAM530A713ZbBYhIqFYFnS3qw3oUU5XdqycNu66kSWEKm0Xhjx4Nnrp
 ZY+1e3xv7gTE/I9qbord/sU=
X-Google-Smtp-Source: ABdhPJzYujBe75k+HMfTeoMSDZTzaEdZW2xZz6j5pcHVSYBYevskh7hq26MS1mBcLedZ78dNaTASvA==
X-Received: by 2002:a37:9f83:: with SMTP id i125mr4704948qke.36.1617219620266; 
 Wed, 31 Mar 2021 12:40:20 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:e000:6f43:93dd:11a0:93a1?
 ([2804:431:c7c6:e000:6f43:93dd:11a0:93a1])
 by smtp.gmail.com with ESMTPSA id x7sm1963515qtp.10.2021.03.31.12.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 12:40:19 -0700 (PDT)
Subject: Re: [PATCH 0/4] DEVICE_NOT_DELETED/DEVICE_UNPLUG_ERROR QAPI events
To: Igor Mammedov <imammedo@redhat.com>
References: <20210312200740.815014-1-danielhb413@gmail.com>
 <YFlAheldkqCkZytI@yekko.fritz.box>
 <b8d96ab9-61e5-b941-6405-5beff5fe0df5@gmail.com>
 <YFqYkuBSD3xPgLVi@yekko.fritz.box>
 <ba20de28-d65b-6da4-5bff-92b637cf7a56@gmail.com>
 <20210330012831.2ce0514c@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <85172cec-3634-14b6-9e7b-a3527c482abd@gmail.com>
Date: Wed, 31 Mar 2021 16:40:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210330012831.2ce0514c@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72c.google.com
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
Cc: qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 armbru@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/29/21 8:28 PM, Igor Mammedov wrote:
> On Wed, 24 Mar 2021 16:09:59 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
>> On 3/23/21 10:40 PM, David Gibson wrote:
>>> On Tue, Mar 23, 2021 at 02:10:22PM -0300, Daniel Henrique Barboza wrote:
>>>>
>>>>
>>>> On 3/22/21 10:12 PM, David Gibson wrote:
>>>>> On Fri, Mar 12, 2021 at 05:07:36PM -0300, Daniel Henrique Barboza wrote:
>>>>>> Hi,
>>>>>>
>>>>>> This series adds 2 new QAPI events, DEVICE_NOT_DELETED and
>>>>>> DEVICE_UNPLUG_ERROR. They were (and are still being) discussed in [1].
>>>>>>
>>>>>> Patches 1 and 3 are independent of the ppc patches and can be applied
>>>>>> separately. Patches 2 and 4 are based on David's ppc-for-6.0 branch and
>>>>>> are dependent on the QAPI patches.
>>>>>
>>>>> Implementation looks fine, but I think there's a bit more to discuss
>>>>> before we can apply.
>>>>>
>>>>> I think it would make sense to re-order this and put UNPLUG_ERROR
>>>>> first.  Its semantics are clearer, and I think there's a stronger case
>>>>> for it.
>>>>
>>>> Alright
>>>>   
>>>>>
>>>>> I'm a bit less sold on DEVICE_NOT_DELETED, after consideration.  Does
>>>>> it really tell the user/management anything useful beyond what
>>>>> receiving neither a DEVICE_DELETED nor a DEVICE_UNPLUG_ERROR does?
>>>>
>>>>
>>>> It informs that the hotunplug operation exceed the timeout that QEMU
>>>> internals considers adequate, but QEMU can't assert that it was caused
>>>> by an error or an unexpected delay. The end result is that the device
>>>> is not going to be deleted from QMP, so DEVICE_NOT_DELETED.
>>>
>>> Is it, though?  I mean, it is with this implementation for papr:
>>> because we clear the unplug_requested flag, even if the guest later
>>> tries to complete the unplug, it will fail.
>>>
>>> But if I understand what Markus was saying correctly, that might not
>>> be possible for all hotplug systems.  I believe Markus was suggesting
>>> that DEVICE_NOT_DELETED could just mean that we haven't deleted the
>>> device yet, but it could still happen later.
>>>
>>> And in that case, I'm not yet sold on the value of a message that
>>> essentially just means "Ayup, still dunno what's happening, sorry".
>>>    
>>>> Perhaps we should just be straightforward and create a DEVICE_UNPLUG_TIMEOUT
>>>> event.
>>>
>>> Hm... what if we added a "reason" field to UNPLUG_ERROR.  That could
>>> be "guest rejected hotplug", or something more specific, in the rare
>>> case that the guest has a way of signalling something more specific,
>>> or "timeout" - but the later *only* to be sent in cases where on the
>>> timeout we're able to block any later completion of the unplug (as we
>>> can on papr).
> 
> Is canceling unplug on timeout documented somewhere (like some spec)?

Nope.

> 
> If not it might (theoretically) confuse guest when it tries to unplug
> after timeout and leave guest in some unexpected state.

I consider this a remote possibility due to the generous timeout we're
using in the machine, but it is a possibility nevertheless.

> 
>>
>> I believe that's already covered by the existing API:
>>
>>
>> +# @DEVICE_UNPLUG_ERROR:
>> +#
>> +# Emitted when a device hot unplug error occurs.
>> +#
>> +# @device: device name
>> +#
>> +# @msg: Informative message
>>
>> The 'informative message' would be the reason the event occurred. In patch
>> 4/4, for the memory hotunplug refused by the guest, it is being set as:
>>
>>        qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
>>                                     "for device %s", dev->id);
>>        qapi_event_send_device_unplug_error(dev->id, qapi_error);
>>
>>
>>
>> We could use the same DEVICE_UNPLUG_ERROR event in the CPU hotunplug timeout
>> case (currently on patch 2/4) by just changing 'msg', e.g.:
>>
>>
>>        qapi_error = g_strdup_printf("CPU hotunplug timeout for device %s", dev->id);
>>        qapi_event_send_device_unplug_error(dev->id, qapi_error);
>>
> 
> lets make everything support ACPI (just kidding).

I would love to make PAPR more ACPI and less .... PAPR.

> 
> maybe we can reuse already existing ACPI_DEVICE_OST instead of DEVICE_UNPLUG_ERROR
> which sort of does the same thing (and more) but instead of strings uses status codes
> defined by spec.
> 
> Idea similar to DEVICE_UNPLUG_ERROR was considered back then, but instead of QEMU being
> a poor translator of status codes to non machine-readable strings we went with
> exposing well documented status codes to user. This way user can implement
> specific reactions to particular errors just looking at JSON + spec.


This is not a bad idea. Problem is that we don't have all ACPI_DEVICE_OST
fields to fill in because, well, both the timeout and the cancell mechanism
aren't specified there.


Thanks,


DHB

> 
>> Thanks,
>>
>> DHB
>>
>>
>>>
>>> Thoughs, Markus?
>>>    
>>
> 

