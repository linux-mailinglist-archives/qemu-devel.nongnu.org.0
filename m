Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 775221DC0D8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 23:03:32 +0200 (CEST)
Received: from localhost ([::1]:33616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbVsB-0000Tt-CJ
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 17:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1jbVXz-0005sn-GY
 for qemu-devel@nongnu.org; Wed, 20 May 2020 16:42:39 -0400
Received: from mout.web.de ([217.72.192.78]:53935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1jbVXy-00079c-KR
 for qemu-devel@nongnu.org; Wed, 20 May 2020 16:42:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1590007349;
 bh=uxF+8MNykSBGMimYpB4teFNIItz1JuyXzJm8wPg7yRU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=DiFgKPm4OQWQNrHbt9Z2CBtrRkdiYixfP7azjeD3swF48Zvb5n2AmYA/KY4IJXc80
 4WYI6BRefwfU2VGvlWyrIuGNN2PMePaNiXUJ27E5dZZLo/LBc84FgZR25GbR8jyveI
 XkBTuXMolgP+9APGpiRbVqyPBhEqAY/QP0AH6hGo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([88.130.61.105]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LqDYi-1j6YVR2bw0-00dmrV; Wed, 20
 May 2020 22:42:29 +0200
Date: Wed, 20 May 2020 22:42:27 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v2 5/6] migration/colo.c: Move colo_notify_compares_event to
 the right place
Message-ID: <8c8faa57854695ff230cd89b35449472eafa7772.1590007004.git.lukasstraub2@web.de>
In-Reply-To: <cover.1590007004.git.lukasstraub2@web.de>
References: <cover.1590007004.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X2clBHrJOBn7KAvd5cUFZTJ";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Provags-ID: V03:K1:tFSBr2bnyk9Zxo3laF4cPnhjWSIUpUqya9EkRpeseO6NAFhtS6J
 LJGuTPZpeACno+GwMS1rSmN0adqZsBsxA2K+lolwIWrL32pSB9O9iu7bKQwMwUwnEVChh65
 4/qp5brkj0W92wPEOuMWaOvsB23xJMmKM562wWDsosIgBZMTYpzmAomtqQDsaHNmwBH3MrP
 mJj6cJaaut3ovFpBg9PtA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:APqpuKj75j4=:64uSZoQD/8s681u4VuoQ5b
 wMAK32NXUXVyE/V+ZprMjtUXgVAD63rf8dsnRLco+gbWKoH+IriOlRi+AEAH/4lS93AVOHzHi
 ASAqxO7MrZYUuAWdkuiBWXDLSwH86/ILJYOMa5aZLZl8z2L7fvdp8zhmH4mgMpCylyJne8OhY
 P0ndqJd+scujs6hnqHVKr6sAwSX1MBSHlY65DuuLLq55cnN+TZ5fiJ1JYEKNz/mlZlxWkYd7g
 NLqQRnlI7f0jjKlDFj6hmfh121+6PYEKc4LIlLxfAg1bmBXsqNNFHJ0Rs2W+ICaLBtUZzQQL2
 fOycjm2EKPFXYUDo7k/I6/2ToSfTyRb9A5yFmGNMFCeZgXEEittJVU8xm6LcXYqN6y6Q40xqL
 nuwTPAWzNPNITE0+8rBSZaVsYLtk5RNP+OT1n/xHFLekOQhhgW2e4MgYYJS3wgxcuR9xYm2t6
 LAXgYleKzp6hGYjSkT7I52lpzk2CezWWZYO9Ql626yD1egrLpQLKiNZUGpQ4dUpyTWz7PhY3M
 PU1J9pYj7hYewi8Wy4fhE53RUeJrTdlaTz9jyx2rnDoyz2IeFV9cKzS0qxdpxqi3sK1gJBvXF
 fgt3I1ZSKlSKuje+rsJodV/zSGb3QVETQ79gfYrN9O9j3DQe5RgcwtLBbP2IPePHCLozNaPb0
 YQiqcBdUoI66dcqkIE0n4Sju3GssIAB82fLj2RecCySNbgAonYrVibiKZ4kb0UZkdOUPJ3qYR
 O6eoHhgIMHb7atmx8t8Frm+Pnttfj1mE6JHpMg5QqmaKR5JZG0ptH7TUMcqpQBEavXGKTVvz2
 xnGvM/FKkbpXqdf1M1X/3bcO7GyJTys4mkNZqfbZMEzmcmfBd9V9kezFDQni40MdW18lTqxrS
 5FG1FS4dQCUv6lHl+RQK2KiJtXxhb2wsm2EgZKCFk1jFLPJlOpHbu84cgFZmxKcZ3f2VjSiyb
 DSS4FD/q8cEEXXIqH1TRWyzO5bVrGGq+iOfe/tQLwRyGmEwOeurS6HivE7UopXkdiw9gS9Tmi
 zsnbQA9tPIvgOQQc365f67vH3yR4Wt+r5a/mH3EdWmU6Rsmf56nrDeQAgQ4d67UfLVCYDCtc1
 hlG9cgDvMVxdAeJlq4eWGTIxkwGO/qk6kxtcYq7P052vlOhvJKrVVM2AqO5RfdZPcqNR8+otU
 0btRrZVOhqa0x2jbTrBNTO0HppgDO+DD89Q/zWnS4N67YTe95LMbUfdeT2EI7WvwKwBIdtT+U
 0Q1sJowOkksN8YJgq
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 16:42:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/X2clBHrJOBn7KAvd5cUFZTJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

If the secondary has to failover during checkpointing, it still is
in the old state (i.e. different state than primary). Thus we can't
expose the primary state until after the checkpoint is sent.

This fixes sporadic connection reset of client connections during
failover.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 migration/colo.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index a69782efc5..a3fc21e86e 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -430,12 +430,6 @@ static int colo_do_checkpoint_transaction(MigrationSta=
te *s,
         goto out;
     }

-    qemu_event_reset(&s->colo_checkpoint_event);
-    colo_notify_compares_event(NULL, COLO_EVENT_CHECKPOINT, &local_err);
-    if (local_err) {
-        goto out;
-    }
-
     /* Disable block migration */
     migrate_set_block_enabled(false, &local_err);
     qemu_mutex_lock_iothread();
@@ -494,6 +488,12 @@ static int colo_do_checkpoint_transaction(MigrationSta=
te *s,
         goto out;
     }

+    qemu_event_reset(&s->colo_checkpoint_event);
+    colo_notify_compares_event(NULL, COLO_EVENT_CHECKPOINT, &local_err);
+    if (local_err) {
+        goto out;
+    }
+
     colo_receive_check_message(s->rp_state.from_dst_file,
                        COLO_MESSAGE_VMSTATE_LOADED, &local_err);
     if (local_err) {
--
2.20.1


--Sig_/X2clBHrJOBn7KAvd5cUFZTJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl7FljMACgkQNasLKJxd
slhCzhAAtZ3rqDs+hDQlQmfIabvNKFYedeRanKyVUrpPYO6fu4rDuHkJLT/4FK1x
1J3akAf61kj5mr4zfylNZ7tGYQtA6HbGNsCFTnpk8YVrjSMCB6QmZFlZLQ1+1HtW
CeuzwVoaol3sz7ccQvIYD+pCjROKHkRnBwWG7KDiQiPzf+C+AAgFNgknZw8Ym39V
rTpX74ifH4iSOc2Ujak0y4lzXNd9BRnqISoUkEksLEqu1xYCEYjUPr+/l1O3VEe/
FoYH736Hugr8BMxIPtjjGjDIa9jjfvZrY/0yyY3vDOc2eAJYhW3PW0ncZP9eo8Uh
X/Fy+gG4XNdR76tsANIvhb5S3auKl7zD/6rjvZdcsDbpbXayeCd4dlSPdViL54h6
XLRVBa7JjqquSQjVTunNJyM97flnDasBZd1bveeUEkhlqOjUpxGZgKDAsQJJuzoZ
D5gzG7pwS4EL5iKUr/esSQvsxQ+fH4ZS1tfUvCd9tsgEJQmTQDHxOliTNm8h0Exc
7XcFN9cWeZozlucuqL/Cxzi2vFEQpjPQgNaclboAXL1bkLmn8Z+ABFJy1M+7e2gl
2cqN+MiYPhYZoVg8E601XAeoJ2Z59POSdbzScmU25/9aRl8TUCgueDmcmGGnq6an
7dJTwSpY+QWiiZGgbQT4ezWRr2leC3L0VgYJZ098gPVsJm5w5tw=
=ccDe
-----END PGP SIGNATURE-----

--Sig_/X2clBHrJOBn7KAvd5cUFZTJ--

