Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 461A76D59D4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 09:41:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjbHi-0007Y5-TO; Tue, 04 Apr 2023 03:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pjbHg-0007Xb-Ah
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 03:40:52 -0400
Received: from mout.web.de ([212.227.15.4])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pjbHe-0005n5-9n
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 03:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680594043; i=lukasstraub2@web.de;
 bh=lur/S36QdmfKJIf624a/vjqTKJlxQ/rAeE81eL8fDg8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=YG02/bULzkmckYAyD9GnndcB7RNurZKMBw8rgOIEvw5m7zJ1GefmXvq2gN3uZXu0C
 zmCW2osETuccfmQPRx0gzJGTt5RZDBUaXaDejCXX2BJP4RCekpUwBYW87kovzkB3TA
 GuialoSwYBu8YocmdVOw52DK9Jdhua1bdUmKKKzDqO+ODY2EdhXVg/SBKVO3W/9cAC
 4yLYWcFimCs3l1LVADrrzdkVZiiGS1Ndxh2T4UxB6Wuyomni8CjF6mdpCfbJdNw5T3
 vnk8aQw2kFxddQ5Y9ACwSiYNvKKA9wTfvfCuj+PQZxVQ0ErFGVUJ47M1gxOafNRr6K
 q4SW0r2RfAPdQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.102]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MS17v-1ppLsm2g3P-00TRxO; Tue, 04
 Apr 2023 09:40:43 +0200
Date: Tue, 4 Apr 2023 07:40:20 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH RESEND 1/2] qtest/migration-test.c: Add test with
 compress enabled
Message-ID: <20230404074020.3a6d1e5a@gecko.fritz.box>
In-Reply-To: <ZCtCgDV9DI5BlcQH@x1n>
References: <af76761aa6978071c5b8e9b872b697db465a5520.1680457631.git.lukasstraub2@web.de>
 <ZCtCgDV9DI5BlcQH@x1n>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rX0weWhljHOnpq9eGvmoW//";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:hZz9dbq8/gxUGBBPLdzUz4Tlnp7fpUtxJ1de6IXdDriJ53nXLa9
 v1ZcfqPsF9zu+4n7WjF/H3z64hz28UrG8jtd10Ojo1lYWMQX9/RzI+Szbch7lcNPpEklTL9
 raKdcKyh5JOztE0Tw4iTxHFbgZEJZtcADKMwCTRQeA7GP0EkG+zPhB0HCFVCZzGzdbQa9A1
 p/NxLScR0sWHW/2DlGV7g==
UI-OutboundReport: notjunk:1;M01:P0:63LX8JbWizk=;5SrLCk08dRYK/QB4XKS2N952Vl2
 rcqsxolxmrL4Vvnhu38J3UuRXIofcNKSCLnptP8bRYoJ7qQ1AnJLkwQk6Q/1TAiWulicJmo3x
 AdX+pJfyRyMpDHAh4oJ7SSYtmjsr1uny40ozOHX3odH74f6AF32ICBBvqB8mPYoZbp1Y4tnUz
 dFRRJKEf0TpJolg0+e1EsoVVU88HgNU1XRMzJgnH7ybTIU+nmk+DMPhtHR7knjdxFHOUs+R+1
 mnCf4G8qOM4snY+C4P+b5s0tn802yMSIVBfkOrs9seglqKJ+VWh73bspKztseaqgmWX2FJv95
 gQ6VR4akvNDsW/vBF6ESjb1SkRmymG38MBSnoWrTKgxAv9NFLtv36KqxCi+rhCqnogZxpey2W
 crLE8OZGdxS503KbuPBwxpd6ZaXgrdF793BAbprlOTVdG+hhqMxuhR+5qG7Kg8m7Ba2Klj8s0
 Bux0eYyTd28ti7o7cvvOiOXzZ8I9r7cZWn8+QUW5k7i5O9sEeOOI5p4lyKnJOBiLMNdKEf7G5
 bC18AiwowTuegFQWtCJ/h/Aq5oIv9i30bWl1XfdO+ImkMZzdGhgNMuDYpd2QRm5Otnuk0cEWY
 6wKnaH2uMsvod6AgXoLf1uhy8wY1gV582+ppWj4SXRe6XsjfWmwoELtXfK2It8Zb7j2kB6lx8
 Zxgq+d+jHTCxbhWpob63i+vVwPMMQblf0RoL187qkK4QeMSTPejBh3QjLkkyV2VmnDkpFJnrZ
 zwMp7p20G7anZX/CgWgg7msf6N1drtJtwvl5GbudWrGF5490Y1sST4yB2FX/ztmP9p6vvf/pm
 POiMRc0FyUJ1zytjNHfcxjEoqYnOn1hMPVb68UeYEiRpnh0WWlR1/GoirKgkOJXYeKgSsSRpL
 q67lIn414uLuKSAWoiRwrNABiFa/CfRdWX7TjIGFlG1YxlPt0417g0OGEyhFULSUWqtdYbCem
 rc0C4zcLbSDiGmNJP9ySqTwlGWY=
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

--Sig_/rX0weWhljHOnpq9eGvmoW//
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Apr 2023 17:17:52 -0400
Peter Xu <peterx@redhat.com> wrote:

> On Sun, Apr 02, 2023 at 05:47:45PM +0000, Lukas Straub wrote:
> > There has never been a test for migration with compress enabled.
> >=20
> > Add a suitable test, testing with compress-wait-thread =3D false
> > too.
> >=20
> > iterations =3D 2 is intentional, so it also tests that no invalid
> > thread state is left over from the previous iteration.
> >=20
> > Signed-off-by: Lukas Straub <lukasstraub2@web.de> =20
>=20
> Overall looks good to me:
>=20
> Reviewed-by: Peter Xu <peterx@redhat.com>
>=20
> A few nitpicks below.
>=20
> > ---
> >  tests/qtest/migration-test.c | 67 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >=20
> > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> > index 3b615b0da9..dbcab2e8ae 100644
> > --- a/tests/qtest/migration-test.c
> > +++ b/tests/qtest/migration-test.c
> >
> > [...]
> >
> >  static void migrate_ensure_non_converge(QTestState *who)
> >  {
> >      /* Can't converge with 1ms downtime + 3 mbs bandwidth limit */
> > @@ -1524,6 +1559,36 @@ static void test_precopy_unix_xbzrle(void)
> >      test_precopy_common(&args);
> >  }
> > =20
> > +static void *
> > +test_migrate_compress_start(QTestState *from,
> > +                          QTestState *to)
> > +{
> > +    migrate_set_parameter_int(from, "compress-level", 9);
> > +    migrate_set_parameter_int(from, "compress-threads", 1);
> > +    migrate_set_parameter_bool(from, "compress-wait-thread", false); =
=20
>=20
> May worth trying both true/false (can split into two tests)?

Maybe, I just wasn't sure with your CI resources being tight, whether
I should add more tests. I think this test gives the most "bang for the
buck".

> > +    migrate_set_parameter_int(to, "decompress-threads", 1); =20
>=20
> Why not set both compress/decompress threads to something >1 to check ara=
ce
> conditions between the threads?

I just wanted to make sure that it won't get too fast so it really
sends some pages uncompressed. But I guess this can be fixed when
splitting it into 2 tests.

> > +
> > +    migrate_set_capability(from, "compress", true);
> > +    migrate_set_capability(to, "compress", true);
> > +
> > +    return NULL;
> > +}
> > +
> > +static void test_precopy_unix_compress(void)
> > +{
> > +    g_autofree char *uri =3D g_strdup_printf("unix:%s/migsocket", tmpf=
s);
> > +    MigrateCommon args =3D {
> > +        .connect_uri =3D uri,
> > +        .listen_uri =3D uri,
> > + =20
>=20
> Empty line.
>=20
> > +        .start_hook =3D test_migrate_compress_start,
> > + =20
>=20
> Empty line.
>=20
> > +        .iterations =3D 2, =20
>=20
> Maybe move the comment in commit message over here?

Good idea, will fix in the next version.

Regards,
Lukas Straub

> > +    };
> > +
> > +    test_precopy_common(&args);
> > +}
> > +
> >  static void test_precopy_tcp_plain(void)
> >  {
> >      MigrateCommon args =3D {
> > @@ -2515,6 +2580,8 @@ int main(int argc, char **argv)
> >      qtest_add_func("/migration/bad_dest", test_baddest);
> >      qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_=
plain);
> >      qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix=
_xbzrle);
> > +    qtest_add_func("/migration/precopy/unix/compress",
> > +                   test_precopy_unix_compress);
> >  #ifdef CONFIG_GNUTLS
> >      qtest_add_func("/migration/precopy/unix/tls/psk",
> >                     test_precopy_unix_tls_psk);
> > --=20
> > 2.30.2
> >  =20
>=20
>=20
>=20



--=20


--Sig_/rX0weWhljHOnpq9eGvmoW//
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQr1GQACgkQNasLKJxd
slhlog/+NFFw7nVvRpbpJoRQy6li/nGUYZcmmPhhVjFMd3+xLEl1kBM0kXoneoBn
kV7josp5EnZAtNSoUcWr126lmbui1Z21s4t0potgCAKv/lfEay6mAxIt/l3eBsnL
auXtYm1GJv/DxlSprF6lgywE6L/wFSItFij+gAZJ+LC3xp5y+sNWo9WHcdQs9KTY
H8bmqzrkHo6rrRBU49W4kkJv2gQLfp+c1hvlEFbFz3JzM1kcCyBAArG1pcwXVdnc
9ynfaLsSBRtQ7B+J4B6j+MshDBakmvFxJKFvf8UsOP9JFujpDdbBU1Pn3yKJrJdQ
MJ4fXPaYkpvsPY0i+/PNioYvlaSPPLFq34BhNRbXD6U+hL2Jhkw7/T9JrAD2KvR2
6L8sGOX2TE46w+qZJZ5Wf1TwPQkgASDjrh3JCHWZMZTOcSI+iagssLQ3AZJvU25p
L716CthrklTt7z4Ne5PA8N8gA6j+xH61TJngnTCfKb/2w6erYO6EnwjLzgpXhfqW
XQbS87x+SDxDOqGSsXaLzf3Cam3SRat0vTQDP4Fl6uh8P1oEVprw+bcGQ5AQ+Ha0
i9x6QE3WybeRqDytqboqR459SXZMzQVJU/qAS+/Y9tBTg908GcEY7Gl92YExLban
o9k/bX0r8s1pjSYzTbRMfrfIqI0Il3DlZQflZwBCHU0A7SW5Emw=
=7awc
-----END PGP SIGNATURE-----

--Sig_/rX0weWhljHOnpq9eGvmoW//--

