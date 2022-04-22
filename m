Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35D850B3B1
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:14:44 +0200 (CEST)
Received: from localhost ([::1]:48648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhpND-0004g3-RS
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nhpAT-0001kz-RQ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:01:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nhpAS-0001QY-85
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:01:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650618091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6rcqxtDYZfYEFmQuaGy/Zz5mLgKrryIAhz3Zjl8G8+c=;
 b=ZtBIT8KkGGN25kgfy9yrWttEdEvwSy6oKooaIL8Fnm6aCDwhjTPO09HHKZ83nrKbirgoIP
 tBFaITfgeEwmvl6960Y+WA863+L20bFyY0atqJbkzFynBZqMMW2UecMx7PLelfh7itx2fl
 VdTBXjkwUvG746BaADrDHtDdM5jnLqM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-ZSNGNkZTNwqFTmka6Nyhww-1; Fri, 22 Apr 2022 05:01:30 -0400
X-MC-Unique: ZSNGNkZTNwqFTmka6Nyhww-1
Received: by mail-qv1-f72.google.com with SMTP id
 30-20020a0c80a1000000b00446218e1bcbso6002819qvb.23
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 02:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6rcqxtDYZfYEFmQuaGy/Zz5mLgKrryIAhz3Zjl8G8+c=;
 b=FVwwxUf6DiuyX6uxpyHYTgIQrCsLFbwYPuJHaZgS0YmecCqKN/FNvoATmsV+QqW0ls
 hXReQjeWwNg1XIB7d/FlawhaOkjb0oKrGFCWGIhLUxbvZrwLYdOLJ3DeapqVyvnXVRiL
 zayILrrJlsDQ+hA2Uh8cuO4J/qtfcEgkSh22dhJEDttmcdlvnucG67mRmVMS4AapFwcM
 htAzvzaB5JsfU4vl3Asn4d7IXxULp+9aoauPSQgLhV7BhH+PVlu40nyhDvEXjMqP1XxY
 dwpoggClp95aG91ysWpuReJ6iTe2rHBHi24ySWx7Fct8MqwjK/irYxvdDZul3EFeJta2
 A1HA==
X-Gm-Message-State: AOAM533e/ZiKCyKKSXOFuwdEludNN6eKx+WJq6tZUjxkXubuVDgfEhtu
 ws0/D9rCznQBwEmYPnFPyM1Vjsms/QJZqG/WGpBTebiDufgt+QXQaSGgGozXDeDj0MguVUybk1e
 AQpIzEnIkQMc6ZqxhoNCY2f8t99XfIUk=
X-Received: by 2002:a05:622a:507:b0:2f3:57bd:1241 with SMTP id
 l7-20020a05622a050700b002f357bd1241mr1631925qtx.199.1650618089678; 
 Fri, 22 Apr 2022 02:01:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyul97qQkpFIVAW86b9NvvntnwYkiwUgnB0Ir9S74ahKilBoam6WKfAxarMtaLxnQfJ41JYkKp66IAnTv+L0Zs=
X-Received: by 2002:a05:622a:507:b0:2f3:57bd:1241 with SMTP id
 l7-20020a05622a050700b002f357bd1241mr1631904qtx.199.1650618089435; Fri, 22
 Apr 2022 02:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220408133415.1371760-1-eperezma@redhat.com>
 <20220408133415.1371760-3-eperezma@redhat.com>
 <da439f38-00dc-e75e-63ee-3d9db15ba30b@redhat.com>
In-Reply-To: <da439f38-00dc-e75e-63ee-3d9db15ba30b@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 22 Apr 2022 11:00:53 +0200
Message-ID: <CAJaqyWcB58cQfu5cACJi6taFypSW_bd_U=b7291bzkk0S8o7Xg@mail.gmail.com>
Subject: Re: [RFC PATCH v5 02/23] vdpa: Fix bad index calculus at
 vhost_vdpa_get_vring_base
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Gautam Dawar <gdawar@xilinx.com>, Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Peter Xu <peterx@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 14, 2022 at 5:34 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/4/8 21:33, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Fixes: 6d0b222666 ("vdpa: Adapt vhost_vdpa_get_vring_base to SVQ")
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
>
>
> Acked-by: Jason Wang <jasowang@redhat.com>
>
> I think we need to use a separate patch for this.
>

Do you mean I should send this patch in a separate series? I can batch
all the fixes for SVQ.

>
> >   hw/virtio/vhost-vdpa.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 9e5fe15d03..1f229ff4cb 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -1172,11 +1172,11 @@ static int vhost_vdpa_get_vring_base(struct vho=
st_dev *dev,
> >                                          struct vhost_vring_state *ring=
)
> >   {
> >       struct vhost_vdpa *v =3D dev->opaque;
> > +    int vdpa_idx =3D ring->index - dev->vq_index;
> >       int ret;
> >
> >       if (v->shadow_vqs_enabled) {
> > -        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs,
> > -                                                      ring->index);
> > +        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs,=
 vdpa_idx);
> >
> >           /*
> >            * Setting base as last used idx, so destination will see as =
available
>


