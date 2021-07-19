Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C993CCF7D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 10:56:12 +0200 (CEST)
Received: from localhost ([::1]:38616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5P4N-00041D-2z
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 04:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5P2q-0002oi-3y
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 04:54:36 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5P2o-00039z-80
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 04:54:35 -0400
Received: by mail-wr1-x42d.google.com with SMTP id k4so21010693wrc.8
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 01:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=DP3yczUnQtBV5Gxc5AzlZQ0a+HfqoUMQSKWKHKcwiPo=;
 b=CuRy9rPTnLkT41qhr1Gs/7wUg2wsoPBLdxVv+BvYcZYG6KgPqmUlIt7DR0jgdmxcr3
 5bgFiIxXurmhBxvoRAf7V4Ml2fHKck56/1ke41osVHuG5wZOvO5ZDJQh0vph6tOZKY1Q
 qZ5ykwysEO3oVu84/I3JW7p/IRYd+c2Rw4M+C+a8z13U+9zeiRQHjtGIW7oyscFHQTmU
 ke61QbS7uBTmTFRkCOPOv8+gcMpjHnGVArHmOlqH38jFqABCmw6QsN5cKiccJ+kAOz8g
 gEkV5cYMwwkOOmSMiq+K9hiPPLQuM8bMMK+SOVKaC6UG6V9Br/NQBXASQcTVZkr5wIzi
 IsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=DP3yczUnQtBV5Gxc5AzlZQ0a+HfqoUMQSKWKHKcwiPo=;
 b=E+PRJO71cHqZoRSONibLqZwCjAeQrCwQHxpvmkBLpdW4C2IwIkrgUPjvUdzcRGPaGX
 +MA8gVUejn7dBybAAYMtJmHlfU6ShK/2bI+dH0FRLJ7pOsNY15GefcLqtekWLZG6mE59
 pOnNoqlZBnfg92smJnNr7RVg7ySMtf1kx8AHIAh9eknXdoyitAmPcqnlC/Osn6/avSqP
 4HJb5xmmOyNsmFERLZjjEX2SvuRcSNUYCLEQZqi651jJsM4v3i/mRs6bL2wxkYc4FqTs
 /q52edqup39TU4FjpnE5lBDc02SNM1f1bQsJiwnw01Oo6R7WSU7+mfBs2rKzavi3i5RD
 +wrQ==
X-Gm-Message-State: AOAM531sUcrmzXcYGjwMWVFtkI9HFdW0ur34vCCEIXtGKetQbiQA+4I3
 bfjZCtEPgfXad0YEbIvuOtSTA77j08pG/Q==
X-Google-Smtp-Source: ABdhPJweThaRKfuqiIwg4D5kLc2OcLJMPUGJqPF8x/CupAxki/ET+dcpvbdc59Sd8DUcuX4kIDfYsA==
X-Received: by 2002:a5d:6c6e:: with SMTP id r14mr28984727wrz.242.1626684870511; 
 Mon, 19 Jul 2021 01:54:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f26sm15897065wmc.29.2021.07.19.01.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 01:54:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AE6151FF7E;
 Mon, 19 Jul 2021 09:54:28 +0100 (BST)
References: <20210714182056.25888-1-alex.bennee@linaro.org>
 <20210714182056.25888-3-alex.bennee@linaro.org>
 <8735sgds41.fsf@dusky.pond.sub.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 02/21] docs: collect the disparate device emulation
 docs into one section
Date: Mon, 19 Jul 2021 09:34:36 +0100
In-reply-to: <8735sgds41.fsf@dusky.pond.sub.org>
Message-ID: <878s22r8e3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Markus Armbruster <armbru@redhat.com> writes:

> Cc: QOM maintainers for additional eyes.
>
> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>> While we are at it add a brief preamble that explains some of the
>> common concepts in QEMU's device emulation which will hopefully lead
>> to less confusing about our dizzying command line options.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20210714093638.21077-3-alex.bennee@linaro.org>
>> ---
>>  docs/system/device-emulation.rst          | 78 +++++++++++++++++++++++
>>  docs/system/{ =3D> devices}/ivshmem.rst     |  0
>>  docs/system/{ =3D> devices}/net.rst         |  0
>>  docs/system/{ =3D> devices}/nvme.rst        |  0
>>  docs/system/{ =3D> devices}/usb.rst         |  0
>>  docs/system/{ =3D> devices}/virtio-pmem.rst |  0
>>  docs/system/index.rst                     |  6 +-
>>  7 files changed, 79 insertions(+), 5 deletions(-)
>>  create mode 100644 docs/system/device-emulation.rst
>>  rename docs/system/{ =3D> devices}/ivshmem.rst (100%)
>>  rename docs/system/{ =3D> devices}/net.rst (100%)
>>  rename docs/system/{ =3D> devices}/nvme.rst (100%)
>>  rename docs/system/{ =3D> devices}/usb.rst (100%)
>>  rename docs/system/{ =3D> devices}/virtio-pmem.rst (100%)
>>
>> diff --git a/docs/system/device-emulation.rst b/docs/system/device-emula=
tion.rst
>> new file mode 100644
>> index 0000000000..3156eeac2d
>> --- /dev/null
>> +++ b/docs/system/device-emulation.rst
>> @@ -0,0 +1,78 @@
>> +.. _device-emulation:
>> +
>> +Device Emulation
>> +----------------
>> +
>> +QEMU supports the emulation of a large number of devices from
>> +peripherals such network cards and USB devices to integrated systems
>> +on a chip (SoCs). Configuration of these is often a source of
>> +confusion so it helps to have an understanding of some of the terms
>> +used to describes devices within QEMU.
>> +
>> +Common Terms
>> +~~~~~~~~~~~~
>> +
>> +Device Front End
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +A device front end is how a device is presented to the guest. The type
>> +of device presented should match the hardware that the guest operating
>> +system is expecting to see. All devices can be specified with the
>> +``--device`` command line option. Running QEMU with the command line
>> +options ``--device help`` will list all devices it is aware of. Using
>> +the command line ``--device foo,help`` will list the additional
>> +configuration options available for that device.
>> +
>> +A front end is often paired with a back end, which describes how the
>> +host's resources are used in the emulation.
>> +
>> +Device Buses
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +All devices exist on a BUS. Depending on the machine model you choose
>
> This isn't true anymore; there are bus-less devices.  To show the
> user-pluggable ones, try
>
>     $ qemu-system-FOO -device help | grep -v '", bus'


Are they user-pluggable though? Aside from strange cases like loaders
most of them look like SoC specific adornments which I suspect would
make no sense to attach to another machine type. x86_64 seems to be a
special case has all the various CPU types show up as non-bus devices.=20

>
>> +(``-M foo``) a number of buses will have been automatically created.
>> +In most cases the BUS a device is attached to can be inferred, for
>> +example PCI devices are generally automatically allocated to the next
>> +free slot of the PCI bus. However in complicated configurations you
>
> "The PCI bus" tacitly assumes there's just one.
>
> We actually pick the first bus (in qtree pre-order) that can take
> another device.  Best not to rely on the search order; if you care which
> bus to plug into, specify it with bus=3DID.
>
> "Next free slot" is about the device address on the bus.  Should we
> explain the concept "device address on a bus"?
>
>> +can explicitly specify what bus a device is attached to and its
>> +address. Some devices, for example a PCI SCSI host controller, will
>> +add an additional bus to the system that other devices can be attached
>
> A device can add more than one bus.

So how about:

  Most devices will exist on a BUS of some sort. Depending on the
  machine model you choose (``-M foo``) a number of buses will have been
  automatically created. In most cases the BUS a device is attached to
  can be inferred, for example PCI devices are generally automatically
  allocated to the next free address of first PCI bus found. However in
  complicated configurations you can explicitly specify what bus
  (``bus=3DID``) a device is attached to along with its address
  (``addr=3DN``). Some devices, for example a PCI SCSI host controller,
  will add an additional buses to the system that other devices can be
  attached to. A hypothetical chain of devices might look like:

    --device foo,bus=3Dpci.0,addr=3D0,id=3Dfoo.0
    --device bar,bus=3Dfoo.0,addr=3D1,id=3Dbaz

  which would be a bar device (with the ID of baz) which is attached to
  the foo bus foo.0 which itself is attached to the first slot of a PCI
  bus pci.0

Maybe we should add a section about device IDs?

--=20
Alex Benn=C3=A9e

