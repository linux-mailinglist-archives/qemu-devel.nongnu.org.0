Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D883534E8D1
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 15:18:14 +0200 (CEST)
Received: from localhost ([::1]:50320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lREG5-00033e-OP
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 09:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lREDl-00028m-Vj
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:15:50 -0400
Received: from 4.mo52.mail-out.ovh.net ([178.33.43.201]:54298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lREDd-0006Uj-NY
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:15:49 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.76])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id AD95A255E7B;
 Tue, 30 Mar 2021 15:15:30 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 30 Mar
 2021 15:15:29 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003d3ce4b5a-2f09-4139-9779-16dda1179bd0,
 ACC3036D4A0BACA70991A0E48D5F19CB1CCAE693) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 30 Mar 2021 15:15:27 +0200
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC 0/8] virtio: Improve boot time of virtio-scsi-pci and
 virtio-blk-pci
Message-ID: <20210330151527.0b5d2870@bahia.lan>
In-Reply-To: <YGIP1HKa5NsHqnj7@stefanha-x1.localdomain>
References: <20210325150735.1098387-1-groug@kaod.org>
 <YGIP1HKa5NsHqnj7@stefanha-x1.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/33Dg3Tz5.8fdq2m7nQDQbF5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: ddc81369-0295-4225-99d5-5380f1e6e78e
X-Ovh-Tracer-Id: 2626161534636300591
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeitddgieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtreerredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheplefggfefueegudegkeevieevveejfffhuddvgeffteekieevueefgfeltdfgieetnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.33.43.201; envelope-from=groug@kaod.org;
 helo=4.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/33Dg3Tz5.8fdq2m7nQDQbF5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Mar 2021 18:35:16 +0100
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Thu, Mar 25, 2021 at 04:07:27PM +0100, Greg Kurz wrote:
> > Now that virtio-scsi-pci and virtio-blk-pci map 1 virtqueue per vCPU,
> > a serious slow down may be observed on setups with a big enough number
> > of vCPUs.
> >=20
> > Exemple with a pseries guest on a bi-POWER9 socket system (128 HW threa=
ds):
> >=20
> > 1		0m20.922s	0m21.346s
> > 2		0m21.230s	0m20.350s
> > 4		0m21.761s	0m20.997s
> > 8		0m22.770s	0m20.051s
> > 16		0m22.038s	0m19.994s
> > 32		0m22.928s	0m20.803s
> > 64		0m26.583s	0m22.953s
> > 128		0m41.273s	0m32.333s
> > 256		2m4.727s 	1m16.924s
> > 384		6m5.563s 	3m26.186s
> >=20
> > Both perf and gprof indicate that QEMU is hogging CPUs when setting up
> > the ioeventfds:
> >=20
> >  67.88%  swapper         [kernel.kallsyms]  [k] power_pmu_enable
> >   9.47%  qemu-kvm        [kernel.kallsyms]  [k] smp_call_function_single
> >   8.64%  qemu-kvm        [kernel.kallsyms]  [k] power_pmu_enable
> > =3D>2.79%  qemu-kvm        qemu-kvm           [.] memory_region_ioevent=
fd_before
> > =3D>2.12%  qemu-kvm        qemu-kvm           [.] address_space_update_=
ioeventfds
> >   0.56%  kworker/8:0-mm  [kernel.kallsyms]  [k] smp_call_function_single
> >=20
> > address_space_update_ioeventfds() is called when committing an MR
> > transaction, i.e. for each ioeventfd with the current code base,
> > and it internally loops on all ioventfds:
> >=20
> > static void address_space_update_ioeventfds(AddressSpace *as)
> > {
> > [...]
> >     FOR_EACH_FLAT_RANGE(fr, view) {
> >         for (i =3D 0; i < fr->mr->ioeventfd_nb; ++i) {
> >=20
> > This means that the setup of ioeventfds for these devices has
> > quadratic time complexity.
> >=20
> > This series introduce generic APIs to allow batch creation and deletion
> > of ioeventfds, and converts virtio-blk and virtio-scsi to use them. This
> > greatly improves the numbers:
> >=20
> > 1		0m21.271s	0m22.076s
> > 2		0m20.912s	0m19.716s
> > 4		0m20.508s	0m19.310s
> > 8		0m21.374s	0m20.273s
> > 16		0m21.559s	0m21.374s
> > 32		0m22.532s	0m21.271s
> > 64		0m26.550s	0m22.007s
> > 128		0m29.115s	0m27.446s
> > 256		0m44.752s	0m41.004s
> > 384		1m2.884s	0m58.023s
>=20
> Excellent numbers!
>=20
> I wonder if the code can be simplified since
> memory_region_transaction_begin/end() supports nesting. Why not call
> them directly from the device model instead of introducing callbacks in
> core virtio and virtio-pci code?
>=20

It seems a bit awkward that the device model should assume a memory
transaction is needed to setup host notifiers, which are ioeventfds
under the hood but the device doesn't know that.

> Also, do you think there are other opportunities to have a long
> transaction to batch up machine init, device hotplug, etc? It's not
> clear to me when transactions must be ended. Clearly it's necessary to

The transaction *must* be ended before calling
virtio_bus_cleanup_host_notifier() because
address_space_add_del_ioeventfds(), called when
finishing the transaction, needs the "to-be-closed"
eventfds to be still open, otherwise the KVM_IOEVENTFD=20
ioctl() might fail with EBADF.

See this change in patch 3:

@@ -315,6 +338,10 @@ static void virtio_bus_unset_and_cleanup_host_notifier=
s(VirtioBusState *bus,
=20
     for (i =3D 0; i < nvqs; i++) {
         virtio_bus_set_host_notifier(bus, i + n_offset, false);
+    }
+    /* Let address_space_update_ioeventfds() run before closing ioeventfds=
 */
+    virtio_bus_set_host_notifier_commit(bus);
+    for (i =3D 0; i < nvqs; i++) {
         virtio_bus_cleanup_host_notifier(bus, i + n_offset);
     }
 }

Maybe I should provide more details why we're doing that ?

> end the transaction if we need to do something that depends on the
> MemoryRegion, eventfd, etc being updated. But most of the time there is
> no immediate need to end the transaction and more code could share the
> same transaction before we go back to the event loop or vcpu thread.
>=20

I can't tell for all scenarios that involve memory transactions but
it seems this is definitely not the case for ioeventfds : the rest
of the code expects the transaction to be complete.

> Stefan

Thanks for the review !

Cheers,

--
Greg

--Sig_/33Dg3Tz5.8fdq2m7nQDQbF5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmBjJG8ACgkQcdTV5YIv
c9YM2A/9Glc4WthxJuoY7ekmOVQ2O63QwD3w63pxWFUweTKbTM69yQbgzz1RBDQV
mE79uXNl4U0BPf98yIf28RdUO+DUCIhX+t0a38r+qKxvf3ho42mUmPwZLDkfSOKA
otDGpvvKOPUngv326vYO2pMpDatKr6gwJCSt+lEEj5b2ICEVrNEFHh+LQS5V7XOD
M+daIu++bSKvvvhNn6N/X9qhgp6xzSu7OCUp4ANzLj9gM38Zw9ehTDObDJC5HKhp
kVd89Jm5YIGJ97dMDICbsnitD70R7MLuhoz3gNp8IDdZdP7CCqmVw4WPqJ41x7NU
hwsTtiYmhBvgMaYzN8TDXZujLTxH384BbRKjZB7Q+MSRQPUCOuuBacdok8Kja49C
gAXWUTq9Ab8IltS0cVMvWxYuiq2LVYZlCBrCoDWyeW5iFP1s3Ncj3FNNx41xFUwD
Sn+kawA4iTslAvf8IIF6clGGeVHS6NQ6H6OvJwn/Ugm8/HytiS8xLSX5IJFUmleo
O05gf/zYvO4cDDR+8AZYKp0yTZ1w5/v0ZaU5Cakg2SLpnvzt/ShHVUIATVleGwaZ
lvI+r46+VfHW7uXT5KAsbcd6hFLhyjei28hp8Nk/CGDSy6SCF8jYuHTx3aqv5CX6
oUOrqfodAy2u+cLMBaMfHYv13d7M2dIMVdNjDj9ql9O815F0No4=
=j4cv
-----END PGP SIGNATURE-----

--Sig_/33Dg3Tz5.8fdq2m7nQDQbF5--

