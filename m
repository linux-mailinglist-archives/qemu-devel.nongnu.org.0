Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766682C66CF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 14:27:05 +0100 (CET)
Received: from localhost ([::1]:50850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kidmC-0007jt-CC
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 08:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kidkW-00076t-3h
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 08:25:20 -0500
Received: from 10.mo52.mail-out.ovh.net ([87.98.187.244]:53144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kidkO-0007SI-6C
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 08:25:19 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.240])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 6349B21C720;
 Fri, 27 Nov 2020 14:25:08 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 27 Nov
 2020 14:25:08 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0050e21cedc-6804-46b5-8a96-7be4511c5512,
 3F3A8B77B8A7D9894C8FBB5EF0C17793377DB79C) smtp.auth=groug@kaod.org
Date: Fri, 27 Nov 2020 14:25:06 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH for-6.0 4/9] spapr: Set compat mode in spapr_reset_vcpu()
Message-ID: <20201127142506.54c84afa@bahia.lan>
In-Reply-To: <20201127045916.GA172647@yekko.fritz.box>
References: <20201120234208.683521-1-groug@kaod.org>
 <20201120234208.683521-5-groug@kaod.org>
 <20201123051130.GL521467@yekko.fritz.box>
 <20201123125108.2118048e@bahia.lan>
 <20201125023947.GE521467@yekko.fritz.box>
 <20201125105105.05d25b1f@bahia.lan>
 <20201126045737.GA152349@yekko.fritz.box>
 <20201126101027.03f67ad5@bahia.lan>
 <20201127045916.GA172647@yekko.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ed/zb7gP2aoJCIY6A0QY9pk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 3bfa99e4-cef6-43a9-828e-a89f11f0faae
X-Ovh-Tracer-Id: 18317265585902164448
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudehgedgheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtreerredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheplefggfefueegudegkeevieevveejfffhuddvgeffteekieevueefgfeltdfgieetnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehimhgrmhhmvgguohesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=87.98.187.244; envelope-from=groug@kaod.org;
 helo=10.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/Ed/zb7gP2aoJCIY6A0QY9pk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 27 Nov 2020 15:59:16 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

[...]
> >=20
> > This can't happen AFAICT.
> >=20
> > (qemu) qom-get /machine/unattached/device[1] core-id
> > 0
> > (qemu) device_del /machine/unattached/device[1]
> > Error: Boot CPU core may not be unplugged
> >=20
> > commit 62be8b044adf47327ebefdefb25f28a40316ebd0
> > Author: Bharata B Rao <bharata@linux.vnet.ibm.com>
> > Date:   Wed Jul 27 10:44:42 2016 +0530
> >=20
> >     spapr: Prevent boot CPU core removal
>=20
> Oh yeah, I'd forgotten we did this.
>=20

Anyway, both you and Igor noted that this change is fragile, which
is true. So maybe we should just go on with the current behavior.

As mentioned in the changelog, one of the motivation to do this was
to get rid of the error path in spapr_core_plug() like other patches
in this series do for the other plug handlers. And I guess I should
do it like these other patches do : come up with a check in
spapr_core_pre_plug() that guarantees that ppc_set_compat() shouldn't
fail in spapr_core_plug() and can be passed &error_abort.

So I'll try to do just that. You can forget this patch.

--Sig_/Ed/zb7gP2aoJCIY6A0QY9pk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAl/A/jIACgkQcdTV5YIv
c9ZVTg//ayGQvNafiuMtXwC3ukpJW1EktRi9FHedn7chvuKdbePMLlRpM8OlsI13
Ok9ebSUC/US3J6NM6ghjVOUF9xNDmpdQlkiXCU0mOFeUM582M+29dehu04SWynHK
gYciDHsVWiDeyOpNIPQ/yMboKxfEOH86YYsHr8asOtV8FOBXZvHZS1Pk7VrolBqK
tT12noMg8aJqowyXq+Sj633/2wnN7wvcWj/OI8l8aq1H3bb60DWcqt/Z6AfwU2ac
Wz0tqhSJpKleXaG1pbgo1i8HUfJlhqhgyMODmr/GlQopWhzmn920+RpuemDdHq3c
IUEYx5T6ydeFy7Nio6St4urG4u9sPWvYvk/Y+bnGHgpjK3CCW37mcOwZwI9k/BiV
zMrah9nNbF9D+8jYuq/EDwUOBSAXQBJ8gZ8tE+/u8M6RX5X0aleAJSeqx/i/S3lh
68RnWm4ZQuhvzJOV0E625/eHNPx3gA3nC5aUPvoidPDxl6ySYI2QyhefOGu30Psk
zzwlesvmjU9aa+gzbV2I2Z5+J2KsNSksvC6Sz5lqP3CQP7+VO0cJD10HqMbL0lgG
JKFRRl031Ep2M1sLu3S2ckBW/cacGGWzcyQOuE8eo9m0auyRbmlXwX+4I7yEhm61
Xu9JJLiSwRW1cbRD/lhi6dnceeme6jesg9/5alJhUftmv30/BEs=
=2trh
-----END PGP SIGNATURE-----

--Sig_/Ed/zb7gP2aoJCIY6A0QY9pk--

