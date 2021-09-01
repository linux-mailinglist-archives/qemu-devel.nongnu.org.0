Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BCB3FE048
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:46:20 +0200 (CEST)
Received: from localhost ([::1]:56504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTNS-0004TZ-Ob
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1mLSdl-0002LT-Fs
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:59:06 -0400
Received: from mout.web.de ([212.227.17.12]:46859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1mLSdj-0003fv-Nm
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1630511938;
 bh=eR+Qsf1s8yMV+auDSJ6ptpSjivxrRLHnJpN0y3NehOQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=iSrJzgtETauZYk58kB1ZGPg+oC8NzV4Q8yxALATMTuG4c9rFnK4rKN9BvT0UEE4t6
 LhLW8WnYYaaXwiLDSS0evMdNblFAaOo8eOGAHX84At/0PF79NoGLQbN5COWcTotuTD
 HAUvC3lTkfGVsrfsQI0Gvop4j9YQdxdMkJeEsNN0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.176]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MIvXZ-1mIzfP2gh7-002X4g; Wed, 01
 Sep 2021 17:58:58 +0200
Date: Wed, 1 Sep 2021 17:58:57 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH] multifd: Implement yank for multifd send side
Message-ID: <20210901175857.0858efe1@gecko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rswLaR1fQi5MedgWLuTuj9G";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:AINUgW7NhG8B5FhNIRoHSdFocDSRBp8jx3Ljr3ND0twXKv5Eozp
 n0qFL/Cg4RdBkfMFO2QEdPGUos+N+eENDN4kZd4sUVeTO03yGpxZ179YjMXjl4QXH2f7CPQ
 Pv/Q2Ljdmkym4m6o3k9EjML7gZ9YYdVESLDGtl7buuxrsdmbntNrXPLHRhhAdNd7Mn/aaYO
 iwH+w7YliVtVECgBqB/6w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Chcbgq2TRO0=:v3D1yNcn8vrdZzE1bGGXzb
 v/OL5WESHJgNpy+M3rWiT+xzFjM2bQX7zkfm6/vuIralyAJXeTw51NSYp46tIEKvzgZDJXkKw
 9St809gteWTrCeCXEBNY3m+lo9HI6zh7Mu4gJe6j5JQEDyaXAvCHzCjRA1PVLqGG0BmFdgOmd
 V1ltYUuB+Jv5VW94Zfs9BRyMzg2BRevvCAQMILnmRdPMldTf7Hhd8TfLhj+mTDHXWJuBA433j
 UsCziC2FN5puDPCbQL5ObWAa00k89Z9j18efSOODIgqxeNMX6uYmqcGMWrIIScSIVC6v6Fa8u
 +ecR9c5hxe5Hjhtv/gRtY5UX6/7kjIEDD7SqS3FpdOpTQ89hwhAZ8mzBgsooXMSL/9zo8LXsp
 io1ic2G0yw+BwKof9riVwZX+yetl5N76Zrz2bcf2lLlMqGLpfKbsJUlPncTkE+7soO/t3F+AI
 IK+AGtTSFrZWA/Y8zUXzQMih27s6ColufSZleRKsQvC/17+3XwUQcy0fwYzrxSSPk7z3sMH/t
 iDjyhB14emCNvOIbQXnstD+6SMxwJGoygC6SrT9ctvXrnkeyeeIiuxGgzPAMUo+q9wWmfhZKn
 j76c05G2tj+kcag63Z5ByAzHNgGaLgeoD7fByP1dS1da5/CVKLgrb7qupkbAkdJTOpbxr0eep
 c4t83bErEDggGAWaG8+Oi05uzBFB5juqMmb38xh2a+mW+z7EQGtuzcvm65fUY0zJ6Fg8BXs8x
 TR7Ll8VEPB/QipIDYJqYrtH29JFpd2LGywLdZmUkVXXAlJ5D82um5fSk+sVDQxSyQuYyoI/dK
 9bzO0yJoiXZzhZs8rA4qc6wX5SANBZrjkEghBitNQpVH5+2ZhzX6w8VjCaIooOyorAKR2H19h
 Zks0CmGVXo9MrjKJb+h9KoPmTq/Xa1R2YiCfxqe08/+N1c1bhmceHAHWI1AVcR4ULf764gg0X
 zRWLUp7cvTA8c1QTSYvYEyRWwOMcGS9rzkEIEYK1zZNxy2GG+W6JtmoyztaDZshY777jkI6MR
 t2ev3T4OJiamLaHqlEiw6t50pvr2LG53RN4fZgdWYrVrG4BGCWAsY4Ot3rCN5Hlk9LeUMc+gF
 zLEv+lLyUPSb+e3Au5IxcOdUUGvmC+amlYV9kNFVGG2Kwc7xg6/wJCYEQ==
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/rswLaR1fQi5MedgWLuTuj9G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

When introducing yank functionality in the migration code I forgot
to cover the multifd send side.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Tested-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Leonardo Bras <leobras@redhat.com>
---

-v2:
 -add Tested-by and Reviewed-by tags

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

--Sig_/rswLaR1fQi5MedgWLuTuj9G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmEvo0EACgkQNasLKJxd
sli1UxAAqfWeEnrQNFrGdNS/VZUAMuFteOHOWDW6hDTWXF6VrZNVvQtuoxzc258j
oceylAwKi14chBzUb3op0Q2Z2kagqFZC/tGIe1w3Zbkwl2Ks+ZI/S9N6JQa65qpc
P2AoedltkowbAvY2WAWn2utOCufPSVt67OkI5bZL6BB9a8dtk32V8VHAItsxtZPQ
TQIbluyK6mzOrpBm9rIqRIZmziXGCuCb/1gNCMJtLLyr6wnlKNCdlgFjM7xlOtV/
A0/U9QUmoVeP447CvJA9OKpzzlAjO3QQzu5L+OsXxBipY4Is252rExILikIEDbn3
fcAbMH/TxHFYTZNPl9PS0UqgvklRs7+iSpTNnW99GYZY3gX70auOaRLfyJry1rP+
nTmRIONOfU+6OQMJqznUFjBqgTMucNEQ4Qg3Aal2uIEQ3FlFtFD8aINyUy0RdmKA
iv7k/nvOP9pATxvHWQYOtLP1hHZZhFYSHNz64/IWbOspSEYvxds8oCVsD0tYOf2H
66B+RKLsPaevKVO2rWol1d6vVou1WVfVptpfZ04N2UNJmcYLBUrjcfkCK2zxBKXf
f5xCbmcIONst/49W/9XUs1S3LgF/O+Y62XjwV5zXvmuO6k3PL4CWQ0Nq+LdWFw1T
yZEfc+8DNC5D4C/i+y8ycRCP43XYBMlWziHgDSTqh+K6QQkNPA4=
=21ic
-----END PGP SIGNATURE-----

--Sig_/rswLaR1fQi5MedgWLuTuj9G--

