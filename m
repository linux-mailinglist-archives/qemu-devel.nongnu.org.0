Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55D9442D5F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:01:39 +0100 (CET)
Received: from localhost ([::1]:49892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsTy-0002gp-Ia
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhrrZ-0004a5-B2
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:21:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mhrrW-0000fk-Ay
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:21:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635852112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mBXGAKuHdvJi5ygo2hYUj6+ptx03wzdKlDPaJRLEMEA=;
 b=X9Cf4vnTQO2wW+fZC9GYTIqE/m+0E9c9JJvLKwAX0WpjFMiz2iSaPWbG+82wrCjYRa9a/g
 jgljcvnVMJue8RZ3F75fVHLt9VgLAadD/p4VxTd28C94MjBEMac91chMVx5Qx8126j8Df0
 PlMjdenIDSQupjncybk54Z2K/F7ipYc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-kvUIKqAbOA-xSNoLmqrk5w-1; Tue, 02 Nov 2021 07:21:49 -0400
X-MC-Unique: kvUIKqAbOA-xSNoLmqrk5w-1
Received: by mail-qv1-f71.google.com with SMTP id
 hf12-20020a0562140e8c00b00382cdfe644eso19224351qvb.23
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mBXGAKuHdvJi5ygo2hYUj6+ptx03wzdKlDPaJRLEMEA=;
 b=VKNvhLJvmbcA9UAIT/2plOycN+OUzhA9oOm0YRtvbR4G9lDYNMi62VU7g5RriduX5P
 j4E3AdVTi7BYn2nfKf2CAePbqq98/h9DW3NKnApW7cWRKxLcoLBcOQhS/Roa8EPaPM/2
 4m3Fq+nVZo6JHCy5bDGBzB0eA6EGEYxvl4NSrLOauRZYJujq0tkIsDcjU3+woIHn8SVO
 4iDU1LArzl+kypwrQd2Cpm/oX2nGdfWdoc0GHKmiocg2WrOPxws5WzdQlrZCkKKtBBdv
 XDf/Yp0NUcqN2KUsv1qZcIik2ywoBypHUERzcSsvTuGHY8z4IN+t9fSMIUZEIlnOx9yz
 a1DQ==
X-Gm-Message-State: AOAM531uM03l5U1zZXVuBg6PdzDVGf9y+9hwy7uQh2cY0RsSRjy4GWWL
 dDT41w8NyILnkd1+/Xrv/UlMryOcKpgDeSbjS8p7dir0JemG6v2qTFmpgmSVAyY+00V6cCdZEfZ
 2WUwT41D0NmsHalU0iNXMKuJfiinvQQE=
X-Received: by 2002:a05:620a:2848:: with SMTP id
 h8mr28389310qkp.87.1635852109357; 
 Tue, 02 Nov 2021 04:21:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2anB3Pn/ChuNKfBTm2A+ZfjmOOOUDB5UTGCuwLv0M1UbIp2sXjIO/4iLMpssIuvpSpRMAr6pKe8lNmB7kUKo=
X-Received: by 2002:a05:620a:2848:: with SMTP id
 h8mr28389279qkp.87.1635852109093; 
 Tue, 02 Nov 2021 04:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <24da75d6-edcd-5cb9-f51e-c3e5ce55dcd4@redhat.com>
In-Reply-To: <24da75d6-edcd-5cb9-f51e-c3e5ce55dcd4@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 2 Nov 2021 12:21:13 +0100
Message-ID: <CAJaqyWc8m1f+pOzOPuVDOB+YgzB3nxX_gP1AV7MdhP13Lf9=aw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 00/26] vDPA shadow virtqueue
To: Jason Wang <jasowang@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Xiao W Wang <xiao.w.wang@intel.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 2, 2021 at 5:26 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/30 =E4=B8=8A=E5=8D=882:34, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This series enable shadow virtqueue (SVQ) for vhost-vdpa devices. This
> > is intended as a new method of tracking the memory the devices touch
> > during a migration process: Instead of relay on vhost device's dirty
> > logging capability, SVQ intercepts the VQ dataplane forwarding the
> > descriptors between VM and device. This way qemu is the effective
> > writer of guests memory, like in qemu's virtio device operation.
> >
> > When SVQ is enabled qemu offers a new virtual address space to the
> > device to read and write into, and it maps new vrings and the guest
> > memory in it. SVQ also intercepts kicks and calls between the device
> > and the guest. Used buffers relay would cause dirty memory being
> > tracked, but at this RFC SVQ is not enabled on migration automatically.
> >
> > Thanks of being a buffers relay system, SVQ can be used also to
> > communicate devices and drivers with different capabilities, like
> > devices that only supports packed vring and not split and old guest
> > with no driver packed support.
> >
> > It is based on the ideas of DPDK SW assisted LM, in the series of
> > DPDK's https://patchwork.dpdk.org/cover/48370/ . However, these does
> > not map the shadow vq in guest's VA, but in qemu's.
> >
> > For qemu to use shadow virtqueues the guest virtio driver must not use
> > features like event_idx.
> >
> > SVQ needs to be enabled with QMP command:
> >
> > { "execute": "x-vhost-set-shadow-vq",
> >        "arguments": { "name": "vhost-vdpa0", "enable": true } }
> >
> > This series includes some patches to delete in the final version that
> > helps with its testing. The first two of the series have been sent
> > sepparately but they haven't been included in qemu main branch.
> >
> > The two after them adds the feature to stop the device and be able to
> > set and get its status. It's intended to be used with vp_vpda driver in
> > a nested environment, so they are also external to this series. The
> > vp_vdpa driver also need modifications to forward the new status bit,
> > they will be proposed sepparately
> >
> > Patches 5-12 prepares the SVQ and QMP command to support guest to host
> > notifications forwarding. If the SVQ is enabled with these ones
> > applied and the device supports it, that part can be tested in
> > isolation (for example, with networking), hopping through SVQ.
> >
> > Same thing is true with patches 13-17, but with device to guest
> > notifications.
> >
> > Based on them, patches from 18 to 22 implement the actual buffer
> > forwarding, using some features already introduced in previous.
> > However, they will need a host device with no iommu, something that
> > is not available at the moment.
> >
> > The last part of the series uses properly the host iommu, so the driver
> > can access this new virtual address space created.
> >
> > Comments are welcome.
>
>
> I think we need do some benchmark to see the performance impact.
>
> Thanks
>

Ok, I will add them for the next revision.

Thanks!

>
> >
> > TODO:
> > * Event, indirect, packed, and others features of virtio.
> > * To sepparate buffers forwarding in its own AIO context, so we can
> >    throw more threads to that task and we don't need to stop the main
> >    event loop.
> > * Support multiqueue virtio-net vdpa.
> > * Proper documentation.
> >
> > Changes from v4 RFC:
> > * Support of allocating / freeing iova ranges in IOVA tree. Extending
> >    already present iova-tree for that.
> > * Proper validation of guest features. Now SVQ can negotiate a
> >    different set of features with the device when enabled.
> > * Support of host notifiers memory regions
> > * Handling of SVQ full queue in case guest's descriptors span to
> >    different memory regions (qemu's VA chunks).
> > * Flush pending used buffers at end of SVQ operation.
> > * QMP command now looks by NetClientState name. Other devices will need
> >    to implement it's way to enable vdpa.
> > * Rename QMP command to set, so it looks more like a way of working
> > * Better use of qemu error system
> > * Make a few assertions proper error-handling paths.
> > * Add more documentation
> > * Less coupling of virtio / vhost, that could cause friction on changes
> > * Addressed many other small comments and small fixes.
> >
> > Changes from v3 RFC:
> >    * Move everything to vhost-vdpa backend. A big change, this allowed
> >      some cleanup but more code has been added in other places.
> >    * More use of glib utilities, especially to manage memory.
> > v3 link:
> > https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06032.html
> >
> > Changes from v2 RFC:
> >    * Adding vhost-vdpa devices support
> >    * Fixed some memory leaks pointed by different comments
> > v2 link:
> > https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg05600.html
> >
> > Changes from v1 RFC:
> >    * Use QMP instead of migration to start SVQ mode.
> >    * Only accepting IOMMU devices, closer behavior with target devices
> >      (vDPA)
> >    * Fix invalid masking/unmasking of vhost call fd.
> >    * Use of proper methods for synchronization.
> >    * No need to modify VirtIO device code, all of the changes are
> >      contained in vhost code.
> >    * Delete superfluous code.
> >    * An intermediate RFC was sent with only the notifications forwardin=
g
> >      changes. It can be seen in
> >      https://patchew.org/QEMU/20210129205415.876290-1-eperezma@redhat.c=
om/
> > v1 link:
> > https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg05372.html
> >
> > Eugenio P=C3=A9rez (20):
> >        virtio: Add VIRTIO_F_QUEUE_STATE
> >        virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED
> >        virtio: Add virtio_queue_is_host_notifier_enabled
> >        vhost: Make vhost_virtqueue_{start,stop} public
> >        vhost: Add x-vhost-enable-shadow-vq qmp
> >        vhost: Add VhostShadowVirtqueue
> >        vdpa: Register vdpa devices in a list
> >        vhost: Route guest->host notification through shadow virtqueue
> >        Add vhost_svq_get_svq_call_notifier
> >        Add vhost_svq_set_guest_call_notifier
> >        vdpa: Save call_fd in vhost-vdpa
> >        vhost-vdpa: Take into account SVQ in vhost_vdpa_set_vring_call
> >        vhost: Route host->guest notification through shadow virtqueue
> >        virtio: Add vhost_shadow_vq_get_vring_addr
> >        vdpa: Save host and guest features
> >        vhost: Add vhost_svq_valid_device_features to shadow vq
> >        vhost: Shadow virtqueue buffers forwarding
> >        vhost: Add VhostIOVATree
> >        vhost: Use a tree to store memory mappings
> >        vdpa: Add custom IOTLB translations to SVQ
> >
> > Eugenio P=C3=A9rez (26):
> >    util: Make some iova_tree parameters const
> >    vhost: Fix last queue index of devices with no cvq
> >    virtio: Add VIRTIO_F_QUEUE_STATE
> >    virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED
> >    vhost: Add x-vhost-set-shadow-vq qmp
> >    vhost: Add VhostShadowVirtqueue
> >    vdpa: Save kick_fd in vhost-vdpa
> >    vdpa: Add vhost_svq_get_dev_kick_notifier
> >    vdpa: Add vhost_svq_set_svq_kick_fd
> >    vhost: Add Shadow VirtQueue kick forwarding capabilities
> >    vhost: Handle host notifiers in SVQ
> >    vhost: Route guest->host notification through shadow virtqueue
> >    Add vhost_svq_get_svq_call_notifier
> >    Add vhost_svq_set_guest_call_notifier
> >    vdpa: Save call_fd in vhost-vdpa
> >    vhost-vdpa: Take into account SVQ in vhost_vdpa_set_vring_call
> >    vhost: Route host->guest notification through shadow virtqueue
> >    virtio: Add vhost_shadow_vq_get_vring_addr
> >    vdpa: ack VIRTIO_F_QUEUE_STATE if device supports it
> >    vhost: Add vhost_svq_valid_device_features to shadow vq
> >    vhost: Add vhost_svq_valid_guest_features to shadow vq
> >    vhost: Shadow virtqueue buffers forwarding
> >    util: Add iova_tree_alloc
> >    vhost: Add VhostIOVATree
> >    vhost: Use a tree to store memory mappings
> >    vdpa: Add custom IOTLB translations to SVQ
> >
> >   qapi/net.json                                 |  20 +
> >   hw/virtio/vhost-iova-tree.h                   |  27 +
> >   hw/virtio/vhost-shadow-virtqueue.h            |  44 ++
> >   hw/virtio/virtio-pci.h                        |   1 +
> >   include/hw/virtio/vhost-vdpa.h                |  12 +
> >   include/hw/virtio/virtio.h                    |   4 +-
> >   include/qemu/iova-tree.h                      |  25 +-
> >   .../standard-headers/linux/virtio_config.h    |   5 +
> >   include/standard-headers/linux/virtio_pci.h   |   2 +
> >   hw/i386/intel_iommu.c                         |   2 +-
> >   hw/net/vhost_net.c                            |   2 +-
> >   hw/net/virtio-net.c                           |   6 +-
> >   hw/virtio/vhost-iova-tree.c                   | 157 ++++
> >   hw/virtio/vhost-shadow-virtqueue.c            | 746 +++++++++++++++++=
+
> >   hw/virtio/vhost-vdpa.c                        | 437 +++++++++-
> >   hw/virtio/virtio-pci.c                        |  16 +-
> >   net/vhost-vdpa.c                              |  28 +
> >   util/iova-tree.c                              | 151 +++-
> >   hw/virtio/meson.build                         |   2 +-
> >   19 files changed, 1664 insertions(+), 23 deletions(-)
> >   create mode 100644 hw/virtio/vhost-iova-tree.h
> >   create mode 100644 hw/virtio/vhost-shadow-virtqueue.h
> >   create mode 100644 hw/virtio/vhost-iova-tree.c
> >   create mode 100644 hw/virtio/vhost-shadow-virtqueue.c
> >
>


