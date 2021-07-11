Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CACE3C3F53
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 22:57:32 +0200 (CEST)
Received: from localhost ([::1]:57694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gW3-0000lU-5p
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 16:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2gUa-0006m9-TQ; Sun, 11 Jul 2021 16:56:00 -0400
Received: from mout.web.de ([212.227.17.12]:59665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2gUY-00053v-SW; Sun, 11 Jul 2021 16:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1626036941;
 bh=ikFKBxZwuVui/xeXu4jY/i2f7WYEAP07Id2PEgRa7iI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=OqqvczHD/RphHrg/Vw/3+vU/HfEgbkAn5IdlmkvA+BUvZEqatG2pe6B91c+0LmKZq
 gpgv0Z+BfL9sl8EmNFKYyvE1jB4K517QcBmH09/lTgAmdtTbtc0pJozXWSjdAb42hc
 sJea64vnZxDWbKicxXoM2RnJ9Y/XPW8Jh5fuuy9s=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.236]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MLPNm-1m28Fz0j9W-000ZxT; Sun, 11
 Jul 2021 22:55:41 +0200
Date: Sun, 11 Jul 2021 22:55:31 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v4 0/4] replication: Bugfix and properly attach children
Message-ID: <cover.1626036515.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P6afgNLw6jDGxOWh+auRD4R";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:tnrGeOZJa74zY50W7HeGGBE8C0V+l/+mvvKlqjZC7DWHhJ2qhJL
 JixOuWBGP3jOdGRlJvn9Tl7+dwyH7uSxZE6QzKW4xsFZ3eQkYQS/9tw2oXhIeXs0l2OjUq1
 O5YcViBd78aDWftZls58fpfnBxwky9Mrm5ankZTn+92Dl3L1+cIRLNHSqTqZSwnCcWWDutn
 Buv5ADkMMfvRMH+OR0Jwg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EBC5UsPze3I=:sdwhrMC0Ypt1+/zm5GHlrb
 mcdR9hLLA/l8fdN21R2GGDLg11SgV1vp+Ug9qKpjC9rxgb3/0qBIXpRI8X9AIhg4rtI3ccGj1
 hQUINRxj1R+6R91Ua/yK35FNrHLqhKVJ0JXL1tIR9cCuZECfQ+ltkEbR+hFyKea237DeS6r8g
 3+iwVqZalGU4tWP5XEbOcThZGLKfQwVGdOh/mNxS64E7msnsvUoxfbQXUi9GgoV0AxdF74mtQ
 mR3drgCr+QfOmlHclvhTyuUxkaXXej+UQzfPHwzJT7jHPNCC72zxxLKKUA4jqadktCEEQ8Zvm
 XanhNIgdnIh0oWSY3iyBH6jNCQcdk6025M7Acb10A1UkKvHXor28ETnB4XhUyNR80AWX0D/kx
 QTD+YEkdgkPHJP3bbhT+g80Aesgfol0FN62iXYn2w5BKfle1jOlCL+sYZY/JJWbr1hlGm0rn2
 rygb8a+YnQpyU7MhvMVtuhzEPoEakDCoqTksl0W0m/FKv8TtxRB7ngRej6bLHZ1FQ9ZNGrHFR
 VVac9W+eHBLjohf0//b2sCUsJX9gsCK2tDM/4JWiM3l7ubuzt8M90n5qxgE/LUdTb3RsIqwKx
 BlrvPYbQ4PIwNfdceyWzGmSrSBEgAC2Zm0HMK5F9heE+KGl5XusBpUaib7/wa4OkFjlMrCSWT
 Qd102X8U1M4KQt3IC4y3Czx1/kmdclX3h0OknNhTHLLDrO8hUsIp1Gu+jM3feh2ykLSdtxXrJ
 gC3EWmrN6Ggczs6+GoOUhKSG2jSUXXAIJHKiWcc+uVmMJgiwQu16+jjrx45uEWyRnnYYp16eQ
 qh8rGB1ZAdWsrhsyswkfdOnUjfUixOi00uRnO1qrlZ2Q0Z4AWOxZZQAgSQtp1j1gwfbtmxu/K
 mLQLgM+J2OGnnYbYBuOtgV9tNJ1RaalYhQ3VcMBWmx0z3aWAbqF+mrzbCNAbgFq/WUTGz1OBf
 2+ts/fCDmYuuTgkD7gsErlUeGqfgcRXHlKP3ybPSsi30IX/nVMYbCfbKvqbGjeCBnRwk7WUXw
 mtFcU1w48pXk37uFAiQfJs9a0G1ubx8jfY01FU3pM6tcRmmeeVLT19exIv3EtGmQi+nrnjomi
 b/fjlvJJ9vThWee5Eu9RfDcsTunfBstNrLB
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/P6afgNLw6jDGxOWh+auRD4R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello Everyone,
A while ago Kevin noticed that the replication driver doesn't properly atta=
ch
the children it wants to use. Instead, it directly copies the BdrvChilds fr=
om
it's backing file, which is wrong. Ths Patchset fixes the problem, fixes a
potential crash in replication_co_writev due to missing permissions and rem=
oves
a workaround that was put in place back then.

Regards,
Lukas Straub

Changes:

-v4:
    -minor style fixes
    -clarify why children areguaranteed to be writable in
     "replication: Remove workaround"
    -Added Reviewed-by tags

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

 block/replication.c | 111 +++++++++++++++++++++++++++-----------------
 1 file changed, 68 insertions(+), 43 deletions(-)

--
2.20.1

--Sig_/P6afgNLw6jDGxOWh+auRD4R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDrWsMACgkQNasLKJxd
sliZeA/8D9h7IoD3ZdZkSogrpQEuXfRpE/rvzy9/U4RSgF+piFfXGDMB47h/WhCV
qC2Zp3Erg2y7TU1yeczBIZ+JyOyr/qb2uymw5Whq2CIKiWXafAoCgDeI6WxYJUJY
bTx1+DQCJ+C1lRWHRTLJEE8e2Wu4sPRtgrzovB2fsi/0K7RfOc2ft0pMp9fpSiYv
U7fN8tmmP8XnZsp+OTkiaptxooC0+kcmD0horjDff4ifk0t6MnFk64w+Vjwrjeuq
VoEGkkDLGnQ447OxybqNoY6Zdu4XBGPyJ8qb2utGz+C0Wu16P8SHafXaGFUaoECi
GnSiW5Gc2cmGalveHGNx4+3JKYHemIi9v4rLegA0NbparCHAqMjSQZt7fePwV0Fu
cZnmcsaePkBGvJp//0a6ZE3s2AMzvo7HxLcMH0Gfcxr/H4orU5bhk7+dIXSg/3XX
F/Wq3+1BIQL41h26Xcl5bpOzNISt6izHITv+WVkbdpc16kjl+WpREsOnEcQkztwT
wnu+wtp6iKMA0cGw4bB4uPI5E1fMur5bX0rK3UsqXu7VSpke7Kw5zx2j6bRLrmjm
YqnqekWTqfm8vxITf5RFbia//nei3uuG+vppkbXu3RDIDfIGor/BvKjJyfNDGfpW
ideb8swDiR/+NC5ynZL2+8h02/JSg5W34mJsjeqpL1MuQo3LepA=
=F1JV
-----END PGP SIGNATURE-----

--Sig_/P6afgNLw6jDGxOWh+auRD4R--

