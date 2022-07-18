Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60055779C5
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 05:34:34 +0200 (CEST)
Received: from localhost ([::1]:51556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDHWj-0003L5-FM
	for lists+qemu-devel@lfdr.de; Sun, 17 Jul 2022 23:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDHVa-0001z5-Kr
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 23:33:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDHVX-00083o-2F
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 23:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658115197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l5+pJbBnMIkP5DfU0iqHGaPje5R7i2P5z1nqvsnXBio=;
 b=PFI7KUkSyDp1+vrootU2Qtauhi019GCqEfTxoH13i3gfSSjwg8JldObNsEIztqIFbAku+y
 Ps51D+RyE09nvuSmV/5M40GMqyzzZQmk6u4QSoeBvVuXWhn/bWy+GExftgzAfUFkLzniTm
 C6p0CNbwB10pDVUqO8LM2k05MyQ/0RE=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-C7hwm4atP7yWXYiESmaN2g-1; Sun, 17 Jul 2022 23:33:10 -0400
X-MC-Unique: C7hwm4atP7yWXYiESmaN2g-1
Received: by mail-lf1-f71.google.com with SMTP id
 d26-20020ac244da000000b0048a48e661dfso102253lfm.12
 for <qemu-devel@nongnu.org>; Sun, 17 Jul 2022 20:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l5+pJbBnMIkP5DfU0iqHGaPje5R7i2P5z1nqvsnXBio=;
 b=ASNRXnvO+zSUCRLJrpb6DN/Kvi46sTJq8Z24mzsOyIYwxpMw4JWhzbnSjmLBij6ck4
 KEmlnAMMhokAaKLymgQmE7U9aFItNf8OjheHfR4ZLi+kbEFNe9GsXGJx8aX665SD/RAF
 Pmz9MeDWD+xMsP8nrifwlCzVV9auTNJGYFziCJBcN/uuSK++JOLOw4ICCtDxXNzuObEh
 /GTtbbo8AVC+iB1Ieba68WiAI5LLNPb2zAQjkrdgFuITz85ejwVqeqbB0yWRRFOsi1mQ
 bmX4APHEH/XJCgBcPFIYfITkr8Iaft0Kjx4dKMs+o/TxfCPqWli7zprRqjYxij4bMc5u
 i9GQ==
X-Gm-Message-State: AJIora9UE9z0D8VwXxMDJnyOOs2hBOpqYU+48NEAQmUSkGhL3mnaCl8i
 x0wQ0R/o9lgZ5LG0j8pc86jRUDe1J5j+HHVf4IuXmXwSUagC6PI6z9UPuxVvzMuHo87iwrhcieV
 lxS2sk7lQYWJVAuD7I6+cknU9Rh1hpms=
X-Received: by 2002:a05:6512:b0d:b0:481:5cb4:cf1e with SMTP id
 w13-20020a0565120b0d00b004815cb4cf1emr13378292lfu.442.1658115189053; 
 Sun, 17 Jul 2022 20:33:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uC9jj3pTx4KtfueDDJSTsIJdbMDYTkbAQ/+tla0v59WgyELhmHeNNkCgGd7gh56aOkbp6M5NRFlMDFwNNfb58=
X-Received: by 2002:a05:6512:b0d:b0:481:5cb4:cf1e with SMTP id
 w13-20020a0565120b0d00b004815cb4cf1emr13378271lfu.442.1658115188802; Sun, 17
 Jul 2022 20:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220715171834.2666455-1-eperezma@redhat.com>
In-Reply-To: <20220715171834.2666455-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 18 Jul 2022 11:32:57 +0800
Message-ID: <CACGkMEs5QYD8JpQasRh3r83bme3cQBzMwf2fDFm0PQMzzYJmWA@mail.gmail.com>
Subject: Re: [PATCH v3 00/19] vdpa net devices Rx filter change notification
 with Shadow VQ
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Parav Pandit <parav@mellanox.com>, 
 Markus Armbruster <armbru@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eric Blake <eblake@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>
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

On Sat, Jul 16, 2022 at 1:18 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Control virtqueue is used by networking device for accepting various
> commands from the driver. It's a must to support advanced configurations.
>
> Rx filtering event is issues by qemu when device's MAC address changed on=
ce and
> the previous one has not been queried by external agents.
>
> Shadow VirtQueue (SVQ) already makes possible tracking the state of virtq=
ueues,
> effectively intercepting them so qemu can track what regions of memory ar=
e
> dirty because device action and needs migration. However, this does not s=
olve
> networking device state seen by the driver because CVQ messages, like cha=
nges
> on MAC addresses from the driver.
>
> This series uses SVQ infrastructure to intercept networking control messa=
ges
> used by the device. This way, qemu is able to update VirtIONet device mod=
el and
> react to them. In particular, this series enables rx filter change
> notification.
>
> This is a prerequisite to achieve net vdpa device with CVQ live migration=
.
> It's a stripped down version of [1], with error paths checked and no migr=
ation
> enabled.
>
> First nine patches reorder and clean code base so its easier to apply lat=
er
> ones. No functional change should be noticed from these changes.
>
> Patches from 11 to 14 enable SVQ API to make other parts of qemu to inter=
act
> with it. In particular, they will be used by vhost-vdpa net to handle CVQ
> messages.
>
> Patches 15 to 17 enable the update of the virtio-net device model for eac=
h
> CVQ message acknowledged by the device.
>
> Last patches enable x-svq parameter, forbidding device migration since it=
 is
> not restored in the destination's vdpa device yet. This will be added in =
later
> series, using this work.
>
> Comments are welcome.
> v3:
> - Replace SVQElement with SVQDescState
>
> v2:
> - (Comments from series [1]).
> - Active poll for CVQ answer instead of relay on async used callback
> - Do not offer a new buffer to device but reuse qemu's
> - Use vhost_svq_add instead of not needed vhost_svq_inject
> - Delete used and detach callbacks, not needed anymore
> - Embed members of SVQElement in VirtQueueElement
> - Reuse the same buffers for all CVQ commands
>
> [1] https://patchwork.kernel.org/project/qemu-devel/cover/20220706184008.=
1649478-1-eperezma@redhat.com/
>
> Eugenio P=C3=A9rez (19):
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

Looks good to me.

Michael, if you don't object, I plan to merge this series so vendors
can start to test this.

Thanks

>
> --
> 2.31.1
>
>


