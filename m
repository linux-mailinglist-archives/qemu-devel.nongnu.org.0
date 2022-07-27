Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF665820E7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 09:17:58 +0200 (CEST)
Received: from localhost ([::1]:35646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGbIq-0001Ou-UM
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 03:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGb0o-0004We-FD
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 02:59:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGb0k-0004yC-VT
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 02:59:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658905153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z9VK4Fq1615N5MzonmfFVTaPhVRQKXWzKs5Ugq48RiM=;
 b=Lal0uscoNFw6BIJsA5oLIAzsc3H+ybKhF3ppwACQ4sGoovnS/e43iEo7vw9EOQNwJASnvv
 hw4kUyKp8xYBWnZCtyd0t8QC/RKmbmtXhBh+hIjwTyY6PN8Uh+tek4npOaHQJlnVmfq4AO
 EWQ6yvQg74sD3tPKZv7PP/n7zZzVjTY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-79pYcOxYPJiBuO6wDOkZiA-1; Wed, 27 Jul 2022 02:59:12 -0400
X-MC-Unique: 79pYcOxYPJiBuO6wDOkZiA-1
Received: by mail-ej1-f72.google.com with SMTP id
 hv22-20020a17090760d600b0072f2cce7d10so4813271ejc.19
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 23:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=z9VK4Fq1615N5MzonmfFVTaPhVRQKXWzKs5Ugq48RiM=;
 b=m2L8QXBifnG5zddobfjcI+06erFlbEEnnoIxhvu4M9OusAghTpKP1h2JeU/SqGgsmp
 HD/xatbMsBmTmY4lzj/53Kti/f5TUveGWwz1Dl5Pyytc/EbS6+nQP/jeU/11+rkxpuJb
 vFaZoQFtqmH1UNk1QvhexdHpTrjlU1o/yafK4ChlypG1HofMSaqHAqycyUcHuoK3ZIu1
 5N1rozg+wx7qcO3Jwjsog5fNODth3rQdRrghv5ZXiDJec/ZipgfGf7Ken0hA+GQZ7EkE
 1zchfsuPJZNkiEC39ziU+YelP1k2mHQW6N8ViRooFo7+Zp2FhmUH0nk65qZOMIwgLbiK
 ptAw==
X-Gm-Message-State: AJIora/Y7o+PqpYnXvjMQTOwDw3fZhYKVLmO+ppIuL7Zb+2bpvZCeUVD
 x/1WBJvT7/HLNRrJSdSO6MB9Rq5IIY8mY0vCvVOG+ezjo42EytNxLoXN7h0GUkcGeNhxw7fsWJu
 p5tBzhAsfPhahYFwwBoZDYUhBe/0uDa8=
X-Received: by 2002:a17:907:2ccf:b0:72f:2bc8:d7f6 with SMTP id
 hg15-20020a1709072ccf00b0072f2bc8d7f6mr16680110ejc.145.1658905151253; 
 Tue, 26 Jul 2022 23:59:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vLNu+HdRtkZ3lmvyxZxALLEBsr+axU5IjTdlu5TE1MZuqmY0D/49cNBOoMtU9dyHJpWDkPGEZhwBL42eG9nuY=
X-Received: by 2002:a17:907:2ccf:b0:72f:2bc8:d7f6 with SMTP id
 hg15-20020a1709072ccf00b0072f2bc8d7f6mr16680094ejc.145.1658905151002; Tue, 26
 Jul 2022 23:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <c6718441a57198bc22d9861417e5ae69c0a70fdb.1658141552.git.kangjie.xu@linux.alibaba.com>
 <b5fb3193-a0a7-88c2-11b0-700a101c642e@redhat.com>
 <649c4b07-6443-e637-a124-52f2e655236d@linux.alibaba.com>
 <CACGkMEtNhVYSeXdeXTds38bMUvUau9SvMWoavqnO-O2znMW6bA@mail.gmail.com>
 <81462777-254b-762c-cbe3-2272ca343b60@linux.alibaba.com>
In-Reply-To: <81462777-254b-762c-cbe3-2272ca343b60@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 27 Jul 2022 14:59:00 +0800
Message-ID: <CACGkMEvkFMtbKJmK7ZVTVjPNxvF7VM-f_uW4cjuuc2PLeRZ+YQ@mail.gmail.com>
Subject: Re: [PATCH 07/16] virtio-net: support queue reset
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>,
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

On Wed, Jul 27, 2022 at 2:25 PM Kangjie Xu <kangjie.xu@linux.alibaba.com> w=
rote:
>
>
> =E5=9C=A8 2022/7/27 13:00, Jason Wang =E5=86=99=E9=81=93:
> > On Tue, Jul 26, 2022 at 3:02 PM Kangjie Xu <kangjie.xu@linux.alibaba.co=
m> wrote:
> >>
> >> =E5=9C=A8 2022/7/26 11:43, Jason Wang =E5=86=99=E9=81=93:
> >>> =E5=9C=A8 2022/7/18 19:17, Kangjie Xu =E5=86=99=E9=81=93:
> >>>> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> >>>>
> >>>> virtio-net implements queue reset. Queued packets in the correspondi=
ng
> >>>> queue pair are flushed or purged.
> >>>>
> >>>> Queue reset is currently only implemented for non-vhosts.
> >>>>
> >>>> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> >>>> ---
> >>>>    hw/net/virtio-net.c | 15 +++++++++++++++
> >>>>    1 file changed, 15 insertions(+)
> >>>>
> >>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> >>>> index 7ad948ee7c..8396e21a67 100644
> >>>> --- a/hw/net/virtio-net.c
> >>>> +++ b/hw/net/virtio-net.c
> >>>> @@ -531,6 +531,19 @@ static RxFilterInfo
> >>>> *virtio_net_query_rxfilter(NetClientState *nc)
> >>>>        return info;
> >>>>    }
> >>>>    +static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t
> >>>> queue_index)
> >>>> +{
> >>>> +    VirtIONet *n =3D VIRTIO_NET(vdev);
> >>>> +    NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(queue_ind=
ex));
> >>>> +
> >>>> +    if (!nc->peer) {
> >>>> +        return;
> >>>> +    }
> >>>> +
> >>>> +    qemu_flush_or_purge_queued_packets(nc->peer, true);
> >>>> +    assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
> >>>
> >>> Let's try to reuse this function in virtio_net_reset().
> >>>
> >> Yeah, I'll fix it.
> >>
> >> Thanks.
> >>
> >>>> +}
> >>>> +
> >>>>    static void virtio_net_reset(VirtIODevice *vdev)
> >>>>    {
> >>>>        VirtIONet *n =3D VIRTIO_NET(vdev);
> >>>> @@ -741,6 +754,7 @@ static uint64_t
> >>>> virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
> >>>>        }
> >>>>          if (!get_vhost_net(nc->peer)) {
> >>>> +        virtio_add_feature(&features, VIRTIO_F_RING_RESET);
> >>>
> >>> This breaks migration compatibility.
> >>>
> >>> We probably need:
> >>>
> >>> 1) a new command line parameter
> >>> 2) make it disabled for pre-7.2 machine
> >>>
> >>> Thanks
> >>>
> >>>
> >> Sorry, I don't get what is the meaning of "pre-7.2 machine". Could you
> >> please explain it?
> > I meant for pre 7.2 machine type, we should make reset fault off by def=
ault.
> >
> > Otherwise we break migration compatibility.
> >
> > Thanks
>
> Sorry, I did not express myself clearly. Is "7.2" the version of a
> system or a module? If it is a system version, what is the system?

It's the machine type to make sure the migration can work. (you can
get the list of those types via qemu -machine ?)

E.g you can start a 7.0 machine on Qemu 7.1 and it guarantees to be
migrated to 7.0 machine on Qemu 7.0.

>
> I did not have backgrond knowledge related to this part and will
> investigate migration issues afterwards.

Git grep hw_compat_7_0 may give you more hints.

Thanks

>
> Thanks.
>
> >> Thanks
> >>
> >>>>            return features;
> >>>>        }
> >>>>    @@ -3766,6 +3780,7 @@ static void virtio_net_class_init(ObjectCla=
ss
> >>>> *klass, void *data)
> >>>>        vdc->set_features =3D virtio_net_set_features;
> >>>>        vdc->bad_features =3D virtio_net_bad_features;
> >>>>        vdc->reset =3D virtio_net_reset;
> >>>> +    vdc->queue_reset =3D virtio_net_queue_reset;
> >>>>        vdc->set_status =3D virtio_net_set_status;
> >>>>        vdc->guest_notifier_mask =3D virtio_net_guest_notifier_mask;
> >>>>        vdc->guest_notifier_pending =3D virtio_net_guest_notifier_pen=
ding;
>


