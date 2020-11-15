Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A222B34AD
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 12:43:17 +0100 (CET)
Received: from localhost ([::1]:41188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keGRA-0004x7-2T
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 06:43:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keGKh-0005MM-90; Sun, 15 Nov 2020 06:36:35 -0500
Received: from mout.web.de ([212.227.17.12]:43159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keGKe-0008L7-V0; Sun, 15 Nov 2020 06:36:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1605440185;
 bh=JmiqDl6XpRwd1d8HX6JcVAODaYhiNxH8lCQr3soufF8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=JX5yhI1SeTQ9SLHqcYZgQjpRANVAQiISnXb1edk0t1zw2xaPeSajklRH9m5MTMSTr
 oJr7gxg8O9Ib6z0Da5/A9ONnvJRJNx17vm1lO6aI4Ne09xyeU5j+AOGb8+aCBHR1ni
 gCGDA99xvoMde71cL90Yn4T/gEGvmaM+4Ua0E330=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([87.123.206.172]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MVtxM-1kkxMn2TTE-00X27P; Sun, 15
 Nov 2020 12:36:25 +0100
Date: Sun, 15 Nov 2020 12:36:23 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v11 7/7] tests/test-char.c: Wait for the chardev to connect
 in char_socket_client_dupid_test
Message-ID: <1318bc2b2d8254b972bc9f2a5fcc05cd79eee513.1605439674.git.lukasstraub2@web.de>
In-Reply-To: <cover.1605439674.git.lukasstraub2@web.de>
References: <cover.1605439674.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/501dvskr5C.ifACNmwoBDgd";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Provags-ID: V03:K1:9wFlkpRheyIy9h6oIeWXW2Ov7DXp3V8BQLa9zJNStbbkZE6iXeK
 L8uJoaO9guY41UgkqwSNs7srRUZBZoYDashCBjvsa4HmboQoS7bGbV0sIrJ2gf4ylLOC+/z
 UBcOLEAU9H8XcytdCwpCZOpDCxRLyPaqRVoWqigGoD48lS0eQQK6k9KmQBa9Tu25xKH4/HK
 C5cLcWXzi/jZPa2kIDCaw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/DRjsa7S6Os=:vP6F0VYDJVzWwzM5KFCooc
 Zfn17Fcp3+nwK08UBJdtDMHPW/84V1Ns+pr87ukSqR9u1ASNXt7byttMEiuRxaLmYJp1LMrBD
 8KyBu4X1rN8WAQ1iqec/7SC0y0Kao8AdVwXBRpTUcMzLYJxhJKAU6rFxdESKepJ0jJVnP5eLc
 a7rKl4OMiTrkM48n4TCoUKl45gvLsXepe/Lt1ouxQzKBWzcx69N3lj6kCElKZ2b00mWL3KhAu
 m+aKlfrSCuBTMyXea6vnarQOUg9MnPAJH+wlvPX+PMg3xC1sOh5xh7yFr3NiQnJvholejUcxD
 mWvqQdF46esUofh/ygJXMytu4nxDDaqmoF7gFc8LDhET1ROUDdTkv/GNIp8HisBTgjkPQ5KjC
 B+8W5bNPKEMVWKTPJQyaHSjPAjiMs/S1UbRgbAW7syyYP1twQlRSrulqSY9KDzYkOpTSq3FMX
 8hsDw+1L19+tudhNm66m215+qZU7X1+zhiPaTUl+O4VrOPjHrfapUuWxzGv690qkNqicT9Owx
 SfkK9yHLQOZ8yk2eBtTg2rfLzLW+czHl26hQAxySLFPT3UPSG4Ke2dgq1GQ8Z37YWDV5DyIRM
 NEYQ7U8iqe5/rA/uHPBjaZhzNkdxN9nuOSFZB5AfP6+UYIXU/E6tCa7sFd2VmyAvHy0pSHUJO
 O3i3K7gHxQkjYYn6zmowbggAI0vHWT6d80HQxCeCoffX6CFbf0jkM38cFLwEDVohP2TIZ8+zi
 IPOcT/0lBGKoA4+S4LQCMkqpKtXjNjJ6xPfuHXp+wFTweBxax3mSqEjn3eNIBSWU3C+PCdGtf
 24L8eD9hZs7a5MKKsWy06+FI9w/xBzbra6Qn8P68WWnTAQRVMRzPX8fwPD3LngbhnV63HPzrU
 hrRHi13WRnvG32WnOLUg==
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 06:36:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRy?= =?UTF-8?B?w6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/501dvskr5C.ifACNmwoBDgd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

A connecting chardev object has an additional reference by the connecting
thread, so if the chardev is still connecting by the end of the test,
then the chardev object won't be freed. This in turn means that the yank
instance won't be unregistered and when running the next test-case
yank_register_instance will abort, because the yank instance is
already/still registered.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tests/test-char.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/test-char.c b/tests/test-char.c
index 9196e566e9..aedb5c9eda 100644
--- a/tests/test-char.c
+++ b/tests/test-char.c
@@ -937,6 +937,7 @@ static void char_socket_client_dupid_test(gconstpointer=
 opaque)
     g_assert_nonnull(opts);
     chr1 =3D qemu_chr_new_from_opts(opts, NULL, &error_abort);
     g_assert_nonnull(chr1);
+    qemu_chr_wait_connected(chr1, &error_abort);

     chr2 =3D qemu_chr_new_from_opts(opts, NULL, &local_err);
     g_assert_null(chr2);
--
2.20.1

--Sig_/501dvskr5C.ifACNmwoBDgd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl+xErcACgkQNasLKJxd
sliRsxAAk9W1zhjA7kvgJcNPzjK5d4wzkQgY3PcFBXznNlPkM+LfBYobQzJkNttO
IJuWajFr7eV7DMeSQfzPHdn7J4fBL/KZb6V6sttp/UyHITkiZ2nSE8TX8Myrt/r5
BfUaauc+y9nLhOEi6ZRONdzUIU8JMruRF0ruYCjFScDBXxUgPSalrJoUtJcH3Rrc
Deagcj5hW4oQcCsM59HyUdXO8iv5Hf0ybR9ilWfLkz5LWCY99fOzA4ZoQEH2xnFh
hTsv93XgIwlMZhwcgR2UDKSEk6hXpSaiWjStHLsmFGBsjm6+uVnImT+BGTns4P+C
M0CPJbp+35XwL7fkrkXIUROot6Ms9kwndnvG4jKCSltCHG5QKB/U2JUyZ2zpLj40
eZY6HYNuv6wdRHGYrt6auq8yc/ZG0xmhyYRXFB4mBiykeFh9fVPpOjmyeTp275+f
ZZRlctOQ32Nmd68uWiQYNWWA9IGxEIG5nZv1S2giZYBlz6YMpOEFIUd2trqtE3QT
/2NqoJdvRzNP8swrSHZZ+QX1OpIky+0Y9ytEywLs6/gPuZ5wkh8viTw/uVNc46Tl
y22Cpxl2vvyDN/yGhKIZKGgtENSUsJXDBNzp/6YUqZ/uXNPK8UPASxyG/zb1863C
RMDwnYIK/ZSXlB/eFHOXPVziWOKT9tj5SOGnM0NaECvCiTravSY=
=dlMT
-----END PGP SIGNATURE-----

--Sig_/501dvskr5C.ifACNmwoBDgd--

