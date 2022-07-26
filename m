Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A016E581202
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 13:33:14 +0200 (CEST)
Received: from localhost ([::1]:44104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGIoL-0007QW-Nb
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 07:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oGIgA-0006SA-Ru
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:24:48 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:42557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oGIg8-00051g-7J
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:24:46 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C51953200911;
 Tue, 26 Jul 2022 07:24:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 26 Jul 2022 07:24:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1658834679; x=1658921079; bh=cP
 iGuLNdCPGo5Nitn3I5VNN3l2Ts3DBGNMz7Su3QqH4=; b=FolBTlERdki7Q1UAwT
 l8XchqWHi6ipoFFv2d8CGv1A0XY6/UCXgUVIClFpcyUaXk0zqk8c4Bq02Cm/QEI+
 O/nNptPFoozlJs2XstJ5Y/GjAqwYMP0jNreMtwKL8eN+YKaZcEgdNQm1KEw5QT3u
 qOWOTCIN+1EIfA9qn5+w2ekP3mYvQtY5e1IXIigmhn3L65ev8CY2jjYuH4GzXMxE
 KuUe0jv7B1sklzxFbK47R/5ruGNRb29HRDap8f8SsmSa/ne7TMikp5D/Sh6qRXfq
 z0ytfDLl/5Nddwvq9YOVYaGYnwNJOOddRDur4hITm7co3VaKgBZ04qkE2dUINqxp
 krCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1658834679; x=1658921079; bh=cPiGuLNdCPGo5Nitn3I5VNN3l2Ts
 3DBGNMz7Su3QqH4=; b=TnRPHbOy651896ZpLopKlz6ieTJ+zoJ+0b0r08VmmiNU
 Krf0OzHEWn10s9zvoGten99UVUhqfhrsypiLQ+owEkYjW/tvYqwaE/jYhdr47Ywz
 JautC62jb+Q//RvL4L0iTIkzrECgdMezN5lIAoHdIMp8YwGPF3CBWo9BiZAVARgP
 sn/obxdGobZv5MJhBp5oyRKe6Xp2d/j08dwPBHAovzVmqlQU1NYoWiNUekeWkHOt
 FTAyFjztVWADZdilFXt3mraGbgzzyiZ7SVUEiGVv3MJqIAn9Ss2DQtxv90nMH/ur
 F7JLK+Euf7NKdda6vV10aU5BNabo0ACY8H49/FP5zQ==
X-ME-Sender: <xms:9s7fYmNeoe3HJEjY_8W9T_vzHdj7ebk1nkfnTkLpqMJp5MgmO-FNOw>
 <xme:9s7fYk8-vE1KyXNWiWbv6_18ZHFEn9oFsXwcknN3gv_oOWntRxrjbPNI6x8H_Ev1L
 SfzGxVeuwtIb5louCQ>
X-ME-Received: <xmr:9s7fYtTZVSPVR3hfTmHAmFy-fuCxUBZo00ZgC56lDgT8sKV8H-nPHB0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddutddgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:9s7fYmujlRn9Vrl6JE9ZDwnSD4YUITkI4gK4FtvHeyR-BLhki6dnCw>
 <xmx:9s7fYud6cALwCRZoaiA3Xc7xQ2mkq3dcAC6L1V46yVRm65J8Sxicvg>
 <xmx:9s7fYq16Kjiu7gtUCchSx7vpFSRswlw1H3DuEpiiFqNfm93dSMTGHA>
 <xmx:987fYrGoaptD3rVVopNhdM9ImJvEgIgWqozfPCmJL3XACpsiG_WNmw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Jul 2022 07:24:37 -0400 (EDT)
Date: Tue, 26 Jul 2022 13:24:35 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
Message-ID: <Yt/O8+n1pf3SRR7e@apples>
References: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
 <Yt8DWWg8qPLxL0fk@apples>
 <D12147BE-7F7A-4F41-9317-765F7EB2E971@ict.ac.cn>
 <Yt+avxgBxcwrxYgi@apples>
 <869047CA-DD0A-45D1-9DBA-2BA1A3E00ADF@ict.ac.cn>
 <Yt+xpMzwRWvn3QqR@apples> <Yt+9Spzi17LRRexQ@apples>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="l2gP24hSQ0zY2/Ge"
Content-Disposition: inline
In-Reply-To: <Yt+9Spzi17LRRexQ@apples>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--l2gP24hSQ0zY2/Ge
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 26 12:09, Klaus Jensen wrote:
> On Jul 26 11:19, Klaus Jensen wrote:
> > On Jul 26 15:55, Jinhao Fan wrote:
> > > at 3:41 PM, Klaus Jensen <its@irrelevant.dk> wrote:
> > >=20
> > > > On Jul 26 15:35, Jinhao Fan wrote:
> > > >> at 4:55 AM, Klaus Jensen <its@irrelevant.dk> wrote:
> > > >>=20
> > > >>> We have a regression following this patch that we need to address.
> > > >>>=20
> > > >>> With this patch, issuing a reset on the device (`nvme reset /dev/=
nvme0`
> > > >>> will do the trick) causes QEMU to hog my host cpu at 100%.
> > > >>>=20
> > > >>> I'm still not sure what causes this. The trace output is a bit
> > > >>> inconclusive still.
> > > >>>=20
> > > >>> I'll keep looking into it.
> > > >>=20
> > > >> I cannot reproduce this bug. I just start the VM and used `nvme re=
set
> > > >> /dev/nvme0`. Did you do anything before the reset?
> > > >=20
> > > > Interesting and thanks for checking! Looks like a kernel issue then!
> > > >=20
> > > > I remember that I'm using a dev branch (nvme-v5.20) of the kernel a=
nd
> > > > reverting to a stock OS kernel did not produce the bug.
> > >=20
> > > I=E2=80=99m using 5.19-rc4 which I pulled from linux-next on Jul 1. I=
t works ok on
> > > my machine.
> >=20
> > Interesting. I can reproduce on 5.19-rc4 from torvalds tree. Can you
> > drop your qemu command line here?
> >=20
> > This is mine.
> >=20
> > /home/kbj/work/src/qemu/build/x86_64-softmmu/qemu-system-x86_64 \
> >   -nodefaults \
> >   -display "none" \
> >   -machine "q35,accel=3Dkvm,kernel-irqchip=3Dsplit" \
> >   -cpu "host" \
> >   -smp "4" \
> >   -m "8G" \
> >   -device "intel-iommu" \
> >   -netdev "user,id=3Dnet0,hostfwd=3Dtcp::2222-:22" \
> >   -device "virtio-net-pci,netdev=3Dnet0" \
> >   -device "virtio-rng-pci" \
> >   -drive "id=3Dboot,file=3D/home/kbj/work/vol/machines/img/nvme.qcow2,f=
ormat=3Dqcow2,if=3Dvirtio,discard=3Dunmap,media=3Ddisk,read-only=3Dno" \
> >   -device "pcie-root-port,id=3Dpcie_root_port1,chassis=3D1,slot=3D0" \
> >   -device "nvme,id=3Dnvme0,serial=3Ddeadbeef,bus=3Dpcie_root_port1,mdts=
=3D7" \
> >   -drive "id=3Dnull,if=3Dnone,file=3Dnull-co://,file.read-zeroes=3Don,f=
ormat=3Draw" \
> >   -device "nvme-ns,id=3Dnvm-1,drive=3Dnvm-1,bus=3Dnvme0,nsid=3D1,drive=
=3Dnull,logical_block_size=3D4096,physical_block_size=3D4096" \
> >   -pidfile "/home/kbj/work/vol/machines/run/null/pidfile" \
> >   -kernel "/home/kbj/work/src/kernel/linux/arch/x86_64/boot/bzImage" \
> >   -append "root=3D/dev/vda1 console=3DttyS0,115200 audit=3D0 intel_iomm=
u=3Don" \
> >   -virtfs "local,path=3D/home/kbj/work/src/kernel/linux,security_model=
=3Dnone,readonly=3Don,mount_tag=3Dkernel_dir" \
> >   -serial "mon:stdio" \
> >   -d "guest_errors" \
> >   -D "/home/kbj/work/vol/machines/log/null/qemu.log" \
> >   -trace "pci_nvme*"
>=20
> Alright. It was *some* config issue with my kernel. Reverted to a
> defconfig + requirements and the issue went away.
>=20

And it went away because I didn't include iommu support in that kernel (and=
 its
not enabled by default on the stock OS kernel).

> I'll try to track down what happended, but doesnt look like qemu is at
> fault here.

OK. So.

I can continue to reproduce this if the machine has a virtual intel iommu
enabled. And it only happens when this commit is applied.

I even backported this patch (and the shadow doorbell patch) to v7.0 and v6=
=2E2
(i.e. no SRIOV or CC logic changes that could be buggy) and it still exhibi=
ts
this behavior. Sometimes QEMU coredumps on poweroff and I managed to grab o=
ne:

Program terminated with signal SIGSEGV, Segmentation fault.
#0  nvme_process_sq (opaque=3D0x556329708110) at ../hw/nvme/ctrl.c:5720
5720   NvmeCQueue *cq =3D n->cq[sq->cqid];
[Current thread is 1 (Thread 0x7f7363553cc0 (LWP 2554896))]
(gdb) bt
#0  nvme_process_sq (opaque=3D0x556329708110) at ../hw/nvme/ctrl.c:5720
#1  0x0000556326e82e28 in nvme_sq_notifier (e=3D0x556329708148) at ../hw/nv=
me/ctrl.c:3993
#2  0x000055632738396a in aio_dispatch_handler (ctx=3D0x5563291c3160, node=
=3D0x55632a228b60) at ../util/aio-posix.c:329
#3  0x0000556327383b22 in aio_dispatch_handlers (ctx=3D0x5563291c3160) at .=
=2E/util/aio-posix.c:372
#4  0x0000556327383b78 in aio_dispatch (ctx=3D0x5563291c3160) at ../util/ai=
o-posix.c:382
#5  0x000055632739d748 in aio_ctx_dispatch (source=3D0x5563291c3160, callba=
ck=3D0x0, user_data=3D0x0) at ../util/async.c:311
#6  0x00007f7369398163 in g_main_context_dispatch () at /usr/lib64/libglib-=
2.0.so.0
#7  0x00005563273af279 in glib_pollfds_poll () at ../util/main-loop.c:232
#8  0x00005563273af2f6 in os_host_main_loop_wait (timeout=3D0x1dbe22c0) at =
=2E./util/main-loop.c:255
#9  0x00005563273af404 in main_loop_wait (nonblocking=3D0x0) at ../util/mai=
n-loop.c:531
#10 0x00005563270714d9 in qemu_main_loop () at ../softmmu/runstate.c:726
#11 0x0000556326c7ea46 in main (argc=3D0x2e, argv=3D0x7ffc6977f198, envp=3D=
0x7ffc6977f310) at ../softmmu/main.c:50

At this point, there should not be any CQ/SQs (I detached the device from t=
he
kernel driver which deletes all queues and bound it to vfio-pci instead), b=
ut
somehow a stale notifier is called on poweroff and the queue is bogus, caus=
ing
the segfault.

(gdb) p cq->cqid
$2 =3D 0x7880

My guess would be that we are not cleaning up the notifier properly. Curren=
tly
we do this

    if (cq->ioeventfd_enabled) {
        memory_region_del_eventfd(&n->iomem,
                                  0x1000 + offset, 4, false, 0, &cq->notifi=
er);
        event_notifier_cleanup(&cq->notifier);
    }


Any ioeventfd experts that has some insights into what we are doing
wrong here? Something we need to flush? I tried with a test_and_clear on
the eventfd but that didnt do the trick.

I think we'd need to revert this until we can track down what is going wron=
g.

--l2gP24hSQ0zY2/Ge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLfzvIACgkQTeGvMW1P
DemRGwgAp6pbn+N6JjnE2QdRbsc42q0HPRUy2RETdnviqmeW+bB0vB2u/zXzQIuC
nnO05SxQ6qK7W/xerZISIKyKnKLQuvCE0IRWmUpwkIAPDGW8fjsImJ/6mEAApd31
1iWemsh3YtjWVbjgov9DcFAA6WUpJ2u8cqpm6J+lpkcuV27N16lNpDrJ7p6AoUk/
yZcY+f6IrYnJh3gEB71chjy8SYJFplBIIz4oyA47keaNrn/AHUf+tr2i+X6Sceu8
IesKwRShKI3VjLtpe4smvQbo+Z8GtqVAYMjUDQ6xQD16ZUrpdG8uKWzUsd5vjZRy
9dR6aKgCU9J91GgeXDY99JBjJLPKSQ==
=FY9Z
-----END PGP SIGNATURE-----

--l2gP24hSQ0zY2/Ge--

