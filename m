Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E1F4B6FF9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 16:54:55 +0100 (CET)
Received: from localhost ([::1]:42038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK0AH-000158-S4
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 10:54:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nK089-0000Mg-18
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 10:52:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nK085-0004dF-R5
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 10:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644940357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U67NHitYDnuO4aq81m1FCV0aXG6JgX2Ajb0hhkIAfmA=;
 b=GKXlRMaJzttJMyRxNLFIDNohg+tBNoderjlr4sCtb9PDifq6/ywTEVUMXAoQdUoqP7nKUe
 KXv91FGj4PMhzoa1w5QKhPxI09gH1VX+U4NXkhhtaLO0NibNeGgJLo/4EA2/dkI2DNfvw3
 hWMMWWNQCdQUth9/o5XD6T8/rSjVVkU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-4JsoI0GmNe-FRCGhezrFgg-1; Tue, 15 Feb 2022 10:52:34 -0500
X-MC-Unique: 4JsoI0GmNe-FRCGhezrFgg-1
Received: by mail-qt1-f199.google.com with SMTP id
 s1-20020ac85ec1000000b002cf7c93d56dso15143403qtx.21
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 07:52:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U67NHitYDnuO4aq81m1FCV0aXG6JgX2Ajb0hhkIAfmA=;
 b=W2ogKnmncczobhdLILxYfBVFgu0xwP+Nmxs6Px6dbDtIiTEmpWQZPOJtMU1D++zsOV
 jiHJ9jAyv9z3hBW3DlmRwLJKyR+c3IOgNWd8Kag1pLcytidVkfB3Or30zvUPvK8P5ACP
 RgaBbtglfsdH40yyRYFz8OxkXfYVn3XdBZ4eJxvSf/iCQHWeU9M7ii226PQ1lgV1zgVC
 aYpjRtzdLN92ybp0VGFtwbpItGm4ivnkZq2KAiI+pX2XgipfpiVhAbvi7Kj65xLNfDHo
 Yt+YYYbzeGNVIcN77XbABZ9fjM13Fbf7F8+nVdpxc1OYN3z4Y8SHt82janY0nywedNpI
 9AlQ==
X-Gm-Message-State: AOAM531pvtcxqTzC3NqzpJEaAQDfCAU78DGyKERdQSIhvFodmty/mBvx
 USySVJe/z28/ghCqo8CqwMB3mjbXMU75RE+mUPFqISHyhMygXZXcWReGer1zjzqpFRUa7PqXh+3
 vD8wf+Di8V1vk8oMsWjSmr/rkC6oIzGQ=
X-Received: by 2002:ac8:5a4a:: with SMTP id o10mr3113311qta.459.1644940354068; 
 Tue, 15 Feb 2022 07:52:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDAEWoefCFLb3bGu9XR6jSzkwRnZdWYbFUdDlX37J0SA95dCV0BZRvAy/Uo5EVMIHWQXa5c3vH1oTSGI7tzHk=
X-Received: by 2002:ac8:5a4a:: with SMTP id o10mr3113293qta.459.1644940353829; 
 Tue, 15 Feb 2022 07:52:33 -0800 (PST)
MIME-Version: 1.0
References: <20220214191635.1604932-1-eperezma@redhat.com>
In-Reply-To: <20220214191635.1604932-1-eperezma@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 15 Feb 2022 16:51:57 +0100
Message-ID: <CAJaqyWctkCcpJtRU-9CYB=f8erVrw10puK570GLBCV2j9eg7DA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/9] Net Control VQ support in vDPA SVQ
To: qemu-level <qemu-devel@nongnu.org>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 8:38 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Control virtqueue is used by networking device for accepting various
> commands from the driver. It's a must to support multiqueue and other
> configurations.
>
> Shadow VirtQueue (SVQ) [1] already makes possible migration of virtqueue
> states, effectively intercepting them so qemu can track what regions of m=
emory
> are dirty because device action and needs migration. However, this does n=
ot
> solve networking device state seen by the driver because CVQ messages, li=
ke
> changes on MAC addresses from the driver.
>
> To solve that, this series uses SVQ infraestructure proposed at SVQ [1] t=
o
> intercept networking control messages used by the device. This way, qemu =
is
> able to update VirtIONet device model and to migrate it. This series need=
s to
> be applied on top of [1].
>
> Ideally, only the control VQ would be shadowed for all the run of qemu an=
d the
> rest of virtqueues would be passthrough unless it's migration time. Howev=
er,
> this requires the vDPA device to support address translations from more t=
han
> one address space, something that is not possible at the moment with the
> current vhost-vDPA API. The API change has been proposed at [2], but use =
of it
> is left for future series.
>
> Sending this as a RFC so some details like error control is still not 100=
%
> tested. Comments are welcomed on every aspect of the patch.
>
> [1] https://lore.kernel.org/qemu-devel/20220121202733.404989-1-eperezma@r=
edhat.com/
> [2] https://lkml.org/lkml/2020/9/23/1243
>
> Eugenio P=C3=A9rez (9):
>   virtio-net: Expose ctrl virtqueue logic
>   vdpa: Extract get geatures part from vhost_vdpa_get_max_queue_pairs
>   virtio: Make virtqueue_alloc_element non-static
>   vhost: Add SVQElement
>   vhost: Add custom used buffer callback
>   vdpa: Add map/unmap operation callback to SVQ
>   vhost: Add vhost_svq_inject
>   vhost: Add vhost_svq_start_op
>   vdpa: control virtqueue support on shadow virtqueue
>
>  hw/virtio/vhost-shadow-virtqueue.h |  25 +++-
>  include/hw/virtio/vhost-vdpa.h     |   2 +
>  include/hw/virtio/virtio-net.h     |   3 +
>  include/hw/virtio/virtio.h         |   1 +
>  hw/net/virtio-net.c                |  83 ++++++-----
>  hw/virtio/vhost-shadow-virtqueue.c | 217 +++++++++++++++++++++++------
>  hw/virtio/vhost-vdpa.c             |  22 ++-
>  hw/virtio/virtio.c                 |   2 +-
>  net/vhost-vdpa.c                   | 140 +++++++++++++++++--
>  9 files changed, 405 insertions(+), 90 deletions(-)
>

This series is available to test at [1].

Thanks!

[1] https://github.com/eugpermar/qemu/releases/tag/vdpa_sw_live_migration.d=
%2Fcvq-v1

> --
> 2.27.0
>
>
>


