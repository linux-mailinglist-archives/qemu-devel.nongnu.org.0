Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB02A478646
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 09:37:43 +0100 (CET)
Received: from localhost ([::1]:47516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my8kI-0002UE-G6
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 03:37:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1my8iZ-0001SZ-OM
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 03:35:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1my8iW-0004r4-C3
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 03:35:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639730151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FBnsFZuM3zzlOh/iMV9LV9ZF5x6lyfU6EvVbTg7v8PA=;
 b=WL328VCv5D3bboQXMrU+mc3zPJ5b7X7JhG5PzI1chbdDiTAHnErZnfdfihUDxJvkbyPJO8
 DQ0pPfumyKG4pEDcPuz5TlqpfIYu6Yxq5I4JiXssywq1jIjM0BMQ8BROHW/3I2uDZVGNYW
 +9lNq+nHemWELhXA7pk+P88A5NLiVXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-dgTGUDqjPhiXaBLQqHVAww-1; Fri, 17 Dec 2021 03:35:48 -0500
X-MC-Unique: dgTGUDqjPhiXaBLQqHVAww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E9DC36393;
 Fri, 17 Dec 2021 08:35:47 +0000 (UTC)
Received: from localhost (unknown [10.39.192.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 25F1C78A1A;
 Fri, 17 Dec 2021 08:35:45 +0000 (UTC)
Date: Fri, 17 Dec 2021 08:35:45 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-net host device support
Message-ID: <YbxL4avaEZBSFz3B@stefanha-x1.localdomain>
References: <20211212042818-mutt-send-email-mst@kernel.org>
 <CACGkMEs_99AsAfxCJurJtBOQELD7pnc6RAqJDoO9yseVJDy9tA@mail.gmail.com>
 <YbdjRRcfrNjHjfko@stefanha-x1.localdomain>
 <CACGkMEt9UF2eVB6692aGoKBD2v0zPwopZG1jaG_O=mg3-cwwSA@mail.gmail.com>
 <YbiYAKIkLAgosXEH@stefanha-x1.localdomain>
 <CACGkMEsZfgDriSx1e=JOU4E8QyB5KoU+i2M2F8N12BrMbu5suQ@mail.gmail.com>
 <Ybm+YVQS1l73nnuU@stefanha-x1.localdomain>
 <CACGkMEtqujKwU=3P1VQ-PgAQPvzrpAf_huVzVZHAi11vyn8xPA@mail.gmail.com>
 <YbsClFXLq3kz7tJS@stefanha-x1.localdomain>
 <CACGkMEtwHj-y9nVvtszOYKYd1ohd-cdNe8xry-rYkD1Jk9U4Ow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtwHj-y9nVvtszOYKYd1ohd-cdNe8xry-rYkD1Jk9U4Ow@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Xq763hyFTkiZeKct"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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

--Xq763hyFTkiZeKct
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 17, 2021 at 12:26:53PM +0800, Jason Wang wrote:

Dave: You created the VIRTIO vmstate infrastructure in QEMU. Please see
the bottom of this email about moving to a standard VIRTIO device
save/load format defined by the VIRTIO spec in the future.

> On Thu, Dec 16, 2021 at 5:10 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >
> > On Thu, Dec 16, 2021 at 11:01:40AM +0800, Jason Wang wrote:
> > > On Wed, Dec 15, 2021 at 6:07 PM Stefan Hajnoczi <stefanha@redhat.com>=
 wrote:
> > > >
> > > > On Wed, Dec 15, 2021 at 11:18:05AM +0800, Jason Wang wrote:
> > > > > On Tue, Dec 14, 2021 at 9:11 PM Stefan Hajnoczi <stefanha@redhat.=
com> wrote:
> > > > > >
> > > > > > On Tue, Dec 14, 2021 at 10:22:53AM +0800, Jason Wang wrote:
> > > > > > > On Mon, Dec 13, 2021 at 11:14 PM Stefan Hajnoczi <stefanha@re=
dhat.com> wrote:
> > > > > > > >
> > > > > > > > On Mon, Dec 13, 2021 at 10:47:00AM +0800, Jason Wang wrote:
> > > > > > > > > On Sun, Dec 12, 2021 at 5:30 PM Michael S. Tsirkin <mst@r=
edhat.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Sat, Dec 11, 2021 at 03:00:27AM +0000, Longpeng (Mik=
e, Cloud Infrastructure Service Product Dept.) wrote:
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > > From: Stefan Hajnoczi [mailto:stefanha@redhat.com]
> > > > > > > > > > > > Sent: Thursday, December 9, 2021 5:17 PM
> > > > > > > > > > > > To: Longpeng (Mike, Cloud Infrastructure Service Pr=
oduct Dept.)
> > > > > > > > > > > > <longpeng2@huawei.com>
> > > > > > > > > > > > Cc: jasowang@redhat.com; mst@redhat.com; parav@nvid=
ia.com;
> > > > > > > > > > > > xieyongji@bytedance.com; sgarzare@redhat.com; Yechu=
an <yechuan@huawei.com>;
> > > > > > > > > > > > Gonglei (Arei) <arei.gonglei@huawei.com>; qemu-deve=
l@nongnu.org
> > > > > > > > > > > > Subject: Re: [RFC] vhost-vdpa-net: add vhost-vdpa-n=
et host device support
> > > > > > > > > > > >
> > > > > > > > > > > > On Wed, Dec 08, 2021 at 01:20:10PM +0800, Longpeng(=
Mike) wrote:
> > > > > > > > > > > > > From: Longpeng <longpeng2@huawei.com>
> > > > > > > > > > > > >
> > > > > > > > > > > > > Hi guys,
> > > > > > > > > > > > >
> > > > > > > > > > > > > This patch introduces vhost-vdpa-net device, whic=
h is inspired
> > > > > > > > > > > > > by vhost-user-blk and the proposal of vhost-vdpa-=
blk device [1].
> > > > > > > > > > > > >
> > > > > > > > > > > > > I've tested this patch on Huawei's offload card:
> > > > > > > > > > > > > ./x86_64-softmmu/qemu-system-x86_64 \
> > > > > > > > > > > > >     -device vhost-vdpa-net-pci,vdpa-dev=3D/dev/vh=
ost-vdpa-0
> > > > > > > > > > > > >
> > > > > > > > > > > > > For virtio hardware offloading, the most importan=
t requirement for us
> > > > > > > > > > > > > is to support live migration between offloading c=
ards from different
> > > > > > > > > > > > > vendors, the combination of netdev and virtio-net=
 seems too heavy, we
> > > > > > > > > > > > > prefer a lightweight way.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Maybe we could support both in the future ? Such =
as:
> > > > > > > > > > > > >
> > > > > > > > > > > > > * Lightweight
> > > > > > > > > > > > >  Net: vhost-vdpa-net
> > > > > > > > > > > > >  Storage: vhost-vdpa-blk
> > > > > > > > > > > > >
> > > > > > > > > > > > > * Heavy but more powerful
> > > > > > > > > > > > >  Net: netdev + virtio-net + vhost-vdpa
> > > > > > > > > > > > >  Storage: bdrv + virtio-blk + vhost-vdpa
> > > > > > > > > > > > >
> > > > > > > > > > > > > [1] https://www.mail-archive.com/qemu-devel@nongn=
u.org/msg797569.html
> > > > > > > > > > > >
> > > > > > > > > > > > Stefano presented a plan for vdpa-blk at KVM Forum =
2021:
> > > > > > > > > > > > https://kvmforum2021.sched.com/event/ke3a/vdpa-blk-=
unified-hardware-and-sof
> > > > > > > > > > > > tware-offload-for-virtio-blk-stefano-garzarella-red=
-hat
> > > > > > > > > > > >
> > > > > > > > > > > > It's closer to today's virtio-net + vhost-net appro=
ach than the
> > > > > > > > > > > > vhost-vdpa-blk device you have mentioned. The idea =
is to treat vDPA as
> > > > > > > > > > > > an offload feature rather than a completely separat=
e code path that
> > > > > > > > > > > > needs to be maintained and tested. That way QEMU's =
block layer features
> > > > > > > > > > > > and live migration work with vDPA devices and re-us=
e the virtio-blk
> > > > > > > > > > > > code. The key functionality that has not been imple=
mented yet is a "fast
> > > > > > > > > > > > path" mechanism that allows the QEMU virtio-blk dev=
ice's virtqueue to be
> > > > > > > > > > > > offloaded to vDPA.
> > > > > > > > > > > >
> > > > > > > > > > > > The unified vdpa-blk architecture should deliver th=
e same performance
> > > > > > > > > > > > as the vhost-vdpa-blk device you mentioned but with=
 more features, so I
> > > > > > > > > > > > wonder what aspects of the vhost-vdpa-blk idea are =
important to you?
> > > > > > > > > > > >
> > > > > > > > > > > > QEMU already has vhost-user-blk, which takes a simi=
lar approach as the
> > > > > > > > > > > > vhost-vdpa-blk device you are proposing. I'm not ag=
ainst the
> > > > > > > > > > > > vhost-vdpa-blk approach in priciple, but would like=
 to understand your
> > > > > > > > > > > > requirements and see if there is a way to collabora=
te on one vdpa-blk
> > > > > > > > > > > > implementation instead of dividing our efforts betw=
een two.
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > We prefer a simple way in the virtio hardware offload=
ing case, it could reduce
> > > > > > > > > > > our maintenance workload, we no need to maintain the =
virtio-net, netdev,
> > > > > > > > > > > virtio-blk, bdrv and ... any more. If we need to supp=
ort other vdpa devices
> > > > > > > > > > > (such as virtio-crypto, virtio-fs) in the future, the=
n we also need to maintain
> > > > > > > > > > > the corresponding device emulation code?
> > > > > > > > > > >
> > > > > > > > > > > For the virtio hardware offloading case, we usually u=
se the vfio-pci framework,
> > > > > > > > > > > it saves a lot of our maintenance work in QEMU, we do=
n't need to touch the device
> > > > > > > > > > > types. Inspired by Jason, what we really prefer is "v=
host-vdpa-pci/mmio", use it to
> > > > > > > > > > > instead of the vfio-pci, it could provide the same pe=
rformance as vfio-pci, but it's
> > > > > > > > > > > *possible* to support live migrate between offloading=
 cards from different vendors.
> > > > > > > > > >
> > > > > > > > > > OK, so the features you are dropping would be migration=
 between
> > > > > > > > > > a vdpa, vhost and virtio backends. I think given vhost-=
vdpa-blk is seems
> > > > > > > > > > fair enough... What do others think?
> > > > > > > > >
> > > > > > > > > I think it should be fine, and it would be even better to=
 make it not
> > > > > > > > > specific to device type.
> > > > > > > >
> > > > > > > > That's an interesting idea. A generic vDPA VirtIODevice cou=
ld exposed as
> > > > > > > >
> > > > > > > >   --device vhost-vdpa-pci,
> > > > > > > >            [vhostfd=3DFD,|
> > > > > > > >             vhostpath=3D/dev/vhost-vdpa-N]
> > > > > > > >
> > > > > > > > (and for virtio-mmio and virtio-ccw too).
> > > > > > > >
> > > > > > > > I don't think this is possible yet because the vhost_vdpa i=
octls are
> > > > > > > > missing some introspection functionality. Here is what I fo=
und:
> > > > > > > > - Device ID: ok, use VHOST_VDPA_GET_DEVICE_ID
> > > > > > > > - Device feature bits: ok, use VHOST_GET_BACKEND_FEATURES
> > > > > > > > - Configuration space size: missing, need ioctl for ops->ge=
t_config_size()
> > > > > > >
> > > > > > > Any specific reason that we need this considering we've alrea=
dy had
> > > > > > > VHOST_VDPA_GET_CONFIG and we do the size validation there?
> > > > > >
> > > > > > QEMU's virtio_init() takes a size_t config_size argument. We ne=
ed to
> > > > > > determine the size of the vhost_vdpa's configuration space in o=
rder to
> > > > > > create the VirtIODevice in QEMU.
> > > > > >
> > > > > > Do you mean probing by checking for the VHOST_VDPA_GET_CONFIG -=
E2BIG
> > > > > > return value? It's hacky but I guess it's possible to do a bina=
ry search
> > > > > > that calls VHOST_VDPA_GET_CONFIG each iteration and reduces the=
 size if
> > > > > > -E2BIG is returned or increases the size otherwise.
> > > > > >
> > > > > > Or do you mean re-writing QEMU's hw/virtio/virtio.c to allow th=
e
> > > > > > VirtIODevice to override the size and we pass accesses through =
to
> > > > > > vhost_vdpa. That way it might be possible to avoid fetching the
> > > > > > configuration space size at startup, but I'm not sure this will=
 work
> > > > > > because QEMU might depend on knowing the exact size (e.g. live
> > > > > > migration).
> > > > >
> > > > > Good point, so looking at virtio-blk it has:
> > > > >
> > > > >     virtio_blk_set_config_size(s, s->host_features);
> > > > >     virtio_init(vdev, "virtio-blk", VIRTIO_ID_BLOCK, s->config_si=
ze);
> > > > >
> > > > > I think here virtio-blk/net should check the vhost-vdpa features =
here
> > > > > and fail if they are not the same?
> > > >
> > > > The vhost feature bit code in QEMU is complicated and I can't respo=
nd
> > > > without investing too much time studying it :).
> > > >
> > > > > This looks better than overriding the config_size with what vhost=
-vdpa
> > > > > provides since it can override the features that the cli tries to
> > > > > enable.
> > > >
> > > > I'm thinking about the generic --device vhost-vdpa idea. QEMU shoul=
d not
> > > > require knowledge of the device feature bits in that case, so it ca=
nnot
> > > > calculate the configuration space size.
> > >
> > > In this case, it looks to me the config size could be deduced from
> > > VHOST_VDPA_GET_FEATURES?
> >
> > I think we're talking about different things, see below...
> >
> > > >
> > > > > >
> > > > > > > > - Max virtqueue size: ok, VHOST_VDPA_GET_VRING_NUM
> > > > > > > > - Number of virtqueues: probe using VHOST_GET_VRING_BASE?
> > > > > > >
> > > > > > > I'm not sure whether or not we need this and it seems not nec=
essary
> > > > > > > since it can be deduced from the config space and features.
> > > > > >
> > > > > > It can only be deduced in a device-specific way (net, blk, etc)=
. I can't
> > > > > > think of a way to detect the number of virtqueues for an arbitr=
ary
> > > > > > VIRTIO device from the features bits and configuration space co=
ntents.
> > > > >
> > > > > Yes, I'm not against this idea but it looks to me it works even w=
ithout this.
> > > > >
> > > > > Modern PCI has num_queues but we don't have things like this in M=
MIO
> > > > > and legacy PCI.
> > > >
> > > > Even if the VIRTIO hardware interface doesn't expose this informati=
on to
> > > > the guest, QEMU's VirtIODevice API needs it. Device emulation code =
must
> > > > call virtio_add_queue() to expose virtqueues to the guest.
> > >
> > > We don't need this for current multiqueue virtio-net with vhost-vdpa
> > > since the queue num were deduced from the VHOST_VDPA_GET_CONFIG durin=
g
> > > the initialization of vhost-vdpa backend.
> > >
> > > If we are talking about generic vhost-vdpa-pci, we don't need
> > > virtio_add_queue() in this case.
> >
> > When I say --device vhost-vdpa I mean a VirtIODevice in QEMU that takes
> > any /dev/vhost-vdpa-N and exposes the device to the guest (over
> > virtio-pci, virtio-mmio, or virtio-ccw). It's generic because it has no
> > knowledge of specific device types. This means new device types can be
> > added without modifying QEMU.
> >
> > I think the model you are describing is not generic because it relies o=
n
> > knowledge of specific device types (net, blk, scsi, etc) so it can
> > interpret feature bits and configuration space fields.
>=20
> Yes, but what I meant is that in this case qemu can simply relay the
> set/get config to vhost-vdpa. And the guest driver can enumerate the
> number of queues correctly depending on his own knowledge.

That requires changes to how virtqueues are managed by
hw/virtio/virtio.c because today the code assumes QEMU knows the number
of virtqueues. virtio_add_queue() must be called by device emulation
before the guest driver can configure a virtqueue.

> >
> > When you originally said "it would be even better to make it not
> > specific to device type" I thought you meant a generic --device
> > vhost-vdpa and that's what I've been describing, but in your recent
> > replies I guess you have a different model in mind.
> >
> > Are there reasons why the generic model won't work?
>=20
> I think not.
>=20
> One thing comes to my mind is that since we provide num_queues via
> modern virtio-pci, this is probably another call for having the API
> you described.
>=20
> For the general vhost-vdpa backend, the only thing that may block us
> is the migration. If we want to make vhost-vdpa type independent, we
> need first investigate the independent migration facility in virtio
> spec which is still suspicious.

Yes, definitely.

Another challenge with migration is that the generic vhost-vdpa vmstate
probably won't be compatible with QEMU's virtio-net/blk/scsi/etc
vmstates. It would be nice if it was possible to migrate between QEMU
and vDPA device models since they both implement the same device types.

Maybe the solution is for QEMU's virtio device models to switch to the
new VIRTIO save/load data format once that has been defined in the spec.
Then the QEMU VirtIODevice vmstate would be:
1. QEMU-specific VirtIODevice state (virtqueue state, etc)
2. VIRTIO standard device save/load data (virtio-net mac table, etc)

It's still not clear to me how much of the VIRTIO device save/load data
is implementation-specific. I think the next step forward is to review
the QEMU vmstates for virtio-net, virtio-gpu, etc to figure out whether
we can really standardize the save/load data.

Stefan

--Xq763hyFTkiZeKct
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG8S+EACgkQnKSrs4Gr
c8jenQgAhMurfhXLjnirci216Xdpjr3jIKP4UgdCe8+duo4ZzOXGJ5BzYOfRaqiV
HU0+DmaZkocMA0zRyWdfw51+1VIAutokjsYjK6VyYqiVOkbMolC8P2Z6M1f7wyLr
ZlG23YnGGprVDE3wzrwwfCkJDGSjK4kTYiEcYaxpKaNCZhcnm9jo1K8oABsWn87c
qC9cQ4sCvmYf+BtGIMiqhU9DphhZYNVjby/PrBWrPbTl0OBQVU9RlsrxZzXiQMHP
D8C0duya1VR+wwe9HiwTVLGet8CeiSCwSpnuah64HeBNk+z/UkmWSbeTkBMI73TQ
LzBzv7taWbxicHk3uynlqflgS6+G0Q==
=nIfV
-----END PGP SIGNATURE-----

--Xq763hyFTkiZeKct--


