Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A624D1226
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 09:25:01 +0100 (CET)
Received: from localhost ([::1]:60656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRV9P-0003Xw-RE
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 03:24:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRV5l-0007EO-Ne
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 03:21:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRV5i-0007PN-TT
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 03:21:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646727670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gCDZI3m0f5UM/DkL0+DbHAXsjEf0lqLwsWqmk2ByvPg=;
 b=MXJ1cjM5Ejg30ZZP+VFp9Ruo9QlAu/Sixp4sJ6Qw7eeJcKGJxoZzSZUU7J3mJ6fSt781Hp
 8fGA6Nv3b8vjwUrWXOp2B3pC++mKq66r5T5ANyGL4wpuZHkp87v/saU30FhwKwDjQ2sVgd
 bp6kHNiD6Q1ovTzBaoQa2I8vpReVfAw=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-6KQD9UotNPWICBAgCOrVzw-1; Tue, 08 Mar 2022 03:21:07 -0500
X-MC-Unique: 6KQD9UotNPWICBAgCOrVzw-1
Received: by mail-lf1-f70.google.com with SMTP id
 w25-20020a05651234d900b0044023ac3f64so4610032lfr.0
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 00:21:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gCDZI3m0f5UM/DkL0+DbHAXsjEf0lqLwsWqmk2ByvPg=;
 b=dIp5pdrR5s5TOHRDthkV6saO/j+ZE+LMb77zGBaqtoIjwEFP973axLY+5d8TkUX7wG
 nCOzGdxgNe7RXCSBqSXfJ/na0nw+J89q6l0TJx0KlTYUxe9oGBDsVm1xYcLjnR7ImnqI
 8mkBaDRLXcRi2GU9L2hVk38w4AzESFvqz9u0NN/YLhdtPxv1RR5ref+nNIf+dDrbvUlZ
 ZGmMcnAUfPevAIBVS5SZ1UOX/rBSPitC1PYaZYz6Yf4Qo5t8a24FhTpDAdbAbUSS40HF
 8mH+jwI81KaKUvDx33ffOrb5+9Loek3kFgUKH99ALdv3A4JXgYHjiXeY1/UbWpMOgBm2
 MeFw==
X-Gm-Message-State: AOAM533znMrVXKlNa3Rb6JOOXn/3UZIWIqKOjUlgEQI8vmk3hNm/H2De
 3VkqQjF4yOQX6QuIhVuZwgltmbBe+xgh51DOfwftFTbTH77BJ7dintN8W6IKrRgCWFvhYy1XraT
 ipgfQt86KDPqFa0IjZrae1z4oRnfcbjI=
X-Received: by 2002:a2e:9045:0:b0:247:da7d:a460 with SMTP id
 n5-20020a2e9045000000b00247da7da460mr9774326ljg.300.1646727665518; 
 Tue, 08 Mar 2022 00:21:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdKlLdEehESY5OrM4utB3JA172IlgouFVmW5MT/2su6NX3kRUeZdgNNRP7vc52DUzb7GB7N337B0GPxDXIBZ4=
X-Received: by 2002:a2e:9045:0:b0:247:da7d:a460 with SMTP id
 n5-20020a2e9045000000b00247da7da460mr9774296ljg.300.1646727665065; Tue, 08
 Mar 2022 00:21:05 -0800 (PST)
MIME-Version: 1.0
References: <20220307153334.3854134-1-eperezma@redhat.com>
 <14d4fde4-6ea5-4805-b684-c33f6b448565@redhat.com>
 <20220308020348-mutt-send-email-mst@kernel.org>
 <CACGkMEvY-+XpPWbtiX9dy+fwDxPp7sHFhH_LY0PB2YuusEugyw@mail.gmail.com>
 <20220308022300-mutt-send-email-mst@kernel.org>
 <CACGkMEvuTPCRk7Ng7CbgpPSPgs_QYijzc5fU+cV3kW09W1R7Qg@mail.gmail.com>
 <20220308024724-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220308024724-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 8 Mar 2022 16:20:53 +0800
Message-ID: <CACGkMEsPBDM8ko1qgnCR1DcofPNJJo3S2j3pOJHk4xaSGQimcQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] vDPA shadow virtqueue
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 8, 2022 at 3:55 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Mar 08, 2022 at 03:34:17PM +0800, Jason Wang wrote:
> > On Tue, Mar 8, 2022 at 3:28 PM Michael S. Tsirkin <mst@redhat.com> wrot=
e:
> > >
> > > On Tue, Mar 08, 2022 at 03:14:35PM +0800, Jason Wang wrote:
> > > > On Tue, Mar 8, 2022 at 3:11 PM Michael S. Tsirkin <mst@redhat.com> =
wrote:
> > > > >
> > > > > On Tue, Mar 08, 2022 at 02:03:32PM +0800, Jason Wang wrote:
> > > > > >
> > > > > > =E5=9C=A8 2022/3/7 =E4=B8=8B=E5=8D=8811:33, Eugenio P=C3=A9rez =
=E5=86=99=E9=81=93:
> > > > > > > This series enable shadow virtqueue (SVQ) for vhost-vdpa devi=
ces. This
> > > > > > > is intended as a new method of tracking the memory the device=
s touch
> > > > > > > during a migration process: Instead of relay on vhost device'=
s dirty
> > > > > > > logging capability, SVQ intercepts the VQ dataplane forwardin=
g the
> > > > > > > descriptors between VM and device. This way qemu is the effec=
tive
> > > > > > > writer of guests memory, like in qemu's virtio device operati=
on.
> > > > > > >
> > > > > > > When SVQ is enabled qemu offers a new virtual address space t=
o the
> > > > > > > device to read and write into, and it maps new vrings and the=
 guest
> > > > > > > memory in it. SVQ also intercepts kicks and calls between the=
 device
> > > > > > > and the guest. Used buffers relay would cause dirty memory be=
ing
> > > > > > > tracked.
> > > > > > >
> > > > > > > This effectively means that vDPA device passthrough is interc=
epted by
> > > > > > > qemu. While SVQ should only be enabled at migration time, the=
 switching
> > > > > > > from regular mode to SVQ mode is left for a future series.
> > > > > > >
> > > > > > > It is based on the ideas of DPDK SW assisted LM, in the serie=
s of
> > > > > > > DPDK's https://patchwork.dpdk.org/cover/48370/ . However, the=
se does
> > > > > > > not map the shadow vq in guest's VA, but in qemu's.
> > > > > > >
> > > > > > > For qemu to use shadow virtqueues the guest virtio driver mus=
t not use
> > > > > > > features like event_idx.
> > > > > > >
> > > > > > > SVQ needs to be enabled with cmdline:
> > > > > > >
> > > > > > > -netdev type=3Dvhost-vdpa,vhostdev=3Dvhost-vdpa-0,id=3Dvhost-=
vdpa0,svq=3Don
> > > > >
> > > > > A stable API for an incomplete feature is a problem imho.
> > > >
> > > > It should be "x-svq".
> > >
> > >
> > > Well look at patch 15.
> >
> > It's a bug that needs to be fixed.
> >
> > >
> > > > >
> > > > >
> > > > > > >
> > > > > > > The first three patches enables notifications forwarding with
> > > > > > > assistance of qemu. It's easy to enable only this if the rele=
vant
> > > > > > > cmdline part of the last patch is applied on top of these.
> > > > > > >
> > > > > > > Next four patches implement the actual buffer forwarding. How=
ever,
> > > > > > > address are not translated from HVA so they will need a host =
device with
> > > > > > > an iommu allowing them to access all of the HVA range.
> > > > > > >
> > > > > > > The last part of the series uses properly the host iommu, so =
qemu
> > > > > > > creates a new iova address space in the device's range and tr=
anslates
> > > > > > > the buffers in it. Finally, it adds the cmdline parameter.
> > > > > > >
> > > > > > > Some simple performance tests with netperf were done. They us=
ed a nested
> > > > > > > guest with vp_vdpa, vhost-kernel at L0 host. Starting with no=
 svq and a
> > > > > > > baseline average of ~9009.96Mbps:
> > > > > > > Recv   Send    Send
> > > > > > > Socket Socket  Message  Elapsed
> > > > > > > Size   Size    Size     Time     Throughput
> > > > > > > bytes  bytes   bytes    secs.    10^6bits/sec
> > > > > > > 131072  16384  16384    30.01    9061.03
> > > > > > > 131072  16384  16384    30.01    8962.94
> > > > > > > 131072  16384  16384    30.01    9005.92
> > > > > > >
> > > > > > > To enable SVQ buffers forwarding reduce throughput to about
> > > > > > > Recv   Send    Send
> > > > > > > Socket Socket  Message  Elapsed
> > > > > > > Size   Size    Size     Time     Throughput
> > > > > > > bytes  bytes   bytes    secs.    10^6bits/sec
> > > > > > > 131072  16384  16384    30.01    7689.72
> > > > > > > 131072  16384  16384    30.00    7752.07
> > > > > > > 131072  16384  16384    30.01    7750.30
> > > > > > >
> > > > > > > However, many performance improvements were left out of this =
series for
> > > > > > > simplicity, so difference should shrink in the future.
> > > > > > >
> > > > > > > Comments are welcome.
> > > > > >
> > > > > >
> > > > > > Hi Michael:
> > > > > >
> > > > > > What do you think of this series? It looks good to me as a star=
t. The
> > > > > > feature could only be enabled as a dedicated parameter. If you'=
re ok, I'd
> > > > > > try to make it for 7.0.
> > > > > >
> > > > > > Thanks
> > > > >
> > > > > Well that's cutting it awfully close, and it's not really useful
> > > > > at the current stage, is it?
> > > >
> > > > This allows vDPA to be migrated when using "x-svq=3Don".
> > > > But anyhow it's
> > > > experimental.
> > >
> > > it's less experimental than incomplete. It seems pretty clearly not
> > > the way it will work down the road, we don't want svq involved
> > > at all times.
> >
> > Right, but SVQ could be used for other places e.g providing migration
> > compatibility when the destination lacks some features.
>
> In its current form? I don't see how.  Generally?

Generally, yes.

> Maybe but I suspect
> we'll have to rework it completely for that.

Probably not, from what I see, it just needs some extension of the current =
code.

>
> > >
> > > > >
> > > > > The IOVA trick does not feel complete either.
> > > >
> > > > I don't get here. We don't use any IOVA trick as DPDK (it reserve I=
OVA
> > > > for shadow vq) did. So we won't suffer from the issues of DPDK.
> > > >
> > > > Thanks
> > >
> > > Maybe I misundrstand how this all works.
> > > I refer to all the iova_tree_alloc_map things.
> >
> > It's a simple IOVA allocater actually. Anything wrong with that?
>
> Not by itself but I'm not sure we can guarantee guest will not
> attempt to use the IOVA addresses we are reserving down
> the road.

The IOVA is allocated via the listeners and stored in the iova tree
per GPA range as IOVA->(GPA)->HVA.Guests will only see GPA, Qemu
virtio core see GPA to HVA mapping. And we do a reverse lookup to find
the HVA->IOVA we allocated previously.  So we have double check here:

1) Qemu memory core to make sure the GPA that guest uses is valid
2) the IOVA tree that guarantees there will be no HVA beyond what
guest can see is used

So technically, there's no way for the guest to use the IOVA address
allocated for the shadow virtqueue.

Thanks

>
> > I'm fine with making it for the future release.
> >
> > Thanks
> >
> > >
> > > > >
> > > > > >
> > > > > > >
> > > > > > > TODO on future series:
> > > > > > > * Event, indirect, packed, and others features of virtio.
> > > > > > > * To support different set of features between the device<->S=
VQ and the
> > > > > > >    SVQ<->guest communication.
> > > > > > > * Support of device host notifier memory regions.
> > > > > > > * To sepparate buffers forwarding in its own AIO context, so =
we can
> > > > > > >    throw more threads to that task and we don't need to stop =
the main
> > > > > > >    event loop.
> > > > > > > * Support multiqueue virtio-net vdpa.
> > > > > > > * Proper documentation.
> > > > > > >
> > > > > > > Changes from v4:
> > > > > > > * Iterate iova->hva tree instead on maintain own tree so we s=
upport HVA
> > > > > > >    overlaps.
> > > > > > > * Fix: Errno completion at failure.
> > > > > > > * Rename x-svq to svq, so changes to stable does not affect c=
mdline parameter.
> > > > > > >
> > > > > > > Changes from v3:
> > > > > > > * Add @unstable feature to NetdevVhostVDPAOptions.x-svq.
> > > > > > > * Fix uncomplete mapping (by 1 byte) of memory regions if svq=
 is enabled.
> > > > > > > v3 link:
> > > > > > > https://lore.kernel.org/qemu-devel/20220302203012.3476835-1-e=
perezma@redhat.com/
> > > > > > >
> > > > > > > Changes from v2:
> > > > > > > * Less assertions and more error handling in iova tree code.
> > > > > > > * Better documentation, both fixing errors and making @param:=
 format
> > > > > > > * Homogeneize SVQ avail_idx_shadow and shadow_used_idx to mak=
e shadow a
> > > > > > >    prefix at both times.
> > > > > > > * Fix: Fo not use VirtQueueElement->len field, track separate=
dly.
> > > > > > > * Split vhost_svq_{enable,disable}_notification, so the code =
looks more
> > > > > > >    like the kernel driver code.
> > > > > > > * Small improvements.
> > > > > > > v2 link:
> > > > > > > https://lore.kernel.org/all/CAJaqyWfXHE0C54R_-OiwJzjC0gPpkE3e=
X0L8BeeZXGm1ERYPtA@mail.gmail.com/
> > > > > > >
> > > > > > > Changes from v1:
> > > > > > > * Feature set at device->SVQ is now the same as SVQ->guest.
> > > > > > > * Size of SVQ is not max available device size anymore, but g=
uest's
> > > > > > >    negotiated.
> > > > > > > * Add VHOST_FILE_UNBIND kick and call fd treatment.
> > > > > > > * Make SVQ a public struct
> > > > > > > * Come back to previous approach to iova-tree
> > > > > > > * Some assertions are now fail paths. Some errors are now log=
_guest.
> > > > > > > * Only mask _F_LOG feature at vdpa_set_features svq enable pa=
th.
> > > > > > > * Refactor some errors and messages. Add missing error unwind=
ings.
> > > > > > > * Add memory barrier at _F_NO_NOTIFY set.
> > > > > > > * Stop checking for features flags out of transport range.
> > > > > > > v1 link:
> > > > > > > https://lore.kernel.org/virtualization/7d86c715-6d71-8a27-91f=
5-8d47b71e3201@redhat.com/
> > > > > > >
> > > > > > > Changes from v4 RFC:
> > > > > > > * Support of allocating / freeing iova ranges in IOVA tree. E=
xtending
> > > > > > >    already present iova-tree for that.
> > > > > > > * Proper validation of guest features. Now SVQ can negotiate =
a
> > > > > > >    different set of features with the device when enabled.
> > > > > > > * Support of host notifiers memory regions
> > > > > > > * Handling of SVQ full queue in case guest's descriptors span=
 to
> > > > > > >    different memory regions (qemu's VA chunks).
> > > > > > > * Flush pending used buffers at end of SVQ operation.
> > > > > > > * QMP command now looks by NetClientState name. Other devices=
 will need
> > > > > > >    to implement it's way to enable vdpa.
> > > > > > > * Rename QMP command to set, so it looks more like a way of w=
orking
> > > > > > > * Better use of qemu error system
> > > > > > > * Make a few assertions proper error-handling paths.
> > > > > > > * Add more documentation
> > > > > > > * Less coupling of virtio / vhost, that could cause friction =
on changes
> > > > > > > * Addressed many other small comments and small fixes.
> > > > > > >
> > > > > > > Changes from v3 RFC:
> > > > > > >    * Move everything to vhost-vdpa backend. A big change, thi=
s allowed
> > > > > > >      some cleanup but more code has been added in other place=
s.
> > > > > > >    * More use of glib utilities, especially to manage memory.
> > > > > > > v3 link:
> > > > > > > https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg0=
6032.html
> > > > > > >
> > > > > > > Changes from v2 RFC:
> > > > > > >    * Adding vhost-vdpa devices support
> > > > > > >    * Fixed some memory leaks pointed by different comments
> > > > > > > v2 link:
> > > > > > > https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg0=
5600.html
> > > > > > >
> > > > > > > Changes from v1 RFC:
> > > > > > >    * Use QMP instead of migration to start SVQ mode.
> > > > > > >    * Only accepting IOMMU devices, closer behavior with targe=
t devices
> > > > > > >      (vDPA)
> > > > > > >    * Fix invalid masking/unmasking of vhost call fd.
> > > > > > >    * Use of proper methods for synchronization.
> > > > > > >    * No need to modify VirtIO device code, all of the changes=
 are
> > > > > > >      contained in vhost code.
> > > > > > >    * Delete superfluous code.
> > > > > > >    * An intermediate RFC was sent with only the notifications=
 forwarding
> > > > > > >      changes. It can be seen in
> > > > > > >      https://patchew.org/QEMU/20210129205415.876290-1-eperezm=
a@redhat.com/
> > > > > > > v1 link:
> > > > > > > https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg0537=
2.html
> > > > > > >
> > > > > > > Eugenio P=C3=A9rez (20):
> > > > > > >        virtio: Add VIRTIO_F_QUEUE_STATE
> > > > > > >        virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED
> > > > > > >        virtio: Add virtio_queue_is_host_notifier_enabled
> > > > > > >        vhost: Make vhost_virtqueue_{start,stop} public
> > > > > > >        vhost: Add x-vhost-enable-shadow-vq qmp
> > > > > > >        vhost: Add VhostShadowVirtqueue
> > > > > > >        vdpa: Register vdpa devices in a list
> > > > > > >        vhost: Route guest->host notification through shadow v=
irtqueue
> > > > > > >        Add vhost_svq_get_svq_call_notifier
> > > > > > >        Add vhost_svq_set_guest_call_notifier
> > > > > > >        vdpa: Save call_fd in vhost-vdpa
> > > > > > >        vhost-vdpa: Take into account SVQ in vhost_vdpa_set_vr=
ing_call
> > > > > > >        vhost: Route host->guest notification through shadow v=
irtqueue
> > > > > > >        virtio: Add vhost_shadow_vq_get_vring_addr
> > > > > > >        vdpa: Save host and guest features
> > > > > > >        vhost: Add vhost_svq_valid_device_features to shadow v=
q
> > > > > > >        vhost: Shadow virtqueue buffers forwarding
> > > > > > >        vhost: Add VhostIOVATree
> > > > > > >        vhost: Use a tree to store memory mappings
> > > > > > >        vdpa: Add custom IOTLB translations to SVQ
> > > > > > >
> > > > > > > Eugenio P=C3=A9rez (15):
> > > > > > >    vhost: Add VhostShadowVirtqueue
> > > > > > >    vhost: Add Shadow VirtQueue kick forwarding capabilities
> > > > > > >    vhost: Add Shadow VirtQueue call forwarding capabilities
> > > > > > >    vhost: Add vhost_svq_valid_features to shadow vq
> > > > > > >    virtio: Add vhost_svq_get_vring_addr
> > > > > > >    vdpa: adapt vhost_ops callbacks to svq
> > > > > > >    vhost: Shadow virtqueue buffers forwarding
> > > > > > >    util: Add iova_tree_alloc_map
> > > > > > >    util: add iova_tree_find_iova
> > > > > > >    vhost: Add VhostIOVATree
> > > > > > >    vdpa: Add custom IOTLB translations to SVQ
> > > > > > >    vdpa: Adapt vhost_vdpa_get_vring_base to SVQ
> > > > > > >    vdpa: Never set log_base addr if SVQ is enabled
> > > > > > >    vdpa: Expose VHOST_F_LOG_ALL on SVQ
> > > > > > >    vdpa: Add x-svq to NetdevVhostVDPAOptions
> > > > > > >
> > > > > > >   qapi/net.json                      |   8 +-
> > > > > > >   hw/virtio/vhost-iova-tree.h        |  27 ++
> > > > > > >   hw/virtio/vhost-shadow-virtqueue.h |  87 ++++
> > > > > > >   include/hw/virtio/vhost-vdpa.h     |   8 +
> > > > > > >   include/qemu/iova-tree.h           |  38 +-
> > > > > > >   hw/virtio/vhost-iova-tree.c        | 110 +++++
> > > > > > >   hw/virtio/vhost-shadow-virtqueue.c | 637 ++++++++++++++++++=
+++++++++++
> > > > > > >   hw/virtio/vhost-vdpa.c             | 525 ++++++++++++++++++=
+++++-
> > > > > > >   net/vhost-vdpa.c                   |  48 ++-
> > > > > > >   util/iova-tree.c                   | 169 ++++++++
> > > > > > >   hw/virtio/meson.build              |   2 +-
> > > > > > >   11 files changed, 1633 insertions(+), 26 deletions(-)
> > > > > > >   create mode 100644 hw/virtio/vhost-iova-tree.h
> > > > > > >   create mode 100644 hw/virtio/vhost-shadow-virtqueue.h
> > > > > > >   create mode 100644 hw/virtio/vhost-iova-tree.c
> > > > > > >   create mode 100644 hw/virtio/vhost-shadow-virtqueue.c
> > > > > > >
> > > > >
> > >
>


