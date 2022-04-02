Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105644EFDC6
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 03:33:29 +0200 (CEST)
Received: from localhost ([::1]:41860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naSdr-00071C-Kz
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 21:33:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1naScn-0005rw-Ow
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 21:32:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1naScj-00026y-SX
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 21:32:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648863136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YMl+oCJf5ownBL+sTkh/XHBx5mduOfwaENyaukOw97o=;
 b=bDUrFh7hVHa99Z1N4kIJbJ2ZUoePvuQRjpfXgSBDBeryx1yO5oqCV9UOc1zNNq3Emixe8w
 +nXVYL1PkesE0C30i5/0DQy0PbrSI0LYUgEt7XNRnhswrD/+astR+ud5W3E0vTaLMtnYhR
 DHgJuRpPUleAk7/hnwHtcH3gFAiPEWI=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-teTzL6VXOk2EWS9Om6CBhA-1; Fri, 01 Apr 2022 21:32:14 -0400
X-MC-Unique: teTzL6VXOk2EWS9Om6CBhA-1
Received: by mail-lf1-f72.google.com with SMTP id
 bi4-20020a0565120e8400b0044acdd98ce2so1893642lfb.17
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 18:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YMl+oCJf5ownBL+sTkh/XHBx5mduOfwaENyaukOw97o=;
 b=yBX2WHMKlcAt8ysN/s12mTuOoxgGNDMKBsETZYCmz/RZWs/B/69h61NGhc8VSj9+0E
 ai0n48WSzIpw4SpC2N1OiJ9TYUtDwfew1fks8ED8JmXnbEhudAG9jBTCPi3CnuuHZz9F
 2BOjqwzGFSVWlaKqdOBTG/ICV+e15I/zUO3TqJkebsf/Fauz4NCTGqsnT5eQxKmbRlgX
 Y1oTKHFGB7H3WHSgpFF3+lp5zjYgBBeEpH7vFCUoM88VkjjOPmHC74PuxdOVVhS2+2eW
 r7LreQPR7Y/y5SA0HSyUmzV/9TwEhGu/G+sNCC94pAUIGCIU/r/LO+cjEDYKnPTfabvU
 999Q==
X-Gm-Message-State: AOAM531WYd2XR4IOPBVH/wg2bjbvyHC3ZWKHWqJIMqdSE2H7eoBuilxe
 3+fZUa+R49AFSE1SgEEXHPQiuVf8UxqK9ykam1vZlskIYJ9/YKlomtUqsn1/4hbm0jfvGtTNj+l
 xs346SdUAVVTfDChZks/Cuikv+XaT6XQ=
X-Received: by 2002:a2e:534a:0:b0:24a:f64f:a1d6 with SMTP id
 t10-20020a2e534a000000b0024af64fa1d6mr7596645ljd.315.1648863133206; 
 Fri, 01 Apr 2022 18:32:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzH2S7l9irroTTGJjO7fTj5aJYiTRVZiehKh3GQe79ZXrT/h9Wyk9FT04oMiZjqbU7E8LTFW3bNrrCcTpLXGUM=
X-Received: by 2002:a2e:534a:0:b0:24a:f64f:a1d6 with SMTP id
 t10-20020a2e534a000000b0024af64fa1d6mr7596632ljd.315.1648863132943; Fri, 01
 Apr 2022 18:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220331181451.534433-1-eperezma@redhat.com>
 <CACGkMEsfBRFHMRVSUFDxjnLGc6WdmtcEwAiXGmuue7j4_-Ybew@mail.gmail.com>
 <CAJaqyWfJtf=SJmpFo8M-HO=9qJRV7HEh5uv4rcHWsrD96OuauQ@mail.gmail.com>
In-Reply-To: <CAJaqyWfJtf=SJmpFo8M-HO=9qJRV7HEh5uv4rcHWsrD96OuauQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Sat, 2 Apr 2022 09:32:02 +0800
Message-ID: <CACGkMEuR_tiPCs+5jkN_1=Z6JTYX80K7EcBpJL1+Sgs2K4-tfg@mail.gmail.com>
Subject: Re: [PATCH] vhost: Fix bad return of descriptors to SVQ
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 1, 2022 at 3:31 PM Eugenio Perez Martin <eperezma@redhat.com> w=
rote:
>
> On Fri, Apr 1, 2022 at 4:30 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Fri, Apr 1, 2022 at 2:14 AM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
> > >
> > > Only the first one of them were properly enqueued back.
> > >
> > > Fixes: 100890f7ca ("vhost: Shadow virtqueue buffers forwarding")
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > ---
> > >  hw/virtio/vhost-shadow-virtqueue.c | 17 +++++++++++++++--
> > >  1 file changed, 15 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-sha=
dow-virtqueue.c
> > > index b232803d1b..c17506df20 100644
> > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > @@ -333,13 +333,25 @@ static void vhost_svq_disable_notification(Vhos=
tShadowVirtqueue *svq)
> > >      svq->vring.avail->flags |=3D cpu_to_le16(VRING_AVAIL_F_NO_INTERR=
UPT);
> > >  }
> > >
> > > +static uint16_t vhost_svq_last_desc_of_chain(VhostShadowVirtqueue *s=
vq,
> > > +                                             uint16_t i)
> > > +{
> > > +    vring_desc_t *descs =3D svq->vring.desc;
> > > +
> > > +    while (le16_to_cpu(descs[i].flags) & VRING_DESC_F_NEXT) {
> > > +        i =3D le16_to_cpu(descs[i].next);
> >
> >
> > This seems to be a guest trigger-able infinite loop?
> >
>
> This is the list of the SVQ vring. We could consider an infinite loop
> triggable by the device if it can write the vring directly.
>

Ok.

> I can add a counter in the loop, or to maintain an internal copy of
> the vring so it's completely hardened against malicious/bad devices.
> It should be done for packed vring anyway.

Yes, let's do that. It would be better if we don't trust the device.

Thanks

>
> Thanks!
>
> > Thanks
> >
> >
> > > +    }
> > > +
> > > +    return i;
> > > +}
> > > +
> > >  static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq=
,
> > >                                             uint32_t *len)
> > >  {
> > >      vring_desc_t *descs =3D svq->vring.desc;
> > >      const vring_used_t *used =3D svq->vring.used;
> > >      vring_used_elem_t used_elem;
> > > -    uint16_t last_used;
> > > +    uint16_t last_used, last_used_chain;
> > >
> > >      if (!vhost_svq_more_used(svq)) {
> > >          return NULL;
> > > @@ -365,7 +377,8 @@ static VirtQueueElement *vhost_svq_get_buf(VhostS=
hadowVirtqueue *svq,
> > >          return NULL;
> > >      }
> > >
> > > -    descs[used_elem.id].next =3D svq->free_head;
> > > +    last_used_chain =3D vhost_svq_last_desc_of_chain(svq, used_elem.=
id);
> > > +    descs[last_used_chain].next =3D svq->free_head;
> > >      svq->free_head =3D used_elem.id;
> > >
> > >      *len =3D used_elem.len;
> > > --
> > > 2.27.0
> > >
> >
>


