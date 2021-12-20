Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2611847B1BA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:59:07 +0100 (CET)
Received: from localhost ([::1]:56132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzM0A-0008Ho-6s
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:59:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mzKPR-000123-Bp
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:17:05 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:3251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mzKP9-0004S4-5V
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:16:59 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4JHYnQ55WBz1DJdY;
 Mon, 20 Dec 2021 17:14:34 +0800 (CST)
Received: from dggpemm100005.china.huawei.com (7.185.36.231) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 20 Dec 2021 17:17:40 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpemm100005.china.huawei.com (7.185.36.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 20 Dec 2021 17:17:40 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.020;
 Mon, 20 Dec 2021 17:17:40 +0800
To: Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, "parav@nvidia.com"
 <parav@nvidia.com>, "xieyongji@bytedance.com" <xieyongji@bytedance.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>, Yechuan <yechuan@huawei.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: RE: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
Thread-Topic: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
Thread-Index: AQHX6/NI4OLDAFxcVEG4PKqEpvh1aqwpXQUAgANBElCAAXmTAIABIboAgADQxYCAALrTgIAAtTYAgADsi4CAAHJigIABG1wAgABnHgCAAUMGgIAARYmAgARV4ICAAFpOAIAAlS6Q
Date: Mon, 20 Dec 2021 09:17:40 +0000
Message-ID: <b066c3eb043a45619081bcd16c5f36d1@huawei.com>
References: <YbdjRRcfrNjHjfko@stefanha-x1.localdomain>
 <CACGkMEt9UF2eVB6692aGoKBD2v0zPwopZG1jaG_O=mg3-cwwSA@mail.gmail.com>
 <YbiYAKIkLAgosXEH@stefanha-x1.localdomain>
 <CACGkMEsZfgDriSx1e=JOU4E8QyB5KoU+i2M2F8N12BrMbu5suQ@mail.gmail.com>
 <Ybm+YVQS1l73nnuU@stefanha-x1.localdomain>
 <CACGkMEtqujKwU=3P1VQ-PgAQPvzrpAf_huVzVZHAi11vyn8xPA@mail.gmail.com>
 <YbsClFXLq3kz7tJS@stefanha-x1.localdomain>
 <CACGkMEtwHj-y9nVvtszOYKYd1ohd-cdNe8xry-rYkD1Jk9U4Ow@mail.gmail.com>
 <YbxL4avaEZBSFz3B@stefanha-x1.localdomain>
 <CACGkMEtFLoLtVSyYiQzjgMU5LN0-K8LMk4pR43cOxHz2jw+H=A@mail.gmail.com>
 <YcA6qqao9jInSdOY@stefanha-x1.localdomain>
In-Reply-To: <YcA6qqao9jInSdOY@stefanha-x1.localdomain>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.148.223]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255; envelope-from=longpeng2@huawei.com;
 helo=szxga08-in.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> From: Stefan Hajnoczi [mailto:stefanha@redhat.com]
> Sent: Monday, December 20, 2021 4:11 PM
> To: Jason Wang <jasowang@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>; Longpeng (Mike, Cloud Infrastruc=
ture
> Service Product Dept.) <longpeng2@huawei.com>; parav@nvidia.com;
> xieyongji@bytedance.com; sgarzare@redhat.com; Yechuan <yechuan@huawei.com=
>;
> Gonglei (Arei) <arei.gonglei@huawei.com>; qemu-devel@nongnu.org; Dr. Davi=
d
> Alan Gilbert <dgilbert@redhat.com>
> Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
>=20
> On Mon, Dec 20, 2021 at 10:48:09AM +0800, Jason Wang wrote:
> > On Fri, Dec 17, 2021 at 4:35 PM Stefan Hajnoczi <stefanha@redhat.com> w=
rote:
> > >
> > > On Fri, Dec 17, 2021 at 12:26:53PM +0800, Jason Wang wrote:
> > >
> > > Dave: You created the VIRTIO vmstate infrastructure in QEMU. Please s=
ee
> > > the bottom of this email about moving to a standard VIRTIO device
> > > save/load format defined by the VIRTIO spec in the future.
> > >
> > > > On Thu, Dec 16, 2021 at 5:10 PM Stefan Hajnoczi <stefanha@redhat.co=
m> wrote:
> > > > >
> > > > > On Thu, Dec 16, 2021 at 11:01:40AM +0800, Jason Wang wrote:
> > > > > > On Wed, Dec 15, 2021 at 6:07 PM Stefan Hajnoczi <stefanha@redha=
t.com>
> wrote:
> > > > > > >
> > > > > > > On Wed, Dec 15, 2021 at 11:18:05AM +0800, Jason Wang wrote:
> > > > > > > > On Tue, Dec 14, 2021 at 9:11 PM Stefan Hajnoczi <stefanha@r=
edhat.com>
> wrote:
> > > > > > > > >
> > > > > > > > > On Tue, Dec 14, 2021 at 10:22:53AM +0800, Jason Wang wrot=
e:
> > > > > > > > > > On Mon, Dec 13, 2021 at 11:14 PM Stefan Hajnoczi
> <stefanha@redhat.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Mon, Dec 13, 2021 at 10:47:00AM +0800, Jason Wang =
wrote:
> > > > > > > > > > > > On Sun, Dec 12, 2021 at 5:30 PM Michael S. Tsirkin =
<mst@redhat.com>
> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Sat, Dec 11, 2021 at 03:00:27AM +0000, Longpen=
g (Mike,
> Cloud Infrastructure Service Product Dept.) wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > > > > > From: Stefan Hajnoczi [mailto:stefanha@redhat=
.com]
> > > > > > > > > > > > > > > Sent: Thursday, December 9, 2021 5:17 PM
> > > > > > > > > > > > > > > To: Longpeng (Mike, Cloud Infrastructure Serv=
ice
> Product Dept.)
> > > > > > > > > > > > > > > <longpeng2@huawei.com>
> > > > > > > > > > > > > > > Cc: jasowang@redhat.com; mst@redhat.com;
> parav@nvidia.com;
> > > > > > > > > > > > > > > xieyongji@bytedance.com; sgarzare@redhat.com;=
 Yechuan
> <yechuan@huawei.com>;
> > > > > > > > > > > > > > > Gonglei (Arei) <arei.gonglei@huawei.com>;
> qemu-devel@nongnu.org
> > > > > > > > > > > > > > > Subject: Re: [RFC] vhost-vdpa-net: add vhost-=
vdpa-net
> host device support
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > On Wed, Dec 08, 2021 at 01:20:10PM +0800, Lon=
gpeng(Mike)
> wrote:
> > > > > > > > > > > > > > > > From: Longpeng <longpeng2@huawei.com>
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Hi guys,
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > This patch introduces vhost-vdpa-net device=
, which
> is inspired
> > > > > > > > > > > > > > > > by vhost-user-blk and the proposal of vhost=
-vdpa-blk
> device [1].
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > I've tested this patch on Huawei's offload =
card:
> > > > > > > > > > > > > > > > ./x86_64-softmmu/qemu-system-x86_64 \
> > > > > > > > > > > > > > > >     -device
> vhost-vdpa-net-pci,vdpa-dev=3D/dev/vhost-vdpa-0
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > For virtio hardware offloading, the most im=
portant
> requirement for us
> > > > > > > > > > > > > > > > is to support live migration between offloa=
ding
> cards from different
> > > > > > > > > > > > > > > > vendors, the combination of netdev and virt=
io-net
> seems too heavy, we
> > > > > > > > > > > > > > > > prefer a lightweight way.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Maybe we could support both in the future ?=
 Such
> as:
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > * Lightweight
> > > > > > > > > > > > > > > >  Net: vhost-vdpa-net
> > > > > > > > > > > > > > > >  Storage: vhost-vdpa-blk
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > * Heavy but more powerful
> > > > > > > > > > > > > > > >  Net: netdev + virtio-net + vhost-vdpa
> > > > > > > > > > > > > > > >  Storage: bdrv + virtio-blk + vhost-vdpa
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > [1]
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Stefano presented a plan for vdpa-blk at KVM =
Forum
> 2021:
> > > > > > > > > > > > > > >
> https://kvmforum2021.sched.com/event/ke3a/vdpa-blk-unified-hardware-and-s=
of
> > > > > > > > > > > > > > > tware-offload-for-virtio-blk-stefano-garzarel=
la-red-hat
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > It's closer to today's virtio-net + vhost-net=
 approach
> than the
> > > > > > > > > > > > > > > vhost-vdpa-blk device you have mentioned. The=
 idea
> is to treat vDPA as
> > > > > > > > > > > > > > > an offload feature rather than a completely s=
eparate
> code path that
> > > > > > > > > > > > > > > needs to be maintained and tested. That way Q=
EMU's
> block layer features
> > > > > > > > > > > > > > > and live migration work with vDPA devices and=
 re-use
> the virtio-blk
> > > > > > > > > > > > > > > code. The key functionality that has not been=
 implemented
> yet is a "fast
> > > > > > > > > > > > > > > path" mechanism that allows the QEMU virtio-b=
lk device's
> virtqueue to be
> > > > > > > > > > > > > > > offloaded to vDPA.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > The unified vdpa-blk architecture should deli=
ver
> the same performance
> > > > > > > > > > > > > > > as the vhost-vdpa-blk device you mentioned bu=
t with
> more features, so I
> > > > > > > > > > > > > > > wonder what aspects of the vhost-vdpa-blk ide=
a are
> important to you?
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > QEMU already has vhost-user-blk, which takes =
a similar
> approach as the
> > > > > > > > > > > > > > > vhost-vdpa-blk device you are proposing. I'm =
not
> against the
> > > > > > > > > > > > > > > vhost-vdpa-blk approach in priciple, but woul=
d like
> to understand your
> > > > > > > > > > > > > > > requirements and see if there is a way to col=
laborate
> on one vdpa-blk
> > > > > > > > > > > > > > > implementation instead of dividing our effort=
s between
> two.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > We prefer a simple way in the virtio hardware o=
ffloading
> case, it could reduce
> > > > > > > > > > > > > > our maintenance workload, we no need to maintai=
n the
> virtio-net, netdev,
> > > > > > > > > > > > > > virtio-blk, bdrv and ... any more. If we need t=
o support
> other vdpa devices
> > > > > > > > > > > > > > (such as virtio-crypto, virtio-fs) in the futur=
e, then
> we also need to maintain
> > > > > > > > > > > > > > the corresponding device emulation code?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > For the virtio hardware offloading case, we usu=
ally
> use the vfio-pci framework,
> > > > > > > > > > > > > > it saves a lot of our maintenance work in QEMU,=
 we
> don't need to touch the device
> > > > > > > > > > > > > > types. Inspired by Jason, what we really prefer=
 is
> "vhost-vdpa-pci/mmio", use it to
> > > > > > > > > > > > > > instead of the vfio-pci, it could provide the s=
ame
> performance as vfio-pci, but it's
> > > > > > > > > > > > > > *possible* to support live migrate between offl=
oading
> cards from different vendors.
> > > > > > > > > > > > >
> > > > > > > > > > > > > OK, so the features you are dropping would be mig=
ration
> between
> > > > > > > > > > > > > a vdpa, vhost and virtio backends. I think given =
vhost-vdpa-blk
> is seems
> > > > > > > > > > > > > fair enough... What do others think?
> > > > > > > > > > > >
> > > > > > > > > > > > I think it should be fine, and it would be even bet=
ter
> to make it not
> > > > > > > > > > > > specific to device type.
> > > > > > > > > > >
> > > > > > > > > > > That's an interesting idea. A generic vDPA VirtIODevi=
ce could
> exposed as
> > > > > > > > > > >
> > > > > > > > > > >   --device vhost-vdpa-pci,
> > > > > > > > > > >            [vhostfd=3DFD,|
> > > > > > > > > > >             vhostpath=3D/dev/vhost-vdpa-N]
> > > > > > > > > > >
> > > > > > > > > > > (and for virtio-mmio and virtio-ccw too).
> > > > > > > > > > >
> > > > > > > > > > > I don't think this is possible yet because the vhost_=
vdpa
> ioctls are
> > > > > > > > > > > missing some introspection functionality. Here is wha=
t I
> found:
> > > > > > > > > > > - Device ID: ok, use VHOST_VDPA_GET_DEVICE_ID
> > > > > > > > > > > - Device feature bits: ok, use VHOST_GET_BACKEND_FEAT=
URES
> > > > > > > > > > > - Configuration space size: missing, need ioctl for
> ops->get_config_size()
> > > > > > > > > >
> > > > > > > > > > Any specific reason that we need this considering we've=
 already
> had
> > > > > > > > > > VHOST_VDPA_GET_CONFIG and we do the size validation the=
re?
> > > > > > > > >
> > > > > > > > > QEMU's virtio_init() takes a size_t config_size argument.=
 We
> need to
> > > > > > > > > determine the size of the vhost_vdpa's configuration spac=
e in
> order to
> > > > > > > > > create the VirtIODevice in QEMU.
> > > > > > > > >
> > > > > > > > > Do you mean probing by checking for the VHOST_VDPA_GET_CO=
NFIG
> -E2BIG
> > > > > > > > > return value? It's hacky but I guess it's possible to do =
a binary
> search
> > > > > > > > > that calls VHOST_VDPA_GET_CONFIG each iteration and reduc=
es the
> size if
> > > > > > > > > -E2BIG is returned or increases the size otherwise.
> > > > > > > > >
> > > > > > > > > Or do you mean re-writing QEMU's hw/virtio/virtio.c to al=
low
> the
> > > > > > > > > VirtIODevice to override the size and we pass accesses th=
rough
> to
> > > > > > > > > vhost_vdpa. That way it might be possible to avoid fetchi=
ng the
> > > > > > > > > configuration space size at startup, but I'm not sure thi=
s will
> work
> > > > > > > > > because QEMU might depend on knowing the exact size (e.g.=
 live
> > > > > > > > > migration).
> > > > > > > >
> > > > > > > > Good point, so looking at virtio-blk it has:
> > > > > > > >
> > > > > > > >     virtio_blk_set_config_size(s, s->host_features);
> > > > > > > >     virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK,
> s->config_size);
> > > > > > > >
> > > > > > > > I think here virtio-blk/net should check the vhost-vdpa fea=
tures
> here
> > > > > > > > and fail if they are not the same?
> > > > > > >
> > > > > > > The vhost feature bit code in QEMU is complicated and I can't=
 respond
> > > > > > > without investing too much time studying it :).
> > > > > > >
> > > > > > > > This looks better than overriding the config_size with what=
 vhost-vdpa
> > > > > > > > provides since it can override the features that the cli tr=
ies
> to
> > > > > > > > enable.
> > > > > > >
> > > > > > > I'm thinking about the generic --device vhost-vdpa idea. QEMU=
 should
> not
> > > > > > > require knowledge of the device feature bits in that case, so=
 it
> cannot
> > > > > > > calculate the configuration space size.
> > > > > >
> > > > > > In this case, it looks to me the config size could be deduced f=
rom
> > > > > > VHOST_VDPA_GET_FEATURES?
> > > > >
> > > > > I think we're talking about different things, see below...
> > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > > > - Max virtqueue size: ok, VHOST_VDPA_GET_VRING_NUM
> > > > > > > > > > > - Number of virtqueues: probe using VHOST_GET_VRING_B=
ASE?
> > > > > > > > > >
> > > > > > > > > > I'm not sure whether or not we need this and it seems n=
ot necessary
> > > > > > > > > > since it can be deduced from the config space and featu=
res.
> > > > > > > > >
> > > > > > > > > It can only be deduced in a device-specific way (net, blk=
, etc).
> I can't
> > > > > > > > > think of a way to detect the number of virtqueues for an =
arbitrary
> > > > > > > > > VIRTIO device from the features bits and configuration sp=
ace
> contents.
> > > > > > > >
> > > > > > > > Yes, I'm not against this idea but it looks to me it works =
even
> without this.
> > > > > > > >
> > > > > > > > Modern PCI has num_queues but we don't have things like thi=
s in
> MMIO
> > > > > > > > and legacy PCI.
> > > > > > >
> > > > > > > Even if the VIRTIO hardware interface doesn't expose this inf=
ormation
> to
> > > > > > > the guest, QEMU's VirtIODevice API needs it. Device emulation=
 code
> must
> > > > > > > call virtio_add_queue() to expose virtqueues to the guest.
> > > > > >
> > > > > > We don't need this for current multiqueue virtio-net with vhost=
-vdpa
> > > > > > since the queue num were deduced from the VHOST_VDPA_GET_CONFIG=
 during
> > > > > > the initialization of vhost-vdpa backend.
> > > > > >
> > > > > > If we are talking about generic vhost-vdpa-pci, we don't need
> > > > > > virtio_add_queue() in this case.
> > > > >
> > > > > When I say --device vhost-vdpa I mean a VirtIODevice in QEMU that=
 takes
> > > > > any /dev/vhost-vdpa-N and exposes the device to the guest (over
> > > > > virtio-pci, virtio-mmio, or virtio-ccw). It's generic because it =
has
> no
> > > > > knowledge of specific device types. This means new device types c=
an be
> > > > > added without modifying QEMU.
> > > > >
> > > > > I think the model you are describing is not generic because it re=
lies
> on
> > > > > knowledge of specific device types (net, blk, scsi, etc) so it ca=
n
> > > > > interpret feature bits and configuration space fields.
> > > >
> > > > Yes, but what I meant is that in this case qemu can simply relay th=
e
> > > > set/get config to vhost-vdpa. And the guest driver can enumerate th=
e
> > > > number of queues correctly depending on his own knowledge.
> > >
> > > That requires changes to how virtqueues are managed by
> > > hw/virtio/virtio.c because today the code assumes QEMU knows the numb=
er
> > > of virtqueues. virtio_add_queue() must be called by device emulation
> > > before the guest driver can configure a virtqueue.
> >
> > Right.
> >
> > >
> > > > >
> > > > > When you originally said "it would be even better to make it not
> > > > > specific to device type" I thought you meant a generic --device
> > > > > vhost-vdpa and that's what I've been describing, but in your rece=
nt
> > > > > replies I guess you have a different model in mind.
> > > > >
> > > > > Are there reasons why the generic model won't work?
> > > >
> > > > I think not.
> > > >
> > > > One thing comes to my mind is that since we provide num_queues via
> > > > modern virtio-pci, this is probably another call for having the API
> > > > you described.
> > > >
> > > > For the general vhost-vdpa backend, the only thing that may block u=
s
> > > > is the migration. If we want to make vhost-vdpa type independent, w=
e
> > > > need first investigate the independent migration facility in virtio
> > > > spec which is still suspicious.
> > >
> > > Yes, definitely.
> > >
> > > Another challenge with migration is that the generic vhost-vdpa vmsta=
te
> > > probably won't be compatible with QEMU's virtio-net/blk/scsi/etc
> > > vmstates. It would be nice if it was possible to migrate between QEMU
> > > and vDPA device models since they both implement the same device type=
s.
> > >
> > > Maybe the solution is for QEMU's virtio device models to switch to th=
e
> > > new VIRTIO save/load data format once that has been defined in the sp=
ec.
> > > Then the QEMU VirtIODevice vmstate would be:
> > > 1. QEMU-specific VirtIODevice state (virtqueue state, etc)
> > > 2. VIRTIO standard device save/load data (virtio-net mac table, etc)
> >
> > Right. The question is that do we expect the exact byte stream format
> > defined in the spec? It looks to me it's sufficient to define each
> > state that is required for the live migration and leave the byte
> > stream format to be implementation specific. If we manage to do this,
> > there's still a chance that we can live migration between those two.
>=20
> Yes. I think the pros/cons of translation are better compatibility but
> more complex code. Not sure if maintaining a QEMU-specific save/load
> format in addition to the standard VIRTIO format is desirable in the
> long term.
>=20
> > >
> > > It's still not clear to me how much of the VIRTIO device save/load da=
ta
> > > is implementation-specific. I think the next step forward is to revie=
w
> > > the QEMU vmstates for virtio-net, virtio-gpu, etc to figure out wheth=
er
> > > we can really standardize the save/load data.
> >
> > Yes, and it should not be hard to have a general load and save based
> > on key/value pairs which could be defined in the spec. Ideally, it
> > should be more than enough to enumerate the keys based on the
> > negotiated features. (But as discussed, virtio-fs and other stateful
> > devices seem more complicated and a lot of spec work seems like a
> > requirement before support this).
>=20
> Great, I'm glad we had a chance to discuss this. It has helped me
> understand the direction things are heading in.
>=20
> Migration isn't a dependency for what Longpeng is doing in this patch
> series. The generic --device vdpa-vhost can already be implemented today
> without live migration support. Adding the vhost_vdpa ioctls we
> discussed would be nice although it seems possible (but hacky) for QEMU
> to probe using existing ioctls too.
>=20
> Longpeng: Do you want to generalize this patch into a --device vdpa-host
> that supports all device types?
>=20

Yes, I already told Jason that I'll start to develop the device next week :=
)

> Stefan

