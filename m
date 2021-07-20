Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337103CFA6A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:18:22 +0200 (CEST)
Received: from localhost ([::1]:50254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pdd-0005ew-6S
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pVR-0000T3-Ge
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:09:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pVO-0002T2-Ra
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626786589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sunBrVW6OGIKS4TAaClFjSl8naErwXVVto+YTKzTuLo=;
 b=GEh7Ng+hwV681gtFFIpAVaRalL/SMhco9IphoOw0qQXTnacnXX0oOO6IMXKyi8x+5pIUjO
 rrHv6a2/TbIntdwwc+66XOH/dy52bkinHkqO1S4cOo2JzWYLb05uxcAExL12CPe8f+IgBT
 0JzhPl5ycT7O5kOd1Oo4nHOZek8UzlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-LnalY2xkP6C1A_1zrkXHpQ-1; Tue, 20 Jul 2021 09:09:48 -0400
X-MC-Unique: LnalY2xkP6C1A_1zrkXHpQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E837802920;
 Tue, 20 Jul 2021 13:09:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFD3B5D6A1;
 Tue, 20 Jul 2021 13:09:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5FF7911326B9; Tue, 20 Jul 2021 15:09:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 02/21] docs: collect the disparate device emulation
 docs into one section
References: <20210714182056.25888-1-alex.bennee@linaro.org>
 <20210714182056.25888-3-alex.bennee@linaro.org>
 <8735sgds41.fsf@dusky.pond.sub.org> <878s22r8e3.fsf@linaro.org>
Date: Tue, 20 Jul 2021 15:09:45 +0200
In-Reply-To: <878s22r8e3.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Mon, 19 Jul 2021 09:34:36 +0100")
Message-ID: <87r1ftf7xi.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Markus Armbruster <armbru@redhat.com> writes:
>
>> Cc: QOM maintainers for additional eyes.
>>
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>
>>> While we are at it add a brief preamble that explains some of the
>>> common concepts in QEMU's device emulation which will hopefully lead
>>> to less confusing about our dizzying command line options.
>>>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> Message-Id: <20210714093638.21077-3-alex.bennee@linaro.org>
>>> ---
>>>  docs/system/device-emulation.rst          | 78 +++++++++++++++++++++++
>>>  docs/system/{ =3D> devices}/ivshmem.rst     |  0
>>>  docs/system/{ =3D> devices}/net.rst         |  0
>>>  docs/system/{ =3D> devices}/nvme.rst        |  0
>>>  docs/system/{ =3D> devices}/usb.rst         |  0
>>>  docs/system/{ =3D> devices}/virtio-pmem.rst |  0
>>>  docs/system/index.rst                     |  6 +-
>>>  7 files changed, 79 insertions(+), 5 deletions(-)
>>>  create mode 100644 docs/system/device-emulation.rst
>>>  rename docs/system/{ =3D> devices}/ivshmem.rst (100%)
>>>  rename docs/system/{ =3D> devices}/net.rst (100%)
>>>  rename docs/system/{ =3D> devices}/nvme.rst (100%)
>>>  rename docs/system/{ =3D> devices}/usb.rst (100%)
>>>  rename docs/system/{ =3D> devices}/virtio-pmem.rst (100%)
>>>
>>> diff --git a/docs/system/device-emulation.rst b/docs/system/device-emul=
ation.rst
>>> new file mode 100644
>>> index 0000000000..3156eeac2d
>>> --- /dev/null
>>> +++ b/docs/system/device-emulation.rst
>>> @@ -0,0 +1,78 @@
>>> +.. _device-emulation:
>>> +
>>> +Device Emulation
>>> +----------------
>>> +
>>> +QEMU supports the emulation of a large number of devices from
>>> +peripherals such network cards and USB devices to integrated systems
>>> +on a chip (SoCs). Configuration of these is often a source of
>>> +confusion so it helps to have an understanding of some of the terms
>>> +used to describes devices within QEMU.
>>> +
>>> +Common Terms
>>> +~~~~~~~~~~~~
>>> +
>>> +Device Front End
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +A device front end is how a device is presented to the guest. The type
>>> +of device presented should match the hardware that the guest operating
>>> +system is expecting to see. All devices can be specified with the
>>> +``--device`` command line option. Running QEMU with the command line
>>> +options ``--device help`` will list all devices it is aware of. Using
>>> +the command line ``--device foo,help`` will list the additional
>>> +configuration options available for that device.
>>> +
>>> +A front end is often paired with a back end, which describes how the
>>> +host's resources are used in the emulation.
>>> +
>>> +Device Buses
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +All devices exist on a BUS. Depending on the machine model you choose
>>
>> This isn't true anymore; there are bus-less devices.  To show the
>> user-pluggable ones, try
>>
>>     $ qemu-system-FOO -device help | grep -v '", bus'
>
>
> Are they user-pluggable though? Aside from strange cases like loaders
> most of them look like SoC specific adornments which I suspect would
> make no sense to attach to another machine type.

qdev_device_add() has code for plugging bus-less devices.  Goes back to
2f7bd829db "qdev: Fix device_add bus assumptions", 2013-04-16.

>                                                  x86_64 seems to be a
> special case has all the various CPU types show up as non-bus devices.=20

The CPU types are non-bus devices everywhere.  For some targets, they're
pluggable.  Check out ppc64 and s390x.

>>> +(``-M foo``) a number of buses will have been automatically created.
>>> +In most cases the BUS a device is attached to can be inferred, for
>>> +example PCI devices are generally automatically allocated to the next
>>> +free slot of the PCI bus. However in complicated configurations you
>>
>> "The PCI bus" tacitly assumes there's just one.
>>
>> We actually pick the first bus (in qtree pre-order) that can take
>> another device.  Best not to rely on the search order; if you care which
>> bus to plug into, specify it with bus=3DID.
>>
>> "Next free slot" is about the device address on the bus.  Should we
>> explain the concept "device address on a bus"?
>>
>>> +can explicitly specify what bus a device is attached to and its
>>> +address. Some devices, for example a PCI SCSI host controller, will
>>> +add an additional bus to the system that other devices can be attached
>>
>> A device can add more than one bus.
>
> So how about:
>
>   Most devices will exist on a BUS of some sort. Depending on the
>   machine model you choose (``-M foo``) a number of buses will have been
>   automatically created. In most cases the BUS a device is attached to
>   can be inferred, for example PCI devices are generally automatically
>   allocated to the next free address of first PCI bus found. However in
>   complicated configurations you can explicitly specify what bus
>   (``bus=3DID``) a device is attached to along with its address
>   (``addr=3DN``).

Maybe break the paragraph here?

>                 Some devices, for example a PCI SCSI host controller,
>   will add an additional buses to the system that other devices can be
>   attached to. A hypothetical chain of devices might look like:
>
>     --device foo,bus=3Dpci.0,addr=3D0,id=3Dfoo.0
>     --device bar,bus=3Dfoo.0,addr=3D1,id=3Dbaz
>
>   which would be a bar device (with the ID of baz) which is attached to
>   the foo bus foo.0 which itself is attached to the first slot of a PCI
>   bus pci.0

Uh, the naming is... more complicated %-}

    $ ../qemu/bld/qemu-system-x86_64 -device lsi,id=3Dfoo.0 -device scsi-cd=
,bus=3Dfoo.0
    qemu-system-x86_64: -device scsi-cd,bus=3Dfoo.0: Bus 'foo.0' not found

The bus ID is commonly derived from the ID of the device that provides
it, here 'foo.0'.  The first bus is named ID.0, here 'foo.0.0'.  A
second bus would be named ID.1, and so forth.

The example should say

      --device foo,bus=3Dpci.0,addr=3D0,id=3Dfoo
      --device bar,bus=3Dfoo.0,addr=3D1,id=3Dbaz

> Maybe we should add a section about device IDs?

We can always improve on top.


