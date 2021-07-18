Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9531B3CC9AC
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 16:50:36 +0200 (CEST)
Received: from localhost ([::1]:37380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m587l-0007G5-Fz
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 10:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m585z-00053J-CU; Sun, 18 Jul 2021 10:48:43 -0400
Received: from mout.web.de ([212.227.15.14]:57869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m585x-0006ZZ-JB; Sun, 18 Jul 2021 10:48:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1626619702;
 bh=Q03+B0T1J5eUR8OCQrPZOF1g/Ny8TGdTKin3Aui9/IQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=C/1FUK949sIG+VeNbnUmJHi4/wwkLp9BlLOeApEt/XpBSJUdVo1jMxdRT8/y19M3I
 PS4vN3d8m6xtX2l00xtUpHTxAPm1y8BwyrNaCNZeYtRts5Xvw4kga7fnyJF3c2FOu0
 BJadoJgDKFLHE4/loW2gx82h1ixJLltsL661MH6c=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.49]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MjgXH-1lQFUT1jzv-00lGkf; Sun, 18
 Jul 2021 16:48:22 +0200
Date: Sun, 18 Jul 2021 16:48:02 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v6 0/4] replication: Bugfix and properly attach children
Message-ID: <cover.1626619393.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TnXc/s586zCaJtNSiK+6+hM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:Bn44d3xZdAo1tNMYBtujHwj78nvDoc3Ua+oaOfYr1e1xC1f5aLt
 WwtJJf51hqI61165Yuo6zQVeR0MmhTdz5/gFoqvE297+upWH3viwhmlZRq8sCaCnQaSpie8
 282B0mTJg7KxEuhy5ow2rXDp1I8rAy7EZHhw5utveh+ZZW9lJX3V9rifEYJLe/ZXnOEJLHB
 VKd290Y2QAiXlSekEnxVQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q1yJ0vGR+Tk=:i9c7ucPPgadaARhi9aO/AQ
 18imusGwcSxPW8OPbtFpYNf+JJg/+8JRPbmj+pfQECoZQ22lcSifCXTyq/48p5OxJixFcscPO
 yYQ5fjnkHtyR4QVwueWKR1a1VaOj6VHS+B0sHvXeAa+1q63p7uQjQ1+RZDOYiM78tHEFEzWWf
 AHa3JMXk05rInY5gP8zO6Iwtd7qSKDdeqICfYvo1KwJfK2wJyH6oe2Ij/pdGbo/VGzmQWTLfT
 iUAbxh6WpFkTfVUkZeow7tQ+5xXSAEZQOe9WRUAoWgJEIrNcY6EEPx+No18dKEo38CDsB0WsP
 RSi5vTP1QXH1dQ4f9BGgRQ2M8BXRF5pjB4uQLp/5RMCoWfHpJrIjvZIZ8ZsbgWF6D9F077BU9
 fJpyOhntExVRnarkjP4/lBoMVK9SO0gmSM1WxzPO4kTNyb5Bc1fo84jFdd66JeKz7lFOksOp1
 NTx1CX973H7cCRtEUhWPYH+hBsuYWgaFAoBCXAwTGzKtTvlWiQcs3ArkJLIPtnae22HORYKlk
 VejrHgp27Zw92CZN8S/nexTn2lJ7t7aaGyARaP6AmUxTRHwgvyCgnFv6y+aj4Jlb8n3exaJKR
 Y8mYGG2xStamzIKS+kCVlioknacSzDwY++adzl86U9G6ye1VSEW+vgaQMQI/CElhBfJYBGdbt
 bL4b5eBpjZlSNkb6Kk5uDHqZ0xItkfqU1EOVo6rHN7za1iFGOfW9rt0q8N1aa+1BXLaNWTJf3
 rRbCNN4nyzw+g9+aVx+z9vSKSVZ/bNFGl+lTmQtiLjxlpyfrvGAi0oT4pi592HCn5ck+MnEZQ
 qlXIhMgMuHriNizGwcuHmTbqNA4uRo8pKC/2O3fJUrfUoLYXkiw+XTzAaSMK5Y94y+1t05pOi
 On4Dp8ec6VJf6FIlj6y83fckvtdDJi8SMIkltQQgA1OrKuooTYmXoWsemVGZWxDzv58lXiDc2
 RaVsA9lWoi2xU215FscjSqvWILGjHy3boK4wgb4k+2kQb0IYNLSTpdOsDZySIoevDpXaWAEq+
 Xc0kPiPz/z9rY3SK5YrBIllZkekBLa5H/u4beT40EiRT2fi8hzjHOmtXTzG3NiWqFpxEHy3lS
 RVylGq9ePQERPPKdjJVgGR8ZZc5e9uY4Pms
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

--Sig_/TnXc/s586zCaJtNSiK+6+hM
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

Tested with full COLO-migration setup in my COLO testsuite.

Regards,
Lukas Straub

Changes:

-v6:
    -Drop "replication: Assert that children are writable"
    -Added Reviewed-by tags

-v5:
    -Assert that children are writable where it's needed

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

--Sig_/TnXc/s586zCaJtNSiK+6+hM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmD0PyIACgkQNasLKJxd
slgQ5A//aOh9zPOaMglz95Jmz5VA82ydhIISMiXXD4RjZ9W72i8E6c67L/mPxND0
ib5ZXeC0XBIkxI7efm4b1BdmM/+khWV6Z/qsxCck/g3l1sO1M0g31KTQo+qbVHAi
B27lbWSXVDPv6raefGHZ74reUwxmBew1nj/AkltjiOwunmIl1eO9ODoI+GDxBghh
mEpen+6MM9Q0hk4ejNEBcKXlUJs+chJP/ibMMcFpu+sgpyBh50uFK5wFi1pdluSV
AzLTNzu34hAUWSV5XTnj2qUE5Yqspxz3ojyly6XEKTezPDalE5C/Fzq3PAI7s1al
jwjrELlwMb31WrPQ/jYqwfFdHfdrTPZsfnyHXjapmcwGQoxbrf7xQ9bV+l4oWZBB
Qk/0P2o4uLIdNvBwwYzI/ZkTgYkdc7konono28uPFt+8GNyEu/2TmsNYlJuWCksj
Nms+WInH44jb5MVxa9qNjnOzt6Idm1YVhv32wrG27oXFMGWsWlsM/J9B3Qw+eXze
2mVbeunyZlhCoDdARdvHlo1+FlYu0gQuwV0cJUhDhDFrClGWQn2fJu1P6BEMgTaX
DO3V57kMlVCB47pGhO3Rnu26yL/tp1OoDU+kFrQmTTv/K6VNhOzMpBTLAvBUJiuS
ODkPdP/CFAeBTVp1KgTNHNWTNl1yEK0NgA1MB55w1nHuMFK1/Kc=
=m5a1
-----END PGP SIGNATURE-----

--Sig_/TnXc/s586zCaJtNSiK+6+hM--

