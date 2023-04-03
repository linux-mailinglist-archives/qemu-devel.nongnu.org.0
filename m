Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAE86D42C6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 13:00:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjHuY-0001MH-K0; Mon, 03 Apr 2023 06:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pjHuW-0001Jk-A2
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 06:59:40 -0400
Received: from mout.web.de ([212.227.15.3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pjHuU-0002RZ-HP
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 06:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680519573; i=lukasstraub2@web.de;
 bh=EjanzCLTGbke9GiDfUcFSXCrMsRZ/2zk50IbKgwxh/w=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=hcua7kN4Qb9i/k3vCXEee5GZ/VxZU3ihiemvFk78CbCzRmLJwwl+vXl2kZMOJxKmD
 Gbi81znhBl2t2+cwnoJ/wpZEblW/UhTzu37hVerrMbBN0F9ipekV1m48Yf3p2qg8C+
 FnLEErCPUi2Sim/DMgw95xlFyzN29TTDU11p3TDxN4yZkTKHvuSw5Ub+SoL8qfhDIj
 +B8gW3s2uLU8weqtaTADKcnnvIcDHBaNmYM5oAtS+AlJYKTQ3t8k2c986izcc1d/NS
 6VxN9UaoPRBu4s0IPQ+JSML7jFpvGToGaS+33FxiqDqEhZmeHiYMiLAe3N8XVA9lOq
 YlRMeyPLQiolQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko ([82.207.254.102]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MTOhc-1pr2Eb0wEW-00Tiyb; Mon, 03
 Apr 2023 12:59:33 +0200
Date: Mon, 3 Apr 2023 10:59:06 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>, Peter Xu
 <peterx@redhat.com>
Subject: Re: [PATCH 01/14] ram.c: Let the compress threads return a
 CompressResult enum
Message-ID: <20230403105906.4fdb0fca@gecko>
In-Reply-To: <a7f32544-1633-c3fa-8115-cbf5f2cc2876@linaro.org>
References: <cover.1680457764.git.lukasstraub2@web.de>
 <18ad4a56517e3d63411e7cb8df6b47fe0162c406.1680457764.git.lukasstraub2@web.de>
 <a7f32544-1633-c3fa-8115-cbf5f2cc2876@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+XFikqBY.8pk525YiHG8dXJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:lkhoRbuctbTMbz+sc0VeSbpdfKCFmefvvZyTL+4+8l1LHfbQPP1
 QfLhh17/RsRnwT+73d+AM91cLnBzoeH3W0DDsu6lpXyhjfHjxOnU19AKUdne4JtC8XHnBqs
 DzSEm000VlqA9AvULFB7yMrp93Thb0n7rKq/Ro75sv2WvKwvloNHJS/w5UyBmAl8u45UfGG
 aPRkD3gJ/Z+vD3OUercXQ==
UI-OutboundReport: notjunk:1;M01:P0:0EI2VDLlhKo=;8nRvAJpnW4+wsvscxx1iVa12Wbb
 xf263uKNfUJNucKUpkEdj3uvn+RmLBzxakgUvS60ar8cFDbJR4Y4UQu+x1ltMBKBH19hPC3RK
 lJqY/nSAkoht6KgeBW1cZPcPO1zO/2pxOqRyj1kVSnLv4Tr43ICJdLL3w/omA1kNVXD9w7K7V
 Juacc2G1xntBYZE+njAJgm8+EUDpaeRE1v7R6i4opWhbwW9hag6s3jxfPX+rGk9UZ3tZdNVHV
 Pf+WRaFWKnrBIT5Ae0csxHaFItETMRkWSfluPNuBXtnUBEqnUuaUZzOM97Pv35WRf1BcaccuT
 /E4k7urWSKocSmVUyWE3SpbpWpeFxx9jFrpFV/DLVtVse6mYyUpMtCdwSTEhr0nMcQQNiuRn4
 s4UpfljE+WsTD+JIRWeFHgFBNmsTU5dds2+HLNaSy+LJsAvbyxqRSMFkeHrsw8Z9x8Uds0S5r
 xmIZ30n3ENkVzdnnJHIGt2DmhG388zPz3t+3jHlkRoXrpkKqVXTf/zE1K86v+02ldW0IZwpVo
 Xsarv+F3vkbszMPLquZgUggl/rGMFn+wXKu4nV4M3OuVxHJyFVQEYAtT9HrNLzHjs/6hKkIOI
 ClzdptwEaYXfxpoqb8ctXtFfUokI4klUiABEKIRZwIEpLNle8dS8reV62tS8DQrdnrH+FSDiV
 LoY6NP2zbjx7D2eo+IG0d3k2rlP6vjWwA4zhB+Vx2ni5dWiTtVA8NB53JPNlhkCdSmtAteX8X
 FThCbqb6O0cNfAtsOutA3BMoJaEiBBV7/aRMqmMCOIQnbL/LXnVBMlzwVe59iN82jVSPu9m41
 y45h7mLmaxxTkhk2RrHwRjmibwRslDdnqysgO0NSW74j4IiI4DlEEcaiPYEjTjm7HMZA6XcBx
 tOsr407LYwSnDwIAGKda/HajCunsIDaT7XOzLUqD+hfNNuqfacbtbwWMPeQqpiZEd7FmErBoK
 SS4dk37htncaPvlejBbIPzmEFzk=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/+XFikqBY.8pk525YiHG8dXJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Apr 2023 09:25:41 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> On 2/4/23 19:56, Lukas Straub wrote:
> > This will be used in the next commits to move save_page_header()
> > out of compress code.
> >=20
> > Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> > ---
> >   migration/ram.c | 34 ++++++++++++++++++++++------------
> >   1 file changed, 22 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/migration/ram.c b/migration/ram.c
> > index 9d1817ab7b..ca561e62bd 100644
> > --- a/migration/ram.c
> > +++ b/migration/ram.c
> > @@ -493,10 +493,17 @@ MigrationOps *migration_ops;
> >=20
> >   CompressionStats compression_counters;
> >=20
> > +enum CompressResult {
> > +    RES_NONE =3D 0, =20
>=20
> What about RES_INVALID?

I think RES_NONE is more accurate, because having no result is a common
case. The submit side first handles the result from a previous
compression and then submits the new compression request. And for
example, when submitting the very first request to the thread there
won't be a previous result. Or when submitting after the threads where
flushed.

I just opted to return RES_NONE on error, because it seems more correct.

> > +    RES_ZEROPAGE =3D 1,
> > +    RES_COMPRESS =3D 2
> > +}; =20
>=20
>=20
> > -static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlo=
ck *block,
> > -                                 ram_addr_t offset, uint8_t *source_bu=
f)
> > +static CompressResult do_compress_ram_page(QEMUFile *f, z_stream *stre=
am,
> > +                                           RAMBlock *block, ram_addr_t=
 offset,
> > +                                           uint8_t *source_buf)
> >   { =20
>=20
>=20
> >       if (ret < 0) {
> >           qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
> >           error_report("compressed data failed!");
> > +        return RES_NONE;
> >       }
> > -    return false;
> > +    return RES_COMPRESS;
> >   } =20
>=20



--=20


--Sig_/+XFikqBY.8pk525YiHG8dXJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQqsXoACgkQNasLKJxd
slg5XA/9FxiZHYPGgPV1SJBnIep/zmy9XhCZr9wg4bXyFE8En728yzEAKJAkAqD8
MlkuRGTWmr1l428wfGVZo1WBx9a/Q5KjB9lgqWfRDJPy5/7LsciOhXaHrBhgu47s
tYh3Fu7Qri2Slgaw5C876pq6t7Z8Ft165h/ClX1KNMyP/0c4Ni8siDacn3xh7kM4
RLVnfSfN6crPBDqTFciXwPsNegZDd7AnSbdgbe372T1To4LkJDuyI7d8gnzP5OyQ
oTMIHLzvCAcgtXY7BH3ypG8HfEaqVT7Hzuvh9wIlbvK8gzJEbl/CsilrgLKxt+G2
tjNdK6N8/K295m1kM0WDG//YIaAQSjCMaUyW0rkvu+VO5cLwffm0LGpa8IBIEZQ1
LnmxFmLx36HSXOVJDKy59sFEQRJcrZ4byaY0Me9hlz5jhPR/xjz9pRiekgdk/e+a
JZadPUE2joL5lF6KxnSkWNoJ3KCUackOYNU7s+6bwz9uG+Kyk7pr1Nf5Hdh79J78
c5exllMZvQeDQfB5IOPHbL7ErP1EPoyFEVH36NObPtLUeYxNWiZ0w7o6Uw5EFXEd
VrzrkEHpTzR/qIcI/TngsGh53pnAHtHGUPJRKFXddW4ubUYjoeuwNBahWN8IVksQ
S6Np8+OX4av+lUJMmOwAIoBaYEnvxaXqak9lCji9uztKEHBo7IA=
=yZCZ
-----END PGP SIGNATURE-----

--Sig_/+XFikqBY.8pk525YiHG8dXJ--

