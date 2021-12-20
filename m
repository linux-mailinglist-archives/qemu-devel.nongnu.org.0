Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671B247B28B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 19:05:00 +0100 (CET)
Received: from localhost ([::1]:38494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzN1u-0003Yu-UI
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 13:04:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mzKjN-0003yS-G8
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:37:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mzKjJ-0006oF-Gx
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:37:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640014656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wvJq5n6t+FcXOOH1f2PsvHA9nQ2pyvLzGHeePpBRp0c=;
 b=J4/rEuNe5CSPY/SyUnepm8h6NyvTiZtdIWkG1P9I7CHP9ODafp6cyo2vAkg9LDZRv5VnxK
 aY3HqcLyp6dGxP3IwCEJEnVULUKXN7dio0hzToBifJeog4V3roCba6B+FP1XxRTp3JT7BW
 ynnrYWHLd4/it0I1u1jPh3j2KuXsAbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-sDcxeV9eNS6TjTLdyQtTjQ-1; Mon, 20 Dec 2021 03:11:34 -0500
X-MC-Unique: sDcxeV9eNS6TjTLdyQtTjQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91A7F64143;
 Mon, 20 Dec 2021 08:11:32 +0000 (UTC)
Received: from localhost (unknown [10.39.192.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 060A54BC5E;
 Mon, 20 Dec 2021 08:11:23 +0000 (UTC)
Date: Mon, 20 Dec 2021 08:11:22 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
Message-ID: <YcA6qqao9jInSdOY@stefanha-x1.localdomain>
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
MIME-Version: 1.0
In-Reply-To: <CACGkMEtFLoLtVSyYiQzjgMU5LN0-K8LMk4pR43cOxHz2jw+H=A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="i7jne/XIr+K4Va84"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Yechuan <yechuan@huawei.com>,
 "xieyongji@bytedance.com" <xieyongji@bytedance.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "parav@nvidia.com" <parav@nvidia.com>, "Longpeng \(Mike,
 Cloud Infrastructure Service Product Dept.\)" <longpeng2@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--i7jne/XIr+K4Va84
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 20, 2021 at 10:48:09AM +0800, Jason Wang wrote:
> On Fri, Dec 17, 2021 at 4:35 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >
> > On Fri, Dec 17, 2021 at 12:26:53PM +0800, Jason Wang wrote:
> >
> > Dave: You created the VIRTIO vmstate infrastructure in QEMU. Please see
> > the bottom of this email about moving to a standard VIRTIO device
> > save/load format defined by the VIRTIO spec in the future.
> >
> > > On Thu, Dec 16, 2021 at 5:10 PM Stefan Hajnoczi <stefanha@redhat.com>=
 wrote:
> > > >
> > > > On Thu, Dec 16, 2021 at 11:01:40AM +0800, Jason Wang wrote:
> > > > > On Wed, Dec 15, 2021 at 6:07 PM Stefan Hajnoczi <stefanha@redhat.=
com> wrote:
> > > > > >
> > > > > > On Wed, Dec 15, 2021 at 11:18:05AM +0800, Jason Wang wrote:
> > > > > > > On Tue, Dec 14, 2021 at 9:11 PM Stefan Hajnoczi <stefanha@red=
hat.com> wrote:
> > > > > > > >
> > > > > > > > On Tue, Dec 14, 2021 at 10:22:53AM +0800, Jason Wang wrote:
> > > > > > > > > On Mon, Dec 13, 2021 at 11:14 PM Stefan Hajnoczi <stefanh=
a@redhat.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Mon, Dec 13, 2021 at 10:47:00AM +0800, Jason Wang wr=
ote:
> > > > > > > > > > > On Sun, Dec 12, 2021 at 5:30 PM Michael S. Tsirkin <m=
st@redhat.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > On Sat, Dec 11, 2021 at 03:00:27AM +0000, Longpeng =
(Mike, Cloud Infrastructure Service Product Dept.) wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > > > > From: Stefan Hajnoczi [mailto:stefanha@redhat.c=
om]
> > > > > > > > > > > > > > Sent: Thursday, December 9, 2021 5:17 PM
> > > > > > > > > > > > > > To: Longpeng (Mike, Cloud Infrastructure Servic=
e Product Dept.)
> > > > > > > > > > > > > > <longpeng2@huawei.com>
> > > > > > > > > > > > > > Cc: jasowang@redhat.com; mst@redhat.com; parav@=
nvidia.com;
> > > > > > > > > > > > > > xieyongji@bytedance.com; sgarzare@redhat.com; Y=
echuan <yechuan@huawei.com>;
> > > > > > > > > > > > > > Gonglei (Arei) <arei.gonglei@huawei.com>; qemu-=
devel@nongnu.org
> > > > > > > > > > > > > > Subject: Re: [RFC] vhost-vdpa-net: add vhost-vd=
pa-net host device support
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On Wed, Dec 08, 2021 at 01:20:10PM +0800, Longp=
eng(Mike) wrote:
> > > > > > > > > > > > > > > From: Longpeng <longpeng2@huawei.com>
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Hi guys,
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > This patch introduces vhost-vdpa-net device, =
which is inspired
> > > > > > > > > > > > > > > by vhost-user-blk and the proposal of vhost-v=
dpa-blk device [1].
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > I've tested this patch on Huawei's offload ca=
rd:
> > > > > > > > > > > > > > > ./x86_64-softmmu/qemu-system-x86_64 \
> > > > > > > > > > > > > > >     -device vhost-vdpa-net-pci,vdpa-dev=3D/de=
v/vhost-vdpa-0
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > For virtio hardware offloading, the most impo=
rtant requirement for us
> > > > > > > > > > > > > > > is to support live migration between offloadi=
ng cards from different
> > > > > > > > > > > > > > > vendors, the combination of netdev and virtio=
-net seems too heavy, we
> > > > > > > > > > > > > > > prefer a lightweight way.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Maybe we could support both in the future ? S=
uch as:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > * Lightweight
> > > > > > > > > > > > > > >  Net: vhost-vdpa-net
> > > > > > > > > > > > > > >  Storage: vhost-vdpa-blk
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > * Heavy but more powerful
> > > > > > > > > > > > > > >  Net: netdev + virtio-net + vhost-vdpa
> > > > > > > > > > > > > > >  Storage: bdrv + virtio-blk + vhost-vdpa
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > [1] https://www.mail-archive.com/qemu-devel@n=
ongnu.org/msg797569.html
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Stefano presented a plan for vdpa-blk at KVM Fo=
rum 2021:
> > > > > > > > > > > > > > https://kvmforum2021.sched.com/event/ke3a/vdpa-=
blk-unified-hardware-and-sof
> > > > > > > > > > > > > > tware-offload-for-virtio-blk-stefano-garzarella=
-red-hat
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > It's closer to today's virtio-net + vhost-net a=
pproach than the
> > > > > > > > > > > > > > vhost-vdpa-blk device you have mentioned. The i=
dea is to treat vDPA as
> > > > > > > > > > > > > > an offload feature rather than a completely sep=
arate code path that
> > > > > > > > > > > > > > needs to be maintained and tested. That way QEM=
U's block layer features
> > > > > > > > > > > > > > and live migration work with vDPA devices and r=
e-use the virtio-blk
> > > > > > > > > > > > > > code. The key functionality that has not been i=
mplemented yet is a "fast
> > > > > > > > > > > > > > path" mechanism that allows the QEMU virtio-blk=
 device's virtqueue to be
> > > > > > > > > > > > > > offloaded to vDPA.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > The unified vdpa-blk architecture should delive=
r the same performance
> > > > > > > > > > > > > > as the vhost-vdpa-blk device you mentioned but =
with more features, so I
> > > > > > > > > > > > > > wonder what aspects of the vhost-vdpa-blk idea =
are important to you?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > QEMU already has vhost-user-blk, which takes a =
similar approach as the
> > > > > > > > > > > > > > vhost-vdpa-blk device you are proposing. I'm no=
t against the
> > > > > > > > > > > > > > vhost-vdpa-blk approach in priciple, but would =
like to understand your
> > > > > > > > > > > > > > requirements and see if there is a way to colla=
borate on one vdpa-blk
> > > > > > > > > > > > > > implementation instead of dividing our efforts =
between two.
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > We prefer a simple way in the virtio hardware off=
loading case, it could reduce
> > > > > > > > > > > > > our maintenance workload, we no need to maintain =
the virtio-net, netdev,
> > > > > > > > > > > > > virtio-blk, bdrv and ... any more. If we need to =
support other vdpa devices
> > > > > > > > > > > > > (such as virtio-crypto, virtio-fs) in the future,=
 then we also need to maintain
> > > > > > > > > > > > > the corresponding device emulation code?
> > > > > > > > > > > > >
> > > > > > > > > > > > > For the virtio hardware offloading case, we usual=
ly use the vfio-pci framework,
> > > > > > > > > > > > > it saves a lot of our maintenance work in QEMU, w=
e don't need to touch the device
> > > > > > > > > > > > > types. Inspired by Jason, what we really prefer i=
s "vhost-vdpa-pci/mmio", use it to
> > > > > > > > > > > > > instead of the vfio-pci, it could provide the sam=
e performance as vfio-pci, but it's
> > > > > > > > > > > > > *possible* to support live migrate between offloa=
ding cards from different vendors.
> > > > > > > > > > > >
> > > > > > > > > > > > OK, so the features you are dropping would be migra=
tion between
> > > > > > > > > > > > a vdpa, vhost and virtio backends. I think given vh=
ost-vdpa-blk is seems
> > > > > > > > > > > > fair enough... What do others think?
> > > > > > > > > > >
> > > > > > > > > > > I think it should be fine, and it would be even bette=
r to make it not
> > > > > > > > > > > specific to device type.
> > > > > > > > > >
> > > > > > > > > > That's an interesting idea. A generic vDPA VirtIODevice=
 could exposed as
> > > > > > > > > >
> > > > > > > > > >   --device vhost-vdpa-pci,
> > > > > > > > > >            [vhostfd=3DFD,|
> > > > > > > > > >             vhostpath=3D/dev/vhost-vdpa-N]
> > > > > > > > > >
> > > > > > > > > > (and for virtio-mmio and virtio-ccw too).
> > > > > > > > > >
> > > > > > > > > > I don't think this is possible yet because the vhost_vd=
pa ioctls are
> > > > > > > > > > missing some introspection functionality. Here is what =
I found:
> > > > > > > > > > - Device ID: ok, use VHOST_VDPA_GET_DEVICE_ID
> > > > > > > > > > - Device feature bits: ok, use VHOST_GET_BACKEND_FEATUR=
ES
> > > > > > > > > > - Configuration space size: missing, need ioctl for ops=
->get_config_size()
> > > > > > > > >
> > > > > > > > > Any specific reason that we need this considering we've a=
lready had
> > > > > > > > > VHOST_VDPA_GET_CONFIG and we do the size validation there=
?
> > > > > > > >
> > > > > > > > QEMU's virtio_init() takes a size_t config_size argument. W=
e need to
> > > > > > > > determine the size of the vhost_vdpa's configuration space =
in order to
> > > > > > > > create the VirtIODevice in QEMU.
> > > > > > > >
> > > > > > > > Do you mean probing by checking for the VHOST_VDPA_GET_CONF=
IG -E2BIG
> > > > > > > > return value? It's hacky but I guess it's possible to do a =
binary search
> > > > > > > > that calls VHOST_VDPA_GET_CONFIG each iteration and reduces=
 the size if
> > > > > > > > -E2BIG is returned or increases the size otherwise.
> > > > > > > >
> > > > > > > > Or do you mean re-writing QEMU's hw/virtio/virtio.c to allo=
w the
> > > > > > > > VirtIODevice to override the size and we pass accesses thro=
ugh to
> > > > > > > > vhost_vdpa. That way it might be possible to avoid fetching=
 the
> > > > > > > > configuration space size at startup, but I'm not sure this =
will work
> > > > > > > > because QEMU might depend on knowing the exact size (e.g. l=
ive
> > > > > > > > migration).
> > > > > > >
> > > > > > > Good point, so looking at virtio-blk it has:
> > > > > > >
> > > > > > >     virtio_blk_set_config_size(s, s->host_features);
> > > > > > >     virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK, s->confi=
g_size);
> > > > > > >
> > > > > > > I think here virtio-blk/net should check the vhost-vdpa featu=
res here
> > > > > > > and fail if they are not the same?
> > > > > >
> > > > > > The vhost feature bit code in QEMU is complicated and I can't r=
espond
> > > > > > without investing too much time studying it :).
> > > > > >
> > > > > > > This looks better than overriding the config_size with what v=
host-vdpa
> > > > > > > provides since it can override the features that the cli trie=
s to
> > > > > > > enable.
> > > > > >
> > > > > > I'm thinking about the generic --device vhost-vdpa idea. QEMU s=
hould not
> > > > > > require knowledge of the device feature bits in that case, so i=
t cannot
> > > > > > calculate the configuration space size.
> > > > >
> > > > > In this case, it looks to me the config size could be deduced fro=
m
> > > > > VHOST_VDPA_GET_FEATURES?
> > > >
> > > > I think we're talking about different things, see below...
> > > >
> > > > > >
> > > > > > > >
> > > > > > > > > > - Max virtqueue size: ok, VHOST_VDPA_GET_VRING_NUM
> > > > > > > > > > - Number of virtqueues: probe using VHOST_GET_VRING_BAS=
E?
> > > > > > > > >
> > > > > > > > > I'm not sure whether or not we need this and it seems not=
 necessary
> > > > > > > > > since it can be deduced from the config space and feature=
s.
> > > > > > > >
> > > > > > > > It can only be deduced in a device-specific way (net, blk, =
etc). I can't
> > > > > > > > think of a way to detect the number of virtqueues for an ar=
bitrary
> > > > > > > > VIRTIO device from the features bits and configuration spac=
e contents.
> > > > > > >
> > > > > > > Yes, I'm not against this idea but it looks to me it works ev=
en without this.
> > > > > > >
> > > > > > > Modern PCI has num_queues but we don't have things like this =
in MMIO
> > > > > > > and legacy PCI.
> > > > > >
> > > > > > Even if the VIRTIO hardware interface doesn't expose this infor=
mation to
> > > > > > the guest, QEMU's VirtIODevice API needs it. Device emulation c=
ode must
> > > > > > call virtio_add_queue() to expose virtqueues to the guest.
> > > > >
> > > > > We don't need this for current multiqueue virtio-net with vhost-v=
dpa
> > > > > since the queue num were deduced from the VHOST_VDPA_GET_CONFIG d=
uring
> > > > > the initialization of vhost-vdpa backend.
> > > > >
> > > > > If we are talking about generic vhost-vdpa-pci, we don't need
> > > > > virtio_add_queue() in this case.
> > > >
> > > > When I say --device vhost-vdpa I mean a VirtIODevice in QEMU that t=
akes
> > > > any /dev/vhost-vdpa-N and exposes the device to the guest (over
> > > > virtio-pci, virtio-mmio, or virtio-ccw). It's generic because it ha=
s no
> > > > knowledge of specific device types. This means new device types can=
 be
> > > > added without modifying QEMU.
> > > >
> > > > I think the model you are describing is not generic because it reli=
es on
> > > > knowledge of specific device types (net, blk, scsi, etc) so it can
> > > > interpret feature bits and configuration space fields.
> > >
> > > Yes, but what I meant is that in this case qemu can simply relay the
> > > set/get config to vhost-vdpa. And the guest driver can enumerate the
> > > number of queues correctly depending on his own knowledge.
> >
> > That requires changes to how virtqueues are managed by
> > hw/virtio/virtio.c because today the code assumes QEMU knows the number
> > of virtqueues. virtio_add_queue() must be called by device emulation
> > before the guest driver can configure a virtqueue.
>=20
> Right.
>=20
> >
> > > >
> > > > When you originally said "it would be even better to make it not
> > > > specific to device type" I thought you meant a generic --device
> > > > vhost-vdpa and that's what I've been describing, but in your recent
> > > > replies I guess you have a different model in mind.
> > > >
> > > > Are there reasons why the generic model won't work?
> > >
> > > I think not.
> > >
> > > One thing comes to my mind is that since we provide num_queues via
> > > modern virtio-pci, this is probably another call for having the API
> > > you described.
> > >
> > > For the general vhost-vdpa backend, the only thing that may block us
> > > is the migration. If we want to make vhost-vdpa type independent, we
> > > need first investigate the independent migration facility in virtio
> > > spec which is still suspicious.
> >
> > Yes, definitely.
> >
> > Another challenge with migration is that the generic vhost-vdpa vmstate
> > probably won't be compatible with QEMU's virtio-net/blk/scsi/etc
> > vmstates. It would be nice if it was possible to migrate between QEMU
> > and vDPA device models since they both implement the same device types.
> >
> > Maybe the solution is for QEMU's virtio device models to switch to the
> > new VIRTIO save/load data format once that has been defined in the spec=
.
> > Then the QEMU VirtIODevice vmstate would be:
> > 1. QEMU-specific VirtIODevice state (virtqueue state, etc)
> > 2. VIRTIO standard device save/load data (virtio-net mac table, etc)
>=20
> Right. The question is that do we expect the exact byte stream format
> defined in the spec? It looks to me it's sufficient to define each
> state that is required for the live migration and leave the byte
> stream format to be implementation specific. If we manage to do this,
> there's still a chance that we can live migration between those two.

Yes. I think the pros/cons of translation are better compatibility but
more complex code. Not sure if maintaining a QEMU-specific save/load
format in addition to the standard VIRTIO format is desirable in the
long term.

> >
> > It's still not clear to me how much of the VIRTIO device save/load data
> > is implementation-specific. I think the next step forward is to review
> > the QEMU vmstates for virtio-net, virtio-gpu, etc to figure out whether
> > we can really standardize the save/load data.
>=20
> Yes, and it should not be hard to have a general load and save based
> on key/value pairs which could be defined in the spec. Ideally, it
> should be more than enough to enumerate the keys based on the
> negotiated features. (But as discussed, virtio-fs and other stateful
> devices seem more complicated and a lot of spec work seems like a
> requirement before support this).

Great, I'm glad we had a chance to discuss this. It has helped me
understand the direction things are heading in.

Migration isn't a dependency for what Longpeng is doing in this patch
series. The generic --device vdpa-vhost can already be implemented today
without live migration support. Adding the vhost_vdpa ioctls we
discussed would be nice although it seems possible (but hacky) for QEMU
to probe using existing ioctls too.

Longpeng: Do you want to generalize this patch into a --device vdpa-host
that supports all device types?

Stefan

--i7jne/XIr+K4Va84
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHAOqkACgkQnKSrs4Gr
c8h/cgf/QxO/UDA0xjYfwsN1WnYm6syj6z+XuFPul0HXON32+MIUbnTiRbqKrGw0
8J9V4kXv9XZRjeUUgx43ZTJTMKswNbztF8QIXAlMZ4VnWKJ5BR7ArEElDZhpiPqb
8OSmZQgU0i8gmJir07zz0iJGyha5vQh/Wztne2jqQE4V+T6DffwXNtKUoUufRaqg
7PB6sDfjQ+vBl7qiUS+Yz4lhInCq7HUPctWNtxKjW53mR9XsEoVnHZ4y3Ew5xkFr
HS2zub0TgonAVOnGY3tX/zNcysDgBqvTY38JClhRFxKtIJ489zKMURYqg78ObraF
DHxa6WidxdVv7+jW4tt9ZzSE4QWUmg==
=kkLq
-----END PGP SIGNATURE-----

--i7jne/XIr+K4Va84--


