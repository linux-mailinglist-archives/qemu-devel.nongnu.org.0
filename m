Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E8547115D
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 05:14:34 +0100 (CET)
Received: from localhost ([::1]:47996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvtmL-0008U8-HK
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 23:14:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mvtj7-0004H4-DG
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 23:11:13 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:4115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mvtj3-0008SX-V8
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 23:11:13 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4J9vSc2th9z91ZS;
 Sat, 11 Dec 2021 12:10:24 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 11 Dec 2021 12:11:05 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 11 Dec 2021 12:11:04 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.020;
 Sat, 11 Dec 2021 12:11:04 +0800
To: Stefano Garzarella <sgarzare@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>, "parav@nvidia.com"
 <parav@nvidia.com>, "xieyongji@bytedance.com" <xieyongji@bytedance.com>,
 Yechuan <yechuan@huawei.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
Thread-Topic: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
Thread-Index: AQHX6/NI4OLDAFxcVEG4PKqEpvh1aqwpXQUAgABvUACAAuXO8A==
Date: Sat, 11 Dec 2021 04:11:04 +0000
Message-ID: <9615545c46e54943b40e730a3535d550@huawei.com>
References: <20211208052010.1719-1-longpeng2@huawei.com>
 <YbHJivhCDvKo4eB0@stefanha-x1.localdomain>
 <20211209155522.ysgig3bshwtykoxr@steredhat>
In-Reply-To: <20211209155522.ysgig3bshwtykoxr@steredhat>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.148.223]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
From: longpeng2--- via <qemu-devel@nongnu.org>



> -----Original Message-----
> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> Sent: Thursday, December 9, 2021 11:55 PM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>; jasowang@redhat.com; mst@redha=
t.com;
> parav@nvidia.com; xieyongji@bytedance.com; Yechuan <yechuan@huawei.com>;
> Gonglei (Arei) <arei.gonglei@huawei.com>; qemu-devel@nongnu.org
> Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
>=20
> On Thu, Dec 09, 2021 at 09:16:58AM +0000, Stefan Hajnoczi wrote:
> >On Wed, Dec 08, 2021 at 01:20:10PM +0800, Longpeng(Mike) wrote:
> >> From: Longpeng <longpeng2@huawei.com>
> >>
> >> Hi guys,
> >>
> >> This patch introduces vhost-vdpa-net device, which is inspired
> >> by vhost-user-blk and the proposal of vhost-vdpa-blk device [1].
> >>
> >> I've tested this patch on Huawei's offload card:
> >> ./x86_64-softmmu/qemu-system-x86_64 \
> >>     -device vhost-vdpa-net-pci,vdpa-dev=3D/dev/vhost-vdpa-0
> >>
> >> For virtio hardware offloading, the most important requirement for us
> >> is to support live migration between offloading cards from different
> >> vendors, the combination of netdev and virtio-net seems too heavy, we
> >> prefer a lightweight way.
> >>
> >> Maybe we could support both in the future ? Such as:
> >>
> >> * Lightweight
> >>  Net: vhost-vdpa-net
> >>  Storage: vhost-vdpa-blk
> >>
> >> * Heavy but more powerful
> >>  Net: netdev + virtio-net + vhost-vdpa
> >>  Storage: bdrv + virtio-blk + vhost-vdpa
> >>
> >> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html
> >
> >Stefano presented a plan for vdpa-blk at KVM Forum 2021:
> >https://kvmforum2021.sched.com/event/ke3a/vdpa-blk-unified-hardware-and-=
so
> ftware-offload-for-virtio-blk-stefano-garzarella-red-hat
> >
> >It's closer to today's virtio-net + vhost-net approach than the
> >vhost-vdpa-blk device you have mentioned. The idea is to treat vDPA as
> >an offload feature rather than a completely separate code path that
> >needs to be maintained and tested. That way QEMU's block layer features
> >and live migration work with vDPA devices and re-use the virtio-blk
> >code. The key functionality that has not been implemented yet is a "fast
> >path" mechanism that allows the QEMU virtio-blk device's virtqueue to be
> >offloaded to vDPA.
> >
> >The unified vdpa-blk architecture should deliver the same performance
> >as the vhost-vdpa-blk device you mentioned but with more features, so I
> >wonder what aspects of the vhost-vdpa-blk idea are important to you?
> >
> >QEMU already has vhost-user-blk, which takes a similar approach as the
> >vhost-vdpa-blk device you are proposing. I'm not against the
> >vhost-vdpa-blk approach in priciple, but would like to understand your
> >requirements and see if there is a way to collaborate on one vdpa-blk
> >implementation instead of dividing our efforts between two.
>=20
> Waiting for the aspects that Stefan asked, I add some details about the
> plan for vdpa-blk.
>=20
> Currently I'm working on the in-kernel software device. In the next
> months I hope to start working on the QEMU part. Anyway that part could
> go in parallel with the in-kernel device, so if you are interested we
> can collaborate.
>=20

The work on QEMU part means supporting the vdpa in BlockDriver and virtio-b=
lk?

In fact, I wanted to support the vdpa in QEMU block layer before I sent thi=
s
RFC, because the net part uses netdev + virtio-net while the storage part u=
ses
vhost-vdpa-blk (from Yongji) looks like a strange combination.

But I found enable vdpa in QEMU block layer would take more time and some
features (e.g. snapshot, IO throttling) from the QEMU block layer are not n=
eeded
in our hardware offloading case, so I turned to develop the "vhost-vdpa-net=
",
maybe the combination of vhost-vdpa-net and vhost-vdpa-blk is congruous.

> Having only the unified vdpa-blk architecture would allow us to simplify
> the management layers and avoid duplicate code, but it takes more time
> to develop compared to vhost-vdpa-blk. So if vdpa-blk support in QEMU is
> urgent, I could understand the need to add vhost-vdpa-blk now.
>=20

I prefer a way that can support vdpa devices (not only net and storage, but=
 also
other device types) quickly in hardware offloading case, maybe it would dec=
reases
the universalism, but it could be an alternative to some users.

> Let me know if you want more details about the unified vdpa-blk
> architecture.
>=20
> Thanks,
> Stefano


