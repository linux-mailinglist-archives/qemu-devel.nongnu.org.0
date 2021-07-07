Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FD63BEE69
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 20:18:39 +0200 (CEST)
Received: from localhost ([::1]:48056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1C86-0000Rn-HM
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 14:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m1C5g-0005Yy-T7; Wed, 07 Jul 2021 14:16:09 -0400
Received: from mout.web.de ([212.227.17.11]:55349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m1C5f-0004rT-1E; Wed, 07 Jul 2021 14:16:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1625681754;
 bh=1lCdSkXKPIXA8EUvad+VNjRJ1cTFxSQl46tLcmwWdnA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=fF2CdHTmNLVPN4XQbhEqxcxy6CTUwpnk5fek/mvLgHHJQEQUGu0X4pf6d80labFHe
 16WIbxdACsTUWcAFCY1kole7T4PSnyMbGm1FJIqFejbXzWHLCh7lmzqn8x99zn2qoY
 DuQmDI7OxDwtOoC2NfwfUzjYg/St5gDIIetT7S14=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.194]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MYw1v-1lfNgP1FgJ-00VjOZ; Wed, 07
 Jul 2021 20:15:54 +0200
Date: Wed, 7 Jul 2021 20:15:52 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v3 4/4] replication: Remove workaround
Message-ID: <906c163474aa1fcdf4ffa3cdfb4ad39cb7fc49cb.1625680555.git.lukasstraub2@web.de>
In-Reply-To: <cover.1625680555.git.lukasstraub2@web.de>
References: <cover.1625680555.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lsr67KhdPg/Xvn.jJzN/3f.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:uF1XdvtZMs4rYPW5bhGhyoxFgvOdljMn+UBPIi0KBK7Mj30xGWX
 1H+lwgvw4wfVjmqA08WI/s6iyR9M4TxqjbISEOUxqZ5hjF/VuwTg/kYl9jb4rfWY9TQhy/f
 f32S3EnMyzbs0SnbdS1YjCw8q4I345Jy0bjgmPkZATG+Iyh7mrUSzrB2OhHLFscslpEB4LO
 ob9UnYpzCxMdK4xe8n1Tg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nSCu7Hi95Uk=:lPxDpzWGvRGEyD73vzgHoO
 PU+U/awttdUzrx2kzxCpZmL/7UX9WgOTrwoYdghdsmelBmDmGz2RRXFzeNSQscxyP8GIbNKDx
 4UpFVNpuNiadPkBJWhHxIgB4t4JbGwQ6K4LCIxVJt3O20b9ETZ+LfMQpxNMD5nTQ8hOXONzbz
 t6gSj645uTMiBTgei8rbXYt/igimHpYoM5Jaii78YCCWI6tG9DWgyGShGJOifwqEjNfVA+QWX
 wMC+6rN/wsB8R+Q4uWKpUhhZQcoRGS9Dg5ONiV8YJgcIYqJ8ZIUGCdjDOj8MZ+UDjIGMqrFe1
 Q6hR0zlb+HPd1fK63SmX0pRNgtNxR1DKRNVm9oM4Tolv2pC720qRvoiV2eKE3RUSDaW7+6cQ+
 QEJ3TYQbl6So6i8eqH9s5HEfXhMHHTUcd4C187LRm7ZUmCsJojCmN7HpmUUI9XH23qaM9XXJ9
 gQ92kIGEJAAVPSSoGXtCoOMqQ9zSBI+OTly5DMfxfK1DIZYPWmC5CgJwIgt8/+/wn+dzL8apR
 eZqNc6HFjYldKhlNg4COqJboJsXkmkkeQltyLXnLF2U3efJfaEct7+XuiY67EPZPevqNd1uNK
 RSni6doKLquHRtZ7fRtPEqt6He/bsRR05h3UXdPQImKW0E2+HWTwNFVjh6/RBcEcFa+g9LQ4e
 GmVsD7HB0mqDFVHrvEu8rozj8RsX/trT0RZ3EtKmTNdFPlKtcxRfGa8MFLQzl6cnzkq7FJfqA
 OSPNFvgmI2mpWpd9Dn4mnRcyxv+j1Me+5PL/B+38z0iG0zwOK6LjXpBZuB43zkJI/w/sZVYab
 HLJRaje39ziDYgtcYKqQc97dQRK1gqpLzJEbDAIk19esd1Qj3FDvMmJKKh45/5yj3hhnZgHle
 AnIFt7HfAWM1f3+zlikKoqBp5coY27HvQ0gH7qdIWui6NQ8pyP0wAR8kJIQA7UQiaHkGW8mkQ
 0o1wM40t7hWCuGwkbv220jyxxJj6+ctKULLpRBR14p6uxMJXAkG73gDroopxCWI11JjnCnpvU
 ry0XY5+KRipJoqp4StFQGOwybI4C7xykExt3gl9i4EGDSrxqGamELhEm9t2pOVF81rdn4HCE4
 kHkuuIEbCCj8UQMXjs6HUBRCPEEyQICPM6U
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

--Sig_/lsr67KhdPg/Xvn.jJzN/3f.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Remove the workaround introduced in commit
6ecbc6c52672db5c13805735ca02784879ce8285
"replication: Avoid blk_make_empty() on read-only child".

It is not needed anymore since s->hidden_disk is guaranteed to be
writable when secondary_do_checkpoint() runs. Because replication_start(),
_do_checkpoint() and _stop() are only called by COLO migration code
and COLO-migration doesn't inactivate disks.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 block/replication.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index c0d4a6c264..68b46d65a8 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -348,17 +348,7 @@ static void secondary_do_checkpoint(BlockDriverState *=
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

--Sig_/lsr67KhdPg/Xvn.jJzN/3f.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDl71gACgkQNasLKJxd
sli2WA/+N3OGWmpYFMJmB8qeTdKxXCaMOXHP3YDkAAT7qpTJWUlRbQjigeP2hhEu
rLdnOQXt2KUqD3CD9oQdN1F9jkXSJU5d7Cmv6kV7rUXFPnr5h7Iw+5GZbPJ1nWtw
g04Q63f9RnFiWLt3nfZOMpl0owuGKbR0BFSwNlGR6wFF4ioA3NF1aqqFkwvsJCNs
KfGpBGyZa7cu8q+OkuZH5AUEzLyx27pbAlbz//h6/GUTH/DCvfXFN0oSDK0CLW5h
fOdU+7qHr2+8IXSR54+8yPdHFyzTw61XtDcWnunLAD8y9Yas5ics9/TTwkpHMYo7
VzvqvNNrBnP/XTqMChSbE2Ii+Q7DYEA/TTPo2nOv1hsLKSDjL+YGoPP/+8mvDSdK
IsRdpWCm6tojm/eMRuhT6AfcVK52cAp2Ak+0ZrhODnq27cJ+PD2E0aqMmWUU6HSO
rUsv6ajnuFmzKtZCPrDlPX+AcqSUK8juRm6SkqEkldTVjLfi47tj8N+pk1U9/St/
jWLL/b1ijwusnfcXctri8ZKJYQ+bAosmc4LqzWy54XBD2iEK7jPnK356CjVuIbZ2
AQx6kGOHF7EeH+eGfYGmckaOiENGlxcu9XAcsEuoW2zEAFpD9mERPtCk2fpiz0JU
3H7XWZBocPVGpaGfCN3jgY8ZaNSyUw17FrPNxLgkQvR44vtu4wo=
=zESk
-----END PGP SIGNATURE-----

--Sig_/lsr67KhdPg/Xvn.jJzN/3f.--

