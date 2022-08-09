Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF2458D536
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 10:15:43 +0200 (CEST)
Received: from localhost ([::1]:34170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLKOq-0002zu-T0
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 04:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLKMl-0000vo-LX
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:13:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLKMi-0005RF-VF
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660032808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lyI571NzqUFiszPkM8KuAfE+Xdeagc96fCndtu2KXxw=;
 b=aV7cu2td79tYOBDdL+c+v7ja4+s+C7XXMzLr3LTyiSikv9UFY3GUifov2JTx2JZIom6Y95
 iIQ7X7V4feORMu+tGOWjuMLKloWf9FkwMEi4ml8OQdnv9SiRErlMTGq4/pVzkKB2avy7z8
 p6lm5pNryXRQzozriV+zaGjKzH/mkmA=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-ciI7t5iRPU64d5pFn9jnkw-1; Tue, 09 Aug 2022 04:13:27 -0400
X-MC-Unique: ciI7t5iRPU64d5pFn9jnkw-1
Received: by mail-lf1-f69.google.com with SMTP id
 z3-20020a19f703000000b0048ae517ee7bso2597053lfe.14
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 01:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lyI571NzqUFiszPkM8KuAfE+Xdeagc96fCndtu2KXxw=;
 b=wk9X4uPo67Un1M7Fe2OHUhsIttIqIgEej0BB+bcY2fbeft8vtjOobuhfsV5UWIRRRv
 ji1RhTgsDeIqxxfJvAI7Dr7fESVFQ0dnaMZv7jBrfiWKBexUfGFHeHP5/mU8bCvK9Vof
 QtvM2/mrNQrQCUkCx6rM4D08bK0I2UWSGN4kgBbRtxoyAnFbcfrvm/X4+WYmRHNP85RU
 KRG2rvGtBMGhmukcHZq3kGk8mgUewmtZpmtAkSvr9BUmiHigqV6HFpJtAC2k/YGpN/RE
 CcTmOdoBmk5a6cy9rs/1zePY5t1cCQNP6Y5v3WfNPUCVKqBGDZo7i6ODS6LQx4AXQVTT
 j4rg==
X-Gm-Message-State: ACgBeo2ZfLoR/ZGDLYZnOr1xxIXzamEKetS+u9IUTSZgAR389anhtTr4
 oFKcUhjc7ev8kMVU6YFPRMfJQdsQnXZF8QgSTZbpKEyj+CGMuXS/xTV/Lj+6fxQL5gXaa+Hstbt
 bw0yLm7DLtgVyN2Yhkidp3c064FMTleU=
X-Received: by 2002:a05:651c:c98:b0:25e:6894:650 with SMTP id
 bz24-20020a05651c0c9800b0025e68940650mr7144880ljb.487.1660032805305; 
 Tue, 09 Aug 2022 01:13:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7IhHKRxZVh3WeqycNIPVMF+A7gLvRvNIeoTgSPuxJksXxmmYkF6kbzpOt9XpjTZSRekvn5zVDUZx0naSAZVb4=
X-Received: by 2002:a05:651c:c98:b0:25e:6894:650 with SMTP id
 bz24-20020a05651c0c9800b0025e68940650mr7144867ljb.487.1660032805011; Tue, 09
 Aug 2022 01:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220804182852.703398-1-eperezma@redhat.com>
 <20220804182852.703398-9-eperezma@redhat.com>
 <CACGkMEt9GhbKq2vbzJcS50rzCiJCy76fPaEMksJR1s-JqB7yrg@mail.gmail.com>
 <CAJaqyWdp9whO3nRun4k7ZfN0pwqbsjFk_AhBbmXmnFRz7E2ikg@mail.gmail.com>
 <CACGkMEuCDc7nYppJs0xsKwLSntXJgyFz+iAiqugN0eh_uCN7cQ@mail.gmail.com>
 <CAJaqyWcEjytzQc2TxdyBka17+qmv2U9ZPqu84qgxHqyQskMgxg@mail.gmail.com>
In-Reply-To: <CAJaqyWcEjytzQc2TxdyBka17+qmv2U9ZPqu84qgxHqyQskMgxg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 9 Aug 2022 16:13:13 +0800
Message-ID: <CACGkMEu5GL1yuWo8d7jd7S1jZ2y=TjPr6QXsO-ZBGL6_bAMDXA@mail.gmail.com>
Subject: Re: [PATCH v7 08/12] vdpa: Move command buffers map to start of net
 device
To: Eugenio Perez Martin <eperezma@redhat.com>
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

On Tue, Aug 9, 2022 at 4:04 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Tue, Aug 9, 2022 at 9:49 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Tue, Aug 9, 2022 at 3:34 PM Eugenio Perez Martin <eperezma@redhat.co=
m> wrote:
> > >
> > > On Tue, Aug 9, 2022 at 9:04 AM Jason Wang <jasowang@redhat.com> wrote=
:
> > > >
> > > > On Fri, Aug 5, 2022 at 2:29 AM Eugenio P=C3=A9rez <eperezma@redhat.=
com> wrote:
> > > > >
> > > > > As this series will reuse them to restore the device state at the=
 end of
> > > > > a migration (or a device start), let's allocate only once at the =
device
> > > > > start so we don't duplicate their map and unmap.
> > > > >
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > ---
> > > > >  net/vhost-vdpa.c | 123 ++++++++++++++++++++++-------------------=
------
> > > > >  1 file changed, 58 insertions(+), 65 deletions(-)
> > > > >
> > > > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > > > index 55e8a39a56..2c6a26cca0 100644
> > > > > --- a/net/vhost-vdpa.c
> > > > > +++ b/net/vhost-vdpa.c
> > > > > @@ -263,29 +263,20 @@ static size_t vhost_vdpa_net_cvq_cmd_page_l=
en(void)
> > > > >      return ROUND_UP(vhost_vdpa_net_cvq_cmd_len(), qemu_real_host=
_page_size());
> > > > >  }
> > > > >
> > > > > -/** Copy and map a guest buffer. */
> > > > > -static bool vhost_vdpa_cvq_map_buf(struct vhost_vdpa *v,
> > > > > -                                   const struct iovec *out_data,
> > > > > -                                   size_t out_num, size_t data_l=
en, void *buf,
> > > > > -                                   size_t *written, bool write)
> > > > > +/** Map CVQ buffer. */
> > > > > +static int vhost_vdpa_cvq_map_buf(struct vhost_vdpa *v, void *bu=
f, size_t size,
> > > > > +                                  bool write)
> > > > >  {
> > > > >      DMAMap map =3D {};
> > > > >      int r;
> > > > >
> > > > > -    if (unlikely(!data_len)) {
> > > > > -        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid legnth of %s=
 buffer\n",
> > > > > -                      __func__, write ? "in" : "out");
> > > > > -        return false;
> > > > > -    }
> > > > > -
> > > > > -    *written =3D iov_to_buf(out_data, out_num, 0, buf, data_len)=
;
> > > > >      map.translated_addr =3D (hwaddr)(uintptr_t)buf;
> > > > > -    map.size =3D vhost_vdpa_net_cvq_cmd_page_len() - 1;
> > > > > +    map.size =3D size - 1;
> > > >
> > > > Just noticed this, I think I've asked for the reason before but I
> > > > don't remember the answer.
> > > >
> > > > But it looks like a hint of a defect of the current API design.
> > > >
> > >
> > > I can look for it in the mail list, but long story short:
> > > vDPA DMA API is *not* inclusive: To map the first page, you map (.iov=
a
> > > =3D 0, .size =3D 4096).
> > > IOVA tree API has been inclusive forever: To map the first page, you
> > > map (.iova =3D 0, .size =3D 4095). If we map with .size =3D 4096, .io=
va =3D
> > > 4096 is considered mapped too.
> >
> > This looks like a bug.
> >
> > {.iova=3D0, size=3D0} should be illegal but if I understand you correct=
ly,
> > it means [0, 1)?
> >
>
> On iova_tree it works the way you point here, yes. Maybe the member's
> name should have been length or something like that.
>
> On intel_iommu the address *mask* is actually used to fill the size,
> not the actual DMA entry length.
>
> For SVQ I think it would be beneficial to declare two different types,
> size_inclusive and size_non_inclusive, and check at compile time if
> the caller is using the right type.

That's sub-optimal, we'd better go with a single type of size or
switch to use [start, end].

> But it's not top priority at the
> moment.

Yes, let's optimize it on top.

Thanks

>
> Thanks!
>
> > Thanks
> >
> > >
> > > To adapt one to the other would have been an API change even before
> > > the introduction of vhost-iova-tree.
> > >
> > > Thanks!
> > >
> > >
> > > > Thanks
> > > >
> > > > >      map.perm =3D write ? IOMMU_RW : IOMMU_RO,
> > > > >      r =3D vhost_iova_tree_map_alloc(v->iova_tree, &map);
> > > > >      if (unlikely(r !=3D IOVA_OK)) {
> > > > >          error_report("Cannot map injected element");
> > > > > -        return false;
> > > > > +        return r;
> > > > >      }
> > > > >
> > > > >      r =3D vhost_vdpa_dma_map(v, map.iova, vhost_vdpa_net_cvq_cmd=
_page_len(), buf,
> > > > > @@ -294,50 +285,58 @@ static bool vhost_vdpa_cvq_map_buf(struct v=
host_vdpa *v,
> > > > >          goto dma_map_err;
> > > > >      }
> > > > >
> > > > > -    return true;
> > > > > +    return 0;
> > > > >
> > > > >  dma_map_err:
> > > > >      vhost_iova_tree_remove(v->iova_tree, &map);
> > > > > -    return false;
> > > > > +    return r;
> > > > >  }
> > > > >
> > > > > -/**
> > > > > - * Copy the guest element into a dedicated buffer suitable to be=
 sent to NIC
> > > > > - *
> > > > > - * @iov: [0] is the out buffer, [1] is the in one
> > > > > - */
> > > > > -static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
> > > > > -                                        VirtQueueElement *elem,
> > > > > -                                        struct iovec *iov)
> > > > > +static int vhost_vdpa_net_cvq_prepare(NetClientState *nc)
> > > > >  {
> > > > > -    size_t in_copied;
> > > > > -    bool ok;
> > > > > +    VhostVDPAState *s;
> > > > > +    int r;
> > > > >
> > > > > -    iov[0].iov_base =3D s->cvq_cmd_out_buffer;
> > > > > -    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, elem->out_sg, =
elem->out_num,
> > > > > -                                vhost_vdpa_net_cvq_cmd_len(), io=
v[0].iov_base,
> > > > > -                                &iov[0].iov_len, false);
> > > > > -    if (unlikely(!ok)) {
> > > > > -        return false;
> > > > > +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > > > > +
> > > > > +    s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > > > +    if (!s->vhost_vdpa.shadow_vqs_enabled) {
> > > > > +        return 0;
> > > > >      }
> > > > >
> > > > > -    iov[1].iov_base =3D s->cvq_cmd_in_buffer;
> > > > > -    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, NULL, 0,
> > > > > -                                sizeof(virtio_net_ctrl_ack), iov=
[1].iov_base,
> > > > > -                                &in_copied, true);
> > > > > -    if (unlikely(!ok)) {
> > > > > +    r =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_out_=
buffer,
> > > > > +                               vhost_vdpa_net_cvq_cmd_page_len()=
, false);
> > > > > +    if (unlikely(r < 0)) {
> > > > > +        return r;
> > > > > +    }
> > > > > +
> > > > > +    r =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_in_b=
uffer,
> > > > > +                               vhost_vdpa_net_cvq_cmd_page_len()=
, true);
> > > > > +    if (unlikely(r < 0)) {
> > > > >          vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_=
buffer);
> > > > > -        return false;
> > > > >      }
> > > > >
> > > > > -    iov[1].iov_len =3D sizeof(virtio_net_ctrl_ack);
> > > > > -    return true;
> > > > > +    return r;
> > > > > +}
> > > > > +
> > > > > +static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
> > > > > +{
> > > > > +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > > > +
> > > > > +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > > > > +
> > > > > +    if (s->vhost_vdpa.shadow_vqs_enabled) {
> > > > > +        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_=
buffer);
> > > > > +        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_in_b=
uffer);
> > > > > +    }
> > > > >  }
> > > > >
> > > > >  static NetClientInfo net_vhost_vdpa_cvq_info =3D {
> > > > >      .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
> > > > >      .size =3D sizeof(VhostVDPAState),
> > > > >      .receive =3D vhost_vdpa_receive,
> > > > > +    .prepare =3D vhost_vdpa_net_cvq_prepare,
> > > > > +    .stop =3D vhost_vdpa_net_cvq_stop,
> > > > >      .cleanup =3D vhost_vdpa_cleanup,
> > > > >      .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
> > > > >      .has_ufo =3D vhost_vdpa_has_ufo,
> > > > > @@ -348,19 +347,17 @@ static NetClientInfo net_vhost_vdpa_cvq_inf=
o =3D {
> > > > >   * Do not forward commands not supported by SVQ. Otherwise, the =
device could
> > > > >   * accept it and qemu would not know how to update the device mo=
del.
> > > > >   */
> > > > > -static bool vhost_vdpa_net_cvq_validate_cmd(const struct iovec *=
out,
> > > > > -                                            size_t out_num)
> > > > > +static bool vhost_vdpa_net_cvq_validate_cmd(const void *out_buf,=
 size_t len)
> > > > >  {
> > > > >      struct virtio_net_ctrl_hdr ctrl;
> > > > > -    size_t n;
> > > > >
> > > > > -    n =3D iov_to_buf(out, out_num, 0, &ctrl, sizeof(ctrl));
> > > > > -    if (unlikely(n < sizeof(ctrl))) {
> > > > > +    if (unlikely(len < sizeof(ctrl))) {
> > > > >          qemu_log_mask(LOG_GUEST_ERROR,
> > > > > -                      "%s: invalid legnth of out buffer %zu\n", =
__func__, n);
> > > > > +                      "%s: invalid legnth of out buffer %zu\n", =
__func__, len);
> > > > >          return false;
> > > > >      }
> > > > >
> > > > > +    memcpy(&ctrl, out_buf, sizeof(ctrl));
> > > > >      switch (ctrl.class) {
> > > > >      case VIRTIO_NET_CTRL_MAC:
> > > > >          switch (ctrl.cmd) {
> > > > > @@ -392,10 +389,14 @@ static int vhost_vdpa_net_handle_ctrl_avail=
(VhostShadowVirtqueue *svq,
> > > > >      VhostVDPAState *s =3D opaque;
> > > > >      size_t in_len, dev_written;
> > > > >      virtio_net_ctrl_ack status =3D VIRTIO_NET_ERR;
> > > > > -    /* out and in buffers sent to the device */
> > > > > -    struct iovec dev_buffers[2] =3D {
> > > > > -        { .iov_base =3D s->cvq_cmd_out_buffer },
> > > > > -        { .iov_base =3D s->cvq_cmd_in_buffer },
> > > > > +    /* Out buffer sent to both the vdpa device and the device mo=
del */
> > > > > +    struct iovec out =3D {
> > > > > +        .iov_base =3D s->cvq_cmd_out_buffer,
> > > > > +    };
> > > > > +    /* In buffer sent to the device */
> > > > > +    const struct iovec dev_in =3D {
> > > > > +        .iov_base =3D s->cvq_cmd_in_buffer,
> > > > > +        .iov_len =3D sizeof(virtio_net_ctrl_ack),
> > > > >      };
> > > > >      /* in buffer used for device model */
> > > > >      const struct iovec in =3D {
> > > > > @@ -405,17 +406,15 @@ static int vhost_vdpa_net_handle_ctrl_avail=
(VhostShadowVirtqueue *svq,
> > > > >      int r =3D -EINVAL;
> > > > >      bool ok;
> > > > >
> > > > > -    ok =3D vhost_vdpa_net_cvq_map_elem(s, elem, dev_buffers);
> > > > > -    if (unlikely(!ok)) {
> > > > > -        goto out;
> > > > > -    }
> > > > > -
> > > > > -    ok =3D vhost_vdpa_net_cvq_validate_cmd(&dev_buffers[0], 1);
> > > > > +    out.iov_len =3D iov_to_buf(elem->out_sg, elem->out_num, 0,
> > > > > +                             s->cvq_cmd_out_buffer,
> > > > > +                             vhost_vdpa_net_cvq_cmd_len());
> > > > > +    ok =3D vhost_vdpa_net_cvq_validate_cmd(s->cvq_cmd_out_buffer=
, out.iov_len);
> > > > >      if (unlikely(!ok)) {
> > > > >          goto out;
> > > > >      }
> > > > >
> > > > > -    r =3D vhost_svq_add(svq, &dev_buffers[0], 1, &dev_buffers[1]=
, 1, elem);
> > > > > +    r =3D vhost_svq_add(svq, &out, 1, &dev_in, 1, elem);
> > > > >      if (unlikely(r !=3D 0)) {
> > > > >          if (unlikely(r =3D=3D -ENOSPC)) {
> > > > >              qemu_log_mask(LOG_GUEST_ERROR, "%s: No space on devi=
ce queue\n",
> > > > > @@ -435,13 +434,13 @@ static int vhost_vdpa_net_handle_ctrl_avail=
(VhostShadowVirtqueue *svq,
> > > > >          goto out;
> > > > >      }
> > > > >
> > > > > -    memcpy(&status, dev_buffers[1].iov_base, sizeof(status));
> > > > > +    memcpy(&status, s->cvq_cmd_in_buffer, sizeof(status));
> > > > >      if (status !=3D VIRTIO_NET_OK) {
> > > > >          goto out;
> > > > >      }
> > > > >
> > > > >      status =3D VIRTIO_NET_ERR;
> > > > > -    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, dev_buffers, 1=
);
> > > > > +    virtio_net_handle_ctrl_iov(svq->vdev, &in, 1, &out, 1);
> > > > >      if (status !=3D VIRTIO_NET_OK) {
> > > > >          error_report("Bad CVQ processing in model");
> > > > >      }
> > > > > @@ -454,12 +453,6 @@ out:
> > > > >      }
> > > > >      vhost_svq_push_elem(svq, elem, MIN(in_len, sizeof(status)));
> > > > >      g_free(elem);
> > > > > -    if (dev_buffers[0].iov_base) {
> > > > > -        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[0].=
iov_base);
> > > > > -    }
> > > > > -    if (dev_buffers[1].iov_base) {
> > > > > -        vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, dev_buffers[1].=
iov_base);
> > > > > -    }
> > > > >      return r;
> > > > >  }
> > > > >
> > > > > --
> > > > > 2.31.1
> > > > >
> > > >
> > >
> >
>


