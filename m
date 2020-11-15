Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953A92B3494
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 12:20:43 +0100 (CET)
Received: from localhost ([::1]:39680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keG5K-0008Os-5C
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 06:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keG3u-0007IG-Mt
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 06:19:14 -0500
Received: from mout.web.de ([217.72.192.78]:55283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keG3s-0002GB-TZ
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 06:19:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1605439139;
 bh=pZiOEa6b9LtXt9TFE/niox+QeG33wBkI+lbANrpPgNc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=byTnCoA6rpNtMDb7Tncm1GRtnOp7ek7Rawh0VYJQX3PhozvIEc0DLF/R3TH7wZXOR
 BOXvuaCfwCVNNoUF6HRGhT9eW8tLT3M8yNsXXNbW/YSA6vmjAhmtiunkbUAMwf7E7W
 B3Ao/wXfDIFTvJEUZsRVFBugysefSYJBXFWqw2xk=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([87.123.206.172]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MzkSZ-1kID0E0PUf-00viol; Sun, 15
 Nov 2020 12:18:59 +0100
Date: Sun, 15 Nov 2020 12:18:49 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH 0/2] colo-compare: Fix memory leak for non-tcp packet
Message-ID: <cover.1605438886.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cDrEE8FWV_mRFy_HeFQk_El";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Provags-ID: V03:K1:kPCYVc8l+xlD2NSXHD6cGD8RTIMEtvnDQ8piFqM4LbaWFfXjFZk
 LCxMC1kA6fe0OxZpC4Q+imKWFRZt80S/bgcJqaeo6VyJJlVvpvm/k5xQJujnwJu/7AONOMm
 O35AI/gZ+lzJmAV8ttA+uAWT8L2pwq7iwvkGXO2t2YErIomzD+tSLpGSAj6LDEiuoH0yt47
 M742ReQ0Ty6XV9/GNtEaQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wTP5FRZHL4k=:Jji1vWxDp7uxKukQhc6FgL
 g07F++6T+n4qnjo6P8yicxF9dQFbXl5dQgYMqyhDGhNX3+g/Rq8OkCdEhU/3AFXahy5RflexN
 /YIYtEuUPW7cj9E6fSDE8cE0PY3Gdwwk3+KSfjafvnZs7p22UY0WH5+Cnrw+XmJeKFFKpJRJv
 bn7wXQCDcJi0CUG1Qldx3INbBaUVZKurbvhBRpR2nQPo2KPAW4J1oj4UuvQY2X4dYhHGpYGz3
 zsTJiVWHZHahYe15hSUeYP2Y1Zb4DdxEFp1fKYzVTZMfglVXvHpmvQ8XTn+VekCMV62sbFt5X
 GZvhT1gwnHPPDYrcGTVdj+vjgxFyb1NjPy1zgTNOpMAAmjy+2rKe/b8iOh2EZgPl/cJmp8BWE
 JxwGRU51CR31JX/8gVP7sckG1QU/KLHQHPjuMseY6IUUOiPxkRUOeC9tch0R5XHl7dSTYgjuQ
 LTr0u+DpfblCGIeNvjNEgpBlO6Dp43lbjJBceVApymOncX5FV5da9AQwkTr4pOJiZ1l3j45Tq
 w9h7+e1aVO5V2JwqD+3RHwobVYLa/r3WtHjbyDzgf7JezCJ1CTE7ryZzQzN52b6O+b8VVVqIk
 AdO3lPEkmNTZUY1D79M5otsE4WU8uJOKDFmhCDDuvwyn/8YTpQpgJvdgpripYI9asdpP2z03X
 GIIQYxbYSShTk6MZIdTiOwzTcYsNxGJ2zlJKsQYBd9HH7xA6Y4yi0Zv38sbqgswBSwCIHvj6y
 3ZRS647MaOFEqXRXRM3yzw2g77WJijnZhqBDFT9PlvQmp4Uk0zQMFBohvDS8Yrm2erLTWKXo9
 /aa1eOwlpMJ1Q+bwpwIJ/VBiQycEDsdWRBBxJKByMjmdPjTZl8jQDtv9R3oLY4qbpnYbUE1IG
 y6hnO2pwtV7dR33EyA8w==
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 05:44:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/cDrEE8FWV_mRFy_HeFQk_El
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello Everyone,
This fixes a memory leak for non-tcp packets and optimizes the removal from
the queue.

Lukas Straub (2):
  net/colo-compare.c: Fix memory leak for non-tcp packet
  net/colo-compare.c: Optimize removal of secondary packet

 net/colo-compare.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--
2.20.1

--Sig_/cDrEE8FWV_mRFy_HeFQk_El
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl+xDpkACgkQNasLKJxd
slhiNxAAss4BWnws27DMSpMuu9gtJ/AE3LAjmqSavP/cFo1h+t+/7HQUwW9jypOy
gb0A+ZAhMXiDu44Mv5PjIXXlW0j5Xab2HQu56Ne1jFpha0ytA/JFQsQ2mYwVwflE
T9XDuXUQDefWXpxMt7/Vut2/lj1PzIUu/MvQeot0Xe7BakGjd1PstsOE7fylllcV
oUM+sPLcHLwKglMTL+dpZIkkZf1KK6XWNw6fXOo1ChO0ny/hFP24QFajSnpAZ7M7
L97TJJj/oZCXnT4jRKcGtK+jVdjCFaPgHGDYNZHcg5r3+N4IQ41T4S5AK86g4fDm
vdzoXc4ZixmWCo6XmW4Us8B8FYo7xM5MVUX+DRpsqEAWfkNR5NmcLOXhCyI8x3a9
nWj41Rq4HtmMoLbAvdDADoWeFQz29joeKEH1g5816VxZBix4YR5MaiJNTNcGzSJD
yONS/DyqqDS2SCoEMOxKBLwLlCiU4SGzYxYyQWYlcQkM0wuwqzi4w1rmVoAKRJeA
+UxzPb5adkMcZIqzvwQKrLsRLo/1zXPKvLp7qmM6XcMRjn67jUUvzmkPlZeArVys
yQM4SkaP4y6kxCxS5Aeb632Eqhvyg9Mj8WX99uoMWvuK6daLmX6XuUvymGFXN3nV
yWS4jA9997e87e4/lQ7j3YkQIFMKS4/7uym9qb68QWvQDty7H1c=
=UL0B
-----END PGP SIGNATURE-----

--Sig_/cDrEE8FWV_mRFy_HeFQk_El--

