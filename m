Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AC062439A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 14:49:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot7vb-0001OE-30; Thu, 10 Nov 2022 08:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ot7uu-0001J9-1l
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 08:48:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ot7ur-0006Vv-Eg
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 08:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668088103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n2vKrhn0W6zmDQL4p2cy55bsV2E6VIdPzjBOi6hj00M=;
 b=IYf7Mz6JzrFQvaCSVUvY4y/1x89xf+3zR70XtBCRkV2uBY9XV+YcngnbG0tWZpI6u5lbXv
 Vta3Zd3bn18Lg6ZmwGYrxeE2gQKw//OJXRB03w5Lo/5ZEVacd9QoRv8pTGR1rAfrxYryrM
 ankG9QPkh4Hpe4JYk5aJLiZA2YAMk5A=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-439-tpmQwyJHMMWMvFP2qAgMvA-1; Thu, 10 Nov 2022 08:48:21 -0500
X-MC-Unique: tpmQwyJHMMWMvFP2qAgMvA-1
Received: by mail-pj1-f70.google.com with SMTP id
 v10-20020a17090a7c0a00b00215deac75b4so1139762pjf.3
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 05:48:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n2vKrhn0W6zmDQL4p2cy55bsV2E6VIdPzjBOi6hj00M=;
 b=WQdTHWyO1lJdc/9bwl5+RIWkupgD64A3++zVU1goA0rNHjVpuXqjfCfU6nyAKZfQr+
 dnw93t0HQVu3PIfQmQ7tHamxNO8Jk6qXc6dU34KQ4IhAFrLacxptizfVQ1TOoGzC+p16
 RClNGBOcUGYMXPvabrDqjw8wvtHs6dRgEIsIab0RogZ7FJ7+Rei1yNTEW+T0CoSPc+6L
 joz1RIUkHavKPvAg8pqy/fTLHnl3xRmcOvA3mGl3GxBeOsX6pHbyK7Z62ifNgBDMa+VY
 VJSGubFhsnS7+Gu4qFdxVbK3IeRNlz7ZJp4iTxh0eVEbwdGd6vxottTgyH92m6OKk4mX
 JyBA==
X-Gm-Message-State: ACrzQf28RPoGH+r6GHh2LqGyASfxZl5vwnf28t8SGQ2Qh8XWQ4IVA/kS
 KY/asotr3AA1EcWLXHVUBp4U50obO7e5+M1m+Nn7NRXvD4v0/k2Icu4EM1aMpCRJlunFkAKdVFw
 foZKUfx9RFJV4fGbKLyZrXhfZOEAv/jw=
X-Received: by 2002:a63:40c4:0:b0:470:18d5:e914 with SMTP id
 n187-20020a6340c4000000b0047018d5e914mr35251823pga.58.1668088100731; 
 Thu, 10 Nov 2022 05:48:20 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6kCjm98mwDiswamvSe9FxW3UTuG/9V2DnQlWH0uiqVqjU3TVFAbI6lMN6jpeP4rKjnDw6drD6Nf4+AENVVmfs=
X-Received: by 2002:a63:40c4:0:b0:470:18d5:e914 with SMTP id
 n187-20020a6340c4000000b0047018d5e914mr35251792pga.58.1668088100439; Thu, 10
 Nov 2022 05:48:20 -0800 (PST)
MIME-Version: 1.0
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221108170755.92768-10-eperezma@redhat.com>
 <CACGkMEsr=fpbbOpUBHawt5DR+nTWcK1uMzXgorEcbijso1wsMQ@mail.gmail.com>
In-Reply-To: <CACGkMEsr=fpbbOpUBHawt5DR+nTWcK1uMzXgorEcbijso1wsMQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 10 Nov 2022 14:47:44 +0100
Message-ID: <CAJaqyWemKoRNd6_uvFc79qYe+7pbavJSjnZuczxk5uxSZZdZ2Q@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] vdpa: Add listener_shadow_vq to vhost_vdpa
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Parav Pandit <parav@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, kvm@vger.kernel.org, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Nov 10, 2022 at 7:01 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Nov 9, 2022 at 1:08 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
> >
> > The memory listener that thells the device how to convert GPA to qemu's
> > va is registered against CVQ vhost_vdpa. This series try to map the
> > memory listener translations to ASID 0, while it maps the CVQ ones to
> > ASID 1.
> >
> > Let's tell the listener if it needs to register them on iova tree or
> > not.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> > v5: Solve conflict about vhost_iova_tree_remove accepting mem_region by
> >     value.
> > ---
> >  include/hw/virtio/vhost-vdpa.h | 2 ++
> >  hw/virtio/vhost-vdpa.c         | 6 +++---
> >  net/vhost-vdpa.c               | 1 +
> >  3 files changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index 6560bb9d78..0c3ed2d69b 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -34,6 +34,8 @@ typedef struct vhost_vdpa {
> >      struct vhost_vdpa_iova_range iova_range;
> >      uint64_t acked_features;
> >      bool shadow_vqs_enabled;
> > +    /* The listener must send iova tree addresses, not GPA */
> > +    bool listener_shadow_vq;
> >      /* IOVA mapping used by the Shadow Virtqueue */
> >      VhostIOVATree *iova_tree;
> >      GPtrArray *shadow_vqs;
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 8fd32ba32b..e3914fa40e 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -220,7 +220,7 @@ static void vhost_vdpa_listener_region_add(MemoryLi=
stener *listener,
> >                                           vaddr, section->readonly);
> >
> >      llsize =3D int128_sub(llend, int128_make64(iova));
> > -    if (v->shadow_vqs_enabled) {
> > +    if (v->listener_shadow_vq) {
> >          int r;
> >
> >          mem_region.translated_addr =3D (hwaddr)(uintptr_t)vaddr,
> > @@ -247,7 +247,7 @@ static void vhost_vdpa_listener_region_add(MemoryLi=
stener *listener,
> >      return;
> >
> >  fail_map:
> > -    if (v->shadow_vqs_enabled) {
> > +    if (v->listener_shadow_vq) {
> >          vhost_iova_tree_remove(v->iova_tree, mem_region);
> >      }
> >
> > @@ -292,7 +292,7 @@ static void vhost_vdpa_listener_region_del(MemoryLi=
stener *listener,
> >
> >      llsize =3D int128_sub(llend, int128_make64(iova));
> >
> > -    if (v->shadow_vqs_enabled) {
> > +    if (v->listener_shadow_vq) {
> >          const DMAMap *result;
> >          const void *vaddr =3D memory_region_get_ram_ptr(section->mr) +
> >              section->offset_within_region +
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 85a318faca..02780ee37b 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -570,6 +570,7 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >      s->vhost_vdpa.index =3D queue_pair_index;
> >      s->always_svq =3D svq;
> >      s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > +    s->vhost_vdpa.listener_shadow_vq =3D svq;
>
> Any chance those above two can differ?
>

If CVQ is shadowed but data VQs are not, shadow_vqs_enabled is true
but listener_shadow_vq is not.

It is more clear in the next commit, where only shadow_vqs_enabled is
set to true at vhost_vdpa_net_cvq_start.

Thanks!

> Thanks
>
> >      s->vhost_vdpa.iova_tree =3D iova_tree;
> >      if (!is_datapath) {
> >          s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_page_si=
ze(),
> > --
> > 2.31.1
> >
>


