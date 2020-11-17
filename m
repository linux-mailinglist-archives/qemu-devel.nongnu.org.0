Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818DA2B6A81
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:43:56 +0100 (CET)
Received: from localhost ([::1]:33198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf45D-0005fG-FD
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:43:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kf40z-0001ds-RC
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:39:33 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:47769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kf40s-0002GF-GK
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=YdEBwNDzEsVoqQnxFXSmxBnr8W/jaRb/EbPmBMyt3ks=; b=MSF/6/lAvQQ63AXZEXsIRZR40Y
 7iVprjnetcr53ducJkDIuH3FdRP4Z9d7fDwozHcvLcJhpfVwbDKv7tzAn3SqSeX3CLS/BWJzxRUq2
 YTispDoMc2spwrzJUpwPb/qCIz4W7ZKGo8PiDjqTfWGNIdyeRl8BCIAwTl7nucgbh7/BpyjYXu/lT
 wTOavdVHJbGpTF33nRBfmP0wu4tlaCvvXn4RbAVjpuEvIcxfoNBQOSPo0joc24HenxN4wnsulZmYb
 wHabz4cwr+KVuHzy7CDafOMHdlOOwSEClFPLq1JwUAWBDRg2EAafd3cq0S/7FiIDSiWBoyn82SY3m
 Q738yJ3Q==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: "Venegas Munoz, Jose Carlos" <jose.carlos.venegas.munoz@intel.com>,
 Miklos Szeredi <mszeredi@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, "Shinde,
 Archana M" <archana.m.shinde@intel.com>, Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Use --thread-pool-size=0 to mean
 no thread pool
Date: Tue, 17 Nov 2020 17:39:16 +0100
Message-ID: <5082873.Uf8toegZhN@silver>
In-Reply-To: <C5CAD300-DB1D-4C6A-A2D3-2E6BA9F901DF@intel.com>
References: <20201105194416.GA1384085@redhat.com>
 <CAOssrKcJr9a_5EUTU19BTp1UaST64Shh9w0UeR6TXPLqkN7bBw@mail.gmail.com>
 <C5CAD300-DB1D-4C6A-A2D3-2E6BA9F901DF@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 11:39:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On Dienstag, 17. November 2020 17:00:09 CET Venegas Munoz, Jose Carlos wrot=
e:
> >   Not sure what the default is for 9p, but comparing
> >   default to default will definitely not be apples to apples since this
> >   mode is nonexistent in 9p.
>=20
>=20
> In Kata we are looking for the best config for fs compatibility and
> performance. So even if are no apples to apples, we are for the best
> config for both and comparing the best that each of them can do.=20
> In the case of Kata for 9pfs(this is the config we have found has better
> performance and fs compatibility  in general) we have:
> ```
> -device virtio-9p-pci # device type
> ,disable-modern=3Dfalse=20
> ,fsdev=3Dextra-9p-kataShared # attr: device id  for fsdev
> ,mount_tag=3DkataShared  # attr: tag on how will be found de sharedfs=20
> ,romfile=3D=20
> -fsdev local  #local: Simply lets QEMU call the individual VFS functions
> (more or less) directly on host.
> ,id=3Dextra-9p-kataShared
> ,path=3D${SHARED_PATH} # attrs: path to share
> ,security_model=3Dnone #   =20
> #    passthrough: Files are stored using the same credentials as they are
> created on the guest. This requires QEMU to run as # root.
> #    none: Same
> as "passthrough" except the sever won't report failures if it fails to set
> file attributes like ownership # #  (chown). This makes a passthrough like
> security model usable for people who run kvm as non root. ,multidevs=3Dre=
map
> ```
>=20
> The mount options are:
> ```
> trans=3Dvirtio=20
>     ,version=3D9p2000.L=20
>     ,cache=3Dmmap=20
>     ,"nodev" # Security: The nodev mount option specifies that the
> filesystem cannot contain special devices.=20
> ,"msize=3D8192" # msize: Maximum

Too small. You should definitely set 'msize' larger, as small a msize value=
=20
causes 9p requests to be broken down into more and smaller 9p requests:
https://wiki.qemu.org/Documentation/9psetup#msize

Setting msize to a fairly high value might also substantially increase I/O=
=20
performance i.e. on large I/O if guest application honors st_blksize return=
ed=20
by calling *stat() [ https://man7.org/linux/man-pages/man2/stat.2.html ]:

       st_blksize
              This field gives the "preferred" block size for efficient
              filesystem I/O.

=46or instance 'time cat /large/file' would be substantially faster, as it=
=20
automatically adapts the chunk size.

> packet size including any headers. ```
>=20
> Aditionally we use this patch
> https://github.com/kata-containers/packaging/blob/stable-1.12/qemu/patche=
s/
> 5.0.x/0001-9p-removing-coroutines-of-9p-to-increase-the-I-O-per.patch

Interesting radical approach. :)

Yeah, the coroutine code in 9pfs is still a huge bottleneck. The problem of=
=20
the existing coroutine code is that it dispatches too often between threads=
=20
(i.e. main I/O thread of 9p server and background I/O threads doing the fs=
=20
driver work) which causes huge latencies.

I started to fix that, yet I only completed the Treaddir request handler so=
=20
far, which however gave a huge performance boost on such Treaddir requests:
https://lists.gnu.org/archive/html/qemu-devel/2020-01/msg05539.html

The plan is to do the same for the other 9p request handlers, and finally=20
introducing an 'order=3Drelaxed' option (right now the order is strict only=
).

That should end up being faster than your current no-coroutine hack later o=
n,=20
because you would have the benefits of both worlds: low latency and=20
parallelism for the fs driver I/O work.

> In kata for virtiofs I am testing  use:
> ```
> -chardev socket
> ,id=3DID-SOCKET
> ,path=3D.../vhost-fs.sock  # Path to vhost socket
> -device vhost-user-fs-pci #
> ,chardev=3DID-SOCKET=20
> ,tag=3DkataShared=20
> ,romfile=3D
>=20
>  -object memory-backend-file # force use of memory sharable with virtiofs=
d.
>  ,id=3Ddimm1
>  ,size=3D2048M
>  ,mem-path=3D/dev/shm=20
>  ,share=3Don
> ```
> Virtiofsd:
> ```
> -o cache=3Dauto=20
> -o no_posix_lock # enable/disable remote posix lock
> --thread-pool-size=3D0
> ```
>=20
> And virtiofs mount options:
> ```
> source:\"kataShared\"=20
> fstype:\"virtiofs\"
> ```
>=20
> With this patch, comparing this two configurations, I have seen better
> performance with virtiofs in different hosts.
> -
> Carlos
>=20
> -
>=20
> =EF=BB=BFOn 12/11/20 3:06, "Miklos Szeredi" <mszeredi@redhat.com> wrote:
>=20
>     On Fri, Nov 6, 2020 at 11:35 PM Vivek Goyal <vgoyal@redhat.com> wrote:
>=20
>     >
>     >
>     > On Fri, Nov 06, 2020 at 08:33:50PM +0000, Venegas Munoz, Jose Carlos
>     > wrote:
>     > >=20
>     > > Hi Vivek,
>     > >
>     > >
>     > >
>     > > I have tested with Kata 1.12-apha0, the results seems that are
>     > > better for the use fio config I am tracking.
>     > > > >
>     > >
>     > >
>     > > The fio config does  randrw:
>     > >
>     > >
>     > >
>     > > fio --direct=3D1 --gtod_reduce=3D1 --name=3Dtest
>     > > --filename=3Drandom_read_write.fio --bs=3D4k --iodepth=3D64 --siz=
e=3D200M
>     > > --readwrite=3Drandrw --rwmixread=3D75
>     > > > >
>     > >
>     >
>     >
>     >
>     > Hi Carlos,
>     >
>     >
>     >
>     > Thanks for the testing.
>     >
>     >
>     >
>     > So basically two conclusions from your tests.
>     >
>     >
>     >
>     > - for virtiofs, --thread-pool-size=3D0 is performing better as coma=
pred
>     >=20
>     >   to --thread-pool-size=3D1 as well as --thread-pool-size=3D64.
>     >   Approximately
>     >   35-40% better.
>     >
>     >
>     >
>     > - virtio-9p is still approximately 30% better than virtiofs
>     >=20
>     >   --thread-pool-size=3D0.
>     >
>     >
>     >
>     > As I had done the analysis that this particular workload (mixed read
>     > and
>     > write) is bad with virtiofs because after every write we are
>     > invalidating
>     > attrs and cache so next read ends up fetching attrs again. I had
>     > posted
>     > patches to gain some of the performance.
>     >
>     >
>     >
>     > https://lore.kernel.org/linux-fsdevel/20200929185015.GG220516@redha=
t.c
>     > om/
>     >
>     >
>     >
>     > But I got the feedback to look into implementing file leases instea=
d.
>=20
>=20
>     Hmm, the FUSE_AUTO_INVAL_DATA feature is buggy, how about turning it
>     off for now?   9p doesn't have it, so no point in enabling it for
>     virtiofs by default.
>=20
>     Also I think some confusion comes from cache=3Dauto being the default
>     for virtiofs.    Not sure what the default is for 9p, but comparing
>     default to default will definitely not be apples to apples since this
>     mode is nonexistent in 9p.
>=20
>     9p:cache=3Dnone  <-> virtiofs:cache=3Dnone
>     9p:cache=3Dloose <-> virtiofs:cache=3Dalways
>=20
>     "9p:cache=3Dmmap" and "virtiofs:cache=3Dauto" have no match.
>=20
>     Untested patch attached.
>=20
>     Thanks,
>     Miklos
>=20

Best regards,
Christian Schoenebeck



