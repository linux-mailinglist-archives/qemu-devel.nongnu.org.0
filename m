Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EE23C5B9C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 13:59:06 +0200 (CEST)
Received: from localhost ([::1]:50070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2uaX-0008Fu-3H
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 07:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2uW9-0000WN-1s; Mon, 12 Jul 2021 07:54:33 -0400
Received: from mout.web.de ([212.227.17.12]:38573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2uW4-0005yX-Ij; Mon, 12 Jul 2021 07:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1626090851;
 bh=aexX3buFrOB7dBsOnfVXQzYeQMJnVRzvUohu2kYYRhg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Wgz0jZjSBPISwt/sggBRWGT6xZPB++ygWLs//BLaRK2iRDIXkXbkQqDM2ZUMLqkj5
 Nk0WxR4O0+qc4u+nD5qQP+wZxeBx4elgBVKHYSZLUmveN7IGSC1XgA0qOy1Eb14do3
 PRVO6hN3U8NdvCsGp5Mu2agP1rhxVYoeodRtxOa4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.76]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M5OYl-1lEFbg2cYR-00zXCw; Mon, 12
 Jul 2021 13:54:11 +0200
Date: Mon, 12 Jul 2021 13:54:09 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v5 4/5] replication: Assert that children are writable
Message-ID: <360083cb9c08e364eb99e232b2705226b23f4503.1626090553.git.lukasstraub2@web.de>
In-Reply-To: <cover.1626090553.git.lukasstraub2@web.de>
References: <cover.1626090553.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9Gf7bQZgjrow0vo7T0jZnpI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:dK0CITChRmUTOU9UqL8Gh9Y1vdCDJ4XuNftiKW5RzSnIo4JfeXH
 YoxXNa6Hp0/HZLBP3JBqurqykj2vKcwhtlLFf9phSUmtbfDaDe0bwWOXlj781bqvkI7aLzS
 9AiXHtrAgPL9iUgK5WaQb19cGIql0v01/t3vDTNeuKmbTowUwZ/gyoLJ1tbL7kZL5ZwM0n5
 hAC/14rskr/NLPBK54dng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RnRXsiEvLwc=:JbBSRXWn2A0VShjRj3Zqx/
 VmKyEkSrVtamiyfq0z3NG7uHpNg5wz1O0RYl3lIqQviz7Sct5WgiuFkKkZhIHXsAKQmT9lrKr
 yMYdmwTWBx7FWNjN6Pw/DrxBNBE8Q8hLSbFQbE7g55rmTWu8xokNnf2hCRpa8AoFQTjR/gJNY
 efT8s1nE4dZBxTkZGFujpFThhdplLmO1o3/FG+ejtGKJM2HrQTXE6zUhfyBx5+DfQr+s3S9lt
 42mrjz+SWGOk58ZkGCDQXYk3BvdKFWCgmzQlxCw88Pro7gPsgeNCLoLTHHLrrURoQiUEkGfHZ
 V8hELnLlN0HfUM6Nx0iU3uDQpWth/WuN3h4iCdVqjkNb3RxI13v2sqfRHW/5K0V6pIBRvJhvl
 giOISQW+Ag9+C+lTP/OJfVXJnvBsCwFXBo218/4vF/eBoJ1/nWcRWZJh010jiUP12nnQxuF80
 abTSqwcmlZnHZ9Uz4r6VE3FFQsmeFMiED6StKu5LlQMGe9NDVw+cZf0vxnmjf2kl08xr2hI54
 Yup4yLILPyeOu/4V3LsL0zlZvb9+Lo7n9Nhuivtoktj0PsRafdY4hK40wLoUZbNn6mROiZAiy
 Og9Sk/SFDweQ/wnSMYZiNSNTy8SqCDTA/jpXkvllfMMl6LwiQJm9FsM7QYULkJBXJaCMyM4ht
 Ad4L1OWxQfeuRq5QkzCmhSU5LyZxI4jCIr+iwUYh23F7MY5EekWUJEtXV9GbOJO+aCRPlrxqB
 TRiJao3V41xALAUTkGvickA/8PhYQffSbnzAQuPWq55mv3bmeiMwuLuBjIPNgrt/hl3t7W5tt
 lhv5zR5H8kddP4H2MFMfpN8wdRo7rV42FFgmgkXrarK96xIxdjBNpWfDuw90oWSZF7sKKgjOs
 SxTDiYt6VYwTJePkFne+6Whuk1P8V4rApsXcHKf5a+xJsRAcyvQyKF7iZbNYWzZHu9JBm+ZsW
 9eJbAgHk/jscT1rfJ6fU5vkLpGS/74EYcNX5oJBy42UJ9Y1xKVHLmjlAqX9yJAb5E4vrrRFQr
 +AO/UAyd6T9WPbz9MAWyTebOGDmxi867A7OyFuKw3FU2aOtQ00yes+m8oNW7xQ1wZ2QmQOaZh
 Z06/UNhuTuUP3QUp1g/u2gWEO6vWXkiOBQ3
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/9Gf7bQZgjrow0vo7T0jZnpI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Assert that the children are writable where it's needed.
While there is no test-case for the
BLOCK_REPLICATION_FAILOVER_FAILED state, this at least ensures that
s->secondary_disk is always writable in case replication might go
into that state.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 block/replication.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/block/replication.c b/block/replication.c
index b74192f795..772bb63374 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -261,6 +261,13 @@ static coroutine_fn int replication_co_writev(BlockDri=
verState *bs,
     int64_t n;

     assert(!flags);
+    assert(top->perm & BLK_PERM_WRITE);
+    if (s->mode =3D=3D REPLICATION_MODE_SECONDARY &&
+        s->stage !=3D BLOCK_REPLICATION_NONE &&
+        s->stage !=3D BLOCK_REPLICATION_DONE) {
+        assert(base->perm & BLK_PERM_WRITE);
+    }
+
     ret =3D replication_get_io_status(s);
     if (ret < 0) {
         goto out;
@@ -318,6 +325,9 @@ static void secondary_do_checkpoint(BlockDriverState *b=
s, Error **errp)
     Error *local_err =3D NULL;
     int ret;

+    assert(active_disk->perm & BLK_PERM_WRITE);
+    assert(s->hidden_disk->perm & BLK_PERM_WRITE);
+
     if (!s->backup_job) {
         error_setg(errp, "Backup job was cancelled unexpectedly");
         return;
--
2.20.1


--Sig_/9Gf7bQZgjrow0vo7T0jZnpI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDsLWEACgkQNasLKJxd
slgKnw//XS6duoR0NDjezu6lYLnf5hCpp8fjd4ZyMf/I+KajMvrW83OAqm7IT3cv
OPJrmjyUfi0O/6JqMHnAyJ1TS1UB2YdaKryhwTZNWcp9vNwHOZtznva8ACI2QXGL
y9tORTLcA86+JN0qXvDIXplYazxylX+KBBbVSBs8Ek8QUNSx+d1Pc2srLORoEYG0
rZv80y2+bPf/j7gFGLlwJv3sTreH/D09GhqW57XKFdsoxdYvlQPhayMYEDwOr7ID
ZbaoXo2CjD3Wn98SoHh16MA5Is+vaKcAlBYI/MfT0RTiPZrjQTEILOSfyWT4bBoe
LEP89nFQE/Ks5nwbnxHihAx/7B6nw40Pa1z10QiiKapN7RZySPUbAmu8wQnRB0VD
aY1QrD1YyNbwRU7821c/Ihil61P3x5HePGjFf29P0tJR7TBS7+3UR02+TBQwehq/
cKKrBE9RD6SEl08XPZzyyPz5mIYDEkK4TxMVHv0LrF6fnJBKmvhZoK6kfNh7KQjY
PYuXdH/kgLC4UX3BQZmru3EZ/Nxc3K/LQlDtLiDYnDp0QAC/RT1LHyuqGmF3Qb5p
uuC4KAAk/xiw8g3r6Zrmj1umWvnbG5nZhIIQJiEjSl7Eq65gqruIqgKIuyrjQquA
apPoMdgDw2FVEq+5nu5LvoNdHBuJBDO+ZGdeQQm35kGEskFy1xA=
=iOwI
-----END PGP SIGNATURE-----

--Sig_/9Gf7bQZgjrow0vo7T0jZnpI--

