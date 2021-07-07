Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A973BEE23
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 20:18:15 +0200 (CEST)
Received: from localhost ([::1]:46658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1C7i-0007xO-10
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 14:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m1C5S-0004zo-Gg; Wed, 07 Jul 2021 14:15:54 -0400
Received: from mout.web.de ([217.72.192.78]:49871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m1C5Q-0004qN-Pr; Wed, 07 Jul 2021 14:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1625681736;
 bh=fOd96IJpVXTCzaDB1X4lC7fDdmL09EVUqJuFVBbhkvY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=XXzkNIojvxr1dMqaQ2xqJxhvOUuga6pvUOpU0EJ+EbC2arlVW5Z0ebmT0/9DASJI5
 i9w23dqEMkuMoHqPNUIluHJUdjf7x8J0EY1sqDjPfgaT0LQoH5kmB5jj0MRXkQrd/D
 08wXEs3Gn6RHadl2EWfDfREPw+cF7a4ZVo6SjK2k=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.194]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MzTLO-1lEbm40TYW-00vMkv; Wed, 07
 Jul 2021 20:15:36 +0200
Date: Wed, 7 Jul 2021 20:15:26 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v3 0/4] replication: Properly attach children
Message-ID: <cover.1625680555.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3Qdd/Q97X0L.Fclcw3C4RKm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:9gjv7QSMeD9E+Kwr3sZhYxqjjh94vTXgnJ3u/ISTs2z0AEvHEAR
 E1C4GnoTwuGtYi5hfZQZPqOux7AnNf50bD8Q2uKwgoHaBGwgDN15OOpZlCtlP0kKYFKpAtW
 NkOq1jvFD2jBJprAB3Q6kuhiLd5aGm9W89O6s/PZIekr7g0AMzovDtjKtETsllvZ2YAzCCF
 ItELXFgzUqBwgoTo9pTMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UIiK0NUAj1g=:0STdMy3PhakKm5CjbEBwjG
 OxiOJ96sRicDV0HJrlrZknKuLNjv4p7fMDt86zr6mlJN+QGHhtcUsYR4K93tieEFIRzsGcKyU
 WZJ9hHuDtpCGjvjvBOCMB/NaQLW5kAKuVy1/dmcZW8s3MfTWx/EJmS2NwQAdYKBJHDeQosboP
 PeUpjozvo/4r81Luuk4Syv+YugYYHE2fEXqchQltXRxlpKm9RL6ATy9czlIGlt49gT/kdsoAF
 Mlm8LqIRchjJhHQDX+wi1w4JAf1HVUhjqHMiIBRnPu3n84FnFEy1oDCdkTMfhZIrDJ37K3bxv
 5ZSx+58Np9Tg7ZMYyuWyFF01qtVGwWshsGuJ9NWKLeQxIl3mgqX34gvHPv24nrJ+z2g+LNQsi
 Z4CbGwFGit8TEHUsfFR+PVc5xiAp0AccskYV46I98LxI+CjP4Hd5vxVAkXHOkJmlcV5XZ66/H
 JmKaa1NtxrZ95UP5hWYV0sypHUZFa/TW62bXmqmvf8FrpC1GFT+UANvqh9SUTF2NPjGPwqsV4
 ZVcDc/YBHy0eAlZEepADh5CIsl7z71ynGMFMpQDTvmz1/cVM8FsQIec234tFVtRrWTsh/WryP
 PPPGGdqndRdQl1HC055NEATqBgsIbaKJSDRTToXQggvEYIebxcXeULv8+TvFJBD5/rSBk6ej7
 U0QvkqqcJGnmEKdg5GXIEH/HpQXChSrLyzzDQ8kViYLxQp05pIRhG2BR0AH9YAVVP25OUwLQj
 mOS9Ba8s1tzBL2jDp7zsWxyhOlnx70lYI8GxSqwtDqwJKH1mdiiCs0QHZYPUz6IJSiTFtwafo
 HBINuv6YgnwVuVLwifTdSH0r7N0a3XI4G3Dmi3WjCNjKCjcy44tcCzG34ZW+/hjgx1A2L2zSx
 QKg/owlr7t6sKabkC9qT1nPObUwogBWLhUeV+m/W2xiihwI0pk5p4hQtbjKsTWAQzG922rkXA
 jZg8nsIhYvLknbKQaDoc2UKjiCZb8m9lrOcrILH7H0gvfCdTIPT19rcm96/nxmvQsHBVvGAFS
 FFv140xKDEd+zGcmUVU77zDssAo2t8LJedcRdln4Z1RoqDJf4962BiY6U7KxwsdosKZKskeA2
 /Xn5+ErOJbLnjqzgTggnqL4dY632TuY6ANb
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/3Qdd/Q97X0L.Fclcw3C4RKm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello Everyone,
A while ago Kevin noticed that the replication driver doesn't properly atta=
ch
the children it wants to use. Instead, it directly copies the BdrvChilds fr=
om
it's backing file, which is wrong. Ths Patchset fixes the problem and remov=
es
the workaround that was put in place back then.

Regards,
Lukas Straub

Changes:

-v3:
    -Split up into multiple patches
    -Remove s->active_disk
    -Clarify child permissions in commit message

-v2: Test for BDRV_CHILD_PRIMARY in replication_child_perm, since
     bs->file might not be set yet. (Vladimir)

Lukas Straub (4):
  replication: Remove s->active_disk
  replication: Reduce usage of s->hidden_disk and s->secondary_disk
  replication: Properly attach children
  replication: Remove workaround

 block/replication.c | 115 +++++++++++++++++++++++++++-----------------
 1 file changed, 72 insertions(+), 43 deletions(-)

--
2.20.1

--Sig_/3Qdd/Q97X0L.Fclcw3C4RKm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDl7z4ACgkQNasLKJxd
sljAoA//YtVUxf1LjlbzS1IBfetu4a7tAqufek8dN2EKOKSea5jsz9r1AQDaRuzN
utSKTTYFNDx7DYEEsLvO2pJ2VgGzpzuRKKtGJLc8c41PJq7uSwl0q1DIxXM3nQCB
IAOuevIf6n+vO46a08isx5ekpuziUdL5ppLY+dAlPM5O2hsZvGFiR2fX2U6E32pi
9Y7lHgdnOaiY7HlppeEATRJXZAZVdyVMn4UHBxov/OjvwM0dsFOgS4JoubYrUqQq
cuYs9jFglf92KEK6d6Bs9K1TkPqNea3IfcArs4WGhTAYB+rgnJpAm1abN4XOr4iK
GdcxlEa2OTbRlythnz7Q1V/6wnIhbK/cKEeNqeAY7UdDYPkR1Bfe9U0fu/y0mWIh
Slz3+L+tAVWkkwoWtrEWDCrcqzyh4GufnvACGMntCErlS+8rY5f3yAQhRMBmFrDz
cwJjZ+SfszvWoS386LWHkxsxighGz7CgYMxBskZ83TgtKwuBk8CCxOs+12WFVYjX
SEfOzHi+8AiVBqqxzYV335iSQShNePrs/CqAmrXo9SdQPTvGxO2+6kidtRcmWR0p
kcOCz3WDiOHs54eFzrjK5+q6c9TFIkR/DfscdSLJPxE2fX5d1RpU9qYZXyZrfppn
jVZfB1UoDxayNTcpdKzXW962QC6m7MjfG0iX9EOTGHXv0jLavng=
=gO2I
-----END PGP SIGNATURE-----

--Sig_/3Qdd/Q97X0L.Fclcw3C4RKm--

