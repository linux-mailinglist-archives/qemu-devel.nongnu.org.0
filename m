Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BB534F7B1
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 06:05:37 +0200 (CEST)
Received: from localhost ([::1]:44384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRS6q-0002F2-5U
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 00:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lRS5t-0001io-AO
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 00:04:37 -0400
Received: from 4.mo51.mail-out.ovh.net ([188.165.42.229]:46240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lRS5p-00060j-VO
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 00:04:37 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.244])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id BBF6227A551;
 Wed, 31 Mar 2021 06:04:29 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 31 Mar
 2021 06:04:28 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00151552a25-d509-4042-b49f-cfa522c3bd12,
 9D8442807461E38AC8E896D56D3346AE12FD8989) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 31 Mar 2021 06:04:27 +0200
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v5 02/10] target/ppc: Disconnect hflags from MSR
Message-ID: <20210331060427.16984110@bahia.lan>
In-Reply-To: <YGO9oklIrjN7O0f2@yekko.fritz.box>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-3-richard.henderson@linaro.org>
 <YFqBtsijRRcEBB/k@yekko.fritz.box>
 <20210329150522.1b00607d@bahia.lan>
 <d0221e19-6c8b-6cc3-c4aa-2d5fff4ecb8b@linaro.org>
 <YGKvDOCtfbj0avYF@yekko.fritz.box>
 <c368bcc2-3aa0-608e-c596-b7c9df1923e3@linaro.org>
 <YGO9oklIrjN7O0f2@yekko.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TfjWlERPwmcHOr_3O5Dj8_Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 86e2984c-3c7b-43df-8ac3-1bfe3f33fee6
X-Ovh-Tracer-Id: 17639755316255103395
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeiuddgjeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtfeerredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheptddtkeeitdeukeeihfeileelheeuheekkefhieejkeegffffffffheevtdfhueeinecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.42.229; envelope-from=groug@kaod.org;
 helo=4.mo51.mail-out.ovh.net
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/TfjWlERPwmcHOr_3O5Dj8_Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 31 Mar 2021 11:09:06 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Tue, Mar 30, 2021 at 08:01:13AM -0700, Richard Henderson wrote:
> > On 3/29/21 10:54 PM, David Gibson wrote:
> > >    B) Just the hflags patches from my / Richard's tree
> > >       https://gitlab.com/dgibson/qemu/-/pipelines/278497244
> >=20
> > Look closer at this one -- it's an s390x test that's failing:
> >=20

I've been seeing errors with s390x as well in CI but I couldn't
reproduce locally... and of course, now it seems I cannot
reproduce locally with ppc64abi32 either :-\

> > make: *** [/builds/dgibson/qemu/tests/Makefile.include:63:
> > run-tcg-tests-s390x-linux-user] Error 2
>=20
> Goldangit!  Good point.  Now I'm even more baffled as to how I wasn't
> able to reproduce on master, but was on different variants of my tree.
> A whole heap of bad luck, I guess.
>=20


--Sig_/TfjWlERPwmcHOr_3O5Dj8_Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmBj9MsACgkQcdTV5YIv
c9aDCg/+Kb0KEMuN31GEd1CmG/l3LcIWvNgyA/HV7Eqf41EHdrZj1JSOKpT20ZZx
mvjmv1d0NBhO4bNT7Aj+YGGpA4BPGr2PY21e+Z2e7ivHnuTT6GOtsRWxmGQpjRUO
LE1BVerrNk5Ot3ENpn4mhI2xcF42D+BfypihFg6RD7t31m5Asi4bIuRaSAqvQDMz
G3ELXQgR5z4JH5bjiWeOl9iZFH4AnxHnVYs+L/IEQcSIbdMLRb78R/5hGScyvxJ7
A0UQswUR2aV5PWimdgbZ109JYGgrHewMMJBiNQ5QlXNbPjwK6+srHCJaObAM2VM+
kNmzKaDdXanTRARBabiRNrmdO/g+ePFB/xWRY2WVE6qqgDLyXpwJd/LFAN4fH4GN
nZojjyt5BPw0PMmqvDGtaIkJY0/g+IQSKfFvBR3ilcuQBuRvtrc64QYR56moG0KP
sAwylNW7pXa9+RWDG9X61wwz2en3vtXWYriDNTwhjHmh7BobvpSMd+ZsTUe9rVaB
5gqmRGfwlMlMuWZeLvZ0P31tMTtF3IysvOgHT9ikKRxMXNsekpvxPyHMxHB2ZhXi
Huidw0+w5xaHv5ImFDhnWXrvT09ro6WlsGCDyvaRNVcP5KdFX+8xnjyUwlbYAP7q
HDdoM6rlV8U61GKAe0AR5HEY+RZq9WmvLih3JwFi5MwwCaP6SkA=
=6FIE
-----END PGP SIGNATURE-----

--Sig_/TfjWlERPwmcHOr_3O5Dj8_Z--

