Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0872BB525
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 20:24:40 +0100 (CET)
Received: from localhost ([::1]:43938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgC1P-0008VG-R2
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 14:24:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBhB-0007iX-FY
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 14:03:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBh8-00023E-Uc
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 14:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605899021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8UpoDNvLCM+M0RvdtXWxICqCloKh5IfInwxaMT4Cg4k=;
 b=fhkooj8Ek7lOYKQX7vSBJAH1svKLTDinpB6VdTncBGkuu7x0MMvEsqaQ0wvdSMneiy3EgA
 ZnpK1o6KeXfhkaZfgPjxLSGuzd9eUGE/evyBgFNxmbTk2u/x7NvX6UkwX1OXqFPetaXS9V
 rIJe+ocmNJnQZUGVCKXPitliZUOMa/I=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-Qm8WksREN3Sv_sM2I-E6dg-1; Fri, 20 Nov 2020 14:03:39 -0500
X-MC-Unique: Qm8WksREN3Sv_sM2I-E6dg-1
Received: by mail-qv1-f72.google.com with SMTP id r5so4458431qvr.15
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 11:03:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8UpoDNvLCM+M0RvdtXWxICqCloKh5IfInwxaMT4Cg4k=;
 b=d8R9U7TdqxeAKnktVly3TW3cW/tUkjZkK+Oxno2Q7VEs6ZZhftl7CMU7shdRhmgQfQ
 FC4ATxIDYJqrZxHt6WIk5sVoBRgnRTWQ9/GFCcJ23ytRfwKeTzPF6o2HuLJHsL/jx5iH
 NN9TcTKUDymFF+THTTjfRqFRbXwCz69e9TWU/sCcF7ZUkBKlL0n4ZV1OhNqPTs1Oh+dW
 bfd2HAN/RaTC0tPYNvXKaoXxArJKOjXcnTsvayuB72HX4WR7MnJY4k2cexB4LuXRLaK9
 vL9h/sjkINsaZuIyxNxlf9g+jyQ+KJa9KJIY8PLFKPUmm+wEQYJPb3aGHPiXHcMBubPq
 5kIQ==
X-Gm-Message-State: AOAM5316Ro0TuHXtn8B77OUqzDwob4TgpJh94t9E5dxR5PCwJ6McLLHV
 LBptJsHetPoFuyAr7kiVXVxpVudoIPIsEsvTofhGTFLb1LQo/NohDyrLXhFXJIX+qQxotYKmlEl
 /aSXIa3DPavzSM3asq3EG/Yghz1SwNI0=
X-Received: by 2002:a37:9c84:: with SMTP id
 f126mr17330746qke.484.1605899018371; 
 Fri, 20 Nov 2020 11:03:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzagcEmUDx/GCW7LReFtHvEjhHy/aw1ygtlXKFvZxRpzjWbJy6uEELelA+5UzQIgsfxs9z8XJn8ulVkTu+Z7SY=
X-Received: by 2002:a37:9c84:: with SMTP id
 f126mr17330702qke.484.1605899018067; 
 Fri, 20 Nov 2020 11:03:38 -0800 (PST)
MIME-Version: 1.0
References: <20201120185105.279030-1-eperezma@redhat.com>
In-Reply-To: <20201120185105.279030-1-eperezma@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 20 Nov 2020 20:03:01 +0100
Message-ID: <CAJaqyWfXEgRC4x+GTxCXkOzBVgVmq9naFCZC+d-W26J4CyumKg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/27] vDPA software assisted live migration
To: qemu-level <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm list <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Daniel Daly <dandaly0@gmail.com>,
 virtualization@lists.linux-foundation.org, Liran Alon <liralon@gmail.com>,
 Eli Cohen <eli@mellanox.com>, Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Alex Barba <alex.barba@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Jim Harford <jim.harford@broadcom.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stephen Finucane <stephenfin@redhat.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main intention with this POC/RFC is to serve as a base to
implement SW LM in vdpa devices.

To implement in vhost-vdpa devices, the high priority is to achieve an
interface for vdpa to stop the device without losing its state, i.e.,
the avail_idx the destination device should start fetching descriptors
from. Following this POC, an implementation on vdpa_sim will be
performed.

Apart from that, there is a TODO list about this series, they will be
solved as the code is marked as valid. They don't affect the device,
just internal qemu's code, and in case of change of direction it is
easy to modify or delete. Comments about these are welcome.

- Currently, it hijacks the log mechanism to know when migration is
starting/done. Maybe it would be cleaner to forward migrate status
from virtio_vmstate_change, since there is no need for the memory
listener. However, this could make "memory backend" abstraction (also
TODO) more complicated. This would drop patches 2,3 entirely.
- There is a reverse search in a list on "vhost_dev_from_virtio" for
each notification. Not really efficient, and it leads to a race
condition at device destruction.
- Implement new capabilities (no iommu, packed vq, event_idx, ...)
- Lot of assertions need to be converted to proper error handling.

Thanks!

On Fri, Nov 20, 2020 at 8:02 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> This series enable vDPA software assisted live migration for vhost-net
> devices. This is a new method of vhost devices migration: Instead of
> relay on vDPA device's dirty logging capability, SW assisted LM
> intercepts dataplane, forwarding the descriptors between VM and device.
>
> In this migration mode, qemu offers a new vring to the device to
> read and write into, and disable vhost notifiers, processing guest and
> vhost notifications in qemu. On used buffer relay, qemu will mark the
> dirty memory as with plain virtio-net devices. This way, devices does
> not need to have dirty page logging capability.
>
> This series is a POC doing SW LM for vhost-net devices, which already
> have dirty page logging capabilities. None of the changes have actual
> effect with current devices until last two patches (26 and 27) are
> applied, but they can be rebased on top of any other. These checks the
> device to meet all requirements, and disable vhost-net devices logging
> so migration goes through SW LM. This last patch is not meant to be
> applied in the final revision, it is in the series just for testing
> purposes.
>
> For use SW assisted LM these vhost-net devices need to be instantiated:
> * With IOMMU (iommu_platform=3Don,ats=3Don)
> * Without event_idx (event_idx=3Doff)
>
> Just the notification forwarding (with no descriptor relay) can be
> achieved with patches 7 and 9, and starting migration. Partial applies
> between 13 and 24 will not work while migrating on source, and patch
> 25 is needed for the destination to resume network activity.
>
> It is based on the ideas of DPDK SW assisted LM, in the series of
> DPDK's https://patchwork.dpdk.org/cover/48370/ .
>
> Comments are welcome.
>
> Thanks!
>
> Eugenio P=C3=A9rez (27):
>   vhost: Add vhost_dev_can_log
>   vhost: Add device callback in vhost_migration_log
>   vhost: Move log resize/put to vhost_dev_set_log
>   vhost: add vhost_kernel_set_vring_enable
>   vhost: Add hdev->dev.sw_lm_vq_handler
>   virtio: Add virtio_queue_get_used_notify_split
>   vhost: Route guest->host notification through qemu
>   vhost: Add a flag for software assisted Live Migration
>   vhost: Route host->guest notification through qemu
>   vhost: Allocate shadow vring
>   virtio: const-ify all virtio_tswap* functions
>   virtio: Add virtio_queue_full
>   vhost: Send buffers to device
>   virtio: Remove virtio_queue_get_used_notify_split
>   vhost: Do not invalidate signalled used
>   virtio: Expose virtqueue_alloc_element
>   vhost: add vhost_vring_set_notification_rcu
>   vhost: add vhost_vring_poll_rcu
>   vhost: add vhost_vring_get_buf_rcu
>   vhost: Return used buffers
>   vhost: Add vhost_virtqueue_memory_unmap
>   vhost: Add vhost_virtqueue_memory_map
>   vhost: unmap qemu's shadow virtqueues on sw live migration
>   vhost: iommu changes
>   vhost: Do not commit vhost used idx on vhost_virtqueue_stop
>   vhost: Add vhost_hdev_can_sw_lm
>   vhost: forbid vhost devices logging
>
>  hw/virtio/vhost-sw-lm-ring.h      |  39 +++
>  include/hw/virtio/vhost.h         |   5 +
>  include/hw/virtio/virtio-access.h |   8 +-
>  include/hw/virtio/virtio.h        |   4 +
>  hw/net/virtio-net.c               |  39 ++-
>  hw/virtio/vhost-backend.c         |  29 ++
>  hw/virtio/vhost-sw-lm-ring.c      | 268 +++++++++++++++++++
>  hw/virtio/vhost.c                 | 431 +++++++++++++++++++++++++-----
>  hw/virtio/virtio.c                |  18 +-
>  hw/virtio/meson.build             |   2 +-
>  10 files changed, 758 insertions(+), 85 deletions(-)
>  create mode 100644 hw/virtio/vhost-sw-lm-ring.h
>  create mode 100644 hw/virtio/vhost-sw-lm-ring.c
>
> --
> 2.18.4
>
>


