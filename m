Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F433FDFFF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:34:32 +0200 (CEST)
Received: from localhost ([::1]:48394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTC3-0004b0-Au
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1mLSU9-0002pJ-FI
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:49:09 -0400
Received: from mout.web.de ([212.227.15.3]:40739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1mLSU7-0003t3-Ly
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:49:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1630511342;
 bh=QKNLusJK5jO7zHAA4XfHo6zd9WB5o1P/u25DKCTB3M0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=dUje6JVZBlzNoxbiBWIpj+Nt8W88UNC8JkbffmDxUKReMH4ZEPk53C2TOovolo8vh
 iytngbiaW/wMvWiGr5ecd0JXtSILhYF/ctOCNCWm+2DGcxfdYhlrzTpR2dMH92INrd
 GuJTgeA0raYd/mM7ClNTqpiO5MjvqMeJjrQLBtxk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.176]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MlsON-1mkrXC3lrf-00j4uA; Wed, 01
 Sep 2021 17:49:02 +0200
Date: Wed, 1 Sep 2021 15:48:52 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH for 6.1] multifd: Unconditionally unregister yank function
Message-ID: <20210901154852.0538f0f9@gecko.fritz.box>
In-Reply-To: <20210804212632.77221bcf@gecko.fritz.box>
References: <20210804212632.77221bcf@gecko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UMBdGZchbE8oxpBVHZWEanX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:lk9q4g+WAlzE5ctPsxRJ3weEMM0WG2ZjVyd0x5jKEtw7T7Vsu8R
 4kQap/1DtU/YmOw6UJfk1ghmw3dxisMqnT+7+XOgb6HCRoTy6qtQ4rj544QWMbHl/ZagdCi
 zdoTfPG7MdIdJFWY6ZaHhpKhJjHlNq3PFmZPHMqUHwiqGD5CWtws1pjGzaEer4vnFY4n0ZY
 zqdFEHcnwTKeLKQDVmesA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:U0cebeaRdBM=:YdkjgNBDMbnmjpvG9D8MQA
 SMrRFpQZweSh9BtOQlt9CPdpwKndqw4ux/aAhPO5KoZmNNeoYCh9ppgBmht9DoUhLGjY9oHLc
 9MDfS3x9LNvy4AhZhcRpvs8HldPWrWBGjwJOQfths6Wa3GCEaUijx/42XHfkT9jcjKCHLR9/e
 aSm98RsK/23IEXDOu9aGBHmdWxKPUkJ0+hvRpZJUDqafDLCeBimU8CTvhhrHotNFLdhvJvRR5
 gpfE044mGT3Yn/o7tKxpga0CHfBWBFefe4ONvtFwj+BMXCM+1CqKEf5jydWH/vKQhi3nm0/Bb
 5BJh1td7QWHSIwyA74W0/FQOxwiJOGayfYPlGm7khyKrPAz5+Cl7vgYJlXa8qOnaX+XR5iBW/
 u4qPUlMUumRLQMDdRlNikNiq4ZPQBJwdWfVOoz+/z1U5x9GKi+DlIqhHTk7wvSlvFME3tlk99
 p9JgSABrp88Hcp+xBfz0XXEVwlpv+pCBtmz3yJTABHEt5ABeUf3UvTy6B75LH3mYFJPN//h5k
 MofOb6YBh4S1hkgJntEGzXcoK2ECeRC2tzB1bh+GVv0G8OO6WoAMGEi+2OdTbKdAxHtE+0xTk
 aUZRAlRW4OemplsmmJ86JG9tVMXVW2MbDzfad3D8vpYTNVPv4hB59ZPcuvTeAA3eItLOGK+PD
 pEEB4ETcF9U7kjOS61ULK3Vj85RbrfoBm0RudlDcprJ6+u2rsyt/U4VYvHOit0BTo188Hrf8A
 cVMgKfdDJL3usmiIvKWUa4+pL65VTyMNX6mRv6Y3TjeVwczw8mU+H9ouAugKB8y0ar9bgWpzU
 8MZwo8h6jE22hAMXHWznlxPwG/VOieTEjobg3hrKmFfHTvIkwmKYeOINd0AXpXOqOBXuayqvy
 QCVLfhXcGSqpNh9zbnibLYtmVlv7g1J3uNZ1g3YFToKYsFR0qxNxUxnraauzE1nnCTFioMd86
 e1SBgAdXg9ik6mYpMlPL4BvGt11lZ7PpiUnMcYSN41mmnruSfUa+E0LLg5yls5mvmPBCJ/DJA
 Jltj0Zi172Ui1BYc8USRJvcwKEy+JY7ulFbBlldcvBv77s2mkAsN8MdFNaaB0nCwWiWhEKhLI
 Mh1KGWSJ/h0YpGfJPvx0PZ0CF8wu2y4sewvMmbBzPZayzOu++3bMZcjMw==
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/UMBdGZchbE8oxpBVHZWEanX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Aug 2021 21:26:32 +0200
Lukas Straub <lukasstraub2@web.de> wrote:

> Unconditionally unregister yank function in multifd_load_cleanup().
> If it is not unregistered here, it will leak and cause a crash
> in yank_unregister_instance(). Now if the ioc is still in use
> afterwards, it will only lead to qemu not being able to recover
> from a hang related to that ioc.
>=20
> After checking the code, i am pretty sure that ref is always 1
> when arriving here. So all this currently does is remove the
> unneeded check.
>=20
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>=20
> This is similar to Peter Xu's=20
> 39675ffffb3394d44b880d083a214c5e44786170
> "migration: Move the yank unregister of channel_close out"
> in that it removes the "OBJECT(p->c)->ref =3D=3D 1" hack. So it
> makes sense for 6.1 so these patches are together.
>=20
>  migration/multifd.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 377da78f5b..a37805e17e 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -987,10 +987,7 @@ int multifd_load_cleanup(Error **errp)
>      for (i =3D 0; i < migrate_multifd_channels(); i++) {
>          MultiFDRecvParams *p =3D &multifd_recv_state->params[i];
> =20
> -        if (OBJECT(p->c)->ref =3D=3D 1) {
> -            migration_ioc_unregister_yank(p->c);
> -        }
> -
> +        migration_ioc_unregister_yank(p->c);
>          object_unref(OBJECT(p->c));
>          p->c =3D NULL;
>          qemu_mutex_destroy(&p->mutex);

ping...

--=20


--Sig_/UMBdGZchbE8oxpBVHZWEanX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmEvoOQACgkQNasLKJxd
slj/pg//YsFNXv+FFw8gL68GI8++ChL+HgvwpeN1jTKexTWGSyF25jJgZeJoBhW+
mW+FoRK64lIJwa9QFWViaejS2fG7JmqOEgZJ7KS2SFc9UVHOKLA2cnczz3kIwiRi
V7wyuS6TQd4nwV6KrQkqlU/s4vhCrNEmcvMEfiUpXrq/onDc371hQ60fBa3GlA/o
19lqyas9VXQuB57ueh3i94fEAgMpu516LYYzjxotopWQg1Iwk9WOTH3yl2Dq9QY4
iB8WsI9PUjfgpfBGh6OBOIy+Uf4dkwyK8FtQAw5f5tOmb7bmmz11E6wQ45Gk3Qja
dyE/nELt0BfwxG1FPP176StYaWhGP2wSHSwTNinUKlDr9jRzkv62ljzhd4E3k8Xo
KHW7qLzm6tEtOsFauETT1iyYyK33vNgERyinCA9+vjJGR/7ihYhVGhvE6h3vGkSC
Zlef4tHe7/ELoP4BLoOqhVDQrEGdu2rY24Q0FQa3j35rd2yklYrVJ5mgJEO2Pe3j
aFGou5fZg9nUokPnVccSQdSWSzU+yDndHQdafkaMQjYoBAEZVA7NfCmvT0fAQUoZ
JkLo7/DpKWgKCHnHts3nDEFMmEDbN0flAUr3yUvxRHbjVYeqDxvBZwt1h9z6Vv9P
FbEaE5HQ3+wOh4skigjltSAeS617xWXO2GZdwP1lAM/7LH8fRhA=
=zHkJ
-----END PGP SIGNATURE-----

--Sig_/UMBdGZchbE8oxpBVHZWEanX--

