Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AD334AC47
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 17:07:38 +0100 (CET)
Received: from localhost ([::1]:40452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPozp-0004sF-CX
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 12:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPovP-0001o8-Sn
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 12:03:03 -0400
Received: from mout.web.de ([212.227.17.11]:60857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPovN-0001VK-Pg
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 12:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616774574;
 bh=9cc01FsYGllRwADue5gyIwTDc+gBaNshMoOZs+4lPFs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=X7MVWfUFnJNp18zFEIrzV6uptUwYTw96waoU/cmxPnpFQUsGwA2RQPPt5imcpzhxK
 xPRQUVmyjc5otUIvj+WKuZkWKyASN1YhLTB3+JFPQ5eUcLfcszoM4TMUvXDmiFj+9j
 fiFF7DuLOY/tYd7XjGWkmj9oScE/badhG2RFyqsw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MrftG-1m2VBa0s3Y-00nhU6; Fri, 26
 Mar 2021 17:02:54 +0100
Date: Fri, 26 Mar 2021 17:02:27 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/2] Fix the segment fault when calling
 yank_register_instance
Message-ID: <20210326170227.2c2b3598@gecko.fritz.box>
In-Reply-To: <87sg4ihta0.fsf@dusky.pond.sub.org>
References: <20210315170636.704201-1-zhlcindy@gmail.com>
 <87sg4ihta0.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QKU7sv.JPgkTy1n21g9MtA=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:8POStE+fh9RJnXBQRVZBlJcuCm8jEI2zMMm0hZym1SBql8yqzH9
 clAIrF3S1A9ShW3ELYTO1VR3Xg8D6lnfA4w60+6bO7cMhP7xdvE6hi8i0ArDaCsUgw1udkG
 56umaRPSmrZII1sFi0b4mO/AO74wPUKy4jcEIQFqEgepAYbV/mxsuFxFAtZwAH/0Y1ffNEj
 BXV+goBZYJIDpbIkoKfOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DIe9XxJnfHU=:PhIuxYmvy+XwJdraMTd3xU
 n13zmHzF7RF2oIX3FvzN/rWfgyT4R/MlLAWxcvhExXmEBNDUIyh9bVzC6L5z58ky7yVejb7oU
 B5fHVkJPRPREYDnucb/FtKJpAXVYMvzkCSZCEXuAVjaIWRbgMYKmrb8P9BiO+w+/kjWYS/vN5
 udPCtJJrncU7jWdDbxBnocFkuuvJS2Cm3H0qoClmtyXcKsN120YFOBk4zjAXl9jIafmHhcdS9
 k8YigAqWHRRdurDsIkwHxEQ6wIyI0FF9CBGPgXXNHa0Shq59aTr7UdLJOwy2eg3zp2ZI0UnxK
 dtEDQnodavN15I6CP9hKHzwDw27NV2CN2IVeka6XB5++tNqkPc4+rTJLsjmHxleP1iKfns7MG
 EMoeu0Q1Wz3dZu+Z3tA8Dgqyxo3KR0mF61KomDckrxTxJq74QQfMdRZZfUK6WDcna7N4Bc60z
 1nkegc5jCCqHUNKmWc5xOPBuljY70Q016WfbenHAAY5ab3YO3hVRnlqzU5kztfMtOl22YhfDw
 npiL4CZgY6VIZXHjOOC4hIbzsnRc3Bqu8V9EFXS/q3frADkflwlGHD2bKk8YVAihyT+rAw5tU
 Ab824jJr6ZXaFybOlWlR7NQCws5CWrigDcAv5gaXY7mhvxCMXWZj99teE1+4PAmpBL53Q2N8S
 KlCrPtisoR1OIpX3ggZAleYWtatXpW0B1q0W0eKH+9TCQS/x48asxLkU6DFEnUsPfwrFE/EeS
 N6lrpWN1+Rj3Us9q4t6lGwZge0Tc8vPOPbIwP5n0Y9dLnbH8Q1/zk1VhPxT2XISfrse2T/VzR
 QsLth9NqEV8ta6rGKn4AT/+iNS/dhHPYdNo86gx6DDe4pOwlWuMczjkz50hV0uUtq9KVGmR9H
 eyIWt4GuxwtKAKzE0YgjaUzuoAlhx1r710v+jbrqNRv+qQ63V056f3S7NCR8dg7icV+oBPp8l
 H8bVqIpsvgjVhN4G3Cr67AQulQ7ALoykZldS5fLadKQGmdlkrKwC3AylrJ+Iy6t+RNbTjNw6l
 fkafF75QHBq87rbUOXiXbsTlFm7W9OJukHmMhtHf+fvpREyyAufq1c4V/j2FeZ+0bm+G6Finf
 CwsN0RMGpH5AucJYnGkeFgZdlW8DA+SQyxKIfuZVIqgjALsxp6RnwV1Qwcbm4UCwSX+E3ZBOB
 jMgDQ8gGjA6mj2zvMHuLa12IuP/ebqzo6o9/juUDSqMiBMxkEYYtmap05uN+6NAqGk2tg=
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
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
Cc: alexandr.iarygin@profitbricks.com, qemu-devel@nongnu.org,
 Li Zhang <li.zhang@cloud.ionos.com>, pankaj.gupta@cloud.ionos.com,
 Li Zhang <zhlcindy@gmail.com>, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/QKU7sv.JPgkTy1n21g9MtA=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 26 Mar 2021 15:41:11 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Looks like a bug fix.  Lukas, can you take care of it in time for 6.0?
>=20

Yeah, this patch only fixes a symptom, but not the core cause of the bug.
I have already written patches that fix the bugs inclusive test-cases:
https://lore.kernel.org/qemu-devel/cover.1616744509.git.lukasstraub2@web.de/

Regards,
Lukas Straub

--=20


--Sig_/QKU7sv.JPgkTy1n21g9MtA=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBeBZMACgkQNasLKJxd
sliyqg//TRVr+YNqU9zQxFBkK+GX2+qJac0tflCDbMnF9GCPnJ1M4T1QnJZvYtws
fIzm79hUH7UQsAVgpZo5voHiWp1AaKgV03jIAk4YgxCyl1OmhrZiRwILoQGEi7Xg
YMkMTe/oUY9FCyemJXZGOpfNmWJuSync0+focMOFqkcX4mspLCFTZCroyupewzqk
xBvt7xGgwkv9HG15cXZaafxizL2pWIMPmof4KSjeeM0ce/Xuaa7FJE2R+eae8o7y
4/OHWwgE8fxcwKEM20uInTynDDy23eGy7Yv8jwSF8KbVh8GBSyD6LS7ZmAuU1usY
3CJq07QF0g8MxemmvVWtKE7UZj/k4c4m+FkfBZEtcQDGP82k9qpqVU9DabIsSyUN
udwhTcxBDGi7/aJU/Uh5zzWA52ygqKEjHOf17FkOaIl5SAnGLt9069wkiF+JYeMV
Z5SDfZnXh+iZjw0VoOTTFYEIEKATq2v/QNu4pBccGq8wPDjiMCJ1R8VD8ijqiQej
EoYZN0K1ofHsz/Y3I0JOaQrBZJSv4Z5Vikbs+qgpKCSKFBTgR6OLASkXtZ11fCft
c2anjrqC7PdIHhUO0IF4a3p/9bYiXwoI/NtBJoXO8g6oHh/ms1z/IJfkQIt8ZBYP
Ko5n1q4/0ZQk4b8YQGQQX4uTEyCx7OAPrg33TXOqVype088IR8U=
=kZRF
-----END PGP SIGNATURE-----

--Sig_/QKU7sv.JPgkTy1n21g9MtA=--

