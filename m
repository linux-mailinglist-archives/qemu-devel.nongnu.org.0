Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BD72E4175
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 16:08:16 +0100 (CET)
Received: from localhost ([::1]:45530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktu87-0003C9-P0
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 10:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1kttzH-00039R-BF; Mon, 28 Dec 2020 09:59:07 -0500
Received: from mout.web.de ([212.227.15.4]:52939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1kttzE-0006c1-RX; Mon, 28 Dec 2020 09:59:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1609167538;
 bh=ipBmsX1SFyAij89NB6kxoOpqTTdNm75hepOGVJoieTA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=lgHODEMwIBYTs2U0Twxbv7frDFEc/gs2942//wkYIJ0uepUETGrevHwrhFGutZsYC
 50ltj3ISUsMWqcAT2N+9Ia53e3pOyC9/Ous2fg1uQnLr3N2EB4robZc1O/fuISGt43
 A7VfqqVjnbhZ1TV+9wjbUUDya12w0Xtm0yzmWCqA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.94]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MCXVX-1klLGL2qDz-009SnD; Mon, 28
 Dec 2020 15:58:58 +0100
Date: Mon, 28 Dec 2020 15:58:57 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v13 7/7] tests/test-char.c: Wait for the chardev to connect
 in char_socket_client_dupid_test
Message-ID: <164d36294fb8d85727e9561ed26e449514f719ff.1609166587.git.lukasstraub2@web.de>
In-Reply-To: <cover.1609166587.git.lukasstraub2@web.de>
References: <cover.1609166587.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G9s=tPd95V5mxr=7vco_rF1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:DGCGrIHVEJ69kqZBeKPYSSR++LiiAPZjDAQ2kTpqyYvvAaWfj8P
 XJJxS/GKWB9bJPJUpqzSWI2lNwBeKS6qGd0b+vFuPXgH+7LbYLFXGdPj2E/RSUmRyYtKkkk
 DDIE9P2FlJ0x9INvMk5ZkDfApG7WyarD/Bh3frP+MhhiBjM3pkYTBjb2aWIK4bt6r/3BQrj
 OJa8/9jHyN2mQujJW4SAA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DMHKrTPWo38=:hlhWgb+p+SYiB1S5oXXcFj
 Hi1bXRDiqe9ofhV5DSBEADzekLqV/ycEwcwu/saZSY9wJnbEXQUi5VD1qMr3FzQdD0ddRHPmt
 2prNv23FGKBa+jTYvHfJ/Jtduy4c0PBS0vVbA+mhZFOKKdqvSiFGjbrqYcF/q9KTAjqLCiscJ
 5ejp5SxFSkSEMEKQct5NfRD7W5IOkig5nzZb2L9+eONDtktHJ+vsRh8Vi5kpkGfr6Lujo9L/0
 7MO2mnW/grz6Zc6YZ4gCaDGC+5TFM/ni7Nuzg8KrlM3E4LcvOFa6JNkRfqPFS/LrAzrJN+Ces
 YN+gth/5Im87wRVETAEd9zlcEb5jkygVkvOHLGyFMUHHp5o99lFkxCuwAlC+ijnJ+LP4LFkgH
 6Pk7Lj2TqOl34EoYn68NbSY6tPGF9ONXG++QLJONry+YR6UbHbNPWD9ivYCE5HhXQEWbSy6dr
 /IskCBicHKB+KXlTRPTftHg8lgcE8hekhESl20X8QcMJoY2lHieLkZ2VSnUni6wg5yBraxCPl
 FU7GN4n4jP9vkHQxa5T8BxAeLFI96A7dRbLKZgPcQpSjGFIc+iulmae/OasDquRiwvnXgKzRa
 Q5gs+nFQpaqxlTYVKj575IaaQcRTGf98Gg4vLZHyvE8nf0YzLNmkSoLoicKm1+HbNgUXSZCP0
 WpT0gya3Sp5P8Grv6AN5hA638oFIRL8HjA8AGxnOe1BQWO8F198uCEZAWQvKIHNCeCyFJQUcD
 Ah3Azc5hqc6V7QtdwNgiuRIs6K9iLyEGAlI6VMoGi/sXBjjV/WU++u07/IBANE0MIoAq+U3QV
 8Akn8vRC4bzgpSJlpA2DiSqAByDnPMPFXVUHnhh2g/R6tuaV7x/TELkTmt9O+Q/L0S4bq19C9
 +CyNY/DNtXoaY6F96xau6Jdeohc73/DWTLHNcG15s=
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=
 =?UTF-8?B?XA==?=" <berrange@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr.
 David Alan  Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/G9s=tPd95V5mxr=7vco_rF1
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
index 953e0d1c1f..41a76410d8 100644
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
2.29.2

--Sig_/G9s=tPd95V5mxr=7vco_rF1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/p8rEACgkQNasLKJxd
slj63A//f4EPdB1qdhJtdwpPuLXxpuhAl6SXnejqopIpjLlpxD8oC2nXOHQTqyJo
mKoJ18VzaAmAaObWorZncAw1+tiohy8hgqTD6PJ3LhGTvfQy8lqEuCbsPVTh21Ye
XG+7hbHJYQnm8ev7YmJjqD9B/tLNRxmKCsSl6MX6s1NJ2NxZB0Vfa2IVQaFkAvRz
16p4bxyBm/NWdO/iynRMu1ur02fZGdGIoBHnzfCONr2ScOIZYGmXZnpqv7Hpbg2e
VtMj6riWYEhZLPm4dWb7O1W0c3tuvwqIKjDYcgm4xnwyKHPdfNpA0+ZQh7OFsF1U
Chw2RVKFblwlCfUHgDsbNZlEuI9y+jQjIEJK5l/8l3h9da9VL3QP1O9jWwit5ePR
kpPe5dC8vhb8a++JaJW7S9lelWGwKeDiFVR0eIvQsZDxl/aEQZn5Rjx6ZACl+/hD
O6VJjfnhpdSKO4SbzXEZ3CPpsmHYaHKNRyrdMJxW7g4Rv0CK6/iJLw7IW56jHQNR
XaRiGGMCOeOP2HqOczCnrvOwYCUDaR2J8XJ1MwXogk+mV/GqZP65WKoxQTRT+LH1
VRZzwHGDTJF+CbT/47LAVp2D4JUXRg5JzWWgraAorhVXuZ50xWpdwDvW4qUDV5lE
D6htXOvYEyLHFiiN+rxvDpUcgkK64T3rFpo+QWVVYAYvmwNOatQ=
=g8bo
-----END PGP SIGNATURE-----

--Sig_/G9s=tPd95V5mxr=7vco_rF1--

