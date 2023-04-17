Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAC26E47D7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 14:34:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poO3J-0001Cs-Im; Mon, 17 Apr 2023 08:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1poO31-000199-Sr
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:33:45 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1poO2k-0006Z9-NL
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:33:26 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-552ae3e2cbeso43334707b3.13
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 05:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681734790; x=1684326790;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KKil25CaD1GefOuSJ7he1KxtJ2MGvC2v1/qQerrKU50=;
 b=sdwwxJXNqnNAWox4T4jiQ/n2PiwvpescAPS9jtShVlT9CM0UGX0deS+WLyF+m37SIb
 MQoT3C+QBG1ZbucYoDxShZgggB1HMXXpa8N7hdsXvZT8f7w/zFbN0/xUaO/6wBqEVLGY
 dGHqDCjNNzRx9RPbyQf4pXlLkcywZnpvnOS+QyFLypLYTSRIvdcj1+7MyRbL52WmIjfR
 hcosWi3VJp9ed2YKjfTa8Vj3kFh/3LP33UEzW1p+XjLOvY2VW7RI7CEyINQnmBYV+A5t
 sIrWQVztUoW+iwwprCPjwYpuUSHnQdx9YsGCD+8p/hzr4VbSzeV2B0DPAmSjjg9aHJXb
 8EFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681734790; x=1684326790;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KKil25CaD1GefOuSJ7he1KxtJ2MGvC2v1/qQerrKU50=;
 b=DDA+rtdWj2jYLfNyBgv1uPXbVfYeZWG6qapr6hyFhSknr2e8e1zeskS8GgZf1rJ2Dg
 VKS1LzXMsgmJ0mWkF2U556+KENCrED+JsKAsnGbbmLMLJclt698ObalQZ/+CWy6gQRiB
 xE+iYdHHhi1cDjkC6Ub/VPKAJW3etgOa95hGZ7RkIjRhMCeupH4H1wFkfBkhK56THjqG
 /kUblfmHKlZYuXebvTUDPfS8LTnJFTqPCa3qmYoj/odBqGqoni3BsDD2GPspqWSCXLmK
 fPgyxgD1bRcyGz0+5uCGYHK9ikCGzYRJvbiunUnuxlRnhjRo+Pmrq7Ux4qvZdtwK51/R
 NTjA==
X-Gm-Message-State: AAQBX9f72iiuAMTG6JmbAnrn1nTYXGBmnnaZ1i5AR3nJm1GIIgU5H+CU
 oiBjHpvu+W0P37Zh6xnOS1tqcTq1GrysFgcixYo=
X-Google-Smtp-Source: AKy350bkgL+GyY+KX+sbj/QBqopuLRMpWz5BcR6bqS5r69BkuuzWeo+cibAu91geCVp//yfHYKqQ+DYGVRWHq8Sk+qo=
X-Received: by 2002:a81:ad4a:0:b0:54f:17b6:f30a with SMTP id
 l10-20020a81ad4a000000b0054f17b6f30amr8956621ywk.4.1681734790454; Mon, 17 Apr
 2023 05:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230414160433.2096866-1-alex.bennee@linaro.org>
In-Reply-To: <20230414160433.2096866-1-alex.bennee@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 17 Apr 2023 08:32:58 -0400
Message-ID: <CAJSP0QURbJrEoFY8FhMnq_B6tx-qYspfu-OB6=6hz5=qAwE=6A@mail.gmail.com>
Subject: Re: [PATCH 00/12] virtio: add vhost-user-generic and reduce copy and
 paste
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 virtio-fs@redhat.com, Erik Schilling <erik.schilling@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 14 Apr 2023 at 12:06, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> A lot of our vhost-user stubs are large chunks of boilerplate that do
> (mostly) the same thing. This series attempts to fix that by defining
> a new base class for vhost-user devices and then converting the rng
> and gpio devices to be based off them. You can even use
> vhost-user-device directly if you supply it with the right magic
> numbers (which is helpful for development).
>
> However the final patch runs into the weeds because I don't yet have a
> clean way to represent in QOM the fixing of certain properties for the
> specialised classes.
>
> The series is a net reduction in code and an increase in
> documentation but obviously needs to iron out a few more warts. I'm
> open to suggestions on the best way to tweak the QOM stuff.

--device vhost-user-device is not really possible because vhost-user
devices are not full VIRTIO devices. vhost-user devices depend on
device-specific code in the VMM by design.

The "subset of a VIRTIO device" design made sense for vhost_net.
Nowadays there are other device types that are close to full VIRTIO
devices, although the vhost-user protocol doesn't support the full
VIRTIO device lifecycle.

I think a user-creatable --device vhost-user-device is not a good idea
today. It creates confusion. Many people aren't aware of the
architectural difference between vhost-user and VIRTIO devices. The
result is that VMMs and vhost-user backends implement increasingly
brittle VIRTIO configuration space and feature bit logic as they
knowingly or unknowingly try to paper over the fact that a traditional
vhost-user device isn't a full VIRTIO device.

It is possible to resolve this difference and make --device
vhost-user-device work properly for devices that want to be full
VIRTIO devices. See "Making VMM device shims optional" here:
https://blog.vmsplice.net/2020/09/on-unifying-vhost-user-and-virtio.html

Even after extending the vhost-user protocol to solve the current
limitations, existing backends would still only be partial VIRTIO
devices that wouldn't work with --device vhost-user-device.

Reducing boilerplate is helpful, but I think --device
vhost-user-device should not be user-creatable.

Stefan

>
> Alex.
>
> Alex Benn=C3=A9e (12):
>   hw/virtio: fix typo in VIRTIO_CONFIG_IRQ_IDX comments
>   include/hw/virtio: document virtio_notify_config
>   include/hw/virtio: add kerneldoc for virtio_init
>   include/hw/virtio: document some more usage of notifiers
>   virtio: add generic vhost-user-device
>   virtio: add PCI stub for vhost-user-device
>   include: attempt to document device_class_set_props
>   qom: allow for properties to become "fixed"
>   hw/virtio: derive vhost-user-rng from vhost-user-device
>   hw/virtio: add config support to vhost-user-device
>   hw/virtio: derive vhost-user-gpio from vhost-user-device (!BROKEN)
>   docs/system: add a basic enumeration of vhost-user devices
>
>  docs/system/devices/vhost-user-rng.rst |   2 +
>  docs/system/devices/vhost-user.rst     |  41 +++
>  qapi/qom.json                          |   2 +
>  include/hw/qdev-core.h                 |   9 +
>  include/hw/virtio/vhost-user-device.h  |  33 ++
>  include/hw/virtio/vhost-user-gpio.h    |  23 +-
>  include/hw/virtio/vhost-user-rng.h     |  11 +-
>  include/hw/virtio/virtio.h             |  21 ++
>  include/qom/object.h                   |  16 +-
>  hw/display/vhost-user-gpu.c            |   4 +-
>  hw/net/virtio-net.c                    |   4 +-
>  hw/virtio/vhost-user-device-pci.c      |  71 +++++
>  hw/virtio/vhost-user-device.c          | 359 ++++++++++++++++++++++
>  hw/virtio/vhost-user-fs.c              |   4 +-
>  hw/virtio/vhost-user-gpio.c            | 405 +------------------------
>  hw/virtio/vhost-user-rng.c             | 264 +---------------
>  hw/virtio/vhost-vsock-common.c         |   4 +-
>  hw/virtio/virtio-crypto.c              |   4 +-
>  qom/object.c                           |  14 +
>  qom/object_interfaces.c                |   9 +-
>  qom/qom-qmp-cmds.c                     |   1 +
>  softmmu/qdev-monitor.c                 |   1 +
>  hw/virtio/meson.build                  |   3 +
>  23 files changed, 613 insertions(+), 692 deletions(-)
>  create mode 100644 include/hw/virtio/vhost-user-device.h
>  create mode 100644 hw/virtio/vhost-user-device-pci.c
>  create mode 100644 hw/virtio/vhost-user-device.c
>
> --
> 2.39.2
>
>

