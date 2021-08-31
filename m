Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9343FCC64
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 19:34:24 +0200 (CEST)
Received: from localhost ([::1]:48626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL7eH-0004ip-SP
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 13:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mL7WP-0003ao-VX
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:26:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mL7WM-0000hC-NK
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:26:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630430761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=hJgJULZ4V4JFvCf8hCvPghFKebN8NCaNjKxKYYKqMWg=;
 b=Putjp5QoplNtnJ75dHwj7gszKcYqeuG11VrP01mH1qnxesA3Wsudlv5wdY0xH1chxK1GPL
 awpmIomJ/CEoLrPnpenVOyPGP7eobPkwTGYTGRDkzwvHldQDq0uUYcAe3x9X/RET45jO8t
 f9l3r11vRqytJ/yK1pFdG0AHpUo0pRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-R89Ybu0DPMiWF6JqQL5CeQ-1; Tue, 31 Aug 2021 13:25:55 -0400
X-MC-Unique: R89Ybu0DPMiWF6JqQL5CeQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E2AF8799E0;
 Tue, 31 Aug 2021 17:25:54 +0000 (UTC)
Received: from localhost (unknown [10.39.194.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 745795D6D5;
 Tue, 31 Aug 2021 17:25:42 +0000 (UTC)
Date: Tue, 31 Aug 2021 18:25:41 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4] VFIO Migration
Message-ID: <YS5mFbe62iH+80GI@stefanha-x1.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kNj25fjQ16fs1wib"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, "Zeng, Xin" <xin.zeng@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--kNj25fjQ16fs1wib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

v4:
 * Replaced the complex migration parameter concept with a simpler version
   string as suggested by multiple people. The version string is similar to a
   versioned machine type or CPU model in QEMU. Device creation parameters are
   no longer taken into consideration, but it's likely that allowing devices to
   define a small set of variants (e.g. single-queue virtio-net, 64-queue
   virtio-net) will be sufficient.

v3:
 * Introduce migration info JSON to describe migration parameters
 * Rework mdev sysfs interface
 * Propose standard interface for vfio-user device emulation programs

VFIO Migration
==============
This document describes how to ensure migration compatibility for VFIO devices,
including mdev and vfio-user devices.

Overview
--------
VFIO devices can save and load a *device state*. Saving a device state produces
a snapshot of a VFIO device that can be loaded again at a later point in time
to resume the device from the snapshot.

The process of saving a device state and loading it later is called
*migration*. The device state may be loaded by the same device instance that
saved it or by a new instance, possibly running on a different machine.

A VFIO/mdev driver together with the physical device provides the functionality
of a device. Alternatively, a vfio-user device emulation program can provide
the functionality of a device. These are called *device implementations*.

The device implementation where a migration originates is called the *source*
and the device implementation that a migration targets is called the
*destination*.

Although it is possible to migrate device state without regard to migration
compatibility, this is prone to failure except in trivial cases. Device
implementations vary in feature availability and resource capacity so that it
is difficult to be confident that a migration of a complex device will succeed.
Furthermore, without migration compatibility checking it is possible that
migration appears to succeed but leaves the device in an inoperable state,
leading to data loss or corruption.

This document describes how to establish migration compatibility between the
source and destination. A check can be performed before migrating and can
therefore be used to select a suitable migration destination. When
compatibility has been established, the probability of migrating successfully
is high and a successful migration does not leave the device inoperable due to
silent migration problems.

Hardware Interface Compatibility
--------------------------------
VFIO devices have a *hardware interface* consisting of device regions and
interrupts. The hardware interface can vary between device instances. Examples
include:
* Functionality - hardware register blocks that are only present on certain
  device instances.
* Feature availability - features that are advertised through feature bits,
  device hardware revisions, or similar.
* Resource capacity - size of display framebuffers, number of queues, queue
  size, etc.

These examples demonstrate aspects of the hardware interface that must not
change unexpectedly across migration. Were they to differ between source and
destination, the chance of device driver malfunction would be high because the
layout of the hardware interface would change or assumptions the device driver
makes about available functionality would be violated.

Hardware interfaces sometimes support reporting an event when a change occurs.
In those cases it may be possible to changes in the hardware interface across
migration. In most other cases migration must not result in a visible change in
the hardware interface.

Device State Representation
---------------------------
Device state contains both data accessible through the device's hardware
interface and device-internal state needed to restore device operation.

The *device state representation* defines the binary data layout of the device
state. The device state representation is specific to each device and is beyond
the scope of this document, but aspects pertaining to migration compatibility
are discussed here.

Migration compatibility includes both migrating from old to new software
versions and from new to old software versions.

A device state representation can only be changed in a limited number of ways
without breaking migration compatibility. Some device state representations may
allow the addition of optional new fields that are ignored by old software
versions and therefore do not break compatibility.

Version Strings
---------------
*Version strings* uniquely identify hardware interfaces and device state
representations for the purpose of migration compatibility. Migration is only
possible between two devices that have the same version string.

Simple devices may define a sequence of version strings like "v1", "v2", etc.
Complex devicees that offer several variants need to define parallel sequences
such as "q1-v1", "q1-v2", etc and "q64-v1", "q64-v2", etc for a device that
offers both single-queue and 64-queue variants.

A version string is an ASCII string that does not contain newline characters
('\n').

Device Models
-------------
The combination of the hardware interface, device state representation, and
version strings definitions is called a *device model*. Device models are
identified by a unique ASCII string starting with a domain name and followed by
path components separated with backslashes ('/'). Examples include
vendor-a.com/my-nic, gitlab.com/user/my-device, virtio-spec.org/pci/virtio-net,
and qemu.org/pci/10ec/8139.

The device model string is not changed as the device evolves. Instead, version
strings are added to express new variants of the device.

The device model is not tied to a specific device implementation. The same
device model could be implemented as a VFIO/dev driver or as a vfio-user device
emulation program.

Multiple device implementations can support the same device model. Doing so
means that the device implementations can offer migration compatiblity because
they support the same hardware interface, device state representation, and
version strings.

Multiple device models can exist for the same hardware interface, each with a
different device state representation and version strings. This makes it
possible to fork and independently develop device models.

Orchestrating Migrations
------------------------
The following conditions must be met to establish migration compatibility:

1. The destination supports the source's device model.

2. The destination supports the source's version string.

The migration compatibility check can be performed without initiating a
migration. Therefore, this process can be used to select the migration
destination.

The following steps perform the migration:

1. Configure the destination so it is prepared to load the device state,
   including setting the device model and version string. This may involve
   instantiating a new device instance or resetting an existing device instance
   to a configuration that is compatible with the source.

   The details of how to do this for VFIO/mdev drivers and vfio-user device
   backend programs is described below.

2. Save the device state on the source and load it on the destination.

3. If migration succeeds then the destination resumes operation and the source
   must not resume operation. If the migration fails then the source resumes
   operation and the destination must not resume operation.

VFIO mdev Drivers
-----------------
The following mdev type sysfs attrs are available for managing device
instances::

  /sys/.../<parent-device>/mdev_supported_types/<type-id>/
    create - writing a UUID to this file instantiates a device
    migration_device_models - read-only list of device model and version
                              strings. Format:
                                <model-1>:\n
                                <version-1>\n
                                <version-2>\n
                                ...
                                <model-2>:\n
                                <version-1>\n
                                <version-2>\n

Device models supported by an mdev driver and supported version strings can be
read from the migration_device_models attr. An mdev type may support more than
one device model. Multiple mdev types may support the same device model, for
example, when they offer different resource capacity or feature availability
configurations. Typically the supported version strings will be different
between mdev types.

For example, a graphics card that supports 4 GB and 8 GB device instances would
provide gfx-4GB and gfx-8GB mdev types::

  /sys/.../<parent-device>/mdev_supported_types/
    gfx-4GB/
      create - writing a UUID to this file instantiates a device
      migration_device_models - Contents:
        org.project/graphics-card:
        4GB-v1
        4GB-v2
    gfx-8GB/
      create - writing a UUID to this file instantiates a device
      migration_device_models - Contents:
        org.project/graphics-card:
        8GB-v1
        8GB-v2

The following mdev device sysfs attrs relate to a specific device instance::

  /sys/.../<parent-device>/<uuid>/
    mdev_type/ - symlink to mdev type sysfs attrs, e.g. to fetch migration/model
    migration/ - migration related files
      device_model - read/write device model string
      version - read/write version string

When the device is created migration/device_model and migration/version contain
default values chosen by the driver. They can be set to any value listed in the
migration_device_models attr. Setting the device_model attr resets the version
attr to a default value chosen by the driver.

Changes to the device_model and version attrs may fail once the mdev device has
been opened. The mdev driver may allow changes as long as the hardware
interface of the open device remains compatible. This makes it possible to
upgrade or downgrade to a device model and version with an incompatible device
state representation.

vfio-user Device Emulation Programs
-----------------------------------
Device emulation programs often support a simple invocation model where running
the program creates a single device instance. The lifecycle of the device
instance is tied to the lifecycle of the process. Such device emulation
programs are described below.

More complex device emulation programs may host multiple devices. The interface
for configuring these device emulation programs is not standardized. Therefore,
migrating these devices is beyond the scope of this document.

The migration information JSON is printed to standard output by a vfio-user
device emulation program as follows:

.. code:: bash

  $ my-device --print-migration-info-json
  {
    "models": {
      "<model>": {
        "versions": ["<version>", ...]
      }
    }
  }

The `models` object contains a member for each supported device model. The
`versions` member is a list of all supported version strings.

The device is instantiated by launching the destination process with the
device model and version from the source:

.. code:: bash

  $ my-device --migration-model <model> --migration-version <version> ...

There is no standard interface for changing the device model and version at
runtime.

--kNj25fjQ16fs1wib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEuZhUACgkQnKSrs4Gr
c8iZxAgAhUEF6eSlwtH888gR8JkFa4pDvfNlTRsbGojC+P5Sp0j/oxUScTT7nNDg
n/9s/lLQ3ys1FsW14NNo4v/pm6xKhL1ElgF+1LIANgjDtLoZ5LNENhjQSt2y61jV
rZGo5pvYLMH4T04mi9SEQhP/TLhsmN5XhAMQrmmI4y280fPP8ER+aMo55gp5OBgW
6LSmsMWaT0Y/XIH4HEXaRp1AMdOnjHCoFn9EELz1BWqjg06Pdyrlew79QZXIFkxi
DcxJ5t8GMQsUFJ7L1Rd1n58ogAHUcuekE54nPSQwPbdNcemevCRBmDitEkYJj/XO
U/u1P2P1ji10UVoMN2ZPva9yMu6OEg==
=s9S/
-----END PGP SIGNATURE-----

--kNj25fjQ16fs1wib--


