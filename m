Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185E434F0B4
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 20:17:19 +0200 (CEST)
Received: from localhost ([::1]:35940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRIvW-0005Kn-4r
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 14:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lRIrt-00042e-IW
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 14:13:35 -0400
Received: from mout.web.de ([212.227.15.3]:60301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lRIrm-0001p4-JN
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 14:13:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1617128002;
 bh=EUPgJCxrDXxKmUc+HMBoeCNIHEmMRzppEH7qmH7oHbc=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=ZMEkjYxSOF9XEmO088oE93e7oTVs+p6HOpx83FtibKfJFy2TiICZyosCzyVl9W7+2
 vBHr6uIQKTM8vuhr1/dnwOhFgfb5XyKG1ecGekGS4Ey5dPjZ8St7fFO/Dp78Nrdd/L
 Ke9Zd0F98WkSC7poWfV4As6pSCLCDWBOjyTUyHM4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.86]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MbQLE-1lAjv42z5g-00IlMY; Tue, 30
 Mar 2021 20:13:22 +0200
Date: Tue, 30 Mar 2021 20:13:13 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v8 0/4] yank: Add chardev tests and fixes
Message-ID: <cover.1617127849.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/10+P4Vcx1cSvJk8wVt8JNin";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:BEwKGgB5zaUJ35QBHuUQqcSJTbVAufxgWUKkiwM7SDD6ZYq5fVI
 ru1cgQw0hyYvONZ8dcYMK70Iii220GPSqKm3vlFIH2Evzihbr46/0cF3NL/4cpyMaxooKdl
 wZq6b7Y3rmSPecnNQKqU2/aZ0luMwnamGvpaqy/WKkT55W93gDAV3CUfrWEhHmvdjyFXlz5
 ZNcq+iYI7XR0XPdM+cyYg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vzdZYNQuUx8=:SCyYLknpjwjyiwVpsPc9Ux
 +KhmRjc6+w1L9KqjpfV5Zs/G0Y5gUJ+yJvyCXiZqAO6bzjSe3wcFcknDZFqwO2T3NVXnStdBH
 znjijXH8tbdGmWz5hccS3zUrZOuN6WNDVE6dlJsfiGtz00+PWlMBlUNaw04FZ5cPW3LkR9ZvT
 G+sRGkVXLZudDghu+bTr7YiqjO4AZjR4HIMopEAqqw3Fxlj+tyFvkzkxgC669RpyYrT+aQ01z
 3W8045K5rFrjuFmzbh7dF6G3Myl8B8jo//tkF+VupujoUUbyVQArO3coQI+jAm9YvDeKA9G50
 7+DSYlIch+EJs/YH22WsYyPCNUhojI6s6SYpYfPlTxifuOEjDuefyrml9J6Dvh/6Piz3+PUVC
 GOLO3+pyM80vVt0SqAmB2VKG22w6YlpLTjtntWlm7GQmGlSL/JJ1hZmraOGPpbCFgn+Aaf8yl
 +dehbnnN7SEKrNb43A+xZP7GnbMEXyhy9yGiK2tRL/fady4Z4OWdwLpKaWeyYCfxX1xlP6aif
 dMxPnmhX7h/v2lZWLcqFCocU0rfekj+cd95MN3V2wu+QDoE4sMviTJdng37vwMFcJfkxmZZMo
 WJETmU+Ei1kpYzJC4ucYchYSBGlt7WJ9bq9OSrTIZqvf8yWFTAcI+TucMVSyzfVRQXDnGgcRX
 NzKpTaup3Z8W5cfcJOIKl3TsIqtjzh/M5urwXPL4GY5vomc4a4MoBKM9cmm4zy2HGw5+csg89
 qG1F/R2aD9clunRN7VJvLn2xx3bQUYzwfCsoNw1/j4okYLifIBY3Lv8hLaIe0DA0lJqhrTZBF
 qm3qZFPIiYy6lm3OYISFj6LX/JGWwzPhScxhpj8568Soznx0aQ6FmT9uiPXwzvmuENsCXfjFN
 HEvQQERu/3dUuiTefSUNs0EH5n3V+rzJV04UvO8fW8IwQon/6zix478GT7mgfup29inJlfN8/
 9C/5i7E6636P9qTX91rGu/TcJVFIPIWGFJmQwbh+DUqJMaWFv12J0BjfvY4CoiYnQRRQIPd8a
 Vo9SB4Vm8o9P5X6hyjYbcfTn6mfFxv+3WKU2PIS1ZCDbigKitw363MWMI/9uolEmKkyDm6WWj
 /t6SBEhrjV1ZwfGYt8Eg5XQiueIkWXsLa6tCAtHlHL580IIkRDZ/6rqP9CF3HPBSkHyi8NzpX
 z1ckRSOzP51FXZ2nOMe1ZnGebRlhhBV8QAPzBpZ78R2NC6qDvf9vR5F/pL52VqoV7OewA=
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
Cc: Marc-Andre Lureau <marcandre.lureau@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/10+P4Vcx1cSvJk8wVt8JNin
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello Everyone,
These patches increase test coverage for yank, add tests and fix bugs and
crashes in yank in combination with chardev-change.
Please Review.

Regards,
Lukas Straub

Changes:
-v8:
 -test: use custom thread to accept() instead of qio_net_listener

-v7:
 -test: fix patchew error by not using macros

-v6:
 -test: (hopefully) fix test on OSX by using qio_net_listener on the dummy
  server socket so new clients get accept()'ed properly

-v5:
 -test: fix memory leak

-v4:
 -test: fix CharChangeTestConfig structs on stack going out of scope
 -test: move after bugfixes

-v3:
 -Base on <cover.1616521341.git.lukasstraub2@web.de>
  ([PATCH 0/2] yank: Always link full yank code)
 -Drop patch 1 (tests: Use the normal yank code instead of stubs in relevan=
t tests)

-v2:
 -test: add license
 -test: factorize testcases to a single function
 -test: test chardev_change with initialization of new chardev failing
 -fix chardev_change with initialization of new chardev failing
 -add reviewed-by and tested-by tags

Based-on: <cover.1616521341.git.lukasstraub2@web.de>
([PATCH 0/2] yank: Always link full yank code)


Lukas Straub (4):
  chardev/char.c: Move object_property_try_add_child out of chardev_new
  chardev/char.c: Always pass id to chardev_new
  chardev: Fix yank with the chardev-change case
  tests: Add tests for yank with the chardev-change case

 MAINTAINERS            |   1 +
 chardev/char-socket.c  |  20 +++-
 chardev/char.c         |  77 ++++++++-----
 include/chardev/char.h |   3 +
 tests/unit/meson.build |   3 +-
 tests/unit/test-yank.c | 249 +++++++++++++++++++++++++++++++++++++++++
 6 files changed, 324 insertions(+), 29 deletions(-)
 create mode 100644 tests/unit/test-yank.c

--
2.30.2

--Sig_/10+P4Vcx1cSvJk8wVt8JNin
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmBjajkACgkQNasLKJxd
slgGWw/+NAV2Zy2CHjR0fC52xnhbfqes8dXJSJxz3ehsT42+lt0lJfev5D/3+DsL
P6v5z5eEKA5jZFN8pqJ7nXfPMhvf82mhMx7n6YYHviBOIOmhOUHYNLHbxtDSBdm+
uVYIF+WjbtIlVZN7mJaPn+BITh4bs6clbeueFOG3Gt1FVkDJfxxzP2Ut7MelSKaV
WVOQizO7shXMeG2mpEU4uduIYRpooSKvStxxjYsjIvsfYNYLRgcfluq+0PC619jk
3yhM7jXHRAIbgNfOAebAP3q2gb299gH0/yG9NvCtfWBbS5Se0sUlU/odiVB4o5t0
p0P4Xi1ct34VZZkYw/HCT8O0ne80ynYwKZeOjF+g9uthXpFbyOUVAMOnThLutX1K
8SDxVrf4K5dN6QzLPiPnk+w3SlsicAlK3TPiFfbub1GVanimtDKVvHIVIC5CRadT
ngG8ZlA+ccx90yZebQaLM5YS6KuGYtNZa/hyLWWQdYq0jcVkkuM5bNG8wNicubWc
q4pQEaABY8yqemNBWgKK8/nhsGGtc1C2FZPCJVQ0syZYh6Qf7nvIk8yAphiZ5TBz
68qRkKk4NHGPyGnb30+yQgn6/rqAoc8clsjM7bphlhrR/6Nin6jVaXoYV0r9ir1l
UNJYdICAkWSYef4McGrSXTTJ3n0X1GGeQencnh1PFT7Q4vUgPu4=
=n+LU
-----END PGP SIGNATURE-----

--Sig_/10+P4Vcx1cSvJk8wVt8JNin--

