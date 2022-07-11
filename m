Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A969B56FDC9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 12:00:17 +0200 (CEST)
Received: from localhost ([::1]:37382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAqD9-0006BY-MI
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 06:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oAqAA-0003cv-5K
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:57:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oAqA6-0001Cv-Ih
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657533423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UVbEOMCfx0G/ugvjJlV6i2w01cozwQwl9k6y6JsmrC8=;
 b=AujHkoMXGX8/knpQTURIRv8nyo57Z5VHwXQbDSdgTm/+olBbQBiFhNsuFUxdDoR3SRCH0M
 rdZuQep2oTKf4Xom5tbwjOF1cxuX+0q6QJ2r25KWAA+9mg25TjNPxpmpa3bATAyLyI6mC3
 OZdjamOKdwO2L88sZO6vqsXCkHkjsNM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-S0U9SJq3MVSbTmpofTdHIA-1; Mon, 11 Jul 2022 05:56:59 -0400
X-MC-Unique: S0U9SJq3MVSbTmpofTdHIA-1
Received: by mail-qk1-f197.google.com with SMTP id
 az32-20020a05620a172000b006b58ce94435so1450554qkb.1
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 02:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UVbEOMCfx0G/ugvjJlV6i2w01cozwQwl9k6y6JsmrC8=;
 b=Ekzgl4uzOKs5h+Gw8W+3EqfvtTtEBsE0q6zxfKIXJaPZZrR7wXYld7dp2dAomfAY9d
 uF9UR9U1kM3SZBftFWGJvqhIyWjSSkTg00pogkRaixNO1fms52R4BQYhtd1jRQRQZSRX
 qrmqEd1ceWdlq+TOdIN+DDRpHeDbtySjlMImiKEkdJYRTw7gFzNm0/FzLrzIwulNno//
 DW/6jjg5hHPn4TMhHvhIdkAzmilo+UDf09eRY+WBeMB5+PpsGpGrsP1oiMIptsEG8+VE
 WTaxsisAdeMN2WRi7hGrHtAjFXbM9w6MV2u8w8cmhowD0C3Bdyl+zwItXlsw6v8sglbn
 3HMQ==
X-Gm-Message-State: AJIora+uZgk/s8eDlyub4tlGuuBFqAwS+38xk0iYqabRnh6akmWL5DeK
 ktEYvK/MWX6c7uiTABe+WigJmhQZHN2+XQbUJkLELs48VDYJUlYwOuTY7uleLwxUifmGo34pH3u
 htlgLR5rIykK8bcw+cDglDBuWnXC30HE=
X-Received: by 2002:ac8:5dca:0:b0:31e:85b8:8a18 with SMTP id
 e10-20020ac85dca000000b0031e85b88a18mr12870396qtx.370.1657533416514; 
 Mon, 11 Jul 2022 02:56:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tQeGFfSrekD2DJz4jcM8PTFbqwkCmFbybOdC0OIsR62xS2OOl3AlaJDkht5JmfjHT2ZrtfYkQYML005nRmHks=
X-Received: by 2002:ac8:5dca:0:b0:31e:85b8:8a18 with SMTP id
 e10-20020ac85dca000000b0031e85b88a18mr12870386qtx.370.1657533416267; Mon, 11
 Jul 2022 02:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-13-eperezma@redhat.com>
 <ffa1e417-846a-0da8-7fa1-fe473e860215@redhat.com>
In-Reply-To: <ffa1e417-846a-0da8-7fa1-fe473e860215@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 11 Jul 2022 11:56:20 +0200
Message-ID: <CAJaqyWccXPE5A4wAQb5rymPGfEDjQzNMeVCHhjCAXww2fdk7Pw@mail.gmail.com>
Subject: Re: [RFC PATCH v9 12/23] vhost: Add opaque member to SVQElement
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eric Blake <eblake@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
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

On Mon, Jul 11, 2022 at 11:05 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/7/7 02:39, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > When qemu injects buffers to the vdpa device it will be used to maintai=
n
> > contextual data. If SVQ has no operation, it will be used to maintain
> > the VirtQueueElement pointer.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |  3 ++-
> >   hw/virtio/vhost-shadow-virtqueue.c | 13 +++++++------
> >   2 files changed, 9 insertions(+), 7 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index 0e434e9fd0..a811f90e01 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -16,7 +16,8 @@
> >   #include "hw/virtio/vhost-iova-tree.h"
> >
> >   typedef struct SVQElement {
> > -    VirtQueueElement *elem;
> > +    /* Opaque data */
> > +    void *opaque;
>
>
> So I wonder if we can simply:
>
> 1) introduce a opaque to VirtQueueElement

(answered in other thread, pasting here for completion)

It does not work for messages that are not generated by the guest. For
example, the ones used to restore the device state at live migration
destination.

> 2) store pointers to ring_id_maps
>

I think you mean to keep storing VirtQueueElement at ring_id_maps?
Otherwise, looking for them will not be immediate.

> Since
>
> 1) VirtQueueElement's member looks general

Not general enough :).

> 2) help to reduce the tricky codes like vhost_svq_empty_elem() and
> vhost_svq_empty_elem().
>

I'm ok to change to whatever other method, but to allocate them
individually seems worse to me. Both performance wise and because
error paths are more complicated. Maybe it would be less tricky if I
try to move the use of them less "by value" and more "as pointers"?

Thanks!

> Thanks
>
>
> >
> >       /* Last descriptor of the chain */
> >       uint32_t last_chain_id;
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index c5e49e51c5..492bb12b5f 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -237,7 +237,7 @@ static uint16_t vhost_svq_last_desc_of_chain(const =
VhostShadowVirtqueue *svq,
> >    */
> >   static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iov=
ec *out_sg,
> >                             size_t out_num, const struct iovec *in_sg,
> > -                          size_t in_num, VirtQueueElement *elem)
> > +                          size_t in_num, void *opaque)
> >   {
> >       SVQElement *svq_elem;
> >       unsigned qemu_head;
> > @@ -245,13 +245,12 @@ static bool vhost_svq_add(VhostShadowVirtqueue *s=
vq, const struct iovec *out_sg,
> >       bool ok =3D vhost_svq_add_split(svq, out_sg, out_num, in_sg, in_n=
um,
> >                                     &qemu_head);
> >       if (unlikely(!ok)) {
> > -        g_free(elem);
> >           return false;
> >       }
> >
> >       n =3D out_num + in_num;
> >       svq_elem =3D &svq->ring_id_maps[qemu_head];
> > -    svq_elem->elem =3D elem;
> > +    svq_elem->opaque =3D opaque;
> >       svq_elem->last_chain_id =3D vhost_svq_last_desc_of_chain(svq, n, =
qemu_head);
> >       return true;
> >   }
> > @@ -277,6 +276,8 @@ static bool vhost_svq_add_element(VhostShadowVirtqu=
eue *svq,
> >                               elem->in_num, elem);
> >       if (ok) {
> >           vhost_svq_kick(svq);
> > +    } else {
> > +        g_free(elem);
> >       }
> >
> >       return ok;
> > @@ -392,7 +393,7 @@ static void vhost_svq_disable_notification(VhostSha=
dowVirtqueue *svq)
> >
> >   static bool vhost_svq_is_empty_elem(SVQElement elem)
> >   {
> > -    return elem.elem =3D=3D NULL;
> > +    return elem.opaque =3D=3D NULL;
> >   }
> >
> >   static SVQElement vhost_svq_empty_elem(void)
> > @@ -483,7 +484,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *s=
vq,
> >                   break;
> >               }
> >
> > -            elem =3D g_steal_pointer(&svq_elem.elem);
> > +            elem =3D g_steal_pointer(&svq_elem.opaque);
> >               virtqueue_fill(vq, elem, len, i++);
> >           }
> >
> > @@ -651,7 +652,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
> >
> >       for (unsigned i =3D 0; i < svq->vring.num; ++i) {
> >           g_autofree VirtQueueElement *elem =3D NULL;
> > -        elem =3D g_steal_pointer(&svq->ring_id_maps[i].elem);
> > +        elem =3D g_steal_pointer(&svq->ring_id_maps[i].opaque);
> >           if (elem) {
> >               virtqueue_detach_element(svq->vq, elem, 0);
> >           }
>


