Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B29460F092
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 08:48:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwfw-0004RB-T2; Thu, 27 Oct 2022 02:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1onwfk-0003q7-Um
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:47:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1onwfj-00056Y-C5
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:47:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666853242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ifx/48o+o7CLecnTHPnXCVJjsWsdTv/j0AwTFXojJuE=;
 b=Lh0JMdr7arS/HraJ5DZ4iuLN7C7NppS9y5Zhx68XXZaW7iK3zk8aGs0epT/kQFdGqPXBYv
 JinlD0caU2JXsx1ZDSS4DL8v6e1PQwqcNVBfjnnEo9SGKwR8DffiU4QSQ/IIo41UYt4W+9
 8oISArJFqSODy6Mr7uls/nMmyhvKEq0=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-vqkNFfe4Pk6ErhVQj-8w9Q-1; Thu, 27 Oct 2022 02:47:21 -0400
X-MC-Unique: vqkNFfe4Pk6ErhVQj-8w9Q-1
Received: by mail-pg1-f198.google.com with SMTP id
 q63-20020a632a42000000b0045724b1dfb9so279124pgq.3
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 23:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ifx/48o+o7CLecnTHPnXCVJjsWsdTv/j0AwTFXojJuE=;
 b=FYZX0p1t6R2Dnxi6VbDDT1TB/GKAyUNa7kjoMRmrTo/F1rci+HkPjT4KMV8MKMU6MR
 nDSoeAy2xi1hqGKFEIBo7ck1QYSmrz+i1u7vPLidw7gfcLqxCPA0AKAJaW7KyL6sY4lr
 GqOU+uv6dZlBQKHdBbFWD0s3VhTionTPl557RLwZx+l3G+/fSoq4clnX7b0pMp6OlK8p
 zXYjGjsq/GYYc+UOJrm5zs5JIWQ4wJGIfRJu4vfFNJcntUiUiYAaIaDV2gKgfntE+K9E
 hkDcs5SDD+1O0fhynh6SSBo1jUKWFbdm0GlUzRoISq9M0/EGHW5TNc9VfPksvxXaMRne
 RbiA==
X-Gm-Message-State: ACrzQf1PEnywcITjpJS5ZHSDcn4+3waxCwG23FbId9wLMOOlS/hyceRd
 zNjxGEQOiTYpmJU6yvMptzoT1Q3zbpPhrJWJjxvS8bhq7WQpLE8bJP0dM8dPJMKblQEjny1jU72
 O5TKIuUjVqTKnnttieqfDNYA+ewYhm50=
X-Received: by 2002:a17:90b:190c:b0:211:ab56:35e6 with SMTP id
 mp12-20020a17090b190c00b00211ab5635e6mr8655462pjb.159.1666853239837; 
 Wed, 26 Oct 2022 23:47:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6KNob8t1EZB1zXGlBy3nkVKVDUAyngsdxtIPObxkyXZsizhvXwVvLv3+Bm+JmTxsudGdiVsGG3x+MVspq3VI8=
X-Received: by 2002:a17:90b:190c:b0:211:ab56:35e6 with SMTP id
 mp12-20020a17090b190c00b00211ab5635e6mr8655435pjb.159.1666853239537; Wed, 26
 Oct 2022 23:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221026095303.37907-1-eperezma@redhat.com>
 <20221026095303.37907-4-eperezma@redhat.com>
 <53480725-89de-f289-c5cc-4b37ede72c31@redhat.com>
In-Reply-To: <53480725-89de-f289-c5cc-4b37ede72c31@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 27 Oct 2022 08:46:43 +0200
Message-ID: <CAJaqyWdr1_eJmS1otXd0RBKUdu5BZk87_t7F6jZm5Mg8sK9kBQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] vdpa: Expose VIRTIO_NET_F_STATUS unconditionally
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Gautam Dawar <gdawar@xilinx.com>, 
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Laurent Vivier <lvivier@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Oct 27, 2022 at 6:32 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/10/26 17:53, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Now that qemu can handle and emulate it if the vdpa backend does not
> > support it we can offer it always.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
>
> I may miss something but isn't more easier to simply remove the
> _F_STATUS from vdpa_feature_bits[]?
>

How is that? if we remove it, the guest cannot ack it so it cannot
access the net status, isn't it?

The goal with this patch series is to let the guest access the status
always, even if the device doesn't support _F_STATUS.

> Thanks
>
>
> > ---
> >   include/net/vhost-vdpa.h |  1 +
> >   hw/net/vhost_net.c       | 16 ++++++++++++++--
> >   net/vhost-vdpa.c         |  3 +++
> >   3 files changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/net/vhost-vdpa.h b/include/net/vhost-vdpa.h
> > index b81f9a6f2a..cfbcce6427 100644
> > --- a/include/net/vhost-vdpa.h
> > +++ b/include/net/vhost-vdpa.h
> > @@ -17,5 +17,6 @@
> >   struct vhost_net *vhost_vdpa_get_vhost_net(NetClientState *nc);
> >
> >   extern const int vdpa_feature_bits[];
> > +extern const uint64_t vhost_vdpa_net_added_feature_bits;
> >
> >   #endif /* VHOST_VDPA_H */
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index d28f8b974b..7c15cc6e8f 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -109,10 +109,22 @@ static const int *vhost_net_get_feature_bits(stru=
ct vhost_net *net)
> >       return feature_bits;
> >   }
> >
> > +static uint64_t vhost_net_add_feature_bits(struct vhost_net *net)
> > +{
> > +    if (net->nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA) {
> > +        return vhost_vdpa_net_added_feature_bits;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >   uint64_t vhost_net_get_features(struct vhost_net *net, uint64_t featu=
res)
> >   {
> > -    return vhost_get_features(&net->dev, vhost_net_get_feature_bits(ne=
t),
> > -            features);
> > +    uint64_t ret =3D vhost_get_features(&net->dev,
> > +                                      vhost_net_get_feature_bits(net),
> > +                                      features);
> > +
> > +    return ret | vhost_net_add_feature_bits(net);
> >   }
> >   int vhost_net_get_config(struct vhost_net *net,  uint8_t *config,
> >                            uint32_t config_len)
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 6d64000202..24d2857593 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -99,6 +99,9 @@ static const uint64_t vdpa_svq_device_features =3D
> >       BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
> >       BIT_ULL(VIRTIO_NET_F_STANDBY);
> >
> > +const uint64_t vhost_vdpa_net_added_feature_bits =3D
> > +    BIT_ULL(VIRTIO_NET_F_STATUS);
> > +
> >   VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
> >   {
> >       VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
>


