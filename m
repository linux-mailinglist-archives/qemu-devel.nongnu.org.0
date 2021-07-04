Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD4E3BADC9
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 18:16:58 +0200 (CEST)
Received: from localhost ([::1]:41846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m04ng-0007hg-MA
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 12:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m04mB-0006ur-6G
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 12:15:25 -0400
Received: from mout.web.de ([212.227.17.12]:38069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m04m9-0006fY-5P
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 12:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1625415300;
 bh=7/kGr7x/9hiNsY5VJlN5iXLm94LfcA3hZTbn3j0hXiY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=MoLiZrSkaToKNaeErxTYWXJo1YudJ3BpIWJ42qO+cTb6ff3bjZpd7/B7Ddy3RiRkQ
 0TH71xFRUInAIThgJmj9qOD68Eldj0MmfT+Hw1yXuv6X2zXMmWD+dHQ86GkA1s4sJ0
 Kz31mflBNgQ8rnwaYWZ+xC3bZITfyBVr7i9eOQPo=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.115]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lr2dj-1lVOel1ueB-00egfo; Sun, 04
 Jul 2021 18:15:00 +0200
Date: Sun, 4 Jul 2021 18:14:44 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH] colo: Don't dump colo cache if dump-guest-core=off
Message-ID: <20210704181444.59396f6b@gecko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.q2XOS2ozWCXlodzB7dR0N.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:VZD8s76S1iss0BoyXl3sKF1P2WR5ahVEzmLKBBBvaHr/qpnjolr
 rfRm4269wcDQQpjaxQ9hMJ3ZWc936HrsDvbRc3ETEBSmCke2gPgfoprs/dGnWH/MdbBmRWz
 iIScrUMD+xtwvdJFSTN/gyz14wNV40mVPFP6pYXuW462dpLegmY7T2ONWFvaQAMax+qZV3J
 f/GuSMyYWD25ZwdV5BuiA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qao1scRyGkk=:GpwAbccr2g75oPIqIvuIDC
 74iT4Xu2AVFv+y1zB3Ie/wng3/WRhP34yWxRRFBjiIhA52Jf6XmW5iY96ha9Yp1nOhXJmEsFD
 ibAlmhbGC3MiP60hCXfDTgpW0oavsSn1Zxxkc07hzWa/1WhxlD+7M8lIfBIBJ3TaZboexzQy+
 QM+us+YjzqJxvZx5kIYapc6YAei+4BXc3INbeCm71xEaVLa+miY0GG4F2SLHmnDoFqPn6vrZS
 EttwJKqQsPpWoM0KweMhe4Vn5DGbcrN1N0bymULPKj60RQ4vwjAZxat2wziY81yb5z8US1D8I
 IBDsWSVjDOic01pbWNpt8U+CSk4FagsMwGfL+vhtkBKYEshuBzxWWnQRlElrfuL8aS/ptRp5k
 qQeTSuUdNsVGZwS6qIXVQ7de/lnBIXbKpTDBYrMIttrNQSOkRM2JF9QsuuaFVr0jP4spkyjSY
 Ei66OXx7DpOZ7jhHRcUNOR7OzVOxfwk6W3Apbuo3ujxOoYnP+Z70/8UM2BJS2zaJddm3yeZkV
 NpRQsZbjjL/ftK/Dm1Ff3erNDMjZHLcttr8JQmrI5zDNUvi6IIYUBPQHsxa/EP6/ShFMt2jF7
 V0jhluxkihGHcViiD2vXNQO+PxXkD/RdRqANxa57bZHP9+E1lC5RQ0+d1NMQoB6ZBJLwco3vC
 7oCLyqhTwrNqp1XEqnkoUbYK7CNWKeIDxHm0Po811/ph3T27Rwhd/4XVS9Ba6hmCijVB3seBm
 TAUAcCdOK0jTd5fT5L4eGl+g3jA4FuzMGcoqETsLT2A9RGR0VhmHWLL+OtzR93FL2TpHwszXe
 7gKQPDqy8ydTbZ/A1EiVfJMpihXFVaYabHUtqSvpg+KWm3LgQMRvdjbJw5QhrAQ457vfqvtaq
 CdB6WxiBiZgRKieFIp319Z6mjyYdq2UR47DFp34y2pYwV0jmTfa0ZK0xZEKunBvJkjZgI83Wv
 ttmBqCtGYDyODx6bCyTmsqjlMQPYsD0FLasg0AgABuh0V3J0OuKzalfeyXRR5tel1QptpBsTw
 CRMxBbFdyNfsi9CVxAeNSUAGgscC9IUYV6qVNnt+v3A6YVDNehqexLJ334kwzyBdVbktSP1W4
 XDynm5CvKqJ5kaxIAYwuy7zrDwkrj/0xo+wUo9MptqAdepM9CIJSNUxyQ==
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: zhang.zhanghailiang@huawei.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "Rao, Lei" <lei.rao@intel.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/.q2XOS2ozWCXlodzB7dR0N.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

One might set dump-guest-core=3Doff to make coredumps smaller and
still allow to debug many qemu bugs. Extend this option to the colo
cache.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 723af67c2e..0797d0d222 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -56,6 +56,8 @@
 #include "multifd.h"
 #include "sysemu/runstate.h"
=20
+#include "hw/boards.h" /* for machine_dump_guest_core() */
+
 #if defined(__linux__)
 #include "qemu/userfaultfd.h"
 #endif /* defined(__linux__) */
@@ -3356,6 +3358,10 @@ int colo_init_ram_cache(void)
                 }
                 return -errno;
             }
+            if (!machine_dump_guest_core(current_machine)) {
+                qemu_madvise(block->colo_cache, block->used_length,
+                             QEMU_MADV_DONTDUMP);
+            }
         }
     }
=20
--=20
2.20.1

--Sig_/.q2XOS2ozWCXlodzB7dR0N.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDh3nQACgkQNasLKJxd
slh36A/9HIb0eix7+oZklBUyU1qExVGzkn6Miyak72sN8lrYrmUFxSCAKmie6UUV
YcnJ/E7f07mlNTXAiLF2FCaI1hh0AEqqNQ+RE8jHMbNcdfxyb8fFH0xsuiJyhugo
KSi0Aq65krt7w8jwJALcrNDPk2nya1uNPaH6PKlIkmWfm9OjKsvFIKEta08A1rdQ
+wMfQhuoEtXmlUZoF/rOhcYH4fIA/ngO+PC1Y1BswGb3mUtFTd0WkuAAkv1SbB9C
7q9R18z/MUGh5tVLPRoMYv6BhrBsSSkeYjCUAB+Eg1rp25tKSC/nTiLWy+lnXIRF
Fjwg7qr6GbreyS1VjE2QCwJefGo+p1lprbCctWLVS+oMVGKtJJW8Au9eV4nVmZ1J
niw7891IqUGbLZLJgrMSbcIdw2BJ7Wv0cAmDN4ozpW0GdefCU7nqrEc5frCkT2bo
J+ohAkHuVB4ewmZGBXbh1LoZz7v/IIYHMNDq859OcUmvlNxImePystYTCBGyG8I8
21TyqB6MuKKXXRTFye5Mt7wEUtONX6kmPYOkEo+E2Vcywhvi+4AhgeRsb8FV4NZa
oZD2m2tY4NDZYnKw3GOiumWShK+4RKFUlLJgpHFjIOffgCBebAgE1dhW7Ecyz0Yg
yPn6VRnCj+AUDEpfm1LHz+Wt7rYwJ03ZBGxJJwHEId8z9it7Bt4=
=f0Sh
-----END PGP SIGNATURE-----

--Sig_/.q2XOS2ozWCXlodzB7dR0N.--

