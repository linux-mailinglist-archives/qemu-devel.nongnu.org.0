Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAB76F0C33
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 21:00:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps6pN-00082U-5i; Thu, 27 Apr 2023 14:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ps6pK-000825-Ol
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 14:58:46 -0400
Received: from mout.web.de ([212.227.17.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ps6pJ-00032k-27
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 14:58:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1682621915; i=lukasstraub2@web.de;
 bh=pI6Yrcg6dVpyckTu2V2fjPM2mjR8UC6wDQi2fsc9vKE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=LLckFEV54oOuLpVZn8PDV0/rtg8Qh507adr5DkIim6JmKQo1QzJhffJcXOCWjm0gm
 xbn0XI5bs/FgQaSnZgrG/qibqDlP6GJL72dwLFl07BoaUjKnRjw+iyZqyl5FjlL+IY
 MA/S7QVK1WftvXDTlndNKYCWHZfeiETIwYzIRLkkoWzhjUykPf6CiREOsjfIyiqn/1
 TbLbL6XLnGQkqK54I5H8QC7rTngsf9pX2ABgeDoTtJOVzV+QThgX5IertYYva+MDEH
 EoMT8aYiQbZHY+e/MRvHrxtp45SaxiaUHlMRiHebCIa1TvdHu51wbOczfJccNgF0Pl
 sTO7ke7aqu5Pw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.107]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MftBr-1qTfUY1U8v-00g5fK; Thu, 27
 Apr 2023 20:58:35 +0200
Date: Thu, 27 Apr 2023 20:58:25 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, Leonardo Bras
 <leobras@redhat.com>
Subject: Re: [PATCH 04/19] migration: Rename RAMStats to MigrationAtomicStats
Message-ID: <20230427185825.0e8ee97e@gecko.fritz.box>
In-Reply-To: <20230427163449.27473-5-quintela@redhat.com>
References: <20230427163449.27473-1-quintela@redhat.com>
 <20230427163449.27473-5-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y6Jze9WYh4z4bxo1GYf+0Wy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:UPAm9rFY9qPzUWPoZDHaq8NiZkGIkl69VOSiOyM/VI8WPbXIAuo
 aSFiJ32MOVg1btuyRy5QIlI3A7pjHkycihajU0i4G/rlsPf7/qyKAG2o7pCJmTE9yQrKy78
 bn2VX8cAxJQ1eDZTRzVB1bFasSmkI4Qlbyjmnh+3hTRXJ9Xp+SKEsg5RkNyg//VD4MikBpX
 POkShykpUI7J3r+piuSWw==
UI-OutboundReport: notjunk:1;M01:P0:uxwlqjKRicw=;gwQQevUgEZBFZZBWop97sOBLU4t
 xrp/1gs4tRNrE6JBn57xQUGhbHeK/RuMBmSD0brwZx2qefX3SMG9cn8+dqhWd+Egxb5+RZhrg
 vbMtVRggQCwzoprLdzkz2KJFMP9xV9f+q9ExXMi8uIijxmKcxNvMgqzo5RXT6+u62rFOHerWg
 qwIjJ9+xeQudq/osplZxELY/yMKpnfxSs1OpTQOXQp8kjAkgB5QXjUG5eKI6J/76wkgCYSfPW
 XTR6wY72xVmaFbdprqPP9Zigcim2UtK+dR1wHDOn6eR+EqcQrnREtqA9R76fcjEYHXD56ZjBQ
 jnlV95CuCkurUID86OSM3n8p3e4UZ0KQ0/PHAO45Cgw4JjzHeJYwF939PUbJ0NR3kxqrS0Hnk
 3wmDeuM6nbC/d+IP9M9HkrHOcYZBRP7SdhTIchCR4VZnXAqDDD6Z3eIbywlN9ma1Arsvxhyoh
 eizEto7NnqE3kojsnle1IVJtsgLQj034kgS+s1srKslE+f2Qsd48jpwM4xbXnux9pAiiNX8Tv
 eo43vjNUnMfviJFI8yNNkVWJbP6ziv6eo7DbF9ugAPvsDVRldMpNnOxy/IdUhav1eQrGVMsUU
 gWAxTtJVeFtOvK1+UFrm0PfiKBJSL6q64lyfH8zEtQrhrQC14O/ZQKcOooT0MKURC50IQpgA5
 FRDHRYPNnYppU0Vn9PC/+nsWRCAXJjGpeWX76B8pbdOqtyQ6gvW7k2pbRm1hqSmnKXy551W53
 XJoYtPvwuNq1EvCU+q35OdzWgMYCVN6IZ4EofAFjI/pl+Mb7u0TMaAol5kMrsulHneJrPciHF
 isYDakPpWAO6ehmR6eGul4R4pTzRf6lbUVP+Fq+gg7q8qgX/QAzs1GK8AXBCEug5yc7qBYc/k
 ONRPHsQn97UxPwrArz0NGN9OX//F2eg6Jz6asJYsOxLmh9N23+3ZOINv9y4He8wZBpWL3QkF2
 OXcN5gTPK5z7vILXRQJtwko+cls=
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--Sig_/y6Jze9WYh4z4bxo1GYf+0Wy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Apr 2023 18:34:34 +0200
Juan Quintela <quintela@redhat.com> wrote:

> It is lousely based on MigrationStats, but that name is taken, so this
> is the best one that I came with.
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Lukas Straub <lukasstraub2@web.de>
> ---
>=20
> If you have any good suggestion for the name, I am all ears.
> ---
>  migration/migration-stats.c | 2 +-
>  migration/migration-stats.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/migration/migration-stats.c b/migration/migration-stats.c
> index 8c0af9b80a..2f2cea965c 100644
> --- a/migration/migration-stats.c
> +++ b/migration/migration-stats.c
> @@ -14,4 +14,4 @@
>  #include "qemu/stats64.h"
>  #include "migration-stats.h"
> =20
> -RAMStats mig_stats;
> +MigrationAtomicStats mig_stats;
> diff --git a/migration/migration-stats.h b/migration/migration-stats.h
> index 197374b4f6..149af932d7 100644
> --- a/migration/migration-stats.h
> +++ b/migration/migration-stats.h
> @@ -34,8 +34,8 @@ typedef struct {
>      Stat64 postcopy_requests;
>      Stat64 precopy_bytes;
>      Stat64 transferred;
> -} RAMStats;
> +} MigrationAtomicStats;
> =20
> -extern RAMStats mig_stats;
> +extern MigrationAtomicStats mig_stats;
> =20
>  #endif



--=20


--Sig_/y6Jze9WYh4z4bxo1GYf+0Wy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRKxdEACgkQNasLKJxd
sli9gA/7BUURO4ySjsGQQ14CoEZC+A8UYyrYPUVJ0oxQfmGr5PVGa+izZFQf+avX
Rfr6By6d+7SlQac0ehw8562vOFEVWtt2iuRIIKDuDnOpBW8c/oCaMfON/b8p9dEi
kDeU+VTswrz7rn+r0vjPgyjC+9qfDlT+vzMhHx4g74TZJrha4kbg0cW+ycmmHl+C
WHige0GUY5vdKB065TmTtu+Bf3FbefKiWWHAYjrcgtfYmn1KQVzc9c/kpHsUK6Pa
QOs7U8Gh2MwYyX5Idwf/gcYqab+Q8VJK4DNgFZJ5bnoRN6OuswMLmp4qP0nxyDsM
RnzC4q94ASPsW+HESUSqnANdj70OIOwJn12EHS0R/dv8mr0bQmxDtqezE/v4gTuz
o0fGjXVtjEQtBiuWnNI+wvNWShG/1JkTWTnNGOPJ+igpX2JArDqHCFdoIv8PNE5P
JTGfRHtMjYW3xPSX99MXQbrP2e3QckU1rixObgaOhDPHPC4tDOc4dHv2v6wNGg5C
85P4NFr/9HihcUkYCumhrmSdX/WcMjvxTSxuk3NrFko2BHkCtnqzSr2Z4XIhZYOh
iVHZkP2NgbyA2RS+/6D7Q18jiwXRQjIXlZ+SDoy+N7PvRm99rG2rYNisn4ijJ4xT
w9OFY2GPldDgRyS4kOB6V1yWxDj8RYuIF8gGAbeBW3NqkpAQ03k=
=nYGg
-----END PGP SIGNATURE-----

--Sig_/y6Jze9WYh4z4bxo1GYf+0Wy--

