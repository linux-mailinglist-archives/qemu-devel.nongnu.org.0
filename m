Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EB06242A3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 13:55:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot75P-0005kW-LS; Thu, 10 Nov 2022 07:55:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ot75B-0005ic-J9
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:55:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ot759-0001Z9-OG
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:55:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668084898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kv5D6nGeZeuA43cQkawKbkRfxQtTJUdYYzC/bcuYvc0=;
 b=X5M1hE5GkzGOsnmoTsyjALDnYjyp3eH2Rz8KW0QLvUvrxA++qdiGdguEMQtlY5Y3JckwM4
 K2Kdb5Oed/10gN1yGWI3g3IZCIa/ySP/IznOttiDNWWOOowSJNjGZBuiISXJOlL5DtVRY5
 JueYZJupzZKOyXHKprLD9Yl8OQiHvs8=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-149-aTG8i7NNNaeWCXzeJm7edw-1; Thu, 10 Nov 2022 07:54:57 -0500
X-MC-Unique: aTG8i7NNNaeWCXzeJm7edw-1
Received: by mail-pl1-f200.google.com with SMTP id
 n12-20020a170902e54c00b00188515e81a6so1316917plf.23
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 04:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kv5D6nGeZeuA43cQkawKbkRfxQtTJUdYYzC/bcuYvc0=;
 b=z75l4Kamz6Hlj645OWPGfOpGqBN4Z4nMVztynxy9wnL3jREr/KWUVk3ydRMsCumX4e
 npxIuB6M+Tcaws8SGNBgpFqvVmGPXx7kwaF1jj1Hf9hx2WZlWHg0D2eqedj37gi1zBM5
 WBa5bQxhOz7wch08doWfgZrViQ63kqYZfWRj/NL5PcHNxKVAvFFVwtzuQcSSo2Xyp0Qr
 Tr+BdqwmFXiefTH1xWWtxcSwTWByInwMEDLDlBhyMAjV2doMKYy+t8tcLt3RlEfajpVE
 AgTO4Ikx3WZhcJlcmwQnVkZxwQK3prNF961J1MJixTrV1SW/dbZ1nGzXk9LpG0nJgpHj
 L9mA==
X-Gm-Message-State: ACrzQf2WRlfVPO/4Cu75NJ+eOxC/JeNiA0ZFHvm3MpF/LrlToOebXTCb
 TPFheb/910ccs3LIBj7zM+C7b5DEzPJD5r0tXeBvCevATImKUKHhxWgfAbKBQ6qGtJ9x2MjIkCW
 ZkrV9Wx7wLl98K9mMupcKPsqdgtQ4kb8=
X-Received: by 2002:a17:902:ce82:b0:187:3591:edac with SMTP id
 f2-20020a170902ce8200b001873591edacmr48415181plg.153.1668084896463; 
 Thu, 10 Nov 2022 04:54:56 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5Cm0JGbxU9riW7wMxVo0gNnoX6jBW7PsAWVyfOuZl1wzOGsVVTjmJX6t9u+i577FFLTl11gxgK8m4ELOLS+NY=
X-Received: by 2002:a17:902:ce82:b0:187:3591:edac with SMTP id
 f2-20020a170902ce8200b001873591edacmr48415155plg.153.1668084896156; Thu, 10
 Nov 2022 04:54:56 -0800 (PST)
MIME-Version: 1.0
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221108170755.92768-2-eperezma@redhat.com>
 <CACGkMEtvbSbsNZQV5RB1yyNzpam4QezdJ-f75nh4ToMJU=KYQQ@mail.gmail.com>
In-Reply-To: <CACGkMEtvbSbsNZQV5RB1yyNzpam4QezdJ-f75nh4ToMJU=KYQQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 10 Nov 2022 13:54:20 +0100
Message-ID: <CAJaqyWdf-A8xEDVyX9f6y3FZhyp9bYMnuFU2jWFStCCvVNkDTA@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] vdpa: Use v->shadow_vqs_enabled in
 vhost_vdpa_svqs_start & stop
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Parav Pandit <parav@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, kvm@vger.kernel.org, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 10, 2022 at 6:22 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Nov 9, 2022 at 1:08 AM Eugenio P=C3=A9rez <eperezma@redhat.com> w=
rote:
> >
> > This function used to trust in v->shadow_vqs !=3D NULL to know if it mu=
st
> > start svq or not.
> >
> > This is not going to be valid anymore, as qemu is going to allocate svq
> > unconditionally (but it will only start them conditionally).
>
> It might be a waste of memory if we did this. Any reason for this?
>

Well, it's modelled after vhost_vdpa notifier member [1].

But sure we can reduce the memory usage if SVQ is not used. The first
function that needs it is vhost_set_vring_kick. But I think it is not
a good function to place the delayed allocation.

Would it work to move the allocation to vhost_set_features vhost op?
It seems unlikely to me to call callbacks that can affect SVQ earlier
than that one. Or maybe to create a new one and call it the first on
vhost.c:vhost_dev_start?

Thanks!

[1] The notifier member already allocates VIRTIO_QUEUE_MAX
VhostVDPAHostNotifier for each vhost_vdpa, It is easy to reduce at
least to the number of virtqueues on a vhost_vdpa. Should I send a
patch for this one?


> Thanks
>
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/virtio/vhost-vdpa.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 7468e44b87..7f0ff4df5b 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -1029,7 +1029,7 @@ static bool vhost_vdpa_svqs_start(struct vhost_de=
v *dev)
> >      Error *err =3D NULL;
> >      unsigned i;
> >
> > -    if (!v->shadow_vqs) {
> > +    if (!v->shadow_vqs_enabled) {
> >          return true;
> >      }
> >
> > @@ -1082,7 +1082,7 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev=
 *dev)
> >  {
> >      struct vhost_vdpa *v =3D dev->opaque;
> >
> > -    if (!v->shadow_vqs) {
> > +    if (!v->shadow_vqs_enabled) {
> >          return;
> >      }
> >
> > --
> > 2.31.1
> >
>


