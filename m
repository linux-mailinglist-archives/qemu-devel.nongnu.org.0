Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04B35F57B8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 17:44:02 +0200 (CEST)
Received: from localhost ([::1]:39528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og6Yz-00085U-KM
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 11:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1og6VY-0004q4-3Q
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 11:40:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1og6VU-0002aK-TQ
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 11:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664984423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2vxPx1/Yg9FHZjUcoI6cwNfW9GEf+TqLQ625g5IcbMU=;
 b=MYPvizXdE8Bm84YLbLmADNlCeMhANiayNS1BV04bO+etEwtL1hArkHgDle6vikTERAh188
 DJVeSg6XcsIgYufBNVgjLhs3irzRbSZTaiZFXemuspBZlaOQfl0gdDS0umQbMoaIWOzQV8
 5p3sYFBVzGU/i6GburCPLE3dZtYZgCI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-qrUgDBk5M_aAGX--fmEXNg-1; Wed, 05 Oct 2022 11:40:20 -0400
X-MC-Unique: qrUgDBk5M_aAGX--fmEXNg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BEAC101CC62;
 Wed,  5 Oct 2022 15:40:20 +0000 (UTC)
Received: from localhost (unknown [10.39.193.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B62A49BB67;
 Wed,  5 Oct 2022 15:40:19 +0000 (UTC)
Date: Wed, 5 Oct 2022 11:40:17 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kwolf@redhat.com,
 hreitz@redhat.com, mst@redhat.com, den@virtuozzo.com
Subject: Re: [RFC patch 0/1] block: vhost-blk backend
Message-ID: <Yz2lYcKVH553MxfM@fedora>
References: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
 <YzyC1Y+c+e4IVDRM@fedora>
 <cff288d8-b8b5-76ba-aa90-91ddbd2d95a8@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AL7+ktxXgQ568yG1"
Content-Disposition: inline
In-Reply-To: <cff288d8-b8b5-76ba-aa90-91ddbd2d95a8@virtuozzo.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


--AL7+ktxXgQ568yG1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2022 at 02:50:06PM +0300, Andrey Zhadchenko wrote:
>=20
>=20
> On 10/4/22 22:00, Stefan Hajnoczi wrote:
> > On Mon, Jul 25, 2022 at 11:55:26PM +0300, Andrey Zhadchenko wrote:
> > > Although QEMU virtio-blk is quite fast, there is still some room for
> > > improvements. Disk latency can be reduced if we handle virito-blk req=
uests
> > > in host kernel so we avoid a lot of syscalls and context switches.
> > >=20
> > > The biggest disadvantage of this vhost-blk flavor is raw format.
> > > Luckily Kirill Thai proposed device mapper driver for QCOW2 format to=
 attach
> > > files as block devices: https://www.spinics.net/lists/kernel/msg42929=
65.html
> > >=20
> > > Also by using kernel modules we can bypass iothread limitation and fi=
naly scale
> > > block requests with cpus for high-performance devices. This is planne=
d to be
> > > implemented in next version.
> > >=20
> > > Linux kernel module part:
> > > https://lore.kernel.org/kvm/20220725202753.298725-1-andrey.zhadchenko=
@virtuozzo.com/
> > >=20
> > > test setups and results:
> > > fio --direct=3D1 --rw=3Drandread  --bs=3D4k  --ioengine=3Dlibaio --io=
depth=3D128
> > > QEMU drive options: cache=3Dnone
> > > filesystem: xfs
> > >=20
> > > SSD:
> > >                 | randread, IOPS  | randwrite, IOPS |
> > > Host           |      95.8k	 |	85.3k	   |
> > > QEMU virtio    |      57.5k	 |	79.4k	   |
> > > QEMU vhost-blk |      95.6k	 |	84.3k	   |
> > >=20
> > > RAMDISK (vq =3D=3D vcpu):
> > >                   | randread, IOPS | randwrite, IOPS |
> > > virtio, 1vcpu    |	123k	  |	 129k       |
> > > virtio, 2vcpu    |	253k (??) |	 250k (??)  |
> > > virtio, 4vcpu    |	158k	  |	 154k       |
> > > vhost-blk, 1vcpu |	110k	  |	 113k       |
> > > vhost-blk, 2vcpu |	247k	  |	 252k       |
> > > vhost-blk, 4vcpu |	576k	  |	 567k       |
> > >=20
> > > Andrey Zhadchenko (1):
> > >    block: add vhost-blk backend
> > >=20
> > >   configure                     |  13 ++
> > >   hw/block/Kconfig              |   5 +
> > >   hw/block/meson.build          |   1 +
> > >   hw/block/vhost-blk.c          | 395 +++++++++++++++++++++++++++++++=
+++
> > >   hw/virtio/meson.build         |   1 +
> > >   hw/virtio/vhost-blk-pci.c     | 102 +++++++++
> > >   include/hw/virtio/vhost-blk.h |  44 ++++
> > >   linux-headers/linux/vhost.h   |   3 +
> > >   8 files changed, 564 insertions(+)
> > >   create mode 100644 hw/block/vhost-blk.c
> > >   create mode 100644 hw/virtio/vhost-blk-pci.c
> > >   create mode 100644 include/hw/virtio/vhost-blk.h
> >=20
> > vhost-blk has been tried several times in the past. That doesn't mean it
> > cannot be merged this time, but past arguments should be addressed:
> >=20
> > - What makes it necessary to move the code into the kernel? In the past
> >    the performance results were not very convincing. The fastest
> >    implementations actually tend to be userspace NVMe PCI drivers that
> >    bypass the kernel! Bypassing the VFS and submitting block requests
> >    directly was not a huge boost. The syscall/context switch argument
> >    sounds okay but the numbers didn't really show that kernel block I/O
> >    is much faster than userspace block I/O.
> >=20
> >    I've asked for more details on the QEMU command-line to understand
> >    what your numbers show. Maybe something has changed since previous
> >    times when vhost-blk has been tried.
> >=20
> >    The only argument I see is QEMU's current 1 IOThread per virtio-blk
> >    device limitation, which is currently being worked on. If that's the
> >    only reason for vhost-blk then is it worth doing all the work of
> >    getting vhost-blk shipped (kernel, QEMU, and libvirt changes)? It
> >    seems like a short-term solution.
> >=20
> > - The security impact of bugs in kernel vhost-blk code is more serious
> >    than bugs in a QEMU userspace process.
> >=20
> > - The management stack needs to be changed to use vhost-blk whereas
> >    QEMU can be optimized without affecting other layers.
> >=20
> > Stefan
>=20
> Indeed there was several vhost-blk attempts, but from what I found in
> mailing lists only the Asias attempt got some attention and discussion.
> Ramdisk performance results were great but ramdisk is more a benchmark th=
an
> a real use. I didn't find out why Asias dropped his version except vague =
"He
> concluded performance results was not worth". The storage speed is very
> important for vhost-blk performance, as there is no point to cut cpu costs
> from 1ms to 0,1ms if the request need 50ms to proceed in the actual disk.=
 I
> think that 10 years ago NVMI was non-existent and SSD + SATA was probably=
 a
> lot faster than HDD but still not enough to utilize this technology.

Yes, it's possible that latency improvements are more noticeable now.
Thank you for posting the benchmark results. I will also run benchmarks
so we can compare vhost-blk with today's QEMU as well as multiqueue
IOThreads QEMU (for which I only have a hacky prototype) on a local NVMe
PCI SSD.

> The tests I did give me 60k IOPS randwrite for VM and 95k for host. And t=
he
> vhost-blk is able to negate the difference even using only 1 thread/vq/vc=
pu.
> And unlinke current QEMU single IOThread it can be easily scaled with num=
ber
> of cpus/vcpus. For sure this can be solved by liftimg IOThread limitations
> but this will probably be even more disastrous amount of changes (and add=
ing
> vhost-blk won't break old setups!).
>=20
> Probably the only undisputed advantage of vhost-blk is syscalls reduction.
> And again the benefit really depends on a storage speed, as it should be
> somehow comparable with syscalls time. Also I must note that this may be
> good for high-density servers with a lot of VMs. But for now I did not ha=
ve
> the exact numbers which show how much time we are really winning for a
> single request at average.
>=20
> Overall vhost-blk will only become better along with the increase of stor=
age
> speed.
>=20
> Also I must note that all arguments above apply to vdpa-blk. And unlike
> vhost-blk, which needs it's own QEMU code, vdpa-blk can be setup with
> generic virtio-vdpa QEMU code (I am not sure if it is merged yet but stil=
l).
> Although vdpa-blk have it's own problems for now.

Yes, I think that's why Stefano hasn't pushed for a software vpda-blk
device yet despite having played with it and is more focussed on
hardware enablement. vdpa-blk has the same issues as vhost-blk.

Stefan

--AL7+ktxXgQ568yG1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM9pWEACgkQnKSrs4Gr
c8hHJQf/VBrDcyy8Vq+k8qEpvfDBvl1SCwMBTfBfeNgYlem5GbpLvHuJ/wHZt8hM
MXalzNDwZEmduXIVlZT1tdjjqubArnhZq9IyrdwAIzMhYXQQSJgXyIs1gs9wUugU
Y6nRHh3zh9O14EgyzlAWRdaMgT208SKozhGw716PlvgFmnEDZCEH76kN5LYjZ3Vl
lpkDN4vTAzh8Yar+yukpYSG0mdjOv52eZpPFuGHgDu+In75OWm4Q47uZu6nzDOlc
MxInblGKcjbp0+r+5Tw3crOWs4nON1A+Kc30yEu5YYGffG6ZX6JXs78OklMEBX7F
gRfKoEGBZhoNi+YBt8CLlUfT7Gxjtw==
=yzDR
-----END PGP SIGNATURE-----

--AL7+ktxXgQ568yG1--


