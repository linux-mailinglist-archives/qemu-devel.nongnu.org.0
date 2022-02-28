Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E044C6127
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 03:34:04 +0100 (CET)
Received: from localhost ([::1]:48480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOVrO-0000Uk-51
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 21:34:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nOVqF-0008Dz-So
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 21:32:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nOVqB-0003qF-Gm
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 21:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646015565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xrd1TskTNZt+2NHwTSaGAJFC8Qbcqr4kfERKct4YaoY=;
 b=BzAfnlI0c5s2XB8iU6/WVXDKAFe37kl3wFw6JgVrlXAZemiyaQftDkoUZTMbgCDnMak8MV
 hekP4FT4mXjmGwiVCqK9QELBg5U4hsRJzAJBWNfuSnhfTcPFOVAbD3zsRa78ihVVro0Z3R
 d1zAW0mGCW9aRkeQL6zN6ZgOtTLTzq4=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-j68NmgDgMoO_QAkp17bG6Q-1; Sun, 27 Feb 2022 21:32:41 -0500
X-MC-Unique: j68NmgDgMoO_QAkp17bG6Q-1
Received: by mail-lj1-f200.google.com with SMTP id
 n9-20020a2e82c9000000b002435af2e8b9so4938995ljh.20
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 18:32:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Xrd1TskTNZt+2NHwTSaGAJFC8Qbcqr4kfERKct4YaoY=;
 b=66bTl3QHQE3QzQYiHxwCIoOgZdLsPr+/gw5aSBAMamlET+NjAAVo+ad2FOr1Ma+HBS
 rEEu0QOJQdaKqF4e8OghpWvzF4s+tFfs6ANBccUsVtCrbMEEfCaFoqR83s45jIFY8fYL
 f1rMb4wV7IO42xkzEAtvnJnzUgUoP/TNgAcsNylpN8Akj41zBTTNjme7Ao42EzT3I+JG
 9uGC0upyWF4uIy4CVZZfdzi3wGpOaoXABwmUd/+qZbY8Hk6sean/ckyQwAArZW2MbBtd
 g3iPXjB7mw79NgvjPI2C0SvZW0Rz0F1kIiEss5VcSP1tixFdd3S/r82/s2IR7rBiFX48
 zL9g==
X-Gm-Message-State: AOAM533P3lHrMxRWJi4vSLJgFEoS9Zz9nL/0R3uqwKjpJhKycrAOVzaJ
 Dbz2d7Edzh6llkUYD43m+X/eT6FJM8hlDnixOkvsyEM1804dUOmBhBnJCtqx75n50VJ7OwyfeXx
 137vO+fZak2OlN9vhijP0LVDzImrWyGA=
X-Received: by 2002:a05:6512:3d08:b0:43f:8f45:d670 with SMTP id
 d8-20020a0565123d0800b0043f8f45d670mr11761024lfv.587.1646015559358; 
 Sun, 27 Feb 2022 18:32:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJbERaRpVPuscRuwppVxrJVxBmLAxFbF5aRlwvmomeYFYfX+szdthw510q7eTiobfN1DFqzqMCx1YKtrZnhKc=
X-Received: by 2002:a05:6512:3d08:b0:43f:8f45:d670 with SMTP id
 d8-20020a0565123d0800b0043f8f45d670mr11760986lfv.587.1646015558994; Sun, 27
 Feb 2022 18:32:38 -0800 (PST)
MIME-Version: 1.0
References: <20220227134111.3254066-1-eperezma@redhat.com>
In-Reply-To: <20220227134111.3254066-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 28 Feb 2022 10:32:27 +0800
Message-ID: <CACGkMEvjE7H4HUtxuJ7ntfO9a7xwT4cQav-24bV5we3WD+Gzww@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] vDPA shadow virtqueue
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 27, 2022 at 9:42 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> This series enable shadow virtqueue (SVQ) for vhost-vdpa devices. This
> is intended as a new method of tracking the memory the devices touch
> during a migration process: Instead of relay on vhost device's dirty
> logging capability, SVQ intercepts the VQ dataplane forwarding the
> descriptors between VM and device. This way qemu is the effective
> writer of guests memory, like in qemu's virtio device operation.
>
> When SVQ is enabled qemu offers a new virtual address space to the
> device to read and write into, and it maps new vrings and the guest
> memory in it. SVQ also intercepts kicks and calls between the device
> and the guest. Used buffers relay would cause dirty memory being
> tracked.
>
> This effectively means that vDPA device passthrough is intercepted by
> qemu. While SVQ should only be enabled at migration time, the switching
> from regular mode to SVQ mode is left for a future series.
>
> It is based on the ideas of DPDK SW assisted LM, in the series of
> DPDK's https://patchwork.dpdk.org/cover/48370/ . However, these does
> not map the shadow vq in guest's VA, but in qemu's.
>
> For qemu to use shadow virtqueues the guest virtio driver must not use
> features like event_idx, indirect descriptors, packed and in_order.
> These features are easy to implement on top of this base, but is left
> for a future series for simplicity.
>
> SVQ needs to be enabled at qemu start time with vdpa cmdline parameter:
>
> -netdev type=3Dvhost-vdpa,vhostdev=3Dvhost-vdpa-0,id=3Dvhost-vdpa0,x-svq=
=3Doff
>
> The first three patches enables notifications forwarding with
> assistance of qemu. It's easy to enable only this if the relevant
> cmdline part of the last patch is applied on top of these.
>
> Next four patches implement the actual buffer forwarding. However,
> address are not translated from HVA so they will need a host device with
> an iommu allowing them to access all of the HVA range.
>
> The last part of the series uses properly the host iommu, so qemu
> creates a new iova address space in the device's range and translates
> the buffers in it. Finally, it adds the cmdline parameter.
>
> Some simple performance tests with netperf were done. They used a nested
> guest with vp_vdpa, vhost-kernel at L0 host. Starting with no svq and a
> baseline average of ~9980.13Mbps:
> Recv   Send    Send
> Socket Socket  Message  Elapsed
> Size   Size    Size     Time     Throughput
> bytes  bytes   bytes    secs.    10^6bits/sec
>
> 131072  16384  16384    30.01    9910.61
> 131072  16384  16384    30.00    10030.94
> 131072  16384  16384    30.01    9998.84
>
> To enable the notifications interception reduced performance to an
> average of ~9577.73Mbit/s:
> Recv   Send    Send
> Socket Socket  Message  Elapsed
> Size   Size    Size     Time     Throughput
> bytes  bytes   bytes    secs.    10^6bits/sec
>
> 131072  16384  16384    30.00    9563.03
> 131072  16384  16384    30.01    9626.65
> 131072  16384  16384    30.01    9543.51
>
> Finally, to enable buffers forwarding reduced the throughput again to
> ~8902.92Mbit/s:
> Recv   Send    Send
> Socket Socket  Message  Elapsed
> Size   Size    Size     Time     Throughput
> bytes  bytes   bytes    secs.    10^6bits/sec
>
> 131072  16384  16384    30.01    8643.19
> 131072  16384  16384    30.01    9033.56
> 131072  16384  16384    30.01    9032.02
>
> However, many performance improvements were left out of this series for
> simplicity, so difference if performance should shrink in the future.

I think the performance should be acceptable as a start.

>
> Comments are welcome.
>
> TODO in future series:
> * Event, indirect, packed, and others features of virtio.
> * To support different set of features between the device<->SVQ and the
>   SVQ<->guest communication.
> * Support of device host notifier memory regions.
> * To sepparate buffers forwarding in its own AIO context, so we can
>   throw more threads to that task and we don't need to stop the main
>   event loop.
> * Support multiqueue virtio-net vdpa.
> * Proper documentation.
>
> Changes from v1:
> * Feature set at device->SVQ is now the same as SVQ->guest.
> * Size of SVQ is not max available device size anymore, but guest's
>   negotiated.
> * Add VHOST_FILE_UNBIND kick and call fd treatment.
> * Make SVQ a public struct
> * Come back to previous approach to iova-tree
> * Some assertions are now fail paths. Some errors are now log_guest.
> * Only mask _F_LOG feature at vdpa_set_features svq enable path.
> * Refactor some errors and messages. Add missing error unwindings.
> * Add memory barrier at _F_NO_NOTIFY set.
> * Stop checking for features flags out of transport range.
> v1 link:
> https://lore.kernel.org/virtualization/7d86c715-6d71-8a27-91f5-8d47b71e32=
01@redhat.com/
>
> Changes from v4 RFC:
> * Support of allocating / freeing iova ranges in IOVA tree. Extending
>   already present iova-tree for that.
> * Proper validation of guest features. Now SVQ can negotiate a
>   different set of features with the device when enabled.
> * Support of host notifiers memory regions
> * Handling of SVQ full queue in case guest's descriptors span to
>   different memory regions (qemu's VA chunks).
> * Flush pending used buffers at end of SVQ operation.
> * QMP command now looks by NetClientState name. Other devices will need
>   to implement it's way to enable vdpa.
> * Rename QMP command to set, so it looks more like a way of working
> * Better use of qemu error system
> * Make a few assertions proper error-handling paths.
> * Add more documentation
> * Less coupling of virtio / vhost, that could cause friction on changes
> * Addressed many other small comments and small fixes.
>
> Changes from v3 RFC:
>   * Move everything to vhost-vdpa backend. A big change, this allowed
>     some cleanup but more code has been added in other places.
>   * More use of glib utilities, especially to manage memory.
> v3 link:
> https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06032.html
>
> Changes from v2 RFC:
>   * Adding vhost-vdpa devices support
>   * Fixed some memory leaks pointed by different comments
> v2 link:
> https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg05600.html
>
> Changes from v1 RFC:
>   * Use QMP instead of migration to start SVQ mode.
>   * Only accepting IOMMU devices, closer behavior with target devices
>     (vDPA)
>   * Fix invalid masking/unmasking of vhost call fd.
>   * Use of proper methods for synchronization.
>   * No need to modify VirtIO device code, all of the changes are
>     contained in vhost code.
>   * Delete superfluous code.
>   * An intermediate RFC was sent with only the notifications forwarding
>     changes. It can be seen in
>     https://patchew.org/QEMU/20210129205415.876290-1-eperezma@redhat.com/
> v1 link:
> https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg05372.html
>
> Eugenio P=C3=A9rez (20):
>       virtio: Add VIRTIO_F_QUEUE_STATE
>       virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED
>       virtio: Add virtio_queue_is_host_notifier_enabled
>       vhost: Make vhost_virtqueue_{start,stop} public
>       vhost: Add x-vhost-enable-shadow-vq qmp
>       vhost: Add VhostShadowVirtqueue
>       vdpa: Register vdpa devices in a list
>       vhost: Route guest->host notification through shadow virtqueue
>       Add vhost_svq_get_svq_call_notifier
>       Add vhost_svq_set_guest_call_notifier
>       vdpa: Save call_fd in vhost-vdpa
>       vhost-vdpa: Take into account SVQ in vhost_vdpa_set_vring_call
>       vhost: Route host->guest notification through shadow virtqueue
>       virtio: Add vhost_shadow_vq_get_vring_addr
>       vdpa: Save host and guest features
>       vhost: Add vhost_svq_valid_device_features to shadow vq
>       vhost: Shadow virtqueue buffers forwarding
>       vhost: Add VhostIOVATree
>       vhost: Use a tree to store memory mappings
>       vdpa: Add custom IOTLB translations to SVQ

This list seems wrong btw :)

Thanks

>
> Eugenio P=C3=A9rez (14):
>   vhost: Add VhostShadowVirtqueue
>   vhost: Add Shadow VirtQueue kick forwarding capabilities
>   vhost: Add Shadow VirtQueue call forwarding capabilities
>   vhost: Add vhost_svq_valid_features to shadow vq
>   virtio: Add vhost_shadow_vq_get_vring_addr
>   vdpa: adapt vhost_ops callbacks to svq
>   vhost: Shadow virtqueue buffers forwarding
>   util: Add iova_tree_alloc
>   vhost: Add VhostIOVATree
>   vdpa: Add custom IOTLB translations to SVQ
>   vdpa: Adapt vhost_vdpa_get_vring_base to SVQ
>   vdpa: Never set log_base addr if SVQ is enabled
>   vdpa: Expose VHOST_F_LOG_ALL on SVQ
>   vdpa: Add x-svq to NetdevVhostVDPAOptions
>
>  qapi/net.json                      |   5 +-
>  hw/virtio/vhost-iova-tree.h        |  27 ++
>  hw/virtio/vhost-shadow-virtqueue.h |  90 ++++
>  include/hw/virtio/vhost-vdpa.h     |   8 +
>  include/qemu/iova-tree.h           |  18 +
>  hw/virtio/vhost-iova-tree.c        | 155 +++++++
>  hw/virtio/vhost-shadow-virtqueue.c | 632 +++++++++++++++++++++++++++++
>  hw/virtio/vhost-vdpa.c             | 551 ++++++++++++++++++++++++-
>  net/vhost-vdpa.c                   |  48 ++-
>  util/iova-tree.c                   | 133 ++++++
>  hw/virtio/meson.build              |   2 +-
>  11 files changed, 1644 insertions(+), 25 deletions(-)
>  create mode 100644 hw/virtio/vhost-iova-tree.h
>  create mode 100644 hw/virtio/vhost-shadow-virtqueue.h
>  create mode 100644 hw/virtio/vhost-iova-tree.c
>  create mode 100644 hw/virtio/vhost-shadow-virtqueue.c
>
> --
> 2.27.0
>
>


