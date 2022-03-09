Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150AA4D3873
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 19:09:04 +0100 (CET)
Received: from localhost ([::1]:43826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS0kA-0005EK-Tp
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 13:09:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nS0iu-00049L-BN
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 13:07:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nS0ip-0003Ho-Ko
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 13:07:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646849258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s10ZChWLe7MNuGzg0LUfdbARo0u8TG/OuEfnzDmS57o=;
 b=WmEDFRI3J6842bqtycR0OPCMhpvxe7tpIVkpZnZn/Z6+ADs69bpNm1Jo0NE0PmpATNNWrt
 shGDJikburQmGuUBFJ1b2SDkz5zYFK0IvZqDnBzOGTKi/E9UDEJo0C0GToADn8onIbXf2E
 AMxOHhv5AV2yJUPMYrCqHPa47kHO/+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-YmRc4j-jM5mAJMj100KnrQ-1; Wed, 09 Mar 2022 13:07:34 -0500
X-MC-Unique: YmRc4j-jM5mAJMj100KnrQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF65D1006AA5;
 Wed,  9 Mar 2022 18:07:33 +0000 (UTC)
Received: from localhost (unknown [10.39.193.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4168B841DD;
 Wed,  9 Mar 2022 18:07:33 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH] docs/devel: start documenting writing VirtIO devices
In-Reply-To: <20220309164929.19395-1-alex.bennee@linaro.org>
Organization: Red Hat GmbH
References: <20220309164929.19395-1-alex.bennee@linaro.org>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Wed, 09 Mar 2022 19:07:31 +0100
Message-ID: <8735jrhue4.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 09 2022, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> While writing my own VirtIO devices I've gotten confused with how
> things are structured and what sort of shared infrastructure there is.
> If we can document how everything is supposed to work we can then
> maybe start cleaning up inconsistencies in the code.

I agree that we could use some documentation here; OTOH, I'm a bit
confused in turn by your patch :) Let me comment below.

>
> Based-on: 20220309135355.4149689-1-alex.bennee@linaro.org
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  docs/devel/index-internals.rst |   2 +-
>  docs/devel/virtio-backends.rst | 139 +++++++++++++++++++++++++++++++++
>  2 files changed, 140 insertions(+), 1 deletion(-)
>  create mode 100644 docs/devel/virtio-backends.rst

(...)

> diff --git a/docs/devel/virtio-backends.rst b/docs/devel/virtio-backends.=
rst
> new file mode 100644
> index 0000000000..230538f46b
> --- /dev/null
> +++ b/docs/devel/virtio-backends.rst
> @@ -0,0 +1,139 @@
> +..
> +   Copyright (c) 2022, Linaro Limited
> +   Written by Alex Benn=C3=A9e
> +
> +Writing VirtIO backends for QEMU
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This document attempts to outline the information a developer needs to
> +know to write backends for QEMU. It is specifically focused on
> +implementing VirtIO devices.

I think you first need to define a bit more clearly what you consider a
"backend". For virtio, it is probably "everything a device needs to
function as a specific device type like net, block, etc., which may be
implemented by different methods" (as you describe further below).

> +
> +Front End Transports
> +--------------------
> +
> +VirtIO supports a number of different front end transports. The
> +details of the device remain the same but there are differences in
> +command line for specifying the device (e.g. -device virtio-foo
> +and -device virtio-foo-pci). For example:
> +
> +.. code:: c
> +
> +  static const TypeInfo vhost_user_blk_info =3D {
> +      .name =3D TYPE_VHOST_USER_BLK,
> +      .parent =3D TYPE_VIRTIO_DEVICE,
> +      .instance_size =3D sizeof(VHostUserBlk),
> +      .instance_init =3D vhost_user_blk_instance_init,
> +      .class_init =3D vhost_user_blk_class_init,
> +  };
> +
> +defines ``TYPE_VHOST_USER_BLK`` as a child of the generic
> +``TYPE_VIRTIO_DEVICE``.

That's not what I'd consider a "front end", though?

> And then for the PCI device it wraps around the
> +base device (although explicitly initialising via
> +virtio_instance_init_common):
> +
> +.. code:: c
> +
> +  struct VHostUserBlkPCI {
> +      VirtIOPCIProxy parent_obj;
> +      VHostUserBlk vdev;
> +  };

The VirtIOPCIProxy seems to materialize a bit out of thin air
here... maybe the information simply needs to be structured in a
different way? Perhaps:

- describe that virtio devices consist of a part that implements the
  device functionality, which ultimately derives from VirtIODevice (the
  "backend"), and a part that exposes a way for the operating system to
  discover and use the device (the "frontend", what the virtio spec
  calls a "transport")
- decribe how the "frontend" part works (maybe mention VirtIOPCIProxy,
  VirtIOMMIOProxy, and VirtioCcwDevice as specialized proxy devices for
  PCI, MMIO, and CCW devices)
- list the different types of "backends" (as you did below), and give
  two examples of how VirtIODevice is extended (a plain one, and a
  vhost-user one)
- explain how frontend and backend together create an actual device
  (with the two device examples, and maybe also with the plain one
  plugged as both PCI and CCW?); maybe also mention that MMIO is a bit
  different? (it always confuses me)

> +  =20
> +  static void vhost_user_blk_pci_instance_init(Object *obj)
> +  {
> +      VHostUserBlkPCI *dev =3D VHOST_USER_BLK_PCI(obj);
> +
> +      virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
> +                                  TYPE_VHOST_USER_BLK);
> +      object_property_add_alias(obj, "bootindex", OBJECT(&dev->vdev),
> +                                "bootindex");
> +  }
> +
> +  static const VirtioPCIDeviceTypeInfo vhost_user_blk_pci_info =3D {
> +      .base_name               =3D TYPE_VHOST_USER_BLK_PCI,
> +      .generic_name            =3D "vhost-user-blk-pci",
> +      .transitional_name       =3D "vhost-user-blk-pci-transitional",
> +      .non_transitional_name   =3D "vhost-user-blk-pci-non-transitional"=
,
> +      .instance_size  =3D sizeof(VHostUserBlkPCI),
> +      .instance_init  =3D vhost_user_blk_pci_instance_init,
> +      .class_init     =3D vhost_user_blk_pci_class_init,
> +  };
> +
> +Back End Implementations
> +------------------------
> +
> +There are a number of places where the implementation of the backend
> +can be done:
> +
> +* in QEMU itself
> +* in the host kernel (a.k.a vhost)
> +* in a separate process (a.k.a. vhost-user)
> +
> +where a vhost-user implementation is being done the code in QEMU is
> +mainly boilerplate to handle the command line definition and
> +connection to the separate process with a socket (using the ``chardev``
> +functionality).
> +
> +Implementing a vhost-user wrapper
> +---------------------------------
> +
> +There are some classes defined that can wrap a lot of the common
> +vhost-user code in a ``VhostUserBackend``. For example:

Is VhostUserBackend something that is expected to be commonly used? I
think gpu and input use it, but not virtiofs (unless I misread the code).

> +
> +.. code:: c
> +
> +  struct VhostUserGPU {
> +      VirtIOGPUBase parent_obj;
> +
> +      VhostUserBackend *vhost;
> +      ...
> +  };
> +
> +  static void
> +  vhost_user_gpu_instance_init(Object *obj)
> +  {
> +      VhostUserGPU *g =3D VHOST_USER_GPU(obj);
> +
> +      g->vhost =3D VHOST_USER_BACKEND(object_new(TYPE_VHOST_USER_BACKEND=
));
> +      object_property_add_alias(obj, "chardev",
> +                                OBJECT(g->vhost), "chardev");
> +  }
> +
> +  static void
> +  vhost_user_gpu_device_realize(DeviceState *qdev, Error **errp)
> +  {
> +      VhostUserGPU *g =3D VHOST_USER_GPU(qdev);
> +      VirtIODevice *vdev =3D VIRTIO_DEVICE(g);
> +
> +      vhost_dev_set_config_notifier(&g->vhost->dev, &config_ops);
> +      if (vhost_user_backend_dev_init(g->vhost, vdev, 2, errp) < 0) {
> +          return;
> +      }
> +      ...
> +  }
> +
> +  static void
> +  vhost_user_gpu_class_init(ObjectClass *klass, void *data)
> +  {
> +      DeviceClass *dc =3D DEVICE_CLASS(klass);
> +      VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_CLASS(klass);
> +
> +      vdc->realize =3D vhost_user_gpu_device_realize;
> +      ...
> +  }
> +
> +  static const TypeInfo vhost_user_gpu_info =3D {
> +      .name =3D TYPE_VHOST_USER_GPU,
> +      .parent =3D TYPE_VIRTIO_GPU_BASE,
> +      .instance_size =3D sizeof(VhostUserGPU),
> +      .instance_init =3D vhost_user_gpu_instance_init,
> +      .class_init =3D vhost_user_gpu_class_init,
> +      ...
> +  };
> +
> +Here the ``TYPE_VHOST_USER_GPU`` is based off a shared base class
> +(``TYPE_VIRTIO_GPU_BASE`` which itself is based on
> +``TYPE_VIRTIO_DEVICE``). The chardev property is aliased to the
> +VhostUserBackend chardev so it can be specified on the command line
> +for this device.
> +=20

I think using a "base" device is something that is device-specific; for
gpu, it makes sense as it can be implemented in different ways, but
e.g. virtiofs does not have a "plain" implementation, and some device
types have only "plain" implementations.


