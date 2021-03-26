Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAC134A30F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 09:16:40 +0100 (CET)
Received: from localhost ([::1]:48006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPhe3-0001hI-SU
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 04:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPhcj-0001CN-BK
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 04:15:17 -0400
Received: from mout.web.de ([212.227.17.12]:33569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPhcf-0001Ct-BG
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 04:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616746503;
 bh=Jd0biYrjcmrgNdzGaOJnc2ZyFLBBPCzP/sO0jHNHwVU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=mu6t+rykIGhibOez9mp3N6f043/QA4oXDxQWI6vKJGLH9lNW+69ANmZ+lH6UjtxcK
 b759w21NL5fD4GLDqAGa3gG/7RqH6oWY7DQYA3Ob+tnJzgkBvX5dfX/mGZ6oEG++dk
 eRJZa7bVZswHUvzS3hB+o8U61QXQR0U45naG9vNU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LoHTx-1lrrdm1ln7-00gE3T; Fri, 26
 Mar 2021 09:15:03 +0100
Date: Fri, 26 Mar 2021 09:14:54 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: no-reply@patchew.org
Subject: Re: [PATCH v4 0/4] yank: Add chardev tests and fixes
Message-ID: <20210326091454.52dfe0e7@gecko.fritz.box>
In-Reply-To: <161674618525.8221.939854043515059690@72b6d80f974b>
References: <cover.1616744509.git.lukasstraub2@web.de>
 <161674618525.8221.939854043515059690@72b6d80f974b>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0F0dWrBBh6WYDsvpbqAVWeI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:IG30eqIu14U3Zuxc0ZnoOlW66SE7XXial0XVbd4nbZjsLZptQDT
 KS07Ue50wDKYjRx4a9h11xo4hFqdP4oFr7Oo6DFql3vnkuceS/8hCebhx9fNzZq7I0Aoanb
 5SreddsBYiwkU2PMCsGLwsGeGTYSwa87Q8ErvweP1HLEr9OwaQ/QOJSGYFN39Wo07RYkSLh
 yIVMUetRR1UdZFEbcRV2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AWNIxL8M4OM=:GHj3tEaGg95c7UGGXjnKVm
 zIN34irbTZclUWk8hcb7Bx1BgVC4w1Hkm+zB6sTeqdL5fumgVM556rGouSkrbDy+Vc7ynLYmw
 BXRVSH896W5kQXl+BHh/kId6QFo/dMILc2iOMM5Lcxs+PZu7vKvReZf7T2S1iDcC1GUE8x13w
 hqA9fB4xELGLoGVwt1kIcjbZz7iiBq8Pw1g0WRZZYnB9O54FLlbmUW6IFOZqwDvZYHaj/TBNt
 LU4UIGD/Yss3ZMCymNnyxuJqXbV12fr0VNmYaRR1GB1GXvfRT/lCMKmdERBjKFYnSYnBjWJ+Y
 TC6Ozm0Q7Re6oiOF5tP9EGmx6kMcZqm1GLRkhGsoKfgdDRMZsCve3kW6WgPobJq5uHuUjT+5F
 Vv7HLq9LwpHQ0kH9eN5I6gHsCngBw56AyLOB+fdplOnoDNVJJEBbRqDZfOayllxC5oJLEtCx3
 B/bkJiF1MhZl/aY//CFOJxCVKLX1PZ5yP5Pjsb+s1zC3WQe3DrZ7MQ16pl31ROou6p+5OFm4l
 CuoKT9CQsLOpCy7CEswdABW/TIJdaGTgidQoNK0YJmYhruLMe+csAE7iXb+3+hDnrS6TvR3AS
 CP3DccxXrAXtYwspSIGnmxm0miyYizMLCpxW0rubI8UBnK7lYeyjOn/xVf7VW8Il1oI8lzf/G
 Mf4aHNyQ04VnKqo+pWdPyzOHZ2yvbSCyLtKmPyWqYnBrqF4zzWVn/Jr+dv307HH8cdvoaMcYD
 U5uH3JoqnQlefh1nN5/98fBfrfkPKWuN6PL16rKgAKgewNfYBO+bRdmRgbjiWz4xXkyY3qRf6
 6Axv3//6Y4sc51PXhPlfuk36BNzpjsHFfAt0bkqkmJXXXSe1ujx/J7ZqXt0Ik16t9VfQV+Rxp
 XVzO4zy1ukZHdl/T1nmGCDUlQYGXWsr1igj9Efzus8zeQBQ63ou3QwhfhfWRFqdgvmAp/idiT
 jNuVsNeNDjUHhaaqScphHxfk+X5MdFugXI6ZlArT7kHI/W46lP/RFRELwcLqvOhPmI9dbDnj8
 X3+1Ulrt/I00a4ik1cCsyLTcaI4MXAh4FwYt68hiSaB1uLA/ALZPXGhuei6cLNwrR0QSgi7jQ
 vmW6FGNxLhtUMm55bfDdGg/zwH/wtOOLmJ+6I1DhmnfsfRlGsT3GmywBZIsgthC4CcUTM6B2F
 D+RATO4sBGMIoAxWBiy7MJNYdFl7J76nEHYKRJya6rAlJ8VGpMLwuKxbekdJN1KgKqHhQ=
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, FREEMAIL_REPLY=1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
 zhlcindy@gmail.com, pbonzini@redhat.com, marcandre.lureau@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/0F0dWrBBh6WYDsvpbqAVWeI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Mar 2021 01:09:46 -0700 (PDT)
no-reply@patchew.org wrote:

> Patchew URL: https://patchew.org/QEMU/cover.1616744509.git.lukasstraub2@w=
eb.de/
>=20
>=20
>=20
> Hi,
>=20
> This series seems to have some coding style problems. See output below for
> more information:
>=20
> Type: series
> Message-id: cover.1616744509.git.lukasstraub2@web.de
> Subject: [PATCH v4 0/4] yank: Add chardev tests and fixes
>=20
> =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> =3D=3D=3D TEST SCRIPT END =3D=3D=3D
>=20
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> From https://github.com/patchew-project/qemu
>  - [tag update]      patchew/20210323183701.281152-1-f4bug@amsat.org -> p=
atchew/20210323183701.281152-1-f4bug@amsat.org
>  * [new tag]         patchew/cover.1616744509.git.lukasstraub2@web.de -> =
patchew/cover.1616744509.git.lukasstraub2@web.de
> Switched to a new branch 'test'
> b0e7602 tests: Add tests for yank with the chardev-change case
> f065000 chardev: Fix yank with the chardev-change case
> e006dcc chardev/char.c: Always pass id to chardev_new
> 8a11307 chardev/char.c: Move object_property_try_add_child out of chardev=
_new
>=20
> =3D=3D=3D OUTPUT BEGIN =3D=3D=3D
> 1/4 Checking commit 8a113074e682 (chardev/char.c: Move object_property_tr=
y_add_child out of chardev_new)
> 2/4 Checking commit e006dccfdf7e (chardev/char.c: Always pass id to chard=
ev_new)
> 3/4 Checking commit f06500035576 (chardev: Fix yank with the chardev-chan=
ge case)
> 4/4 Checking commit b0e7602e4800 (tests: Add tests for yank with the char=
dev-change case)
> ERROR: Macros with multiple statements should be enclosed in a do - while=
 loop
> #228: FILE: tests/unit/test-yank.c:179:
> +#define CHAR_CHANGE_TEST(name, _old_yank, _new_yank)                    =
       \
> +        g_test_add_data_func("/yank/char_change/success/" # name,       =
       \
> +                             &(CharChangeTestConfig) { .addr =3D &tcpadd=
r,       \
> +                                                       .old_yank =3D (_o=
ld_yank),\
> +                                                       .new_yank =3D (_n=
ew_yank),\
> +                                                       .fail =3D false }=
,        \
> +                             char_change_test);                         =
       \
> +        g_test_add_data_func("/yank/char_change/fail/" # name,          =
       \
> +                             &(CharChangeTestConfig) { .addr =3D &tcpadd=
r,       \
> +                                                       .old_yank =3D (_o=
ld_yank),\
> +                                                       .new_yank =3D (_n=
ew_yank),\
> +                                                       .fail =3D true },=
         \
> +                             char_change_test);
>=20
> total: 1 errors, 0 warnings, 215 lines checked

This is expected. It needs to be this way so the anonymous structs don't go=
 out of
scope.

Regards,
Lukas Straub

> Patch 4/4 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
>=20
> =3D=3D=3D OUTPUT END =3D=3D=3D
>=20
> Test command exited with code: 1
>=20
>=20
> The full log is available at
> http://patchew.org/logs/cover.1616744509.git.lukasstraub2@web.de/testing.=
checkpatch/?type=3Dmessage.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com


--=20


--Sig_/0F0dWrBBh6WYDsvpbqAVWeI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBdl/4ACgkQNasLKJxd
slilqxAAtHDqSBld8WQ3AkOUhQpEbQ+6fm/LwpjCVGiWxWwZ5rW5P2ldKDxGn1Sp
9NG0HFEo5td5kSltC+A8lwYvrGr4fWqYtp4sdneSLIhwNfMQrEC8LLRP01SjJWpx
gwSdIEcIVMhfXGemg7uX0SPl3k4+a5lW6GKUyWtZt4FQSje9Ry+XfKlosbc4Euz/
axNEYP1Pe5osjYAHTGPSmTtiep19upjIhUx22S4454ZBNBrtvElyyMxUEp63TTrd
WoomNUdG2aHvGzcP6QuHUCkrxYLWCjTAFQdpqZJzLpVILtduFB6cQmwrLBybjYWU
7MO+Ry9ld9ip8fQ9W86k90ABGycE2j5oI/oXezfgNk6IehSaFcdEuJQK5OL47NxK
VN/657l2eZJ95VPWhVuZ6MP1PsQOKOe5LAG0mphA58lsQPoIOapUHqHLjl52R3Av
Q4Ek4RmOyG/5Cqy65uL0OAmqwGJa2jEIzDHv8kH71L9Sw4RgnhG89eFz9M1+BwLE
pbh0t8WZ4AHiI++Fu90c/wixOW78YRAvsn+Pt5s0DAPj5lFo160HIbOblPBllMET
q12zDhsdsQTdsRYYaLGGUm++E/RdRAOQ13o8AWFxJGVMs/T/yege3aZh33VlzVUd
M8rUlpSJ3AToaNug2AYRysL7MLgOAWAn1ylWv6Q2sNjtirybtpU=
=aqoS
-----END PGP SIGNATURE-----

--Sig_/0F0dWrBBh6WYDsvpbqAVWeI--

