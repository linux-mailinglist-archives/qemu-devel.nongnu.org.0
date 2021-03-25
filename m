Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF00349B4D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 21:53:34 +0100 (CET)
Received: from localhost ([::1]:41494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPWz0-00036W-1d
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 16:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lPWxH-0001rn-R8
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 16:51:47 -0400
Received: from 1.mo51.mail-out.ovh.net ([178.32.121.110]:50188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lPWxF-0003he-Tk
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 16:51:47 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.177])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 72E20278751;
 Thu, 25 Mar 2021 21:51:41 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 25 Mar
 2021 21:51:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006b7f187ee-8337-45bd-9bd7-f1b087802930,
 9FF242228AEDA557CE571C504A609AA08406F586) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 25 Mar 2021 21:51:34 +0100
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC 0/8] virtio: Improve boot time of virtio-scsi-pci and
 virtio-blk-pci
Message-ID: <20210325215134.749779f5@bahia.lan>
In-Reply-To: <YFzLrn4SGjaIzC6p@stefanha-x1.localdomain>
References: <20210325150735.1098387-1-groug@kaod.org>
 <20210325130429-mutt-send-email-mst@kernel.org>
 <YFzLrn4SGjaIzC6p@stefanha-x1.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k_f13RqZZPy7HsbfwqoS7OE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: ae98e843-ce9b-4c3d-a784-0634a8a3c3c0
X-Ovh-Tracer-Id: 17860431699243997618
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudehtddgudeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtghisehgtderreertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekffefueeuhfevuedttdduueejvdffhffgvdetueduhfdvgefgvdeiuefgkeehueenucffohhmrghinheprhgvughhrghtrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehjrghsohifrghnghesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=178.32.121.110; envelope-from=groug@kaod.org;
 helo=1.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/k_f13RqZZPy7HsbfwqoS7OE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Mar 2021 17:43:10 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Thu, Mar 25, 2021 at 01:05:16PM -0400, Michael S. Tsirkin wrote:
> > On Thu, Mar 25, 2021 at 04:07:27PM +0100, Greg Kurz wrote:
> > > Now that virtio-scsi-pci and virtio-blk-pci map 1 virtqueue per vCPU,
> > > a serious slow down may be observed on setups with a big enough number
> > > of vCPUs.
> > >=20
> > > Exemple with a pseries guest on a bi-POWER9 socket system (128 HW thr=
eads):
> > >=20
> > > 1		0m20.922s	0m21.346s
> > > 2		0m21.230s	0m20.350s
> > > 4		0m21.761s	0m20.997s
> > > 8		0m22.770s	0m20.051s
> > > 16		0m22.038s	0m19.994s
> > > 32		0m22.928s	0m20.803s
> > > 64		0m26.583s	0m22.953s
> > > 128		0m41.273s	0m32.333s
> > > 256		2m4.727s 	1m16.924s
> > > 384		6m5.563s 	3m26.186s
> > >=20
> > > Both perf and gprof indicate that QEMU is hogging CPUs when setting up
> > > the ioeventfds:
> > >=20
> > >  67.88%  swapper         [kernel.kallsyms]  [k] power_pmu_enable
> > >   9.47%  qemu-kvm        [kernel.kallsyms]  [k] smp_call_function_sin=
gle
> > >   8.64%  qemu-kvm        [kernel.kallsyms]  [k] power_pmu_enable
> > > =3D>2.79%  qemu-kvm        qemu-kvm           [.] memory_region_ioeve=
ntfd_before
> > > =3D>2.12%  qemu-kvm        qemu-kvm           [.] address_space_updat=
e_ioeventfds
> > >   0.56%  kworker/8:0-mm  [kernel.kallsyms]  [k] smp_call_function_sin=
gle
> > >=20
> > > address_space_update_ioeventfds() is called when committing an MR
> > > transaction, i.e. for each ioeventfd with the current code base,
> > > and it internally loops on all ioventfds:
> > >=20
> > > static void address_space_update_ioeventfds(AddressSpace *as)
> > > {
> > > [...]
> > >     FOR_EACH_FLAT_RANGE(fr, view) {
> > >         for (i =3D 0; i < fr->mr->ioeventfd_nb; ++i) {
> > >=20
> > > This means that the setup of ioeventfds for these devices has
> > > quadratic time complexity.
> > >=20
> > > This series introduce generic APIs to allow batch creation and deleti=
on
> > > of ioeventfds, and converts virtio-blk and virtio-scsi to use them. T=
his
> > > greatly improves the numbers:
> > >=20
> > > 1		0m21.271s	0m22.076s
> > > 2		0m20.912s	0m19.716s
> > > 4		0m20.508s	0m19.310s
> > > 8		0m21.374s	0m20.273s
> > > 16		0m21.559s	0m21.374s
> > > 32		0m22.532s	0m21.271s
> > > 64		0m26.550s	0m22.007s
> > > 128		0m29.115s	0m27.446s
> > > 256		0m44.752s	0m41.004s
> > > 384		1m2.884s	0m58.023s
> > >=20
> > > The series deliberately spans over multiple subsystems for easier
> > > review and experimenting. It also does some preliminary fixes on
> > > the way. It is thus posted as an RFC for now, but if the general
> > > idea is acceptable, I guess a non-RFC could be posted and maybe
> > > extend the feature to some other devices that might suffer from
> > > similar scaling issues, e.g. vhost-scsi-pci, vhost-user-scsi-pci
> > > and vhost-user-blk-pci, even if I haven't checked.
> > >=20
> > > This should fix https://bugzilla.redhat.com/show_bug.cgi?id=3D1927108
> > > which reported the issue for virtio-scsi-pci.
> >=20
> >=20
> > Series looks ok from a quick look ...
> >=20
> > this is a regression isn't it?
> > So I guess we'll need that in 6.0 or revert the # of vqs
> > change for now ...
>=20
> Commit 9445e1e15e66c19e42bea942ba810db28052cd05 ("virtio-blk-pci:
> default num_queues to -smp N") was already released in QEMU 5.2.0. It is
> not a QEMU 6.0 regression.
>=20

Oh you're right, I've just checked and QEMU 5.2.0 has the same problem.

> I'll review this series on Monday.
>=20

Thanks !

> Stefan


--Sig_/k_f13RqZZPy7HsbfwqoS7OE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmBc99YACgkQcdTV5YIv
c9bP7w//VaOb6y6KsmSAPm2sIKfAjuSPxNm75PhnJnxajMuItSm/Q7XGBz3f5oCu
HneWuWYZGUzQm5nUMRpjECczDlXGFiq69b9oL/lWRPslV8RqEwOrF8xoPZjPygHX
upAzIDdY/aaBkodfG6sQ4jhd61Q2+lHPORV4LUzjMf6DgrkyOd2g9JMCFdSX82Ba
Rl9EbaBn4r777OWncMcyU88h+Inr5QHbkzENHWyfIY5/Sm6+YDNGRLHbOCjHb6HP
4PzzWm+8RsAuOsCm3XdQwQ2OF1qHHOSkRE480kB8NNGsg9aZ2GPT27sxJMjFwYE7
H1CiMluHS4UXivDsoDFc9/SDywQzSju9m+GGONso2B0mwTnMvPvdLX6KGOHdUlHg
V8FLanwPWxz7rtOAKDDZfXQZooqHHOWsH08ZAx/vTdKDOnNrtJPEY8G0egvyusD2
C+5LIr9eD2AZ5UY2z5KwYTUZ/4gKF3a2cVznmnBzE4U2mb/6EepqFuYSArsYM+UM
pVuz4M06fyTrN9hJi2rGdFJIYFvntqpzhwoMinZurJHrWPA1Od0FNQIIvXlLMTHO
bhtZ6lhsYt5cFZyj808YmJXYt9N1iDt5aLh7FE13o8ygolTkvJEYGynBG8fimaia
jM2qD3LZQF8wAV+2w45OfyTtZn918o5IKNkAnGFkv5o6nnSfwcA=
=fwFY
-----END PGP SIGNATURE-----

--Sig_/k_f13RqZZPy7HsbfwqoS7OE--

