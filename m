Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C453C5B97
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 13:56:41 +0200 (CEST)
Received: from localhost ([::1]:42688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2uYC-00030R-Oh
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 07:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2uVx-0000C1-Sg; Mon, 12 Jul 2021 07:54:21 -0400
Received: from mout.web.de ([212.227.17.11]:37947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1m2uVv-0005si-01; Mon, 12 Jul 2021 07:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1626090836;
 bh=SrKnKGOgvI622OS+2EnMYSbrR55yLKHVPkeiRtM527w=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=DqB8OHPfoGA9bwGiX97GeyInRenJohtOPK7ws95MXMbqisPJzjlvCtFD5VNRF2niQ
 /5Y2gJbbp7WzwE7MCWmwP62qaFFBBZTCp5AftlC+9qxS1u+2M1XyYdc7EdipPrKyfS
 msDXWtFLil66uXr1Zs5L5d1XRPlRpF4KbsiqcnyM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.76]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MLgQp-1m3jii41fn-000tdm; Mon, 12
 Jul 2021 13:53:56 +0200
Date: Mon, 12 Jul 2021 13:53:39 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v5 0/5] replication: Bugfix and properly attach children
Message-ID: <cover.1626090553.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XvYS8Usf=wCsThuN5gJB_kI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:tnKpFkfLwPefVpfBtpZufVpsvivhDNupTX9g830rivnRlFQpUHc
 47AA/Mkwdj4b3FqbZxO6XmYaXdIfj+ZwGhu5cOEXSTRDtT7l5v0wEzk0qNSVEOHOBYBJIBe
 8YhW5k9ZEeiErI+otOCZ+i0Hchh1LYy4UUpjlZ8K9zHh6mvb0vfDXNe7JUjM0RX2uP2WSwG
 6F7hvUUzDlEhaM5Ds3GDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:66WKzlEz3ZY=:858ykr+dOcR4DQ4TnKO6UX
 XgO7s+nlT10MdC5DOfZ8qDnh9HVUxyYzgYMO8sxJWu4/zEG3pb3oUsuLtarmejY5zOd5Lekzx
 FlSqy5GQ/JBQ8VZK+JM9e3RqRukEfPOyMV1Ym9/hGpc+wfQf9H3B3p7122KsvGTue/yo0nRWw
 2L6T3ez1jtFsMRQOIOnMPtPdQL+v0GgkBVrv67LFC2leIAYjg84EUjUBugKbAU5u+FTZtpzXO
 P3LYVism5ComI3x1TpU7JIf0+CGn08+Dz30Svub2yoceAj28VSmV99OeOznbyzDAlr2xspIIN
 vphZ01IwJN4xemASiVjz0/4Cx8V8KElNlfSSL7rBNjsEi68qzM/6pGXpt9DWkuwsJjmSjkA9V
 S+rVzCrqlogGtm455Im7590Q6yf30Rrbc5LS1Eae7tHstbM4y1MvblNvCZp39zDMBkJ89z6Iw
 Y3wtJMCnf5lG6I7HjlddgMu+xa+EOE5LUWylI5AEIEIV9T553uKt/P7Qa3Ck5MW2hE7nJ7fa+
 A5ggJ75xIm2B84hzb5WjP40+mGl/fzVO/COEgTbmb0Uj+g5O5koscJMJM/8OoFCEV+ehAeIpr
 WYWs9jfzsbGibZ9ECHegUsYz/Bq7nFvSEa7xY2MBBBI1sPGq7NeVVHz8kMWdE+wxZJ8CLItA/
 XiHEg/bTK8mI6/G1ih6ZUtwc7UpeUk9p3HQzYl/92Orq4zyZzhPl9hDItd1hg+0IDTl+8XOIW
 iXx7a68tzIox3zCTtqpwIEx+84CKGZwIdAUPEDe4ibug5PjT0XFgvTvb4BsD6EXi3KfcnAi45
 3SY7k6sEIHm82+UeGv+PhS7tccqDhVwed4RQDeXIaUz49NXJugsrokqvZQ1qYUZAzUDqg+SVG
 pCVNlPvEtc73yCixOd5rcBMEhg2VfWONt4+R4xPe1BCtW78gi1cS2ZpTQNYpd02uK29lvyLKx
 hkDmPMGSOdRA5QmzpfOFD96eh+G0kfVmqahgmDgcywkGaqGfIZQxPddSh8NVDDu1xXAkGMYOS
 6WWWdl7+mA0Zh4AoFwpNgOszR19ACXUrNtAY+CbZimHjgsIVbNjLfI8pDqrXWFiB+dnKCNcXi
 vx0qpSEHzMZlSECAyaHA7/IGSDtdr/SEjv8
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

--Sig_/XvYS8Usf=wCsThuN5gJB_kI
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


Lukas Straub (5):
  replication: Remove s->active_disk
  replication: Reduce usage of s->hidden_disk and s->secondary_disk
  replication: Properly attach children
  replication: Assert that children are writable
  replication: Remove workaround

 block/replication.c | 121 ++++++++++++++++++++++++++++----------------
 1 file changed, 78 insertions(+), 43 deletions(-)

--
2.20.1

--Sig_/XvYS8Usf=wCsThuN5gJB_kI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmDsLUMACgkQNasLKJxd
slgj+A//Y9oHetqM4rAmj5fPqM2fRW9V3WV/M90ez30DiaiHOU+dSQl618zA3zR9
lCAhQlXN4M6dWNY67+vnmxOaf394ufoyH+OZDGlfI7Sf5H4n9r0R5GTMAF05sUtG
Z+oCFgcdPDA75KG3nP4Qeq9lYKyv3/UYE37zClzcHrcd1QNsQ+KkS7I1MYbLKEKs
cH4+O8Mds34SwpWojnwi8K2gASS12/Tx8YyYr32QM3gFyYvq3ScfDwj3y1l2S/kt
Is+0JB4bUvuk1L1Ri6wyKAiHETv1nBOS2Nb/m1b/GyDRKYPfOWnDe0rgKgcyg/VS
m4JhrWjSirkGBlepx7+DTyZHxFyYXHtbp40C3PFhn9cT6klmYx8jlJZ87OfZ/SOx
rh2bqm/iTwQ8b/mzO42ZNSEcetSf+oNRbtV6Zi0rncNFki+3b/aN4bLyX66299Ej
/XdydT4xdobS5bMiibMMjHJAEChohiNfr3ChPW9La7qhhV4QGNbEaOPvYJSS+e6e
IOxwXaidY1fm7s6UTLX9O2MxQshC0p35cd7RVXDgIXyAAHK8LkOLQ4KAklABsLe4
eG7QbI/oviFfu+GinTuuZLOxhmfTxElbJqiCeAqE6bkuoLwO60fRmuabCA/yfyeg
P8vqFROr+Vs8oXCoXXsjr6B/+Kuydw4W6wYvl/x88VuH+tXQVck=
=0Y1v
-----END PGP SIGNATURE-----

--Sig_/XvYS8Usf=wCsThuN5gJB_kI--

