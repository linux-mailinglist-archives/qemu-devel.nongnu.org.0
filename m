Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA926581234
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 13:38:59 +0200 (CEST)
Received: from localhost ([::1]:51480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGItu-0004Ci-6x
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 07:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oGInL-0005Q4-D0
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:32:11 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:45091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oGInJ-00072J-5H
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:32:11 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id CE58D320090F;
 Tue, 26 Jul 2022 07:32:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 26 Jul 2022 07:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1658835126; x=1658921526; bh=8q
 8ZFx2aPbe410EnBSZN9jm3YB4vBmBqzgcCDdItA/c=; b=nrkKyoBA3cnKEZ/wX4
 V/X40u52qJl5AJ66DCa+Z2aitslEZM/SKaJTCid3fRfM6RcYmjvq2E2oj+8gdSb9
 d6nKcZpY/YtO4b0AY6zOlxTtmIJ2rTMMLS2JmxcrgOXYcJUEiR8D9q3gT0I078u+
 zta7BrFaXcSN9E0n8oEbxPS4as2j0hOsHx1wSg/0g02KvkXx7vLcwiAaP7W1LjrH
 kbKZzvlOBvnmnM1+2vJ4JCzspSMqXfF5gUFTLBxR5n2ykbOIdnr3YNaaostb/yoC
 fZe4+94m/y9TsGsgGFpBcNCbpzcvjej2NZUN06LTBcqgM9zcZXy8HzKECarKunqS
 KSkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1658835126; x=1658921526; bh=8q8ZFx2aPbe410EnBSZN9jm3YB4v
 BmBqzgcCDdItA/c=; b=sCFD8wlT24Pi6+MPWuz3tjJLMqcX0moVCaQ6/xzAajok
 sbbCe7dR/ENt3lfj5wN9x8YwVEbba04vEpspr2o/bcpPXL9shD+MW3LhHfK0NR4P
 M9mtsZKDvC/FiwRhZ/5FQ7duM6ML8kpP5wUSR3ODLtzXox8u4pS6KNx5eExUADSk
 XpC05BG7PFXW9p+CtENNchAB382CVwLs4+cQNlWQPuKD00OLrZeilrA4FIeDVTey
 P8ZL+O8r77VikwIS4Ki24HAF03aHDLgvLVYtAO1kn3kX10P2a44jAKl6LqB+4Oqq
 5bka4axaA7J9GdV6Sv0v6l0X3U5h6H/3BnJbYC2X/g==
X-ME-Sender: <xms:tdDfYmdR57zh6ULFL0QI8fk5Slm3AFSiZ8hz_H7ueCXU2BmQ16GL-Q>
 <xme:tdDfYgNPiuZw-GrxxI6HKsr-2anfAivbXZjAPW25YsTB-3jV8YQn-K0Ql-6urDf_g
 3KvIMqfM2bSVDUso2g>
X-ME-Received: <xmr:tdDfYniuBNSPxibgEMOINoiQrvnp2U7D282duQkgq9lxV9tupE-W86E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddutddggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ttDfYj-FQaaTxiXtIza2RpJ1g_f_7quCB3dJoLNb7Njh2qbl3y6ESw>
 <xmx:ttDfYisa9FsAEFaVwfmrKnfD5U7fpRGPxQaN2vQWpxEc2n-WL6H8tA>
 <xmx:ttDfYqFi_GDGirNXxWuRCEdnUNQMnuHNqywucch5Ccjnppr7lB1FLw>
 <xmx:ttDfYkUiLfZQqliS5y-Tfq3O1FLQcLpl9evotuImDNjg50aXgwnVlg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Jul 2022 07:32:04 -0400 (EDT)
Date: Tue, 26 Jul 2022 13:32:03 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
Message-ID: <Yt/Qs5PelXjX8E1v@apples>
References: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
 <Yt8DWWg8qPLxL0fk@apples>
 <D12147BE-7F7A-4F41-9317-765F7EB2E971@ict.ac.cn>
 <Yt+avxgBxcwrxYgi@apples>
 <869047CA-DD0A-45D1-9DBA-2BA1A3E00ADF@ict.ac.cn>
 <Yt+xpMzwRWvn3QqR@apples> <Yt+9Spzi17LRRexQ@apples>
 <Yt/O8+n1pf3SRR7e@apples>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hLN4B82/tHxwgKjk"
Content-Disposition: inline
In-Reply-To: <Yt/O8+n1pf3SRR7e@apples>
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


--hLN4B82/tHxwgKjk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 26 13:24, Klaus Jensen wrote:
> On Jul 26 12:09, Klaus Jensen wrote:
> > On Jul 26 11:19, Klaus Jensen wrote:
> > > On Jul 26 15:55, Jinhao Fan wrote:
> > > > at 3:41 PM, Klaus Jensen <its@irrelevant.dk> wrote:
> > > >=20
> > > > > On Jul 26 15:35, Jinhao Fan wrote:
> > > > >> at 4:55 AM, Klaus Jensen <its@irrelevant.dk> wrote:
> > > > >>=20
> > > > >>> We have a regression following this patch that we need to addre=
ss.
> > > > >>>=20
> > > > >>> With this patch, issuing a reset on the device (`nvme reset /de=
v/nvme0`
> > > > >>> will do the trick) causes QEMU to hog my host cpu at 100%.
> > > > >>>=20
> > > > >>> I'm still not sure what causes this. The trace output is a bit
> > > > >>> inconclusive still.
> > > > >>>=20
> > > > >>> I'll keep looking into it.
> > > > >>=20
> > > > >> I cannot reproduce this bug. I just start the VM and used `nvme =
reset
> > > > >> /dev/nvme0`. Did you do anything before the reset?
> > > > >=20
> > > > > Interesting and thanks for checking! Looks like a kernel issue th=
en!
> > > > >=20
> > > > > I remember that I'm using a dev branch (nvme-v5.20) of the kernel=
 and
> > > > > reverting to a stock OS kernel did not produce the bug.
> > > >=20
> > > > I=E2=80=99m using 5.19-rc4 which I pulled from linux-next on Jul 1.=
 It works ok on
> > > > my machine.
> > >=20
> > > Interesting. I can reproduce on 5.19-rc4 from torvalds tree. Can you
> > > drop your qemu command line here?
> > >=20
> > > This is mine.
> > >=20
> > > /home/kbj/work/src/qemu/build/x86_64-softmmu/qemu-system-x86_64 \
> > >   -nodefaults \
> > >   -display "none" \
> > >   -machine "q35,accel=3Dkvm,kernel-irqchip=3Dsplit" \
> > >   -cpu "host" \
> > >   -smp "4" \
> > >   -m "8G" \
> > >   -device "intel-iommu" \
> > >   -netdev "user,id=3Dnet0,hostfwd=3Dtcp::2222-:22" \
> > >   -device "virtio-net-pci,netdev=3Dnet0" \
> > >   -device "virtio-rng-pci" \
> > >   -drive "id=3Dboot,file=3D/home/kbj/work/vol/machines/img/nvme.qcow2=
,format=3Dqcow2,if=3Dvirtio,discard=3Dunmap,media=3Ddisk,read-only=3Dno" \
> > >   -device "pcie-root-port,id=3Dpcie_root_port1,chassis=3D1,slot=3D0" \
> > >   -device "nvme,id=3Dnvme0,serial=3Ddeadbeef,bus=3Dpcie_root_port1,md=
ts=3D7" \
> > >   -drive "id=3Dnull,if=3Dnone,file=3Dnull-co://,file.read-zeroes=3Don=
,format=3Draw" \
> > >   -device "nvme-ns,id=3Dnvm-1,drive=3Dnvm-1,bus=3Dnvme0,nsid=3D1,driv=
e=3Dnull,logical_block_size=3D4096,physical_block_size=3D4096" \
> > >   -pidfile "/home/kbj/work/vol/machines/run/null/pidfile" \
> > >   -kernel "/home/kbj/work/src/kernel/linux/arch/x86_64/boot/bzImage" \
> > >   -append "root=3D/dev/vda1 console=3DttyS0,115200 audit=3D0 intel_io=
mmu=3Don" \
> > >   -virtfs "local,path=3D/home/kbj/work/src/kernel/linux,security_mode=
l=3Dnone,readonly=3Don,mount_tag=3Dkernel_dir" \
> > >   -serial "mon:stdio" \
> > >   -d "guest_errors" \
> > >   -D "/home/kbj/work/vol/machines/log/null/qemu.log" \
> > >   -trace "pci_nvme*"
> >=20
> > Alright. It was *some* config issue with my kernel. Reverted to a
> > defconfig + requirements and the issue went away.
> >=20
>=20
> And it went away because I didn't include iommu support in that kernel (a=
nd its
> not enabled by default on the stock OS kernel).
>=20
> > I'll try to track down what happended, but doesnt look like qemu is at
> > fault here.
>=20
> OK. So.
>=20
> I can continue to reproduce this if the machine has a virtual intel iommu
> enabled. And it only happens when this commit is applied.
>=20
> I even backported this patch (and the shadow doorbell patch) to v7.0 and =
v6.2
> (i.e. no SRIOV or CC logic changes that could be buggy) and it still exhi=
bits
> this behavior. Sometimes QEMU coredumps on poweroff and I managed to grab=
 one:
>=20
> Program terminated with signal SIGSEGV, Segmentation fault.
> #0  nvme_process_sq (opaque=3D0x556329708110) at ../hw/nvme/ctrl.c:5720
> 5720   NvmeCQueue *cq =3D n->cq[sq->cqid];
> [Current thread is 1 (Thread 0x7f7363553cc0 (LWP 2554896))]
> (gdb) bt
> #0  nvme_process_sq (opaque=3D0x556329708110) at ../hw/nvme/ctrl.c:5720
> #1  0x0000556326e82e28 in nvme_sq_notifier (e=3D0x556329708148) at ../hw/=
nvme/ctrl.c:3993
> #2  0x000055632738396a in aio_dispatch_handler (ctx=3D0x5563291c3160, nod=
e=3D0x55632a228b60) at ../util/aio-posix.c:329
> #3  0x0000556327383b22 in aio_dispatch_handlers (ctx=3D0x5563291c3160) at=
 ../util/aio-posix.c:372
> #4  0x0000556327383b78 in aio_dispatch (ctx=3D0x5563291c3160) at ../util/=
aio-posix.c:382
> #5  0x000055632739d748 in aio_ctx_dispatch (source=3D0x5563291c3160, call=
back=3D0x0, user_data=3D0x0) at ../util/async.c:311
> #6  0x00007f7369398163 in g_main_context_dispatch () at /usr/lib64/libgli=
b-2.0.so.0
> #7  0x00005563273af279 in glib_pollfds_poll () at ../util/main-loop.c:232
> #8  0x00005563273af2f6 in os_host_main_loop_wait (timeout=3D0x1dbe22c0) a=
t ../util/main-loop.c:255
> #9  0x00005563273af404 in main_loop_wait (nonblocking=3D0x0) at ../util/m=
ain-loop.c:531
> #10 0x00005563270714d9 in qemu_main_loop () at ../softmmu/runstate.c:726
> #11 0x0000556326c7ea46 in main (argc=3D0x2e, argv=3D0x7ffc6977f198, envp=
=3D0x7ffc6977f310) at ../softmmu/main.c:50
>=20
> At this point, there should not be any CQ/SQs (I detached the device from=
 the
> kernel driver which deletes all queues and bound it to vfio-pci instead),=
 but
> somehow a stale notifier is called on poweroff and the queue is bogus, ca=
using
> the segfault.
>=20
> (gdb) p cq->cqid
> $2 =3D 0x7880
>=20
> My guess would be that we are not cleaning up the notifier properly. Curr=
ently
> we do this
>=20
>     if (cq->ioeventfd_enabled) {
>         memory_region_del_eventfd(&n->iomem,
>                                   0x1000 + offset, 4, false, 0, &cq->noti=
fier);
>         event_notifier_cleanup(&cq->notifier);
>     }
>=20
>=20
> Any ioeventfd experts that has some insights into what we are doing
> wrong here? Something we need to flush? I tried with a test_and_clear on
> the eventfd but that didnt do the trick.
>=20
> I think we'd need to revert this until we can track down what is going wr=
ong.

One more thing - I now also triggered the coredump with just a `modprobe
vfio-pci` following a `nvme reset /dev/nvme0`.

Similar backtrace.

--hLN4B82/tHxwgKjk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLf0LEACgkQTeGvMW1P
Dek1Ywf/dzJKQL3sUWXfIacODblE/awEjMBn4gj0g7OVOX7x2kqALn4COhXqm8nz
SR9o2PAdFWzZ8exalI54aVd1IbrmqKJLiz6jpTxj9VNsVeccqOhQMOt74GrcjfXR
h7TT/4MnDfLyhDWLPR0VXdw1u6tINrh5zW58IG95lCAInOFtkgZvkBmE8Kb0zJDN
MzYMtMPO68TwVq1VXyFzZu30r+77Iez10bvqyF+nwS6/n6Ubff0fJsERUzm4vqGi
LixpqgRCZHb+Xz6IjZtIXBAdgKiAxQU+VwVbnD4iiLkeF7RFr9IJbaaDLCLST+kl
7KHM1RtpUHLTuYHN130vLfEoNJLw/Q==
=kL+6
-----END PGP SIGNATURE-----

--hLN4B82/tHxwgKjk--

