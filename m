Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C7E2A3458
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 20:39:49 +0100 (CET)
Received: from localhost ([::1]:35490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZfgC-0004eS-7Y
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 14:39:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kZff8-0004Fm-A2
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 14:38:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kZff4-0008Gd-Ni
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 14:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604345916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YngD2E5/Hr9BdF5HvruKe9tB1tTnEbfKb7Gfi9yxQHY=;
 b=LrSCXj/MTE22Ml9rfYxLnsAn39BRcOQ+6pKJIZSB3CVwibTrHhfhpFHtUOF+2fZQw0ygTi
 3VrcXvwp5FuEWwnUfykBikA/KDh0zqPTRPsOe8ZwGUQawkeM8FUDcTLw6PUGTBuW+rYHYM
 G66Nrghf1Rjtn4FD+zB91Q6JnOsOy8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-AExZCY-fMSykicuYNI5Qdg-1; Mon, 02 Nov 2020 14:38:32 -0500
X-MC-Unique: AExZCY-fMSykicuYNI5Qdg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A850879512;
 Mon,  2 Nov 2020 19:38:30 +0000 (UTC)
Received: from w520.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4488621E8F;
 Mon,  2 Nov 2020 19:38:26 +0000 (UTC)
Date: Mon, 2 Nov 2020 12:38:23 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: VFIO Migration
Message-ID: <20201102123823.066d156a@w520.home>
In-Reply-To: <20201102111153.GC42093@stefanha-x1.localdomain>
References: <20201102111153.GC42093@stefanha-x1.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 03:02:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com, "Daniel P.
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, quintela@redhat.com,
 Jason Wang <jasowang@redhat.com>, "Zeng, Xin" <xin.zeng@intel.com>,
 qemu-devel@nongnu.org, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Felipe Franciosi <felipe@nutanix.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cc+ Intel folks as this really bumps into the migration compatibility
discussion[1][2][3]

On Mon, 2 Nov 2020 11:11:53 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> There is discussion about VFIO migration in the "Re: Out-of-Process
> Device Emulation session at KVM Forum 2020" thread. The current status
> is that Kirti proposed a VFIO device region type for saving and loading
> device state. There is currently no guidance on migrating between
> different device versions or device implementations from different
> vendors. This is known to be non-trivial and raised discussion about
> whether it should really be handled by VFIO or centralized in QEMU.
> 
> Below is a document that describes how to ensure migration compatibility
> in VFIO. It does not require changes to the VFIO migration interface. It
> can be used for both VFIO/mdev kernel devices and vfio-user devices.
> 
> The idea is that the device state blob is opaque to the VMM but the same
> level of migration compatibility that exists today is still available.
> 
> I hope this will help us reach consensus and let us discuss specifics.
> 
> If you followed the previous discussion, I changed the approach from
> sending a magic constant in the device state blob to identifying device
> models by URIs. Therefore the device state structure does not need to be
> defined here - the critical information for ensuring device migration
> compatibility is the device model and configuration defined below.
> 
> Stefan
> ---
> VFIO Migration
> ==============
> This document describes how to save and load VFIO device states. Saving a
> device state produces a snapshot of a VFIO device's state that can be loaded
> again at a later point in time to resume the device from the snapshot.
> 
> The data representation of the device state is outside the scope of this
> document.
> 
> Overview
> --------
> The purpose of device states is to save the device at a point in time and then
> restore the device back to the saved state later. This is more challenging than
> it first appears.
> 
> The process of saving a device state and loading it later is called
> *migration*. The state may be loaded by the same device that saved it or by a
> new instance of the device, possibly running on a different computer.
> 
> It must be possible to migrate to a newer implementation of the device
> as well as to an older implementation of the device. This allows users
> to upgrade and roll back their systems.


It must be possible to specify, but we can't necessarily force a vendor
to support it.  It must also be possible to describe incompatibilities,
whether due to lack of support or forks in the migration format.

 
> Migration can fail if loading the device state is not possible. It should fail
> early with a clear error message. It must not appear to complete but leave the
> device inoperable due to a migration problem.
> 
> The rest of this document describes how these requirements can be met.
> 
> Device Models
> -------------
> Devices have a *hardware interface* consisting of hardware registers,
> interrupts, and so on.
> 
> The hardware interface together with the device state representation is called
> a *device model*. Device models can be assigned URIs such as
> https://qemu.org/devices/e1000e to uniquely identify them.
> 
> Multiple implementations of a device model may exist. They are they are
> interchangeable if they follow the same hardware interface and device
> state representation.
> 
> Multiple implementations of the same hardware interface may exist with
> different device state representations, in which case the device models are not
> interchangeable and must be assigned different URIs.
> 
> Migration is only possible when the same device model is supported by the
> *source* and the *destination* devices.
> 
> Device Configuration
> --------------------
> Device models may have parameters that affect the hardware interface or device
> state representation. For example, a network card may have a configurable
> address filtering table size parameter called ``rx-filter-size``. A
> device state saved with ``rx-filter-size=32`` cannot be safely loaded
> into a device with ``rx-filter-size=0``, because changing the size from
> 32 to 0 may disrupt device operation.
> 
> A list of configuration parameters is called the *device configuration*.
> Migration is expected to succeed when the same device model and configuration
> that was used for saving the device state is used again to load it.
> 
> Note that not all parameters used to instantiate a device need to be part of
> the device configuration. For example, assigning a network card to a specific
> physical port is not part of the device configuration since it is not part of
> the device's hardware interface or the device state representation. The device
> state can be loaded and run on a different physical port without affecting the
> operation of the device. Therefore the physical port is not part of the device
> configuration.
> 
> However, secondary aspects related to the physical port may affect the device's
> hardware interface and need to be reflected in the device configuration. The
> link speed may depend on the physical port and be reported through the device's
> hardware interface. In that case a ``link-speed`` configuration parameter is
> required to prevent unexpected changes to the link speed after migration.
> 
> Note that the device configuration is a conservative bound on device
> states that can be migrated successfully since not all configuration
> parameters may be strictly required to match on the source and
> destination devices. For example, if the device's hardware interface has
> not yet been initialized then changes to the link speed may not be
> noticed. However, accurately representing runtime constraints is complex
> and risks introducing migration bugs, so no attempt is made to support
> them to achieve more relaxed bounds on successful migrations.
> 
> Device Versions
> ---------------
> As a device evolves, the number of configuration parameters required may become
> inconvenient for users to express in full. A device configuration can be
> aliased by a *device version*, which is a shorthand for the full device
> configuration. This makes it easy to apply a standard device configuration
> without listing every configuration parameter explicitly.
> 
> For example, if address filtering support was added to a network card then
> device versions and the corresponding configurations may look like this:
> * ``version=1`` - Behaves as if ``rx-filter-size=0``
> * ``version=2`` - ``rx-filter-size=32``
> 
> Device States
> -------------
> The details of the device state representation are not covered in this document
> but the general requirements are discussed here.
> 
> The device state consists of data accessible through the device's hardware
> interface and internal state that is needed to restore device operation.
> State in the hardware interface includes the values of hardware registers.
> An example of internal state is an index value needed to avoid processing
> queued requests more than once.
> 
> Changes can be made to the device state representation as follows. Each change
> to device state must have a corresponding device configuration parameter that
> allows the change to toggled:
> 
> * When the parameter is disabled the hardware interface and device state
>   representation are unchanged. This allows old device states to be loaded.
> 
> * When the parameter is enabled the change comes into effect.
> 
> * The parameter's default value disables the change. Therefore old versions do
>   not have to explicitly specify the parameter.
> 
> The following example illustrates migration from an old device
> implementation to a new one. A version=1 network card is migrated to a
> new device implementation that is also capable of version=2 and adds the
> rx-filter-size=32 parameter. The new device is instantiated with
> version=1, which disables rx-filter-size and is capable of loading the
> version=1 device state. The migration completes successfully but note
> the device is still operating at version=1 level in the new device.
> 
> The following example illustrates migration from a new device
> implementation back to an older one. The new device implementation
> supports version=1 and version=2. The old device implementation supports
> version=1 only. Therefore the device can only be migrated when
> instantiated with version=1 or the equivalent full configuration
> parameters.
> 
> Orchestrating Migrations
> ------------------------
> The following steps must be followed to migrate devices:
> 
> 1. Check that the source and destination devices support the same device model.
> 
> 2. Check that the destination device supports the source device's
>    configuration. Each configuration parameter must be accepted by the
>    destination in order to ensure that it will be possible to load the device
>    state.
> 
> 3. The device state is saved on the source and loaded on the destination.
> 
> 4. If migration succeeds then the destination resumes operation and the source
>    must not resume operation. If the migration fails then the source resumes
>    operation and the destination must not resume operation.
> 
> VFIO Implementation
> -------------------
> The following applies both to kernel VFIO/mdev drivers and vfio-user device
> backends.
> 
> Devices are instantiated based on a version and/or configuration parameters:
> * ``version=1`` - use the device configuration aliased by version 1
> * ``version=2,rx-filter-size=64`` - use version 1 and override ``rx-filter-size``
> * ``rx-filter-size=0`` - directly set configuration parameters without using a version
> 
> Device creation fails if the version and/or configuration parameters are not
> supported.
> 
> There must be a mechanism to query the "latest" configuration for a device
> model. It may simply report the ``version=5`` where 5 is the latest version but
> it could also report all configuration parameters instead of using a version
> alias.

When we talk about "instantiating" a device here, are we referring to
managing the device on the host or within QEMU via something like
vfio_realize()?  We create an instance of an mdev on the host via an
mdev type using operations on the host sysfs.  That mdev type doesn't
really seem to map to your idea if a device model represented by a URI.
How are supported URIs exposed and specified when the device is
instantiated?

Same for device configuration, we might have per device attributes in
host sysfs defining the configuration of a given mdev device, are these
the device configuration values?  It seems like you're referring to
something much more QEMU centric, but vfio-pci in QEMU handles all
devices the same, aside from quirks.

Likewise, I don't know where versions would be exposed in the current
vfio interface.

There's also a desire to support the vfio migration interface on
non-mdev vfio devices.  We don't know yet if those will be separate,
device specific vfio bus drivers or be integrated into existing
vfio-pci, but the host device is likely instantiated by binding to a
driver, so again I don't really understand where you're proposing this
negotiation occurs.  Will management tools be required to create a
device on-demand to fulfill a migration request or can we manipulate an
existing device into that desired.  Some management layers embrace the
idea of device pools rather than dynamic creation.  Thanks,

Alex

[1]https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg04519.html
[2]https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg00293.html
[3]https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg02983.html


