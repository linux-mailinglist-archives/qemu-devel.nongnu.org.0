Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 495FE45D73
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 15:05:07 +0200 (CEST)
Received: from localhost ([::1]:51382 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbltC-0002zQ-4h
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 09:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35643)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <lvivier@redhat.com>) id 1hbloc-0002By-KW
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 09:00:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lvivier@redhat.com>) id 1hbloa-0006IP-St
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 09:00:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44096)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1hbloa-0006Fu-Kt
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 09:00:20 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3F3E185A03;
 Fri, 14 Jun 2019 13:00:10 +0000 (UTC)
Received: from [10.36.117.111] (ovpn-117-111.ams2.redhat.com [10.36.117.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F185467270;
 Fri, 14 Jun 2019 13:00:05 +0000 (UTC)
To: Amit Shah <amit@infradead.org>, qemu-devel@nongnu.org
References: <20190611172032.19143-1-lvivier@redhat.com>
 <8c2d26799074a46fb5f2aaae7dc4e951ec8318a2.camel@infradead.org>
 <3ecdbf3e-abb1-b74c-7751-9740b5a2e4fc@redhat.com>
 <34b3714f71373982264915d351c3161937500b1a.camel@infradead.org>
From: Laurent Vivier <lvivier@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=lvivier@redhat.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b2ad8de7-e4a6-8679-83af-1d1fbab6d19b@redhat.com>
Date: Fri, 14 Jun 2019 15:00:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <34b3714f71373982264915d351c3161937500b1a.camel@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 14 Jun 2019 13:00:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC] virtio-rng: add a watchdog
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Amit Shah <amit@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/06/2019 09:49, Amit Shah wrote:
> On Thu, 2019-06-13 at 10:53 +0200, Laurent Vivier wrote:
>> On 12/06/2019 09:03, Amit Shah wrote:
>>> On Tue, 2019-06-11 at 19:20 +0200, Laurent Vivier wrote:
>>>> The virtio-rng linux driver can be stuck in virtio_read() on a
>>>> wait_for_completion_killable() call if the virtio-rng device in
>>>> QEMU
>>>> doesn't provide data.
>>>>
>>>> It's a problem, because virtio_read() is called from
>>>> rng_get_data()
>>>> with
>>>> reading_mutex() held.  The same mutex is taken by
>>>> add_early_randomness()
>>>> and hwrng_fillfn() and this brings to a hang during the boot
>>>> sequence
>>>> if
>>>> the virtio-rng driver is builtin.
>>>> Moreover, another lock is taken (rng_mutex) when the hwrng driver
>>>> wants to switch the RNG device or the user tries to unplug the
>>>> virtio-rng
>>>> PCI card, and this can hang too because the virtio-rng driver is
>>>> only
>>>> able
>>>> to release the card if the virtio-rng device sends back the
>>>> virtqueue
>>>> element.
>>>>
>>>>   # echo -n virtio_rng.1 > /sys/class/misc/hw_random/rng_current
>>>>   [  240.165234] INFO: task kworker/u2:1:34 blocked for more than
>>>> 120
>>>> seconds.
>>>>   [  240.165961] "echo 0 >
>>>> /proc/sys/kernel/hung_task_timeout_secs"
>>>> disables this message.
>>>>   [  240.166708] kworker/u2:1    D
>>>> ffffffffb86b85a8     0    34      2 0x00000000
>>>>   [  240.166714] Workqueue: kacpi_hotplug acpi_hotplug_work_fn
>>>>   [  240.166716]  ffffa0e8f3c0b890 0000000000000046
>>>> ffffa0e8f3c00000
>>>> ffffa0e8f3c0bfd8
>>>>   [  240.166717]  ffffa0e8f3c0bfd8 ffffa0e8f3c0bfd8
>>>> ffffa0e8f3c00000
>>>> ffffffffb86b85a0
>>>>   [  240.166719]  ffffffffb86b85a4 ffffa0e8f3c00000
>>>> 00000000ffffffff
>>>> ffffffffb86b85a8
>>>>   [  240.166720] Call Trace:
>>>>   [  240.166725]  [<ffffffffb82a61c9>]
>>>> schedule_preempt_disabled+0x29/0x70
>>>>   [  240.166727]  [<ffffffffb82a40f7>]
>>>> __mutex_lock_slowpath+0xc7/0x1d0
>>>>   [  240.166728]  [<ffffffffb82a350f>] mutex_lock+0x1f/0x2f
>>>>   [  240.166730]  [<ffffffffb8022b52>] hwrng_register+0x32/0x1d0
>>>>   [  240.166733]  [<ffffffffc07fa149>] virtrng_scan+0x19/0x30
>>>> [virtio_rng]
>>>>   [  240.166744]  [<ffffffffc03108db>]
>>>> virtio_dev_probe+0x1eb/0x290
>>>> [virtio]
>>>>   [  240.166746]  [<ffffffffb803d6e5>]
>>>> driver_probe_device+0x145/0x3c0
>>>>   ...
>>>>
>>>> In some case, the QEMU RNG backend is not able to provide data,
>>>> and
>>>> the virtio-rng device is not aware of that:
>>>> - with rng-random using /dev/random and no entropy is available,
>>>> - with rng-egd started with a socket in "server,nowait" mode and
>>>>   no daemon connected,
>>>> - with rng-egd and an egd daemon that is not providing enough
>>>> data,
>>>> - ...
>>>>
>>>> To release the locks regularly, this patch adds a watchdog in
>>>> QEMU
>>>> virtio-rng device that sends back to the guest the virtqueue
>>>> buffer
>>>> with a 0 byte payload. This case is expected and correctly
>>>> managed by
>>>> the hwrng core.
>>>
>>> I'm wondering if it makes more sense to rework the way the kernel
>>> driver requests for seeding entropy during probe.
>>
>> The kernel side was my first angle of attack.
>> I tried first to not block in add_early_randomness():
>>
>>   "hwrng: core - don't block in add_early_randomness()"
>>   https://patchwork.kernel.org/patch/10877571/
>>
>> But I agree with the maintainer, the problem must be fixed at virtio-
>> rng 
>> level.
> 
> Yea.
> 
> How much of this is due to 'rng-egd was not set up properly; the
> backend did not appear in time' -- ie a setup problem; vs a problem we
> can expect to recur?

I agree there is a configuration issue here, but not only.

Imagine the egd daemon on host hangs, is it normal the guest hangs (in
the kernel) too?

It can also happen with rng-random on a host with not enough entropy.
Imagine several guests on the same host that require entropy and there
is not enough entropy for all.

> The current patch affects *all* requests from the guest.  The problem
> being seen though is just during the driver probe.  Is the current

Not only during the device probe. It happens also when we try to unplug
the virtio-rng card or when we try to switch rng backend in the guest
kernel.

> patch doing much more than is required?  Say the device runs out of
> randomness to provide after setup - the guest's read calls will just
> block and remain killable.  It's the probe currently that is not
> killable.

I don't think to be killable is the solution of the problem: who will
kill it? How to know we need to kill something?
Is this normal to have to explicitly kill a process when we want to
unplug a card?

> Other options to explore are:
> 
> 1. Ensure setup is ready (ie the device's backend is set up before
> plugging in the device), so that the device is ready to serve requests
> as soon as it's plugged in

A way I have explored is to not set ready the virtio-rng device in QEMU
if the backend is not ready (this should prevent the driver to be
started in the guest), but this only fixes a problem at startup. It
doesn't fix the problem if the EGD daemon on host hangs later or if
there is no enough entropy on the host (with EGD or /dev/random).

> 2. Make the add_early_randomness optional for virtio-rng.  (This is a
> big hammer, and working around bad setup problems.)

I've been tempted to remove it, but I don't remove code I don't
understand: why do we need the add_early_randomness() in first place?

>>> The virtio_read call is killable, so it can take signals when
>>> initiated
>>> by userspace.  For the initial probe, specifying a timeout /
>>> watchdog
>>> in the driver is better.
>>
...
>> But I have a problem doing the timeout / watchdog at driver level:
>> once 
>> the buffer is submitted to the virtqueue, how to cancel it? Is there
>> a 
>> way to ask the QEMU device to not process the element in the
>> virtqueue 
>> we have stopped to wait for because of the timeout (or for the
>> signal: I 
>> don't understand how it works in this case. How it is canceled?)?
> 
> Could be achieved via a control command?  But all that sounds quite> ugly (and also requires host+guest modification).
> 

Adding a control command changes the specification of the device, can
we? We need to add a queue, I guess?

So I think there is also a problem with the "killable" approach.

Using a watchdog in the QEMU device allows to remove the killable option
and to avoid to have a lost request in the queue, without changing the
specs, as the kernel rng core is able to manage 0 length data payload.

Thanks,
Laurent

