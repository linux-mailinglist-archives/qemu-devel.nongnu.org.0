Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB200579884
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 13:30:39 +0200 (CEST)
Received: from localhost ([::1]:40648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDlR1-0002VU-1g
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 07:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oDlP1-00008h-R3
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 07:28:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oDlOx-0003Co-6Y
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 07:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658230107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wHwxdS8PfFxZmdTllaiIZfhzgzyKnqdf/hl4wQC7JgA=;
 b=CcxHgd7LwbGq6h50UAcqrN8X8BnE6GbLNJb1Bw6sXoFryK5A5rnP0YjNXtz07VpNvlnBDm
 WtzOuvE+4p9MlisdaprOWkMBkNeuWlOFhPFXI3jtPFOYSjP4duvtO+juAnkpo4r/bYMSna
 yoXGcKWpI8v4xCk+EL/UjUiSuZYFvZE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-VhKnmbc7OBeCR0MEQ4pv7Q-1; Tue, 19 Jul 2022 07:28:20 -0400
X-MC-Unique: VhKnmbc7OBeCR0MEQ4pv7Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 c7-20020adfc6c7000000b0021db3d6961bso2510816wrh.23
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 04:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wHwxdS8PfFxZmdTllaiIZfhzgzyKnqdf/hl4wQC7JgA=;
 b=g+bfKvT5F3FtxtcjJHKWq+jiMkCTlYMi7GNH9QFCoc4TWFxaBOfl0nvNxifdrWX8z2
 oYVUAEqxjVKx/pONF/k0nclQyGh/GQMFuRhobxHuCKCKjN8FgEGHxQhf/4V4NaV2QeSH
 Xl4BgKAwCkZ5gIqb9CCVkQT8M93J9j+Y9kDGwS9oXtxTnKpwf0Jwv62DgnPiTPndvidC
 bI02j70dmwnBGp0KgzGJrU1j5Y1xrdlrpasItOr0kcrr62/Z9WerVuQSVlt1ixFQAthQ
 CllPMWCN3qNYYMdXCsXCptO6hk/KGD4m39ny45qBew81Y3t4/c81P+BfAD9XgRviPMQ2
 i0RQ==
X-Gm-Message-State: AJIora8w9ZcOW84TXEz//2oz8M4x21WgzxhA5nW34k27iUO3KVc2qWT0
 8sHD069ps5HSLI9WIdY3yZNDHksDMAElo+dW4CaMc4lJS6q1lSXbbJ7cK/QCpnadQnItiC1iRAA
 +EBoLswKaKorhxz8=
X-Received: by 2002:adf:ead2:0:b0:21d:8b49:6138 with SMTP id
 o18-20020adfead2000000b0021d8b496138mr26921087wrn.138.1658230099039; 
 Tue, 19 Jul 2022 04:28:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sBfS+M7anVJyfS9ZPP85sj+N+lgqSFP4rajmXOZX6ejCpAgfm36BY1PWxEVTuMldrjXY2rwA==
X-Received: by 2002:adf:ead2:0:b0:21d:8b49:6138 with SMTP id
 o18-20020adfead2000000b0021d8b496138mr26921065wrn.138.1658230098784; 
 Tue, 19 Jul 2022 04:28:18 -0700 (PDT)
Received: from redhat.com ([2.55.25.63]) by smtp.gmail.com with ESMTPSA id
 h13-20020a5d6e0d000000b0021b9e360523sm13016695wrz.8.2022.07.19.04.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 04:28:18 -0700 (PDT)
Date: Tue, 19 Jul 2022 07:28:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Parav Pandit <parav@mellanox.com>,
 Markus Armbruster <armbru@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 00/19] vdpa net devices Rx filter change notification
 with Shadow VQ
Message-ID: <20220719072742-mutt-send-email-mst@kernel.org>
References: <20220715171834.2666455-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220715171834.2666455-1-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Fri, Jul 15, 2022 at 07:18:15PM +0200, Eugenio Pérez wrote:
> Control virtqueue is used by networking device for accepting various
> commands from the driver. It's a must to support advanced configurations.
> 
> Rx filtering event is issues by qemu when device's MAC address changed once and
> the previous one has not been queried by external agents.
> 
> Shadow VirtQueue (SVQ) already makes possible tracking the state of virtqueues,
> effectively intercepting them so qemu can track what regions of memory are
> dirty because device action and needs migration. However, this does not solve
> networking device state seen by the driver because CVQ messages, like changes
> on MAC addresses from the driver.
> 
> This series uses SVQ infrastructure to intercept networking control messages
> used by the device. This way, qemu is able to update VirtIONet device model and
> react to them. In particular, this series enables rx filter change
> notification.
> 
> This is a prerequisite to achieve net vdpa device with CVQ live migration.
> It's a stripped down version of [1], with error paths checked and no migration
> enabled.
> 
> First nine patches reorder and clean code base so its easier to apply later
> ones. No functional change should be noticed from these changes.
> 
> Patches from 11 to 14 enable SVQ API to make other parts of qemu to interact
> with it. In particular, they will be used by vhost-vdpa net to handle CVQ
> messages.
> 
> Patches 15 to 17 enable the update of the virtio-net device model for each
> CVQ message acknowledged by the device.
> 
> Last patches enable x-svq parameter, forbidding device migration since it is
> not restored in the destination's vdpa device yet. This will be added in later
> series, using this work.
> 
> Comments are welcome.
> v3:
> - Replace SVQElement with SVQDescState

Series:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> v2:
> - (Comments from series [1]).
> - Active poll for CVQ answer instead of relay on async used callback
> - Do not offer a new buffer to device but reuse qemu's
> - Use vhost_svq_add instead of not needed vhost_svq_inject
> - Delete used and detach callbacks, not needed anymore
> - Embed members of SVQElement in VirtQueueElement
> - Reuse the same buffers for all CVQ commands
> 
> [1] https://patchwork.kernel.org/project/qemu-devel/cover/20220706184008.1649478-1-eperezma@redhat.com/
> 
> Eugenio Pérez (19):
>   vhost: move descriptor translation to vhost_svq_vring_write_descs
>   virtio-net: Expose MAC_TABLE_ENTRIES
>   virtio-net: Expose ctrl virtqueue logic
>   vhost: Reorder vhost_svq_kick
>   vhost: Move vhost_svq_kick call to vhost_svq_add
>   vhost: Check for queue full at vhost_svq_add
>   vhost: Decouple vhost_svq_add from VirtQueueElement
>   vhost: Add SVQDescState
>   vhost: Track number of descs in SVQDescState
>   vhost: add vhost_svq_push_elem
>   vhost: Expose vhost_svq_add
>   vhost: add vhost_svq_poll
>   vhost: Add svq avail_handler callback
>   vdpa: Export vhost_vdpa_dma_map and unmap calls
>   vdpa: manual forward CVQ buffers
>   vdpa: Buffer CVQ support on shadow virtqueue
>   vdpa: Extract get features part from vhost_vdpa_get_max_queue_pairs
>   vdpa: Add device migration blocker
>   vdpa: Add x-svq to NetdevVhostVDPAOptions
> 
>  qapi/net.json                      |   9 +-
>  hw/virtio/vhost-shadow-virtqueue.h |  52 ++++-
>  include/hw/virtio/vhost-vdpa.h     |   8 +
>  include/hw/virtio/virtio-net.h     |   7 +
>  hw/net/virtio-net.c                |  85 ++++---
>  hw/virtio/vhost-shadow-virtqueue.c | 202 +++++++++++-----
>  hw/virtio/vhost-vdpa.c             |  25 +-
>  net/vhost-vdpa.c                   | 357 +++++++++++++++++++++++++++--
>  8 files changed, 627 insertions(+), 118 deletions(-)
> 
> -- 
> 2.31.1
> 


