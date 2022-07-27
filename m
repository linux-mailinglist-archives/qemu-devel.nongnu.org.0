Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8DA5820D0
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 09:12:14 +0200 (CEST)
Received: from localhost ([::1]:56480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGbDJ-0004hX-ME
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 03:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oGb3r-0005u0-CT
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:02:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oGb3n-0005jL-QS
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:02:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658905339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3MoiEpr5BStkysvE0gE1519If2iFE0FcQhfR2dZmpsU=;
 b=LthqnEYVxDscn/dwiMavEy5cDESRrfJ5hl2IcnH46iMEn0fvzxHP3/qx1GtwRyJMt5TL/Y
 mjS5TecvYrShafdwedoOOvY3Ths36oQkNdwzdjJKhGGnu2PwQ5JsVo36S6+AWrJ+Q8sRng
 MQ/i4Ok5CloRaBS2EIlHi63uVvhjgkE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-bHOXC1XSM3aCp4kG0BiDYQ-1; Wed, 27 Jul 2022 03:02:18 -0400
X-MC-Unique: bHOXC1XSM3aCp4kG0BiDYQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 sc42-20020a1709078a2a00b0072b5f51a9dbso4785219ejc.1
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 00:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=3MoiEpr5BStkysvE0gE1519If2iFE0FcQhfR2dZmpsU=;
 b=FNoL4mnhClbu3OmILstCNRU8MHBq4hLF6PwSyuIbQOcHsK4dN7TprXdSsSFdPBUQTV
 oDwoYrT4i1rVtcv/FHbtFu2jNjh3fcIS6TaWMARVGDZ8pb7hrWQQsZUQbK4zfUOGLrti
 aE7gRCxyC2iEqoffmbHr1DjzAGQIr3z4DoptU9liDYKeMSXBQMzPfcIBTTBZ7+3Jqmy+
 jeJzOGTjK0C9kpv9RwRYk+UgQpc5tQQCRnouu0H3NUBA9Qu43IUV6ixi6mFBxlQUYJzK
 uAFdE1wklrId7FCNS2TfiqMxE9Mo6f7Cd/7sjHNiHliyirdWnK8l5KngZL4ODlcMxjAh
 rkVQ==
X-Gm-Message-State: AJIora87Pu1a8/jNDoApqR/tD6aZKzly43/8M0ti4Z33JmPQktxUZyMc
 442ieXq63VxetSs5aYyejaREfqdluqU1AcF+Mus8hW3rkLh2JeOBNQ9ep1CAtPQVHHYYT0uZNBz
 Y/cCufavPgQQoizopmWP6+sf29Txh9Kk=
X-Received: by 2002:a17:906:9be4:b0:72b:cf9:99d8 with SMTP id
 de36-20020a1709069be400b0072b0cf999d8mr16496737ejc.747.1658905337188; 
 Wed, 27 Jul 2022 00:02:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vJEf5at/n/vICOQQUuAFGqlcG97Qr0c0wNddaDzxIPAz22gvy39jFFlzxpDDSovU6fqdr2tFpCG4LtPu+QDkU=
X-Received: by 2002:a17:906:9be4:b0:72b:cf9:99d8 with SMTP id
 de36-20020a1709069be400b0072b0cf999d8mr16496719ejc.747.1658905336881; Wed, 27
 Jul 2022 00:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220724064454.875882-1-lulu@redhat.com>
 <20220726094357-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220726094357-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Wed, 27 Jul 2022 15:01:40 +0800
Message-ID: <CACLfguXG5yXazYBRq5AGqB2bzuQPf-HyFnnKSx294EFvrGXNkA@mail.gmail.com>
Subject: Re: [PATCH v15 00/10] vhost-vdpa: add support for configure interrupt
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, virtio-fs@redhat.com, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
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

On Tue, 26 Jul 2022 at 21:45, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> Hi!
> So I don't think this will make it in 7.1.
> I'll tag this to be merged afterwards, but just to make sure
> please ping me right after the release.
>
> Thanks!
>
Got it, thanks Michael, I will ping you that time.

Thanks
Cindy

> On Sun, Jul 24, 2022 at 02:44:44PM +0800, Cindy Lu wrote:
> > These patches introduced the support for configure interrupt
> > These codes are tested on x86_64 and aarch64 platforms.
> > the test scenario is based on vp-vdpa/vdpa_sim /virtio net device, with
> > the irqfd and without irqfd.
> > Tested in virtio-pci bus and virtio-mmio bus
> >
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
> > decouple vq from interrupt setting and misc process
> > fix the bug in virtio_net_handle_rx
> >
> > Change in v7
> > misc fixes from v6
> > decouple vq from interrupt setting and misc process
> > decouple vq from vector use/release process
> > decouple vq from set notifier fd handler process
> > move config_notifier and masked_config_notifier to VirtIODevice
> > fix the bug in virtio_net_handle_rx, add more information
> > add VIRTIO_CONFIG_IRQ_IDX as the queue number for configure interrupt
> >
> > Change in v8
> > misc fixes from v7
> > decouple vq from interrupt setting and misc process
> > decouple vq from vector use/release process
> > decouple vq from set notifier fd handler process
> > move the vhost configure interrupt to vhost_net
> >
> > Change in v9
> > misc fixes from v8
> > address the comments from v8
> >
> > Change in v10
> > fix the hang issue in qtest
> > address the comments from v9
> >
> > Change in v11
> > fix the crash in aarch64 plateform.
> > fix the crash upstream reported
> >
> > Change in v12
> > fix the typo and the comments
> >
> > changes in v13
> > re-send the patches by git-publish
> >
> > changes in v14
> > rebased the code based on upstream
> >
> > Cindy Lu (10):
> >   virtio: introduce macro VIRTIO_CONFIG_IRQ_IDX
> >   virtio-pci: decouple notifier from interrupt process
> >   virtio-pci: decouple the single vector from the interrupt process
> >   vhost: introduce new VhostOps vhost_set_config_call
> >   vhost-vdpa: add support for config interrupt
> >   virtio: add support for configure interrupt
> >   vhost: add support for configure interrupt
> >   virtio-net: add support for configure interrupt
> >   virtio-mmio: add support for configure interrupt
> >   virtio-pci: add support for configure interrupt
> >
> >  hw/display/vhost-user-gpu.c       |  15 ++
> >  hw/net/vhost_net.c                |   9 +
> >  hw/net/virtio-net.c               |  20 ++-
> >  hw/virtio/trace-events            |   1 +
> >  hw/virtio/vhost-user-fs.c         |  16 ++
> >  hw/virtio/vhost-vdpa.c            |   8 +
> >  hw/virtio/vhost-vsock-common.c    |  16 ++
> >  hw/virtio/vhost.c                 |  78 +++++++-
> >  hw/virtio/virtio-crypto.c         |  16 ++
> >  hw/virtio/virtio-mmio.c           |  27 +++
> >  hw/virtio/virtio-pci.c            | 283 +++++++++++++++++++++---------
> >  hw/virtio/virtio.c                |  29 +++
> >  include/hw/virtio/vhost-backend.h |   3 +
> >  include/hw/virtio/vhost.h         |   4 +
> >  include/hw/virtio/virtio-pci.h    |   4 +-
> >  include/hw/virtio/virtio.h        |   7 +
> >  include/net/vhost_net.h           |   2 +
> >  17 files changed, 451 insertions(+), 87 deletions(-)
> >
> > --
> > 2.34.3
> >
>


