Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274EA4F3B0D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 17:08:42 +0200 (CEST)
Received: from localhost ([::1]:55932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbknR-0005rC-94
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 11:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nbklt-0004ly-MZ
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 11:07:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nbklr-0000py-P6
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 11:07:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649171222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8assEaUoSlFH13bA0niRBcdNedf623RF03nZOOm/4lk=;
 b=N+EG8MVa29YUFoTGNFA0UyC0bfIus0lMjW2wOyH9jZ+Pl/+oBNRQzcbeitjGjMivWVz6Bz
 16EhC1P4wkKkMGzNWNI2FEmrW7lm79deYfMNIyqhaRwT/h87qAkR7i4FMhxQA8/SQ34rn+
 j3b3p+bpVhYZF0xUxd9cmUHNyhcAv9w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-_wfYP4mjOz2LpqUh9cAe3g-1; Tue, 05 Apr 2022 11:06:57 -0400
X-MC-Unique: _wfYP4mjOz2LpqUh9cAe3g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F02E1C1C523;
 Tue,  5 Apr 2022 15:06:55 +0000 (UTC)
Received: from localhost (dhcp-192-213.str.redhat.com [10.33.192.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0EA8215CDD8;
 Tue,  5 Apr 2022 15:06:23 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] docs/devel: start documenting writing VirtIO devices
In-Reply-To: <87a6dp3ixf.fsf@linaro.org>
Organization: Red Hat GmbH
References: <20220309164929.19395-1-alex.bennee@linaro.org>
 <8735jrhue4.fsf@redhat.com> <87a6dp3ixf.fsf@linaro.org>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Tue, 05 Apr 2022 17:06:20 +0200
Message-ID: <87bkxffu37.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 "Dr . David Alan  Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16 2022, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> Cornelia Huck <cohuck@redhat.com> writes:
>
>> On Wed, Mar 09 2022, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

>>> +Writing VirtIO backends for QEMU
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +This document attempts to outline the information a developer needs to
>>> +know to write backends for QEMU. It is specifically focused on
>>> +implementing VirtIO devices.
>>
>> I think you first need to define a bit more clearly what you consider a
>> "backend". For virtio, it is probably "everything a device needs to
>> function as a specific device type like net, block, etc., which may be
>> implemented by different methods" (as you describe further below).
>
> How about:
>
>   This document attempts to outline the information a developer needs to
>   know to write device emulations in QEMU. It is specifically focused on
>   implementing VirtIO devices. For VirtIO the frontend is the driver
>   running on the guest. The backend is the everything that QEMU needs to
>   do to handle the emulation of the VirtIO device. This can be done
>   entirely in QEMU, divided between QEMU and the kernel (vhost) or
>   handled by a separate process which is configured by QEMU
>   (vhost-user).

I'm afraid that confuses me even more :)

This sounds to me like frontend =3D=3D driver (in virtio spec terminology)
and backend =3D=3D device. Is that really what you meant?

>
>>
>>> +
>>> +Front End Transports
>>> +--------------------
>>> +
>>> +VirtIO supports a number of different front end transports. The
>>> +details of the device remain the same but there are differences in
>>> +command line for specifying the device (e.g. -device virtio-foo
>>> +and -device virtio-foo-pci). For example:
>>> +
>>> +.. code:: c
>>> +
>>> +  static const TypeInfo vhost_user_blk_info =3D {
>>> +      .name =3D TYPE_VHOST_USER_BLK,
>>> +      .parent =3D TYPE_VIRTIO_DEVICE,
>>> +      .instance_size =3D sizeof(VHostUserBlk),
>>> +      .instance_init =3D vhost_user_blk_instance_init,
>>> +      .class_init =3D vhost_user_blk_class_init,
>>> +  };
>>> +
>>> +defines ``TYPE_VHOST_USER_BLK`` as a child of the generic
>>> +``TYPE_VIRTIO_DEVICE``.
>>
>> That's not what I'd consider a "front end", though?
>
> Yeah clumsy wording. I'm trying to get find a good example to show how
> QOM can be used to abstract the core device operation and the wrappers
> for different transports. However in the code base there seems to be
> considerable variation about how this is done. Any advice as to the
> best exemplary device to follow is greatly welcomed.

I'm not sure which of the example we can really consider a "good"
device; the normal modus operandi when writing a new device seems to be
"pick the first device you can think of and copy whatever it
does". Personally, I usally look at blk or net, but those carry a lot of
legacy baggage; so maybe a modern virtio-1 only device like gpu? That
one also has the advantage of not being pci-only.

Does anyone else have a good suggestion here?

>
>>> And then for the PCI device it wraps around the
>>> +base device (although explicitly initialising via
>>> +virtio_instance_init_common):
>>> +
>>> +.. code:: c
>>> +
>>> +  struct VHostUserBlkPCI {
>>> +      VirtIOPCIProxy parent_obj;
>>> +      VHostUserBlk vdev;
>>> +  };
>>
>> The VirtIOPCIProxy seems to materialize a bit out of thin air
>> here... maybe the information simply needs to be structured in a
>> different way? Perhaps:
>>
>> - describe that virtio devices consist of a part that implements the
>>   device functionality, which ultimately derives from VirtIODevice (the
>>   "backend"), and a part that exposes a way for the operating system to
>>   discover and use the device (the "frontend", what the virtio spec
>>   calls a "transport")
>> - decribe how the "frontend" part works (maybe mention VirtIOPCIProxy,
>>   VirtIOMMIOProxy, and VirtioCcwDevice as specialized proxy devices for
>>   PCI, MMIO, and CCW devices)
>> - list the different types of "backends" (as you did below), and give
>>   two examples of how VirtIODevice is extended (a plain one, and a
>>   vhost-user one)
>> - explain how frontend and backend together create an actual device
>>   (with the two device examples, and maybe also with the plain one
>>   plugged as both PCI and CCW?); maybe also mention that MMIO is a bit
>>   different? (it always confuses me)
>
> OK I'll see how I can restructure things to make it clearer. Do we also
> have to take into account the object heirarchy for different types of
> device (i.e. block or net)? Or is that all plumbing into QEMUs
> sub-system internals done in the VirtIO device objects?

An example of how a device plugs into a bigger infrastructure like the
block layer might be helpful, but it also might complicate the
documentation (as you probably won't need to do anything like that if
you write a device that does not use any established infrastructure.)
Maybe just gloss over it for now?

>
>>> +
>>> +Back End Implementations
>>> +------------------------
>>> +
>>> +There are a number of places where the implementation of the backend
>>> +can be done:
>>> +
>>> +* in QEMU itself
>>> +* in the host kernel (a.k.a vhost)
>>> +* in a separate process (a.k.a. vhost-user)
>>> +
>>> +where a vhost-user implementation is being done the code in QEMU is
>>> +mainly boilerplate to handle the command line definition and
>>> +connection to the separate process with a socket (using the ``chardev`=
`
>>> +functionality).
>>> +
>>> +Implementing a vhost-user wrapper
>>> +---------------------------------
>>> +
>>> +There are some classes defined that can wrap a lot of the common
>>> +vhost-user code in a ``VhostUserBackend``. For example:
>>
>> Is VhostUserBackend something that is expected to be commonly used? I
>> think gpu and input use it, but not virtiofs (unless I misread the
>> code).
>
> Possibly - but it does seem to be trying to avoid adding lots of
> boilerplate to each individual device to setup and configure the
> vhost-user backend. A problem I ran into when trying to fix the
> squashing of VHOST_USER_PROTOCOL_F_CONFIG messages in
> vhost_user_backend_init.

Yeah. I think a lot of that comes from the "pick a random existing
device as a template" procedure I mentioned above. Maybe we really
should recommend using that common structure in new device
implementations.

>
> <snip>
>>> +  static const TypeInfo vhost_user_gpu_info =3D {
>>> +      .name =3D TYPE_VHOST_USER_GPU,
>>> +      .parent =3D TYPE_VIRTIO_GPU_BASE,
>>> +      .instance_size =3D sizeof(VhostUserGPU),
>>> +      .instance_init =3D vhost_user_gpu_instance_init,
>>> +      .class_init =3D vhost_user_gpu_class_init,
>>> +      ...
>>> +  };
>>> +
>>> +Here the ``TYPE_VHOST_USER_GPU`` is based off a shared base class
>>> +(``TYPE_VIRTIO_GPU_BASE`` which itself is based on
>>> +``TYPE_VIRTIO_DEVICE``). The chardev property is aliased to the
>>> +VhostUserBackend chardev so it can be specified on the command line
>>> +for this device.
>>> +=20
>>
>> I think using a "base" device is something that is device-specific; for
>> gpu, it makes sense as it can be implemented in different ways, but
>> e.g. virtiofs does not have a "plain" implementation, and some device
>> types have only "plain" implementations.
>
> Perhaps the GPU was a bad choice here. Do we have a good example device
> that has both mmio and pci (or ccw) transports as well as QEMU internal
> and vhost/vhost-user implementations?

Ugh. Maybe scsi? It carries a bit of legacy stuff, though.


