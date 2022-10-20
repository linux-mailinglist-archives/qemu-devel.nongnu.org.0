Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FE5605652
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 06:28:53 +0200 (CEST)
Received: from localhost ([::1]:34452 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olNAq-00055Z-30
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 00:28:52 -0400
Received: from [::1] (port=40656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olNAp-0004xx-UB
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 00:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olN6n-0007Rq-6P
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 00:24:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olN6i-0002z0-Dc
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 00:24:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666239870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mn9CsxOcD/zBixYP4d5NMGsxwljfoBK/3PM9R33hXlA=;
 b=Tm7MgO7fg1VtsN2PaEDqR18iASYipiuyU4GjT+o4JyySHmkdO4ap7YysNUyX94Lx7Su0xC
 dIuK5Bpz0HDnp6EAEq9U16k0i1zoWJsmUmjh8xspCXlv0CagGGLTASCKHoY38afi2rufnr
 aiuYZ1ONqLestdlSLMpfOBQ7xNPR35U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-y08v8xESNJ6KsaNBvk-bTg-1; Thu, 20 Oct 2022 00:24:29 -0400
X-MC-Unique: y08v8xESNJ6KsaNBvk-bTg-1
Received: by mail-ed1-f72.google.com with SMTP id
 w20-20020a05640234d400b0045d0d1afe8eso13894202edc.15
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 21:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mn9CsxOcD/zBixYP4d5NMGsxwljfoBK/3PM9R33hXlA=;
 b=jPvdtZ7ePpYQUfQhlw53Ad5TWl3XrUfcsoMNnXt1IT2TTUV+151xgJbLUaA1IJngLF
 PUDjgAEkFIMmC+kxCzeo16gVI4fJU8ocxTL5R3nj/lBif3c9eMO7b0+ih5z2z5+KaTBu
 b6LdLy+e0aA11jZZHQ3yuwVJX325P+JJ5JpkYNdpB6iCZyQpZgj1PMWrLB4BUGYSOpFn
 l33eh5XyCIRuQPaGh3ORxjM3m9U8Lgtd7E3dI4BTPYumB5y9yP144GA7c/s5tOk65brx
 liidACu6GSvPMQKJ355+MW5u84WliT7nfqT44xFFr6FfP+C1SiDXYqICx1x6YUzfWj0/
 V09g==
X-Gm-Message-State: ACrzQf0wvX1MhJm0xUWacitERhLIyvsWI/M2nMLIcXywj8gxb/rQ6NL6
 gvVatorOETUDlolg4moGpBtHWP0rDWiE1WRpS2xWZ5a8H79X2nS6GXddCDbMyTw4GeXjeAa9j7j
 xMvy/hrz042bxMGJIgxt9xuSBufc96qw=
X-Received: by 2002:a05:6402:4022:b0:45c:9f2c:c4d3 with SMTP id
 d34-20020a056402402200b0045c9f2cc4d3mr10429302eda.223.1666239868024; 
 Wed, 19 Oct 2022 21:24:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5nZP27mGwkmft9eRxb0/BoallVQm51gJWZChLi7hKeqAehVAmDJAPzwFKzXd/GVqb4y2rA6i0k1nO2XmmlpJk=
X-Received: by 2002:a05:6402:4022:b0:45c:9f2c:c4d3 with SMTP id
 d34-20020a056402402200b0045c9f2cc4d3mr10429289eda.223.1666239867823; Wed, 19
 Oct 2022 21:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221019125210.226291-1-eperezma@redhat.com>
In-Reply-To: <20221019125210.226291-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 20 Oct 2022 12:24:14 +0800
Message-ID: <CACGkMEv9EODLU5DdATMW4BEZ5TNTgaDt4Tw+DzXiQAKhFWXsgA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/8] Guest announce feature emulation using Shadow
 VirtQueue
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 19, 2022 at 8:52 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> A gratuitous ARP is recommended after a live migration to reduce the amou=
nt of
> time needed by the network links to be aware of the new location.

A question: I think we need to deal with the case when GUSET_ANNOUNCE
is not negotiated? E.d sending the gARP by ourselves via vhost-vDPA?

Thanks

> A hypervisor
> may not have the knowledge of the guest network configuration, and this i=
s
> especially true on passthrough devices, so its simpler to ask the guest t=
o
> do it.
>
> However, the device control part of this feature can be totally emulated =
by
> qemu and shadow virtqueue, not needing any special feature from the actua=
l
> vdpa device.
>
> VIRTIO_NET_F_STATUS is also needed for the guest to access the status of
> virtio net config where announcement status bit is set. Emulating it as
> always active in case backend does not support it.
>
> v2:
> * Add VIRTIO_NET_F_STATUS emulation.
>
> Eugenio P=C3=A9rez (8):
>   vdpa: Delete duplicated vdpa_feature_bits entry
>   vdpa: Save emulated features list in vhost_vdpa
>   vhost_net: Emulate link state up if backend doesn't expose it
>   vdpa: Expose VIRTIO_NET_F_STATUS unconditionally
>   vdpa: Remove shadow CVQ command check
>   vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in
>     vhost_vdpa_net_handle_ctrl_avail
>   vhost_net: return VIRTIO_NET_S_ANNOUNCE is device model has it set
>   vdpa: Offer VIRTIO_NET_F_GUEST_ANNOUNCE feature if SVQ is enabled
>
>  include/hw/virtio/vhost-vdpa.h |  2 +
>  hw/net/vhost_net.c             | 35 +++++++++++++++-
>  hw/virtio/vhost-vdpa.c         |  8 ++--
>  net/vhost-vdpa.c               | 74 ++++++++++------------------------
>  4 files changed, 62 insertions(+), 57 deletions(-)
>
> --
> 2.31.1
>
>


