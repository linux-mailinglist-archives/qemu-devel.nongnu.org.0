Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33005812DB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 14:10:53 +0200 (CEST)
Received: from localhost ([::1]:47764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGJOk-0005gj-Kq
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 08:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oGJMM-0003Pv-4A
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 08:08:22 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:45491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oGJMI-0005QZ-Li
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 08:08:21 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B3B583200977;
 Tue, 26 Jul 2022 08:08:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 26 Jul 2022 08:08:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1658837295; x=1658923695; bh=58
 l6R2f7INDs7+d7GwW7Z/fvrfz4C/6iDQqY3oWhHu8=; b=vAJYODDADRQ+ltjbLx
 iby7WfjYYLWPm/98vG2/roptDBdGHd/F0uP0HHeqZaWa005OuwNrNp7wljmoPqIq
 BF/TpikYnQKQDsyw2AGGJItSgBbQNkMOqaz9aRD32kaxe7yRoi0lL5y5Wqm//b62
 at4BvWYltXf96o5V3aym9O5gqXmmkxrE/Nq08WB6Nwk9GemfePazr7LcBLQUBDlh
 vIGrdi0RkBjLeQttQ4mJbw55ST4VwCp3RpnJp8WuiaVkDRKRGoYUb+K2yTyQIHJ1
 QfBKRfOyqgDB7BsamNRDRi9pi3s9f5pwy5pymeKZJvDEJ35ta9BkhJj9Zls6C19m
 DwUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1658837295; x=1658923695; bh=58l6R2f7INDs7+d7GwW7Z/fvrfz4
 C/6iDQqY3oWhHu8=; b=OJeOp/r2dvMcdN4u5WDj2QKuMMkhncLIG2keHtQkDjg+
 TQL0q2oHr5C9otQwPcQydGQqpCB245mXh4OSufLfiQ3d8kv8LOQ2pdVv41/6P6UK
 zNhgaQR3DaocB1xLYU4CrJJmgKx88Fh5I8mO9F9SY/EDC0Ox+IznfrAG1jlC9CNr
 W5m9U87fYR9QwfatVIhywivDfxcCiwjkty7q+ym0YwnUiZVAv1KMZZgfbTFKg2I1
 YF/ciETk7VtAe1UA6fUiJwToRyyEeL7nEOsROyKnWlDG/uYuOLkaYKwWaqSRPmXP
 /08UIZDX7O2vofI0IW+i0Qw/7CRJ1rNtuPAYeBQbNw==
X-ME-Sender: <xms:LtnfYtuqs0BUHd9dP9qiIHu1TtlPQHYwCYsDI5ZEZ8j-rTJVXr51MQ>
 <xme:LtnfYmed2qsgzO3Pv24ApEoqUHpTbE6zrfoyHr8iJnSX4IzmGN6BfNTVKzizKzu35
 DgPwcGenIfdhS356Pk>
X-ME-Received: <xmr:LtnfYgzn0_kxDv9x54wK4nIlikdkH_uD9OR7Mh1j3utYJftjgABGewvT7Pf23wtNq3obmQTGSnisg4K91LV6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddutddggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepkeeiffejgfeukeehvdegfeeuheehvdfgheelkedugffgjeevveeiheehleeh
 jedunecuffhomhgrihhnpegtthhrlhdrtgifnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:LtnfYkOUwWwf9r7peKW567VEjqag84EVZuhQ8-nYgBUU7mGrTA-Tqw>
 <xmx:LtnfYt8WqD0YlPas3YmXkj0eB2hcM04GjMK0njd6sUx4E4gUxZRm9Q>
 <xmx:LtnfYkWzmD32tm_R3xKhR9gNpfrl8XnWpupis89o_ufFM0_jr39V3w>
 <xmx:L9nfYglCwylrhw7qlrCc8J8dhOCU11bkHZQMYg58YiZyUrR4CTLCRw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Jul 2022 08:08:12 -0400 (EDT)
Date: Tue, 26 Jul 2022 14:08:09 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
Message-ID: <Yt/ZKVHjSTTt08MV@apples>
References: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
 <Yt8DWWg8qPLxL0fk@apples>
 <D12147BE-7F7A-4F41-9317-765F7EB2E971@ict.ac.cn>
 <Yt+avxgBxcwrxYgi@apples>
 <869047CA-DD0A-45D1-9DBA-2BA1A3E00ADF@ict.ac.cn>
 <Yt+xpMzwRWvn3QqR@apples> <Yt+9Spzi17LRRexQ@apples>
 <Yt/O8+n1pf3SRR7e@apples> <Yt/Qs5PelXjX8E1v@apples>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RzXfZSZLUbwY05fT"
Content-Disposition: inline
In-Reply-To: <Yt/Qs5PelXjX8E1v@apples>
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


--RzXfZSZLUbwY05fT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 26 13:32, Klaus Jensen wrote:
> On Jul 26 13:24, Klaus Jensen wrote:
> > On Jul 26 12:09, Klaus Jensen wrote:
> > > On Jul 26 11:19, Klaus Jensen wrote:
> > > > On Jul 26 15:55, Jinhao Fan wrote:
> > > > > at 3:41 PM, Klaus Jensen <its@irrelevant.dk> wrote:
> > > > >=20
> > > > > > On Jul 26 15:35, Jinhao Fan wrote:
> > > > > >> at 4:55 AM, Klaus Jensen <its@irrelevant.dk> wrote:
> > > > > >>=20
> > > > > >>> We have a regression following this patch that we need to add=
ress.
> > > > > >>>=20
> > > > > >>> With this patch, issuing a reset on the device (`nvme reset /=
dev/nvme0`
> > > > > >>> will do the trick) causes QEMU to hog my host cpu at 100%.
> > > > > >>>=20
> > > > > >>> I'm still not sure what causes this. The trace output is a bit
> > > > > >>> inconclusive still.
> > > > > >>>=20
> > > > > >>> I'll keep looking into it.
> > > > > >>=20
> > > > > >> I cannot reproduce this bug. I just start the VM and used `nvm=
e reset
> > > > > >> /dev/nvme0`. Did you do anything before the reset?
> > > > > >=20
> > > > > > Interesting and thanks for checking! Looks like a kernel issue =
then!
> > > > > >=20
> > > > > > I remember that I'm using a dev branch (nvme-v5.20) of the kern=
el and
> > > > > > reverting to a stock OS kernel did not produce the bug.
> > > > >=20
> > > > > I=E2=80=99m using 5.19-rc4 which I pulled from linux-next on Jul =
1. It works ok on
> > > > > my machine.
> > > >=20
> > > > Interesting. I can reproduce on 5.19-rc4 from torvalds tree. Can you
> > > > drop your qemu command line here?
> > > >=20
> > > > This is mine.
> > > >=20
> > > > /home/kbj/work/src/qemu/build/x86_64-softmmu/qemu-system-x86_64 \
> > > >   -nodefaults \
> > > >   -display "none" \
> > > >   -machine "q35,accel=3Dkvm,kernel-irqchip=3Dsplit" \
> > > >   -cpu "host" \
> > > >   -smp "4" \
> > > >   -m "8G" \
> > > >   -device "intel-iommu" \
> > > >   -netdev "user,id=3Dnet0,hostfwd=3Dtcp::2222-:22" \
> > > >   -device "virtio-net-pci,netdev=3Dnet0" \
> > > >   -device "virtio-rng-pci" \
> > > >   -drive "id=3Dboot,file=3D/home/kbj/work/vol/machines/img/nvme.qco=
w2,format=3Dqcow2,if=3Dvirtio,discard=3Dunmap,media=3Ddisk,read-only=3Dno" \
> > > >   -device "pcie-root-port,id=3Dpcie_root_port1,chassis=3D1,slot=3D0=
" \
> > > >   -device "nvme,id=3Dnvme0,serial=3Ddeadbeef,bus=3Dpcie_root_port1,=
mdts=3D7" \
> > > >   -drive "id=3Dnull,if=3Dnone,file=3Dnull-co://,file.read-zeroes=3D=
on,format=3Draw" \
> > > >   -device "nvme-ns,id=3Dnvm-1,drive=3Dnvm-1,bus=3Dnvme0,nsid=3D1,dr=
ive=3Dnull,logical_block_size=3D4096,physical_block_size=3D4096" \
> > > >   -pidfile "/home/kbj/work/vol/machines/run/null/pidfile" \
> > > >   -kernel "/home/kbj/work/src/kernel/linux/arch/x86_64/boot/bzImage=
" \
> > > >   -append "root=3D/dev/vda1 console=3DttyS0,115200 audit=3D0 intel_=
iommu=3Don" \
> > > >   -virtfs "local,path=3D/home/kbj/work/src/kernel/linux,security_mo=
del=3Dnone,readonly=3Don,mount_tag=3Dkernel_dir" \
> > > >   -serial "mon:stdio" \
> > > >   -d "guest_errors" \
> > > >   -D "/home/kbj/work/vol/machines/log/null/qemu.log" \
> > > >   -trace "pci_nvme*"
> > >=20
> > > Alright. It was *some* config issue with my kernel. Reverted to a
> > > defconfig + requirements and the issue went away.
> > >=20
> >=20
> > And it went away because I didn't include iommu support in that kernel =
(and its
> > not enabled by default on the stock OS kernel).
> >=20
> > > I'll try to track down what happended, but doesnt look like qemu is at
> > > fault here.
> >=20
> > OK. So.
> >=20
> > I can continue to reproduce this if the machine has a virtual intel iom=
mu
> > enabled. And it only happens when this commit is applied.
> >=20
> > I even backported this patch (and the shadow doorbell patch) to v7.0 an=
d v6.2
> > (i.e. no SRIOV or CC logic changes that could be buggy) and it still ex=
hibits
> > this behavior. Sometimes QEMU coredumps on poweroff and I managed to gr=
ab one:
> >=20
> > Program terminated with signal SIGSEGV, Segmentation fault.
> > #0  nvme_process_sq (opaque=3D0x556329708110) at ../hw/nvme/ctrl.c:5720
> > 5720   NvmeCQueue *cq =3D n->cq[sq->cqid];
> > [Current thread is 1 (Thread 0x7f7363553cc0 (LWP 2554896))]
> > (gdb) bt
> > #0  nvme_process_sq (opaque=3D0x556329708110) at ../hw/nvme/ctrl.c:5720
> > #1  0x0000556326e82e28 in nvme_sq_notifier (e=3D0x556329708148) at ../h=
w/nvme/ctrl.c:3993
> > #2  0x000055632738396a in aio_dispatch_handler (ctx=3D0x5563291c3160, n=
ode=3D0x55632a228b60) at ../util/aio-posix.c:329
> > #3  0x0000556327383b22 in aio_dispatch_handlers (ctx=3D0x5563291c3160) =
at ../util/aio-posix.c:372
> > #4  0x0000556327383b78 in aio_dispatch (ctx=3D0x5563291c3160) at ../uti=
l/aio-posix.c:382
> > #5  0x000055632739d748 in aio_ctx_dispatch (source=3D0x5563291c3160, ca=
llback=3D0x0, user_data=3D0x0) at ../util/async.c:311
> > #6  0x00007f7369398163 in g_main_context_dispatch () at /usr/lib64/libg=
lib-2.0.so.0
> > #7  0x00005563273af279 in glib_pollfds_poll () at ../util/main-loop.c:2=
32
> > #8  0x00005563273af2f6 in os_host_main_loop_wait (timeout=3D0x1dbe22c0)=
 at ../util/main-loop.c:255
> > #9  0x00005563273af404 in main_loop_wait (nonblocking=3D0x0) at ../util=
/main-loop.c:531
> > #10 0x00005563270714d9 in qemu_main_loop () at ../softmmu/runstate.c:726
> > #11 0x0000556326c7ea46 in main (argc=3D0x2e, argv=3D0x7ffc6977f198, env=
p=3D0x7ffc6977f310) at ../softmmu/main.c:50
> >=20
> > At this point, there should not be any CQ/SQs (I detached the device fr=
om the
> > kernel driver which deletes all queues and bound it to vfio-pci instead=
), but
> > somehow a stale notifier is called on poweroff and the queue is bogus, =
causing
> > the segfault.
> >=20
> > (gdb) p cq->cqid
> > $2 =3D 0x7880
> >=20
> > My guess would be that we are not cleaning up the notifier properly. Cu=
rrently
> > we do this
> >=20
> >     if (cq->ioeventfd_enabled) {
> >         memory_region_del_eventfd(&n->iomem,
> >                                   0x1000 + offset, 4, false, 0, &cq->no=
tifier);
> >         event_notifier_cleanup(&cq->notifier);
> >     }
> >=20
> >=20
> > Any ioeventfd experts that has some insights into what we are doing
> > wrong here? Something we need to flush? I tried with a test_and_clear on
> > the eventfd but that didnt do the trick.
> >=20
> > I think we'd need to revert this until we can track down what is going =
wrong.
>=20
> One more thing - I now also triggered the coredump with just a `modprobe
> vfio-pci` following a `nvme reset /dev/nvme0`.
>=20
> Similar backtrace.

Alright. Forget about the iommu, that was just a coincidence.

This patch seems to fix it. I guess it is the
event_notifier_set_handler(..., NULL) that does the trick, but I'd like
to understand why ;)


diff --git i/hw/nvme/ctrl.c w/hw/nvme/ctrl.c
index 533ad14e7a61..3bc3c6bfbe78 100644
--- i/hw/nvme/ctrl.c
+++ w/hw/nvme/ctrl.c
@@ -4238,7 +4238,9 @@ static void nvme_cq_notifier(EventNotifier *e)
     NvmeCQueue *cq =3D container_of(e, NvmeCQueue, notifier);
     NvmeCtrl *n =3D cq->ctrl;
=20
-    event_notifier_test_and_clear(&cq->notifier);
+    if (!event_notifier_test_and_clear(e)) {
+        return;
+    }
=20
     nvme_update_cq_head(cq);
=20
@@ -4275,7 +4277,9 @@ static void nvme_sq_notifier(EventNotifier *e)
 {
     NvmeSQueue *sq =3D container_of(e, NvmeSQueue, notifier);
=20
-    event_notifier_test_and_clear(&sq->notifier);
+    if (!event_notifier_test_and_clear(e)) {
+        return;
+    }
=20
     nvme_process_sq(sq);
 }
@@ -4307,6 +4311,8 @@ static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
     if (sq->ioeventfd_enabled) {
         memory_region_del_eventfd(&n->iomem,
                                   0x1000 + offset, 4, false, 0, &sq->notif=
ier);
+        event_notifier_set_handler(&sq->notifier, NULL);
+        nvme_sq_notifier(&sq->notifier);
         event_notifier_cleanup(&sq->notifier);
     }
     g_free(sq->io_req);
@@ -4697,6 +4703,8 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
     if (cq->ioeventfd_enabled) {
         memory_region_del_eventfd(&n->iomem,
                                   0x1000 + offset, 4, false, 0, &cq->notif=
ier);
+        event_notifier_set_handler(&cq->notifier, NULL);
+        nvme_cq_notifier(&cq->notifier);
         event_notifier_cleanup(&cq->notifier);
     }
     if (msix_enabled(&n->parent_obj)) {

--RzXfZSZLUbwY05fT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLf2SQACgkQTeGvMW1P
DelbWQf/fROq2EKxcejSDy2M3iGhWNLKz6/BzG+VME9zGtFdAX0/aSxZ0VAiYmtv
DKODJ6EHEiYfSs3ggOFlIgpFscm5OX7AOGRVnKOAzv33OFcHX1RHI5ZkuU9G6zcK
BBtqK8VH2a+z17TeIsiTLkRkuCZ5KReue+ZRV9aFXWrXQt8K52HyZiz1e5fAjdmw
xghXyjAIvmfQBNzgA+T6a8hJjhKYqWMLCX2IJ4MripNrnyLRQv99UkGa3XvFXQEw
i/mI8RURsGkCH1fcah/Kyrtcz4vwMozGmMSZFH0YgbWI0MicJq94PASiakESKm/2
hWbJqjUd9NcDfm+j3fTM3x9vWAHBAQ==
=pz51
-----END PGP SIGNATURE-----

--RzXfZSZLUbwY05fT--

