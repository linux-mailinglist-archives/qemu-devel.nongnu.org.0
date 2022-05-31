Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543C4538BCB
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 09:07:24 +0200 (CEST)
Received: from localhost ([::1]:45552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvvyN-0001yx-Eo
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 03:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nvvsG-0008UU-FE
 for qemu-devel@nongnu.org; Tue, 31 May 2022 03:01:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nvvra-0002PT-Ow
 for qemu-devel@nongnu.org; Tue, 31 May 2022 03:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653980420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=McdQDC1eE1ePUI+1Vhf6SnzEpblIwZEyzCLXSgw/23o=;
 b=aKG7/JC1Dxfhmdj+Ke6Jtgb/rOJtelGMkcBwEl0LsAiak3MSMAwbP+g3Cc6tsxrHAtAwyx
 9Jd0EUBZ11g6uaBzbDttZ0Xwfs0N6MEsl8yZaGzXP1Sj7ByfsVvINS6/gTMSvLkh7303xB
 9yI1dqWXrTgLaew4ESTmFtsyWwwXsvs=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-gffocd3TMK2GZUCgu-Bd_w-1; Tue, 31 May 2022 03:00:18 -0400
X-MC-Unique: gffocd3TMK2GZUCgu-Bd_w-1
Received: by mail-lf1-f72.google.com with SMTP id
 b2-20020a0565120b8200b00477a4532448so6312495lfv.22
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 00:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=McdQDC1eE1ePUI+1Vhf6SnzEpblIwZEyzCLXSgw/23o=;
 b=Q7CJt+l1AITXVapeIAQVQBl9+6zGJryqofVMOr/rG7cU0nE2mIyhgNYw6lHild6fve
 5iMMXsgKyqAsV+HWH1pfXl1t8cVDoZDnHGmL+D3avjb4n0S7HRbPF7ffx8OZbVI+TKzn
 A501x6Dcv1hxDq4EMuqqRYDd3oKyUojPPOVhngJ7a/AX9czh4Vfa/+vtZnDMlcC7gXt0
 Xt2P/3U8+QsXZc365l2hx2hPIvTLWQNuxN6m3AgG/Bi65IA4oKNEHBLBvs0VcUxRXrKW
 Bx49L3LrCvKVHRBHMweBV3LbTvgrkMhz3DWxLhn2aexq1RFD+OrL8ZFHI+IRMklwS3ll
 AJ9A==
X-Gm-Message-State: AOAM533LRInx0TO30ksZoRl6gK1RTbeLNPbdDZWmXaNdnZxwHe5dqXFh
 HXXtFsydwvn6aeFW1EpaaxiI+lG9Y02Lc/qQqGJotW1F0Jjz/GFft3aUwWREKt2fTDJJEh8bgRY
 uhM5fyCQnFrCtS9amhg2WDzI+6q69uEE=
X-Received: by 2002:a05:6512:128e:b0:478:681c:18d8 with SMTP id
 u14-20020a056512128e00b00478681c18d8mr32338968lfs.190.1653980416787; 
 Tue, 31 May 2022 00:00:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuaQOrF4scGcK6/v3NTtMGnIVGpB7an//vB1A6Dg211qq3C92IIt+ZrlG8h0gB2G057MRvNp4+jBKIJaRY1b0=
X-Received: by 2002:a05:6512:128e:b0:478:681c:18d8 with SMTP id
 u14-20020a056512128e00b00478681c18d8mr32338944lfs.190.1653980416504; Tue, 31
 May 2022 00:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220514041107.1980-1-longpeng2@huawei.com>
 <5dcfcf36-8907-f781-0990-edf255bc2425@huawei.com>
In-Reply-To: <5dcfcf36-8907-f781-0990-edf255bc2425@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 31 May 2022 15:00:05 +0800
Message-ID: <CACGkMEsv8UiCHw=AoEcB2CULhgv3Tvgo9hDr91PsaPL61oBeLg@mail.gmail.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

Will go through this and try to provide some acks soon.

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


