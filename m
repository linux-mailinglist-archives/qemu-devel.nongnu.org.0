Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0981A5F57A8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 17:34:52 +0200 (CEST)
Received: from localhost ([::1]:44898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og6Q6-00083e-O5
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 11:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1og6M6-0004su-80
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 11:30:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1og6M4-0000sQ-5h
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 11:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664983839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a3Wk244S7ZRkwfJZoMya7Xdpav1CcD8CrUwkb9EiRzM=;
 b=aj7BG9MmdM+rlS6KqGZGI1YoFUYPKDIFTMQQT6zeFzztAc0O+IuLPAmfew0OXnVWouh4ld
 ZIhTyLO00nJ+mYCU8aUgW8bvlYHzhhVWN/nS9e0DeLVKDAqZYEQRpvTFK/ixclSPxxJ4+5
 SfP+3NlbBG7Szeby4sEwPQvDWbqwidk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-4irD0172OBKGxvAT_mbJsw-1; Wed, 05 Oct 2022 11:30:35 -0400
X-MC-Unique: 4irD0172OBKGxvAT_mbJsw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E290101A528;
 Wed,  5 Oct 2022 15:30:35 +0000 (UTC)
Received: from localhost (unknown [10.39.193.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9930E40E293E;
 Wed,  5 Oct 2022 15:30:34 +0000 (UTC)
Date: Wed, 5 Oct 2022 11:30:27 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kwolf@redhat.com,
 hreitz@redhat.com, mst@redhat.com, den@virtuozzo.com
Subject: Re: [RFC patch 0/1] block: vhost-blk backend
Message-ID: <Yz2jE7N65GUAEIBg@fedora>
References: <20220725205527.313973-1-andrey.zhadchenko@virtuozzo.com>
 <Yzx6xDCnpIQ0yOi5@fedora>
 <ae1a9e07-b457-7208-3bff-f53c5de9c3e8@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Mh+jmQgdsAPrlGxN"
Content-Disposition: inline
In-Reply-To: <ae1a9e07-b457-7208-3bff-f53c5de9c3e8@virtuozzo.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


--Mh+jmQgdsAPrlGxN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2022 at 01:28:14PM +0300, Andrey Zhadchenko wrote:
>=20
>=20
> On 10/4/22 21:26, Stefan Hajnoczi wrote:
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
> >=20
> > > QEMU drive options: cache=3Dnone
> > > filesystem: xfs
> >=20
> > Please post the full QEMU command-line so it's clear exactly what this
> > is benchmarking.
>=20
> The full command for vhost is this:
> qemu-system-x86_64 \
> -kernel bzImage -nographic -append "console=3DttyS0 root=3D/dev/sdb rw
> systemd.unified_cgroup_hierarchy=3D0 nokaslr" \
> -m 1024 -s --enable-kvm -smp $2 \
> -drive id=3Dmain_drive,file=3Ddebian_sid.img,media=3Ddisk,format=3Draw \
> -drive id=3Dvhost_drive,file=3D$1,media=3Ddisk,format=3Draw,if=3Dnone \

No cache=3Dnone because vhost-blk directly submits bios in the kernel?

> -device vhost-blk-pci,drive=3Dvhost_drive,num-threads=3D$3
>=20
> (num-threads option for vhost-blk-pci was not used)
>=20
> For virtio I used this:
> qemu-system-x86_64 \
> -kernel bzImage -nographic -append "console=3DttyS0 root=3D/dev/sdb rw
> systemd.unified_cgroup_hierarchy=3D0 nokaslr" \
> -m 1024 -s --enable-kvm -smp $2 \
> -drive file=3Ddebian_sid.img,media=3Ddisk \
> -drive file=3D$1,media=3Ddisk,if=3Dvirtio,cache=3Dnone,if=3Dnone,id=3Dd1,=
aio=3Dthreads\
> -device virtio-blk-pci,drive=3Dd1
>=20
> >=20
> > A preallocated raw image file is a good baseline with:
> >=20
> >    --object iothread,id=3Diothread0 \
> >    --blockdev file,filename=3Dtest.img,cache.direct=3Don,aio=3Dnative,n=
ode-name=3Ddrive0 >    --device virtio-blk-pci,drive=3Ddrive0,iothread=3Dio=
thread0
> The image I used was preallocated qcow2 image set up with dm-qcow2 because
> this vhost-blk version directly uses bio interface and can't work with
> regular files.

I see.=20

>=20
> >=20
> > (BTW QEMU's default vq size is 256 descriptors and the number of vqs is
> > the number of vCPUs.)
> >=20
> > >=20
> > > SSD:
> > >                 | randread, IOPS  | randwrite, IOPS |
> > > Host           |      95.8k	 |	85.3k	   |
> > > QEMU virtio    |      57.5k	 |	79.4k	   |
>=20
> Adding iothread0 and using raw file instead of qcow2 + dm-qcow2 setup bri=
ngs
> the numbers to
>                   |      60.4k   |      84.3k      |
>=20
> > > QEMU vhost-blk |      95.6k	 |	84.3k	   |
> > >=20
> > > RAMDISK (vq =3D=3D vcpu):
> >=20
> > With fio numjobs=3Dvcpu here?
>=20
> Yes
>=20
> >=20
> > >                   | randread, IOPS | randwrite, IOPS |
> > > virtio, 1vcpu    |	123k	  |	 129k       |
> > > virtio, 2vcpu    |	253k (??) |	 250k (??)  |
> >=20
> > QEMU's aio=3Dthreads (default) gets around the single IOThread. It beats
> > aio=3Dnative for this reason in some cases. Were you using aio=3Dnative=
 or
> > aio=3Dthreads?
>=20
> At some point of time I started to specify aio=3Dthreads (and before that=
 I
> did not use this option). I am not sure when exactly. I will re-measure a=
ll
> cases for the next submission.

aio=3Dnative is usually recommended. aio=3Dthreads is less optimized.

aio=3Dnative should have lower latency than aio=3Dthreads although it scales
worse on hosts with free CPUs because it's limited to a single thread.

>=20
> >=20
> > > virtio, 4vcpu    |	158k	  |	 154k       |
> > > vhost-blk, 1vcpu |	110k	  |	 113k       |
> > > vhost-blk, 2vcpu |	247k	  |	 252k       |
>=20

--Mh+jmQgdsAPrlGxN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM9oxMACgkQnKSrs4Gr
c8ig8Af/SuR2lpM3qLsNMl7udh2vG7p0z/eEF0YMQqhNH7qrM8AqQuJ2ctgN0aWD
re5VX8S7Fw1CT10rNCAQdNjScB4aaWYmiASD/t1HmMXG1hm4riD5b3stBLn3mp7o
mOR2eylYrZi84dOayjjLglhTKkPod3G8JUlAdraaUxIIadauizYqe0zqgQnoToBu
dQL7L99cXpGwkaeUcBUekX/NsY8Q3b4W7dOCmrDnbGPFHOJUZKePFhe5xHAL/4cv
g4mjhyKDtzHnXIN0PxvzVPPPitlvsfT9Exj+zX41gR1F43YoiQkheCZhHYqSIn39
AyTCfPGK6bRD0yv8hYWZpgMfmmpENA==
=SZnJ
-----END PGP SIGNATURE-----

--Mh+jmQgdsAPrlGxN--


