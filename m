Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0793257F87C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 05:31:54 +0200 (CEST)
Received: from localhost ([::1]:43392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFooy-0003WC-KU
	for lists+qemu-devel@lfdr.de; Sun, 24 Jul 2022 23:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oFonN-0001t4-Eu
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 23:30:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oFonI-0001ge-LH
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 23:30:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658719806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+5wCJVkZie0gqGt6mjfVNYzbSY5wrSWRXISDYTiY93k=;
 b=AjtU2ayX4s8CgK7zRxA7phRBHiOnJ507DIXX94WCtJS7jAhBNcfQ5Y1D/z0dKr/OrtSF8w
 9M5JuFyh5Wy2Dg4EoZ6lzTOwicjZ6Y+hXRI/qEys6wvjQvWEtu9XqwHx2Hb1NmrOVDaAtc
 B9KpS7Dk4oqAsfZNy4jqb/td52xKd9k=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-_nVGbWLZP0eQBT6J2MicBA-1; Sun, 24 Jul 2022 23:30:05 -0400
X-MC-Unique: _nVGbWLZP0eQBT6J2MicBA-1
Received: by mail-lj1-f199.google.com with SMTP id
 r4-20020a2e80c4000000b0025e05dbef18so518560ljg.6
 for <qemu-devel@nongnu.org>; Sun, 24 Jul 2022 20:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+5wCJVkZie0gqGt6mjfVNYzbSY5wrSWRXISDYTiY93k=;
 b=d6QAwec/HDCTeLUt9/3yp4aUo9qSJvBPdgfzFDibTBclszr65HAJum+pEy2jkLR2gC
 GFm0MWaIFIyRIIPz1Oo6tPaE5K688TKby+oTB0zIAPxyk9qOqRRDSn6tiDd9bNf3BAZI
 dfKCrW4QKcZSmZQiFsE5w0r513iQz/BwHpGkYx33Aji1wnPVlU6aiB+3FHe8Zdc9Rks7
 F3GguRPrWnb23kCTMKUvmyjWNX90N/uPaE7kzY+a1KZSUyOxdZsYMcusaXn6nMXULfzK
 QuJ9MO+W7WZsEP34Oa88oU25pbh8orvPu9o4PS0u4qUgvzPqsFtu9LxEPHeP2QEQpP9H
 fhWA==
X-Gm-Message-State: AJIora8r79cA/7h//LxD9PjIIbsbKkEdTwKrvBDHKAQUOpRZRoi0pAat
 fHQX0/9n3QTqx3mDESWNo1ckaGnPpjtNOLoU4elM/qMDo7n5SAQ3Pwz6wV9Y0adfSgWl7hzptZd
 z2e+i9/a/STCBXidH4IaSK00x2zVOfj0=
X-Received: by 2002:a05:6512:2394:b0:48a:7cfd:72ac with SMTP id
 c20-20020a056512239400b0048a7cfd72acmr3685237lfv.411.1658719803746; 
 Sun, 24 Jul 2022 20:30:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ujxo0xezm3ZGSXPzvwio+qboOu7/Ab9cc108c+tnw7owHOZjlVHCrzEJtHwe0DGP9WADk1WNKnPSxkvOIeohk=
X-Received: by 2002:a05:6512:2394:b0:48a:7cfd:72ac with SMTP id
 c20-20020a056512239400b0048a7cfd72acmr3685219lfv.411.1658719803178; Sun, 24
 Jul 2022 20:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <2cd1040e-7593-dc89-aa6c-9ef12485ef15@linux.alibaba.com>
In-Reply-To: <2cd1040e-7593-dc89-aa6c-9ef12485ef15@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 25 Jul 2022 11:29:52 +0800
Message-ID: <CACGkMEv8ajBwx3qX3=Xx+hLjJQafktfu_ZXiW8c-v1BfXavmuQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] Support VIRTIO_F_RING_RESET for virtio-net and
 vhost-user in virtio pci
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: mst <mst@redhat.com>, hengqi@linux.alibaba.com, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Jul 25, 2022 at 10:34 AM Kangjie Xu
<kangjie.xu@linux.alibaba.com> wrote:
>
> Do you have any comments or suggestions about improvements to this patch
> set?

Will have a look and give feedback no later than the end of this week.

Thanks

>
>
> Regards,
>
> Kangjie
>
> =E5=9C=A8 2022/7/18 19:16, Kangjie Xu =E5=86=99=E9=81=93:
> > The virtio queue reset function has already been defined in the virtio =
spec 1.2.
> > The relevant virtio spec information is here:
> >
> >      https://github.com/oasis-tcs/virtio-spec/issues/124
> >      https://github.com/oasis-tcs/virtio-spec/issues/139
> >
> > This patch set is to support this function in QEMU. It consists of two =
parts: virtio-net
> > and vhost-user. The patches 1-7 are the implementation for virtio-net a=
nd the patches
> > 8-16 are for vhost-user.
> >
> > The process of virt queue reset can be concluded as:
> > 1. The virtqueue is disabled when VIRTIO_PCI_COMMON_Q_RESET is written.
> > 2. Then the virtqueue is restarted after the information of vrings is p=
assed to QEMU and
> > VIRTIO_PCI_COMMON_Q_ENABLE is written.
> >
> > Test environment:
> >      Host: 5.4.189
> >      Qemu: QEMU emulator version 7.0.50
> >      Guest: 5.19.0-rc3 (With vq reset support)
> >      DPDK: 22.07-rc1 (With vq reset support)
> >      Test Cmd: ethtool -g eth1; ethtool -G eth1 rx $1 tx $2; ethtool -g=
 eth1;
> >
> >      The frontend can resize the virtio queue, then virtio queue reset =
function should
> >      be triggered.
> >
> >      The default is split mode, modify Qemu virtio-net to add PACKED fe=
ature to
> >      test packed mode.
> >
> > Guest Kernel Patch:
> >      https://lore.kernel.org/bpf/20220629065656.54420-1-xuanzhuo@linux.=
alibaba.com/
> >
> > DPDK Code:
> >      https://github.com/middaywords/dpdk/commit/098c8e1dfae10b747da8dd8=
950a82890efca7bee
> >
> > Please review. Thanks.
> >
> > Kangjie Xu (9):
> >    vhost: add op to enable or disable a single vring
> >    vhost-user: enable/disable a single vring
> >    vhost: extract the logic of unmapping the vrings and desc
> >    vhost: introduce restart and release for vhost_dev's vqs
> >    vhost-net: introduce restart and stop for vhost_net's vqs
> >    virtio: introduce queue_enable in virtio
> >    virtio-net: support queue_enable for vhost-user
> >    virtio-net: support queue_reset for vhost-user
> >    vhost-net: vq reset feature bit support
> >
> > Xuan Zhuo (7):
> >    virtio-pci: virtio_pci_common_cfg add queue_notify_data
> >    virtio: add VIRTIO_F_RING_RESET
> >    virtio: pci: virtio_pci_common_cfg add queue_reset
> >    virtio: introduce __virtio_queue_reset()
> >    virtio: introduce virtio_queue_reset()
> >    virtio-pci: support queue reset
> >    virtio-net: support queue reset
> >
> >   hw/net/vhost_net.c                            | 56 ++++++++++++++++++
> >   hw/net/virtio-net.c                           | 40 +++++++++++++
> >   hw/virtio/vhost-user.c                        | 55 +++++++++++++++---
> >   hw/virtio/vhost.c                             | 49 ++++++++++++++--
> >   hw/virtio/virtio-pci.c                        | 17 ++++++
> >   hw/virtio/virtio.c                            | 57 +++++++++++++-----=
-
> >   include/hw/virtio/vhost-backend.h             |  4 ++
> >   include/hw/virtio/vhost.h                     |  6 ++
> >   include/hw/virtio/virtio-pci.h                |  1 +
> >   include/hw/virtio/virtio.h                    |  4 ++
> >   include/net/vhost_net.h                       |  5 ++
> >   .../standard-headers/linux/virtio_config.h    |  5 ++
> >   include/standard-headers/linux/virtio_pci.h   |  4 ++
> >   13 files changed, 274 insertions(+), 29 deletions(-)
> >
>


