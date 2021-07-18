Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6E83CC9AE
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 16:51:48 +0200 (CEST)
Received: from localhost ([::1]:40884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m588x-0001LB-QP
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 10:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m586H-0005gk-Tg; Sun, 18 Jul 2021 10:49:03 -0400
Received: from mout.web.de ([212.227.15.4]:51017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m586G-0006mI-8P; Sun, 18 Jul 2021 10:49:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1626619723;
 bh=Xdx3AT1ta8Wzmt0uIMYWRw/wFZ/Bqr7Zn6wzhDeMz9o=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=hp+6xkmUvLvuKCZsXXapS1/QBQb9l9HcJa90V2AKtElK8FHaKMRKw/P9dKCxIJQ6k
 iPzrcaELGGE5lQSqLqQbZIwAKt9MiwS2CzSXM2YyZqqhmqktKnUms3HnRYUdH0vGwG
 DTrd6KYRxRNZF1oc5R37FVSO2ETOfyRxbB2JDWrU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.49]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MA4fW-1lz2ED0YVW-00Bwda; Sun, 18
 Jul 2021 16:48:43 +0200
Date: Sun, 18 Jul 2021 16:48:42 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v6 4/4] replication: Remove workaround
Message-ID: <d3acfad43879e9f376bffa7dd797ae74d0a7c81a.1626619393.git.lukasstraub2@web.de>
In-Reply-To: <cover.1626619393.git.lukasstraub2@web.de>
References: <cover.1626619393.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q85aOlKPnG_1CM2NYs3+qc/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:Yhxfm+ArU7RCDaVik9FSrL60zGp7Iqkc4RWho90BBULkAIbYFQk
 DPF70S9Uu158e2EC7bN62fjQ+vZnS5qNchZapMzbLwyJTvYw/j0JdWcwQ+ECv5WrbbceoXX
 m0Czjt2mFtVcAnv7z60BvxiClNO/Aqe4EAApbAmHjX21t+yRdEKL2irzkNsi6g6QL5GBTgq
 5NnP3uSFUGYcYOaHbKeXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t/VMsmKmKrA=:hCqMZyeRkmkI6bJmbfRAHd
 zFXYqO6mLLEhK/6di51a26KG/ejGSlW9umAseTalSPcswbOnab8oDiBI4eYFR0ynspz+gmuFU
 TfqYOmQoVi+0kkcRMqm9J2w+HWqYsyju71r3RH41vHU2LLQiPtVdzxrChTgdlwsiKZKG116Ul
 HpoOmmR6KH7EOmPejqAPm7wYhbCWk08p7dyYitKuk6URCmZ8e+SE6LnT/FcdNQuzPlFy6D5dC
 To3Xz+SHCMllF1fLVOcZlYM9W/5p1AaBsXtkxcHQA0xBoCJ9S4/bmeSnrPgKsbqz+LjmYyQHh
 imJ2aqKuBfXNKbOzVoFd71S1Ulxc6QutggNiO1y8HdsvNRzhojoD2zfM1N5KQvGjetpcqD/40
 f2mpZNAqcG5gQdObzhjBs9mgtAZ0zinE6XKwRPBrtpMh4D4P3ct7wg9LSyE/wVET/ef250tUs
 ewbmWsva9l5zscv2hQyEAwVME/U1i0Od38Mm8fuk0iiFDRbCcGHUNVaFHDsPUZHZ6cuMMMyNT
 q/oMX8KZIZtWd7Dt021249Ecz+/VBkyJoa2FpTtFqlxWD/tpap+TsrH0ZhArMlIs7NQJuLB2S
 Uv+1sva1K2uPvuadnQ0U8bydfU4hdffPaCIz8OGmrgsWzRc/rzzqxArfJ3LlmTIOK6OoZNacW
 evDq7sQnqz+Gikrd3dbr4poFp1dJau3A88HVAmYRo5iEYyyr7ChtjMZ7ryxb881hztfrIrUcb
 Ht2XJaX+yeKTLs/aA0fEegsnuajnH2XfWrRYj7nurzdp2QV9wbbR0T6xPvC2t2zOzcSGZ8FAj
 pRhGyaqSg54XAZbYQENMQV/FrfqiuMADP/TKUQdICIxxU0n348f3PxH6yCHKoxXYO5t0xjtxC
 ggbDSUKLvPL4nj6oB+LQIySoN/4+97QjqhmiKSwxgaqRB+I7RYzvBLJGJ6XqK7JiqCvG3Afg6
 HI1vFStoOS7mE3+pR5S4D86q7PbyEg/kvzy6Dwrqhr3MvpnWaak4NNXXAQ4yVQePrwD5A5SK4
 HM0Q9Thqr/GR/QFG5aIMRKHLyicZOa7IYfYlFThftRDkYSjKU2qYbfIHZmhVA3PB3EmNRbeb/
 z2OKM0EXzXJP1xrBeksPdYrs/l/O/lUFeeo
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

--Sig_/Q85aOlKPnG_1CM2NYs3+qc/
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
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/replication.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index b74192f795..32444b9a8f 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -346,17 +346,7 @@ static void secondary_do_checkpoint(BlockDriverState *=
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

--Sig_/Q85aOlKPnG_1CM2NYs3+qc/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmD0P0oACgkQNasLKJxd
sljAaw/7BjRQomywGo3uyCc+GdAZ50Mc+nAizoesz7XsLMAmpMk8APFxNIQMm/2h
HSg3IyUcw6N9OdQXoDwgaPz1SQQFO4BeGkyUwF3ANxBbTeU9BdG1KL8Ya+Lk0pBS
DdfZnESU4qzQPDnbX6lO4EdS9MMORKZZdiykDg8CErjtBFGJ3jtgjAXHYxUzFViU
3NX7zX2vp59E7A1MumBHsPbpGBnyDiHchQ6w363LDf78yfq+SnFqvglYAYNNABoi
Ug3x/IyTjVXx+I05p0yjUaZIf5pg3Wm7DuV5lSr1tTiqxyRwLf248yJqHpddfkD9
mHARXg6ERsN1x0j13oQVLLNYpIsjTUIwkpYcRz/R6fyve7maNqjCZqfSs7xuait2
ftxWxKMWWhacO46/e2Tmf+dF4N5D6GcR7yUX95IOyvON0pRuDVmrts3bwUDzGwyX
JfIcQJAKv96UP8acvL4LKVMZj+eabmq2Bgiul7IFSjsWUn5ZtSPSP1qSjjR2tqwR
egzb/EG6UpZgmgdJb6SPnL2ivit1Na3pxxCvazon+Cxcr5AB33w3DmHNVK/Wr4V8
Esb3hEkETTC65YjUhDP42ZydYauI1D31YEws1NzJlDzXHU6BCOweUqg2HzlQgAQR
QCNZfH5r/J4tITLICxjjKbgqIzwxEdnwvDZxgAF/XruVEmYqYwo=
=0t0J
-----END PGP SIGNATURE-----

--Sig_/Q85aOlKPnG_1CM2NYs3+qc/--

