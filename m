Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B5C589896
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 09:42:06 +0200 (CEST)
Received: from localhost ([::1]:55708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJVUb-0005CO-GV
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 03:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJVRu-0003Ky-Pr
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:39:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJVRr-0004me-Gb
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 03:39:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659598754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t5UiMbpmB0R3ylm3CxaQktmqRdNFqZpHeFRy+nEx3xY=;
 b=D2yEteFk3/WtCQtuS0QpfguJHPV5f6ukEStU/5q39b+bBgIviP38cY7hu2ELg6yNbptDXT
 dUaepCoFKXMi0mIXXY0aN5xQbJOyFyoONqmZMdnvlHqfiMiFYdOjZd+10XIWrHBZeuBCph
 hgpAcQxozzc332orNv0s9010AXr/TxY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-lXmiUqMGOwy4qPTBtHGDIw-1; Thu, 04 Aug 2022 03:39:13 -0400
X-MC-Unique: lXmiUqMGOwy4qPTBtHGDIw-1
Received: by mail-qk1-f197.google.com with SMTP id
 bi37-20020a05620a31a500b006b5ef0afedaso15434979qkb.22
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 00:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t5UiMbpmB0R3ylm3CxaQktmqRdNFqZpHeFRy+nEx3xY=;
 b=aMEKN+51sOTvS7Evz5DAPCRTRI8MIoLyinud1R2YTkTsNANMjzmD0veWnnlI0qdd1P
 n87r2SQQSGOiTwVZSMxw0g2uZE5U5MVUS6c6izvJu9rrtrkRkjm5OFiej6013v8ivuLo
 Iecj+dtaSLWzETglAMcQWWajsFofFK5NzKJZd7UTyyTJCeUX1/Ws6QIfh4pSb2eOdDIz
 pttjAdnMMlcu7mQBgGkXq5C0eFQnycb9i9lJbe7gnrm4+w306YiGiEQgXSvv02RKkq0U
 lNRQgBExpmdZ8bVkFBkYh3A3lJptfaiCeMDEupYPQlGIHossn0RNFJbdwrTmd5Tg1VYm
 FMyQ==
X-Gm-Message-State: ACgBeo0QmL1JMS7QHewxF5yIkj4iBq32JKIuLS9/SYYjENurQaeJko0S
 Ljkvvio+dD1hXp9R/y+/rL5qsjpnHO849/g+ma4X2HHulqI6VM31+rdNRwrhf3u/YXDdJ90H2+b
 lXU5x28904Vvrd81obKmWpzsp9Bx0N/s=
X-Received: by 2002:a05:6214:5085:b0:472:e878:866a with SMTP id
 kk5-20020a056214508500b00472e878866amr326576qvb.2.1659598752467; 
 Thu, 04 Aug 2022 00:39:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4hsxjsrDG9bY5jizk1N9RFz7mLK2Sm5HZ5F7EYiBWDB7kpQJvd6xaRP35nKtxMhRLoCHGtK4bpR/Urn0u94xc=
X-Received: by 2002:a05:6214:5085:b0:472:e878:866a with SMTP id
 kk5-20020a056214508500b00472e878866amr326557qvb.2.1659598752229; Thu, 04 Aug
 2022 00:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220802175731.312115-1-eperezma@redhat.com>
 <20220802175731.312115-7-eperezma@redhat.com>
 <47e1e277-34e9-b043-0a74-bf2b67391c6a@redhat.com>
In-Reply-To: <47e1e277-34e9-b043-0a74-bf2b67391c6a@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 4 Aug 2022 09:38:36 +0200
Message-ID: <CAJaqyWc2+H0t1tgfmh6kgShJ9Obq46oUxX998YvRvQRfj3+eCA@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] vdpa: Make vhost_vdpa_net_cvq_map_elem accept
 any out sg
To: Jason Wang <jasowang@redhat.com>
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

On Thu, Aug 4, 2022 at 6:17 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/8/3 01:57, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > So its generic enough to accept any out sg buffer and we can inject
> > NIC state messages.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> > v5: Accept out sg instead of dev_buffers[]
> > ---
> >   net/vhost-vdpa.c | 13 +++++++------
> >   1 file changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 33bf3d6409..2421bca347 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -302,16 +302,16 @@ dma_map_err:
> >   }
> >
> >   /**
> > - * Copy the guest element into a dedicated buffer suitable to be sent =
to NIC
> > + * Maps out sg and in buffer into dedicated buffers suitable to be sen=
t to NIC
> >    */
> > -static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
> > -                                        VirtQueueElement *elem,
> > -                                        size_t *out_len)
> > +static bool vhost_vdpa_net_cvq_map_sg(VhostVDPAState *s,
> > +                                      const struct iovec *out, size_t =
out_num,
> > +                                      size_t *out_len)
>
>
> This still looks not genreal as there's no guarantee that we won't have
> command-in-specific-data. One example is that Ali is working on the
> virtio-net statistics fetching from the control virtqueue.
>
> So it looks to me we'd better have a general bounce_map here that accepts=
:
>
> 1) out_sg and out_num
> 2) in_sg and in_num
>

We don't need to pass in_sg for that: The only useful information is
its size. Since the exposed buffer is an in one, it's enough to expose
the s->cvq_cmd_in_buffer buffer in full. The caller already knows the
device will write to it, so the only missing piece is to return the
written length at vhost_vdpa_net_cvq_add.

Is one page the right buffer size for the in buffer? Is it worth
worrying about it before implementing the stat control command in qemu
virtio-net?

> In this level, we'd better not have any special care about the in as the
> ack.

We need to care about it. If a property has not been updated in the
vdpa device (it returned VIRTIO_NET_ERR), we must not update the
device model.

We can move the processing from vhost_vdpa_net_cvq_add to
vhost_vdpa_net_load and vhost_vdpa_net_handle_ctrl_avail, but the code
gets duplicated then.

> And we need do bouncing:
>
> 1) for out buffer, during map
> 2) for in buffer during unmap
>

We can move the copy of the in_buffer to the unmap for sure.

Thanks!

> Thanks
>
>
> >   {
> >       size_t in_copied;
> >       bool ok;
> >
> > -    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, elem->out_sg, elem->=
out_num,
> > +    ok =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, out, out_num,
> >                                   vhost_vdpa_net_cvq_cmd_len(),
> >                                   s->cvq_cmd_out_buffer, out_len, false=
);
> >       if (unlikely(!ok)) {
> > @@ -435,7 +435,8 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostSh=
adowVirtqueue *svq,
> >       };
> >       bool ok;
> >
> > -    ok =3D vhost_vdpa_net_cvq_map_elem(s, elem, &dev_buffers[0].iov_le=
n);
> > +    ok =3D vhost_vdpa_net_cvq_map_sg(s, elem->out_sg, elem->out_num,
> > +                                   &dev_buffers[0].iov_len);
> >       if (unlikely(!ok)) {
> >           goto out;
> >       }
>


