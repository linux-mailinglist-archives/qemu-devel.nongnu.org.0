Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E78BC588134
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 19:42:00 +0200 (CEST)
Received: from localhost ([::1]:53014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIvu2-0001w0-Pw
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 13:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIvqX-0000IE-B6
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 13:38:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIvqI-000419-BJ
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 13:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659461883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PigNDymE1FdkUtTNNV3wEElAbTeG9+D+x3RskpOlLEY=;
 b=fPAO9eb2QO3YTe1+lgJsLbZrCMepeREfn1bl1Etfvwk2Mrnazxy39bmhajK4ewR5hMJj53
 nGu7hvQpmVBVOA127j5CFlHdP05looD1yYRuQ6yDhNYVomONAGn8XsA3enqHkqYG7fhHcz
 rEDNNEe1mynLUOSSJS427CSXxtdPNCE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-FRfWkgAcPS6EKCl6JhBfjg-1; Tue, 02 Aug 2022 13:38:01 -0400
X-MC-Unique: FRfWkgAcPS6EKCl6JhBfjg-1
Received: by mail-qv1-f70.google.com with SMTP id
 cz12-20020a056214088c00b004763e7e7d81so4670624qvb.21
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 10:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PigNDymE1FdkUtTNNV3wEElAbTeG9+D+x3RskpOlLEY=;
 b=lw5yOiUccyU6p9I0ePLadwjh0JPgcN4wvV2gxIynF8mggmAiC2kPMX3gW6mtsUeH+8
 VJ7pOyEErB2iEPSN0L2qhApOjdehXZxR81+XpMXScxlOR/ocC+kyUtmSKf1IP7M0L04u
 iIoh14nDseLRCLUnLThsLYjR+qgDFgKYWlgIoF+pq0rYfA92yE8oZSAm4cNHo5tK6ZQV
 R65pjXRBPQw+qLf9IbQr2oXOUDIQtBdy8YK0qzfOIJGKN1eCIRk6KTaqu0aJc4XO/mH9
 Hc3Uv8NGewcj9PS5pHJxV/imHrFnAGuBLrnEX6Q4wOBZPsE2wGiLsSFE0XGS0EFsciMC
 tdhw==
X-Gm-Message-State: ACgBeo1Uvx4B5a9PI+wR+7cd8KVSlfjUd6kOtPy73LFd/kwM1xOEE86R
 k05BxAKov0nhQrY8/n06HqJNTQBgdwG5AeM403DJ52v5VcNDJm2p8ILosjm9PV6FWIZzGqB0rYX
 17Teke4ogqGzBZK+QPfihyNXrJ2F40Ds=
X-Received: by 2002:a05:620a:46a2:b0:6b8:bef3:8f82 with SMTP id
 bq34-20020a05620a46a200b006b8bef38f82mr5238625qkb.234.1659461881050; 
 Tue, 02 Aug 2022 10:38:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7ZOITA9QWidqSy2r6mttsWUEiwhRBgfqnvUpM8wq00jXKnPSIP0e0tWEX5jGqtGmyczpSOh2MpJFfing4P+iE=
X-Received: by 2002:a05:620a:46a2:b0:6b8:bef3:8f82 with SMTP id
 bq34-20020a05620a46a200b006b8bef38f82mr5238604qkb.234.1659461880835; Tue, 02
 Aug 2022 10:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220722111245.3403062-1-eperezma@redhat.com>
 <20220722111245.3403062-7-eperezma@redhat.com>
 <2530135d-42a6-462e-5835-5e8f948c3f09@redhat.com>
 <CAJaqyWemHdosko1Ad1X8RxCaUm1jFc_r_se_DB3VZtN+aO_tsA@mail.gmail.com>
In-Reply-To: <CAJaqyWemHdosko1Ad1X8RxCaUm1jFc_r_se_DB3VZtN+aO_tsA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 2 Aug 2022 19:37:24 +0200
Message-ID: <CAJaqyWdutXFa83tLDdLmQE2pqomHptB0UCeVVbyHhX7A4twpjA@mail.gmail.com>
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
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Mon, Aug 1, 2022 at 9:09 AM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Mon, Jul 25, 2022 at 11:32 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/7/22 19:12, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > This is needed so the destination vdpa device see the same state a th=
e
> > > guest set in the source.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >   net/vhost-vdpa.c | 61 +++++++++++++++++++++++++++++++++++++++++++++=
+++
> > >   1 file changed, 61 insertions(+)
> > >
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index 61516b1432..3e15a42c35 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -365,10 +365,71 @@ static virtio_net_ctrl_ack vhost_vdpa_net_cvq_a=
dd(VhostShadowVirtqueue *svq,
> > >       return VIRTIO_NET_OK;
> > >   }
> > >
> > > +static int vhost_vdpa_net_start(NetClientState *nc)
> > > +{
> > > +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > > +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> > > +    VirtIONet *n;
> > > +    uint64_t features;
> > > +    VhostShadowVirtqueue *svq;
> > > +
> > > +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > > +
> > > +    if (!v->shadow_vqs_enabled) {
> > > +        return 0;
> > > +    }
> > > +
> > > +    if (v->dev->nvqs !=3D 1 &&
> > > +        v->dev->vq_index + v->dev->nvqs !=3D v->dev->vq_index_end) {
> > > +        /* Only interested in CVQ */
> > > +        return 0;
> > > +    }
> >
> >
> > I'd have a dedicated NetClientInfo for cvq.
> >
>
> I'll try and come back to you.
>
> >
> > > +
> > > +    n =3D VIRTIO_NET(v->dev->vdev);
> > > +    features =3D v->dev->vdev->host_features;
> > > +    svq =3D g_ptr_array_index(v->shadow_vqs, 0);
> > > +    if (features & BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR)) {
> > > +        const struct virtio_net_ctrl_hdr ctrl =3D {
> > > +            .class =3D VIRTIO_NET_CTRL_MAC,
> > > +            .cmd =3D VIRTIO_NET_CTRL_MAC_ADDR_SET,
> > > +        };
> > > +        uint8_t mac[6];
> > > +        const struct iovec out[] =3D {
> > > +            {
> > > +                .iov_base =3D (void *)&ctrl,
> > > +                .iov_len =3D sizeof(ctrl),
> > > +            },{
> > > +                .iov_base =3D mac,
> > > +                .iov_len =3D sizeof(mac),
> > > +            },
> > > +        };
> > > +        struct iovec dev_buffers[2] =3D {
> > > +            { .iov_base =3D s->cvq_cmd_out_buffer },
> > > +            { .iov_base =3D s->cvq_cmd_in_buffer },
> > > +        };
> > > +        bool ok;
> > > +        virtio_net_ctrl_ack state;
> > > +
> > > +        ok =3D vhost_vdpa_net_cvq_map_sg(s, out, ARRAY_SIZE(out), de=
v_buffers);
> >
> >
> > To speed up the state recovery, can we map those buffers during svq sta=
rt?
> >
>
> Not sure if I follow you here. This is the callback that is called
> during the device startup.
>
> If you mean to make these buffers permanently mapped I think that can
> be done for this series, but extra care will be needed when we
> introduce ASID support to not make them visible from the guest. I'm ok
> if you prefer to make it that way for this series.
>

Sending v4 without this part, please let me know if it needs further change=
s.

Thanks!


