Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64948543C76
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 21:08:03 +0200 (CEST)
Received: from localhost ([::1]:41934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz12A-0000Pn-4z
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 15:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nz0z1-0006Qq-N4
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 15:04:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nz0yy-0003hT-ME
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 15:04:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654715083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJqoslDcvOLQJTWS5JKdivyDQ+IEvlonWLmphzKkguc=;
 b=UT7vazpp+O50EsLcmgKc/RMAr+HbI6WkEjXngYLqFthIn6wvEEvIB6DBLIByA8a64VUs7L
 plbms32ybopbHeobQJnRUYgZXkPco0IL2Zvg5vzuzBnWca0UyHTmrKjf4iVcZFRk+RS3MR
 /BEuOmKTnSzfaJRA3VvHhs4fK5qL/MQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-ViyeHxKZOKSpbShPBO3T9w-1; Wed, 08 Jun 2022 15:04:42 -0400
X-MC-Unique: ViyeHxKZOKSpbShPBO3T9w-1
Received: by mail-qt1-f198.google.com with SMTP id
 v1-20020a05622a014100b002f93e6b1e8cso17015873qtw.9
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 12:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XJqoslDcvOLQJTWS5JKdivyDQ+IEvlonWLmphzKkguc=;
 b=reJ/2gXe/KvCXRwTTFtyrb+RWoZfqlMqhz4W5abxduGipQNUMuWWuttbLVywdbVdpM
 YS28dd65T1GYPUwVh17kFjVnT9YrB1tNYMzCTHKCHkkTMVqkaikKYtPpAg0yG8KC3NvQ
 E8OqxbWZ8U9CZ/mWP/nZtXUvy7JqrKB/a1omSIGNWV9l1pkxA7oZHZjhzwWWkaVi/Bdv
 1xmb0DvOJ3C71HhMHncGZdtuHPrxw/F0jkZKb/iNzKWX3E52mBVmLHtS15tcPE4F9p1P
 +5b5v61dfwkG0t6heN6kgja/ahuaBiAX3NuVSjwc6zjlbvya/HoLmspyky8GWsuKnC1v
 3eyQ==
X-Gm-Message-State: AOAM5326POsZF95s0WIK4kwaB22Ijip9KeoR0vYMtY1RFzk3WRWb4oWS
 GuOfftrqjhE91unX95uF66f+3Lw1nL57kzZfoqg6IccI+NIbFh7jm7Q6PcYXlA2eoXYAYkdRzP0
 4Z2Quwpz6scngGes0bZKEnXH79JQd2Q4=
X-Received: by 2002:ac8:598f:0:b0:305:8f8:2069 with SMTP id
 e15-20020ac8598f000000b0030508f82069mr1959807qte.370.1654715081214; 
 Wed, 08 Jun 2022 12:04:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3imRhza4wzL0Tjcei3mPBBrFngQfbHqF6nqCjc/ScF9lNaYiH3eMymL9aRU1Qk0D4woKAnFozNlywe8wpM2U=
X-Received: by 2002:ac8:598f:0:b0:305:8f8:2069 with SMTP id
 e15-20020ac8598f000000b0030508f82069mr1959770qte.370.1654715080834; Wed, 08
 Jun 2022 12:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220519191306.821774-1-eperezma@redhat.com>
 <20220519191306.821774-12-eperezma@redhat.com>
 <4e097d14-9422-bff5-d52c-74ae9fceede1@redhat.com>
In-Reply-To: <4e097d14-9422-bff5-d52c-74ae9fceede1@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 8 Jun 2022 21:04:04 +0200
Message-ID: <CAJaqyWf9bnGOWE47u-GogFykpc4tqjfJMrFzv9JRFiEFy_4pkA@mail.gmail.com>
Subject: Re: [RFC PATCH v8 11/21] vhost: Update kernel headers
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Eric Blake <eblake@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Wed, Jun 8, 2022 at 6:19 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/5/20 03:12, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
>
>
> It's better to use the helpers in scripts/ and mentioned to which
> version is this synced.
>

Right, I should have written somewhere this was in the meantime it was
accepted in Linux master :). I'll use the scripts for the next
version.

Thanks!

> Thanks
>
>
> >   include/standard-headers/linux/vhost_types.h | 11 ++++++++-
> >   linux-headers/linux/vhost.h                  | 25 ++++++++++++++++---=
-
> >   2 files changed, 30 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/standard-headers/linux/vhost_types.h b/include/sta=
ndard-headers/linux/vhost_types.h
> > index 0bd2684a2a..ce78551b0f 100644
> > --- a/include/standard-headers/linux/vhost_types.h
> > +++ b/include/standard-headers/linux/vhost_types.h
> > @@ -87,7 +87,7 @@ struct vhost_msg {
> >
> >   struct vhost_msg_v2 {
> >       uint32_t type;
> > -     uint32_t reserved;
> > +     uint32_t asid;
> >       union {
> >               struct vhost_iotlb_msg iotlb;
> >               uint8_t padding[64];
> > @@ -153,4 +153,13 @@ struct vhost_vdpa_iova_range {
> >   /* vhost-net should add virtio_net_hdr for RX, and strip for TX packe=
ts. */
> >   #define VHOST_NET_F_VIRTIO_NET_HDR 27
> >
> > +/* Use message type V2 */
> > +#define VHOST_BACKEND_F_IOTLB_MSG_V2 0x1
> > +/* IOTLB can accept batching hints */
> > +#define VHOST_BACKEND_F_IOTLB_BATCH  0x2
> > +/* IOTLB can accept address space identifier through V2 type of IOTLB
> > + * message
> > + */
> > +#define VHOST_BACKEND_F_IOTLB_ASID  0x3
> > +
> >   #endif
> > diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
> > index 5d99e7c242..d42eb46efd 100644
> > --- a/linux-headers/linux/vhost.h
> > +++ b/linux-headers/linux/vhost.h
> > @@ -89,11 +89,6 @@
> >
> >   /* Set or get vhost backend capability */
> >
> > -/* Use message type V2 */
> > -#define VHOST_BACKEND_F_IOTLB_MSG_V2 0x1
> > -/* IOTLB can accept batching hints */
> > -#define VHOST_BACKEND_F_IOTLB_BATCH  0x2
> > -
> >   #define VHOST_SET_BACKEND_FEATURES _IOW(VHOST_VIRTIO, 0x25, __u64)
> >   #define VHOST_GET_BACKEND_FEATURES _IOR(VHOST_VIRTIO, 0x26, __u64)
> >
> > @@ -154,6 +149,26 @@
> >   /* Get the config size */
> >   #define VHOST_VDPA_GET_CONFIG_SIZE  _IOR(VHOST_VIRTIO, 0x79, __u32)
> >
> > +/* Get the number of virtqueue groups. */
> > +#define VHOST_VDPA_GET_GROUP_NUM     _IOR(VHOST_VIRTIO, 0x7A, unsigned=
 int)
> > +
> > +/* Get the number of address spaces. */
> > +#define VHOST_VDPA_GET_AS_NUM                _IOR(VHOST_VIRTIO, 0x7B, =
unsigned int)
> > +
> > +/* Get the group for a virtqueue: read index, write group in num,
> > + * The virtqueue index is stored in the index field of
> > + * vhost_vring_state. The group for this specific virtqueue is
> > + * returned via num field of vhost_vring_state.
> > + */
> > +#define VHOST_VDPA_GET_VRING_GROUP   _IOWR(VHOST_VIRTIO, 0x7C,       \
> > +                                           struct vhost_vring_state)
> > +/* Set the ASID for a virtqueue group. The group index is stored in
> > + * the index field of vhost_vring_state, the ASID associated with this
> > + * group is stored at num field of vhost_vring_state.
> > + */
> > +#define VHOST_VDPA_SET_GROUP_ASID    _IOW(VHOST_VIRTIO, 0x7D, \
> > +                                          struct vhost_vring_state)
> > +
> >   /* Get the count of all virtqueues */
> >   #define VHOST_VDPA_GET_VQS_COUNT    _IOR(VHOST_VIRTIO, 0x80, __u32)
> >
>


