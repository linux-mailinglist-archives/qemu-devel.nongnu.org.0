Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019ED3E0932
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 22:14:36 +0200 (CEST)
Received: from localhost ([::1]:47586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBNHe-0000bH-K0
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 16:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1mBNGn-0008Lt-8m
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 16:13:41 -0400
Received: from mout.web.de ([212.227.15.14]:60625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1mBNGj-00088w-Vs
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 16:13:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1628108013;
 bh=nZBr5mf7gko3jWKp7OzZYEZcyuqxLWE/ttw9EIPSmKE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=dvYkhge3ZkGt2BCmchFaGc/Dt7+i1Yuq7iVD8AZZLXJViXePYoLj7xshSFw/ZMj+2
 6dC+hLGrCp0zbZj0la+FOOMzmbXk+R8h+ukywiAg9AfeY1Cr2Vq4Lz/Zr3p5XrLqB2
 iGhu1N85vz7SCFu2lI0gXouoNJs9GIy4hmoBAAIY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.254]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MVtmK-1mdrPA3mqu-00X5b0; Wed, 04
 Aug 2021 22:13:33 +0200
Date: Wed, 4 Aug 2021 20:13:23 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH for 6.1] multifd: Unconditionally unregister yank function
Message-ID: <20210804201323.3db52340@gecko.fritz.box>
In-Reply-To: <YQrtC8vG9jPJQZ6o@t490s>
References: <20210804212632.77221bcf@gecko.fritz.box> <YQrtC8vG9jPJQZ6o@t490s>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rNE1KGqx9zeFfUspDHzuOee";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:aG8skies8/RtYpoOIN+a9f20sS0aOLLC9Lf3txK0tlihb+fkb9o
 kZIyWq0Df2mEovt8KtKNMdHQ0mdByUMeggBQq271nN+24ienvRG3cMWId9RbB2DlurKYBZq
 i7O2C48/+UsBjQe7MGU0teOeb2CCeebtZSsv9yObIu3fscIJCh0d46zBjplxxhAFtpXpsw+
 6gzG65dUjsZtSbuBLHFmA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8wwLsGxg0dQ=:NTdn/X7cB/maO7Fu46ZrRH
 xt2dSJuKNnAU6s5CXU6Y4qQF8kIvNbIcRs/3+yJ23sKfgty5MPfGVrYPWpz0d5E254VpiQuWs
 uf9tNh3sDFwqMYgcEwMPy8ZEUv0YYgYsX9cBrQqDooEhLGwlL5/ijLggKJB4ugCrfT7r3z4Qg
 WM/ICK4N1amauHoZwTUfvrjQATzyi4bf60whYnWJ3d1rrbdo/YKg6h4yjNdll0LAoFTYOszYN
 r8yGA1gjBs6NpTolsI2HRgFmYCmed9YttaEnMCOXkyYoxCD6FbtJK8oft4DCMcqKVDFgo4Zk0
 ORgvBwVskKErTiJvNivogy4eFQynzhbq3Nx5Kc3cPq/oh+DttushnPq6Hlfq8+1IBPd2rK80D
 O/sEEXp37LcKSPljpK2RyberhjXHNONgnmxbUtgevqJfhGnl0QGomIYRgtW+rptt9Z7aErdC6
 m4OZxxJuyNZa1sMudunibVk4IVPJv68KWyLwDWDHqcHFdV0UUexuwcVBkpMaj+XcR2it0SWLZ
 ZJMDahdafwY/9UBEzG6ZyEs7if2ag+GOCo/Zwus9GImaoagYE0m9O0qG3Vs4pZuhlZ3H4lVWK
 c5ukdzewht3Alw7ZZflZSH4OgoOfIghJzYImb47wjkq30ebxVTU3tBK0nq8cU2qTkCt7XF/zG
 klwB+0a+2W/H2zztmiXuBPXRyhHDpSy+qTDNx8W9fWork5SgQRtWds+arBkNZKFvRH6jke5C3
 ZiiQJ43rPdMiccWJ7p4vAK9I5NL1jCxUbldzB2+BnVYQ2xx5oRcK/0QFbS/lqjIUax+U5plX3
 PHVlQpOpoPrhAWcZusf5n9G7G16IkAm6QQpyUQvb0X7cBwmVayLrjhhl4gX2Lo8ZKJ9rR4BQx
 IhySJCrvTOTuniN2RbZD5RX9MHLkADUeNUa6IzBtxP/4ouI+QdrfjK+MoXtBOBDTr6bmTTQOv
 Bjb8Gof2fhd3BvplIc20TKEigXA1UMs3n4IHWrujsg5pBIf2cb8z1QQVIA4IJJrEf7sDhNbqf
 DHwv8GZaOCrO9qfDA0Ol+AFqIyM9cEx0Jn7ENysP5fV/ZiR7RFyLaQGicIyKT43mGYNVbBikg
 9RoD35Hv1MZW1jzFPigQ5Cmi50pl6dYj3fZSD7fPa8ARjAS4sOM00fnTQgWh5eRFCCbFATsbB
 DjStk=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/rNE1KGqx9zeFfUspDHzuOee
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Aug 2021 15:39:55 -0400
Peter Xu <peterx@redhat.com> wrote:

> On Wed, Aug 04, 2021 at 09:26:32PM +0200, Lukas Straub wrote:
> > Unconditionally unregister yank function in multifd_load_cleanup().
> > If it is not unregistered here, it will leak and cause a crash
> > in yank_unregister_instance(). =20
>=20
> Curious whether there was a crash somewhere that you hit?

No, I just noticed this while working on a different patch.

> > Now if the ioc is still in use
> > afterwards, it will only lead to qemu not being able to recover
> > from a hang related to that ioc.
> >=20
> > After checking the code, i am pretty sure that ref is always 1
> > when arriving here. So all this currently does is remove the
> > unneeded check. =20
>=20
> Thanks for checking and removing the 2nd ref=3D=3D1.  I wanted to do that=
 but I
> didn't dare before I look more closely or test more.
>=20
> The patch looks good to me, it's just that I am not sure whether it suite=
s 6.1
> material as we've just released rc2 today.  Maybe 6.2 is more suitable?

Yeah, if my assessment of the code is correct it's more of a cleanup.

> >=20
> > Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> > ---
> >=20
> > This is similar to Peter Xu's=20
> > 39675ffffb3394d44b880d083a214c5e44786170
> > "migration: Move the yank unregister of channel_close out"
> > in that it removes the "OBJECT(p->c)->ref =3D=3D 1" hack. So it
> > makes sense for 6.1 so these patches are together.
> >=20
> >  migration/multifd.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >=20
> > diff --git a/migration/multifd.c b/migration/multifd.c
> > index 377da78f5b..a37805e17e 100644
> > --- a/migration/multifd.c
> > +++ b/migration/multifd.c
> > @@ -987,10 +987,7 @@ int multifd_load_cleanup(Error **errp)
> >      for (i =3D 0; i < migrate_multifd_channels(); i++) {
> >          MultiFDRecvParams *p =3D &multifd_recv_state->params[i];
> > =20
> > -        if (OBJECT(p->c)->ref =3D=3D 1) {
> > -            migration_ioc_unregister_yank(p->c);
> > -        }
> > -
> > +        migration_ioc_unregister_yank(p->c);
> >          object_unref(OBJECT(p->c));
> >          p->c =3D NULL;
> >          qemu_mutex_destroy(&p->mutex);
> > --=20
> > 2.32.0 =20
>=20
>=20
>=20



--=20


--Sig_/rNE1KGqx9zeFfUspDHzuOee
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmEK9OMACgkQNasLKJxd
slgOSg/+JS5IbsARjBQM/Y2SxEoeFBEUDRXh1ySjkzvhne4VMI2Ezxqo5GNfa+PO
u5DVuXp5e6EaoyivHhFOF1upysTFecEWHhwXvCaSa/pjLGz+kHEpbBcySgs7HpEF
8BMeQoEA5+gBbHxhHtaTo+OmGon6/Z5FNdaJQqbYQCaBRcjrPetmTz6GHPBpqXDc
VuW1GkHVUvE9c30I4Wgf7W+4ubP8/QrVHr1YvgF/akkOZwecxxe8HJZoGdGUnTtA
nAjm+rZxkGNmKjs7N0P61YO17o2EE4zuB9zCxEfZqgbi2GHFrjkGKUTJs0R02MOX
b6lca9BJvjLDyt1TvenoXoqcjeiOtBu5CVmRM0AukrsEP9vO+UudNrgqcjf7I4FV
wZmPUZsL50yqQbKjFgqmRIfZu48/JYiosOaLvP+RQZ2Ju/acSsVkOQClzLQfj74i
oyYsakhbSl20But15tjdtjNZDH9nnkthPAc4LxkS4OekwFPa0RT/ryspOV5jTQt5
nNElPELSd5NsBn87gQoqMpxrPasUG4w9Gtr9a3qwUVFeCfJwI5Lq1Y8Q2bDJWdub
0hfT5ggkX6ZQuWNE8Id6Os8CvXaR1MpRLXakC3oZnrJubnyW5Rp0rAlgqfRSlzYL
iY1uN5P95+RIFgulamkQFP5AptSv9eRVGdkl7HlUF7KThrkWA1o=
=0cg0
-----END PGP SIGNATURE-----

--Sig_/rNE1KGqx9zeFfUspDHzuOee--

