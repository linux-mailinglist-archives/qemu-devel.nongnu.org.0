Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEC947CF74
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 10:43:05 +0100 (CET)
Received: from localhost ([::1]:48950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzy9I-0005q5-BN
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 04:43:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mzy45-0004sX-VQ
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 04:37:43 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:34218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mzy43-0004X1-Ib
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 04:37:41 -0500
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 3230321C32;
 Wed, 22 Dec 2021 09:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1640165857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3//mYzxbm1qvq4AqCTszC4gIJehYelPUlXJ7rH009wk=;
 b=VvVmBTBA5jpPQNlVyLcpueFXoImogH+gVeRTVOM6GcPP2jFwOZw7zHizt+tDUHmR0yPAcP
 xlwzj6vVBTtE9TPXl5F4FDueWJHGZIwTwFLmeKa2R50+HMyWOMeczm+CxQJsEfDLjQ7R98
 rX/+WsFgeZ0mmutVXhPpghx+TkGV7jM=
Message-ID: <bff1182f-3e49-6ba9-6a65-602a0f7c434a@greensocs.com>
Date: Wed, 22 Dec 2021 10:37:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] vl: Add -set options to device opts dict when using JSON
 syntax for -device
Content-Language: en-US-large
To: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20211221071818.34731-1-mkfssion@mkfssion.com>
 <877dbyjj0t.fsf@dusky.pond.sub.org> <87h7b2i07h.fsf@dusky.pond.sub.org>
 <1b8249e6-ffe1-86e4-a2e8-c85c794438e0@redhat.com>
 <871r26ge4z.fsf@dusky.pond.sub.org>
 <20211222082247.epv27gxeq622d2ts@sirius.home.kraxel.org>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20211222082247.epv27gxeq622d2ts@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.694,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 MkfsSion <mkfssion@mkfssion.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/22/21 09:22, Gerd Hoffmann wrote:
> On Tue, Dec 21, 2021 at 04:40:28PM +0100, Markus Armbruster wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>
>>> On 12/21/21 13:58, Markus Armbruster wrote:
>>>>> Is this a regression?  I suspect commit 5dacda5167 "vl: Enable JSON
>>>>> syntax for -device" (v6.2.0).
>>>>
>>>> Obviously not a regression: everything that used to work still works.
>>>
>>> FWIW I think -set should be deprecated.  I'm not aware of any
>>> particularly useful use of it.  There are a couple in the QEMU tests
>>> (in vhost-user-test and in qemu-iotests 068), but in both cases the
>>> code would be easier to follow without; patches can be dusted off if
>>> desired.
>>
>> -set has its uses, but they're kind of obscure.  When you want to use
>> some canned configuration with slight modifications, then -readconfig
>> canned.cfg -set ... is nicer than editing a copy of canned.cfg.
> 
> Simliar: configure stuff not supported by libvirt:
> 
>    <qemu:commandline>
>      <qemu:arg value='-set'/>
>      <qemu:arg value='device.video0.guestdebug=1'/>
>    </qemu:commandline>
> 
> There will always be a gap between qemu and libvirt, even if most of
> them are temporary only (while developing a new feature).  I think we
> need some way to deal with this kind of tweaks when moving to QAPI-based
> machine setup.  Possibly not in qemu, maybe it's easier to add new
> '<qemu:set device=... property=... value=...>' syntax to libvirt.
> 
> take care,
>    Gerd
> 
> 

Can the set feature be handled by libvirt ?
I mean, libvirt could do the merge itself because if I understand it 
correctly, the snippset just say:
please add/override the "guestdebug=1" key/value pair to the 'video0' 
device command option.

In QAPI, otherwise, we have qom-set, but it will happens after the 
device has been created, so it don't work for all properties.

--
Damien

