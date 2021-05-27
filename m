Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FC4392853
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 09:15:30 +0200 (CEST)
Received: from localhost ([::1]:47512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmAEr-0001eK-Kd
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 03:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lmAC5-000747-Mj; Thu, 27 May 2021 03:12:37 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:42557 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lmAC1-0004jO-JJ; Thu, 27 May 2021 03:12:37 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FrJsx2WXnz9sWc; Thu, 27 May 2021 17:12:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622099541;
 bh=5+4kYvXrVHm6vhq+FG27Gh+HVb2RQg2mp5YHflox5Ss=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sqo32VZrvX9FQ+NNbHcoO4DNXDj6M50EPsfeicu1Dtoy9/zCijoGO5bfBG26HhtJp
 90hmT+e641t7o18cAwo65bC6qek2IocwLbpRUA7kdZMjaLbCQkqhKIT+La3m7ihicq
 XDkQbGe612n6w5vp91bFxSvQajcfaZ7bJmWd/3KQ=
Date: Thu, 27 May 2021 14:40:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 4/5] monitor: removed cpustats command
Message-ID: <YK8ivWfvq27l2c1K@yekko>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-5-bruno.larsen@eldorado.org.br>
 <8c9edbbc-8b28-ff43-2d91-2b57fba79fe5@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KbGzvDoxIH5IXOPv"
Content-Disposition: inline
In-Reply-To: <8c9edbbc-8b28-ff43-2d91-2b57fba79fe5@linaro.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: farosas@linux.ibm.com, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--KbGzvDoxIH5IXOPv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 02:28:48PM -0700, Richard Henderson wrote:
> On 5/26/21 1:21 PM, Bruno Larsen (billionai) wrote:
> > Since ppc was the last architecture to collect these statistics and
> > it is currently phasing this collection out, the command that would que=
ry
> > this information is being removed.
> >=20
> > Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> > Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> > ---
> >   hmp-commands-info.hx | 13 -------------
> >   monitor/misc.c       | 11 -----------
> >   2 files changed, 24 deletions(-)
>=20
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied to ppc-for-6.1.  I'm staging this in my tree, but an Ack from
Dave Gilbert would be appreciated.

>=20
>=20
> r~
>=20
> >=20
> > diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> > index ab0c7aa5ee..b2347a6aea 100644
> > --- a/hmp-commands-info.hx
> > +++ b/hmp-commands-info.hx
> > @@ -500,19 +500,6 @@ SRST
> >       Show the current VM UUID.
> >   ERST
> > -    {
> > -        .name       =3D "cpustats",
> > -        .args_type  =3D "",
> > -        .params     =3D "",
> > -        .help       =3D "show CPU statistics",
> > -        .cmd        =3D hmp_info_cpustats,
> > -    },
> > -
> > -SRST
> > -  ``info cpustats``
> > -    Show CPU statistics.
> > -ERST
> > -
> >   #if defined(CONFIG_SLIRP)
> >       {
> >           .name       =3D "usernet",
> > diff --git a/monitor/misc.c b/monitor/misc.c
> > index f3a393ea59..1539e18557 100644
> > --- a/monitor/misc.c
> > +++ b/monitor/misc.c
> > @@ -369,17 +369,6 @@ static void hmp_info_history(Monitor *mon, const Q=
Dict *qdict)
> >       }
> >   }
> > -static void hmp_info_cpustats(Monitor *mon, const QDict *qdict)
> > -{
> > -    CPUState *cs =3D mon_get_cpu(mon);
> > -
> > -    if (!cs) {
> > -        monitor_printf(mon, "No CPU available\n");
> > -        return;
> > -    }
> > -    cpu_dump_statistics(cs, 0);
> > -}
> > -
> >   static void hmp_info_trace_events(Monitor *mon, const QDict *qdict)
> >   {
> >       const char *name =3D qdict_get_try_str(qdict, "name");
> >=20
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KbGzvDoxIH5IXOPv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCvIrwACgkQbDjKyiDZ
s5JMjA/+JOWIwRIt+Hr75lN0w3bGxChDL3DN62iOaT1VFwwlNWVvkTuPAGtRz+Sg
MvQC4gTE0APYtS3mxeDIUiGdFdvxwSTqEy8Gc5RwFm/tvQXWTCWTaSFZzEvBZt+e
d3v2yS4/nsWj2FkPEMtoUZYv0+Ef1eq2jRIpN4fGH96w3DhOdyPn9h9zE8tn61Q9
xS3ouY6l2rQw0qSenTtAddsiuPLcj7OwPOgcnpgBkUKR9huEr7uWOhcTOkqS5jRc
LHd7kOBhB8btUiozb5GxzUTHNwqgAZhI2R0sU1GJbJ+jPppe9DLs311elD6GLCRl
s4WoNt7OKwarz6R4yfWdtrykfYSbc4p6xIsS/f7v5mNTTeQaN7ELsOdpic6b+RFx
Q6hts8+FW2iexny0LOkXZtnSSFYeRw2L4AdZz5WZvwDR7p+rrjJPYQ4BPVIvtGRG
Zc7xTtA0m5p6I3soBmkJceava5BZzVXpkotnuOvjFqYsV8Nuk/fIZVH2NXoMEEVA
yAMqQrOaciISt/o0SuKL4sGkyTQGt/VEZba7NmC7+bqngSeovyT+rsRmat+fUJCk
HabNaT1kR97dlmeEu5TXKaCp9sEYQTyKkCJ1kNpY6MX36hea6+4o3bcn6qHekYBL
H29jYlIH55A38AVqIJBdbM6Jpq8LeVNFW2xHEt135kNc6bCGa8g=
=31y5
-----END PGP SIGNATURE-----

--KbGzvDoxIH5IXOPv--

