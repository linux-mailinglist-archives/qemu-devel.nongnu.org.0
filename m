Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502074130EA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 11:47:45 +0200 (CEST)
Received: from localhost ([::1]:46814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mScNM-0003xm-7a
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 05:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mScEb-0008Kz-TE; Tue, 21 Sep 2021 05:38:43 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:33781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mScEX-000072-GO; Tue, 21 Sep 2021 05:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632217112;
 bh=Ze007ehXEkA5V8N29lUPvbArcpjsrAzcxYGOJmHAa/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WSaKE2RpTVRlx1KdSxQ99LMan92kcfcDNKQKTCDHMV4SySZt4v6AHPQITnn9teYTQ
 /ij2pPTe4tWv7MRZtFpfzFqO0Nyf96pZyapvtrL84WAwxBlNghq7PXMUyh/2korTqO
 oub9PaqL9Va0KuPjT+n9/3y91k0RgQj+GmrLnKx8=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4HDGZc1X8Dz9t10; Tue, 21 Sep 2021 19:38:32 +1000 (AEST)
Date: Tue, 21 Sep 2021 19:31:46 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RESEND PATCH 1/3] hw/intc: openpic: Correct the reset value of
 IPIDR for FSL chipset
Message-ID: <YUmmgie0uNg3ESZr@yekko>
References: <20210918032653.646370-1-bin.meng@windriver.com>
 <YUlQo68s9mxISwEs@yekko>
 <c329c9a4-0662-4a4f-70fc-b3eda07cb149@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="24Llks9Dz2oDPOes"
Content-Disposition: inline
In-Reply-To: <c329c9a4-0662-4a4f-70fc-b3eda07cb149@amsat.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Maarten Koning <maarten.koning@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--24Llks9Dz2oDPOes
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2021 at 10:13:36AM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 9/21/21 05:25, David Gibson wrote:
> > On Sat, Sep 18, 2021 at 11:26:51AM +0800, Bin Meng wrote:
> > > The reset value of IPIDR should be zero for Freescale chipset, per
> > > the following 2 manuals I checked:
> > >=20
> > > - P2020RM (https://www.nxp.com/webapp/Download?colCode=3DP2020RM)
> > > - P4080RM (https://www.nxp.com/webapp/Download?colCode=3DP4080RM)
> > >=20
> > > Currently it is set to 1, which leaves the IPI enabled on core 0
> > > after power-on reset. Such may cause unexpected interrupt to be
> > > delivered to core 0 if the IPI is triggered from core 0 to other
> > > cores later.
> > >=20
> > > Fixes: ffd5e9fe0276 ("openpic: Reset IRQ source private members")
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/584
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >=20
> > Since these patches are very simple and look sensible, I've applied
> > them to ppc-for-6.2.
> >=20
> > However, you should note that Greg and I are both moving into other
> > areas and don't have much capacity for ppc maintainership any more.
> > Therefore I'll shortly be sending some MAINTAINERS updates moving
> > openpic (amongst other things) to "Orphan" status.
>=20
> I'm not trying to force Bin to become (yet) another maintainer,
> but from his previous contributions, he demonstrated a very good
> knowledge of embedded PowerPC ISA & chipsets, his patches have good
> quality and description, and he is consistent over time in his
> contributions. So if he is interested, I'd vouch for him as a
> maintainer for embedded ppc. Now up to him, his time and/or employer
> :)

Ok, works for me if he's interested.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--24Llks9Dz2oDPOes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFJpoAACgkQbDjKyiDZ
s5Lkww//TX/9+CYd0qMzBTN0WS4wvP5JVdTwNw9NWnvCCfIuAI1C2B9oZ2fvm6Le
LkrhA9575cO8hREOv8NaPXcditz8i599xbwQL3a3KfXE0ALViwS53wP2FeZy/lj3
Q57EN5cMcy8GbW79CsEqNeDvuM2beYKBGO8ZsKLz3e+bMojWWD8YS8b2zXcf+3Wm
g9NL5nTL7tCziI/yeLCU6WsZOzs3GURYVO6fDbr7znDlx/yeRG6RjfJmG9j1X+bR
y78uT89qS9VaaubGogZumbRw5RlQ6bOEUZKoRhmlnTL5aO5HY4LQ+AXy29f2RGUg
EPUdEM8BgPa+cgMEwR/T1zJNHHBL4srBsk3C+3M6gyUMiSGO0k9dztEY+cjFo7ea
L6I84RYwskXP5IQ3YMGoK0iMY2fu0lR1xJXb0J1Re9L7fBErOn/7kA+gpu9fVYW3
oMNI7Fu3nZPOrWEoEV5sSrJV9JqShW/fhxpIYWRtScCZCeKwPsA78kjJbovGAtM9
4UU5w7oaE84oJIG9UnCBSIVlg18Ckj+GJ4X1fdsdcr16++UzU8tsiBkT1i9ZNuIJ
vGj9MA60CBlaCNIhQqz9VzDDiYdaryeu0TwcWYQ7yOTVGqP+zVkqb3PRVUGSXqRG
q6W7Pj3qmBm3MWTLZhwdIc/RoW8/WLn+xiuqgVNUlhvG9vV51hk=
=o7oh
-----END PGP SIGNATURE-----

--24Llks9Dz2oDPOes--

