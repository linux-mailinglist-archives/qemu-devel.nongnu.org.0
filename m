Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1268538D7C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 11:08:56 +0200 (CEST)
Received: from localhost ([::1]:58590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvxrz-0005Gx-TZ
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 05:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nvxa8-0005o0-PR
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:50:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nvxa2-0001rl-0u
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653987020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QwyUyuKOPFb6rzwvsXkBjWAFWH9TpisDhxCdkC58Z5o=;
 b=ZMgWOdI94jAePBEMuvOIM+B9gVyfVPH5PuxlQJZLvFVJJMhcAr6vK2Apf9HiJjLpBfPW/N
 E3p15KfcTWtWU7SHM8VAsNHVlBbzYuYiFDw8DwJWaVAS4PXLdWkGluzBQU/YFd0fQtdhAi
 nyfLbbFiClM1p4wCyn1d/KbKJ7xOf/g=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-d8Z9TT3WMTmrHHc2FVDwzg-1; Tue, 31 May 2022 04:50:19 -0400
X-MC-Unique: d8Z9TT3WMTmrHHc2FVDwzg-1
Received: by mail-lj1-f197.google.com with SMTP id
 l19-20020a2e5713000000b0025566e68160so30503ljb.15
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 01:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QwyUyuKOPFb6rzwvsXkBjWAFWH9TpisDhxCdkC58Z5o=;
 b=qr8lTGWTr5xPhN4g4BbkXI6xDXdg/nPeSNkDKBxSXZFPCQ3n4tfEaxSQMOk/2xfUXp
 eqTZejH8g0Rg63CiuUS3nbHFWtlLoFcXG0SvISNTr2vNNNKaYY/J9xEwirq0nD+Awgqw
 tXzoH+V46TizOURqIV6+NTd0PkHyvlHRrfaa5CwxOQ759fSbHJ9PKIGj5B+Q4AMQmgPb
 gG7epTwRJPYNvUox/ok/2yzxQjuYfL4OnDU31GQFibhFc7avEgpkS2sAvmu0V6/PjRs8
 9NpurAtLNsqNxdbheCvxUg2nYErrtJSoBSxcHptIctSLQwMEZ89hzaE8nBjYGjKRuzfH
 DYwA==
X-Gm-Message-State: AOAM531Tgj2nnj+D395EHsmnK0gEw2l6Oe415rV2u63e2X0nZrudjIjw
 DJqV34b1RB9Q6HuXNxoUKYY/Bhw2YLuSQ8yENvnv2q48hF33M9ekkzK9cU3tl6FJoWypTnyGJPB
 HKpGBM0dGe3nQ/Pq5ERMYMHYciW+FZD8=
X-Received: by 2002:a2e:b443:0:b0:255:5c78:3fd0 with SMTP id
 o3-20020a2eb443000000b002555c783fd0mr1690087ljm.73.1653987017441; 
 Tue, 31 May 2022 01:50:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5AjoWPVetmo0amEGtfB8Lp1Oq3ZcZOtKrFdYx+c08Q/NuKywu1e02mj7tXn0IZh2JNc3cOZ0Y/WNy8j1DlQE=
X-Received: by 2002:a2e:b443:0:b0:255:5c78:3fd0 with SMTP id
 o3-20020a2eb443000000b002555c783fd0mr1690064ljm.73.1653987017158; Tue, 31 May
 2022 01:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220514041107.1980-1-longpeng2@huawei.com>
 <5dcfcf36-8907-f781-0990-edf255bc2425@huawei.com>
In-Reply-To: <5dcfcf36-8907-f781-0990-edf255bc2425@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 31 May 2022 16:50:05 +0800
Message-ID: <CACGkMEvdm_fNKdFY-TRkq5sy6_bdLL=WKv6hN_cmWefrsS2zZA@mail.gmail.com>
Subject: Re: [PATCH v6 resend 0/4] add generic vDPA device support
To: "Longpeng (Mike,
 Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, mst <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 pbonzini <pbonzini@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Yechuan <yechuan@huawei.com>, 
 Huangzhichao <huangzhichao@huawei.com>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 30, 2022 at 12:16 PM Longpeng (Mike, Cloud Infrastructure
Service Product Dept.) <longpeng2@huawei.com> wrote:
>
> Hi guys,
>
> Ping...Any other comments?

Looks good to me.

Acked-by: Jason Wang <jasowang@redhat.com>

(This probably requires a rebase since it doesn't apply cleanly on master).

Thanks

>
> =E5=9C=A8 2022/5/14 12:11, Longpeng(Mike) =E5=86=99=E9=81=93:
> > From: Longpeng <longpeng2@huawei.com>
> >
> > Hi guys,
> >
> > With the generic vDPA device, QEMU won't need to touch the device
> > types any more, such like vfio.
> >
> > We can use the generic vDPA device as follow:
> >    -device vhost-vdpa-device-pci,vhostdev=3D/dev/vhost-vdpa-X
> >    Or
> >    -M microvm -m 512m -smp 2 -kernel ... -initrd ... -device \
> >    vhost-vdpa-device,vhostdev=3D/dev/vhost-vdpa-x
> >
> > I've done some simple tests on Huawei's offloading card (net, 0.95).
> >
> > Changes v5 -> v6:
> >    Patch 2:
> >      - Turn to the original approach in the RFC to initialize the
> >        virtio_pci_id_info array. [Michael]
> >         https://lore.kernel.org/all/20220105005900.860-2-longpeng2@huaw=
ei.com/
> >    Patch 3:
> >      - Fix logical error of exception handler around the post_init.
> >        [Stefano]
> >      - Fix some coding style warnings. [Stefano]
> >    Patch 4:
> >      - Fix some coding style warnings. [Stefano]
> >
> > Changes v4 -> v5:
> >    Patch 3:
> >      - remove vhostfd [Jason]
> >      - support virtio-mmio [Jason]
> >
> > Changes v3 -> v4:
> >    v3: https://www.mail-archive.com/qemu-devel@nongnu.org/msg877015.htm=
l
> >    - reorganize the series [Stefano]
> >    - fix some typos [Stefano]
> >    - fix logical error in vhost_vdpa_device_realize [Stefano]
> >
> > Changes v2 -> v3
> >    Patch 4 & 5:
> >      - only call vdpa ioctls in vdpa-dev.c [Stefano, Longpeng]
> >      - s/VQS_NUM/VQS_COUNT  [Stefano]
> >      - check both vdpa_dev_fd and vdpa_dev [Stefano]
> >    Patch 6:
> >      - move all steps into vhost_vdpa_device_unrealize. [Stefano]
> >
> > Changes RFC -> v2
> >    Patch 1:
> >      - rename 'pdev_id' to 'trans_devid'  [Michael]
> >      - only use transitional device id for the devices
> >        listed in the spec  [Michael]
> >      - use macros to make the id_info table clearer  [Longpeng]
> >      - add some modern devices in the id_info table  [Longpeng]
> >    Patch 2:
> >      - remove the GET_VECTORS_NUM command  [Jason]
> >    Patch 4:
> >      - expose vdpa_dev_fd as a QOM preperty  [Stefan]
> >      - introduce vhost_vdpa_device_get_u32 as a common
> >        function to make the code clearer  [Stefan]
> >      - fix the misleading description of 'dc->desc'  [Stefano]
> >    Patch 5:
> >      - check returned number of virtqueues  [Stefan]
> >    Patch 6:
> >      - init s->num_queues  [Stefano]
> >      - free s->dev.vqs  [Stefano]
> >
> >
> > Longpeng (Mike) (4):
> >    linux-headers: Update headers to Linux 5.18-rc6
> >    virtio: get class_id and pci device id by the virtio id
> >    vdpa: add vdpa-dev support
> >    vdpa: add vdpa-dev-pci support
> >
> >   hw/virtio/Kconfig            |   5 +
> >   hw/virtio/meson.build        |   2 +
> >   hw/virtio/vdpa-dev-pci.c     | 102 ++++++++++
> >   hw/virtio/vdpa-dev.c         | 377 ++++++++++++++++++++++++++++++++++=
+
> >   hw/virtio/virtio-pci.c       |  88 ++++++++
> >   hw/virtio/virtio-pci.h       |   5 +
> >   include/hw/virtio/vdpa-dev.h |  43 ++++
> >   linux-headers/linux/vhost.h  |   7 +
> >   8 files changed, 629 insertions(+)
> >   create mode 100644 hw/virtio/vdpa-dev-pci.c
> >   create mode 100644 hw/virtio/vdpa-dev.c
> >   create mode 100644 include/hw/virtio/vdpa-dev.h
> >
>


