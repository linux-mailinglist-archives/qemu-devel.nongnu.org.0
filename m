Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE34E2FD97C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 20:24:18 +0100 (CET)
Received: from localhost ([::1]:53784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2J5V-0006AA-SF
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 14:24:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l2J36-0005R1-LA
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:21:48 -0500
Received: from mout.web.de ([212.227.15.4]:34193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l2J34-0000zt-7m
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:21:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1611170490;
 bh=RHe1AZSGtTBH3QhqqWzGrcgVwMmSnFcfYgOgpI4bXFM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Xft1RdeVVyiiI2FH5l4CNqDFMwpQuX/S+c6sTVGcXCUCixQmeMARMjtUjI3W+LpCU
 hkWdnyJrLxGl754CWtx0Cah8fwaqJpvNUxVYI/jSnWdIoQArwmYwfS9NoicvURlP+M
 wh+OgurGficbaIg9CpJpbDelOxX9UnTmwYLFz898=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.127]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mvbik-1lugaF48us-00sdZW; Wed, 20
 Jan 2021 20:21:30 +0100
Date: Wed, 20 Jan 2021 20:21:27 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: leirao <lei.rao@intel.com>
Subject: Re: [PATCH 03/10] Optimize the function of filter_send
Message-ID: <20210120202128.371778ff@gecko.fritz.box>
In-Reply-To: <1610505995-144129-4-git-send-email-lei.rao@intel.com>
References: <1610505995-144129-1-git-send-email-lei.rao@intel.com>
 <1610505995-144129-4-git-send-email-lei.rao@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y4RT8syFAWZ/r/tAcDQ29Bs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:Z18+19cwZCEjhvvAQ2CkkT1U0KPdP5rQ2Psmvn3NpCdoR3FWBEO
 PqI6DnAQIZoCtuEDKJaNVLSMhfPwLzVZIPErVvkZ2233Ba6IwBJ4y9kxON93G0vWiiabFmB
 yCLd3rBDHu2AJCwen3v0ga/5H/71AW5gCPTaDQOlaMNg3rBHcvQwjEzM8uIfqscatdhxiGf
 yL1b8lauvilYq8rWMzUgQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YoG+XAVdmDA=:6hOoTaOMXp9j/MO55v7uw+
 4AdEV9HV9y1C4HMA5Qjkw+tkiCWAJfFGUkFNKcJgQxwQZyEqK/OeyACVsuhcBtwq3YLlLxyn8
 910R6L6iU6xXCw89hbH402htTQu8t9Bs91n+OPN9lYD+nIRA4scE64FBlg2Uhroi9/YwslHuu
 51AYuwD2Xt2ggfSn7Z55Hjk7U0ckvjZXQEZQo02Lp4Kju1t+z+MNSYtCPtz+I/USK8LsHx/ZO
 DJpEVG+MzrmpRdZl3TfrODXgrlqFURlqxfjKi5SHqcR5vEFJmcrPKHW0NF+wr8Wm2gZ/iuhs/
 Xi73A+mhVfTMWgFCYTmzxY9PHlF/WpsjNrD4rj2cU8JNXsMjn2jHrXF51MGqMc6/E+YNq7MUc
 ivrWfPxfCyUc5G6sZFVS9lgzIkZ2e8AV1MbQWBzXMY5hUSSR9IBYxyHv+U5WwW9NdT6fqWQ4K
 MdIGK+rNCGEX15jMe7J8N1WEvACA5sgzEaA0e3b7g7HwYnwIuz35wD1g94ucgqATHsav5YJl3
 VQ/03qxdh26oAxDZuZAN4zV2BZet8A5u96IA8PWXZdmDQ9dLaoRENq+ehKboU8LDBr4A1IwjQ
 wb/OTNHM1cQfQA0bBmVx63jlyEJ2hv5taA0V3a47xAWnsYQ5tTD6z83Q4bVIrl1FVal+uBU4x
 GHwNs/LwWxN+iUT1qD0Ok0Sc3UxV6YJKghJE4Aoem0NHHe/nzZxZDhU/IpZbqP6VslKyoTbLT
 Vr5sA4WxnSQ11FIA0zA/pF8RejYq+HkZ4iIyhewnvq5bMnGApnbhH9WD71YsTWN5HnfwMSXwm
 LeH7Gq1viQ3q24MAps5EHMwQ/Bd8mjqfSViWx+fdw0viwBaEhIMgk8e5wRX3RengxswgzNytl
 xcHlNf4QASdC5CnLI4+g==
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
Cc: zhang.zhanghailiang@huawei.com, lizhijian@cn.fujitsu.com,
 quintela@redhat.com, jasowang@redhat.com, dgilbert@redhat.com,
 qemu-devel@nongnu.org, chen.zhang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/Y4RT8syFAWZ/r/tAcDQ29Bs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Jan 2021 10:46:28 +0800
leirao <lei.rao@intel.com> wrote:

> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> The iov_size has been calculated in filter_send(). we can directly
> return the size.In this way, this is no need to repeat calculations
> in filter_redirector_receive_iov();
>=20
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> ---
>  net/filter-mirror.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/net/filter-mirror.c b/net/filter-mirror.c
> index f8e6500..7fa2eb3 100644
> --- a/net/filter-mirror.c
> +++ b/net/filter-mirror.c
> @@ -88,7 +88,7 @@ static int filter_send(MirrorState *s,
>          goto err;
>      }
> =20
> -    return 0;
> +    return size;
> =20
>  err:
>      return ret < 0 ? ret : -EIO;
> @@ -159,7 +159,7 @@ static ssize_t filter_mirror_receive_iov(NetFilterSta=
te *nf,
>      int ret;
> =20
>      ret =3D filter_send(s, iov, iovcnt);
> -    if (ret) {
> +    if (ret <=3D 0) {
>          error_report("filter mirror send failed(%s)", strerror(-ret));
>      }

0 is a valid return value if the data to send has size =3D 0.

> @@ -182,10 +182,10 @@ static ssize_t filter_redirector_receive_iov(NetFil=
terState *nf,
> =20
>      if (qemu_chr_fe_backend_connected(&s->chr_out)) {
>          ret =3D filter_send(s, iov, iovcnt);
> -        if (ret) {
> +        if (ret <=3D 0) {
>              error_report("filter redirector send failed(%s)", strerror(-=
ret));
>          }

dito

> -        return iov_size(iov, iovcnt);
> +        return ret;
>      } else {
>          return 0;
>      }



--=20


--Sig_/Y4RT8syFAWZ/r/tAcDQ29Bs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmAIgrgACgkQNasLKJxd
sljHzw/8C909HhSQsib7DAkRWZ3Wwt1jLZMAnDIYfSTQr7IiE8xLKiZjqoDLmFLP
QWBVscQFwhbcArWIoj58gTsoYErREzTWZ1w94cedGXpy+VqpAmWucwJXJ2ztrftR
lN+f6ALAPcjbbSfFx/R+GPY3wyYxnaLCKFzQ1JMwqAhjWIkWXHgJnj5JzaqO+VzA
4in7NHpJap5SiAeu28Pe0+WVcL/AF9O5YIEH2marrPdnwgFs2Ex1OsEdTzMoTgLK
BAaDijYAZQ+lbVramJ36FIt6/7W3gXvFgRS9iM9M8eHT/CzoMLad7k83WmtpuNkl
Nsgq2aUjZkdnNEx/lm6wfLuHmSLQzrgWvTH/eHn1iJvjOc6ZRgvDPv8O04G7CPBu
s2i/S8esGuiXQGlB9cYWOAvP/djKzoAsc9SlTkX54LFd0ZzWLQY+jnOF1t3gcrtk
ty9A3ezkaK6gPgjmGu7L5czkxX8Bfgyw1dsuTdBU3W3ZTbDTnYHHG/QHEyCu8HLN
S5baRtu/SK+PqnaGNy/Pq6gcGgxq3tVcrjW/bymVfywOk4qwG7Nx/YHrLZWZa3Sh
FDBOn/TPTo499Y2ChUijyuJHOpxwlVUfc6V69G1/qrdq0Xpl4AVoLgSphV+aMJcA
UzxICgs1WDofiZtlwwRejmLLehuqF9z0l3yym+Fx2mu+MWi26S0=
=sUGy
-----END PGP SIGNATURE-----

--Sig_/Y4RT8syFAWZ/r/tAcDQ29Bs--

