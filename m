Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA0135079A
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 21:49:50 +0200 (CEST)
Received: from localhost ([::1]:60484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRgqb-0007CC-2T
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 15:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lRgoF-0006Kl-Bp; Wed, 31 Mar 2021 15:47:24 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:35356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lRgoC-0001pB-Tj; Wed, 31 Mar 2021 15:47:22 -0400
Received: by mail-qt1-x832.google.com with SMTP id l6so7125043qtq.2;
 Wed, 31 Mar 2021 12:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0Qkp9+G4pna5IOy+FSlmpxq2bQhRDTEvYWa3NTr9BbY=;
 b=W7gp9D2PZbnkbcjxq1QBUrz9jslXKlwuoR84x+DT1EbdRfQDKp2k/PrQpXELFs1lkd
 l7fV4bh5yirg/1WyjlFe95sqeCAmgAV9toFdeteH8EAgwwkKG4A7mLXiAoTKLGxf4Lqc
 pbBi0hPe7cqHVmLyH58rZBDq8HNi5/mS11pxwp2fN+TfYcAaIq2/DQeNT52I5t2HQ4L1
 6gwudhFSssDjjTpSAo7ISvyn8JLaqUyWfZf6rwYkkOIYorLqhwpo8fHCMh2HMWDENVCR
 6gb8HYm+mLgAd+dVN9qbDsp4zPQvQ7Q+EOkqkfocI5FxXOkwdIF/ubOGeM+1pKrB76yH
 r15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0Qkp9+G4pna5IOy+FSlmpxq2bQhRDTEvYWa3NTr9BbY=;
 b=UBT8hwPWs6IHOf45aF2iO8Y0enE/r+eJSAWauhgVpUxZYtkS8RVDYnJLeobuGsqJb6
 uLqESsxGx7z3XrU99OydlkT+yqz8UMYP4NJhaeyFEHzRt5F+OKnrmdeVtnuBeoiv6vYY
 ugxBg98aS2PII0YX+5ErtYj4LkPPBQn4442YPWZ15UgcELqTupam3kBzGVc4nCQxQv0I
 Rt7reyBBf81iCNi8dtxJV6/bq1Wpnxo22ZnQK+ocJsG7UVyXqGHkbY5e7h4dh+XEUIPg
 MAUorL9F64Gm3IIGDbI5YWG53vCUktRmHP8/Jrs2jNgIYwVZqiKS3bm/F1x6VW1CLG3b
 tBUw==
X-Gm-Message-State: AOAM530jJFanO1hsFDIvvRt7HLN2JMQHZHMPkVPDNlpKDTbeq9baM/w8
 YJNamFnJXAmB7BcrJ8f61ng=
X-Google-Smtp-Source: ABdhPJyOyDPazCBhRaDS7ZMg1xlbfv7e0d0MznbfNVysy3YE1LBo3pfn9nABigS3LkZJuFSeLFFLUQ==
X-Received: by 2002:ac8:59c9:: with SMTP id f9mr3929713qtf.234.1617220039513; 
 Wed, 31 Mar 2021 12:47:19 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:e000:6f43:93dd:11a0:93a1?
 ([2804:431:c7c6:e000:6f43:93dd:11a0:93a1])
 by smtp.gmail.com with ESMTPSA id h7sm2170109qkk.41.2021.03.31.12.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 12:47:19 -0700 (PDT)
Subject: Re: [PATCH 0/4] DEVICE_NOT_DELETED/DEVICE_UNPLUG_ERROR QAPI events
To: David Gibson <david@gibson.dropbear.id.au>,
 Igor Mammedov <imammedo@redhat.com>
References: <20210312200740.815014-1-danielhb413@gmail.com>
 <YFlAheldkqCkZytI@yekko.fritz.box>
 <b8d96ab9-61e5-b941-6405-5beff5fe0df5@gmail.com>
 <YFqYkuBSD3xPgLVi@yekko.fritz.box>
 <ba20de28-d65b-6da4-5bff-92b637cf7a56@gmail.com>
 <20210330012831.2ce0514c@redhat.com> <YGO4aXzC6uEC3e/U@yekko.fritz.box>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <ab27b072-68f7-37d7-233c-fd5df2e8c1ef@gmail.com>
Date: Wed, 31 Mar 2021 16:47:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YGO4aXzC6uEC3e/U@yekko.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x832.google.com
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
Cc: groug@kaod.org, qemu-ppc@nongnu.org, armbru@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/30/21 8:46 PM, David Gibson wrote:
> On Tue, Mar 30, 2021 at 01:28:31AM +0200, Igor Mammedov wrote:
>> On Wed, 24 Mar 2021 16:09:59 -0300
>> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
>>
>>> On 3/23/21 10:40 PM, David Gibson wrote:
>>>> On Tue, Mar 23, 2021 at 02:10:22PM -0300, Daniel Henrique Barboza wrote:
>>>>>
>>>>>
>>>>> On 3/22/21 10:12 PM, David Gibson wrote:
>>>>>> On Fri, Mar 12, 2021 at 05:07:36PM -0300, Daniel Henrique Barboza wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> This series adds 2 new QAPI events, DEVICE_NOT_DELETED and
>>>>>>> DEVICE_UNPLUG_ERROR. They were (and are still being) discussed in [1].
>>>>>>>
>>>>>>> Patches 1 and 3 are independent of the ppc patches and can be applied
>>>>>>> separately. Patches 2 and 4 are based on David's ppc-for-6.0 branch and
>>>>>>> are dependent on the QAPI patches.
>>>>>>
>>>>>> Implementation looks fine, but I think there's a bit more to discuss
>>>>>> before we can apply.
>>>>>>
>>>>>> I think it would make sense to re-order this and put UNPLUG_ERROR
>>>>>> first.  Its semantics are clearer, and I think there's a stronger case
>>>>>> for it.
>>>>>
>>>>> Alright
>>>>>   
>>>>>>
>>>>>> I'm a bit less sold on DEVICE_NOT_DELETED, after consideration.  Does
>>>>>> it really tell the user/management anything useful beyond what
>>>>>> receiving neither a DEVICE_DELETED nor a DEVICE_UNPLUG_ERROR does?
>>>>>
>>>>>
>>>>> It informs that the hotunplug operation exceed the timeout that QEMU
>>>>> internals considers adequate, but QEMU can't assert that it was caused
>>>>> by an error or an unexpected delay. The end result is that the device
>>>>> is not going to be deleted from QMP, so DEVICE_NOT_DELETED.
>>>>
>>>> Is it, though?  I mean, it is with this implementation for papr:
>>>> because we clear the unplug_requested flag, even if the guest later
>>>> tries to complete the unplug, it will fail.
>>>>
>>>> But if I understand what Markus was saying correctly, that might not
>>>> be possible for all hotplug systems.  I believe Markus was suggesting
>>>> that DEVICE_NOT_DELETED could just mean that we haven't deleted the
>>>> device yet, but it could still happen later.
>>>>
>>>> And in that case, I'm not yet sold on the value of a message that
>>>> essentially just means "Ayup, still dunno what's happening, sorry".
>>>>    
>>>>> Perhaps we should just be straightforward and create a DEVICE_UNPLUG_TIMEOUT
>>>>> event.
>>>>
>>>> Hm... what if we added a "reason" field to UNPLUG_ERROR.  That could
>>>> be "guest rejected hotplug", or something more specific, in the rare
>>>> case that the guest has a way of signalling something more specific,
>>>> or "timeout" - but the later *only* to be sent in cases where on the
>>>> timeout we're able to block any later completion of the unplug (as we
>>>> can on papr).
>>
>> Is canceling unplug on timeout documented somewhere (like some spec)?
> 
> Uh.. not as such.  In the PAPR model, hotplugs and unplugs are mostly
> guest directed, so the question doesn't really arise.
> 
>> If not it might (theoretically) confuse guest when it tries to unplug
>> after timeout and leave guest in some unexpected state.
> 
> Possible, but probably not that likely.  The mechanism we use to
> "cancel" the hotplugs is that we just fail the hypercalls that the
> guest will need to call to actually complete the hotplug.  We also
> fail those in some other situations, and that seems to work.
> 
> That said, I no longer think this cancelling on timeout is a good
> idea, since it mismatches what happens on other platforms more than I
> think we need to.
> 
> My now preferred approach is to revert the timeout changes, but
> instead allow retries of unplugs to be issued.  I think that's just a
> matter of resending the unplug message to the guest, while making it
> otherwise a no-op on the qemu side.

I used this approach in a patch I sent back in January:

"[PATCH v2 1/1] spapr.c: always pulse guest IRQ in spapr_core_unplug_request()"

https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg04399.html


Let me know and I'll revert the timeout mechanism and re-post this one.
I guess there's still time to make this change in the 6.0.0 window, avoiding
releasing a mechanism we're not happy with.



Thanks,


DHB

> 
>>> I believe that's already covered by the existing API:
>>>
>>>
>>> +# @DEVICE_UNPLUG_ERROR:
>>> +#
>>> +# Emitted when a device hot unplug error occurs.
>>> +#
>>> +# @device: device name
>>> +#
>>> +# @msg: Informative message
>>>
>>> The 'informative message' would be the reason the event occurred. In patch
>>> 4/4, for the memory hotunplug refused by the guest, it is being set as:
>>>
>>>        qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
>>>                                     "for device %s", dev->id);
>>>        qapi_event_send_device_unplug_error(dev->id, qapi_error);
>>>
>>>
>>>
>>> We could use the same DEVICE_UNPLUG_ERROR event in the CPU hotunplug timeout
>>> case (currently on patch 2/4) by just changing 'msg', e.g.:
>>>
>>>
>>>        qapi_error = g_strdup_printf("CPU hotunplug timeout for device %s", dev->id);
>>>        qapi_event_send_device_unplug_error(dev->id, qapi_error);
>>>
>>
>> lets make everything support ACPI (just kidding).
> 
> Heh.  If nothing else, doesn't help us with existing guests.
> 
>> maybe we can reuse already existing ACPI_DEVICE_OST instead of DEVICE_UNPLUG_ERROR
>> which sort of does the same thing (and more) but instead of strings uses status codes
>> defined by spec.
> 
> Hmm.  I'm a bit dubious about issuing ACPI messages for a non ACPI
> guest, but maybe that could work.
> 
>> Idea similar to DEVICE_UNPLUG_ERROR was considered back then, but instead of QEMU being
>> a poor translator of status codes to non machine-readable strings we went with
>> exposing well documented status codes to user. This way user can implement
>> specific reactions to particular errors just looking at JSON + spec.
>>
>>> Thanks,
>>>
>>> DHB
>>>
>>>
>>>>
>>>> Thoughs, Markus?
>>>>    
>>>
>>
> 

