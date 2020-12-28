Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E802E40ED
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 16:01:38 +0100 (CET)
Received: from localhost ([::1]:57082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktu1e-00042r-0u
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 10:01:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1kttyq-0002SE-9s; Mon, 28 Dec 2020 09:58:40 -0500
Received: from mout.web.de ([212.227.15.4]:50653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1kttyo-0006RY-8M; Mon, 28 Dec 2020 09:58:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1609167512;
 bh=466+q48hDaQZDo9a1KN15mfyI8EsaHW1PIwMSrcAojo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=ez7dLT9nWY+x7XLdyriiSu4Pp21mDVL3BQOubk1J5XqbHVXb6fW1YOXRygb2Tr+Km
 Gjck0h5Srx2mtDRjDZCNXpTrO+sZIJLHlSHAjtj8Kft1us6Z5Fo5L1tMGtVQEh92Z0
 QrMysxrQMDxxh+WfHYZ5NTfgitoOZch94+T4WlyU=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.94]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MK52w-1kbhAf3rZO-00Luju; Mon, 28
 Dec 2020 15:58:32 +0100
Date: Mon, 28 Dec 2020 15:58:21 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v13 0/7] Introduce 'yank' oob qmp command to recover from
 hanging qemu
Message-ID: <cover.1609166587.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/73is318jYPcWkXkqmsBk1RK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:IZDpoLqjycGa2Vp2N6tPcMHiemrcGBzVKngsv5GXW1otyVlrhr5
 yLzAT84+rKXt2VnYIEJBZ/AjUEnlw08s60OhzI72HOfOTR3/usVMRKlPuv5kuTGiYaPJaNR
 qhb5Z/pOfPo5f06vU/vfzHakIDCsDSiLGsRx5naRwmi9gk2qEVs8j+Uu65/lPuDIcP90jnc
 FI7R/wghFiby2XCQKSb5w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5hrpdfyJ6rA=:7dryWqde1Io6VXEgjWHKpA
 hMltaEzfqBcDOQOomrTzheGUMM2bvoUjBhWm3JCnNs8B3FvM4Hlx/7ApmsYoMzFwNQz9iH/Fy
 xlLJVAhA0l5nICstGUShrOQs4UXzaka5iQOK9a0O01vcC3mkZj2QjEeVU0XfEhu/dqWC4U40y
 WpkCDlyG4/Pla/U979aRSt0cz60//hqWWRGrs15rc5sdEXiFMOIoJmTc+jaM58wG3c+8Rodcu
 biy1J9uF+muom80801+0pPwr3AOi5YfvWxKIKjz/hiq4PU3yxIluoO9jWzXpy0+IfHUjQl5AP
 Qv158F1bwsH9fKD8E6Ym6Zs2e0IXbR3s+ivthNGMD3FNNjGlckRlB//vGYohGHuAZ464LVKoa
 bUM61za1VzDhQ6aQemugX/onr+MSEpkCrUuLFvsKN1wcFR6M+uO2A7m1dAS/MUAD7lJMrJR09
 CLeyp9xWn/KPy9rsvyDdMRSc7VgXVkSCjswrP0WrkbHpkI0/CnqwK+VZ9rumPAwXwxsgxmWbK
 1TO+LysUEoAxZ/jofc332widMSqTxh7NCY/ItVDrWlcb9//VKRxXpH81AAr1WKjA1idKRq8Db
 1Kugq6wwRm4Gwtz9gr2Xr0FcONyJ9v4xeebORyxB4R07sYn0/naIQHKqg87oA8QoiY8Jlo6Sl
 ywztqg/jr5XUI0KYVPBKepL4gZlvRtDPYrHjWF4Np8gMEz7BjvAGgQHF4DfKbjvGWYI2+dctD
 zho0omk7lqCp2F8snuFRjU9STy0SUOtytT2jR5XwQUU+rQvPG17VTbM1pBswTqAEb5YvXrLc7
 k8+NJ0vp4y0oJpL1VAPLfkN84xVjYkz4t8Jq/g+I3A06Ttc/D28rheuYqhL9ff0OV26ru8zog
 PIysemK9TevBeoJpfv63sw8wKaL2rasx430k+ki8k=
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=
 =?UTF-8?B?XA==?=" <berrange@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr.
 David Alan  Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/73is318jYPcWkXkqmsBk1RK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Hello Everyone,
So here is v13.

Changes:

v13:
 -Address Marc-Andr=C3=A9 Lureau comments:
  -make yank_register_instance return bool
  -rename yank_compare_instances to yank_instance_equal
  -remove breaks
  -use g_str_equal instead of strcmp
  -use g_new0 instead of g_slice_new
  -use QEMU_LOCK_GUARD instead of qemu_mutex_lock/unlock

v12:
 -rebase onto master
  -minor change to migration (removal of "defer" branch in qemu_start_incom=
ing_migration)
 -add Reviewed-by tags

v11:
 -squashed MAINTAINERS update into patch 1
 -move qmp doc of yank before misc
 -add title for qmp docs
 -change "Since:" to 6.0
 -add Reviewed-by tags

v10:
 -moved from qapi/misc.json to qapi/yank.json
 -rename 'blockdev' -> 'block-node'
 -document difference betwen migration yank instance and migrate_cancel
 -better document return values of yank command
 -better document yank_lock
 -minor style and spelling fixes

v9:
 -rebase onto master
 -implemented new qmp api as proposed by Markus

v8:
 -add Reviewed-by and Acked-by tags
 -rebase onto master
  -minor change to migration
  -convert to meson
 -change "Since:" to 5.2
 -varios code style fixes (Markus Armbruster)
 -point to oob restrictions in comment to yank_register_function
  (Markus Armbruster)
 -improve qmp documentation (Markus Armbruster)
 -document oob suitability of qio_channel and io_shutdown (Markus Armbruste=
r)

v7:
 -yank_register_instance now returns error via Error **errp instead of abor=
ting
 -dropped "chardev/char.c: Check for duplicate id before  creating chardev"

v6:
 -add Reviewed-by and Acked-by tags
 -rebase on master
 -lots of changes in nbd due to rebase
 -only take maintainership of util/yank.c and include/qemu/yank.h (Daniel P=
. Berrang=C3=A9)
 -fix a crash discovered by the newly added chardev test
 -fix the test itself

v5:
 -move yank.c to util/
 -move yank.h to include/qemu/
 -add license to yank.h
 -use const char*
 -nbd: use atomic_store_release and atomic_load_aqcuire
 -io-channel: ensure thread-safety and document it
 -add myself as maintainer for yank

v4:
 -fix build errors...

v3:
 -don't touch softmmu/vl.c, use __contructor__ attribute instead (Paolo Bon=
zini)
 -fix build errors
 -rewrite migration patch so it actually passes all tests

v2:
 -don't touch io/ code anymore
 -always register yank functions
 -'yank' now takes a list of instances to yank
 -'query-yank' returns a list of yankable instances

Overview:
Hello Everyone,
In many cases, if qemu has a network connection (qmp, migration, chardev, e=
tc.)
to some other server and that server dies or hangs, qemu hangs too.
These patches introduce the new 'yank' out-of-band qmp command to recover f=
rom
these kinds of hangs. The different subsystems register callbacks which get
executed with the yank command. For example the callback can shutdown() a
socket. This is intended for the colo use-case, but it can be used for other
things too of course.

Regards,
Lukas Straub


Lukas Straub (7):
  Introduce yank feature
  block/nbd.c: Add yank feature
  chardev/char-socket.c: Add yank feature
  migration: Add yank feature
  io/channel-tls.c: make qio_channel_tls_shutdown thread-safe
  io: Document qmp oob suitability of qio_channel_shutdown and
    io_shutdown
  tests/test-char.c: Wait for the chardev to connect in
    char_socket_client_dupid_test

 MAINTAINERS                   |   7 ++
 block/nbd.c                   | 153 +++++++++++++++----------
 chardev/char-socket.c         |  34 ++++++
 include/io/channel.h          |   5 +-
 include/qemu/yank.h           |  97 ++++++++++++++++
 io/channel-tls.c              |   6 +-
 migration/channel.c           |  13 +++
 migration/migration.c         |  22 ++++
 migration/multifd.c           |  10 ++
 migration/qemu-file-channel.c |   7 ++
 migration/savevm.c            |   5 +
 qapi/meson.build              |   1 +
 qapi/qapi-schema.json         |   1 +
 qapi/yank.json                | 119 ++++++++++++++++++++
 tests/test-char.c             |   1 +
 util/meson.build              |   1 +
 util/yank.c                   | 206 ++++++++++++++++++++++++++++++++++
 17 files changed, 624 insertions(+), 64 deletions(-)
 create mode 100644 include/qemu/yank.h
 create mode 100644 qapi/yank.json
 create mode 100644 util/yank.c

--
2.29.2

--Sig_/73is318jYPcWkXkqmsBk1RK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/p8o4ACgkQNasLKJxd
slgfzw/+O5bauq08JVzpmKjTbCstRCiW/FN2dkWu/HTBeNdCcWhY81KzGk8eecfn
PRLSxX302CXVUyw17PLnns2r5DQxxwwW0wD2hI8zXglSMisS1KDNlci7rkZjl3Bg
QFaCX9TxGz2AxvkUvV/y/kd/ZXa25wO7iM2WsU52atpoaXuviq6AbuTZij5p7Qfx
nj+lyS0xK0XfuXLx6lW/LqE+6oBTjfbSkbSxJFUuL+G4LV+CuBcPSft+VzKfIgu+
CvuDJsekpFVt2vTN9f5sLkPy8hywEeHpcAHOmrZyBHnvbifNInOOZUtpijw51ky+
AzyDDL9FViTO10TXindKzSQInCgZycU8ExwwPcLpAbrpb/woKJ8lVUmWkY0kHDiO
kQpA9BzHKLHyPzpmPnj+joH5HdZp0kub7Hh+MrG0HljtKWIV9REL2NOulWqy37O0
yv/3jpQC8XC4dy24RLCZdKrVHWDyV6lNcnH3KBr8g7hbja1L1F2ubTwdcr5TBxZF
G8Cmaswxo3a9BUMI/yvtftwiPP1g/dgXvJAuFrIdCaRzz4+R/JiTbXnpiyip9RV1
1JIi/TPSyW+DT/akQLc/MRsG4iwJPKugYu0x0H4KUC1OqQ68F0qJuUCMxa60QKJt
eao2hLRSXNpnIRjeZn3UyeeMedp4YU23i9Pd8qdPU4ZwXp1tqCo=
=phNj
-----END PGP SIGNATURE-----

--Sig_/73is318jYPcWkXkqmsBk1RK--

