Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEB334D54F
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 18:43:45 +0200 (CEST)
Received: from localhost ([::1]:36438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQuzQ-0005N6-Tf
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 12:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQuuZ-0001iN-Lc
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:38:43 -0400
Received: from mout.web.de ([212.227.17.12]:44923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lQuuY-0007gl-1y
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:38:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1617035920;
 bh=DaF2NOoBN6091aRooKcdtu/fsO6pM2kOqB+A/5S7bc4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=OY1laVxPVZhVXTZ4Mz37zzw7NXHFQUqeCcQhaQtI2oKRaB7K4Jnu4PV108ipqO7DF
 2UQTQjHL8lWUzAAsOAPXr7vke4UWP/mYkXyo18U8U0G8bezIovle6LSq1Sbk8Sdt1T
 2w++MlXwU41++mb/LF5YUeskK1ed+a2eHPx4wVlw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.225]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MQNiS-1l3w153rZs-00Tjxh; Mon, 29
 Mar 2021 18:38:39 +0200
Date: Mon, 29 Mar 2021 18:38:38 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v6 2/4] chardev/char.c: Always pass id to chardev_new
Message-ID: <3e669b6c160aa7278e37c4d95e0445574f96c7b7.1617035720.git.lukasstraub2@web.de>
In-Reply-To: <cover.1617035720.git.lukasstraub2@web.de>
References: <cover.1617035720.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WlOxd7TeybMYRamigViIizM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:EyVERWDMlpwY3pB07coF1luz5pkvptbp+PZAUpxBcPpy83VWDgy
 zW5bTnQYNN7b2Y5xCjxMCUhuegwkeDp39Z789xbzJDHR0kgkrEV2XVcszMXXYNY6V/RmvOS
 MV82TqDexEV1hzZaNlVq8ZanqikHCHT0WWQz38H6HaY4E+S9yt+4iX1Zc7rrMqsI/gMG77/
 22XeFFjiDGO6j76BaFb6g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jb8YVuJMxXk=:j2USg3IudkBmWNqoLW5nac
 7HlAx066s/R3XUNasrnPO9wnM+kE5XQkSJHYV01NqFogzg1bPfXplAcfeuIrXLRPVeuSSx0bP
 iQqsXy6d6WZIUoJGe/+nh3WbOVza2ypS9Ba13Ah4q4aR3mDnU4jETCVeKdYxdmyxsa+jPX9oU
 1jtM3OrZM7jVlZ+FnFxfAvgLgKEJW3wlye57UlHO9hN4+DhCQcKGTZwhHqxKb6hL8pB0uIOR5
 euotmcsMzt7OavCfqzUKh89S8AeLAFVoznkE7EnPArbRL/RdjuWqZWXK1vf6l4Tks03T2kOCj
 inKK7oZctIFa/t8o3dUV5fZ0ePwaAy26or3OXS/YdGP1ynjXyfPg4uQs0mCc5LOP+a4Fwm9UB
 TLY8xS5fmfY11fMX/pzSyj8IneLTNlW3gAMu2dN1jhzK33IlkQr6UjFD3dlraCCwdsqD+/gpA
 Bfg3mvbbciHNiJfXoc5QfBBJvRkGGJ84TvAI+yoH21R8RVr20hywYMPcf3o/mkphEhBN079J9
 iiux0v0fU0NfzGa2BNxei83ZG5y/nGdYzcWNrbkMCry3lQZCya53jovJWzl4v6HceRqhc3KNk
 DdAiAixvbUFbQeco3h5IdEHMOMRFK/wHHFT45tTz/4kqxdfnW4ycS81Z4ELMpBZ+pr8b9nuer
 wliHkH8Mpg7V/R16GarFhdLo1VrQRS9QfmZxKiBtySBtt/SfMyYFb7p3jF1WAh3VrA2VTHT8s
 wLiFpnW00J73gs126uf04lWQE2SynwX0Ty8lUwZiAhqCNzqsd93bQ+89lI5WgQ9OXEVq6JlLN
 fFSJa617qGLx1DCyC1vf0mqRVDIVoavlWr6ZpkyxMutHClIxvkRbLif6k2I/ImuIV65HxQ1nB
 YW3BW71/e0om9e+sBUqGNPd0IQIbzLrZLcJyhCHpzgBahPr3QurwRt0xgDzD+I33b6G4dsVKU
 NB80+5YgLgBvk1RGtISVfYJ3uxN0uwblSQnpzlrulbAll9ssRK+Rj28Y/9EzpOkxaDNIdNfe+
 swA64rKGovCjuPriAWldlpBnm4oNZ4vvdxqemm8yiOU20y+PRffBc2KVYsS1f3RMty3EahUGw
 okgDZ4BVwmVKbdtSuiE6PkPXKD3OiBGGtK84UUqbfbdi0MHlHiOS6wwXu3BgK5JzQT6zRZskI
 3HEj6bvLNV4UDYyNwFBDQ46lIOoLep+BEhBIRknvBSebeRlIMKrc56pxYRBQ+P1TAEVm8=
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
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
Cc: Marc-Andre Lureau <marcandre.lureau@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/WlOxd7TeybMYRamigViIizM
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


--Sig_/WlOxd7TeybMYRamigViIizM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBiAo4ACgkQNasLKJxd
slgHTA//UCb4g03zk8ptl9tRaczN9IuhlNTGRR+3KQQdQ0tycMX8w2PhCefAuWJ3
qxm8wn/FBhBJWBYhqSXuFJu6x0vL/USP7tJ8WyqxlG8krtqiyXG19HOFf+pLdTXa
A1kfNFtuB3Y9S0pjZoWm4rCIkIOuUW4deSzUhOUgDaRS5ALtUmxqu6LZolHekNvX
N+K49gsfgKlBIIiXRNQk1kBuLp182QuaKoucZL8XJ9yTSsW2o/GnPBcmmzSvdthh
snN60ftmDp0zc28N/eXQX93L1sw0I/cOcGo9bjOQlvun7L+pQ0JIIt+eOqGI7tzu
iiCPLjoDPBTw0dPXx389zlrJeQ0YfzYSNX4LNzDImZ4Jgc7vY/ko3Bz6r9q6q9y7
KBg/s/kb1WlMB4vXaE41B645X38WLIy5wp1xPGnlC8Lz+rGj1dPaHGYP9kdpJ330
oqBxZtZ11OfFGrKTIeGlf2gw5dj9O+mQZdL9UeaoaxIru88xiy2Y2PfTf7303XG5
8rfe2MMmg1ZMvsf3bZp18IEcdWGwE+gLXZJTxJNOplGwgPqsdkNSWg/+yy65w/Nw
R3nzdha8MvY87r8TG8Au1vCKV6JIlQUfmwgjcZ08lRHIBU4z6GEmEeX6CDbNbS3a
7OvoCb6OopVl6AhG6AZqpm05tDefDL29yVfvnYybySStc3/fBLs=
=b2Lu
-----END PGP SIGNATURE-----

--Sig_/WlOxd7TeybMYRamigViIizM--

