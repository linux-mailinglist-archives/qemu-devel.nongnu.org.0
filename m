Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494A534B184
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 22:49:13 +0100 (CET)
Received: from localhost ([::1]:52790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPuKO-0000WM-94
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 17:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPuFf-000586-4U
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 17:44:19 -0400
Received: from mout.web.de ([212.227.17.11]:36293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lPuFd-0003Fl-BD
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 17:44:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1616795053;
 bh=mMU7ttyWpWNIgXoGocoh++GYkCLuGe/gox6cW5iaGms=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=s/FvM3Hm6rOjcA148jCC4I4e/EQb7v6dY3+mksfh0ER01Rh/pCZBohleRcktKkAFX
 w0EUW0kW6eJ9pO9vOimPOFpCR9F6weU00yEVPQjhvSCiosrUIO0RVO+UX8ySLujjIo
 1sSUsgxhyWJCsIseQnA1uY4JhhfQcg7mN82tjleI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([89.247.255.242]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MCZtW-1lYByQ3bNK-009PIM; Fri, 26
 Mar 2021 22:44:12 +0100
Date: Fri, 26 Mar 2021 22:44:11 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v5 2/4] chardev/char.c: Always pass id to chardev_new
Message-ID: <3e669b6c160aa7278e37c4d95e0445574f96c7b7.1616794852.git.lukasstraub2@web.de>
In-Reply-To: <cover.1616794852.git.lukasstraub2@web.de>
References: <cover.1616794852.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zfmpSjlNvpzryp9ywA5eiCF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:H8CxK7YDPpNcQKNZwZ+Ig79mppbo7Cn66yN75MAKNvu2iK0H4BS
 KJ16XTWF9azgTSShj4VipbIOqzoGIcXNVBOThbh6wgXYAwOdHv+482SKtyd/wjdHULZY8qr
 EoeeLi3YvPUXy1dtp4IA8CrAd9sy+aU+hTwHN9T//dMCxC8gQJ+G603dV47muCmM4kT7YKZ
 lrH+N4FWg0orPu1BlYPKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:M6h28mq319s=:DAvGLPfDSvlAZSgLimY+Vb
 lNMDDBHWsRodLsN6hJg1H2UA+FnS/fR2NpJdRhsjvqUK86SHhRI4QByLBz8wETZ7Q9t82nl/I
 Axcghi8lvXblkdjPzarrMM3eAMPZj39EfQ/y1Uy6f9w4vuIGzBJZMsbNo9XWHsKC7aPVLdm3S
 H6cFOK1QW5knMz81U7wtESM+4rIN+iu5zm/eS4XBTrnvlFJFx+HEHtKnVRwTLL+pyaYRBBaVN
 nEmPguxC9GVQhEuHiuktq0TwpbrA3yO6lt1IzHjs6WfcY0BxU1BO3q/Se+bJKFH+AP086BSjr
 wQVvJUyhwzTBmvMUz4asbhPKmOev01TpBBk3VvCWVw7WLSUbsJ1IlhR/HknVE8uGePNjJRYxc
 LflsthdzGHCzf+UTs/+qnmy/hj9g2g9yaOyinKC1mLyJOKikoBeaUf7454kG4J1/RdVsFTWH7
 Lvqqimj2uxmAdwEp4D/zXZlQZNlikHIqxgYH4PrAtsrk/cVHwGK1WGruq4Us23ab8jXkMiMI/
 PoxorXpw+hVSBBFMhhAI/zaXv++82UO7bKf7W9lBe9Bj7IXN21IhjO/McxkVUga3688covNhO
 q/p8l3SoU8T+RZXB1jj/VcP0Be400Fs74k3zCQyZF4b0MIXVnL5ajT6kBEJopE+qPmpjkM3rn
 sSVQrWjFPK9FFXx/P5hdAimb3ZJRuybpxdceIPiMtfdII+i7d+ZRUuSCG1NJ8U8rx9D8x8WHW
 2QYFaicS//5iRkWG96bKo0Up2uJ6UGMB4CFT+7EmZ20ipcfMzHI6XEkqKreqXU3baAqj3onrv
 NKL0XLzph73BkeJ/sRsPzsDjfwzmZR01w8nzdfX+jYlp9/QTvrXHEsla5SfwFyIMkIsDyLajm
 WrfXnJHP4y6AnUPdvjBbCDTdFqcgmKf5ZzeAG58rF1aPMSbYlrQILXXm3v1Dbjw0usjMa3Xp8
 rolAmsyt93aBLpa34tgiAGjkYECNxbDNsOfgFAYjsXpmSQDT/BxcTiSY/Ohrd6LkHdstMq+7G
 uQfoZZ6WJ28hCC+0AHkU/QlqY2rVdBJ8vAcZazp/1YquNdwtKiEAWI/9nTmVMg1T3rymrbFuC
 I3CA4sM/HwAzDY4bn+18iyW32bTShbkxqSz0ytzRL48sVAnhgLW9bUjViqIRh7OU7qlDDY1aE
 kgHcOpORkL9sGFsatHWD+01LDedEYW+1suHGvqHpQjjcoBy4W8De0OGZT9FvANOWxib/4=
Received-SPF: pass client-ip=212.227.17.11; envelope-from=lukasstraub2@web.de;
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

--Sig_/zfmpSjlNvpzryp9ywA5eiCF
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


--Sig_/zfmpSjlNvpzryp9ywA5eiCF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBeVasACgkQNasLKJxd
sligvA/9H6VZNu92HIqG+yBNc9KmkcQK8nvduYS9H5bzAa5BC4n2ahM63Pt+JM5L
DwRs6/7/6S6WyQdC80Bue053Y8XUif3hg8xF7Ht9ygFOuP5SuNK2hRaEjTQvTL1o
LFK79pRt3h5bqK5sjLyg7xM51rprgLQooBl20c/87DnTcEYi3Yr9Wx73g5+7DNDD
G7peveFm/daMDWfNEOYOB4489xXKGxSlfnNvyOuTc3B91bbxRcn9B6B21ee3/FAE
/JgEfNzKDxOpv687zI0t7lBcnWo91hP/ZPZib8ZpCsvB1lS1nfbmJI3lH261UAIE
NRj1USjn6B/j0CjpIJZ2tomOAX2J9rwWLQyvPkmxSpb7cO/fuTy01lEt6ObbCjnf
PpNLDd7ll7pXDSY+4l/ex4vIggWovVn2BbATSuIXgm09IjgdA5mtLbmfRCDXv8zt
6C5IxTQW03XX3Ez69i5lTMwSluo00CdiaTthWTmE/kSN1N3mLNpCAOedML4d0GDx
EJ3j+ZwOWgLcKGM1p1EsvunaYhBdEyvUNqXzEQQwUmdaxnhgoYLpBL8qF21TSvbx
0hsXn86S5+iWAiP8E4f5sXa7MrM4MWsDX3VYu2Jiq85bVLwWFgxkj9s3F5mHXXUm
XSH14kZ01/5Qoz3DZTCpCx7P4Iaxyfc4CoRv7FLgShmXSkDHj1k=
=MNOo
-----END PGP SIGNATURE-----

--Sig_/zfmpSjlNvpzryp9ywA5eiCF--

