Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645C331B026
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 11:54:46 +0100 (CET)
Received: from localhost ([::1]:43948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBF36-00026K-UW
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 05:54:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lBF1F-0001Nl-0Q
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 05:52:49 -0500
Received: from mout.web.de ([217.72.192.78]:58303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lBF1D-0005cF-4z
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 05:52:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1613299943;
 bh=+bMCvSICiCPMkSwmkMSVIp3EfEzW9aHdqJrvkxZ6Tfw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=D6O87X4JiYuDflEFPxNovYWQhJIae9CtwnYTDtQwwjoCuHhCQ4lotXUA89QmH5vk/
 ut9lKJWEREOpLkKL/AjFVqZ9X/K+Np+Eu0NATs5UEO8Z26ajCHS5ZUDLgWfQgjsw/K
 RTwAcn5jQEcXAg77s77DA+3RiOzHDkPblBS3upQU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.128]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MYLmq-1lP71p1yMs-00VNkV; Sun, 14
 Feb 2021 11:52:23 +0100
Date: Sun, 14 Feb 2021 11:52:06 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: leirao <lei.rao@intel.com>
Subject: Re: [PATCH 07/10] Disable auto-coverge before entering COLO mode.
Message-ID: <20210214115206.7d851b22@gecko.fritz.box>
In-Reply-To: <1610505995-144129-8-git-send-email-lei.rao@intel.com>
References: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
 <1610505995-144129-8-git-send-email-lei.rao@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZGJLXUz9zYgI7ioD7_Jyo20";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:EfsYgDsyZVQp60Pd/hC2q7n+vIPlOUSI5wkRbOv8W/GHcF16jZQ
 BeYQ3JCp2JXaj+HXFzB8QjeO/Ol6bc98GexUuNSnvnXNeSUKG5N1IfZfgy4rjRdKWp0RCAo
 z6dhLcfl+SeuHFMfPM07FHUOuzscxnvEeUg6l6qBzpih0552x3E+DOWh4sRf0lIzBTcRDjx
 Pms8niFHrEfMShBDnYKsg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+Euwbsli9lg=:Thm0Ap/RjLjDnn1CDc41UQ
 HQdM1/poUXv6GOs2fBa4X5azrkzobFWbQEjDG2E7lNw7kvPDjh7Twnj3IKqNfecic8q+9Uh71
 e0Y1+Q8f2MUL3cDCgpNly39HMmEux3ERNkm1aEOud+uASc1x0rRfiFJeyW4M/n2K/bhxAZcy/
 YU4WlcrUiRD9stAPMFqGbs8yAtEbKcYd3e3U4Gal8PPx+a+PZueyZfZqcjZ8vDQUNdWX1fncg
 kgOCaOE1njxXF4yJqmcPl6oiDQ+G17lYhl66Jci59IMYDXppS3HYyXuNBcv8TRq361OPQalJd
 GYPye9TWKnQU6DKfj/nPqxfQfwremipKOCJD9xTj5DvfUluPhuk+DH8X+3xmB6mvv2WDIFyt9
 OSBEqkeRz0NCvtsFWn6fXjEeHfKvil+hlIwh8Zj0ED3/MTNuFwcyX0bhjvG048xENr07NTSi5
 F++8HwPY474A53WsiSMIgEWT+HUI2VnOiL62T286c5w4kTDq6zkAIBbMyv8ZG0bVosSRL542k
 aiurKB8Eqy8tdCvm/Lr9zgwuevMgLmsK8HQXPpI++I7Uy53U5dspESKC1wZyZRFg5yIE8Lj/M
 V3Kbr5mAe217YAL2wACAKwOYTyRgj4+LH0W+ZEZYMNdXexKhfP7fy45v0eYchHXCny21JpgjB
 FoPsTg9GyJ6xSwvDp2WG5ZYjVPOukFbMlb4KB39u2+5ai23DQ+B2rIbBkHfSTcZMTp3VsEyEK
 HZ8kF4e82ky4r6iYUL77UpD59n6n+oQ0+CDuaOdf107t3SJ+7hPHbqE6psM7lnib+DDCSveLP
 1D0+3HIWSMgi7jII8FKKUVa080wbTfTrI6V++2ZJYDofPayKgdeNkJLGbhT1M7dke/hxmN8c8
 1Brp2qOSPzTQ8Se5Eqiw==
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: zhang.zhanghailiang@huawei.com, lizhijian@cn.fujitsu.com,
 quintela@redhat.com, jasowang@redhat.com, dgilbert@redhat.com,
 qemu-devel@nongnu.org, chen.zhang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/ZGJLXUz9zYgI7ioD7_Jyo20
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Jan 2021 10:46:32 +0800
leirao <lei.rao@intel.com> wrote:

> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> If we don't disable the feature of auto-converge for live migration
> before entering COLO mode, it will continue to run with COLO running,
> and eventually the system will hang due to the CPU throttle reaching
> DEFAULT_MIGRATE_MAX_CPU_THROTTLE.
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> ---
>  migration/migration.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/migration/migration.c b/migration/migration.c
> index 31417ce..6ab37e5 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1673,6 +1673,20 @@ void migrate_set_block_enabled(bool value, Error *=
*errp)
>      qapi_free_MigrationCapabilityStatusList(cap);
>  }
> =20
> +static void colo_auto_converge_enabled(bool value, Error **errp)
> +{
> +    MigrationCapabilityStatusList *cap =3D NULL;
> +
> +    if (migrate_colo_enabled() && migrate_auto_converge()) {
> +        QAPI_LIST_PREPEND(cap,
> +                          migrate_cap_add(MIGRATION_CAPABILITY_AUTO_CONV=
ERGE,
> +                                          value));
> +        qmp_migrate_set_capabilities(cap, errp);
> +        qapi_free_MigrationCapabilityStatusList(cap);
> +    }
> +    cpu_throttle_stop();
> +}
> +

I think it's better to error out in migration_prepare or migrate_caps_check
if both colo and auto-converge is enabled.

>  static void migrate_set_block_incremental(MigrationState *s, bool value)
>  {
>      s->parameters.block_incremental =3D value;
> @@ -3401,7 +3415,7 @@ static MigIterateState migration_iteration_run(Migr=
ationState *s)
>  static void migration_iteration_finish(MigrationState *s)
>  {
>      /* If we enabled cpu throttling for auto-converge, turn it off. */
> -    cpu_throttle_stop();
> +    colo_auto_converge_enabled(false, &error_abort);
> =20
>      qemu_mutex_lock_iothread();
>      switch (s->state) {



--=20


--Sig_/ZGJLXUz9zYgI7ioD7_Jyo20
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmApANYACgkQNasLKJxd
slixHg//Szdv+wrGi0Dy95B6HpazVR7VrJd2bAOEYZR2Y7FFZhVLKlWnZTyumW+b
p6OGGggwRKoQslwffGbF7AwbJ7VAx3e3g35QsFcJP5cDRKJd2YgPk4GqnRydCw/6
EoJGyiTjfgCrwwZKFo9VEwOFw4/iKC+t7gmKxogCF+qeuXT30LWLNp+dB2X37K17
JUH0vTt93sUWzPy09Nn0PyxjyzJFDFANV+duIMcENkeWT0Q2Si9EmO2KljSSjQ8g
XBnDVduTJOXIoYpol1zDlxA5mCctNIr/UvRQTpkZkLfMRxoOy1oCEJuyo3Ujkab8
sH1kMNhxOtfjldZJx4wnEC0dHi71cKbdcIoG8HMNwuMARK7V5bWe06mD4zmUgvUk
acyNiuQeTfCwu0e5b5fxwZWzvtxm3gfXPYAdN2w1pm3djwEKxUZP168LLDnbmr05
7WyorDY/zR2FnAlBw8OBmWLo+axG93Q8VZQfN3o1E0YHoE62HzOz3CVfISHDj8z7
mcPnUVNc6tRVzJzE0SJWTlrFA2LWkhdNiITSK9cwkqy6iqE0xyEZeEgXBKZ9HzTi
VdA8DgS/iAS07TuEMxWCcGfK1v+CBceDdMXdmEo3UHa/OG8yG3ErdUk905fvJIru
8gvG9RVG49Mo2iiapc5UH/Ux38g0N+c+NQKhjsyTfA/WOnQwwxo=
=eXQF
-----END PGP SIGNATURE-----

--Sig_/ZGJLXUz9zYgI7ioD7_Jyo20--

