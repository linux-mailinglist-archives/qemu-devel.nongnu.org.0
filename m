Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF3C2B34A2
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 12:38:13 +0100 (CET)
Received: from localhost ([::1]:52332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keGMF-0006Ms-Nf
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 06:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keGKJ-0004mJ-ID; Sun, 15 Nov 2020 06:36:11 -0500
Received: from mout.web.de ([212.227.15.14]:46929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keGKE-0008Bb-6S; Sun, 15 Nov 2020 06:36:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1605440158;
 bh=WU7vXiXsNaEoASVoixY3jX05iB8nozm7ntvDdYEzG30=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=IPM4OCFqHq0z29gANaW+fNwX1EuNhm3dLDW9BZGT32de5vgByUQgIgRDK54OADYUa
 UkxRnLYaqh8bNav81NDzelvG1hwc4KNiOb9UVPeaKS+civ2MtxeKxSvK+iW5wgZINb
 gTNFsRv0o1K70vRb99FCwH+rwqPbTtRup42xVfPE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([87.123.206.172]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MQxnv-1kstK52juZ-00NxAV; Sun, 15
 Nov 2020 12:35:58 +0100
Date: Sun, 15 Nov 2020 12:35:41 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v11 0/7] Introduce 'yank' oob qmp command to recover from
 hanging qemu
Message-ID: <cover.1605439674.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vf0i3dPQNdH_zvpfC_0mT/+";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Provags-ID: V03:K1:UbW8mTwM72jtIyTr6EuJ/4O5+aqWi80tU9RSTy1MaZUIxPAr8mA
 isHUCGrXh9rJKqiYeAjV6RQXsSxePV1HlPJbRp74JWYAX4REEJGeztdLFBRed1/6OwIOdS8
 vfco/NPlaCTUHaOegM74rU+milbbU7yXcXpDHw6luvK5Vuqj8teb2WV5wAFz8zhVBuM9tJh
 LbGOhQUZCHRgrHZcaU49Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1rwguyNybUI=:Z8iVj5UQTnwyYCgWSghul5
 c01rU1OP5n75Uak8T1pr+V1hOX7OmuDmYX9x3XfzpCs0e+Qa5pryyroR4v0iTKQNxgTDtg+DS
 Ynjc+fwywKfxRiAixz940C23Eki4RnYlpOCuiWGuSB755mhwSOs6XK1iA8As5utIQxi3dV5Nt
 svZ16cU0F6E6DLaVXh/vBrMJsGvIXvhMQKSRIua8oHHM9CJ7v+afQaVQJx6k22drZRGI+G60h
 29CQQotOnxRlL2JNyijs5O8OZZuyI6fQqZXNOjHB97i+m9ex+70M+oIX+WxoHxpCx62ZVMJmN
 /qvxFO/JGdwQGD0cJGhLNWLa3RkQs2pHHamYu7pbRWPehAZJtvwrXioS36oSMyRP2ZbFGZiyp
 IaQPdXYZ7ItDV+c1vLb4Z87InVSVJbzR+2q8ZatjzUKn3rwF3HmS50QzfU9xzobrkUgrU6yvU
 UKRTW8gf/9Ccfa+F3k3nb6TlTNMm6U6M5xanpJlR2ZPtsq+b3CfTFy/mWdSpX/qzz5caOyN/o
 oL2oUejqtEXNugDf1lV+Sr2mi/mfDqhynyIMOCcBEktfp/a/KWXogWtdZZyBh9LMjWyQdG970
 Pa7ntYh3uqg6J4UuYvXGBpbudazLgnSsY2gWOb6zKlPkGmo2raZ5ZJxcMxrmVdnEIuqTtQaUk
 XjbeKBQtMINgGofW5uGEsRtOCDqiQpXx9ECJb9p5rT2FDPzcpwoYKFxCIgp4gAvHZRDT1Unp2
 /Z0mnbRLYPdhCRlkyKY0wHEgoppYMQtGnleQFItQBo7ocjYg4bQPnWm9eReExq2EwsvseQo60
 PheVrQBBl2omhfDfHNVgc2x+6RxYJk8aUpHtoEtYtFwivOAaHWWHyj1ETaYyzLMnQqrAHcUFy
 SUyRlRRWoIj0N91nRvPw==
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 06:36:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRy?= =?UTF-8?B?w6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/vf0i3dPQNdH_zvpfC_0mT/+
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Hello Everyone,
So here is v11.
@Eric Blake and @Marc-Andr=C3=A9 Lureau: We still need ACKs for NBD and cha=
rdev.

Changes:

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
 block/nbd.c                   | 154 ++++++++++++++----------
 chardev/char-socket.c         |  35 ++++++
 include/io/channel.h          |   5 +-
 include/qemu/yank.h           |  95 +++++++++++++++
 io/channel-tls.c              |   6 +-
 migration/channel.c           |  13 ++
 migration/migration.c         |  25 ++++
 migration/multifd.c           |  10 ++
 migration/qemu-file-channel.c |   7 ++
 migration/savevm.c            |   6 +
 qapi/meson.build              |   1 +
 qapi/qapi-schema.json         |   1 +
 qapi/yank.json                | 119 +++++++++++++++++++
 tests/test-char.c             |   1 +
 util/meson.build              |   1 +
 util/yank.c                   | 216 ++++++++++++++++++++++++++++++++++
 17 files changed, 638 insertions(+), 64 deletions(-)
 create mode 100644 include/qemu/yank.h
 create mode 100644 qapi/yank.json
 create mode 100644 util/yank.c

--
2.20.1

--Sig_/vf0i3dPQNdH_zvpfC_0mT/+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl+xEo0ACgkQNasLKJxd
slhQyxAAvJc80yrAHIb/CWoZb+DLqNmhjfBJ9dyr6WhQxJhqSgS6pgZEK8i51ObT
91danaCZ69zkeNtE1w5ghIF5pQn2mgRJnemRjc6O0T94208YgBMmY3HzNeO2hlDz
9O/KEyO7xNvSQ4I2ld0jkHBekfX+QoSnNleWltt6ZeW1WxeyBjZxHyuaOuwPlzkb
DJigcMhniXr/0aoGnK8df/H560Ov4HNLe1fuf12wBPoJrAoA2vHr4FUfDvC5f/EK
LMzppB9F14aRvaE6TQ9OQ7pQKA3Fvxrhs/hFioCL/2jFaxjxv8w1EsNZDiCgW0N1
TOAZl4Mp+ZYL9pECwj/ojvrkPvcM7zw48GLfb0UAm9qXn1kON+DA8CpZKSZj20Uv
4vqfJZKObYUfo8ifmKzNdgpShqmW8Comh+NYahnQurCRzd/ZQf3dAUFadRHK7WXF
rdSprEEAliTVtoH2yRhe4VzPGfh6KAvtxGS6pGQWyCqrShb5J6f8CfixS7IEo8p4
QwIyJL4HgANo78FGjz6n2agEH2ZghoqxRqWcfpSwMBREGaaXeWkHc1+Ru6Zy5CKj
V41ctcBN65wqkV+p1upv97b+qq+6fQfZy3abYDaEm0PZACIbo2pl5/mIihCGBC7w
/vbL8PQV6iMOOP7NPmeVbr1HMQbYzct2OC+s0Hz9xOuxBJhV4do=
=ypuQ
-----END PGP SIGNATURE-----

--Sig_/vf0i3dPQNdH_zvpfC_0mT/+--

