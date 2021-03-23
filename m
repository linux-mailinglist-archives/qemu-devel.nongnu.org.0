Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463DC346837
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:57:43 +0100 (CET)
Received: from localhost ([::1]:54088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmDm-0004ay-9W
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOlHw-0001sU-5E
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:57:56 -0400
Received: from mout.web.de ([212.227.15.14]:34271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lOlHu-0004I3-Dd
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:57:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616522269;
 bh=LXggCB8ecqoSh8tjz0A8Nn4Ru5bnI9kUzCo0zAKIKgQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=gItmfvuyUhJFzwlil5Fz1aJ48asx0DdLHY0fx+5BAuhRfyvftuGQl4EGfoVCDozWZ
 7rc55FCBAnY0kghNsScZVkHYF4JdoIgNeGy5YiaBr0mYg8bjbHeUhwQnez8oPM9rm/
 YT5z7Eit7ZCPHr6BLnGIXkG13uT11DXECfGh2x24=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.81]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MRTzc-1lDmx315Ds-00Sgl4; Tue, 23
 Mar 2021 18:57:49 +0100
Date: Tue, 23 Mar 2021 18:57:47 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v3 3/4] chardev/char.c: Always pass id to chardev_new
Message-ID: <0c5420ab030df09cdd4189e39f2182acde7b56b7.1616521487.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616521487.git.lukasstraub2@web.de>
References: <cover.1616521487.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o4=gMJzCVhayb_z6sGRxA6p";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:EnMB12kfrBgmBHZhUUbLsKPy2zK026TDkNfSGiJyr1V2IH1DTiJ
 lbbYr0ZY9TEBWbStn00qILjzCj2APBk/ZH3+SdTxvy6q5b3GvClwbF/HQl2W3fwr0qJEc1L
 OAMKDv2E5NgtQm5kjpQlW8fgWfu5hKKt5IF26p+KwAZHDlAB7462e2syY8xVOw8u7SEDE4a
 tU6HuBMdssfR8n1nQwbeQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WiRvsIEdFqg=:9gaeqswd5f80Iuqc4oYe1w
 vvGrbajbKrpRT1bc5f6Z5fDuPc8/X7/n7TSDuQADyNuMeunGUnX7Y0A6DFOU5hmIDbjxLttZR
 G/LYw5LT+AY22l1MPpI9r6gYfDh/i+Nb1LV/XV8sCOB2Th/UwNGP6hxD4pRhT095H7kDqi1Ug
 zeR2LfTuSInY5exTzuUHXUb3nbXuzbTpQmxtP7aAAWCDj/qSoS4rvYldqWyVyff5XT9vDR745
 fLkHAyUMMulWvvvaGDZ9KrXI4Vzio4VzdSyvlXj3xxKhGUvmyGHiGhQ2ewl/e0KwyuovZQkxE
 xzoS+qZyc0rbbVBF7ZF0SiJ55WC5BDog3ZsmSLP7b6ESRuO+a3nVDynQpxwzBgJzC6JVmGJSO
 2Q5nAaRgjBc9qGx+3K64yu0ioMItEmGikN4NczlFTiUjVZfb+xgjmyjS47zeZj3Fap+m3yTnY
 Zg3utSkb+Zv/PioiCjCjZRE72MmpCW/7gcMy8aZF1zGZ+qcAyq46tysyHWzKSUB5FCrobn6Yn
 AmWKi/GvdPwV/iz7uwwL6YZuiLEpijT4R4LlCX6qp7ad0W0IZBh3SGlT3a7QmoD4atA01ZZnr
 7Vxe3YWXP846Eb3cqrFYVrV65idFpHK+KcWVf3ZWPmH6sbSejacQLKzTEOwZ4wndovCEEKb7f
 sFhJBhcmIQ5ajkp0iL5G+F9+qFMnwtFJnxZ3qL3f6gfCQV7kfkmvxeMwuJTWWoPy687rUp7Aw
 JXeijonogLMo7gnaj6XdBpbPnN+WXDZqYlYkG0lN6QYkqXAFAPY2I/9uCFdihq59lk9Ji3Pu9
 WbjnzSnHy+gEUJV+thPu8r29HTiDA4DgSIa6UNSdEen/4aIWeXU1ZnmF2VcECLZsqR07/Vp17
 UVt4rV5yYPWLTJtbWjQA==
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li Zhang <zhlcindy@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/o4=gMJzCVhayb_z6sGRxA6p
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Always pass the id to chardev_new, since it is needed to register
the yank instance for the chardev. Also, after checking that
nothing calls chardev_new with id=3DNULL, assert() that id!=3DNULL.

This fixes a crash when using chardev-change to change a chardev
to chardev-socket, which attempts to register a yank instance.
This in turn tries to dereference the NULL-pointer.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Tested-by: Li Zhang <li.zhang@cloud.ionos.com>
---
 chardev/char.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 48f321b3e1..75993f903f 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -967,6 +967,7 @@ static Chardev *chardev_new(const char *id, const char =
*typename,
     bool be_opened =3D true;

     assert(g_str_has_prefix(typename, "chardev-"));
+    assert(id);

     obj =3D object_new(typename);
     chr =3D CHARDEV(obj);
@@ -1095,12 +1096,11 @@ ChardevReturn *qmp_chardev_change(const char *id, C=
hardevBackend *backend,
         return NULL;
     }

-    chr_new =3D chardev_new(NULL, object_class_get_name(OBJECT_CLASS(cc)),
+    chr_new =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
                           backend, chr->gcontext, errp);
     if (!chr_new) {
         return NULL;
     }
-    chr_new->label =3D g_strdup(id);

     if (chr->be_open && !chr_new->be_open) {
         qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
--
2.30.2


--Sig_/o4=gMJzCVhayb_z6sGRxA6p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBaLBwACgkQNasLKJxd
slhTKw//Yxzsd7Jm5xcK9HPU8kq1so0WQ9BoCcLyu9+us+2TTJ/N1xcsHIUWQq20
W/ZiCv+VMb1ZsfJjpOgalpr49POvaJ7r0Y4XW0SJmpPbCqT5Q3sEcLAFuiGIzKdx
vsRhw/BVx5wCe3wD2Fa2MmkxCxjg7UIsmTNE6r1TSC/X3oYE01KJ3BeGB5qlFZOz
H6+waJW7w3mtcdWO4JQ8cuNywrQjQNgQazvUECD6U0remeB9epW0o6s5kcQFJgmM
3UFxQ7mMnwjBp49ppvAZEWFebwXy/RQ0mTfphNpDViJvmi6Cm6yaYH1NeopBLc0Z
BJSGDQTBpv90gxjzfi0R5XNyTij/0Nrr57tljgrKaFVJ3tmSkn+pXwtjd+8a5Hm7
yGk+JLNYOJsSr3QxziAIuVD5s7hKEbFBtTQgbSkRECFYV0OgNvAvnF6kVTz7Jo2P
9uo0AuZSTbZWreJ1MiWIcHCheyBDO81b8eeGAvbuavf8CFv6oA39N7t5ioNRWFLj
OzoN/ocCrxGodjhXbDguBKzDt09Msxz0C0sBsv2eY20TF9qvCwJdzv5sCyUgGYr7
lgoFe0XEApAYmttNi4e4Gs+GRjoIw/UVnkmSjuPlMXR0inSJD3Bbtwd5SPzsS6mq
QvtrdfKYO63wPyMRdPb2LgrOrpVw6TvUt5SX5OJ0yFeSmkVRV9c=
=d1ic
-----END PGP SIGNATURE-----

--Sig_/o4=gMJzCVhayb_z6sGRxA6p--

