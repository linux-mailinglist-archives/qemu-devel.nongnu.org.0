Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0CA2A4986
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 16:26:39 +0100 (CET)
Received: from localhost ([::1]:47144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZyCk-0007RJ-Ke
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 10:26:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1kZyAM-0004AO-6P
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 10:24:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1kZyAJ-0006CV-5j
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 10:24:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604417045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XMFzAw9PI5cS7lsjrouVwUy85w2KS7XlXiw0x7YYIPs=;
 b=QLYf9Yc9pniGg3g7No87DZ0mEqEyWkoyU3jAHz+JVM7Rq29SEYTw8GzweYOVPKvYoB5PRK
 pVqGvzIlvhYvQIdMw/xqseEdBeVna0V/yv1FMwNabom0IUXfC8Go1/VZDeqRDGTCGrWv6b
 1N9NXma4p68SH3F+sSUVkT7FyLxHsJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-vXGFcvE0M9iUOcOXV8d28Q-1; Tue, 03 Nov 2020 10:23:58 -0500
X-MC-Unique: vXGFcvE0M9iUOcOXV8d28Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA78B6414C;
 Tue,  3 Nov 2020 15:23:55 +0000 (UTC)
Received: from titinator (ovpn-115-51.ams2.redhat.com [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 632C45B4D4;
 Tue,  3 Nov 2020 15:23:45 +0000 (UTC)
References: <20201102111153.GC42093@stefanha-x1.localdomain>
User-agent: mu4e 1.5.2; emacs 27.1
From: Christophe de Dinechin <dinechin@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: VFIO Migration
In-reply-to: <20201102111153.GC42093@stefanha-x1.localdomain>
Date: Tue, 03 Nov 2020 16:23:43 +0100
Message-ID: <ly5z6m79c0.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dinechin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dinechin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, mtsirkin@redhat.com,
 =?utf-8?Q?Daniel_P=2E?= =?utf-8?Q?_Berrang=C3=A9?= <berrange@redhat.com>,
 quintela@redhat.com, qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Felipe Franciosi <felipe@nutanix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020-11-02 at 12:11 CET, Stefan Hajnoczi wrote...
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
>
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

Like others, I think we should either

a) Give a relatively strong requirement regarding what is at the URL in
question, e.g. docs, maybe even a machine-readable schema describing
configuration and state for the device. Leaving the option "there can be
nothing here" is IMO asking for trouble.

b) simply call that a unique ID, and then either drop the https: entirely or
use something else, like pci:// or, to be more specific, vfio://

I'd favor option (b) for a different practical reason. URLs are subject to
redirection and other mishaps. For example, using https:// begs the question
whether
https://qemu.org/devices/e1000e and
https://www.qemu.org/devices/e1000e
should be treated as the same device. I believe that your intent is that
they shouldn't, but if the qemu web server redirects to www, and someone
wants to copy-paste their web browser's URL bar to the command line, they'd
get the wrong one.


>
> Multiple implementations of a device model may exist. They are they are

dup "they are"

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

I find "device configuration" to be a bit confusing and ambiguous here.
From the discussion, it appears that you are not talking about the active
meaning of "configuration", as in "configuring" the device after migration,
but talking about a passive meaning of "this device exists in multiple
variant, which one am I talking about".

I've scratched my head looking for a less ambiguous wording, but could not
find any.

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

If that's intended for a static decision, are you thinking about making it
part of the URI?

Something like vfio://qemu.org/devices/e1000e?version=2


>
> Note that not all parameters used to instantiate a device need to be part of
> the device configuration. For example, assigning a network card to a specific
> physical port is not part of the device configuration since it is not part of
> the device's hardware interface or the device state representation.

I'd replace "since" with "when". There are cases where all ports are not
equivalent. Or maybe you are saying that this is covered by other more
relevant parts of the configuration like link speed?

What about the topology used to access the card? Would you want to be able
to refer to things like IOMMU groups, etc?


> The device state can be loaded and run on a different physical port
> without affecting the operation of the device. Therefore the physical port
> is not part of the device configuration.

I would prefer if we could offer a mechanism here, rather than a policy, and
let the upper layers in the stack be able to specify the policy.

Imagine for example that you have allocated ports between internal and
external networks? The upper stack would probably want to migrate an
"internal network" vfio to another "internal network" port, no?


>
> However, secondary aspects related to the physical port may affect the device's
> hardware interface and need to be reflected in the device configuration. The
> link speed may depend on the physical port and be reported through the device's
> hardware interface. In that case a ``link-speed`` configuration parameter is
> required to prevent unexpected changes to the link speed after migration.

Again, I think that we should provide mechanism rather than policy here.

Imagine someone who wants to migrate _precisely_ to get a different link
speed. Would we want to preclude that if nothing else was blocking the
migration?

The way I see it, it is not entirely clear that the validation of whether
the migration is OK or not should occur entirely within qemu. It might be
good to make room in the spec for some external validation, which could be
implemented in practice through some optional plug-in. It does not need to
be done in the first iteration, but I think the spec should be ready for it.


>
> Note that the device configuration is a conservative bound on device
> states that can be migrated successfully since not all configuration
> parameters may be strictly required to match on the source and
> destination devices. For example, if the device's hardware interface has
> not yet been initialized then changes to the link speed may not be
> noticed. However, accurately representing runtime constraints is complex
> and risks introducing migration bugs, so no attempt is made to support
> them to achieve more relaxed bounds on successful migrations.

That makes me wonder if the distinction between configuration, version and
state is really tight.

Consider a vGPU for example. It looks to me like the "shape" of the target
vGPU would be part of "configuration" at first sight. But then, it might be
instead a "state" request, "this is what I need", that could cause the
target to reconfigure the vGPUs to match the description.

Notice that such a reconfiguration might be impossible. So this is still a
migration validation, but it's a bit more dynamic.

Similarly, if we get to network cards and "upper stacks", you could consider
the MAC address as part of the state or configuration, depending on the
scenario. You could either want to "transport" the MAC address, or to
have the upper stack follow some rules on which one to pick for the target.
My understanding is that IPv6 DAD for example somewhat relies on the MAC
address, and that this makes things complicated for OpenShift. Ask Stefano
Brivio about that, he understands the problem much better than I do.

The bottom line is that IMO the line between configuration and state may be
a bit fuzzy, even for a single device model, depending on the use case.

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

To me, this corresponds to default settings, see below.

If two devices have different versions, do you allow migration?

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

I see a problem with this. Imagine a new card has new parameter foo.
Now, you once had a VM on this card that had foo=42. So it has
foo-enabled=true and foo=42. Then you migrate there something that does not
know about foo. Most likely, that would not even touch foo-enabled.

So I think that you need to add that the migration starts with a "reset
state" where all featured are disabled by default.

If that's the case, then you don't really need the "enabled" flag. You
simply need to state that the reset state is compatible with earlier
versions. If you know about the new feature, you set it. If you don't know,
you have the state of the previous version.

Setting a version could allow you to quickly change the defaults.



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

Instead of "latest", we could have a query that lists the "supported"
configurations. Again, vGPUs are a good example where this would be
useful. A same card can be partitioned in a number of ways, and you can't
really claim that "M10-2B" or "M10-0Q" is "latest".

You could arguably assign a unique URI to each sub-model. Maybe that's how
you were envisioning things?

--
Cheers,
Christophe de Dinechin (IRC c3d)


