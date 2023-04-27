Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B906F0D75
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 22:49:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps8XB-0000Lc-W6; Thu, 27 Apr 2023 16:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ps8XA-0000LG-9y; Thu, 27 Apr 2023 16:48:08 -0400
Received: from mout.web.de ([217.72.192.78])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ps8X7-0000D8-MG; Thu, 27 Apr 2023 16:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1682628460; i=lukasstraub2@web.de;
 bh=kiCje0cyUAbhw3ISoF64GgQbNPrnBYN3wmz7xXQLU9c=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=mK1+eySCbb/ebDQk5hHR3qXt6odUukzid9C1lhBjyaBW0u2GenIf07UaOqAXCAS0P
 BALXvs8kGIaiDitzP/XL3e2jA0EV6HOQYg0BRPvsJ+tx3d3JLq8sBl4H7WsKDU/r1g
 RtYimT/95aub3p8yVWvk7SSceR9W16dsPLOrg18esDXucqqwGYijaK/x77SwC60q5z
 pwVmi9dqol3WnCsHuUFBf1zpd04OpDatocQTZYwb4l5C9iiQwwfuy75oyEa0MAQPsD
 RezCrZiUJ5fqxMF2CJ7yOdQ0VgYGrc7qtE0kTgsxlhvZqYhm3Cpjlc0a1EIq95HY1I
 9a9I73CCi+5wQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.107]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MSqTE-1phdZq2Xra-00UUcF; Thu, 27
 Apr 2023 22:47:40 +0200
Date: Thu, 27 Apr 2023 22:47:28 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, michael.roth@amd.com,
 armbru@redhat.com, eblake@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, zhanghailiang@xfusion.com, philmd@linaro.org,
 thuth@redhat.com, berrange@redhat.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, dave@treblig.org, hreitz@redhat.com, kwolf@redhat.com,
 chen.zhang@intel.com, lizhijian@fujitsu.com
Subject: Re: [PATCH v3 1/4] block/meson.build: prefer positive condition for
 replication
Message-ID: <20230427204728.63d40e98@gecko.fritz.box>
In-Reply-To: <20230427202946.1007276-2-vsementsov@yandex-team.ru>
References: <20230427202946.1007276-1-vsementsov@yandex-team.ru>
 <20230427202946.1007276-2-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E2kppciZFRaEDYcqwPLceUA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:weZFEsCb2JiBA5xnU8yhmm2QwTNwfrkI2uGojU75EXNQUxhUEOe
 mMlLObb/cyAsFv94Slt+zUoVxGtPeSnuy9c/0HBMlcu8gxoPyxhOSD1xEC0Pu56TgGDS019
 hIiL3qVsyhT3ox2FCH4bdfMY/mnAhAYwL7pM/n0UEdwlHkZcpMthKTDi+gqz54w/6NB1vhN
 2oUk7A9RoLlIfwPcaVICA==
UI-OutboundReport: notjunk:1;M01:P0:zcLx8w3NPjM=;6IYKnbhFQp/kOEUAXkglGtI5Q+h
 cmJxJi9jN+blvVsCGj8yO+ZwkAfjFNZkELY1lU1zym6LjsXTq2H+/u1gtDZAIytWfyVoVq5/r
 Fe4WNIwlHmpCLbtFZSDAZDg1e68w1ps6tI8ZOGNWtR+j+E8dzKU3EX6Sa7OWngHV9d/5cGYcO
 bHFWLY+AHrziMKmMCwIOBG9n3RhkvUbPBWpG3sre1axEGIZ9j8HxX5WCOPywE8jFxQhOm0JL/
 Zj4EjoEwQXTpyZITuSEWastIbCxrlVS6w0stMwZdlFqmvV5rMGhDnyr2AwnDuHF+c2d8YfLD6
 moXmUhsLcxKBlgzzgCoATKSA60ou2q82gzm4BGiXe/Exe1WdKSv8k/Pqm6UtHXW30Wq5ETHvz
 JFO/GXBU8pn15/yul9pzGkqvS8BlXEMoREnngKqLhCLYulWTz8v3TvAAAy/G9iOk4oKYwA0wQ
 MtLw9WSR3TIJ9fDpHVwP8GWcEKuq/HN75Ik0Se1+MjOIoxewFp8LApufzDzMX70SMjFVCJfEu
 GI2ee2JsF/c6E9gWv+2IlAb+oN8ATNukbiE+C6Nt3Y37mHebx878aQ/OWQq8Pj6Rt6UyM+V81
 Cw0s8zfFwAb4hLKMId8SHwOeMl2Ry27k2rEmJToZjPcQ0BvArcOtT3crdHQs7hPt/OavVR8Eh
 PPfboUbHdG2osjwwOoZWuF6GX61G7n8whBAbSt1oQ6K19zg/RUOxSmTYbrdAbzkOy2TTaR8Um
 KxGd+7arii2qJ6jPd9tXMSJxmwjC1P1ubu2skQrFvvWyslR1fRrZMVc6oPoZCVuPmW1Tw6LnZ
 KsNnAbjW6YJ9JTx7evv4mWGuSgef5mG9W6xRXuY/lv3JwFN7aMM6CPw7GmTWJAJrVtXaT1QPg
 wgWmm7Ma6sosFtdmGzu8bN1+5kz9G/zDTyyc34Sv/QSkealkpuVlK1Vt0NS0OLDIOP5F5BJdq
 BTRgkSLCFW4K8rDA8vkSTD3rue0=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--Sig_/E2kppciZFRaEDYcqwPLceUA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Apr 2023 23:29:43 +0300
Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Lukas Straub <lukasstraub2@web.de>

> ---
>  block/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/block/meson.build b/block/meson.build
> index 382bec0e7d..b9a72e219b 100644
> --- a/block/meson.build
> +++ b/block/meson.build
> @@ -84,7 +84,7 @@ block_ss.add(when: 'CONFIG_WIN32', if_true: files('file=
-win32.c', 'win32-aio.c')
>  block_ss.add(when: 'CONFIG_POSIX', if_true: [files('file-posix.c'), core=
f, iokit])
>  block_ss.add(when: libiscsi, if_true: files('iscsi-opts.c'))
>  block_ss.add(when: 'CONFIG_LINUX', if_true: files('nvme.c'))
> -if not get_option('replication').disabled()
> +if get_option('replication').allowed()
>    block_ss.add(files('replication.c'))
>  endif
>  block_ss.add(when: libaio, if_true: files('linux-aio.c'))



--=20


--Sig_/E2kppciZFRaEDYcqwPLceUA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRK32AACgkQNasLKJxd
slgxGRAAolumahUTNG2yGL6NEROqKxA3fgspM1gkI7J0CwqM5djEN3coSTp1ji2U
CuIjrDyHJnShDyCzJqmW7Fd/5PkYUEUyG78rT7dZZVX8omaEzG7zGgx9VjEx8qoM
Az+5pwjriH8i1ejwiHAhGU6EEG+YdhDnkBGl0bwYRWVGs58h0AgCez9F6rUSGPO+
lHC9IRx1KgPNSm8xMr9aDCI8TyNa0s6HGITt0JsJkmBxKTAoHujSNJ2TE8Y4PEl6
xHfwrHWv8n6g5LE2T0TXD1bfHznLnQl2vvAeB5NM2LHwDA6hjLgMnKU3QU8HBuIg
FbtVM+GxyD/j12MR0KwiHwSBxiV2MnF1IynA4nAvyxNEpEetjWXRWQvGjOC6ije2
OEOqW4QoMvCC19ewib34dGHM5CAVUMLF7hMct18P766oJQZhkyT55Dl+GNLPg8rf
0crHy80NSGjxzWZrMWdSrdBezcntezmrDv2n3/NHHRRk4NBel2wyY7O4EC5z0qAk
38rt8Uh5wSUZHbmT9jJceIJUPb6xENTL1E4SSk6KSnhfjwoBdzA9qzkV79G5nQgy
WfSzxUf7Sxbw/MCFnRhs9+gVXEfCAOludaJB3pt8RKC7Q3fX6WrrGWbIpmPmoEWi
2BrNZ3wjxxHi+L44X4Hpk786ec/viEU6Rk8VSvMUfOI4MNq29a8=
=DSWk
-----END PGP SIGNATURE-----

--Sig_/E2kppciZFRaEDYcqwPLceUA--

