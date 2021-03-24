Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C761348147
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 20:12:02 +0100 (CET)
Received: from localhost ([::1]:43500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8vA-0007fW-Qv
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 15:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lP8tL-0006pr-AU; Wed, 24 Mar 2021 15:10:07 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:36736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lP8tJ-00077B-7A; Wed, 24 Mar 2021 15:10:07 -0400
Received: by mail-qt1-x830.google.com with SMTP id h7so18391812qtx.3;
 Wed, 24 Mar 2021 12:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hrM0TP8OKZWhXLi5Su1Mojg4h8PVtPTPFTGwM1kY+Wg=;
 b=iFjtx0ngOoE17IqmKsFF67UGPDwTvXkx8db9+WlteFt6WwulPXnLsBXApZwQRL6u0Y
 r8/2BnkHJYL9Ad2p+1InD488WzbPQO9hN6yoENhuYwtsVDr5xS5jmu8a+2weBFTz6mj7
 ubgnt6fYIdGGXKp7Bi5zOSF+k4wifK8poEKVCQGt0j3jT3L9qvZfIQNuIRJ8XKE2m/r/
 mH0dYPPLehztDHvqr8puxZI5QYI4F2X+WaMnZUi2dQe2sQkWJWthMG9KEiYFD4msT5V3
 MkO2BvpbRci2WAIuEVp6ficVLWG96QN3AGoX58LSP74/HGdfsmXOCZsx47mfF5xlfqhs
 lSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hrM0TP8OKZWhXLi5Su1Mojg4h8PVtPTPFTGwM1kY+Wg=;
 b=Qy5nsNzBmSG5mXCbudurbX6yC1MPIGHxlQQOfsRzo6yQ1Xs2CEFXyQmwVWyWC7oG4y
 MVB6WYL8e5lT4SGJHXGfisblgzsOx3jLtP4YwqcAiamJ1h6gIOnTywvZv0nQ+NqGvxEf
 qvj8KqsPEytqjYXzCLYN5PaEatrlfw6eRYNt/QQkVLTW+8vSkGCAhHj8vqL0U5l6nzLJ
 vCYmN8PG18pfLLotJPSEcXHWPvQCgrf/zJb3Gv9/2bOxy3aF+NUCR2OEavue5JPO8shg
 9sgZMWOFeGw/gArEe8nMj/v+J1Rna3YV1HVbwJLqkQYoaOxinzIjbRWGA4poeviBshBr
 xMyA==
X-Gm-Message-State: AOAM530O/9vwndMIdf26rdMZlWf3XxQWj0o7k12BltKif6zozXrd29Wz
 NM3PPhuuEcqcrvECDylauAI=
X-Google-Smtp-Source: ABdhPJyZOTkXGxWQc1T6zYN8NIYBF/7Z+CzNBQdjyoL6L8NbPzr13UOyQ3NJMVT7/WCO/Sdpo+nehA==
X-Received: by 2002:ac8:5d52:: with SMTP id g18mr4535004qtx.380.1616613003116; 
 Wed, 24 Mar 2021 12:10:03 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:3fd7:65e0:e5c6:f4fc:733c?
 ([2804:431:c7c6:3fd7:65e0:e5c6:f4fc:733c])
 by smtp.gmail.com with ESMTPSA id y9sm2388626qkm.19.2021.03.24.12.10.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 12:10:02 -0700 (PDT)
Subject: Re: [PATCH 0/4] DEVICE_NOT_DELETED/DEVICE_UNPLUG_ERROR QAPI events
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210312200740.815014-1-danielhb413@gmail.com>
 <YFlAheldkqCkZytI@yekko.fritz.box>
 <b8d96ab9-61e5-b941-6405-5beff5fe0df5@gmail.com>
 <YFqYkuBSD3xPgLVi@yekko.fritz.box>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <ba20de28-d65b-6da4-5bff-92b637cf7a56@gmail.com>
Date: Wed, 24 Mar 2021 16:09:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFqYkuBSD3xPgLVi@yekko.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x830.google.com
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/23/21 10:40 PM, David Gibson wrote:
> On Tue, Mar 23, 2021 at 02:10:22PM -0300, Daniel Henrique Barboza wrote:
>>
>>
>> On 3/22/21 10:12 PM, David Gibson wrote:
>>> On Fri, Mar 12, 2021 at 05:07:36PM -0300, Daniel Henrique Barboza wrote:
>>>> Hi,
>>>>
>>>> This series adds 2 new QAPI events, DEVICE_NOT_DELETED and
>>>> DEVICE_UNPLUG_ERROR. They were (and are still being) discussed in [1].
>>>>
>>>> Patches 1 and 3 are independent of the ppc patches and can be applied
>>>> separately. Patches 2 and 4 are based on David's ppc-for-6.0 branch and
>>>> are dependent on the QAPI patches.
>>>
>>> Implementation looks fine, but I think there's a bit more to discuss
>>> before we can apply.
>>>
>>> I think it would make sense to re-order this and put UNPLUG_ERROR
>>> first.  Its semantics are clearer, and I think there's a stronger case
>>> for it.
>>
>> Alright
>>
>>>
>>> I'm a bit less sold on DEVICE_NOT_DELETED, after consideration.  Does
>>> it really tell the user/management anything useful beyond what
>>> receiving neither a DEVICE_DELETED nor a DEVICE_UNPLUG_ERROR does?
>>
>>
>> It informs that the hotunplug operation exceed the timeout that QEMU
>> internals considers adequate, but QEMU can't assert that it was caused
>> by an error or an unexpected delay. The end result is that the device
>> is not going to be deleted from QMP, so DEVICE_NOT_DELETED.
> 
> Is it, though?  I mean, it is with this implementation for papr:
> because we clear the unplug_requested flag, even if the guest later
> tries to complete the unplug, it will fail.
> 
> But if I understand what Markus was saying correctly, that might not
> be possible for all hotplug systems.  I believe Markus was suggesting
> that DEVICE_NOT_DELETED could just mean that we haven't deleted the
> device yet, but it could still happen later.
> 
> And in that case, I'm not yet sold on the value of a message that
> essentially just means "Ayup, still dunno what's happening, sorry".
> 
>> Perhaps we should just be straightforward and create a DEVICE_UNPLUG_TIMEOUT
>> event.
> 
> Hm... what if we added a "reason" field to UNPLUG_ERROR.  That could
> be "guest rejected hotplug", or something more specific, in the rare
> case that the guest has a way of signalling something more specific,
> or "timeout" - but the later *only* to be sent in cases where on the
> timeout we're able to block any later completion of the unplug (as we
> can on papr).

I believe that's already covered by the existing API:


+# @DEVICE_UNPLUG_ERROR:
+#
+# Emitted when a device hot unplug error occurs.
+#
+# @device: device name
+#
+# @msg: Informative message

The 'informative message' would be the reason the event occurred. In patch
4/4, for the memory hotunplug refused by the guest, it is being set as:

      qapi_error = g_strdup_printf("Memory hotunplug rejected by the guest "
                                   "for device %s", dev->id);
      qapi_event_send_device_unplug_error(dev->id, qapi_error);



We could use the same DEVICE_UNPLUG_ERROR event in the CPU hotunplug timeout
case (currently on patch 2/4) by just changing 'msg', e.g.:


      qapi_error = g_strdup_printf("CPU hotunplug timeout for device %s", dev->id);
      qapi_event_send_device_unplug_error(dev->id, qapi_error);


Thanks,

DHB


> 
> Thoughs, Markus?
> 

