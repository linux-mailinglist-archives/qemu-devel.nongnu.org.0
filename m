Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752732D57A3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:58:10 +0100 (CET)
Received: from localhost ([::1]:50434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knIi9-0005Wa-Gw
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1knIOL-0003nY-69
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:37:41 -0500
Received: from 3.mo52.mail-out.ovh.net ([178.33.254.192]:55825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1knIOI-00049Y-3O
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:37:40 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.58])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id B71F221C038;
 Thu, 10 Dec 2020 10:37:34 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 10 Dec
 2020 10:37:33 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00662ca1968-5ab0-4421-b397-4f0b40c3fdc8,
 7F90A86A4359BCD1ACB0618936AE64BD6AD86209) smtp.auth=groug@kaod.org
Date: Thu, 10 Dec 2020 10:37:32 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 6/6] target/ppc: Add mce_req_event() handler to
 PPCVirtualHypervisorClass
Message-ID: <20201210103732.0a82058d@bahia.lan>
In-Reply-To: <20201210035408.GN2555@yekko.fritz.box>
References: <20201209170052.1431440-1-groug@kaod.org>
 <20201209170052.1431440-7-groug@kaod.org>
 <20201210035408.GN2555@yekko.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8KcTpubHEbWTbfiwCSpTlxs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: d2f2ce5e-a093-4c50-bb5f-3c02b1dc7270
X-Ovh-Tracer-Id: 17032050842171644381
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtreerredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheplefggfefueegudegkeevieevveejfffhuddvgeffteekieevueefgfeltdfgieetnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqphhptgesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.33.254.192; envelope-from=groug@kaod.org;
 helo=3.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/8KcTpubHEbWTbfiwCSpTlxs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Dec 2020 14:54:08 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Dec 09, 2020 at 06:00:52PM +0100, Greg Kurz wrote:
> > kvm_handle_nmi() directly calls spapr_mce_req_event() which is machine
> > level code. Apart from being ugly, this forces spapr_mce_req_event()
> > to rely on qdev_get_machine() to get a pointer to the machine state.
> > This is a bit unfortunate since POWER CPUs have a backlink to the
> > virtual hypervisor, which happens to be the machine itself with
> > sPAPR.
> >=20
> > Turn spapr_mce_req_event() into a PPC virtual hypervisor operation,
> > and adapt kvm_handle_nmi() to call it as such.
> >=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
>=20
> I have somewhat mixed thoughts on this.  Putting it in vhyp makes a
> certain sense.  But on the other hand, the MCE event from KVM is an
> explicitly PAPR specific interface, so it can't really go to any other
> implementation.
>=20

True. Same thing goest for the hypercalls actually. So I guess it's
better to keep this dependency explicit, as long as we don't have
to support non-PAPR KVM guests. Please ignore this patch.

--Sig_/8KcTpubHEbWTbfiwCSpTlxs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAl/R7FwACgkQcdTV5YIv
c9bO6hAAo8y8Znf1FLoJxAIKFrPqRSHxUDsalBjLMaxn9Q4gABDiDnEqU1j7dAG2
2XmY6AEb7gqiubzWEge1G290WuBRGdqZTthTVs5CA22yTVA6aoVWeDsF68E5qZUE
1xytYDpvA0UVbmZIfvj9CDvEvpRyoOR4iHPYZdM74TKT6ie9eV48KWy+uyWTIsFc
NmWfRxmmQStvI2GG5LXRd2NE3vwTr12ZKWDK4XmLOCrMq/SISr/bgEwevOvmEr2M
ZurpgKDdClJgTADFHaLCtuXnJko+6DYZhfw+N+zv1NvCmhValaIdg5+r/fkGjxPw
Hi43SluKFckOT39JasJkqgbhHINNnCE8i5mJeJuyzs85dq6oE4lyCF1pcgXg9NHK
1/eu+q6MBpI5VdhQ1A2G6KYUTjNpLLInFCkaQBjWM6liy6jRNOMAwnp0tbIDbbjU
95nXGrohS+/DiiKuEvVAqr9hhaxlGNRI2pYejJR2j1D84dk5oHKoBxX0UoevLgvh
GHu//GSjALaj78vx9pyOMAHjtAdOsC4WoOYQeDV9wQagCHqykhGE6y1k9///6JKy
IHhdM95ZQqfEUtaT61k1G0IXljah/oimClKL9oIQtmHAn3kmtPYTEauk0t+5Mq4E
BcQuk1pSWtPSAt0jpn4DhkQKFEj4WSdRM/dtHzi9ZRpFcRHJAIY=
=lH+u
-----END PGP SIGNATURE-----

--Sig_/8KcTpubHEbWTbfiwCSpTlxs--

