Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DF53D0FAE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:39:58 +0200 (CEST)
Received: from localhost ([::1]:50792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6CS5-0002lV-45
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6CEY-0004mp-5x
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:25:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6CET-0005N5-4p
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626873951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fScKk2VzwITov3/lrmkexmBA5BDAz42+XSMTxjYn/rE=;
 b=PaXBO3fgIMzdfG5U28JszHHN1FMPzFLrpjPdMb4HJnNriEwWIaMTWufDgQeNngclGCQ8pt
 7A3dDgJqV2wFst+kjtH05w9Oq4ilHyv8fgq6bSs7FfrFIGWvjKwf8tIGppSVEfzz/NXZXb
 1LgAKt9AT3DKq04mEA6/JiwJ1Xv0mO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-P4nc6qpONCinNcL0ZCRQ7g-1; Wed, 21 Jul 2021 09:25:50 -0400
X-MC-Unique: P4nc6qpONCinNcL0ZCRQ7g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 047171935780;
 Wed, 21 Jul 2021 13:25:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DD085D6D1;
 Wed, 21 Jul 2021 13:25:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 896C911326B9; Wed, 21 Jul 2021 15:25:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 02/29] docs: collect the disparate device emulation
 docs into one section
References: <20210720232703.10650-1-alex.bennee@linaro.org>
 <20210720232703.10650-3-alex.bennee@linaro.org>
Date: Wed, 21 Jul 2021 15:25:41 +0200
In-Reply-To: <20210720232703.10650-3-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Wed, 21 Jul 2021 00:26:36 +0100")
Message-ID: <87bl6vbxyi.fsf@dusky.pond.sub.org>
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
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: fam@euphon.net, berrange@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> While we are at it add a brief preamble that explains some of the
> common concepts in QEMU's device emulation which will hopefully lead
> to less confusing about our dizzying command line options.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20210714182056.25888-3-alex.bennee@linaro.org>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
>
> ---
> v2
>   - be a bit more precise about necessity of a buses
>   - add an example showing id/bus relations
> ---
>  docs/system/device-emulation.rst          | 89 +++++++++++++++++++++++
>  docs/system/{ =3D> devices}/ivshmem.rst     |  0
>  docs/system/{ =3D> devices}/net.rst         |  0
>  docs/system/{ =3D> devices}/nvme.rst        |  0
>  docs/system/{ =3D> devices}/usb.rst         |  0
>  docs/system/{ =3D> devices}/virtio-pmem.rst |  0
>  docs/system/index.rst                     |  6 +-
>  7 files changed, 90 insertions(+), 5 deletions(-)
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
> index 0000000000..7af5dbefab
> --- /dev/null
> +++ b/docs/system/device-emulation.rst
> @@ -0,0 +1,89 @@
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
> +Most devices will exist on a BUS of some sort. Depending on the
> +machine model you choose (``-M foo``) a number of buses will have been
> +automatically created. In most cases the BUS a device is attached to
> +can be inferred, for example PCI devices are generally automatically
> +allocated to the next free address of first PCI bus found. However in
> +complicated configurations you can explicitly specify what bus
> +(``bus=3DID``) a device is attached to along with its address
> +(``addr=3DN``).
> +
> +Some devices, for example a PCI SCSI host controller, will add an
> +additional buses to the system that other devices can be attached to.
> +A hypothetical chain of devices might look like:
> +
> +  --device foo,bus=3Dpci.0,addr=3D0,id=3Dfoo
> +  --device bar,bus=3Dfoo.0,addr=3D1,id=3Dbaz

PCI bus address 0 is the PCI bridge.  Suggest to omit addr=3D0, or to use
another, non-special PCI address.  You might like addr=3D02.0 to hint at
the fact that the syntax of bus addresses depends on the bus.

> +
> +which would be a bar device (with the ID of baz) which is attached to
> +the first foo bus (foo.0) at address 1. The foo device which provides
> +that bus is itself is attached to the first PCI bus (pci.0).
> +
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

[...]

Nothing serious, so
Reviewed-by: Markus Armbruster <armbru@redhat.com>


