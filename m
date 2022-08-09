Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3722158D4C0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 09:39:36 +0200 (CEST)
Received: from localhost ([::1]:36078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLJpu-0000TG-Q4
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 03:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLJlD-0003hF-GT
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:34:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLJlA-00084Q-5Z
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 03:34:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660030479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/I5Dublk7gUn5wFiw6piaPnmaVvHQqYAnbNKoQjek/A=;
 b=E65OAI2naG2eTk0bin3D1Jett+0UeDd+16ZFS8V3ptmjAA+8244WVK8FBgDhF1P5Qat98M
 ySi/PWikMs3/0y5dweUvPKcMNGW39DdppDStrnSiAxtYblcoPyk6TcbrmG+igZrceF0OH+
 HkQJpzfDO90pRO22W2167QQR9MlU4G0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-5b-uXzEPP2qRrWThn10ErQ-1; Tue, 09 Aug 2022 03:34:35 -0400
X-MC-Unique: 5b-uXzEPP2qRrWThn10ErQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 dp8-20020a05621409c800b0047b6911be44so1747464qvb.7
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 00:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=/I5Dublk7gUn5wFiw6piaPnmaVvHQqYAnbNKoQjek/A=;
 b=f2W+iXaN7EEjeGiQL6diiLaDQqmFeeHkpgDeZ5K9iNPtmORQoRDkvguoG9HLCnwwg4
 aLI7UvFmrKnjgr+AunYj2rXcjWm6FiuyA7aj2TXx4FrcaTASTGvT7U6IAqEwz+ECirlO
 rvPWvMzffQgym/ZR4LYYylk69Ax0AIUvojxoZbmgu5R9/ntZRSPAkFp7SPftXFnA1HZ0
 B1jFEvdYO2WbDPIWy56nhGBNEUlQFtO4hmDlXnfzTQQ+dMm+T9/AkPdwTzBmcf3zP74t
 GvF60q+tvi0OZy9oqe9WmS0T4tlJSNvDP9Q7Ma6LKx2if8xF3Km6jCTOJk7jkkEjE4AU
 O0yw==
X-Gm-Message-State: ACgBeo1ffbpR3nUNH+pxuUMPjeIOJXnN2xRz42MUPQjC4TKkROJsAOPm
 zwXpF2Y38oPz1BwbRhA2f906xrpv7/UkKnxwXqYlcbdnlPHE9NgWcv1oMCe/woSv1T+lESCgnyW
 qoQMx84F9FBroKagcSw8xsLJs/kaTyhM=
X-Received: by 2002:a05:622a:110f:b0:31e:e0ae:a734 with SMTP id
 e15-20020a05622a110f00b0031ee0aea734mr19211382qty.495.1660030475222; 
 Tue, 09 Aug 2022 00:34:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6swASXizpp9SJ/qO7MA5juqlq9eivPPVgnCNjT00E8uB4eO0DEZmJP38wCvg/3r/S60U7cZfsfwch3fd5ci1M=
X-Received: by 2002:a05:622a:110f:b0:31e:e0ae:a734 with SMTP id
 e15-20020a05622a110f00b0031ee0aea734mr19211363qty.495.1660030474937; Tue, 09
 Aug 2022 00:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220804182852.703398-1-eperezma@redhat.com>
 <20220804182852.703398-9-eperezma@redhat.com>
 <CACGkMEt9GhbKq2vbzJcS50rzCiJCy76fPaEMksJR1s-JqB7yrg@mail.gmail.com>
In-Reply-To: <CACGkMEt9GhbKq2vbzJcS50rzCiJCy76fPaEMksJR1s-JqB7yrg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 9 Aug 2022 09:33:58 +0200
Message-ID: <CAJaqyWdp9whO3nRun4k7ZfN0pwqbsjFk_AhBbmXmnFRz7E2ikg@mail.gmail.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Tue, Aug 9, 2022 at 9:04 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Aug 5, 2022 at 2:29 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
> >
> > As this series will reuse them to restore the device state at the end o=
f
> > a migration (or a device start), let's allocate only once at the device
> > start so we don't duplicate their map and unmap.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  net/vhost-vdpa.c | 123 ++++++++++++++++++++++-------------------------
> >  1 file changed, 58 insertions(+), 65 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 55e8a39a56..2c6a26cca0 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -263,29 +263,20 @@ static size_t vhost_vdpa_net_cvq_cmd_page_len(voi=
d)
> >      return ROUND_UP(vhost_vdpa_net_cvq_cmd_len(), qemu_real_host_page_=
size());
> >  }
> >
> > -/** Copy and map a guest buffer. */
> > -static bool vhost_vdpa_cvq_map_buf(struct vhost_vdpa *v,
> > -                                   const struct iovec *out_data,
> > -                                   size_t out_num, size_t data_len, vo=
id *buf,
> > -                                   size_t *written, bool write)
> > +/** Map CVQ buffer. */
> > +static int vhost_vdpa_cvq_map_buf(struct vhost_vdpa *v, void *buf, siz=
e_t size,
> > +                                  bool write)
> >  {
> >      DMAMap map =3D {};
> >      int r;
> >
> > -    if (unlikely(!data_len)) {
> > -        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid legnth of %s buffe=
r\n",
> > -                      __func__, write ? "in" : "out");
> > -        return false;
> > -    }
> > -
> > -    *written =3D iov_to_buf(out_data, out_num, 0, buf, data_len);
> >      map.translated_addr =3D (hwaddr)(uintptr_t)buf;
> > -    map.size =3D vhost_vdpa_net_cvq_cmd_page_len() - 1;
> > +    map.size =3D size - 1;
>
> Just noticed this, I think I've asked for the reason before but I
> don't remember the answer.
>
> But it looks like a hint of a defect of the current API design.
>

I can look for it in the mail list, but long story short:
vDPA DMA API is *not* inclusive: To map the first page, you map (.iova
=3D 0, .size =3D 4096).
IOVA tree API has been inclusive forever: To map the first page, you
map (.iova =3D 0, .size =3D 4095). If we map with .size =3D 4096, .iova =3D
4096 is considered mapped too.

To adapt one to the other would have been an API change even before
the introduction of vhost-iova-tree.

Thanks!


> Thanks
>
> >      map.perm =3D write ? IOMMU_RW : IOMMU_RO,
> >      r =3D vhost_iova_tree_map_alloc(v->iova_tree, &map);
> >      if (unlikely(r !=3D IOVA_OK)) {
> >          error_report("Cannot map injected element");
> > -        return false;
> > +        return r;
> >      }
> >
> >      r =3D vhost_vdpa_dma_map(v, map.iova, vhost_vdpa_net_cvq_cmd_page_=
len(), buf,
> > @@ -294,50 +285,58 @@ static bool vhost_vdpa_cvq_map_buf(struct vhost_v=
dpa *v,
> >          goto dma_map_err;
> >      }
> >
> > -    return true;
> > +    return 0;
> >
> >  dma_map_err:
> >      vhost_iova_tree_remove(v->iova_tree, &map);
> > -    return false;
> > +    return r;
> >  }
> >
> > -/**
> > - * Copy the guest element into a dedicated buffer suitable to be sent =
to NIC
> > - *
> > - * @iov: [0] is the out buffer, [1] is the in one
> > - */
> > -static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
> > -                                        VirtQueueElement *elem,
> > -                                        struct iovec *iov)
> > +static int vhost_vdpa_net_cvq_prepare(NetClientState *nc)
> >  {
> > -    size_t in_copied;
> > -    bool ok;
> > +    VhostVDPAState *s;
> > +    int r;
> >
> > -    iov[0].iov_base =3D s->cvq_cmd_out_buffer;
> > -    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, elem->out_sg, elem->=
out_num,
> > -                                vhost_vdpa_net_cvq_cmd_len(), iov[0].i=
ov_base,
> > -                                &iov[0].iov_len, false);
> > -    if (unlikely(!ok)) {
> > -        return false;
> > +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > +
> > +    s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > +    if (!s->vhost_vdpa.shadow_vqs_enabled) {
> > +        return 0;
> >      }
> >
> > -    iov[1].iov_base =3D s->cvq_cmd_in_buffer;
> > -    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, NULL, 0,
> > -                                sizeof(virtio_net_ctrl_ack), iov[1].io=
v_base,
> > -                                &in_copied, true);
> > -    if (unlikely(!ok)) {
> > +    r =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer=
,
> > +                               vhost_vdpa_net_cvq_cmd_page_len(), fals=
e);
> > +    if (unlikely(r < 0)) {
> > +        return r;
> > +    }
> > +
> > +    r =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_in_buffer,
> > +                               vhost_vdpa_net_cvq_cmd_page_len(), true=
);
> > +    if (unlikely(r < 0)) {
> >          vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer=
);
> > -        return false;
> >      }
> >
> > -    iov[1].iov_len =3D sizeof(virtio_net_ctrl_ack);
> > -    return true;
> > +    return r;
> > +}
> > +
> > +static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
> > +{
> > +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > +
> > +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > +
> > +    if (s->vhost_vdpa.shadow_vqs_enabled) {
> > +        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer=
);
> > +        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_in_buffer)=
;
> > +    }
> >  }
> >
> >  static NetClientInfo net_vhost_vdpa_cvq_info =3D {
> >      .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
> >      .size =3D sizeof(VhostVDPAState),
> >      .receive =3D vhost_vdpa_receive,
> > +    .prepare =3D vhost_vdpa_net_cvq_prepare,
> > +    .stop =3D vhost_vdpa_net_cvq_stop,
> >      .cleanup =3D vhost_vdpa_cleanup,
> >      .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
> >      .has_ufo =3D vhost_vdpa_has_ufo,
> > @@ -348,19 +347,17 @@ static NetClientInfo net_vhost_vdpa_cvq_info =3D =
{
> >   * Do not forward commands not supported by SVQ. Otherwise, the device=
 could
> >   * accept it and qemu would not know how to update the device model.
> >   */
> > -static bool vhost_vdpa_net_cvq_validate_cmd(const struct iovec *out,
> > -                                            size_t out_num)
> > +static bool vhost_vdpa_net_cvq_validate_cmd(const void *out_buf, size_=
t len)
> >  {
> >      struct virtio_net_ctrl_hdr ctrl;
> > -    size_t n;
> >
> > -    n =3D iov_to_buf(out, out_num, 0, &ctrl, sizeof(ctrl));
> > -    if (unlikely(n < sizeof(ctrl))) {
> > +    if (unlikely(len < sizeof(ctrl))) {
> >          qemu_log_mask(LOG_GUEST_ERROR,
> > -                      "%s: invalid legnth of out buffer %zu\n", __func=
__, n);
> > +                      "%s: invalid legnth of out buffer %zu\n", __func=
__, len);
> >          return false;
> >      }
> >
> > +    memcpy(&ctrl, out_buf, sizeof(ctrl));
> >      switch (ctrl.class) {
> >      case VIRTIO_NET_CTRL_MAC:
> >          switch (ctrl.cmd) {
> > @@ -392,10 +389,14 @@ static int vhost_vdpa_net_handle_ctrl_avail(Vhost=
ShadowVirtqueue *svq,
> >      VhostVDPAState *s =3D opaque;
> >      size_t in_len, dev_written;
> >      virtio_net_ctrl_ack status =3D VIRTIO_NET_ERR;
> > -    /* out and in buffers sent to the device */
> > -    struct iovec dev_buffers[2] =3D {
> > -        { .iov_base =3D s->cvq_cmd_out_buffer },
> > -        { .iov_base =3D s->cvq_cmd_in_buffer },
> > +    /* Out buffer sent to both the vdpa device and the device model */
> > +    struct iovec out =3D {
> > +        .iov_base =3D s->cvq_cmd_out_buffer,
> > +    };
> > +    /* In buffer sent to the device */
> > +    const struct iovec dev_in =3D {
> > +        .iov_base =3D s->cvq_cmd_in_buffer,
> > +        .iov_len =3D sizeof(virtio_net_ctrl_ack),
> >      };
> >      /* in buffer used for device model */
> >      const struct iovec in =3D {
> > @@ -405,17 +406,15 @@ static int vhost_vdpa_net_handle_ctrl_avail(Vhost=
ShadowVirtqueue *svq,
> >      int r =3D -EINVAL;
> >      bool ok;
> >
> > -    ok =3D vhost_vdpa_net_cvq_map_elem(s, elem, dev_buffers);
> > -    if (unlikely(!ok)) {
> > -        goto out;
> > -    }
> > -
> > -    ok =3D vhost_vdpa_net_cvq_validate_cmd(&dev_buffers[0], 1);
> > +    out.iov_len =3D iov_to_buf(elem->out_sg, elem->out_num, 0,
> > +                             s->cvq_cmd_out_buffer,
> > +                             vhost_vdpa_net_cvq_cmd_len());
> > +    ok =3D vhost_vdpa_net_cvq_validate_cmd(s->cvq_cmd_out_buffer, out.=
iov_len);
> >      if (unlikely(!ok)) {
> >          goto out;
> >      }
> >
> > -    r =3D vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1], 1, e=
lem);
> > +    r =3D vhost_svq_add(svq, &out, 1, &dev_in, 1, elem);
> >      if (unlikely(r !=3D 0)) {
> >          if (unlikely(r =3D=3D -ENOSPC)) {
> >              qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on device que=
ue\n",
> > @@ -435,13 +434,13 @@ static int vhost_vdpa_net_handle_ctrl_avail(Vhost=
ShadowVirtqueue *svq,
> >          goto out;
> >      }
> >
> > -    memcpy(&status, dev_buffers[1].iov_base, sizeof(status));
> > +    memcpy(&status, s->cvq_cmd_in_buffer, sizeof(status));
> >      if (status !=3D VIRTIO_NET_OK) {
> >          goto out;
> >      }
> >
> >      status =3D VIRTIO_NET_ERR;
> > -    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, dev_buffers, 1);
> > +    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, &out, 1);
> >      if (status !=3D VIRTIO_NET_OK) {
> >          error_report("Bad CVQ processing in model");
> >      }
> > @@ -454,12 +453,6 @@ out:
> >      }
> >      vhost_svq_push_elem(svq, elem, MIN(in_len, sizeof(status)));
> >      g_free(elem);
> > -    if (dev_buffers[0].iov_base) {
> > -        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[0].iov_ba=
se);
> > -    }
> > -    if (dev_buffers[1].iov_base) {
> > -        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[1].iov_ba=
se);
> > -    }
> >      return r;
> >  }
> >
> > --
> > 2.31.1
> >
>


