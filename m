Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929204EE924
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 09:33:27 +0200 (CEST)
Received: from localhost ([::1]:37494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naBmg-0007B1-73
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 03:33:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1naBkO-00062s-BL
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 03:31:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1naBkK-0008Nk-US
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 03:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648798259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U+QoTTB42Cl3YpxU5hW3T7ewqyHCwI41VIU6AK1BeoA=;
 b=GgIWdyeaRgHGOjLVRU3XmNByqo2irnAzXfQ0fgdAqmNBoc3MsbDQ3YCijjwZAdmGBUNmLn
 wBkUlfVDtMXpPH+6OjesJVVzWFxV4S90kWSHQfyb7Vf6ec4auEA50to0MfTCKaY9s42pi5
 J5SLCqUvmK7/mSYvT71v3A6npe530YU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-FogxQTdANzKxnb9inR1UlA-1; Fri, 01 Apr 2022 03:30:58 -0400
X-MC-Unique: FogxQTdANzKxnb9inR1UlA-1
Received: by mail-qv1-f71.google.com with SMTP id
 z1-20020ad44781000000b00440ded04b09so1398311qvy.22
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 00:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U+QoTTB42Cl3YpxU5hW3T7ewqyHCwI41VIU6AK1BeoA=;
 b=mzacaej9bYFgXxQrXU0YdjSZk7JSB4L/0lIRs1RbZgdk+kH0fvBmlJIb9Ak9TSfGFe
 xTbBM2j40Mw+6jZ4dbbP3UFPTv1NHw5p3ZPiq99DFGT5isra/yr9oqIVDyRIYi/JOjKV
 hjVS43zjikDCWjyBzpOuKYA9tnVJRowl7xKL5XtBLGVcdc8z7GpU7TpttNKMVy7kUxwI
 Rh1CLZcEZDWCK6IQ3Od/aNs8FA09OjLWLPumYAxWBuhae5IiKpcx2JOH8wrnbxwd6dOX
 CG4GjcNwZOIIJ+cKqFPa0Nn8V6glfA6ZGKYaxDIVfaODCE6bgsgTCdHJWOdtujjK2HeF
 Vfdg==
X-Gm-Message-State: AOAM531EelFaN2ZPCab6un5tGEQLE1QzeDDmvWIketArHEkJIZ8q1SoJ
 sVlZThd21u2bsnx3ZCmQMSEdxXxfvCYXKRnky75eNLbQl7zCvgn3HM+72CcBCuwplaqscH8w5hm
 cdL6vJGc0MUVw7VMJUuv9UNbOyFm7M80=
X-Received: by 2002:a05:620a:2098:b0:67b:4698:aa93 with SMTP id
 e24-20020a05620a209800b0067b4698aa93mr5665303qka.764.1648798258050; 
 Fri, 01 Apr 2022 00:30:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG9KzK4+kjENd8sPQv4UJ7YAogMbrYBQj+d+Lu+jFBd2XX0iXQldaO/z+msbegqEqg6NYwwN3pJ0qLVhBBJLk=
X-Received: by 2002:a05:620a:2098:b0:67b:4698:aa93 with SMTP id
 e24-20020a05620a209800b0067b4698aa93mr5665292qka.764.1648798257793; Fri, 01
 Apr 2022 00:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220331181451.534433-1-eperezma@redhat.com>
 <CACGkMEsfBRFHMRVSUFDxjnLGc6WdmtcEwAiXGmuue7j4_-Ybew@mail.gmail.com>
In-Reply-To: <CACGkMEsfBRFHMRVSUFDxjnLGc6WdmtcEwAiXGmuue7j4_-Ybew@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 1 Apr 2022 09:30:21 +0200
Message-ID: <CAJaqyWfJtf=SJmpFo8M-HO=9qJRV7HEh5uv4rcHWsrD96OuauQ@mail.gmail.com>
Subject: Re: [PATCH] vhost: Fix bad return of descriptors to SVQ
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Fri, Apr 1, 2022 at 4:30 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Apr 1, 2022 at 2:14 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
> >
> > Only the first one of them were properly enqueued back.
> >
> > Fixes: 100890f7ca ("vhost: Shadow virtqueue buffers forwarding")
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/virtio/vhost-shadow-virtqueue.c | 17 +++++++++++++++--
> >  1 file changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index b232803d1b..c17506df20 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -333,13 +333,25 @@ static void vhost_svq_disable_notification(VhostS=
hadowVirtqueue *svq)
> >      svq->vring.avail->flags |=3D cpu_to_le16(VRING_AVAIL_F_NO_INTERRUP=
T);
> >  }
> >
> > +static uint16_t vhost_svq_last_desc_of_chain(VhostShadowVirtqueue *svq=
,
> > +                                             uint16_t i)
> > +{
> > +    vring_desc_t *descs =3D svq->vring.desc;
> > +
> > +    while (le16_to_cpu(descs[i].flags) & VRING_DESC_F_NEXT) {
> > +        i =3D le16_to_cpu(descs[i].next);
>
>
> This seems to be a guest trigger-able infinite loop?
>

This is the list of the SVQ vring. We could consider an infinite loop
triggable by the device if it can write the vring directly.

I can add a counter in the loop, or to maintain an internal copy of
the vring so it's completely hardened against malicious/bad devices.
It should be done for packed vring anyway.

Thanks!

> Thanks
>
>
> > +    }
> > +
> > +    return i;
> > +}
> > +
> >  static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
> >                                             uint32_t *len)
> >  {
> >      vring_desc_t *descs =3D svq->vring.desc;
> >      const vring_used_t *used =3D svq->vring.used;
> >      vring_used_elem_t used_elem;
> > -    uint16_t last_used;
> > +    uint16_t last_used, last_used_chain;
> >
> >      if (!vhost_svq_more_used(svq)) {
> >          return NULL;
> > @@ -365,7 +377,8 @@ static VirtQueueElement *vhost_svq_get_buf(VhostSha=
dowVirtqueue *svq,
> >          return NULL;
> >      }
> >
> > -    descs[used_elem.id].next =3D svq->free_head;
> > +    last_used_chain =3D vhost_svq_last_desc_of_chain(svq, used_elem.id=
);
> > +    descs[last_used_chain].next =3D svq->free_head;
> >      svq->free_head =3D used_elem.id;
> >
> >      *len =3D used_elem.len;
> > --
> > 2.27.0
> >
>


