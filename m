Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378995898DA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 09:56:49 +0200 (CEST)
Received: from localhost ([::1]:41830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJViq-0007Oo-8m
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 03:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJVdw-0002Gg-Rv
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:51:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJVdp-0006sc-VY
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659599496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ry6q6kSA8lwnljyeR29qdBpznKfunemBJnvnOtJbDUU=;
 b=XitJ2krLCUwU6gl/77NcCwIH6xpVv+JrutjIBSetNLuXfnW1qPkFlOf7xMkA23FdrIbwRU
 RXWOIJ8zrnUeFUwcFryHwBZbKikZnn3X1B3yEUlwV3PAYWtojlpPtxJqFnCRiDY2cHuC/5
 CQIIHfzLDxeXULc3EB7Cw0YAGwa+jGM=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-iP-TC2aHPpOQg5lmqFEQfA-1; Thu, 04 Aug 2022 03:51:35 -0400
X-MC-Unique: iP-TC2aHPpOQg5lmqFEQfA-1
Received: by mail-lj1-f198.google.com with SMTP id
 s8-20020a2e9c08000000b0025e5c453a63so2176527lji.21
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 00:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ry6q6kSA8lwnljyeR29qdBpznKfunemBJnvnOtJbDUU=;
 b=xVcIa94hBmXqzidErNir853iY6yd7l39kUDe0y5UKVsB8U44P9L8jKRB0AK4noUKBf
 yYdCCyQJp9TUmysboTFysXMDpyioiS7FyJ6wBXpj+rk53HB+CSxlp7BBZAzQFZtAmL4L
 Esnzc6x903HYKlLuJN6sYDK1DD/j6CwNqgRMwvm3MsyM1OATVz2nzU1zkNEikLeD7eRg
 Yl+xrg6/Q9b1f4jXR4BK3rwN5Ngd/WlvCIAtFh2sYlg6xQwB8Wj1knb/tsENEZwhpZ4p
 MJamrohY/xPpIfpJEwWEXjiVCp1G+h8qYsaSaASPWyZXW+6iY/OLHgAgS9yMnKNg13bm
 HcoQ==
X-Gm-Message-State: ACgBeo0ZaviCvuWSWKWDrUit5kWTwT1CcKKMhAp4Y9Scd7Du1/GizYUg
 9XE/ThzAUd+M1+9pNPyUO6a8XuAXmrCGBlUy3xrwEk34Ta46SuOMJmLU2nC2P6auCdZztegiaas
 0GMbzA0xf+BaPcH2FhsDlbzKt1+Z7/Hs=
X-Received: by 2002:a19:ac09:0:b0:48a:d1b5:1791 with SMTP id
 g9-20020a19ac09000000b0048ad1b51791mr297318lfc.397.1659599492160; 
 Thu, 04 Aug 2022 00:51:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6C8kCZb9bteC5x5I1Ps39HYRuslY5pEKaeJsgaBjmPzmDAmMrq/86a3uUWs5KJrez9N2rLKodSsFvOPRC8eyw=
X-Received: by 2002:a19:ac09:0:b0:48a:d1b5:1791 with SMTP id
 g9-20020a19ac09000000b0048ad1b51791mr297288lfc.397.1659599491879; Thu, 04 Aug
 2022 00:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220802175731.312115-1-eperezma@redhat.com>
 <20220802175731.312115-7-eperezma@redhat.com>
 <47e1e277-34e9-b043-0a74-bf2b67391c6a@redhat.com>
 <CAJaqyWc2+H0t1tgfmh6kgShJ9Obq46oUxX998YvRvQRfj3+eCA@mail.gmail.com>
In-Reply-To: <CAJaqyWc2+H0t1tgfmh6kgShJ9Obq46oUxX998YvRvQRfj3+eCA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 4 Aug 2022 15:51:20 +0800
Message-ID: <CACGkMEuQ0cYAaGf6T+m_WuaK1n58XxGXney3jx5mDni78BqbYQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] vdpa: Make vhost_vdpa_net_cvq_map_elem accept
 any out sg
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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

On Thu, Aug 4, 2022 at 3:39 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Thu, Aug 4, 2022 at 6:17 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/8/3 01:57, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > So its generic enough to accept any out sg buffer and we can inject
> > > NIC state messages.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > > v5: Accept out sg instead of dev_buffers[]
> > > ---
> > >   net/vhost-vdpa.c | 13 +++++++------
> > >   1 file changed, 7 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > index 33bf3d6409..2421bca347 100644
> > > --- a/net/vhost-vdpa.c
> > > +++ b/net/vhost-vdpa.c
> > > @@ -302,16 +302,16 @@ dma_map_err:
> > >   }
> > >
> > >   /**
> > > - * Copy the guest element into a dedicated buffer suitable to be sen=
t to NIC
> > > + * Maps out sg and in buffer into dedicated buffers suitable to be s=
ent to NIC
> > >    */
> > > -static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
> > > -                                        VirtQueueElement *elem,
> > > -                                        size_t *out_len)
> > > +static bool vhost_vdpa_net_cvq_map_sg(VhostVDPAState *s,
> > > +                                      const struct iovec *out, size_=
t out_num,
> > > +                                      size_t *out_len)
> >
> >
> > This still looks not genreal as there's no guarantee that we won't have
> > command-in-specific-data. One example is that Ali is working on the
> > virtio-net statistics fetching from the control virtqueue.
> >
> > So it looks to me we'd better have a general bounce_map here that accep=
ts:
> >
> > 1) out_sg and out_num
> > 2) in_sg and in_num
> >
>
> We don't need to pass in_sg for that: The only useful information is
> its size.

What if we support stats in the future where it extends the ctrl command:

         u8 command;
         u8 command-specific-data[];
         u8 ack;
+        u8 command-specific-data-reply[];

in

https://lists.oasis-open.org/archives/virtio-dev/202203/msg00000.html

> Since the exposed buffer is an in one, it's enough to expose
> the s->cvq_cmd_in_buffer buffer in full. The caller already knows the
> device will write to it, so the only missing piece is to return the
> written length at vhost_vdpa_net_cvq_add.
>
> Is one page the right buffer size for the in buffer?

We can start from this.

> Is it worth
> worrying about it before implementing the stat control command in qemu
> virtio-net?

If it's not complex, it's better to do that from the beginning,
otherwise the user may be surprised and we need extra work. Anyhow, we
should support at least ack which is an in_sg.

>
> > In this level, we'd better not have any special care about the in as th=
e
> > ack.
>
> We need to care about it. If a property has not been updated in the
> vdpa device (it returned VIRTIO_NET_ERR), we must not update the
> device model.

Yes, but what I meant is at the level of bouncing itself. If we met
VIRTIO_NET_ERR, we should propagate it to the guest as well?

Thanks

>
> We can move the processing from vhost_vdpa_net_cvq_add to
> vhost_vdpa_net_load and vhost_vdpa_net_handle_ctrl_avail, but the code
> gets duplicated then.
>
> > And we need do bouncing:
> >
> > 1) for out buffer, during map
> > 2) for in buffer during unmap
> >
>
> We can move the copy of the in_buffer to the unmap for sure.
>
> Thanks!
>
> > Thanks
> >
> >
> > >   {
> > >       size_t in_copied;
> > >       bool ok;
> > >
> > > -    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, elem->out_sg, elem=
->out_num,
> > > +    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, out, out_num,
> > >                                   vhost_vdpa_net_cvq_cmd_len(),
> > >                                   s->cvq_cmd_out_buffer, out_len, fal=
se);
> > >       if (unlikely(!ok)) {
> > > @@ -435,7 +435,8 @@ static int vhost_vdpa_net_handle_ctrl_avail(Vhost=
ShadowVirtqueue *svq,
> > >       };
> > >       bool ok;
> > >
> > > -    ok =3D vhost_vdpa_net_cvq_map_elem(s, elem, &dev_buffers[0].iov_=
len);
> > > +    ok =3D vhost_vdpa_net_cvq_map_sg(s, elem->out_sg, elem->out_num,
> > > +                                   &dev_buffers[0].iov_len);
> > >       if (unlikely(!ok)) {
> > >           goto out;
> > >       }
> >
>


