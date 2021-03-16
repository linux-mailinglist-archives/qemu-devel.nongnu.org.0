Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E3C33CFDE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:30:10 +0100 (CET)
Received: from localhost ([::1]:36868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM55d-0008Vk-5S
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:30:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lM54C-0007dP-TR
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:28:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lM54A-0008Sq-MB
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615883316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aclyiJU0u5NdHfgjYb9hnlntTA8of1G4TDmlVUOlgpI=;
 b=DDEcuzt2dq0puIoC2lLdY5Chiinu2msgH5xLr0nvXnKSJHmqHL4XQp8x5UjMspXsCO16Gy
 IcdDAvxmmR01Gax9Q3I26nsf1/iEflAAIZn2o7Yvv40BQiMV05eJN4cZaOxk7dY1hlP+3J
 bETciMGKGdJjIEd80mkctlU8O57C8Rw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-RIB7NMDlNuG3eZHGFM1kdQ-1; Tue, 16 Mar 2021 04:28:32 -0400
X-MC-Unique: RIB7NMDlNuG3eZHGFM1kdQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00D4D56BDC;
 Tue, 16 Mar 2021 08:28:31 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-216.pek2.redhat.com
 [10.72.12.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F8B810016DB;
 Tue, 16 Mar 2021 08:28:21 +0000 (UTC)
Subject: Re: [RFC v2 00/13] vDPA software assisted live migration
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210315194842.277740-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <67a2525b-d0b2-dc7a-fa9d-f7c10ae22adf@redhat.com>
Date: Tue, 16 Mar 2021 16:28:20 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315194842.277740-1-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Guru Prasad <guru.prasad@broadcom.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/3/16 上午3:48, Eugenio Pérez 写道:
> This series enable shadow virtqueue for vhost-net devices. This is a
> new method of vhost devices migration: Instead of relay on vhost
> device's dirty logging capability, SW assisted LM intercepts dataplane,
> forwarding the descriptors between VM and device. Is intended for vDPA
> devices with no logging, but this address the basic platform to build
> that support on.
>
> In this migration mode, qemu offers a new vring to the device to
> read and write into, and disable vhost notifiers, processing guest and
> vhost notifications in qemu. On used buffer relay, qemu will mark the
> dirty memory as with plain virtio-net devices. This way, devices does
> not need to have dirty page logging capability.
>
> This series is a POC doing SW LM for vhost-net devices, which already
> have dirty page logging capabilities. For qemu to use shadow virtqueues
> these vhost-net devices need to be instantiated:
> * With IOMMU (iommu_platform=on,ats=on)
> * Without event_idx (event_idx=off)
>
> And shadow virtqueue needs to be enabled for them with QMP command
> like:
>
> {
>    "execute": "x-vhost-enable-shadow-vq",
>    "arguments": {
>      "name": "virtio-net",
>      "enable": false
>    }
> }
>
> Just the notification forwarding (with no descriptor relay) can be
> achieved with patches 5 and 6, and starting SVQ. Previous commits
> are cleanup ones and declaration of QMP command.
>
> Commit 11 introduces the buffer forwarding. Previous one are for
> preparations again, and laters are for enabling some obvious
> optimizations.
>
> It is based on the ideas of DPDK SW assisted LM, in the series of
> DPDK's https://patchwork.dpdk.org/cover/48370/ . However, these does
> not map the shadow vq in guest's VA, but in qemu's.
>
> Comments are welcome! Especially on:
> * Different/improved way of synchronization, particularly on the race
>    of masking.
>
> TODO:
> * Event, indirect, packed, and others features of virtio - Waiting for
>    confirmation of the big picture.


So two things in my mind after reviewing the seires:

1) which layer should we implement the shadow virtqueue. E.g if you want 
to do that at virtio level, you need to deal with a lot of 
synchronizations. I prefer to do it in vhost-vDPA.
2) Using VA as IOVA which can not work for vhost-vDPA


> * vDPA devices:


So I think we can start from a vhost-vDPA specific shadow virtqueue 
first, then extending it to be a general one which might be much easier.


> Developing solutions for tracking the available IOVA
>    space for all devices.


For vhost-net, you can assume that [0, ULLONG_MAX] is valid so you can 
simply use VA as IOVA.


> Small POC available, skipping the get/set
>    status (since vDPA does not support it) and just allocating more and
>    more IOVA addresses in a hardcoded range available for the device.


I'm not sure this can work but you need make sure that range can fit the 
size of the all memory regions and need to deal with memory region add 
and del.

I guess you probably need a full functional tree based IOVA allocator.

Thanks


> * To sepparate buffers forwarding in its own AIO context, so we can
>    throw more threads to that task and we don't need to stop the main
>    event loop.
> * IOMMU optimizations, so bacthing and bigger chunks of IOVA can be
>    sent to device.
> * Automatic kick-in on live-migration.
> * Proper documentation.
>
> Thanks!
>
> Changes from v1 RFC:
>    * Use QMP instead of migration to start SVQ mode.
>    * Only accepting IOMMU devices, closer behavior with target devices
>      (vDPA)
>    * Fix invalid masking/unmasking of vhost call fd.
>    * Use of proper methods for synchronization.
>    * No need to modify VirtIO device code, all of the changes are
>      contained in vhost code.
>    * Delete superfluous code.
>    * An intermediate RFC was sent with only the notifications forwarding
>      changes. It can be seen in
>      https://patchew.org/QEMU/20210129205415.876290-1-eperezma@redhat.com/
>    * v1 at
>      https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg05372.html
>
> Eugenio Pérez (13):
>    virtio: Add virtio_queue_is_host_notifier_enabled
>    vhost: Save masked_notifier state
>    vhost: Add VhostShadowVirtqueue
>    vhost: Add x-vhost-enable-shadow-vq qmp
>    vhost: Route guest->host notification through shadow virtqueue
>    vhost: Route host->guest notification through shadow virtqueue
>    vhost: Avoid re-set masked notifier in shadow vq
>    virtio: Add vhost_shadow_vq_get_vring_addr
>    virtio: Add virtio_queue_full
>    vhost: add vhost_kernel_set_vring_enable
>    vhost: Shadow virtqueue buffers forwarding
>    vhost: Check for device VRING_USED_F_NO_NOTIFY at shadow virtqueue
>      kick
>    vhost: Use VRING_AVAIL_F_NO_INTERRUPT at device call on shadow
>      virtqueue
>
>   qapi/net.json                      |  22 ++
>   hw/virtio/vhost-shadow-virtqueue.h |  36 ++
>   include/hw/virtio/vhost.h          |   6 +
>   include/hw/virtio/virtio.h         |   3 +
>   hw/virtio/vhost-backend.c          |  29 ++
>   hw/virtio/vhost-shadow-virtqueue.c | 551 +++++++++++++++++++++++++++++
>   hw/virtio/vhost.c                  | 283 +++++++++++++++
>   hw/virtio/virtio.c                 |  23 +-
>   hw/virtio/meson.build              |   2 +-
>   9 files changed, 952 insertions(+), 3 deletions(-)
>   create mode 100644 hw/virtio/vhost-shadow-virtqueue.h
>   create mode 100644 hw/virtio/vhost-shadow-virtqueue.c
>


