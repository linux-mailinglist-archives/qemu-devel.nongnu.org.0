Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 786C14D0FC0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 07:05:59 +0100 (CET)
Received: from localhost ([::1]:54190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRSys-0008Ro-Bx
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 01:05:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRSwn-0007hX-MK
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 01:03:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRSwk-0003E4-Kz
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 01:03:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646719426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VU83dZnKZPta/H9zYCIBNWakn05U7VMVJ5YHTKaIloQ=;
 b=UBiMyZJKYcFs0XQlyIaHs+YQpum4B17YvTIG2QM4OV+hGGcSkruiyyoR0TUm8Nfjkm3LLF
 VGVG4a+OVD+8Dp+DqeR4URPkztobk1Bk1jODGXQct9k+TQQsGjthmL2+VVXzeA95YrMvRN
 Mwu/x5hBQ4N3jJeRBdW56qTWDCbbsfU=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-CBUteT6hPvenp97Fxrhrqw-1; Tue, 08 Mar 2022 01:03:42 -0500
X-MC-Unique: CBUteT6hPvenp97Fxrhrqw-1
Received: by mail-pf1-f200.google.com with SMTP id
 k130-20020a628488000000b004f362b45f28so11828380pfd.9
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 22:03:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VU83dZnKZPta/H9zYCIBNWakn05U7VMVJ5YHTKaIloQ=;
 b=Z4GvJUSIQRx7ddQI870Ab/icQloz0uJ2kKlVZptoAtemNfhk926s6jHUJE7td/yCfj
 SEFN4Sk5RMWbDtr2GQHVRON3OSpTK4wGr2Q2+auSaZwKr9V6NGkX4b+ro/pnJaOEiVN6
 qF6wZ7YS8sK3TdGEd4ZCZ1128yVoKKKvgvLeksrXsCfAoXx3BflnEahiD6LIMdWDrFJ0
 imspDvfCnDtqVNvhDRYhcz2x2PPt5nO1sZ3GVZRNKMar4oNQeIXMhCu6IIIaUsKAK+bZ
 CWZesNrQ7MkcOx6gS0gSGulirwlNuu7ncYOp5lVx0F0cEGAmBv6vQOOAHltWyNYro1F2
 TbIg==
X-Gm-Message-State: AOAM531hsOlbGeUIEwg0IrI5n+BhFyQanMC/KQK2sRJMTmba1NxOkVHx
 7s06HTC4CrSElD6iZPPC8gutcjGWLiLVeK7iz6ZUucfUG8Z/Yz92zcZ2IHGTuOcSBfBcvmgBzlm
 Kabfixg+vqpviOU0e5XCdDxWqwZvu9Bztc1i8qL+c0VHRsAW78XtL04j4aGwjUJGYM1I=
X-Received: by 2002:a17:90a:6393:b0:1bf:70e7:27d2 with SMTP id
 f19-20020a17090a639300b001bf70e727d2mr2957859pjj.1.1646719421458; 
 Mon, 07 Mar 2022 22:03:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmd6in8XvX3B2GzekSv+FCSi3GvVPhuAuNUQUFRK9BiH+vo2omLdbzYEU84oNZ1H2b+jjE0A==
X-Received: by 2002:a17:90a:6393:b0:1bf:70e7:27d2 with SMTP id
 f19-20020a17090a639300b001bf70e727d2mr2957809pjj.1.1646719420978; 
 Mon, 07 Mar 2022 22:03:40 -0800 (PST)
Received: from [10.72.13.77] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a056a00178100b004f731a1a952sm792630pfg.168.2022.03.07.22.03.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 22:03:40 -0800 (PST)
Message-ID: <14d4fde4-6ea5-4805-b684-c33f6b448565@redhat.com>
Date: Tue, 8 Mar 2022 14:03:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v5 00/15] vDPA shadow virtqueue
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
References: <20220307153334.3854134-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220307153334.3854134-1-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 virtualization@lists.linux-foundation.org, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cindy Lu <lulu@redhat.com>, "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/3/7 下午11:33, Eugenio Pérez 写道:
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
> features like event_idx.
>
> SVQ needs to be enabled with cmdline:
>
> -netdev type=vhost-vdpa,vhostdev=vhost-vdpa-0,id=vhost-vdpa0,svq=on
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
> baseline average of ~9009.96Mbps:
> Recv   Send    Send
> Socket Socket  Message  Elapsed
> Size   Size    Size     Time     Throughput
> bytes  bytes   bytes    secs.    10^6bits/sec
> 131072  16384  16384    30.01    9061.03
> 131072  16384  16384    30.01    8962.94
> 131072  16384  16384    30.01    9005.92
>
> To enable SVQ buffers forwarding reduce throughput to about
> Recv   Send    Send
> Socket Socket  Message  Elapsed
> Size   Size    Size     Time     Throughput
> bytes  bytes   bytes    secs.    10^6bits/sec
> 131072  16384  16384    30.01    7689.72
> 131072  16384  16384    30.00    7752.07
> 131072  16384  16384    30.01    7750.30
>
> However, many performance improvements were left out of this series for
> simplicity, so difference should shrink in the future.
>
> Comments are welcome.


Hi Michael:

What do you think of this series? It looks good to me as a start. The 
feature could only be enabled as a dedicated parameter. If you're ok, 
I'd try to make it for 7.0.

Thanks


>
> TODO on future series:
> * Event, indirect, packed, and others features of virtio.
> * To support different set of features between the device<->SVQ and the
>    SVQ<->guest communication.
> * Support of device host notifier memory regions.
> * To sepparate buffers forwarding in its own AIO context, so we can
>    throw more threads to that task and we don't need to stop the main
>    event loop.
> * Support multiqueue virtio-net vdpa.
> * Proper documentation.
>
> Changes from v4:
> * Iterate iova->hva tree instead on maintain own tree so we support HVA
>    overlaps.
> * Fix: Errno completion at failure.
> * Rename x-svq to svq, so changes to stable does not affect cmdline parameter.
>
> Changes from v3:
> * Add @unstable feature to NetdevVhostVDPAOptions.x-svq.
> * Fix uncomplete mapping (by 1 byte) of memory regions if svq is enabled.
> v3 link:
> https://lore.kernel.org/qemu-devel/20220302203012.3476835-1-eperezma@redhat.com/
>
> Changes from v2:
> * Less assertions and more error handling in iova tree code.
> * Better documentation, both fixing errors and making @param: format
> * Homogeneize SVQ avail_idx_shadow and shadow_used_idx to make shadow a
>    prefix at both times.
> * Fix: Fo not use VirtQueueElement->len field, track separatedly.
> * Split vhost_svq_{enable,disable}_notification, so the code looks more
>    like the kernel driver code.
> * Small improvements.
> v2 link:
> https://lore.kernel.org/all/CAJaqyWfXHE0C54R_-OiwJzjC0gPpkE3eX0L8BeeZXGm1ERYPtA@mail.gmail.com/
>
> Changes from v1:
> * Feature set at device->SVQ is now the same as SVQ->guest.
> * Size of SVQ is not max available device size anymore, but guest's
>    negotiated.
> * Add VHOST_FILE_UNBIND kick and call fd treatment.
> * Make SVQ a public struct
> * Come back to previous approach to iova-tree
> * Some assertions are now fail paths. Some errors are now log_guest.
> * Only mask _F_LOG feature at vdpa_set_features svq enable path.
> * Refactor some errors and messages. Add missing error unwindings.
> * Add memory barrier at _F_NO_NOTIFY set.
> * Stop checking for features flags out of transport range.
> v1 link:
> https://lore.kernel.org/virtualization/7d86c715-6d71-8a27-91f5-8d47b71e3201@redhat.com/
>
> Changes from v4 RFC:
> * Support of allocating / freeing iova ranges in IOVA tree. Extending
>    already present iova-tree for that.
> * Proper validation of guest features. Now SVQ can negotiate a
>    different set of features with the device when enabled.
> * Support of host notifiers memory regions
> * Handling of SVQ full queue in case guest's descriptors span to
>    different memory regions (qemu's VA chunks).
> * Flush pending used buffers at end of SVQ operation.
> * QMP command now looks by NetClientState name. Other devices will need
>    to implement it's way to enable vdpa.
> * Rename QMP command to set, so it looks more like a way of working
> * Better use of qemu error system
> * Make a few assertions proper error-handling paths.
> * Add more documentation
> * Less coupling of virtio / vhost, that could cause friction on changes
> * Addressed many other small comments and small fixes.
>
> Changes from v3 RFC:
>    * Move everything to vhost-vdpa backend. A big change, this allowed
>      some cleanup but more code has been added in other places.
>    * More use of glib utilities, especially to manage memory.
> v3 link:
> https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06032.html
>
> Changes from v2 RFC:
>    * Adding vhost-vdpa devices support
>    * Fixed some memory leaks pointed by different comments
> v2 link:
> https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg05600.html
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
> v1 link:
> https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg05372.html
>
> Eugenio Pérez (20):
>        virtio: Add VIRTIO_F_QUEUE_STATE
>        virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED
>        virtio: Add virtio_queue_is_host_notifier_enabled
>        vhost: Make vhost_virtqueue_{start,stop} public
>        vhost: Add x-vhost-enable-shadow-vq qmp
>        vhost: Add VhostShadowVirtqueue
>        vdpa: Register vdpa devices in a list
>        vhost: Route guest->host notification through shadow virtqueue
>        Add vhost_svq_get_svq_call_notifier
>        Add vhost_svq_set_guest_call_notifier
>        vdpa: Save call_fd in vhost-vdpa
>        vhost-vdpa: Take into account SVQ in vhost_vdpa_set_vring_call
>        vhost: Route host->guest notification through shadow virtqueue
>        virtio: Add vhost_shadow_vq_get_vring_addr
>        vdpa: Save host and guest features
>        vhost: Add vhost_svq_valid_device_features to shadow vq
>        vhost: Shadow virtqueue buffers forwarding
>        vhost: Add VhostIOVATree
>        vhost: Use a tree to store memory mappings
>        vdpa: Add custom IOTLB translations to SVQ
>
> Eugenio Pérez (15):
>    vhost: Add VhostShadowVirtqueue
>    vhost: Add Shadow VirtQueue kick forwarding capabilities
>    vhost: Add Shadow VirtQueue call forwarding capabilities
>    vhost: Add vhost_svq_valid_features to shadow vq
>    virtio: Add vhost_svq_get_vring_addr
>    vdpa: adapt vhost_ops callbacks to svq
>    vhost: Shadow virtqueue buffers forwarding
>    util: Add iova_tree_alloc_map
>    util: add iova_tree_find_iova
>    vhost: Add VhostIOVATree
>    vdpa: Add custom IOTLB translations to SVQ
>    vdpa: Adapt vhost_vdpa_get_vring_base to SVQ
>    vdpa: Never set log_base addr if SVQ is enabled
>    vdpa: Expose VHOST_F_LOG_ALL on SVQ
>    vdpa: Add x-svq to NetdevVhostVDPAOptions
>
>   qapi/net.json                      |   8 +-
>   hw/virtio/vhost-iova-tree.h        |  27 ++
>   hw/virtio/vhost-shadow-virtqueue.h |  87 ++++
>   include/hw/virtio/vhost-vdpa.h     |   8 +
>   include/qemu/iova-tree.h           |  38 +-
>   hw/virtio/vhost-iova-tree.c        | 110 +++++
>   hw/virtio/vhost-shadow-virtqueue.c | 637 +++++++++++++++++++++++++++++
>   hw/virtio/vhost-vdpa.c             | 525 +++++++++++++++++++++++-
>   net/vhost-vdpa.c                   |  48 ++-
>   util/iova-tree.c                   | 169 ++++++++
>   hw/virtio/meson.build              |   2 +-
>   11 files changed, 1633 insertions(+), 26 deletions(-)
>   create mode 100644 hw/virtio/vhost-iova-tree.h
>   create mode 100644 hw/virtio/vhost-shadow-virtqueue.h
>   create mode 100644 hw/virtio/vhost-iova-tree.c
>   create mode 100644 hw/virtio/vhost-shadow-virtqueue.c
>


