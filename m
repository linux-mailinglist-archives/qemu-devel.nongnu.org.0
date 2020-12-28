Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D62752E41CF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 16:14:43 +0100 (CET)
Received: from localhost ([::1]:59636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktuEM-00014b-TJ
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 10:14:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ktu8d-00041U-7Q; Mon, 28 Dec 2020 10:08:47 -0500
Received: from mout.web.de ([212.227.15.3]:53097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ktu8b-00017e-1P; Mon, 28 Dec 2020 10:08:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1609168119;
 bh=ohPKNr06lzv2cp+agPBxRAixWxLFxxGPZhNxuXnPRkE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=qt7lTbJ6Wiepxtnz0Cz2B6t/0Rg0LtZqkfEyE8p6gHWUp0BFYK15d5KBCbg4RqQgI
 00ytDoHCZ1XM+JBhgI4AiUMB3mTRQelZU2mHmSIiBNtdJ9nqllsR5mN9agEuztAJqN
 tMQ3LhzFb5wXcDJxbe3yFwt97nvELaLLzvxd8aFY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.94]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MhWop-1kPEHN3bwB-00eG5X; Mon, 28
 Dec 2020 16:08:38 +0100
Date: Mon, 28 Dec 2020 16:08:37 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v14 0/7] Introduce 'yank' oob qmp command to recover from
 hanging qemu
Message-ID: <cover.1609167865.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wpYi4UX42GjaNJfdH507jQA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:wuKpvMTs1KuVJ55tyoaos+rembP2I7l16zZTzaeV9IoWhILTOyV
 34DfA8QDhSDS7w7EWWFs/YiAL/gRVaHhGAojVzwreFMfsHRGjbFDSKe0s5L5yUPrMThL1Mw
 WRrWsk5BSWOS9lIEYON/jywyulslhqpbNhr6++si7ykD2u1ywv10RmdN7Tp6oFPzy3atVcT
 gJakw2ESInUxoS7AABRWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AVE+MJkW1Ws=:dXadi0JgT8/R7d8KverZuG
 y3MjC6zi8JZmxwqLYe011HArs43uL2ly6i9izZwTx55w3FK1pjDQOwlR5B6yy/KdOO6b5bP0b
 kgfdUkdNMjmYzYKzYdrEpH+yDBgbiA4NCsiIEqKS7ZMntaKWapcF1gYtVEbumXvx3j/ODZVxd
 2Tnd5xAxDHUVc5X6vejjZdF2udrFcG0g+L2AT/+oOCKQdx0E15prqNQMx2e4n0EQ/8zDI+C8T
 wdWz2VfvDE21BtpNAaej7hLfp4TVMR7PVpKWk+RK+s0+LXkDFni3wHRrdrgOg6xrCYeeC+Y7h
 qh4G7BwnMXokj0REffe1pgdYnqyi2ipd2wvQM5zacyboJ/1mJgC3PnYaBUfZBp53JDKR5JxbX
 td65yB1M4dizg5n4rUu0mnmj7eDZJEP6lLhYfmfwqwunxSI6pCyrIAsQMo++JXqyYlklUqULG
 63IWnEJhFRBs7MCO5C5ENk4GIoannivjpwdjOIzs6fGlXtlSgSm6gzb7wYJ0SCR7G1UO+dBBV
 PNNZL15Rn7BF5OamE/w6JKgnbHawekCRwB7SkLZ5NEuweLsHG2saISi1nDOTzdU1c6VkvAUEW
 2XqrDgML2ewpvxPaaWkblpq51dTIZrbmIyqmUVREkQpp6xaE56Nl4kQJprVLCmn6HeuT1ZlPj
 iSC37Ovn2pUULRVjNT2UBEjLiHhAUXXKaDTJVQYzsr08b2KwOupXL8RN8YgCkk7lY8BGVvmRB
 6mzKrYDrPt3kYChX+f2Ff4GbDRQm9X2bKnXmSQ75MVqWDlyYePlDyryfvyIp5S/vSjqeaAzCB
 gSPYUpEPainyXI5hYMGERk0tuYsyX3T63agJl/ctVnAmgG6+5TmyRUYrbR0YfuxS89xr4uzzr
 829fCBfs5Kihq99ZUXmSu3LRCTFHghGV3XU3K8H6U=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
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

--Sig_/wpYi4UX42GjaNJfdH507jQA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Hello Everyone,
So here is v14.

Changes:

v14:
 -fix checkpatch.pl warning

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
 qapi/yank.json                | 119 +++++++++++++++++++
 tests/test-char.c             |   1 +
 util/meson.build              |   1 +
 util/yank.c                   | 207 ++++++++++++++++++++++++++++++++++
 17 files changed, 625 insertions(+), 64 deletions(-)
 create mode 100644 include/qemu/yank.h
 create mode 100644 qapi/yank.json
 create mode 100644 util/yank.c

--
2.29.2

--Sig_/wpYi4UX42GjaNJfdH507jQA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/p9PUACgkQNasLKJxd
sli7MhAAgybgMwSOxrDkr60T640JH2oNy0q8kgWweKisup2WRvcrR2W3aV1HoHwo
kiY4fH4upxQowR4KCORv5EdN1Uq4nRJWc/EotcqD9a1SmYk/rAWwrjZ9ZIMiqwar
deaqys5tfuZkov1fMWVkW+9YsREUKj6mBRItNhR9UmuVuTGEuge0JMSCt4GicJA1
gZOGF987ImgAOUClvrKAohfwuus+dsmfOTDgc4PNfr5lzA7JY1rFQTuF8yNhwxn4
IQPdwZqqCKk7P7mtq0Qp36Erzq1nIQ0EUagrduVFKXAzryRZ2cygD5Pv8qmkOoPo
xtxYjerWeeRQGm96DQHscchWU1/GGc/0vL3jmcwsFqUh5w2L8Xs2WagAe1s9sfTQ
KLT0TDlcRnX4NjPuIW0JExhT3xHVYm7h6qNB1H4Fkn17xLQg4fHGTp30BpFLv4Q7
v0qMdGfmFCZIPckcll/eFl5UcsFgodgQez/H+NBh6lVevutbglsSLxR+2HSH6jHA
TX172sRJYDztv9Fss8PIrvLZ1MzqB3ZGY3dth/s3Dz8Q5eQ/1vrHx5MSVFS5G0QM
o7i9JndOsuC+0c94wQX9cxfcNnvWX77yo5aUfSE05VDgc1MnP/piIbPKGnVZQRtb
n8OPlzt9e417w+NAoBG/826aXVwMjIwjnakU0V5vaiwCO2OB47w=
=GKcV
-----END PGP SIGNATURE-----

--Sig_/wpYi4UX42GjaNJfdH507jQA--

