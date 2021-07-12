Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0573C5B9E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:00:52 +0200 (CEST)
Received: from localhost ([::1]:53652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2ucF-0002JK-3v
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2uW9-0000Wl-Fn; Mon, 12 Jul 2021 07:54:33 -0400
Received: from mout.web.de ([212.227.17.11]:57453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2uW5-0005zS-4b; Mon, 12 Jul 2021 07:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1626090855;
 bh=28jQJ+YAJQ1b41afUYKfr8L0ZoTRrU9xPacgIfbcigU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=arUq7sYDu2iVxdXCHtNtMAnunoZFQDdViarfl4qXdErRMR/cnoxJDbe7jnpMKuwi3
 Rs01tq7+RK4aTA+4Q5I19OU7wXqT1ZSMnIGGgKOrDab/OUaKAFYDeHhHGqVAzqR/F7
 i6ev9sdIhcQf4g1gWyY9rmSm/jIyHxG3cypgFf1o=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.76]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N0qr9-1lFuIU1gHN-00wpxH; Mon, 12
 Jul 2021 13:54:15 +0200
Date: Mon, 12 Jul 2021 13:54:13 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v5 5/5] replication: Remove workaround
Message-ID: <bba4e56bd198578c6e52c2e07edbc6c706200205.1626090553.git.lukasstraub2@web.de>
In-Reply-To: <cover.1626090553.git.lukasstraub2@web.de>
References: <cover.1626090553.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E626Qs6lQIZ.T.inCtEUtJY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:iNh+HjZRaIWKsZN95/WtPBPhATxTMCVEZPiyh2d/cg3W2q6Dpqx
 2ngRlvEjnTCrnr0rxHE6ub7UacZLOF1G+1MM5r7boY3LjtfCoeT91k37CrVFx4p6YxXYdM8
 cStmDqb7Jz7A47xTOz4QBmgUbgH6ijitYU0Pv7F6/VOLuxrSh61svrQqNMf5Y71CBi+UcHq
 /apD4luy0YD4tZmjHUGmQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tXfSpPqeF/s=:T0fQDWItu3DOwcsrf9Djdp
 6LragnNgo7FRn+5DVpTFxC6wFSH3sEk3STkbIHRsBJKVIPYTVeWORTOtrBS5VZsGgNcvUfROo
 rcKer0azRUSIQLbsN3I1qjaJmK5iGyhTRJdaunvfyJAcPRhTXkITJ3MIhg7o+egCz70CzzS7e
 HsIUykBx0zzGsVYjXsic/BuJiySwKsEe4y3qXOJRweZSJVWlhQ4o6GUj264t5enOxcl5bneHO
 V52q1rCXxlUUI67i1aUdt4DuQFVszTM0yhVCOYnyNLI9nEtIH0Ji0XjWm6+cNXObpmFaQjMgm
 s2oEPCKPtdnJyqmHDxnGyAc0+5qcub9zqxJMQW+bqbbeajxcsB52RqgUlkNlAWZ1RQXh9YYoY
 zY71kzaVu08CyXzvbRigpNDErZipOEkUbIDXo35zMCagbtGsEOEuyOuvrrsIWDQLTRSyhJh/R
 c7H4UPeyaA6tfO4CkcY6vQH66xySO1JeX0ba58VyKciV6wC76qy+FvT4Gv00ez1U/HrsyCKjn
 WbfAjNwT0l3t+5P3CfxQrlYQVZ5eC06jMimG42ITp51RYZPRAa/gO/lxxQaIPqwEhtV+nzGGc
 xpluzULi6oISdItzkGHCreUpquoBFMl+8ZSyiUrfGsJ+rN/xqSQnyk8KPfDSsABOfuHdN3nvB
 QkvmoWuOyJtNSdeuM0p5FVkm7AtW70OBHxhVuENVpatgj7WtgvFd5ZO1z9sIjP4qpQA2a6G+1
 GfICn6DTboMBy5ZHiFYZSmAsoni8KQz+DOYHA/wfEX/QLE4YLoZSGo+tryyym5Oja7uVRtsC1
 WAeYmmhKpjB251j+Exu4U225RpIKnf9jBt0L3+yFt8KW1dHRfku+s1jQwhY0G89wL1xLCoK/V
 8NpHnkwGqfuCGQv1a1OynRhkhKKc7w7E3QwzVBu59CmBajwg/vZOoRAgv2I4tiiHP7pVJuG71
 0yNhRtSVzdt4KRWEBJvwLosjVR9f2Vs4XmFnoT/sxJ/ZttkOvkN/uodDheskWwlRBHP9V5Z1V
 DDJIBYlN0EirP+YwHuOFot5pzFmCfNaYkVu/uSu00infYtvA6spJ20qrFW0JbB1WhI7AxG79s
 N81y/VCBnoqFqkKR+v1110MGZBACNjbzCAJ
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/E626Qs6lQIZ.T.inCtEUtJY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Remove the workaround introduced in commit
6ecbc6c52672db5c13805735ca02784879ce8285
"replication: Avoid blk_make_empty() on read-only child".

It is not needed anymore since s->hidden_disk is guaranteed to be
writable when secondary_do_checkpoint() runs. Because replication_start(),
_do_checkpoint() and _stop() are only called by COLO migration code
and COLO-migration activates all disks via bdrv_invalidate_cache_all()
before it calls these functions.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 block/replication.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index 772bb63374..1e9dc4d309 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -356,17 +356,7 @@ static void secondary_do_checkpoint(BlockDriverState *=
bs, Error **errp)
         return;
     }

-    BlockBackend *blk =3D blk_new(qemu_get_current_aio_context(),
-                                BLK_PERM_WRITE, BLK_PERM_ALL);
-    blk_insert_bs(blk, s->hidden_disk->bs, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        blk_unref(blk);
-        return;
-    }
-
-    ret =3D blk_make_empty(blk, errp);
-    blk_unref(blk);
+    ret =3D bdrv_make_empty(s->hidden_disk, errp);
     if (ret < 0) {
         return;
     }
--
2.20.1

--Sig_/E626Qs6lQIZ.T.inCtEUtJY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDsLWUACgkQNasLKJxd
sliOfA/+N1FXMwujAlfnJxTO7OKKUTBpqX848ksWikjoFaovmS9FK/+w29/w7R8v
P/4joSWDAknnmGluQ9UE3muHWfnIzNqDi5ke4vNcVmgprnlTBY7TSFWR3Q1jh7bi
7pw8wK/7CBolROVZbub4974vmI5kdf3qODdWyAWJW6BGSblignLHMBdPoYgT89Ty
+cAKcBcMWGxs1GNoJVrZRmRN4pJh/Bq9PvTO94HIy5BSBePAcD9r+JBqcHC/RKz8
+JVFfiLANRbAjwhp3rzDjr/DjM6uHR5YGFcoAVuiSmwTvPLeXJWHgM5DqLY7+jE3
YRnZyx8cGpzlqjGpbURIW4lkcxjlpI/WC+Uovo5OJ0caGnOhZvvXtuS/a6m3Fcnn
yZvLcLFVNZ36a11FtXQBTMu3e23e8gZwTZgx8Fyv5g4mJxpA0pz5fCMdnt245Epr
M5ZTfgJVrfgas6sLQGlXp1SSjr0HJlGYlLQq9LH0FavpnoVg90p25FHWbFFz6STi
fxffk9U/NyPZcNJ7w7XJMVgnnL1Y8x2XsDsQX03sMmPnmygYHQRrzzwf607DOQhb
gnTV66wisr04FKjugnwMzH5/aLo+S0V1siuiZUTE95MlsMebXg4G7uton0AHRMkc
m+M/7y47V/USDkiiDgQXutZrcXmuM7RwFj58N8IgVb/A4Epv/A8=
=olnk
-----END PGP SIGNATURE-----

--Sig_/E626Qs6lQIZ.T.inCtEUtJY--

