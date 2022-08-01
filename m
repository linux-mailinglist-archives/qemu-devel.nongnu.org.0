Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D92A58658E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 09:16:10 +0200 (CEST)
Received: from localhost ([::1]:39362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIPeq-0004wP-Tj
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 03:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIPZW-0001UX-Bh
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 03:10:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIPZS-0006ER-5i
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 03:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659337833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9n42gJGeHtfK/2WsJTZvvyPH9/4zaU9yXMh4VB/apg=;
 b=XR37Wan3LDQSN6hiQBn6KCbx9h6Zwmrt/6XnM/IOoYtxF7i2fao4dsUBz84hXIoOY2Rw7n
 MQG2aBu9J//Els8hBxFpLH6epdmf6LuZjM0MSxETtV7lGNAIroxGkQmLkiwC/NRY0sYpvH
 DI27M/bYIdgR6ycfcfcC4jWFenbejt0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-17d9xH90OgS62A1iiJLaoA-1; Mon, 01 Aug 2022 03:10:32 -0400
X-MC-Unique: 17d9xH90OgS62A1iiJLaoA-1
Received: by mail-qk1-f197.google.com with SMTP id
 ay35-20020a05620a17a300b006b5d9646d31so8565450qkb.6
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 00:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g9n42gJGeHtfK/2WsJTZvvyPH9/4zaU9yXMh4VB/apg=;
 b=P0gEQ+At89fpWNIaWyDRiseHK/2hrgO5jgqLPZQ62JaslIstm9yblYx1/Wkaw/sE3W
 VwX0ojBcZRD6hCFN8upIvmhbJ1MH6WxLvM5iah+plxy0XZDsUCX9iU0UFCULhvW3zTnT
 uhlFJpvpoJxTMKV+Pp606l5740szoCx2NYC8M4YmvVJb2ralCbNYihm2sZPLIYnHipBi
 iUv/1EPjneaWkW9kFxYvSvAGcCFjMpVK2G6pB1jcae3JU14JLqgMyjABHIHzQmVeENfW
 sKmx0KIF8f/2mDxaIA59BjIErX2Q3MogXO1UvEV+TWxrudkhFM17Fkoo3X8FekJm7gAj
 zWyg==
X-Gm-Message-State: AJIora9jm9zUsFsEPIL3GeKMAs7PoNAPA4+LhvhFmrEZjiqUoEIBzOVe
 F+ia2fPcaisrnQdhVk3Tf0StFSTHJbF3Qqh5/Pes2XdeHPRLfmCrnDTRVq6B4rhIeQg9G1HlYJO
 lcdOe752EyG9GEUeu2ysXgfXQruToE7Y=
X-Received: by 2002:a05:620a:2a13:b0:6b5:c197:d565 with SMTP id
 o19-20020a05620a2a1300b006b5c197d565mr10691986qkp.255.1659337831725; 
 Mon, 01 Aug 2022 00:10:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t/4eo7geQBYy+Z9nDtaI3bSn2Y4Mw97oA4PHV3qT48CJhkUh+RjwnssqE9K4ZFFa60ov9W2ZpBdu2rVvsr/K0=
X-Received: by 2002:a05:620a:2a13:b0:6b5:c197:d565 with SMTP id
 o19-20020a05620a2a1300b006b5c197d565mr10691968qkp.255.1659337831476; Mon, 01
 Aug 2022 00:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220722111245.3403062-1-eperezma@redhat.com>
 <20220722111245.3403062-7-eperezma@redhat.com>
 <2530135d-42a6-462e-5835-5e8f948c3f09@redhat.com>
In-Reply-To: <2530135d-42a6-462e-5835-5e8f948c3f09@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 1 Aug 2022 09:09:55 +0200
Message-ID: <CAJaqyWemHdosko1Ad1X8RxCaUm1jFc_r_se_DB3VZtN+aO_tsA@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] vdpa: Add virtio-net mac address via CVQ at start
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Parav Pandit <parav@mellanox.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, 
 Eric Blake <eblake@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Cornelia Huck <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>
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

On Mon, Jul 25, 2022 at 11:32 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/7/22 19:12, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > This is needed so the destination vdpa device see the same state a the
> > guest set in the source.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   net/vhost-vdpa.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 61 insertions(+)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 61516b1432..3e15a42c35 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -365,10 +365,71 @@ static virtio_net_ctrl_ack vhost_vdpa_net_cvq_add=
(VhostShadowVirtqueue *svq,
> >       return VIRTIO_NET_OK;
> >   }
> >
> > +static int vhost_vdpa_net_start(NetClientState *nc)
> > +{
> > +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> > +    VirtIONet *n;
> > +    uint64_t features;
> > +    VhostShadowVirtqueue *svq;
> > +
> > +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > +
> > +    if (!v->shadow_vqs_enabled) {
> > +        return 0;
> > +    }
> > +
> > +    if (v->dev->nvqs !=3D 1 &&
> > +        v->dev->vq_index + v->dev->nvqs !=3D v->dev->vq_index_end) {
> > +        /* Only interested in CVQ */
> > +        return 0;
> > +    }
>
>
> I'd have a dedicated NetClientInfo for cvq.
>

I'll try and come back to you.

>
> > +
> > +    n =3D VIRTIO_NET(v->dev->vdev);
> > +    features =3D v->dev->vdev->host_features;
> > +    svq =3D g_ptr_array_index(v->shadow_vqs, 0);
> > +    if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
> > +        const struct virtio_net_ctrl_hdr ctrl =3D {
> > +            .class =3D VIRTIO_NET_CTRL_MAC,
> > +            .cmd =3D VIRTIO_NET_CTRL_MAC_ADDR_SET,
> > +        };
> > +        uint8_t mac[6];
> > +        const struct iovec out[] =3D {
> > +            {
> > +                .iov_base =3D (void *)&ctrl,
> > +                .iov_len =3D sizeof(ctrl),
> > +            },{
> > +                .iov_base =3D mac,
> > +                .iov_len =3D sizeof(mac),
> > +            },
> > +        };
> > +        struct iovec dev_buffers[2] =3D {
> > +            { .iov_base =3D s->cvq_cmd_out_buffer },
> > +            { .iov_base =3D s->cvq_cmd_in_buffer },
> > +        };
> > +        bool ok;
> > +        virtio_net_ctrl_ack state;
> > +
> > +        ok =3D vhost_vdpa_net_cvq_map_sg(s, out, ARRAY_SIZE(out), dev_=
buffers);
>
>
> To speed up the state recovery, can we map those buffers during svq start=
?
>

Not sure if I follow you here. This is the callback that is called
during the device startup.

If you mean to make these buffers permanently mapped I think that can
be done for this series, but extra care will be needed when we
introduce ASID support to not make them visible from the guest. I'm ok
if you prefer to make it that way for this series.

Thanks!

> Thanks
>
>
> > +        if (unlikely(!ok)) {
> > +            return -1;
> > +        }
> > +
> > +        memcpy(mac, n->mac, sizeof(mac));
> > +        state =3D vhost_vdpa_net_cvq_add(svq, dev_buffers);
> > +        vhost_vdpa_cvq_unmap_buf(v, dev_buffers[0].iov_base);
> > +        vhost_vdpa_cvq_unmap_buf(v, dev_buffers[1].iov_base);
> > +        return state =3D=3D VIRTIO_NET_OK ? 0 : 1;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >   static NetClientInfo net_vhost_vdpa_info =3D {
> >           .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
> >           .size =3D sizeof(VhostVDPAState),
> >           .receive =3D vhost_vdpa_receive,
> > +        .start =3D vhost_vdpa_net_start,
> >           .cleanup =3D vhost_vdpa_cleanup,
> >           .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
> >           .has_ufo =3D vhost_vdpa_has_ufo,
>


