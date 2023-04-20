Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18486E8CDD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 10:34:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppPjR-0005sC-VE; Thu, 20 Apr 2023 04:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppPjP-0005rd-Vi; Thu, 20 Apr 2023 04:33:31 -0400
Received: from mout.web.de ([212.227.17.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppPjO-0001et-8w; Thu, 20 Apr 2023 04:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681979587; i=lukasstraub2@web.de;
 bh=FLbaevEDbuogEO66jv3AWhSND3d5lDJumyMNRGAJ2qw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=bvkSDZBkYQY+C2gtImEQNH6amwWNtrfOCBARgQl54llmyDzgoMU5t2eSxH9jzrJDN
 1UBmNlxzLLaor5AFYaP51dVjQPY0iX6kOKBH+a1EzojYuz1sBRR0SLCKIfW6Cw+fp0
 tlbDvCYH1LsS/aKInNcyhLzctynVl5PYQa/GtUdCtVA6HwvDlQ8fYe2q1EIGbBRrRW
 SkM+FuwZWMZNuGtjj0GYEa/HqUTtRr0AR0eHiEfxUI+ulboDsqjzQYpSmh8qR60RYn
 cuUI9QO88Wh5ugEon9HISwUrA0Nqkw+2R53HH6DTvAFoVHoAvZgboplEQRzDtSDeIK
 cLATJ5F6dhr2g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.123]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MqZMQ-1qbcah0Mt6-00mvbV; Thu, 20
 Apr 2023 10:33:07 +0200
Date: Thu, 20 Apr 2023 10:33:04 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, michael.roth@amd.com,
 armbru@redhat.com, eblake@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, zhanghailiang@xfusion.com, philmd@linaro.org,
 thuth@redhat.com, berrange@redhat.com, marcandre.lureau@redhat.com,
 pbonzini@redhat.com, dave@treblig.org, hreitz@redhat.com, kwolf@redhat.com,
 chen.zhang@intel.com, lizhijian@fujitsu.com
Subject: Re: [PATCH v2 0/4] COLO: improve build options
Message-ID: <20230420083304.24d7ecd4@gecko.fritz.box>
In-Reply-To: <20230419225232.508121-1-vsementsov@yandex-team.ru>
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h3OfPYY8cLGZDBdcj+=Th75";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:RAdkkJ5sCdamr3suE5SuTHoRxZGdn3vx2MiOZTLuhQd2f5yLStH
 kjWcuLv/BNOnBq7T1t1baEE74ezxM+aRGJYsYlFcuAUdoKOd/c1q9KeVShBLu8fB2pOoAJp
 QGkrRWxUrmIjZMJBjKGVO/aT45RECVzmQRqRAc0Pi3dvu/A9XaWJVNmjGI7rodgmwfOjYTW
 uoReYemC/fFWxYqKZsiHA==
UI-OutboundReport: notjunk:1;M01:P0:L2IJZa66jtk=;ymVXwI7dxpMqv+1EdwY6eS4cD1T
 NIk4H6oPalQp1bRh8dRk6xlCvS69AF3Qa7R8JcJgsRic9Zkss9ZkifXhCBmSUYijlxgNBRJ/l
 EFBiH+4N1R8X3BJSszHLEVEAOUtkl4lqJgiqe7oJklF6iCHl/31xtjJSAM6cwxheCYYqx5/j8
 Pnr577xCKW7OJdk68FHULfwBDCyL+kD/PIkfK5YHyZcmjykHKq0yr5mF9bdl480LLB0vb0eL0
 lVd6JZceCyrv4yjFSFJfeniu7W5G5CW8Qi6DNtVq6uZ7d0ZwE9cklOmUs3zR3cTtPwerx1Fh+
 CzHuLOO1rNf6zoG9gvHec30L5PqAnvb43GGB2gFm00nR82rLdJZt19TMk1C/YdlU/SGVoza99
 hSNyvbhLKM8MliD/xGQou1CRs0N9FEEzhHoLphwCQZWalKNCVv+sK/regEhXZdoSg1/NPrN4+
 yVcXPycg2fdGlJl/7z1IQyiO+dW2zcB2vtR3U/2vvxUegEEPZj2/JosNLrEa8BLCLU2B7+HI4
 jv2NKDzm9wjkSlST+aVa9hI8KVqPuEQGk/86+jz4DNbooYvVvQEoTgCx0mdIyVPUWE9DYWO0B
 eHodqXyBAiOM91JleSMHjixbvftCHS18MfP2WMMnW/H/7VTN4Ztkaq4OW2wocnglWkjhclWIJ
 aQQa7eHKnKYRL300VQlRACaZ47KyVqx7Os/Tz2WmC5OnrUGp6UyYkW7Ib5F/jOg3n+pG5QA7J
 cXO1Z+nRLiMifzmN8/7o+q6qQnARhDcw5HyF2AG+2Ay7zHYKwdQ60YflbFdBtY7Gj1tJnza5X
 BzleF1JqgNniWnlI0la/fFTBCW2kLJIO+73C7AQMAUdxUxlQJTKDF9srbCkBvwC7YX+rU8b50
 n7XRR6996CiIgESmoqiauzK1MitLZ4CVPJGKGPqiIXHBenLRZym9gt7xL1YBMICAeGTtG3JGu
 GKy/EMEfoiDsKSEkbEoR512/0co=
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/h3OfPYY8cLGZDBdcj+=Th75
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Apr 2023 01:52:28 +0300
Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:

> Hi all!
>=20
> COLO substem seems to be useless when CONFIG_REPLICATION is unset, as we
> simply don't allow to set x-colo capability in this case. So, let's not
> compile in unreachable code and interface we cannot use when
> CONFIG_REPLICATION is unset.
>=20
> Also, provide personal configure option for COLO Proxy subsystem.
>=20
> v1 was=20
> [PATCH] replication: compile out some staff when replication is not confi=
gured
> Supersedes: <20230411145112.497785-1-vsementsov@yandex-team.ru>

Hey,
This series is a good idea, and looks fine to me. Maybe you can remove
the #ifdef CONFIG_REPLICATION/#ifndef CONFIG_REPLICATION from
migration/colo.c too while you are at it.

Regards,
Lukas Straub

> Vladimir Sementsov-Ogievskiy (4):
>   block/meson.build: prefer positive condition for replication
>   scripts/qapi: allow optional experimental enum values
>   build: move COLO under CONFIG_REPLICATION
>   configure: add --disable-colo-filters option
>=20
>  block/meson.build              |  2 +-
>  hmp-commands.hx                |  2 ++
>  meson.build                    |  1 +
>  meson_options.txt              |  2 ++
>  migration/colo.c               |  6 +++++
>  migration/meson.build          |  6 +++--
>  migration/migration-hmp-cmds.c |  2 ++
>  migration/migration.c          | 19 +++-----------
>  net/meson.build                | 16 +++++++++---
>  qapi/migration.json            | 12 ++++++---
>  scripts/meson-buildoptions.sh  |  3 +++
>  scripts/qapi/types.py          |  2 ++
>  stubs/colo.c                   | 47 ++++++++++++++++++++++++++++++++++
>  stubs/meson.build              |  1 +
>  14 files changed, 95 insertions(+), 26 deletions(-)
>  create mode 100644 stubs/colo.c
>=20



--=20


--Sig_/h3OfPYY8cLGZDBdcj+=Th75
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRA+MAACgkQNasLKJxd
sljyNA//XmnI2Ye0wdlV99C+qzHJNjiqlzoyihm4KMZvvAOq3dBb1p8AOppdc2TP
8GBcVStwZFDSoN8w30v/JUWiCtSIaHHp80VIaiVnFc+YuVRB5XE7yWuVC/U8nHLf
nfMh940Hg/i9mqHjg5hHrZU7pXZAoAhSXCNGdnQGrDTBO13FREKeGIIw32sFzQb9
79yLhQy7gcii6mk3Tp9ZHOdViQ6ltVxBvhdlTXEw6HhMjfLIuqZu0e6SEZHcaKk2
FKQ9/2l1lDF9+xEj0SRvGyJjjmmWrFAv/0Q84kCpadNTkjuUdGb2B+2R1ClnDNF7
ioeEPRTxLmO1zdHjIHo1+I+NOnIxqthsoWRGiCzwoo3BKhretON6vW9Vf7oxvixa
y8zKcKxI7Uk/27aZkp2CHqykYJ3YakYhAg5ymEeyiF37vtD5dkji81VDMRhvRccM
I9RyNIJ+bAGB0n0TOeRiU6iXFLpJxwp2rxji82W1HOqNRDwZrOpAfAVtFOlTL6gT
qTLGNtSHrPr4NwpnaOIbwwiNV3w0YoMsJ2esJfQ1imHLXnB5fZQlvgrs3iZVcDWn
tCuc3WKEOZJdGjLqFohLyTeOI2JSSoSdnxGR3HnTG5fqiMcm5TOr6rLqvPHS53b1
9gb+d+sYuvAKb+coZmu74lkeorKKr/k58Npf6nsJOVOoITd5els=
=Jwo4
-----END PGP SIGNATURE-----

--Sig_/h3OfPYY8cLGZDBdcj+=Th75--

