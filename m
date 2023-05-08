Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD8D6FB6A1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 21:12:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw6G8-0007Cn-Ex; Mon, 08 May 2023 15:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pw6G4-0007Bd-Kx
 for qemu-devel@nongnu.org; Mon, 08 May 2023 15:10:53 -0400
Received: from mout.web.de ([212.227.15.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pw6G2-0003tI-1j
 for qemu-devel@nongnu.org; Mon, 08 May 2023 15:10:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1683573045; i=lukasstraub2@web.de;
 bh=+Wn68/KPN/EUUhla/8CuQiOdukauPw5X93BWyVvrAGQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=YGyKn8RKEehUsQtE2qYyKiXom0kvaB/8Y8lEYxLyGAzTngV7dP94KNMyVMAQZ41sz
 WLzHbgLFSGQk7Gb79/tA5XgSveq/h5DhB4ewea1ZYnLR3qWbq+BXNSR1ddmANiv8Zh
 KLQALNfeYb2d4n3Ikud+c7CLuq5Dg3UjMbRXtabUwepy+H+fqowsGN4+Ba2cQG/gB+
 938gJsfyafhS/v3EmFuPnvuOGWTrg367v0QrpzFjtnC1Yn5wZGtpX+ivCb5nIt8MqZ
 eDNAkpTWe7nNsnb2+YqzXCSR9pUVW5UFz8k+WYzNR/APitrc7yrlaTDFFm5reW5U9B
 DlTFRbhCnlLdg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.98]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M3V26-1pweUI3ics-000aVZ; Mon, 08
 May 2023 21:10:44 +0200
Date: Mon, 8 May 2023 21:10:34 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v2 0/6] multifd: Add colo support
Message-ID: <cover.1683572883.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TTi/xL2ruQ4OmjjsdgYZvxV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:KOr3IyYTBxs8MnP2GfzOhH8AEeeJqB3xLEh9Dmyq+z0bt/ch7Qf
 1U+/8g8IK8tj98LLctRi/C1rqCkhIqk+S1t15uXV2eQbhiNHJ0vKOhKZrsyXi54v4VmFL9n
 MrhScXeHDLJ0OQXFtUAoiyFXiyPFZ8L9E7qEnJQ+HDY3raeROxiBK20Xn+ypQvi2mr2RRyt
 8Iul0VIGcaPz3g8F2Mtqw==
UI-OutboundReport: notjunk:1;M01:P0:0JKgbeQPgg8=;+RVuP3Ch5o/E/a9SMAEKs3G8xgM
 Zir4dMrF50qS5oRO+Bjaktemw2rMZGab7mvEI0LVykBNVtbxAbL53uloifXtEK88io6NDTMSu
 5rLwChWs1ivDcHdXgkuYZhliAU6BxZE5PPbyaotBpruXrJnIl2MM0+P8n1J6rAjcfwyzIawmv
 lozMsrX8hlBlLxsaRhCwS/xPoULKKvIxkwLGOwQQ0JeCCYnplkxYvj2fZ3xoekYckDLEWXOdH
 zuzvy+1grX/bKr5DdwLqHKwf4OxviJLiNgcZqQebmpc0CLono+kbm8AI5obtkrU92KhrnoQmx
 3xyEAwQUn/X1Icmxcroqgp0f2ekBFuxsfm4eqcebAATNa5FqBlL2zJkA1LOVnxs0YHcyk+zhG
 ENYYYJTqZTwkjjH7t7HvFqkL+COhicwPyJw6LE69Fu9A8uy0xmnVTyN2pFAS1bPWDGOWQxHI9
 P68s19iKx5ttmlW+ziD0UpTcKsAEFEUlv+QuWY7qEQcthCA5Jtm5uMKZESZL6Uu5XveQxgle7
 iI4f6X3Y0khp8VaalXAuce9xeoz0XaoqM3eCz+f3d9G1egoxm39sUM4QOXqtdkB8v2v4v57k/
 Ipf/cJU+PVuQaxrosCdB03PrAuw6d6XHa7KFNhdwGYsyjoFzW2CRy3fimqGi7kRxubHfOmolp
 AusRPoCp0wACH9N0wWc0D4ohuggYXQzqPR9VX4j80tK/HlrFCevGaTk3ZCJmShDet1sYdIc8p
 8kKkkeHEJ++z4J02yAGV6uv7QI1H5phpY9c6d2/EZH9c8LN6yIXdxTCqgCkKgYffLTpnMT1mu
 P2Vc8vrjx8l4HfYwGxsc6GslB6cSrIVWV403E4r0JulZTzuP5HKcfA1puIfme3S0XYaRSK4Dr
 rxv3LrbK3xnj+g9VI9wy3Fs4U65GMblmSGIUVIQGhsnjCHN7bwuFrO1Yw/ThiHFM2XfqP4Chj
 0qhD6XKEGPD1L3VQtc+mkWqg3ug=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--Sig_/TTi/xL2ruQ4OmjjsdgYZvxV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello Everyone,
These patches add support for colo to multifd.

-v2:
 - Split out addition of p->block=20
 - Add more comments

Lukas Straub (6):
  ram: Add public helper to set colo bitmap
  ram: Let colo_flush_ram_cache take the bitmap_mutex
  multifd: Introduce multifd-internal.h
  multifd: Introduce a overridable revc_pages method
  multifd: Add the ramblock to MultiFDRecvParams
  multifd: Add colo support

 migration/meson.build        |  1 +
 migration/multifd-colo.c     | 67 ++++++++++++++++++++++++++++++++
 migration/multifd-internal.h | 39 +++++++++++++++++++
 migration/multifd.c          | 74 +++++++++++++++++++++++-------------
 migration/multifd.h          |  2 +
 migration/ram.c              | 19 +++++++--
 migration/ram.h              |  1 +
 7 files changed, 173 insertions(+), 30 deletions(-)
 create mode 100644 migration/multifd-colo.c
 create mode 100644 migration/multifd-internal.h

--=20
2.39.2

--Sig_/TTi/xL2ruQ4OmjjsdgYZvxV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRZSSoACgkQNasLKJxd
slg2yhAAiTEBOM2FifJ3bihn6F7RXrWrdkYDtkiVOp70X07GXks8ygkJwWc9jWbW
3ruq5cPsZFI9EsRgyDh382BqJF9nOxPYZ+K7C+wIC+W/p1oeP6VWKP4AehK1Xk3E
2gVi7zQg/Um7LEYtktG7GxPVUPcC0die9V4gNrxCRWJGI8s3Pv8Jf/hTR7wNjcSj
JoZXlgsxgS+Ib2nAcZ4hjOAWqCvP271V7A6q61E7KQ/XIjbEZhp523FB7gUfojup
aRtfDTKMYtQyM6czYg6iuc1q/3qw+JPsyKCBwtTR7XpKO/1fBrAr5WQTvTf+OEza
Xs9ABsg+/fIgz6JurqVdCMNST8M30QX+RPkOPR+qpxgICZWAMHMg6UmQWeEmH0z8
KYWHzBWloUJR+NHpSpPikp9AaYV8rUdoVI0PpcZQRI2m3PUrPif+4VRRZvir8gnW
ktoo2P8rrx8cKd+FEF2OlBUwbZEDzDl1HDTaziti6PxY7+HDzQ3oAZlTVlClI4SM
CsFO59u5WrVqBLtm65g7twCG/1w2xzZyn0qiBz8mQomPdctDs3QINCQIhLrKq6XG
7YmmETf9jxfDM36YxOWCXqbM6lRd8t8kGC1L6C6+LZd5YV6U6KqXzfaRuKBnAviz
snjskbnKXkWsPCShjj0VJFdNrlC/Nghc9DP5N8oZuujcrRBF7gA=
=u60Z
-----END PGP SIGNATURE-----

--Sig_/TTi/xL2ruQ4OmjjsdgYZvxV--

