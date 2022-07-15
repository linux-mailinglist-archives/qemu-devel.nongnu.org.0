Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CFE575B16
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 07:45:35 +0200 (CEST)
Received: from localhost ([::1]:55392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCE8r-00063E-Sl
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 01:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCE69-0003rk-Vf
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 01:42:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCE68-0005nb-0a
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 01:42:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657863763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7HvT2PjhvffAK86iRtpWogwTDEphxXm1GU0nIBOrwxo=;
 b=EEEMlimNFBBEgGm8LA3rj4ft7Xj3QEKbilw0bZQX7AJ4xxyQMuC/7LhQOlgYIZeCjEpai5
 ZuuvjRMUfcGWS6qHrsMcQjFNwSQr+5ZqbfbRCwRda10CEdByQTcwChddzsRE9Nh6duJxsX
 aSkrw8qs2M6PvxpWR1nz94wVMUafsqA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-IJofgAd9Paq9_qtcc7s3sA-1; Fri, 15 Jul 2022 01:42:24 -0400
X-MC-Unique: IJofgAd9Paq9_qtcc7s3sA-1
Received: by mail-qk1-f199.google.com with SMTP id
 o13-20020a05620a2a0d00b006b46c5414b0so2754871qkp.23
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 22:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7HvT2PjhvffAK86iRtpWogwTDEphxXm1GU0nIBOrwxo=;
 b=XoN9zc13WJMHcPrXcBEnkAWo2/eO3QkUyl/DTLyT4velLssKwVOEYsoXKCv7Oz+ue7
 lgJvdH315bU2NkE5589OF/8JKWlF71Mj7rvFgbVasA+zTppuNj/dbTRfVz+YainSujNE
 8bNaOTkKNsial/T/b6FaGRQ4xCxCAHxNsdidJqMFSCp6AiOxY+/VDXKVE6sQXUW8H3am
 egP/vZu/LB8eWMEBN5MZGfgBAH4vLoWpCbpYJdSa/jWtrIMBl4I2n6w7E8y+iJ5dG64d
 drRlWXZbesMFU2ThWMXfY2YDEUO4r3vERzTvJCCq4xRYBGw2OUi3srs4ygfEMy9AjiU9
 lOjQ==
X-Gm-Message-State: AJIora85ZabcP+LZvmJCPC9xsxxMXgfg2KjzP6L3kluruhtWoX4mXjq2
 3bmn9Hc/CgUqF3+CUJtI/pJ4WF7P8lLyU8DbEy93O8wIEPvayj95L3IM9GltyG4GnXnnrHFh2XL
 UWEePfk7DO3a9jpFB8l6ifNVb9q1sOZg=
X-Received: by 2002:ac8:5dca:0:b0:31e:85b8:8a18 with SMTP id
 e10-20020ac85dca000000b0031e85b88a18mr10990403qtx.370.1657863743892; 
 Thu, 14 Jul 2022 22:42:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s2nOtUmAdqs01nRZL04xXb8DenX2KStgGQoZTJRrY94/PRnYKj1AbYqFiLfEhnPHzGMWsxMsyz4C2GOn3rKS0=
X-Received: by 2002:ac8:5dca:0:b0:31e:85b8:8a18 with SMTP id
 e10-20020ac85dca000000b0031e85b88a18mr10990393qtx.370.1657863743690; Thu, 14
 Jul 2022 22:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220714163150.2536327-1-eperezma@redhat.com>
 <20220714163150.2536327-10-eperezma@redhat.com>
 <CACGkMEs7UcNALWttim=3ua0+igNXwQF56kM-QmE3odKY1HojgA@mail.gmail.com>
In-Reply-To: <CACGkMEs7UcNALWttim=3ua0+igNXwQF56kM-QmE3odKY1HojgA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 15 Jul 2022 07:41:47 +0200
Message-ID: <CAJaqyWfrWREnRcbdMMdLn2nZZUMBWcdqCxGY0Rd9qPSt51joHw@mail.gmail.com>
Subject: Re: [PATCH v2 09/19] vhost: Track number of descs in SVQElement
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, 
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eli Cohen <eli@mellanox.com>, Cindy Lu <lulu@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
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

On Fri, Jul 15, 2022 at 6:10 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Jul 15, 2022 at 12:32 AM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
> >
> > Since CVQ will be able to modify elements, the number of descriptors in
> > the guest may not match with the number of descriptors exposed. Track
> > separately.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/virtio/vhost-shadow-virtqueue.h |  6 ++++++
> >  hw/virtio/vhost-shadow-virtqueue.c | 10 +++++-----
> >  2 files changed, 11 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index f35d4b8f90..143c86a568 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -17,6 +17,12 @@
> >
> >  typedef struct SVQElement {
> >      VirtQueueElement elem;
> > +
> > +    /*
> > +     * Number of descriptors exposed to the device. May or may not mat=
ch
> > +     * guest's
> > +     */
> > +    unsigned int ndescs;
> >  } SVQElement;
>
> Can we simplify things furtherly by moving ndscs into a dedicated array a=
t svq?
>
> Then we don't need to bother with introducing SVQElement.
>

Yes, I'll move to a desc_state.

Thanks!

> Thanks
>
> >
> >  /* Shadow virtqueue to relay notifications */
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 442ca3cbd3..3b112c4ec8 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -243,10 +243,10 @@ static int vhost_svq_add(VhostShadowVirtqueue *sv=
q, const struct iovec *out_sg,
> >                            size_t in_num, SVQElement *svq_elem)
> >  {
> >      unsigned qemu_head;
> > -    unsigned ndescs =3D in_num + out_num;
> > +    svq_elem->ndescs =3D in_num + out_num;
> >      bool ok;
> >
> > -    if (unlikely(ndescs > vhost_svq_available_slots(svq))) {
> > +    if (unlikely(svq_elem->ndescs > vhost_svq_available_slots(svq))) {
> >          return -ENOSPC;
> >      }
> >
> > @@ -393,7 +393,7 @@ static SVQElement *vhost_svq_get_buf(VhostShadowVir=
tqueue *svq,
> >      SVQElement *elem;
> >      const vring_used_t *used =3D svq->vring.used;
> >      vring_used_elem_t used_elem;
> > -    uint16_t last_used, last_used_chain, num;
> > +    uint16_t last_used, last_used_chain;
> >
> >      if (!vhost_svq_more_used(svq)) {
> >          return NULL;
> > @@ -420,8 +420,8 @@ static SVQElement *vhost_svq_get_buf(VhostShadowVir=
tqueue *svq,
> >      }
> >
> >      elem =3D svq->ring_id_maps[used_elem.id];
> > -    num =3D elem->elem.in_num + elem->elem.out_num;
> > -    last_used_chain =3D vhost_svq_last_desc_of_chain(svq, num, used_el=
em.id);
> > +    last_used_chain =3D vhost_svq_last_desc_of_chain(svq, elem->ndescs=
,
> > +                                                   used_elem.id);
> >      svq->desc_next[last_used_chain] =3D svq->free_head;
> >      svq->free_head =3D used_elem.id;
> >
> > --
> > 2.31.1
> >
>


