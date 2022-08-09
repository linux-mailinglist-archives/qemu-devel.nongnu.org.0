Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE7958D526
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 10:08:57 +0200 (CEST)
Received: from localhost ([::1]:57464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLKIK-0007dT-Ec
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 04:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLKDc-0005BE-9C
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:04:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLKDY-0003wi-7v
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:04:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660032239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KgNDK9GEHg7NBqzZogyAMekAHElhBrI/1CTvSQyURfQ=;
 b=DEtQ5M3W01+tTLPEMMJ4XK0nz040cMZx8j9PvJl109/Vh8LRQYr2F1o69FrIO7z/YjVxT+
 Wtln8cVlv2GPbr8DbL7F1whnloFdjxkgfNMTRNR7mtSA/TS1yVZSw+4HlLJQmA5nyV6hfR
 SLNyhR516h3ecuLReTGlXBlPC0n/HQ4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-VDxKhvyxNdOCKvPXr81jRQ-1; Tue, 09 Aug 2022 04:03:57 -0400
X-MC-Unique: VDxKhvyxNdOCKvPXr81jRQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 dp8-20020a05621409c800b0047b6911be44so1778260qvb.7
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 01:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=KgNDK9GEHg7NBqzZogyAMekAHElhBrI/1CTvSQyURfQ=;
 b=lge5hueMlEu3K8lS7PnW2wMaWepusn7oTSJSo5CujpXgTNHnvSfbNVmsP5ei9sUxnW
 fZr5kOP4Mm/qBfqHtd9GEdQpHz4Ct6M+aFF79Lb4aTWZ/uBaqCPtRqB+moNm3cCASYUQ
 Aeka6ivbWQfKzLVEaYhc+RBoDMlRE4vNdM7e9GceygGhDx3klGNlNBc/yMo+fKnRafax
 cx48vqS4gh7+QpceafaOk48vBIq5FL+Dw2/gU06WoEodj2KtN8f8RfZUXk11Ov7/ByLi
 F+dZsWI9keflyJ+BrnU1GXMYenHvACVXijiiEVnMsDc3xwFUpS6rL56C4BsrfsreRDy0
 KDAQ==
X-Gm-Message-State: ACgBeo0hPoolekA38z4pYt/6k9mzmVWzCAz9u/nbuz/Zjnd2gutVeFFg
 zsqucx2slmQlQIb7AFn1RLI0nh1yRDrGyF8W9C0XpWKlu1p9J9GpLxM2ueUsovaiCOhDoqbZWxM
 5wcYiWuZFXMIDTkRA4mUfGdT3MziH/uw=
X-Received: by 2002:ac8:5f88:0:b0:31e:f6dd:8f13 with SMTP id
 j8-20020ac85f88000000b0031ef6dd8f13mr19212248qta.186.1660032237315; 
 Tue, 09 Aug 2022 01:03:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6a8NfbMuZJJkgk4/rgfJCcWO95F+eFTnCVv3OqUTw1n80jdWtIrWPQNa2SnD22vekf0gesY5LUQtDXXoqXrok=
X-Received: by 2002:ac8:5f88:0:b0:31e:f6dd:8f13 with SMTP id
 j8-20020ac85f88000000b0031ef6dd8f13mr19212226qta.186.1660032237041; Tue, 09
 Aug 2022 01:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220804182852.703398-1-eperezma@redhat.com>
 <20220804182852.703398-9-eperezma@redhat.com>
 <CACGkMEt9GhbKq2vbzJcS50rzCiJCy76fPaEMksJR1s-JqB7yrg@mail.gmail.com>
 <CAJaqyWdp9whO3nRun4k7ZfN0pwqbsjFk_AhBbmXmnFRz7E2ikg@mail.gmail.com>
 <CACGkMEuCDc7nYppJs0xsKwLSntXJgyFz+iAiqugN0eh_uCN7cQ@mail.gmail.com>
In-Reply-To: <CACGkMEuCDc7nYppJs0xsKwLSntXJgyFz+iAiqugN0eh_uCN7cQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 9 Aug 2022 10:03:20 +0200
Message-ID: <CAJaqyWcEjytzQc2TxdyBka17+qmv2U9ZPqu84qgxHqyQskMgxg@mail.gmail.com>
Subject: Re: [PATCH v7 08/12] vdpa: Move command buffers map to start of net
 device
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Eric Blake <eblake@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Markus Armbruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Eli Cohen <eli@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Tue, Aug 9, 2022 at 9:49 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Tue, Aug 9, 2022 at 3:34 PM Eugenio Perez Martin <eperezma@redhat.com>=
 wrote:
> >
> > On Tue, Aug 9, 2022 at 9:04 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Fri, Aug 5, 2022 at 2:29 AM Eugenio P=C3=A9rez <eperezma@redhat.co=
m> wrote:
> > > >
> > > > As this series will reuse them to restore the device state at the e=
nd of
> > > > a migration (or a device start), let's allocate only once at the de=
vice
> > > > start so we don't duplicate their map and unmap.
> > > >
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > ---
> > > >  net/vhost-vdpa.c | 123 ++++++++++++++++++++++---------------------=
----
> > > >  1 file changed, 58 insertions(+), 65 deletions(-)
> > > >
> > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > index 55e8a39a56..2c6a26cca0 100644
> > > > --- a/net/vhost-vdpa.c
> > > > +++ b/net/vhost-vdpa.c
> > > > @@ -263,29 +263,20 @@ static size_t vhost_vdpa_net_cvq_cmd_page_len=
(void)
> > > >      return ROUND_UP(vhost_vdpa_net_cvq_cmd_len(), qemu_real_host_p=
age_size());
> > > >  }
> > > >
> > > > -/** Copy and map a guest buffer. */
> > > > -static bool vhost_vdpa_cvq_map_buf(struct vhost_vdpa *v,
> > > > -                                   const struct iovec *out_data,
> > > > -                                   size_t out_num, size_t data_len=
, void *buf,
> > > > -                                   size_t *written, bool write)
> > > > +/** Map CVQ buffer. */
> > > > +static int vhost_vdpa_cvq_map_buf(struct vhost_vdpa *v, void *buf,=
 size_t size,
> > > > +                                  bool write)
> > > >  {
> > > >      DMAMap map =3D {};
> > > >      int r;
> > > >
> > > > -    if (unlikely(!data_len)) {
> > > > -        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid legnth of %s b=
uffer\n",
> > > > -                      __func__, write ? "in" : "out");
> > > > -        return false;
> > > > -    }
> > > > -
> > > > -    *written =3D iov_to_buf(out_data, out_num, 0, buf, data_len);
> > > >      map.translated_addr =3D (hwaddr)(uintptr_t)buf;
> > > > -    map.size =3D vhost_vdpa_net_cvq_cmd_page_len() - 1;
> > > > +    map.size =3D size - 1;
> > >
> > > Just noticed this, I think I've asked for the reason before but I
> > > don't remember the answer.
> > >
> > > But it looks like a hint of a defect of the current API design.
> > >
> >
> > I can look for it in the mail list, but long story short:
> > vDPA DMA API is *not* inclusive: To map the first page, you map (.iova
> > =3D 0, .size =3D 4096).
> > IOVA tree API has been inclusive forever: To map the first page, you
> > map (.iova =3D 0, .size =3D 4095). If we map with .size =3D 4096, .iova=
 =3D
> > 4096 is considered mapped too.
>
> This looks like a bug.
>
> {.iova=3D0, size=3D0} should be illegal but if I understand you correctly=
,
> it means [0, 1)?
>

On iova_tree it works the way you point here, yes. Maybe the member's
name should have been length or something like that.

On intel_iommu the address *mask* is actually used to fill the size,
not the actual DMA entry length.

For SVQ I think it would be beneficial to declare two different types,
size_inclusive and size_non_inclusive, and check at compile time if
the caller is using the right type. But it's not top priority at the
moment.

Thanks!

> Thanks
>
> >
> > To adapt one to the other would have been an API change even before
> > the introduction of vhost-iova-tree.
> >
> > Thanks!
> >
> >
> > > Thanks
> > >
> > > >      map.perm =3D write ? IOMMU_RW : IOMMU_RO,
> > > >      r =3D vhost_iova_tree_map_alloc(v->iova_tree, &map);
> > > >      if (unlikely(r !=3D IOVA_OK)) {
> > > >          error_report("Cannot map injected element");
> > > > -        return false;
> > > > +        return r;
> > > >      }
> > > >
> > > >      r =3D vhost_vdpa_dma_map(v, map.iova, vhost_vdpa_net_cvq_cmd_p=
age_len(), buf,
> > > > @@ -294,50 +285,58 @@ static bool vhost_vdpa_cvq_map_buf(struct vho=
st_vdpa *v,
> > > >          goto dma_map_err;
> > > >      }
> > > >
> > > > -    return true;
> > > > +    return 0;
> > > >
> > > >  dma_map_err:
> > > >      vhost_iova_tree_remove(v->iova_tree, &map);
> > > > -    return false;
> > > > +    return r;
> > > >  }
> > > >
> > > > -/**
> > > > - * Copy the guest element into a dedicated buffer suitable to be s=
ent to NIC
> > > > - *
> > > > - * @iov: [0] is the out buffer, [1] is the in one
> > > > - */
> > > > -static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
> > > > -                                        VirtQueueElement *elem,
> > > > -                                        struct iovec *iov)
> > > > +static int vhost_vdpa_net_cvq_prepare(NetClientState *nc)
> > > >  {
> > > > -    size_t in_copied;
> > > > -    bool ok;
> > > > +    VhostVDPAState *s;
> > > > +    int r;
> > > >
> > > > -    iov[0].iov_base =3D s->cvq_cmd_out_buffer;
> > > > -    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, elem->out_sg, el=
em->out_num,
> > > > -                                vhost_vdpa_net_cvq_cmd_len(), iov[=
0].iov_base,
> > > > -                                &iov[0].iov_len, false);
> > > > -    if (unlikely(!ok)) {
> > > > -        return false;
> > > > +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > > > +
> > > > +    s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > > +    if (!s->vhost_vdpa.shadow_vqs_enabled) {
> > > > +        return 0;
> > > >      }
> > > >
> > > > -    iov[1].iov_base =3D s->cvq_cmd_in_buffer;
> > > > -    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, NULL, 0,
> > > > -                                sizeof(virtio_net_ctrl_ack), iov[1=
].iov_base,
> > > > -                                &in_copied, true);
> > > > -    if (unlikely(!ok)) {
> > > > +    r =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_out_bu=
ffer,
> > > > +                               vhost_vdpa_net_cvq_cmd_page_len(), =
false);
> > > > +    if (unlikely(r < 0)) {
> > > > +        return r;
> > > > +    }
> > > > +
> > > > +    r =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_in_buf=
fer,
> > > > +                               vhost_vdpa_net_cvq_cmd_page_len(), =
true);
> > > > +    if (unlikely(r < 0)) {
> > > >          vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_bu=
ffer);
> > > > -        return false;
> > > >      }
> > > >
> > > > -    iov[1].iov_len =3D sizeof(virtio_net_ctrl_ack);
> > > > -    return true;
> > > > +    return r;
> > > > +}
> > > > +
> > > > +static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
> > > > +{
> > > > +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > > +
> > > > +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > > > +
> > > > +    if (s->vhost_vdpa.shadow_vqs_enabled) {
> > > > +        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_bu=
ffer);
> > > > +        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_in_buf=
fer);
> > > > +    }
> > > >  }
> > > >
> > > >  static NetClientInfo net_vhost_vdpa_cvq_info =3D {
> > > >      .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
> > > >      .size =3D sizeof(VhostVDPAState),
> > > >      .receive =3D vhost_vdpa_receive,
> > > > +    .prepare =3D vhost_vdpa_net_cvq_prepare,
> > > > +    .stop =3D vhost_vdpa_net_cvq_stop,
> > > >      .cleanup =3D vhost_vdpa_cleanup,
> > > >      .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
> > > >      .has_ufo =3D vhost_vdpa_has_ufo,
> > > > @@ -348,19 +347,17 @@ static NetClientInfo net_vhost_vdpa_cvq_info =
=3D {
> > > >   * Do not forward commands not supported by SVQ. Otherwise, the de=
vice could
> > > >   * accept it and qemu would not know how to update the device mode=
l.
> > > >   */
> > > > -static bool vhost_vdpa_net_cvq_validate_cmd(const struct iovec *ou=
t,
> > > > -                                            size_t out_num)
> > > > +static bool vhost_vdpa_net_cvq_validate_cmd(const void *out_buf, s=
ize_t len)
> > > >  {
> > > >      struct virtio_net_ctrl_hdr ctrl;
> > > > -    size_t n;
> > > >
> > > > -    n =3D iov_to_buf(out, out_num, 0, &ctrl, sizeof(ctrl));
> > > > -    if (unlikely(n < sizeof(ctrl))) {
> > > > +    if (unlikely(len < sizeof(ctrl))) {
> > > >          qemu_log_mask(LOG_GUEST_ERROR,
> > > > -                      "%s: invalid legnth of out buffer %zu\n", __=
func__, n);
> > > > +                      "%s: invalid legnth of out buffer %zu\n", __=
func__, len);
> > > >          return false;
> > > >      }
> > > >
> > > > +    memcpy(&ctrl, out_buf, sizeof(ctrl));
> > > >      switch (ctrl.class) {
> > > >      case VIRTIO_NET_CTRL_MAC:
> > > >          switch (ctrl.cmd) {
> > > > @@ -392,10 +389,14 @@ static int vhost_vdpa_net_handle_ctrl_avail(V=
hostShadowVirtqueue *svq,
> > > >      VhostVDPAState *s =3D opaque;
> > > >      size_t in_len, dev_written;
> > > >      virtio_net_ctrl_ack status =3D VIRTIO_NET_ERR;
> > > > -    /* out and in buffers sent to the device */
> > > > -    struct iovec dev_buffers[2] =3D {
> > > > -        { .iov_base =3D s->cvq_cmd_out_buffer },
> > > > -        { .iov_base =3D s->cvq_cmd_in_buffer },
> > > > +    /* Out buffer sent to both the vdpa device and the device mode=
l */
> > > > +    struct iovec out =3D {
> > > > +        .iov_base =3D s->cvq_cmd_out_buffer,
> > > > +    };
> > > > +    /* In buffer sent to the device */
> > > > +    const struct iovec dev_in =3D {
> > > > +        .iov_base =3D s->cvq_cmd_in_buffer,
> > > > +        .iov_len =3D sizeof(virtio_net_ctrl_ack),
> > > >      };
> > > >      /* in buffer used for device model */
> > > >      const struct iovec in =3D {
> > > > @@ -405,17 +406,15 @@ static int vhost_vdpa_net_handle_ctrl_avail(V=
hostShadowVirtqueue *svq,
> > > >      int r =3D -EINVAL;
> > > >      bool ok;
> > > >
> > > > -    ok =3D vhost_vdpa_net_cvq_map_elem(s, elem, dev_buffers);
> > > > -    if (unlikely(!ok)) {
> > > > -        goto out;
> > > > -    }
> > > > -
> > > > -    ok =3D vhost_vdpa_net_cvq_validate_cmd(&dev_buffers[0], 1);
> > > > +    out.iov_len =3D iov_to_buf(elem->out_sg, elem->out_num, 0,
> > > > +                             s->cvq_cmd_out_buffer,
> > > > +                             vhost_vdpa_net_cvq_cmd_len());
> > > > +    ok =3D vhost_vdpa_net_cvq_validate_cmd(s->cvq_cmd_out_buffer, =
out.iov_len);
> > > >      if (unlikely(!ok)) {
> > > >          goto out;
> > > >      }
> > > >
> > > > -    r =3D vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], =
1, elem);
> > > > +    r =3D vhost_svq_add(svq, &out, 1, &dev_in, 1, elem);
> > > >      if (unlikely(r !=3D 0)) {
> > > >          if (unlikely(r =3D=3D -ENOSPC)) {
> > > >              qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device=
 queue\n",
> > > > @@ -435,13 +434,13 @@ static int vhost_vdpa_net_handle_ctrl_avail(V=
hostShadowVirtqueue *svq,
> > > >          goto out;
> > > >      }
> > > >
> > > > -    memcpy(&status, dev_buffers[1].iov_base, sizeof(status));
> > > > +    memcpy(&status, s->cvq_cmd_in_buffer, sizeof(status));
> > > >      if (status !=3D VIRTIO_NET_OK) {
> > > >          goto out;
> > > >      }
> > > >
> > > >      status =3D VIRTIO_NET_ERR;
> > > > -    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, dev_buffers, 1);
> > > > +    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, &out, 1);
> > > >      if (status !=3D VIRTIO_NET_OK) {
> > > >          error_report("Bad CVQ processing in model");
> > > >      }
> > > > @@ -454,12 +453,6 @@ out:
> > > >      }
> > > >      vhost_svq_push_elem(svq, elem, MIN(in_len, sizeof(status)));
> > > >      g_free(elem);
> > > > -    if (dev_buffers[0].iov_base) {
> > > > -        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[0].io=
v_base);
> > > > -    }
> > > > -    if (dev_buffers[1].iov_base) {
> > > > -        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[1].io=
v_base);
> > > > -    }
> > > >      return r;
> > > >  }
> > > >
> > > > --
> > > > 2.31.1
> > > >
> > >
> >
>


