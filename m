Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184193E08D5
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 21:28:35 +0200 (CEST)
Received: from localhost ([::1]:60416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBMZ8-0004ot-6R
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 15:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1mBMY9-0003Yt-QO
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 15:27:34 -0400
Received: from mout.web.de ([212.227.15.14]:39995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1mBMY6-0001Xz-VB
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 15:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1628105246;
 bh=Ozyv2hWhzNzqbGsRLt/k8cyn6gdchEY1Zg8FfHkPhFY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=W9uOh5H9tGYqvEeZGyRh9e0ij8huqUG+PT21rVmCqFh3LS4ADwuaI67GmBHXwoedR
 9hrE4gEYrsxUybPe3WAmf5ikQtifyOodnZAcxzaqOfvZsWKjSVdiceHQx5i7P0aNXf
 1micIZr1P85CUqB65mcAHzo3h4ljxM2k5Py5b6JI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.254]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Madzi-1mhf9z46he-00c9rU; Wed, 04
 Aug 2021 21:27:26 +0200
Date: Wed, 4 Aug 2021 21:27:24 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH] multifd: Implement yank for multifd send side
Message-ID: <20210804212724.07e411d6@gecko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ah3XHY8vDBP03_iOZJYo2NY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:y9J/XpZLWHCMmTO4IxL5C3esQ2o5TV+BgQwYefJ43XynDXxStpe
 truC0i1H8Qas1enTratLX5tgVt9AGQoiG+5VW9dX/7iFp1YK3jBTmez9y2/5s9AKPqfyF31
 u1cXV2pyBjylgejwMDI4OwcJTkAkgHr3y+YBCY7EgbQ5OF+vEZ0k15imIPYAMSnuf6p5/nK
 Idl7fuSAeL3cm+K/v2jow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:We6Yy55Nzg8=:OucdjQHx7Celkn4B0Lct+h
 Km0xSk432iMBdXcRvD5DXAmUl45odpmND3oA8hq/ygzP5+sRMuSOhlPH9DdAhK0GiKjq5g3CA
 tFclPjGn6nKwhJacUESQM5yPgxaNx7ecYkGI93ScQkNjzS02fsu4mUB+eKfdgNAGI/gqS2MwI
 6YRSUvtEO1r6Era9fvDsnzpf9kedStMnCAePPPjuVxIuELaXNi4cYOzRTPsMBWsB3bImDeNNX
 ZsILgfy/NbdzbzbYtgu3tlZbK/st89Fj2kw8lWNXf3Kva9TMVyiMnR7Gn8I8rT5unANWWel1E
 h/Rxcwioopayb0wctMZlR1EdR3KDgOcxA2JeJFBjlAdSNOD6tImPiuXeRTu4Si04CXCDxzvnm
 UGEyKAyLuWHfgr9k04jlm/aX1MWfrc6wnD3ycTviEoSmnId9b/n44GpBdIXPNdCunO/y/whTl
 9yrLkulTVrhAhesHc8LVSJ9NlJU6qOsZV22KT7U4Y6MYFufhhTUf0whPsbqG2qX50P8OyCv3d
 eHE8q4nNVkHrVx9GcfrtuM6ixsUPtUeA7QZTKUtwPjVxrZQ9OSeKK+HTYxr9xW1pbiPcXP36t
 ohLYsJMGoGSv4jZuJ+Cx6SSKRDNFCLfuSAxDsx3DTDeXbum8+j4sKSc1FcLxDKcd9ByaOFj+Y
 yg/bSvACJ7Ni0X89yYGMnTJh7+FmaxtWfsEbZIXOMxLhF7sKG+EI/XRAq7nUcYTULd/eU4Wj9
 WjNgWDNiPvg85JWuZtltFr8iH+exWLSQ8mWUQI4LB/GS/EcnG/mkPVu6BVXCLv4brpD7RxkXX
 ZygEmn9BpIOe93wsf6AaJRLNTyFsO4YW5Z6xkymbR88CJvhajT3d4e2cPrThtXIayRKoWTMWh
 Qt5a5N9Cgg4jMDaT1D1btLaui5pCFaWJ+feUxs8iHht7AVR83zYovnbGxFVe+cjWblBBTjB6Y
 4yhiplm8OT4umVm6sSoGGKo3itFzOu5jdFbXJ4beA/m5aMHacOKQ/OFeCr1KDEfZX83izltjF
 P1nnHCXMWl21bGJGzkrKWbUUKMcdSdt8THEn4SAOZZ2+PbPheSifoTlJUvgAhnqNxw56mTfl2
 Y+W2E8jYhKrzBGCguW2G0kOHBD5vfNRvPS+EYUvP00moTSPc3xTqzsLpMviktvT5X5VCft461
 uQGSs=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Li Xiaohui <xiaohli@redhat.com>,
 Leonardo Bras Soares Passos <leobras@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/ah3XHY8vDBP03_iOZJYo2NY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

When introducing yank functionality in the migration code I forgot
to cover the multifd send side.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---

@Leonardo Could you check if this fixes your issue?

 migration/multifd.c | 6 +++++-
 migration/multifd.h | 2 ++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 377da78f5b..5a4f158f3c 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -546,6 +546,9 @@ void multifd_save_cleanup(void)
         MultiFDSendParams *p =3D &multifd_send_state->params[i];
         Error *local_err =3D NULL;
=20
+        if (p->registered_yank) {
+            migration_ioc_unregister_yank(p->c);
+        }
         socket_send_channel_destroy(p->c);
         p->c =3D NULL;
         qemu_mutex_destroy(&p->mutex);
@@ -813,7 +816,8 @@ static bool multifd_channel_connect(MultiFDSendParams *=
p,
                 return false;
             }
         } else {
-            /* update for tls qio channel */
+            migration_ioc_register_yank(ioc);
+            p->registered_yank =3D true;
             p->c =3D ioc;
             qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
                                    QEMU_THREAD_JOINABLE);
diff --git a/migration/multifd.h b/migration/multifd.h
index 8d6751f5ed..16c4d112d1 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -85,6 +85,8 @@ typedef struct {
     bool running;
     /* should this thread finish */
     bool quit;
+    /* is the yank function registered */
+    bool registered_yank;
     /* thread has work to do */
     int pending_job;
     /* array of pages to sent */
--=20
2.32.0

--Sig_/ah3XHY8vDBP03_iOZJYo2NY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmEK6hwACgkQNasLKJxd
sljThxAAsUJWPTWILBIENIYzJIjgnxaHdHznk/pKlqH5WgG5AQ2ycQg2RdslV0JI
SpwhaRMrtxGSMqpXTYaiyJL+qKaVUEYQXNbSYpPDbBchyZiskIHVT9Nn4jnfH6k9
M3+0w+NEwr7/HHpeAUBSLqA4drkHObF4PbJTmEXYKEX87Za0g1tJUrCVLnaFCwR4
Fj3JPGyqY6655WRa8WfiPN2NboE2rCB1kSRKPZ2Up+84vuWaaNqxDmn8FIlqKKRA
tUK+Yai33LIgT0+Y13dol/ZYbEW8FdOLoaPTJrWwdDVwxofsd6/4sj3+hqbdtJH6
HooolFnCXyQ7NaYCM7bPHd0JfbDpYhiSakDhEl/RK/4nsu/HhR5hWI20o/UCjveX
imN00hCpVxD/Bmzffy4CHcpeQGR4IJvWWbOGHx13n/8CQcAx3egPhid6IuO7H1v9
FPzMPO9FKhNoV5PqOPjl8qBb+oVNJYIkABFz8p0BZ5TPCtVu7FWvVYuNW1e+CbY0
EN4yUUVbc71BA25IS9374XUAOmJhZ6jfODSePnelS7GGuxjRe5U98hGO9O0oSWbL
7Xtiwg6qKD4YAe1K42aJ9WRY8dbCRkz6uGrLYJ76ygdoBcaB/QQFMCJChgy06+N8
l0ZgyQOKq5NIMP2bRkE18RvAe35iOO+JNz3uqFtQooiZ/sSre3U=
=hpnI
-----END PGP SIGNATURE-----

--Sig_/ah3XHY8vDBP03_iOZJYo2NY--

