Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F23434396
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 04:41:19 +0200 (CEST)
Received: from localhost ([::1]:49366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md1Xa-00014z-KR
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 22:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1md1W6-0000OW-ND
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 22:39:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1md1W5-0004bd-0t
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 22:39:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634697584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lylr/CCYw+RlSdtmjs9V1njGaf4RULdfPGV5+6VklKM=;
 b=djrqcD+9TwwVAfsAVZ/4+cVsPkpfo8fXBYMvER4/oQyZYdUX1Pnvp5SOmX/IBfQ1aJVpxD
 ZWbgFcNtoYE4ZFC2VPzJIUeBkv+TcnAFEfORzhf04xHYDtO5+lQOsoRKO9/2Q8xiSDkR6w
 8X9LxDSculvYTjnXu8zeloVgaS1mAjU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-RTgErOlPNq6kW74QQo6MIw-1; Tue, 19 Oct 2021 22:39:43 -0400
X-MC-Unique: RTgErOlPNq6kW74QQo6MIw-1
Received: by mail-wm1-f72.google.com with SMTP id
 k6-20020a7bc306000000b0030d92a6bdc7so2211966wmj.3
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 19:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lylr/CCYw+RlSdtmjs9V1njGaf4RULdfPGV5+6VklKM=;
 b=YzVb9ukaCsxj9vUJ2OD+zMq+xa40PuyiqMOkTrs1Ik6SjypVzsh32U1yA+RiIOGH2f
 ggkyzA2Akwttgq9ZjCJ1vaOOmPD7be2DodhTyjF798zXLsfDSKI+le6Oc1zV36uQ/3pY
 PrGj1uuV1VhzTqj/U6c8bBr0sjvQhyEV9d2cBhcFQY+Zf8o6rUhXwSga9H4NzExS6MPh
 uJr8Ck89CkCbYsvVgaM9FkdrsPGHnX/H+exriYzSb2COgo5T0k6H794JILg8gPcAib7R
 3J9AURTSlp7iCBbN4UW3LcQhEVA7Pm6K2DghknsSMO7OQTu93Gb3izvccWeEJ7l8IAOU
 odeA==
X-Gm-Message-State: AOAM533yIjeCypILOA+NoAAFHxv0h6SRGufOi/JtSnEmmfjl5lyJG2i6
 MNrZe9evYObMs7dG5g1XPwt/VTMqC1Bb4Gl7Ll6HjIosIzn5MNaPCLefNJjC7kFUOZqyu0e2emH
 GSRqY0ws1w2EEHRMl4TtVQXCtRhbzh8Y=
X-Received: by 2002:adf:bc12:: with SMTP id s18mr48780889wrg.328.1634697581681; 
 Tue, 19 Oct 2021 19:39:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBu8gfKbkBvdby+Qx6Dsn0IiUWdoNw9zEjXWrXMKKyjBig3e+6j8c2NOVgcHaehFsAkhi5dbRlSW17+flW8mA=
X-Received: by 2002:a05:6402:2690:: with SMTP id
 w16mr60742836edd.372.1634697140943; 
 Tue, 19 Oct 2021 19:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210930023348.17770-1-lulu@redhat.com>
 <20211019025504-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211019025504-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Wed, 20 Oct 2021 10:31:42 +0800
Message-ID: <CACLfguVkezXGWc8PdJMEhvyU3NRfg4QisrhJu9k_iabDJw2iUQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/10] vhost-vdpa: add support for configure interrupt
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, dgilbert@redhat.com,
 QEMU Developers <qemu-devel@nongnu.org>, arei.gonglei@huawei.com,
 kraxel@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 2:56 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Sep 30, 2021 at 10:33:38AM +0800, Cindy Lu wrote:
> > these patches add the support for configure interrupt
> >
> > These codes are all tested in vp-vdpa (support configure interrupt)
> > vdpa_sim (not support configure interrupt), virtio tap device
> >
> > test in virtio-pci bus and virtio-mmio bus
>
>
> I was inclined to let it slide but it hangs make check
> so needs more work.
> Meanwhile please go over how the patchset is structured,
> and over description of each patch.
> I sent some comments but same applied to everything.
>
> Also, pls document the index == -1 hack in more detail.
> how does it work and why it's helpful.
>
> Thanks!
>
sure I will check this and add more details
> > Change in v2:
> > Add support for virtio-mmio bus
> > active the notifier while the backend support configure interrupt
> > misc fixes from v1
> >
> > Change in v3
> > fix the coding style problems
> >
> > Change in v4
> > misc fixes from v3
> > merge the set_config_notifier to set_guest_notifier
> > when vdpa start, check the feature by VIRTIO_NET_F_STATUS
> >
> > Change in v5
> > misc fixes from v4
> > split the code to introduce configure interrupt type and the callback function
> > will init the configure interrupt in all virtio-pci and virtio-mmio bus, but will
> > only active while using vhost-vdpa driver
> >
> > Change in v6
> > misc fixes from v5
> > decouple virtqueue from interrupt setting and misc process
> > fix the bug in virtio_net_handle_rx
> > use -1 as the queue number to identify if the interrupt is configure interrupt
> >
> > Change in v7
> > misc fixes from v6
> > decouple virtqueue from interrupt setting and misc process
> > decouple virtqueue from vector use/release process
> > decouple virtqueue from set notifier fd handler process
> > move config_notifier and masked_config_notifier to VirtIODevice
> > fix the bug in virtio_net_handle_rx, add more information
> > add VIRTIO_CONFIG_IRQ_IDX as the queue number to identify if the interrupt is configure interrupt
> >
> > Change in v8
> > misc fixes from v7
> > decouple virtqueue from interrupt setting and misc process
> > decouple virtqueue from vector use/release process
> > decouple virtqueue from set notifier fd handler process
> > move the vhost configure interrupt to vhost_net
> >
> > Change in v9
> > misc fixes from v8
> > address the comments for v8
> >
> > Cindy Lu (10):
> >   virtio: introduce macro IRTIO_CONFIG_IRQ_IDX
> >   virtio-pci: decouple notifier from interrupt process
> >   virtio-pci: decouple the single vector from the interrupt process
> >   vhost: add new call back function for config interrupt
> >   vhost-vdpa: add support for config interrupt call back
> >   virtio: add support for configure interrupt
> >   virtio-net: add support for configure interrupt
> >   vhost: add support for configure interrupt
> >   virtio-mmio: add support for configure interrupt
> >   virtio-pci: add support for configure interrupt
> >
> >  hw/display/vhost-user-gpu.c       |   6 +
> >  hw/net/vhost_net.c                |  10 ++
> >  hw/net/virtio-net.c               |  16 +-
> >  hw/virtio/trace-events            |   2 +
> >  hw/virtio/vhost-user-fs.c         |   9 +-
> >  hw/virtio/vhost-vdpa.c            |   7 +
> >  hw/virtio/vhost-vsock-common.c    |   6 +
> >  hw/virtio/vhost.c                 |  76 +++++++++
> >  hw/virtio/virtio-crypto.c         |   6 +
> >  hw/virtio/virtio-mmio.c           |  27 ++++
> >  hw/virtio/virtio-pci.c            | 260 ++++++++++++++++++++----------
> >  hw/virtio/virtio-pci.h            |   4 +-
> >  hw/virtio/virtio.c                |  29 ++++
> >  include/hw/virtio/vhost-backend.h |   3 +
> >  include/hw/virtio/vhost.h         |   4 +
> >  include/hw/virtio/virtio.h        |   6 +
> >  include/net/vhost_net.h           |   3 +
> >  17 files changed, 386 insertions(+), 88 deletions(-)
> >
> > --
> > 2.21.3
>


