Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA7A4C8599
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 08:54:12 +0100 (CET)
Received: from localhost ([::1]:41332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOxKl-0002c8-EV
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 02:54:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nOxIR-0001rn-Bz
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 02:51:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nOxIO-00066B-TA
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 02:51:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646121102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dEbWma9HZFbQYox9hXdXkCi1jb95WHegikVTj8TTdTc=;
 b=DDOCSb3uPmqBtNqaybxnaF8pngw7syllc/3aF8v6ZRhCOpvTlM0AqOtS0IbBnsnCd5w5sT
 ZL0wzlD8gEMgUvicBIcIwcWbYomUN7CHVPOovp7UT2fKq38L1Uaqwivbo401OJhCzvHxLj
 IZLYVV+AOpkiG7X20cBag/Ry4qf2LB8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-HKXuk934NMqx99gk1kwbKQ-1; Tue, 01 Mar 2022 02:51:41 -0500
X-MC-Unique: HKXuk934NMqx99gk1kwbKQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 f13-20020ac8014d000000b002ddae786fb0so6716000qtg.19
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 23:51:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dEbWma9HZFbQYox9hXdXkCi1jb95WHegikVTj8TTdTc=;
 b=v1QtoSrT/1wfMc+Aam/v+dIEwAduAsAV4mw7/1Z0R9+WnkcyDNWLZLtz7IlO1AKq4P
 itsgtcuKQYDGLYQ7+Dqv6aGFzwiOCJUWbeaBiDruxHMMvbgDhWLGpmZ/jhllybWkI+IJ
 CR7HQcUDHn7U2xFwuBCqV57w2toe4Ah0gDaxqhju9buWTqbMqlgfq8WWJ6xgdN1bxbt/
 2VpWDHsIdibvSbiqtJu3/X8B2Sw0bPs+iCHyaHkljfOwXvTldr/6WP4rcNR8bdafvggh
 UIpn4RntKpKg+sVFqwm/KIp0OId5EPiNJvuMnj1x81f9tmUfdmtoE2vSEdQXrK6+cXMO
 HcGQ==
X-Gm-Message-State: AOAM5316HPvD/uTgAXdhh5AIV99SeSNsF8VxN+zkF9rTqcUMea60TR3T
 hAjj5zSl1pp8+gimSLwevwMxNr7DLBhP/VQ8QU670jyAbEFp1bBGPE+N+SgzukAQhc5Q715//rU
 68wR+N0eQ3TJzL2fOIpSgZ0Dc0y9HjP0=
X-Received: by 2002:a05:622a:1e07:b0:2dd:d74c:b6bd with SMTP id
 br7-20020a05622a1e0700b002ddd74cb6bdmr19234123qtb.320.1646121100644; 
 Mon, 28 Feb 2022 23:51:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykeEvnFMhkCAnd3YpMeVb7CYsGQHjTWQWQqJqA+IIWasxPSsdhHlsFTb9gqvY5KNq2BJu+MVTtUp4jxpmlX/E=
X-Received: by 2002:a05:622a:1e07:b0:2dd:d74c:b6bd with SMTP id
 br7-20020a05622a1e0700b002ddd74cb6bdmr19234095qtb.320.1646121100399; Mon, 28
 Feb 2022 23:51:40 -0800 (PST)
MIME-Version: 1.0
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-12-eperezma@redhat.com>
 <d0a5454b-b01e-50a6-3a2d-e5223768a163@redhat.com>
In-Reply-To: <d0a5454b-b01e-50a6-3a2d-e5223768a163@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 1 Mar 2022 08:51:04 +0100
Message-ID: <CAJaqyWdUgR8_ggjWYtJhu5ARR6HcCFmKEn5OMxUUQVwMHcnppw@mail.gmail.com>
Subject: Re: [PATCH v2 11/14] vdpa: Adapt vhost_vdpa_get_vring_base to SVQ
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 28, 2022 at 8:38 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/2/27 =E4=B8=8B=E5=8D=889:41, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This is needed to achieve migration, so the destination can restore its
> > index.
>
>
> I suggest to duplicate the comment below here.
>

Sure, I'll duplicate here in the commit message.

Thanks!

> Thanks
>
>
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-vdpa.c | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 56f9f125cd..accc4024c2 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -1180,8 +1180,25 @@ static int vhost_vdpa_set_vring_base(struct vhos=
t_dev *dev,
> >   static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
> >                                          struct vhost_vring_state *ring=
)
> >   {
> > +    struct vhost_vdpa *v =3D dev->opaque;
> >       int ret;
> >
> > +    if (v->shadow_vqs_enabled) {
> > +        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs,
> > +                                                      ring->index);
> > +
> > +        /*
> > +         * Setting base as last used idx, so destination will see as a=
vailable
> > +         * all the entries that the device did not use, including the =
in-flight
> > +         * processing ones.
> > +         *
> > +         * TODO: This is ok for networking, but other kinds of devices=
 might
> > +         * have problems with these retransmissions.
> > +         */
> > +        ring->num =3D svq->last_used_idx;
> > +        return 0;
> > +    }
> > +
> >       ret =3D vhost_vdpa_call(dev, VHOST_GET_VRING_BASE, ring);
> >       trace_vhost_vdpa_get_vring_base(dev, ring->index, ring->num);
> >       return ret;
>


