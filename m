Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 483912AF15D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:59:37 +0100 (CET)
Received: from localhost ([::1]:57010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcpiq-0001gr-Ac
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kcpgF-0008T5-Er
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:56:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kcpgC-0005Ec-1d
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605099410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nyrNJOLtkmUG8ODTmp5hGRNVM3oTS25D8LDQmpX7SwE=;
 b=T0ZCZIL8fLh5rZIJCMxr7RWlvcVvdy2d6kfyn5hZDkPQhl+ZGfWgofJQ5BaEkH4UphyVgM
 L4FwkhwNFw6S0XF3giioErixBOBOPoizqojP6nQfKFS7Z982n6YIYrCPIQuCVbGvBQmh60
 zo1Lmx173QarOmBycbqkkyshOa5+bcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-EpQfsyBoNZqv4X9JpkYGIw-1; Wed, 11 Nov 2020 07:56:48 -0500
X-MC-Unique: EpQfsyBoNZqv4X9JpkYGIw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 904448018AB;
 Wed, 11 Nov 2020 12:56:46 +0000 (UTC)
Received: from work-vm (ovpn-113-88.ams2.redhat.com [10.36.113.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2211E5B4D6;
 Wed, 11 Nov 2020 12:56:28 +0000 (UTC)
Date: Wed, 11 Nov 2020 12:56:26 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201111125626.GC3232@work-vm>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201110095349.GA1082456@stefanha-x1.localdomain>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
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
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>, "Zeng,
 Xin" <xin.zeng@intel.com>, qemu-devel@nongnu.org,
 Yan Zhao <yan.y.zhao@intel.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> v3:
>  * Introduce migration info JSON to describe migration parameters
>  * Rework mdev sysfs interface
>  * Propose standard interface for vfio-user device emulation programs
> 
> VFIO Migration
> ==============
> This document describes how to ensure migration compatibility for VFIO devices,
> including mdev and vfio-user devices.
> 
> Overview
> --------
> VFIO devices can save and load a *device state*. Saving a device state produces
> a snapshot of a VFIO device that can be loaded again at a later point in time
> to resume the device from the snapshot.
> 
> The process of saving a device state and loading it later is called
> *migration*. The device state may be loaded by the same device instance that
> saved it or by a new instance, possibly running on a different machine.
> 
> A VFIO/mdev driver together with the physical device provides the functionality
> of a device. Alternatively, a vfio-user device emulation program can provide
> the functionality of a device. These are called *device implementations*.
> 
> The device implementation where a migration originates is called the *source*
> and the device implementation that a migration targets is called the
> *destination*.
> 
> Although it is possible to migrate device state without regard to migration
> compatibility, this is prone to failure except in trivial cases. Device
> implementations vary in feature availability and resource capacity so that it
> is difficult to be confident that a migration of a complex device will succeed.
> Furthermore, without migration compatibility checking it is possible that
> migration appears to succeed but leaves the device in an inoperable state,
> leading to data loss or corruption.
> 
> This document describes how to establish migration compatibility between the
> source and destination. A check can be performed before migrating and can
> therefore be used to select a suitable migration destination. When
> compatibility has been established, the probability of migrating successfully
> is high and a successful migration does not leave the device inoperable due to
> silent migration problems.
> 
> Migration Parameters
> --------------------
> *Migration parameters* are used to describe characteristics that must match
> between source and destination to achieve migration compatibility.
> 
> The first implementation of a simple device may not require migration
> parameters if the source and destination are always compatible. As the device
> evolves, the source and destination may differ and migration parameters are
> required to express these differences. More complex devices may require
> migration parameters from the start due to optional functionality that is not
> guaranteed to be present in both source and destination.
> 
> A migration parameter consists of a name and a value. The name is a UTF-8
> string that does not contain equals ('='), backslash ('/'), or whitespace
> characters. The value is a UTF-8 string that does not contain newline
> characters ('\n').
> 
> The meaning of the migration parameter and its possible values are specific to
> the device, but values are based on one of the following types:
> * bool - booleans (on/off)
> * int - integers (0, 1, 2, ...)
> * str - character strings
> 
> Migration parameters are represented as <name>=<value> in this document.
> Examples include my-feature=on and num-queues=4.
> 
> When a new migration parameter is introduced, its absence must have the same
> effect as before the migration parameter was introduced. For example, if
> my-feature=on|off is added to control the availability of a new device feature,
> then my-feature=off is equivalent to omitting the migration parameter.
> 
> Hardware Interface Compatibility
> --------------------------------
> VFIO devices have a *hardware interface* consisting of device regions and
> interrupts. Aspects of the hardware interface can vary between device
> implementations and require migration parameters to express migration
> compatibility requirements.
> 
> Examples of migration parameters include:
> * Feature availability - feature bitmasks, hardware revision numbers, etc. If
>   the destination may lack support for optional features or hardware interface
>   revisions, then migration parameters are required.
> * Functionality - hardware register blocks that are only present on certain
>   device instances. If there are multiple devices sub-models that have
>   different hardware interfaces then migration parameters are required.
> * Resource capacity - size of display framebuffers, number of queues, queue
>   size, etc.
> 
> These examples demonstrate aspects of the hardware interface that must not
> change unexpectedly. Were they to differ between source and destination, the
> chance of device driver malfunction would be high because the layout of the
> hardware interface would change or assumptions the device driver makes about
> available functionality would be violated. Migration parameters are used to
> preserve the hardware interface across migration and explicitly represent
> variations between device implementations.
> 
> Hardware interfaces sometimes support reporting an event when a change occurs.
> In those cases it may be possible to support visible changes in the hardware
> interface across migration. In most other cases migration must not result in a
> visible change in the hardware interface.
> 
> Migration parameters are not necessary for read-only values exposed through the
> hardware interface, such as MAC address EEPROMs or serial numbers, so long as
> all device implementations can be configured with the same range of input
> values for these read-only values. This is possible because migration
> parameters do not capture the full configuration of the device, only aspects
> that affect migration compatibility.
> 
> Device configuration that is not visible through the hardware interface, such
> as a host file system path of a disk image file or the physical network port
> assigned to a network card, usually does not require migration parameters
> because they can be changed without breaking migration compatibility.
> 
> The disk image file may indirectly affect the hardware interface, for example
> by constraining the device's block size to a specific value. In this case a
> block-size=N migration parameter is required to ensure migration compatibility,
> but the host file system path of the disk image file still does not require a
> migration parameter.
> 
> Device State Representation
> ---------------------------
> Device state contains both data accessible through the device's hardware
> interface and device-internal state needed to restore device operation.
> 
> The contents of hardware registers are usually included in the device state if
> they can change at runtime. Hardware registers with constant or computed data
> may not need to be part of the device state provided that device
> implementations can produce the necessary data.
> 
> Device-internal state includes the portion of the device's state that cannot be
> reconstructed from the hardware interface alone. Defining device-internal state
> in the most general way instead of exposing device implementation details
> allows for flexibility in the future. For example, device implementations often
> maintain a ring index, which is not available through the hardware interface,
> to keep track of which ring elements have already been consumed. The ring index
> must be included in the device state so that the destination can resume
> processing from the correct point in the ring. Representing this as an index
> into the ring in the hardware interface is more general than adding device
> implementation-specific request tracking data structures into the device state.
> 
> The *device state representation* defines the binary data layout of the device
> state. The device state representation is specific to each device and is beyond
> the scope of this document, but aspects pertaining to migration compatibility
> are discussed here.
> 
> Each change to the device state representation that affects migration
> compatibility requires a migration parameter. When a new field is added to the
> device state representation then a new migration parameter must be added to
> reflect this change. Often a single migration parameter expresses both a change
> to the hardware interface and the device state representation. It is also
> possible to change the device state representation without changing the
> hardware interface, for example when some state was forgotten while designing
> the previous device state representation.
> 
> The device state representation may support adding extra data that can be
> safely ignored by old device implementations. In this case migration
> compatibility is unaffected and a migration parameter is not required to
> indicate such extra data has been added.
> 
> Device Models
> -------------
> The combination of the hardware interface, device state representation, and
> migration parameter definitions is called a *device model*. Device models are
> identified by a unique UTF-8 string starting with a domain name and followed by
> path components separated with backslashes ('/'). Examples include
> vendor-a.com/my-nic, gitlab.com/user/my-device, virtio-spec.org/pci/virtio-net,
> and qemu.org/pci/10ec/8139.
> 
> The unique device model string is not changed as the device evolves. Instead,
> migration parameters are added to express variations in a device.
> 
> The device model is not tied to a specific device implementation. The same
> device model could be implemented as a VFIO/dev driver or as a vfio-user device
> emulation program.
> 
> Multiple device implementations can support the same device model. Doing so
> means that the device implementations can offer migration compatiblity because
> they support the same hardware interface, device state representation, and
> migration parameters.
> 
> Multiple device models can exist for the same hardware interface, each with a
> different device state representation and migration parameters. This makes it
> possible to fork and independently develop device models.
> 
> Orchestrating Migrations
> ------------------------
> In order to migrate a device a *migration parameter list* must first be built
> on the source. Each migration parameter is added to the list if it is in
> effect. For example, the migration parameter list for a device with
> new-feature=off,num-queues=4 would be num-queues=4 if the new-feature migration
> parameter was introduced with the off value disabling its effect.

What component builds that list (i.e. what component needs to know the
history that new-feature=off was the default - ah I think you answer
that below).

> The following conditions must be met to establish migration compatibility:
> 
> 1. The source and destination device model strings match.
> 
> 2. Each migration parameter name from the migration parameter list is supported
>    by the destination. For example, the destination supports the num-queues
>    migration parameter.
> 
> 3. Each migration parameter value from the migration parameter list is
>    supported by the destination. For example, the destination supports
>    num-queues=4.

Hmm, are combinations of parameter checks needed - i.e. is it possible
that a destination supports    num-queues=4 and  new-feature=on/off -
but only supports new-feature=on when num-queues>2 ?

> The migration compatibility check can be performed without initiating a
> migration. Therefore, this process can be used to select the migration
> destination.
> 
> The following steps perform the migration:
> 
> 1. Configure the destination so it is prepared to load the device state,
>    including applying the migration parameter list. This may involve
>    instantiating a new device instance or resetting an existing device instance
>    to a configuration that is compatible with the source.
> 
>    The details of how to do this for VFIO/mdev drivers and vfio-user device
>    backend programs is described below.
> 
> 2. Save the device state on the source and load it on the destination.

Which is true for almost everything, unles sit turned out to have
significant amounts of RAM on board;  do we have a way to deal with that
for vfio/vhost-user - where it needs to be iterative? (Lets just ignore
this for now)

> 3. If migration succeeds then the destination resumes operation and the source
>    must not resume operation. If the migration fails then the source resumes
>    operation and the destination must not resume operation.
> 
> Note that these steps impose a conservative bound on device states that can be
> migrated successfully. Not all configuration parameters may be strictly
> required to match on the source and destination devices. For example, if the
> device's hardware interface has not yet been initialized then changes to the
> advertised features may not yet affect the device driver. However, accurately
> representing runtime constraints is complex and risks introducing migration
> bugs, so no attempt is made to support them.
> 
> Migration Information JSON
> --------------------------
> Device implementations describe supported device models in the following JSON
> format:
> 
> .. code:: json
> 
>   {
>     "models": {
>       "<model>": {
>         "params": {
>           "<param>": {
>             "allowed_values": [<value1>, <value2>, ...]
>             "description": ...
>             "init_value": ...
>             "off_value": ...
>             "type": ...
>           }
>         }
>       }
>     }
>   }
> 
> The "models" object contains one or more device model objects describing
> available device models. Each member name is a unique device model string, for
> example "vendor-a.com/my-nic".
> 
> The device model object contains a "params" object describes available
> migration parameters. Each migration parameter object contains the following
> members:
> 
> "allowed_values"
>   The list all values that the device implementation accepts for this migration
>   parameter. Integer ranges can be described using "<min>-<max>" strings.
> 
>   Examples: ['a', 'b', 'c'], [1, 5, 7], ['0-255', 512, '1024-2048'], [true]
> 
>   This member is optional. When absent, any value suitable for the type may be
>   given but the device implementation may refuse certain values.

JSON isn't a great choice for specifying ranges of integers

> "description"
>   A human-readable description of the migration parameter. This is not intended
>   for user interfaces but rather as a troubleshooting aid for developers. The
>   description is typically written in English. This member is optional.

> "init_value"
>   The initial parameter value when a device instance is created. This member is
>   required.
> 
> "off_value"
>   The parameter value that disables the effect of this parameter. This member
>   is absent if the migration parameter cannot be disabled.
> 
> "type"
>   The data type ("bool", "int", "str"). This member is required.
> 
> An example of a simple device model that only one feature and a fixed resource
> capacity:
> 
> .. code:: json
> 
>   {
>     "models": {
>       "vendor-a.com/my-nic": {
>         "params": {
>           "new-feature": {
>             "description": "New feature that old devices lack",
>             "init_value": true,
>             "off_value": false,
>             "type": 'bool'
>           },
>           "num-resources": {
>             "allowed_values": [64],
>             "description": "Number of resources",
>             "init_value": 64,
>             "type": 'int'
>           }
>         }
>       }
>     }
>   }
> 
> Newly created instances of this device will enable "new-feature", but it can be
> disabled for migration compatibility with old device instances.
> 
> The number of device resources are fixed at 64, so only device instances that
> also have exactly 64 resources can be migrated to this device implementation.
> 
> VFIO mdev Drivers
> -----------------
> The following mdev type sysfs attrs are available for managing device
> instances::
> 
>   /sys/.../<parent-device>/mdev_supported_types/<type-id>/
>     create - writing a UUID to this file instantiates a device
>     migration_info.json - read-only migration information JSON
> 
> TODO The JSON can be represented as a file system hierarchy but sysfs seems
> limited to <kobject>/<group>/<attr> and <kobject>/<attr> so it is not possible
> to express deeper attr groups like <kobject>/migration/params/<param>/<attr>?
> 
> Device models supported by an mdev driver and their details can be read from
> the migration_info.json attr. Each mdev type supports one device model. If a
> parent device supports multiple device models then each device model has an
> mdev type. There may be multiple mdev types for a single device model when they
> offer different migration parameters such as resource capacity or feature
> availability.
> 
> For example, a graphics card that supports 4 GB and 8 GB device instances would
> provide gfx-4GB and gfx-8GB mdev types with memory=4096 and memory=8192
> migration parameters, respectively.
> 
> The following mdev device sysfs attrs relate to a specific device instance::
> 
>   /sys/.../<parent-device>/<uuid>/
>     mdev_type/ - symlink to mdev type sysfs attrs, e.g. to fetch migration/model
>     migration/ - migration related files
>       <param> - read/write migration parameter "param"
>       ...
> 
> When the device is created all migration/<param> attrs take their
> migration_info.json "init_value".
> 
> When preparing for migration on the source, each migration parameter from
> migration/<param> is read and added to the migration parameter list if its
> value differs from "off_value" in migration_info.json. If a migration parameter
> in the list is not available on the destination, then migration is not
> possible. If a migration parameter value is not in the destination
> "allowed_values" migration_info.json then migration is not possible.
> 
> In order to prepare an mdev device instance for an incoming migration on the
> destination, the "off_value" from migration_info.json is written to each
> migration parameter in migration/<param>. Then the migration parameter list
> from the source is written to migration/<param> one migration parameter at a
> time. If an error occurs while writing a migration parameter on the destination
> then migration is not possible. Once the migration parameter list has been
> written the mdev can be opened and migration can proceed.
> 
> An open mdev device typically does not allow migration parameters to be changed
> at runtime. However, certain migration/params attrs may allow writes at
> runtime. Usually these migration parameters only affect the device state
> representation and not the hardware interface. This makes it possible to
> upgrade or downgrade the device state representation at runtime so that
> migration is possible to newer or older device implementations.
> 
> vfio-user Device Emulation Programs
> -----------------------------------
> Device emulation programs often support a simple invocation model where running
> the program creates a single device instance. The lifecycle of the device
> instance is tied to the lifecycle of the process. Such device emulation
> programs are described below.
> 
> More complex device emulation programs may host multiple devices. The interface
> for configuring these device emulation programs is not standardized. Therefore,
> migrating these devices is beyond the scope of this document.
> 
> The migration information JSON is printed to standard output by a vfio-user
> device emulation program as follows:
> 
> .. code:: bash
> 
>   $ my-device --print-migration-info-json
> 
> The device is instantiated by launching the destination process with the
> migration parameter list from the source:
> 
> .. code:: bash
> 
>   $ my-device --m-<param1>=<value1> --m-<param2> <value2> [...]
> 
> This example shows how to instantiate the device with migration parameters
> ``param1`` and ``param2``. Both ``--m-<param>=<value>`` and ``--m-<param>
> <value>`` option formats are accepted.
> 
> The ``--m-`` prefix is used to allow the device emulation program to implement
> device implementation-specific command-line options without conflicting with
> the migration parameter namespace.

That feels like an odd syntax to me.

> When preparing for migration on the source, each migration parameter from the
> migration info JSON is added to the migration parameter list if its value
> differs from "off_value". If a migration parameter in the list is not available
> on the destination, then migration is not possible. If a migration parameter
> value is not in the destination "allowed_values" migration_info.json then
> migration is not possible.
> 
> On the destination, a command-line is generated from the migration parameter
> list. For each destination migration parameter missing from the migration
> parameter list a command-line option is added with the destination "off_value".
> The device emulation program prints an error message to standard error and
> terminates with exit status 1 if the device could not be instantiated.

I still don't think this revision answers the question of how a VM
management program picks a sane set of parameter values for a new VM
it's creating, especially if it wants it to be migratable.  That's
something your version stuff in V1 seemed nice for.

Dave


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


