Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894F741BEA6
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 07:21:01 +0200 (CEST)
Received: from localhost ([::1]:37496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVS1b-0007jT-Pq
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 01:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mVRzM-00070o-Cj
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 01:18:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mVRzJ-0003bc-4O
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 01:18:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632892715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GwGfoEN/G4kcfA3zo+eIee8luTjWuLbB4+f/GWc8AQo=;
 b=RIPRtBN6F7TMecd0TqILqQyOgOo2u64Wq2i6xmpaV6bGYzBKFg48P8jZsBMJ4GO3deaEzF
 KSXhBcfSw2FCuuDRdnWEy1lTlBdD+S7K205hfbfpz5sG6t8r9ggV9hI4bUt4l3n4IOJQZh
 lPp9nRL4RjpSfoCiWlrQERWxx0aw+RM=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-mMi3talnOi-Xd4IVTM5zdQ-1; Wed, 29 Sep 2021 01:18:33 -0400
X-MC-Unique: mMi3talnOi-Xd4IVTM5zdQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 x33-20020a0565123fa100b003fcfd99073dso1331673lfa.6
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 22:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GwGfoEN/G4kcfA3zo+eIee8luTjWuLbB4+f/GWc8AQo=;
 b=LOf8XVHGry89eH4TDUjgH01wfINueF0ndKz2Mtu5b5LG8L2J2GbYap7KUzF2rWIyjT
 1VMOCzBAnMzbEoErwAdkEnzk6k3npuzSrPRxPe14KleEKnJ8rIEzq+RaKmyhnkuaUlTN
 wleplqpePITwr7etK/bJ0g4cLlyq2KeJ4iKnxrEqByiHQHHUgidaV0UBB97yW2AmAcLU
 S61ReIn1EiOVLAxocZF3YQtvlFcPIOQuebkPiA0/A2pQ8tk/bdrbO9DMs52c8Ox4k1YH
 Rr3UrcFxZG/cgahdeihFHG5tLh7tofALD7w/02PpROHrb/Wf7Kv2SOoxbg6FBnc7rh6d
 ifVg==
X-Gm-Message-State: AOAM530JZBS/DiVCbZXEe2+KWQDqDPUKgYcVka6S7WyyC2J0JSr93OtD
 1HFAmP80XdpN7bcC7oN4uMesj+Ol9yT4PyKfvosNEY/+Gxr66C1m4S8rKHSMmSQbWroRcJBnIdl
 2fq3qmI1Xa25I2WBJTUL1QI9+hKNXmvo=
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr9832246lfq.84.1632892712082;
 Tue, 28 Sep 2021 22:18:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLth1aj5fLqi5BlTO6JWwhjlxIHE1PHunQlTXIxWyVMaymxtrHp2Q/L1Y2IKSvESlfvx+fBtpoppG44aQXmA4=
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr9832216lfq.84.1632892711830;
 Tue, 28 Sep 2021 22:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210907090322.1756-1-jasowang@redhat.com>
In-Reply-To: <20210907090322.1756-1-jasowang@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 29 Sep 2021 13:18:20 +0800
Message-ID: <CACGkMEu3+5eXK9kf7Bxmzdn9DiYyJa6tzzbFUmdfrF-3jwYN9Q@mail.gmail.com>
Subject: Re: [PATCH V3 00/10] vhost-vDPA multiqueue
To: mst <mst@redhat.com>, jasowang <jasowang@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: eperezma <eperezma@redhat.com>, Eli Cohen <elic@nvidia.com>,
 Gautam Dawar <gdawar@xilinx.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 7, 2021 at 5:03 PM Jason Wang <jasowang@redhat.com> wrote:
>
> Hi All:
>
> This patch implements the multiqueue support for vhost-vDPA. The most
> important requirement si the control virtqueue support. The virtio-net
> and vhost-net core are tweak to support control virtqueue as if what
> data queue pairs are done: a dedicated vhost_net device which is
> coupled with the NetClientState is intrdouced so most of the existing
> vhost codes could be reused with minor changes. This means the control
> virtqueue will bypass the Qemu. With the control virtqueue, vhost-vDPA
> are extend to support creating and destroying multiqueue queue pairs
> plus the control virtqueue.
>
> For the future, if we want to support live migration, we can either do
> shadow cvq on top or introduce new interfaces for reporting device
> states.
>
> Tests are done via the vp_vdpa driver in L1 guest.

Michael, does this look good to you? If yes, do you plan to merge this
or I can do that?

Thanks

>
> Changes since V2:
>
> - rebase to qemu master
> - use "queue_pairs" instead of "qps"
> - typo fixes
>
> Changes since V1:
>
> - start and stop vhost devices when all queues were setup
> - fix the case when driver doesn't support MQ but device support
> - correctly set the batching capability to avoid a map/unmap storm
> - various other tweaks
>
> Jason Wang (10):
>   vhost-vdpa: open device fd in net_init_vhost_vdpa()
>   vhost-vdpa: classify one time request
>   vhost-vdpa: prepare for the multiqueue support
>   vhost-vdpa: let net_vhost_vdpa_init() returns NetClientState *
>   net: introduce control client
>   vhost-net: control virtqueue support
>   virtio-net: use "queue_pairs" instead of "queues" when possible
>   vhost: record the last virtqueue index for the virtio device
>   virtio-net: vhost control virtqueue support
>   vhost-vdpa: multiqueue support
>
>  hw/net/vhost_net.c             |  55 ++++++++---
>  hw/net/virtio-net.c            | 165 ++++++++++++++++++---------------
>  hw/virtio/vhost-vdpa.c         |  56 +++++++++--
>  include/hw/virtio/vhost-vdpa.h |   1 +
>  include/hw/virtio/vhost.h      |   2 +
>  include/hw/virtio/virtio-net.h |   5 +-
>  include/net/net.h              |   5 +
>  include/net/vhost_net.h        |   6 +-
>  net/net.c                      |  24 ++++-
>  net/vhost-vdpa.c               | 127 ++++++++++++++++++++++---
>  10 files changed, 328 insertions(+), 118 deletions(-)
>
> --
> 2.25.1
>


