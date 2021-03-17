Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9CA33FA47
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 22:08:25 +0100 (CET)
Received: from localhost ([::1]:52914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMdOy-0002dy-Bj
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 17:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lMdNL-000249-Dm
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 17:06:43 -0400
Received: from mout.web.de ([212.227.15.4]:57565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lMdNJ-0001Lw-MF
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 17:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616015196;
 bh=hnwS5Nq7h0qTYWCE9z+zKHlnLuGEf5eSv3fhhh25hyY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Nsh9UElc7xdmij+B1yoLMoAoGH5Dc4/IaoklXkjsNhScn9ZjmoytzAj4jO5pRvpaL
 7z5E2Tn9klEGCn6FZV9Hc7NbtjPFKPzeutGnVhS8l9fxuYFSboWHc20IhFvOYznenO
 PodE1yZFPghVkOhXQyd8gJ0Fx8JxjQablTKoGUHY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([87.123.206.38]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M9Zdw-1lJLa423bY-005gnX; Wed, 17
 Mar 2021 22:06:36 +0100
Date: Wed, 17 Mar 2021 22:06:19 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Li Zhang <zhlcindy@gmail.com>
Subject: Re: [PATCH 1/2] Fix the segment fault when calling
 yank_register_instance
Message-ID: <20210317220559.2fd3b297@gecko.fritz.box>
In-Reply-To: <20210315170636.704201-1-zhlcindy@gmail.com>
References: <20210315170636.704201-1-zhlcindy@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=864fwlIo1b=4IhUWDjjsXs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:rBShx5JSdFbZ4j3P1rnQ08396F0zq9jHaefjpfW8MHGzsgsLqvD
 tRZarADV4Sxrmym9auPycbCe3kTXi0E5TvAVqM3Y/tXHWRMkTnbTN1ckSl9+FYhTbi50pkZ
 iRx2z1Cuxw0LTAdhZUtB4vQ913K7uqkIz0GZE34BeOIwuyaN+eYnTxQFLvO0IXbDz82KaUA
 mKb9jcwu0pyX3qHTmlVdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QYoTeBd0M1U=:QCGmN0c0Kfl6t6i8kO1ezv
 QmayeZLINNJGTZNtTnmLhp4/zYUWmGePYJvMvJRWKBL5gXFAiOd1rf5nDYW/hpLoJzd0bEig4
 R4vDHixZczoyoFGRFEVmjJrzhq2/8YJxJrU7zsYiu3Lw35OPzXD7vz7vv87Ua5AQPgcUmkAq/
 XOLrrKYlXsp7NHYzDYkfUHkz9eMjSxwrESY6JzaFCa7sahSfP8+9BEr/EjzmP/KPLDXM2bzjL
 wfkU52pz98Z9zJsDE0gtBeIM62lB0bkBYi7RUAVkcB0/Kxr1t5Mvlihl98jTkHAo/RvmwfrRU
 nHJIuuBY0TirnqUZ3N7N2nF3eU4b9yFvPq3i6vo3VW0xl0uJIak4tetwg3ZV7ex5dRocyxMqd
 mnzQClQUvN61o5nUZgDmsKsw8NC6gpntjTrvx9/P3K28XDf97BWxpOQEvGWmxf+5zqFyaW7a8
 ZStiB6lidFJQLycP3BN3tU+WMX3uv74lNiCXBiawD9XpJhpUWxuSGWaZA531Wv6Ngm32tr15k
 h974bChv0e4XSfcZz4Q2LTGRRpfnDdO0Jq+5wDqf2f0g9a01p20nNfkSLwCVn4Yk3O0oh8P8k
 XpbW8YOD1HqdMDgG9DId7qT8nGfTEr2iGZBTgHEWs0Rv20GoGU/AfT9pCVlhektrRKI1jqUiV
 o2woL5cbjZehkXYZVXyTaFdxt9y8kzkZfNwEUGYfA+I5mcvoT9kgUXmzZd2iwpRoJY1YV4qrp
 ZadpoqV4W3Y0YeHI44W5Jw+xUyXA7NaweosmP7YZYii3bSgC/Vs8pO8i1K3QLgOwLM4w6dtY2
 ztJ0hVXgqaXaQ9YbjbQPaI0BVvPNPHUclPA5FSvwQZvW96y2CkqUgvJVnZ9d0LqhANEejxlvZ
 2U35e3JGxMom4I410eoQ==
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
Cc: alexandr.iarygin@profitbricks.com, armbru@redhat.com, qemu-devel@nongnu.org,
 Li Zhang <li.zhang@cloud.ionos.com>, pankaj.gupta@cloud.ionos.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/=864fwlIo1b=4IhUWDjjsXs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Mar 2021 18:06:35 +0100
Li Zhang <zhlcindy@gmail.com> wrote:

> From: Li Zhang <li.zhang@cloud.ionos.com>
>=20
> When executing the QMP commands "chardev-change" to change the
> backend device to socket, it will cause a segment fault because
> it assumes chr->label as non-NULL in function yank_register_instance.
> The function qmp_chardev_change calls chardev_new, which label
> is NULL when creating a new chardev. The label will be passed to
> yank_register_instance which causes a segment fault. The callchain
> is as the following:
>         chardev_new ->
>             qemu_char_open ->
>                 cc->open ->
>                 qmp_chardev_open_socket ->
>                     yank_register_instance

Oh, I didn't consider the chardev-change case. I'll look into it.

Regards,
Lukas Straub

--=20


--Sig_/=864fwlIo1b=4IhUWDjjsXs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBSb0sACgkQNasLKJxd
sli7Gw//QbziAntZAoYRVb7k3TnOhfkgcfZwe7uVEKLBcbZtR7P1Nc2Ghiusdd0s
t8o7TuHfj7VkVLA4rrGCSR/G2j7nQB3vJmTkzx/1N5mMy26/77ItC9ghEWiRBhZa
dMNMFP7LoTb46S+M0Nip3oYETkLQOt+6MtvrkqdAa2WmCUHDIsHm0JE/03FxCy24
yazyPLxw2qwIAjE04UNnz+0tKaCL+CJzCe2tGKA5KuglkERq06YjtQXvBTv0rPZQ
elR6HQ6cTpuxxSAFbUc7ZrFUA9IfCzzeVWflnp1YIn80sm9mngcNVaPcICL72ndt
mGhikb3wTk00av9a+RiwXzvxhK9/ywd+9zK7cJ1veGehk/nsLrTU3bYYSs6EL3es
UAIcbDVIFE48RULS8k3RkXwJEPVaDc7tf3y1rCVctSMBnjYmzJhBe9EqZEcsz5bc
6AriXzsYQFfcdfda1tjpOtPxhKbHjMPV7Etf+IwkpWNyHQaPw1gO1jSE8DSV4jfB
T/waFDhhPl9wL0Rb9BMGom+PtVZ/++ubQXR7/RBEkpcaZLCZHlis7CoaII64kE01
ULJlvuk8PlOhjofHOeb6c+ecrV4a8tGpjOiXMcL26gP1lZNOy/pdaw4c08j8XFcZ
5rInkV8+GKMBR8+dagC8dbbfkowAAy6DYR8ECo9+Frdg5JhBFWA=
=BEDS
-----END PGP SIGNATURE-----

--Sig_/=864fwlIo1b=4IhUWDjjsXs--

