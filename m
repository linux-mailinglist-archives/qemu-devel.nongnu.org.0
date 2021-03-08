Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194B9331123
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:43:04 +0100 (CET)
Received: from localhost ([::1]:57344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJH67-00048c-4i
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:43:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lJGmj-00026B-FA; Mon, 08 Mar 2021 09:23:01 -0500
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:35810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lJGmh-0006ME-KU; Mon, 08 Mar 2021 09:23:01 -0500
Received: by mail-qt1-x82f.google.com with SMTP id z6so2458975qts.2;
 Mon, 08 Mar 2021 06:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HnyZUSQbhfcP5GtnqAH5uvgP/eVlJRUnBUdmqI6IidI=;
 b=OElqoFQzH8tDZER2QLP1PLgNGlk1iZHCwrEoRQ9odBMCjd6apJ3UlzwGcJ022TSuCS
 85ol3VIKktdw46YFemL8ExcrQT5Zr2GXIHeXgcLPG/f2FvI5SBiis7HhO2nI07ER8xHb
 vp44OYYuqFTgVbn4+DcIt06QuXdG5/KsG4vx0Jd8yi9qx1X31nVQhW/Cmjqrq0VjzI6O
 UaB8aKaNUyrSRZNyVvrhMuk99oKSYt4efLviAzVerO1yegECk8D9iJWk74j7R47azo9w
 nXIbjYKFOJiN2s0nMoNP+Dtb0ZUz6q852XGSVCzj1ifvuxp7HVmmqhqq8eW901o5kGSd
 EsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HnyZUSQbhfcP5GtnqAH5uvgP/eVlJRUnBUdmqI6IidI=;
 b=ADR/PDMx6tIzLiMFdqkDZEicN7e/xxk/TNlenwJKL4aokDgYoB9z7/4rfOK63SRJ8P
 HtbWb0qvDcUEeHrWob3uVSWE+IBYZPziwL2EF9qUv+OUAdKj5XxnEjEOoiJFdMYpUiMR
 Eyswwwz80vzBtsvMNmnR2Jzbmpw7on49WIaSM39ac0SiaiX0vz6Y8SRv420/CIU3F/53
 oaMBrQrAPGbZk2gPOcoZHECdqXYetWijq5PsQ9xgqynfktpbZHfkDXJq9hISYF8QtEQm
 Tg3UYhVGzBP3lQjswEzUGZ8yBPxJmFjpvR6EjKjHwtrsZWeZUG2NiLuQXLhC5AA0kwwe
 qANQ==
X-Gm-Message-State: AOAM533IRar6IR9i7azNjHKK5Cy/hVn40vSqQXJP3jwc4QQd++qs0fYl
 oUzbtV99Tcvw7odkg2MIiYg=
X-Google-Smtp-Source: ABdhPJydAk11he6PtYfZl8xOkHkACR6ZX9dkxgwM+ttHUgkbto1FAu5LExPo/s5oqvX2lyo63Y5A3g==
X-Received: by 2002:ac8:4684:: with SMTP id g4mr20260404qto.388.1615213377639; 
 Mon, 08 Mar 2021 06:22:57 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:1670:7849:4614:f4b6:4112?
 ([2804:431:c7c7:1670:7849:4614:f4b6:4112])
 by smtp.gmail.com with ESMTPSA id p126sm7658340qkf.110.2021.03.08.06.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 06:22:57 -0800 (PST)
Subject: Re: [RFC] adding a generic QAPI event for failed device hotunplug
To: Markus Armbruster <armbru@redhat.com>
References: <155911cc-8764-1a65-4bb3-2fc0628d52e5@gmail.com>
 <877dmkrcpl.fsf@dusky.pond.sub.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <d9567bf3-8740-e8fe-b29b-a3b0ebdb5809@gmail.com>
Date: Mon, 8 Mar 2021 11:22:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <877dmkrcpl.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82f.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, michael.roth@amd.com,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/6/21 3:57 AM, Markus Armbruster wrote:
> Cc: ACPI maintainers for additional expertise.
> 
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> 
>> Hi,
>>
>> Recent changes in pseries code (not yet pushed, available at David's
>> ppc-for-6.0) are using the QAPI event MEM_UNPLUG_ERROR to report memory
>> hotunplug errors in the pseries machine.
>>
>> The pseries machine is also using a timeout to cancel CPU hotunplugs that
>> takes too long to finish (in which we're assuming a guest side error) and
>> it would be desirable to also send a QAPI event for this case as well.
>>
>> At this moment, there is no "CPU_UNPLUG_ERROR" in QAPI (guess ACPI doesn't
>> need it).
> 
> I see two interpretations of "ACPI doesn't need":
> 
> 1. Unplug can't fail, or QEMU can't detect failure.  Michael, Igor?
> 
> 2. Management applications haven't needed to know badly enough to
> implement an event.
> 
>>            Before sending patches to implement this new event I had a talk
>> with David Gibson and he suggested that, instead of adding a new CPU_UNPLUG_ERROR
>> event, we could add a generic event (e.g. DEVICE_UNPLUG_ERROR) that can be
>> used by the pseries machine in both error scenarios (MEM and CPU).
> 
> Good point.  One general event is better than two special ones that
> could easily grow siblings.
> 
>> This could also be used by x86 as well, although I believe the use of
>> MEM_UNPLUG_ERROR would need to be kept for awhile to avoid breaking ABI.
> 
> Yes.  Our rules for interface deprecation apply.
> 
>> Any suggestions/comments?
> 
> We should document the event's reliability.  Are there unplug operations
> where we can't detect failure?  Are there unplug operations where we
> could, but haven't implemented the event?

The current version of the PowerPC spec that the pseries machine implements
(LOPAR) does not predict a way for the virtual machine to report a hotunplug
error back to the hypervisor. If something fails, the hypervisor is left
in the dark.

What happened in the 6.0.0 dev cycle is that we faced a reliable way of
making CPU hotunplug fail in the guest (trying to hotunplug the last online
CPU) and the pseries machine was unprepared for dealing with it. We ended up
implementing a hotunplug timeout and, if the timeout kicks in, we're assuming
that the CPU hotunplug failed in the guest. This is the first scenario we have
today where we want to send a QAPI event informing the CPU hotunplug error,
but this event does not exist in QEMU ATM.

The second scenario is a memory hotunplug error. I found out that the pseries
guest kernel does a reconfiguration step when re-attaching the DIMM right
after refusing the hotunplug, and this reconfiguration is visible to QEMU.
I proceeded to make the pseries machine detect this error case, rollback the
unplug operation and fire up the MEM_UNPLUG_ERROR. This case is already covered
by QAPI, but if we add a DEVICE_UNPLUG_ERROR event I would use it in this case as
well instead of the MEM specific one.

This investigation and work in the mem hotunplug error path triggered a
discussion in qemu-ppc, where we're considering whether we should do the same
signalling the kernel does for the DIMM hotunplug error for all other device
hotunplug errors, given that the reconfiguration per se is not forbidden by LOPAR
and it's currently a no-op. We would make a LOPAR spec change to make this an
official hotunplug error report mechanism, and all pseries hotunplug operations,
for all devices, would report DEVICE_UNPLUG_ERROR QAPI events in the error path.

Granted, the spec change + Kernel change is not something that we will be able
to nail down in the 6.0.0 cycle, but having the DEVICE_UNPLUG_ERROR QAPI event
already in place would make it easier for the future as well.


I have a doc draft of these changes/infos that I forgot to post. I would post
it as docs/system/ppc-spapr-hotunplug-notes.rst. I can add the QAPI events
information there as well. Does that work for you as far as documentation
goes?



DHB


> 
> The fewer exceptions, the better, of course.
> 

