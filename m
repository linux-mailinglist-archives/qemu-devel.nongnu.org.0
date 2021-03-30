Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E1C34E57D
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 12:31:48 +0200 (CEST)
Received: from localhost ([::1]:57856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRBex-0003mD-6p
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 06:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lRBcz-0003Dd-0K; Tue, 30 Mar 2021 06:29:41 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:34431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lRBcx-0003gT-8G; Tue, 30 Mar 2021 06:29:40 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.90])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 66D8895D98BE;
 Tue, 30 Mar 2021 12:29:34 +0200 (CEST)
Received: from kaod.org (37.59.142.99) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 30 Mar
 2021 12:29:33 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0033a4169ad-b92d-43cd-ab3f-30c9296730fc,
 ACC3036D4A0BACA70991A0E48D5F19CB1CCAE693) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 30 Mar 2021 12:29:32 +0200
From: Greg Kurz <groug@kaod.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC 4/8] virtio-pci: Batch add/del ioeventfds in a single MR
 transaction
Message-ID: <20210330122932.13d83c0b@bahia.lan>
In-Reply-To: <YGINWHUDN0hw/92j@stefanha-x1.localdomain>
References: <20210325150735.1098387-1-groug@kaod.org>
 <20210325150735.1098387-5-groug@kaod.org>
 <YGINWHUDN0hw/92j@stefanha-x1.localdomain>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_sOrxax2F4DzRDyoI.YPBlH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 4574ce3a-ff3f-4cd3-88f8-3117eac771ab
X-Ovh-Tracer-Id: 18270540741800466735
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeitddgfedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtreerredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheplefggfefueegudegkeevieevveejfffhuddvgeffteekieevueefgfeltdfgieetnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--Sig_/_sOrxax2F4DzRDyoI.YPBlH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Mar 2021 18:24:40 +0100
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Thu, Mar 25, 2021 at 04:07:31PM +0100, Greg Kurz wrote:
> > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > index 1b1942d521cc..0279e5671bcb 100644
> > --- a/softmmu/memory.c
> > +++ b/softmmu/memory.c
> > @@ -2368,7 +2368,7 @@ void memory_region_add_eventfd_full(MemoryRegion =
*mr,
> >      if (size) {
> >          adjust_endianness(mr, &mrfd.data, size_memop(size) | MO_TE);
> >      }
> > -    if (transaction) {
> > +    if (!transaction) {
> >          memory_region_transaction_begin();
> >      }
> >      for (i =3D 0; i < mr->ioeventfd_nb; ++i) {
> > @@ -2383,7 +2383,7 @@ void memory_region_add_eventfd_full(MemoryRegion =
*mr,
> >              sizeof(*mr->ioeventfds) * (mr->ioeventfd_nb-1 - i));
> >      mr->ioeventfds[i] =3D mrfd;
> >      ioeventfd_update_pending |=3D mr->enabled;
> > -    if (transaction) {
> > +    if (!transaction) {
> >          memory_region_transaction_commit();
> >      }
>=20
> Looks like these two hunks belong in a previous patch.

And they are actually wrong... we *do* want a nested
transaction if 'transaction' is true :) This is a
leftover I thought I had removed but obviously not...

--Sig_/_sOrxax2F4DzRDyoI.YPBlH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmBi/YwACgkQcdTV5YIv
c9aQ5hAAlNkfA0e3kywcL4dMEy3Lj+9QtNcwy7nI441l2JMwryr1dDGEpZsZpBXK
sylIj56OAh160HculAgkzpmxo1jTFouMPF0NFp9JfrTRTce+tj7GFFtT/Csmbt/G
Can75W9r+Ay+DX8sNrJAODbI1RJ/scnHbmfu4uM9BBKlG50styycrs5dfENTgK7b
K6o0HKdnUXKIMByTSb37V30G50BCVd2VD3qXkSdRkBGWixt8kXf0CPnUMTP9jbbQ
FZKRcrjZlekdsYlUO9NE6YoqvMRgUzn62sAcqrPO+qlyrex/yKhQ2950o7p5MkTy
KrQgr5TTGMfcL1cC8bBqCEvKp6zFe21brNcmSoMgyN0oJbegEi5DlUwwLuvYU+c3
qvuVfjLHFE642UfOM/g1JaR8eYTAmg7wj5bIUdBFYN1k9urQY/IlTCY5rKmaMsq+
UFuTFpMt7N/P7SH+SZ6AYgrfkjhbKVG+jNSeFMLFnifNpzfILGOs7KDthkinsSrv
Wm4NMRgKklvKDGlZjR7wFFu2ks3PFgCEPY6+/Jf9TyII0L76jCvuTGzXaIbF/7t7
Zad2F0vIr2TS5J3tfaGa69Y8e4OVE8s5eduurOY4k6e4vbvOTqIZH9zhOGrzfxty
t9UKyIjm+lnnZIPu/2FMYsKsMe8aeUMCOnPfOWtdB6QmJAu3Dcc=
=0Xnd
-----END PGP SIGNATURE-----

--Sig_/_sOrxax2F4DzRDyoI.YPBlH--

