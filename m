Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11054415D9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 10:08:36 +0100 (CET)
Received: from localhost ([::1]:37906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhTIx-00035y-No
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 05:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhTHn-0002P1-6T
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:07:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhTHk-0006jp-Am
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635757639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KOgWo5wncSdrt2BeuGA5/zB24aYxG9w3LCbFllz/HMI=;
 b=KoKX3nulfOI713HnfH0VWFuZKaZqs+hh95jCfUCWoU42UGdEoOEMVk93wqf+upEBd4anfG
 OTBJhviSUO7R1aQiHzU8C6KDw9ZhFLc3iyAWbC7rf6xT+dd2Koar8qOMczLF1ZdUgyutfu
 rkAnH3wYcRnXsq3dOeyx97IPpr5FCg8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-IWSBhy6JMYekBfwLIo8SXw-1; Mon, 01 Nov 2021 05:07:14 -0400
X-MC-Unique: IWSBhy6JMYekBfwLIo8SXw-1
Received: by mail-qv1-f69.google.com with SMTP id
 t12-20020a05621421ac00b00382ea49a7cbso15764946qvc.0
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 02:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KOgWo5wncSdrt2BeuGA5/zB24aYxG9w3LCbFllz/HMI=;
 b=QTW6m5DqhQjjrVoOi93a9qTPrM8c+K8vhNc8+r+WeXzjYJ6zwxwVmu0WIA0ierA1sn
 33GCcahZGkNfuTFfqSQg94/jjg8kNqMfW3OhSrldwAI1S10ILI7r2GZls9+RjJXK1q81
 wzH3NFGtc7GeklgjKILawlNYquACLKlX6EKSgoFbJ6U8CqALSM4get/jrnl0AWwealB7
 Yokwk/0c/ww6oIu991eh3D17vhPmN17b9JOMIuF76Jm9OEkiOAy/AyFJ/KDKR+lpO42/
 IRGV1ZmNMwpGh0aJ4yCjhnl+WaEOxmkAFPmwTubdkWS6XWgnyHkJ+bAMIZosmxkoaLf9
 WKkw==
X-Gm-Message-State: AOAM533wysBrfrwYumNjX7JIA4jmbN6RTf0YHWdUfHfHafZ3TobN0vRw
 lJvkeJ2+Md98L2Rp3wi8ULaRuPzzGIEwCpjb+XGzZdbK2QU55rqOZI3p3J54v+I5KkcZmfo52WD
 cr+j+FmKvk2mLZuBRedpl5zuIQpF/zDU=
X-Received: by 2002:ac8:7d13:: with SMTP id g19mr29346253qtb.178.1635757633541; 
 Mon, 01 Nov 2021 02:07:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3yYU9wz3JLw59mF46Rhw3eoLmbimLYLqLSg/kVKtc4NmpnqrEX7LzeK8cipv/JBZTwST/Q5GOX42vNiMWwp4=
X-Received: by 2002:ac8:7d13:: with SMTP id g19mr29346211qtb.178.1635757633200; 
 Mon, 01 Nov 2021 02:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211029183525.1776416-1-eperezma@redhat.com>
In-Reply-To: <20211029183525.1776416-1-eperezma@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 1 Nov 2021 10:06:37 +0100
Message-ID: <CAJaqyWcqPpZzfd+soP0kt07iFTYC2essOS-N1axeHCHZSHnHYQ@mail.gmail.com>
Subject: Re: [RFC PATCH v5 00/26] vDPA shadow virtqueue
To: qemu-level <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.736,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 29, 2021 at 8:41 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
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
> tracked, but at this RFC SVQ is not enabled on migration automatically.
>
> Thanks of being a buffers relay system, SVQ can be used also to
> communicate devices and drivers with different capabilities, like
> devices that only supports packed vring and not split and old guest
> with no driver packed support.
>
> It is based on the ideas of DPDK SW assisted LM, in the series of
> DPDK's https://patchwork.dpdk.org/cover/48370/ . However, these does
> not map the shadow vq in guest's VA, but in qemu's.
>
> For qemu to use shadow virtqueues the guest virtio driver must not use
> features like event_idx.
>
> SVQ needs to be enabled with QMP command:
>
> { "execute": "x-vhost-set-shadow-vq",
>       "arguments": { "name": "vhost-vdpa0", "enable": true } }
>
> This series includes some patches to delete in the final version that
> helps with its testing. The first two of the series have been sent
> sepparately but they haven't been included in qemu main branch.
>
> The two after them adds the feature to stop the device and be able to
> set and get its status. It's intended to be used with vp_vpda driver in
> a nested environment, so they are also external to this series. The
> vp_vdpa driver also need modifications to forward the new status bit,
> they will be proposed sepparately
>
> Patches 5-12 prepares the SVQ and QMP command to support guest to host
> notifications forwarding. If the SVQ is enabled with these ones
> applied and the device supports it, that part can be tested in
> isolation (for example, with networking), hopping through SVQ.
>
> Same thing is true with patches 13-17, but with device to guest
> notifications.
>
> Based on them, patches from 18 to 22 implement the actual buffer
> forwarding, using some features already introduced in previous.
> However, they will need a host device with no iommu, something that
> is not available at the moment.
>
> The last part of the series uses properly the host iommu, so the driver
> can access this new virtual address space created.
>
> Comments are welcome.
>
> TODO:
> * Event, indirect, packed, and others features of virtio.
> * To sepparate buffers forwarding in its own AIO context, so we can
>   throw more threads to that task and we don't need to stop the main
>   event loop.
> * Support multiqueue virtio-net vdpa.
> * Proper documentation.
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
>
> Eugenio P=C3=A9rez (26):
>   util: Make some iova_tree parameters const
>   vhost: Fix last queue index of devices with no cvq
>   virtio: Add VIRTIO_F_QUEUE_STATE
>   virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED
>   vhost: Add x-vhost-set-shadow-vq qmp
>   vhost: Add VhostShadowVirtqueue
>   vdpa: Save kick_fd in vhost-vdpa
>   vdpa: Add vhost_svq_get_dev_kick_notifier
>   vdpa: Add vhost_svq_set_svq_kick_fd
>   vhost: Add Shadow VirtQueue kick forwarding capabilities
>   vhost: Handle host notifiers in SVQ
>   vhost: Route guest->host notification through shadow virtqueue
>   Add vhost_svq_get_svq_call_notifier
>   Add vhost_svq_set_guest_call_notifier
>   vdpa: Save call_fd in vhost-vdpa
>   vhost-vdpa: Take into account SVQ in vhost_vdpa_set_vring_call
>   vhost: Route host->guest notification through shadow virtqueue
>   virtio: Add vhost_shadow_vq_get_vring_addr
>   vdpa: ack VIRTIO_F_QUEUE_STATE if device supports it
>   vhost: Add vhost_svq_valid_device_features to shadow vq
>   vhost: Add vhost_svq_valid_guest_features to shadow vq
>   vhost: Shadow virtqueue buffers forwarding
>   util: Add iova_tree_alloc
>   vhost: Add VhostIOVATree
>   vhost: Use a tree to store memory mappings
>   vdpa: Add custom IOTLB translations to SVQ
>
>  qapi/net.json                                 |  20 +
>  hw/virtio/vhost-iova-tree.h                   |  27 +
>  hw/virtio/vhost-shadow-virtqueue.h            |  44 ++
>  hw/virtio/virtio-pci.h                        |   1 +
>  include/hw/virtio/vhost-vdpa.h                |  12 +
>  include/hw/virtio/virtio.h                    |   4 +-
>  include/qemu/iova-tree.h                      |  25 +-
>  .../standard-headers/linux/virtio_config.h    |   5 +
>  include/standard-headers/linux/virtio_pci.h   |   2 +
>  hw/i386/intel_iommu.c                         |   2 +-
>  hw/net/vhost_net.c                            |   2 +-
>  hw/net/virtio-net.c                           |   6 +-
>  hw/virtio/vhost-iova-tree.c                   | 157 ++++
>  hw/virtio/vhost-shadow-virtqueue.c            | 746 ++++++++++++++++++
>  hw/virtio/vhost-vdpa.c                        | 437 +++++++++-
>  hw/virtio/virtio-pci.c                        |  16 +-
>  net/vhost-vdpa.c                              |  28 +
>  util/iova-tree.c                              | 151 +++-
>  hw/virtio/meson.build                         |   2 +-
>  19 files changed, 1664 insertions(+), 23 deletions(-)
>  create mode 100644 hw/virtio/vhost-iova-tree.h
>  create mode 100644 hw/virtio/vhost-shadow-virtqueue.h
>  create mode 100644 hw/virtio/vhost-iova-tree.c
>  create mode 100644 hw/virtio/vhost-shadow-virtqueue.c
>
> --
> 2.27.0
>
>
>

To make the review easier, this tree is also at [1].

Thanks!

[1] https://github.com/eugpermar/qemu/tree/vdpa_sw_live_migration.d/vdpa-v5


