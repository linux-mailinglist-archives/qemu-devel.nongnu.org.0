Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E639D581F60
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 07:04:49 +0200 (CEST)
Received: from localhost ([::1]:60648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGZE1-0003Ez-1m
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 01:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGZAV-0000eY-2q
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 01:01:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGZAS-0001xe-8s
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 01:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658898066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xU4cOLdqc5ZG8w4Q5xZ/mHGwIZghMUSd4GN7GyYkZns=;
 b=TvOnXLsO3zszqXOi7s+M4BmQnZdfcCYNR2WpzQes6LbQkTJ3gWopFwCRp3ls0Y3uYVg3hK
 Dghq5D20FNBE2ZBI+sT2D2+cTa/hb6sJ/KcDE7zLEG5Js6kA9WtRMJAIAdh+IpLFH+hAMC
 LjyFfpzw6TrKjjAhqX8OUM7zQBt/6c0=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-r4vPiboXNgeNTiuXeLPcUQ-1; Wed, 27 Jul 2022 01:01:04 -0400
X-MC-Unique: r4vPiboXNgeNTiuXeLPcUQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 k25-20020a195619000000b00489e6a6527eso4900828lfb.8
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 22:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xU4cOLdqc5ZG8w4Q5xZ/mHGwIZghMUSd4GN7GyYkZns=;
 b=AOYhqFLI4Kk269ydPM8yupn+n1RYXnWuAHf2nS2mx3eJhkWgBWzEDRfKxgQ1L82Puo
 DMF2o5x86tKk8VyqQvv8lcKkQtT9uwH1EqMdoR2jDKSGR+8JqXK+Xsz/lTh3/leBNDH3
 NAFpE3eZt+oxgCjFe3Ki85JZ+1Vcdt+Za2Ftox6Dl9hSLTJ1LmDr2XSPiEiXkOC68aKX
 F7j8zrZ3190sNPDA1A49+lSXK7jlb9kugMS3ebjlf/DTzpgdOI1dzKfn/jNwT+8YdeMV
 IuiV6j1LBFYuEwDt05Wsy1NtRJVHMBrFrpHFum1X8n46FyRfiCq+rvBbAt2l9K4FSTGs
 ybyQ==
X-Gm-Message-State: AJIora/oT6cytVzWkNXBKtKfX7aV+pMSraVDKUF+0zelFfa5l+1AhO2e
 eySA4ZxHU2HXsod/SlBHDN3iAOp1US5hDN4d+eFsZZHEhXnPs+bTNOAHUPBgND3eAvO25ceOP3f
 tLdaikRNFX5alYtYzIWkhYD2yfxP6xvc=
X-Received: by 2002:ac2:550c:0:b0:48a:8c9a:7116 with SMTP id
 j12-20020ac2550c000000b0048a8c9a7116mr4963418lfk.575.1658898062902; 
 Tue, 26 Jul 2022 22:01:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ubZlCgBN1ErntsDqYr2OEx572KFtn3nPiTlM0PL2PyNSmGRfar1LlqWGGZHmKRvx15PZ9m82B1hi5cwdOhckk=
X-Received: by 2002:ac2:550c:0:b0:48a:8c9a:7116 with SMTP id
 j12-20020ac2550c000000b0048a8c9a7116mr4963412lfk.575.1658898062720; Tue, 26
 Jul 2022 22:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <c6718441a57198bc22d9861417e5ae69c0a70fdb.1658141552.git.kangjie.xu@linux.alibaba.com>
 <b5fb3193-a0a7-88c2-11b0-700a101c642e@redhat.com>
 <649c4b07-6443-e637-a124-52f2e655236d@linux.alibaba.com>
In-Reply-To: <649c4b07-6443-e637-a124-52f2e655236d@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 27 Jul 2022 13:00:51 +0800
Message-ID: <CACGkMEtNhVYSeXdeXTds38bMUvUau9SvMWoavqnO-O2znMW6bA@mail.gmail.com>
Subject: Re: [PATCH 07/16] virtio-net: support queue reset
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: mst <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 hengqi@linux.alibaba.com, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Tue, Jul 26, 2022 at 3:02 PM Kangjie Xu <kangjie.xu@linux.alibaba.com> w=
rote:
>
>
> =E5=9C=A8 2022/7/26 11:43, Jason Wang =E5=86=99=E9=81=93:
> >
> > =E5=9C=A8 2022/7/18 19:17, Kangjie Xu =E5=86=99=E9=81=93:
> >> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> >>
> >> virtio-net implements queue reset. Queued packets in the corresponding
> >> queue pair are flushed or purged.
> >>
> >> Queue reset is currently only implemented for non-vhosts.
> >>
> >> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> >> ---
> >>   hw/net/virtio-net.c | 15 +++++++++++++++
> >>   1 file changed, 15 insertions(+)
> >>
> >> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> >> index 7ad948ee7c..8396e21a67 100644
> >> --- a/hw/net/virtio-net.c
> >> +++ b/hw/net/virtio-net.c
> >> @@ -531,6 +531,19 @@ static RxFilterInfo
> >> *virtio_net_query_rxfilter(NetClientState *nc)
> >>       return info;
> >>   }
> >>   +static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t
> >> queue_index)
> >> +{
> >> +    VirtIONet *n =3D VIRTIO_NET(vdev);
> >> +    NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(queue_index=
));
> >> +
> >> +    if (!nc->peer) {
> >> +        return;
> >> +    }
> >> +
> >> +    qemu_flush_or_purge_queued_packets(nc->peer, true);
> >> +    assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
> >
> >
> > Let's try to reuse this function in virtio_net_reset().
> >
> Yeah, I'll fix it.
>
> Thanks.
>
> >
> >> +}
> >> +
> >>   static void virtio_net_reset(VirtIODevice *vdev)
> >>   {
> >>       VirtIONet *n =3D VIRTIO_NET(vdev);
> >> @@ -741,6 +754,7 @@ static uint64_t
> >> virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
> >>       }
> >>         if (!get_vhost_net(nc->peer)) {
> >> +        virtio_add_feature(&features, VIRTIO_F_RING_RESET);
> >
> >
> > This breaks migration compatibility.
> >
> > We probably need:
> >
> > 1) a new command line parameter
> > 2) make it disabled for pre-7.2 machine
> >
> > Thanks
> >
> >
> Sorry, I don't get what is the meaning of "pre-7.2 machine". Could you
> please explain it?

I meant for pre 7.2 machine type, we should make reset fault off by default=
.

Otherwise we break migration compatibility.

Thanks

>
> Thanks
>
> >>           return features;
> >>       }
> >>   @@ -3766,6 +3780,7 @@ static void virtio_net_class_init(ObjectClass
> >> *klass, void *data)
> >>       vdc->set_features =3D virtio_net_set_features;
> >>       vdc->bad_features =3D virtio_net_bad_features;
> >>       vdc->reset =3D virtio_net_reset;
> >> +    vdc->queue_reset =3D virtio_net_queue_reset;
> >>       vdc->set_status =3D virtio_net_set_status;
> >>       vdc->guest_notifier_mask =3D virtio_net_guest_notifier_mask;
> >>       vdc->guest_notifier_pending =3D virtio_net_guest_notifier_pendin=
g;
>


