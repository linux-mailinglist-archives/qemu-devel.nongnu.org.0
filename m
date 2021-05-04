Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653FE3723F4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 02:50:01 +0200 (CEST)
Received: from localhost ([::1]:57724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldjGC-0003WB-GG
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 20:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldjB8-0008GA-Qu; Mon, 03 May 2021 20:44:46 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:50141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldjB5-00064C-RI; Mon, 03 May 2021 20:44:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ1M46Qq3z9sT6; Tue,  4 May 2021 10:44:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620089072;
 bh=4XUunPz7YfYr7Pqs31pJ0/tdI3EVZEsz9ryj3uq1VUA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cka6xFCfBbquzDtw4kldf4TmozBMVH8FldGj+LECOv4D3PGYdMk8j1klj/WzCUN7B
 TpyqQM3XtO8ESUKwQORdg5Un4MF87twKB+m41ImD6vUaCTUF1UYMXGtV4QOwYJ5ocM
 bdSZS+dyKpy3wqixugg8Gga/9WcZdRQ73R9wuRds=
Date: Tue, 4 May 2021 10:28:27 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v3 2/7] target/ppc: Isolated SPR read/write callbacks
Message-ID: <YJCVK3qmjBncQVzu@yekko>
References: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
 <20210430193533.82136-3-bruno.larsen@eldorado.org.br>
 <YI+B9mQTcU4YJHBt@yekko>
 <a2fab0c6-7612-d6c0-9d71-0410d1b80a31@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="l7w+0DIgI9YMJxge"
Content-Disposition: inline
In-Reply-To: <a2fab0c6-7612-d6c0-9d71-0410d1b80a31@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--l7w+0DIgI9YMJxge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 03, 2021 at 05:15:38PM -0300, Bruno Piazera Larsen wrote:
>=20
> On 03/05/2021 01:54, David Gibson wrote:
> > On Fri, Apr 30, 2021 at 04:35:28PM -0300, Bruno Larsen (billionai) wrot=
e:
> > > Moved all SPR read/write callback, and some related functions, to a
> > > new file specific for it. These callbacks are TCG only, so separating
> > > them is required to support the build flag disable-tcg.
> > >=20
> > > Making the spr_noaccess function not static, and moving the define to
> > > internal.h is required, otherwise the project doesn't build
> > >=20
> > > Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> > > ---
> > >   target/ppc/internal.h           |    3 +
> > >   target/ppc/spr_tcg.c.inc        | 1052 ++++++++++++++++++++++++++++=
+++
> > >   target/ppc/translate.c          |   47 +-
> > >   target/ppc/translate_init.c.inc |  981 ----------------------------
> > >   4 files changed, 1056 insertions(+), 1027 deletions(-)
> > >   create mode 100644 target/ppc/spr_tcg.c.inc
> > Hmm.  So, I'm still pretty ambivalent about the creation of
> > spr_tcg.c.inc.  The separation between it and translate.c just seems
> > rather arbitrary to me.
> >=20
> > Yes, translate.c is overly huge, but I'm not sure going from
> > overly-huge to overly-huger really makes anything worse, and would
> > avoid some of the dancing around to handle the new file.
> >=20
> > So for now, I'm inclined to suggest just moving the spr callbacks from
> > translate_init.c.inc to translate.c.  And some day, I hope someone has
> > time to split up translate.c based on CPU family, which I think is a
> > more useful way to make it less huge.
>=20
> Ok. I agree that the improved is pretty minor, I was just thinking it was
> probably better than nothing... I'll work on that tomorrow and will have a
> new version.
>=20
> When I do, should I put the many e-mail IDs that hold required patches as
> "Based-on" tags, or should I just say ppc-for-6.1? I'm still a bit lost w=
hen
> dealing with patchew and these things...

You can just say it's against ppc-for-6.1 in the cover letter.  Since
it's an explicitly ppc specific patchset, and the main audience is me
there's no need to get too complicated.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--l7w+0DIgI9YMJxge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCQlSYACgkQbDjKyiDZ
s5It4hAA0zf23nooNHdlJCN4eMz+Tvjq60/Gpdav7jqYF1kucRsfuB2itzVDu9yf
8K3IX+wkFGzo3MBvoqf5WWo8N2V+GCphtw4LmRayYCZ2bnqlkxGp9gK9P0d6STtD
Hdj+Mj23FOi4ffilWhMrvfyUqkJZfM9jzRMOiFpoBBVCWb8RIoZQQuAzQpJIEJtO
RqgPsvNKoF1XsVsPmgWtqysujhqKohalOqNoCM8dgIcDQpOLAPHR12Apx7hhyikI
Ch2uJGIai1IOVaoTipOahVyOR+Pyh1dzasUWYGNwSDpDq+j+3HL+J2BXisWIGP77
kWqH5XDPLSjUG05Tqnu4G/F/fH+F9UaiO/OG+lFetH4tfuwej3bqckZM6H7I3Mud
PW59Av/TFEZad/eqMh6YVgQJchI9fDzD5WSvV5ATRTWm1Snrp/PQ7jSNizWOD/ZI
yHDZRmTdlJ/mvOgdQ0ZdDPWQ0z4OsFuO/uFHKhiYU2NzCgd4srit0Kqa/bEC343O
srGtGJ8BK/kXnuN5sq/EctjUYvlhffO1/y8JNSoufrtkH+PebXfpGR3xTjPu6mSM
LkI5EXS+Ib6D+XBSNi4QIak2L8LEckrjMKubgo92/M/nDDvn2p10JioGqZnmRjuB
nV5iso+U2AjwdSqlhVbev1t+D+X/XuCWWg+DKak9T1od9MzpnqI=
=3GDH
-----END PGP SIGNATURE-----

--l7w+0DIgI9YMJxge--

