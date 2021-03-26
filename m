Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB54734A2B6
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 08:50:37 +0100 (CET)
Received: from localhost ([::1]:44162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPhEq-0003vq-Im
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 03:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPhDF-0002dU-Us
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 03:48:57 -0400
Received: from mout.web.de ([212.227.15.3]:50581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPhDE-0002Y5-7x
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 03:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616744929;
 bh=4vX8JCGCMY7S2JtCPus/wvHvOi2j74VvUfJZWFN3jWg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=hHmu9iJHuyGCRdRtebyNu6Ejf4YXHqCBguuWX76yY87Y1yEbbTRQvAGHF5JtoE/W4
 cy/otl+o9fmcE6L4eZJWw2TbiUJrTeTOVdhwLE8pJiGVtRH3TKBD6W3skqsXaZEYOq
 x7dQyAbBoaV3BSWwhbpzK+QYx8mPjIxBM04or6PI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N2jWK-1lmlvp2JRc-013OFD; Fri, 26
 Mar 2021 08:48:49 +0100
Date: Fri, 26 Mar 2021 08:48:48 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v4 2/4] chardev/char.c: Always pass id to chardev_new
Message-ID: <c1f1458410d6baf76fac7b4c5cc878585da606b1.1616744509.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616744509.git.lukasstraub2@web.de>
References: <cover.1616744509.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jME3=8t/cYJO41nAuLhwJR6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:wgzPgc5fHJSuoXxxAYRfFfrBsWYGAUo6ceF/vpu5fA10ucmdGdx
 QM/xy58hzfTecIQaIcqJ9QEjRJfEa4MExpcmn6IoJdBoRU9Qsw4HrqJ4oepAALq/OfWD/ZD
 +V9SIF04Zq2uImX4BCx9P9ITjL27k/MxC1CG6H7tb1fjhQH//TOQpzpFg+7D+004QGlh+hy
 CxFS3ixANi1DEeBW8vkXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:87sKQuITj8w=:R5UUYHBMWf8pdG0G1uYwWT
 UL6WuORD7a9fT4wpOiI9T/tKVp5GYTg9x8Ou6+ktxWFaB9urSh9cNCxUBZcN7iF7Rr/e1baV5
 TFkGm7ebuX5E2yDm2UnMuZN7IeB++VoWHfAfc1jt5s3VlfBR2TVJG+YLN0kiROl8Fgww8CmgT
 naRkoYxf7/oATrJzeeI+UqiMrMfBPJz9OSQcHmQJEsfPrzmSWgYnxFCGg/ZaTmmcjD+5B2YgV
 SC90lypaqRCUgLgDPlywGZcCi9Mle6fcRgr3Jky/WdcwvfmSeEvqJmzFP839LpgcSlhj/7Q3o
 gG3ac9GAPFIXwNxbcJK6LXqfC9xlkfjNSeQ/JKDXMZe0V0lFUb+PoiFaJ2d9gZmlQxRYBs8rc
 P6bchzPjdFw+J+PV2i3K7neU/QkAHCux9oflQ8p+LnQNe9Eul7kunO/sgcJBOUCrMW4PTICYK
 YmDyCM/GFuDsEalE0OEr5xb+IccrX5PYFtoaCjvLMjDBljxi5De58/C33dhqjXZlnJr2P2OO8
 XsKd0jCfZ/Nx5nXH7mFGmnx5a/0NHs02cLrOSwbRN3NOVbD8ovT5DUan0J7mIEaGsFUqvaWp1
 Cl0ySkMP6N+CH6dspTEaHZSLQarp+1+WlGQ10BGoS9r4UupnD872jrX4Ed7SRRdUT88u8MRx3
 0XHmtldCL9olJsntuG9lkN5DgD7wsKclFwNKBYEcuo+7damofRGD/nINRB9CvlO9gsb7NlHA1
 tlPSO4COfA/cq70K5LhcBrILgoUDNZ/y7bDDYJpQhI3lqSu3v3/w0DDySbEHN0S/DY+Ty0kfc
 eD9rIOU3Ug0w9b6rDYDqkb/c5odvehHGq2BJ3/NPEhM/SIXvuoRO5EivvaeUIEQrvFAwnMgQu
 AJ1sAbCeKlxzs0/KwyfQxHYBHLzrPAqPYtoJIsglIpPwrxE5CacXk/QiDUCJF+VqVjuzQNB8X
 7WqdNTCZLr98APEMNoI1BWHeC0mmdrRUIhdys70hyyXeDAcQSsR73e/Dwe8FY9djqGFO3E+RW
 nXbyCHmq21Wu+x+4yVo15Gdfmk/BZllPMCySQaySDQ2LWqaAcJ96DHMynYoBrwvX9wyk38QJt
 4e93C74Ml7YmakHkbYX3qXHxCSWl8xnYgqr0lX7K/F39DMihX4iwcJ0SuxnWyL9v5wXLXtCCq
 Te6V0PK+n7SBNBPgDn8uVPpuPN/+SX7ECDrGXtQ+aWZ5CXFcV+bUGizCwnDJAACmA1CYI=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Marc-Andre Lureau <marcandre.lureau@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Li Zhang <zhlcindy@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/jME3=8t/cYJO41nAuLhwJR6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Always pass the id to chardev_new, since it is needed to register
the yank instance for the chardev. Also, after checking that
nothing calls chardev_new with id=3DNULL, assert() that id!=3DNULL.

This fixes a crash when using chardev-change to change a chardev
to chardev-socket, which attempts to register a yank instance.
This in turn tries to dereference the NULL-pointer.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Tested-by: Li Zhang <li.zhang@cloud.ionos.com>
---
 chardev/char.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 48f321b3e1..75993f903f 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -967,6 +967,7 @@ static Chardev *chardev_new(const char *id, const char =
*typename,
     bool be_opened =3D true;

     assert(g_str_has_prefix(typename, "chardev-"));
+    assert(id);

     obj =3D object_new(typename);
     chr =3D CHARDEV(obj);
@@ -1095,12 +1096,11 @@ ChardevReturn *qmp_chardev_change(const char *id, C=
hardevBackend *backend,
         return NULL;
     }

-    chr_new =3D chardev_new(NULL, object_class_get_name(OBJECT_CLASS(cc)),
+    chr_new =3D chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
                           backend, chr->gcontext, errp);
     if (!chr_new) {
         return NULL;
     }
-    chr_new->label =3D g_strdup(id);

     if (chr->be_open && !chr_new->be_open) {
         qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
--
2.30.2


--Sig_/jME3=8t/cYJO41nAuLhwJR6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBdkeAACgkQNasLKJxd
slgjQA//Q4o+vYl1OosRLhxwYH4oMPtzwxTUXS+iqsmIadcUe5lWAR18ZQeAHmcI
0thckZqfGhCyaL40k/YUCnN0vhAOEyFjKOVivtAvzr3uCQUKz+hcfRbrVGsesJth
FWZ59N0xU0tLZye5ZkLflsMBsdoYVyEeSoGDNgcmDy3TxZbfHZOdNOtQsW1pC7CO
K0MwXfc9borejevK5zKrDc5TesPcQdCEICyeqyVQe8J+vQz+mOZSbC/zZv5OEm74
ThgY+FxqDLZzOlDzumFKySPhxi2O1H7+9IsF4AJim4ob+fFTs4YgnWnyFKznyPhS
r5L3AKMplMoVIStfc7B1G8V6XiYBRI5VcFCd4jdn47+TrgD26HlmYwQNvVgBGBzh
xEV5yakdUYXuuXT+d0ouvRMp3vt42Pscvst+ZZXd2SU1DwHYX2Py7gmICnRyxa3K
MUstQmEdbZy7WVpoxarHHuy1m0VMpeBWNjGZQ5EPDMkslrD5k70RjH3wUK73vYRo
mRUl3VNaeQV28Ue8Ae/xY7s1BM6o5AtdOsKlUZ/8VXyINxMOjN+pqsRokFxf8tH1
nbfFhE80RaD6thmYnmuA1JqXe5Sjx3ZOlk5JSyebYStWhSWv3sP1fMhjoQH0qKZK
k79nzkNItmwnczvsh5MKX8mRt2SqzGor5bpLFuEcS2CibNm40ew=
=xhet
-----END PGP SIGNATURE-----

--Sig_/jME3=8t/cYJO41nAuLhwJR6--

