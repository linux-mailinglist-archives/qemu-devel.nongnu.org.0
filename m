Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1143C98B3
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 08:12:28 +0200 (CEST)
Received: from localhost ([::1]:50046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ubj-000871-44
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 02:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m3uaS-0007PI-6y
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 02:11:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m3uaL-0006Vx-KI
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 02:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626329459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XToVkY4mKnxfmsFVxdNU9x8RCbeSXBFzMYoDDiYZ2us=;
 b=PsYbub9eVvWtD9Bk/jOK91nwfU3YBapTvp4+HUvMiiqGFKGL+2MfFOJzr7v5FCYRZVfk1y
 b3l0kk2YR7oj2IVvUMqfp7k3RoahsCFmOLsinzygcxcGMOwkpJWEspiKYuZbScJWh3qxU3
 d8KKlZd1g1UsOW1AhBfUyBdGUAPnTKc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-Db5N7AScOdaqS-cDIdWb8Q-1; Thu, 15 Jul 2021 02:10:57 -0400
X-MC-Unique: Db5N7AScOdaqS-cDIdWb8Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB57A10C1ADC;
 Thu, 15 Jul 2021 06:10:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-81.ams2.redhat.com
 [10.36.112.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39FDB60583;
 Thu, 15 Jul 2021 06:10:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C59F9113865F; Thu, 15 Jul 2021 08:10:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v2 02/21] docs: collect the disparate device emulation
 docs into one section
References: <20210714182056.25888-1-alex.bennee@linaro.org>
 <20210714182056.25888-3-alex.bennee@linaro.org>
Date: Thu, 15 Jul 2021 08:10:54 +0200
In-Reply-To: <20210714182056.25888-3-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Wed, 14 Jul 2021 19:20:37 +0100")
Message-ID: <8735sgds41.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: QOM maintainers for additional eyes.

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> While we are at it add a brief preamble that explains some of the
> common concepts in QEMU's device emulation which will hopefully lead
> to less confusing about our dizzying command line options.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20210714093638.21077-3-alex.bennee@linaro.org>
> ---
>  docs/system/device-emulation.rst          | 78 +++++++++++++++++++++++
>  docs/system/{ =3D> devices}/ivshmem.rst     |  0
>  docs/system/{ =3D> devices}/net.rst         |  0
>  docs/system/{ =3D> devices}/nvme.rst        |  0
>  docs/system/{ =3D> devices}/usb.rst         |  0
>  docs/system/{ =3D> devices}/virtio-pmem.rst |  0
>  docs/system/index.rst                     |  6 +-
>  7 files changed, 79 insertions(+), 5 deletions(-)
>  create mode 100644 docs/system/device-emulation.rst
>  rename docs/system/{ =3D> devices}/ivshmem.rst (100%)
>  rename docs/system/{ =3D> devices}/net.rst (100%)
>  rename docs/system/{ =3D> devices}/nvme.rst (100%)
>  rename docs/system/{ =3D> devices}/usb.rst (100%)
>  rename docs/system/{ =3D> devices}/virtio-pmem.rst (100%)
>
> diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulat=
ion.rst
> new file mode 100644
> index 0000000000..3156eeac2d
> --- /dev/null
> +++ b/docs/system/device-emulation.rst
> @@ -0,0 +1,78 @@
> +.. _device-emulation:
> +
> +Device Emulation
> +----------------
> +
> +QEMU supports the emulation of a large number of devices from
> +peripherals such network cards and USB devices to integrated systems
> +on a chip (SoCs). Configuration of these is often a source of
> +confusion so it helps to have an understanding of some of the terms
> +used to describes devices within QEMU.
> +
> +Common Terms
> +~~~~~~~~~~~~
> +
> +Device Front End
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A device front end is how a device is presented to the guest. The type
> +of device presented should match the hardware that the guest operating
> +system is expecting to see. All devices can be specified with the
> +``--device`` command line option. Running QEMU with the command line
> +options ``--device help`` will list all devices it is aware of. Using
> +the command line ``--device foo,help`` will list the additional
> +configuration options available for that device.
> +
> +A front end is often paired with a back end, which describes how the
> +host's resources are used in the emulation.
> +
> +Device Buses
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +All devices exist on a BUS. Depending on the machine model you choose

This isn't true anymore; there are bus-less devices.  To show the
user-pluggable ones, try

    $ qemu-system-FOO -device help | grep -v '", bus'

> +(``-M foo``) a number of buses will have been automatically created.
> +In most cases the BUS a device is attached to can be inferred, for
> +example PCI devices are generally automatically allocated to the next
> +free slot of the PCI bus. However in complicated configurations you

"The PCI bus" tacitly assumes there's just one.

We actually pick the first bus (in qtree pre-order) that can take
another device.  Best not to rely on the search order; if you care which
bus to plug into, specify it with bus=3DID.

"Next free slot" is about the device address on the bus.  Should we
explain the concept "device address on a bus"?

> +can explicitly specify what bus a device is attached to and its
> +address. Some devices, for example a PCI SCSI host controller, will
> +add an additional bus to the system that other devices can be attached

A device can add more than one bus.

> +to.
> +
> +Device Back End
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The back end describes how the data from the emulated device will be
> +processed by QEMU. The configuration of the back end is usually
> +specific to the class of device being emulated. For example serial
> +devices will be backed by a ``--chardev`` which can redirect the data
> +to a file or socket or some other system. Storage devices are handled
> +by ``--blockdev`` which will specify how blocks are handled, for
> +example being stored in a qcow2 file or accessing a raw host disk
> +partition. Back ends can sometimes be stacked to implement features
> +like snapshots.
> +
> +While the choice of back end is generally transparent to the guest

Comma, I think.

> +there are cases where features will not be reported to the guest if
> +the back end is unable to support it.
> +
> +Device Pass Through
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Device pass through is where the device is actually given access to
> +the underlying hardware. This can be as simple as exposing a single
> +USB device on the host system to the guest or dedicating a video card
> +in a PCI slot to the exclusive use of the guest.

Thanks for writing this up!

> +
> +
> +Emulated Devices
> +~~~~~~~~~~~~~~~~
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   devices/ivshmem.rst
> +   devices/net.rst
> +   devices/nvme.rst
> +   devices/usb.rst
> +   devices/virtio-pmem.rst
> diff --git a/docs/system/ivshmem.rst b/docs/system/devices/ivshmem.rst
> similarity index 100%
> rename from docs/system/ivshmem.rst
> rename to docs/system/devices/ivshmem.rst
> diff --git a/docs/system/net.rst b/docs/system/devices/net.rst
> similarity index 100%
> rename from docs/system/net.rst
> rename to docs/system/devices/net.rst
> diff --git a/docs/system/nvme.rst b/docs/system/devices/nvme.rst
> similarity index 100%
> rename from docs/system/nvme.rst
> rename to docs/system/devices/nvme.rst
> diff --git a/docs/system/usb.rst b/docs/system/devices/usb.rst
> similarity index 100%
> rename from docs/system/usb.rst
> rename to docs/system/devices/usb.rst
> diff --git a/docs/system/virtio-pmem.rst b/docs/system/devices/virtio-pme=
m.rst
> similarity index 100%
> rename from docs/system/virtio-pmem.rst
> rename to docs/system/devices/virtio-pmem.rst
> diff --git a/docs/system/index.rst b/docs/system/index.rst
> index 6092eb2d91..641d243ba4 100644
> --- a/docs/system/index.rst
> +++ b/docs/system/index.rst
> @@ -16,15 +16,12 @@ Contents:
> =20
>     quickstart
>     invocation
> +   device-emulation
>     keys
>     mux-chardev
>     monitor
>     images
> -   net
>     virtio-net-failover
> -   usb
> -   nvme
> -   ivshmem
>     linuxboot
>     generic-loader
>     guest-loader
> @@ -35,7 +32,6 @@ Contents:
>     gdb
>     managed-startup
>     cpu-hotplug
> -   virtio-pmem
>     pr-manager
>     targets
>     security


