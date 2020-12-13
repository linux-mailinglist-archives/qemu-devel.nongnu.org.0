Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 537AD2D8CE2
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 12:53:05 +0100 (CET)
Received: from localhost ([::1]:55172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koPw0-0007Gq-9Y
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 06:53:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1koPrW-0005XU-N0; Sun, 13 Dec 2020 06:48:31 -0500
Received: from mout.web.de ([212.227.17.12]:53011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1koPrO-0002JD-S8; Sun, 13 Dec 2020 06:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1607860090;
 bh=giwGAC6TXrME8T9qSfRqrMtI1YOPeiReSr4V8OlC3w0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=Ik/zj9575Qc8DNudJpNhPkDMuNWq0yKJ/2G+w8Qbcx7RR8mgWEcoo2nvxlY0JejL9
 6JmhD97VtDnLa40mYs6ie3M9CWtu3E36NBy7zLl0cMX+QrKrvIzdDDEV5R1eKbPb90
 oKLakvtIrQtxn5K0OnjCoKRtpC1HJ3lLI2PiD56U=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.131]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Ldn2d-1kO7Nh1Zjv-00j2uB; Sun, 13
 Dec 2020 12:48:10 +0100
Date: Sun, 13 Dec 2020 12:48:08 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v12 0/7] Introduce 'yank' oob qmp command to recover from
 hanging qemu
Message-ID: <cover.1607858747.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YiI/R=z5mn+T5p.LXTzew_y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:WEQ9XETgdadK+Hxj65YTa0Yi6iwuPzSVGT11BaUbzBBRiqJumbc
 1VXoNbu3xgd/xrj94PaW2HWpueGNG5Skpd+3S/zutiJuhSDpfsOhS+Yfx1WFjzmbbH2lhlm
 W7E2/uCIxBZxbG7Cwml+zIHK1/2ERE7h9JdqG4X3wYeLTL2v+AOTFjPEwL9T0kW2Loq1kDq
 W/L1mdGarwW0Ec2YbnD6A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AxOh0CdlO5I=:9h0JiucdJvsc0kKkqUSjPo
 qIVD3Apy8eMVc3Pz7qsCgIow2mh2nQcMH/NAW+TEv0tFSH6VtnC0tHZ5+na6bbDZ/zJrui4gn
 oetbJKUFpyKDHF/rWNlvC/RM1Xew8qzmAY3BoX1xNEmrIfN00HJ8jdXrDwyv+AqAPcgvJDx8V
 upUaNa+dkwVAi0gHFquA82lL/xj5g2qLTVeoAnSNo1OvbTrbI5NZkgBwSf7qCkt6RSpRNESRm
 mQebPYSQoAwvcq0ou59o2jc0hOWBxdeMTbojefS615yZjFX3L5LMJbRUKYXBcM/CEuxQ8if0x
 /a0ZAPlF3E1jK/4M7GBZrCc9ruIj8r6L+J2/H2Jc4DCMDjZpCvln+wGqDxS/nDuwQv9djwdmF
 A259fOwsP6I5m1PXFvAj31QOF2cz1xEBtYPjZon5iwCcRFYRLGCrrEltFNhk1NpqAFUPltI1u
 ugO+FT7IXO39wMqXw2Q3C3T0nf+6e03f50TkKGG5et4LpIZ8hp2mnU34uIZlzU+HSHup4o69H
 BoIE78LSAEqpJ6Bc+W4C9rcp8ywZl4WcWQNfriDgDbyeigXr7A6KRPam3uotG+xIhhnWbZ4y3
 RAO6hRnXPkXAhXxFBY0eAAP/yDLNH5qYWn5bp9XVqWJD+U7YphJ0YDyuJbPmEJVrkLkKj2Iiz
 wKhx4fwrbzy6A4M0MiY20vbsadCf38TVxVUWIuIEVlH9sfpXpiQbW1RgZVSNVKFhduoxATexD
 +3CgT4X0rnL9FkGfZMzCOtCkCObFb0jIgkuzEMdDD1fL7U2yMkXt+U8u4IHEHrVlbCKfpnF7c
 XT88w0bsbkxkqz88aFQ3ZJeWSppFjBvQXndgGGqg0n8DtFVCuBWUQO529yIGSOLJmzQ6Jqo3g
 Y0HVOV3v2aqEjpq1gy0Vc3MI+i7aRBFPKL6wY8oZQ=
Received-SPF: pass client-ip=212.227.17.12; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 =?UTF-8?B?TWFyYy1B?= =?UTF-8?B?bmRyw6k=?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRy?= =?UTF-8?B?w6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/YiI/R=z5mn+T5p.LXTzew_y
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Hello Everyone,
So here is v12.
@Marc-Andr=C3=A9 Lureau, We still need an ACK for the chardev patch.

Changes:

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
 block/nbd.c                   | 154 ++++++++++++++----------
 chardev/char-socket.c         |  35 ++++++
 include/io/channel.h          |   5 +-
 include/qemu/yank.h           |  95 +++++++++++++++
 io/channel-tls.c              |   6 +-
 migration/channel.c           |  13 ++
 migration/migration.c         |  24 ++++
 migration/multifd.c           |  10 ++
 migration/qemu-file-channel.c |   7 ++
 migration/savevm.c            |   6 +
 qapi/meson.build              |   1 +
 qapi/qapi-schema.json         |   1 +
 qapi/yank.json                | 119 +++++++++++++++++++
 tests/test-char.c             |   1 +
 util/meson.build              |   1 +
 util/yank.c                   | 216 ++++++++++++++++++++++++++++++++++
 17 files changed, 637 insertions(+), 64 deletions(-)
 create mode 100644 include/qemu/yank.h
 create mode 100644 qapi/yank.json
 create mode 100644 util/yank.c

--
2.20.1

--Sig_/YiI/R=z5mn+T5p.LXTzew_y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl/V/3gACgkQNasLKJxd
sljzaxAAixl5KXUENXtxr/dWI1GB3+HzgpWaarIIV1IFqTVuIhKPpCRhhr4slB7Q
WMyrvb6h6rB6yG+r3yKxIUJEG404sL4M2UjS2xHGQRKfLtJoQmysB+yQmnAm6tEz
WWYKyzmJcRtsUszUPSIhM6tiGFCQxEDck+ou7IGKtDaLw3nVBbihbrwLS6X28CNa
6zYb54NWFWtGZDOFIL4C0u5yhX58/7GM3mdM0Zh/f5rf3+c4ILJDDxyIzqBYq6KW
NM1iNCZ+0xzVMHdSofi1FC4PcBg9GgRk7Un2OoL0TshhUoYGBM9RpcXui8Um0Zl8
3DZHzxcICLcyO47cPJgcbmbWYETt4lntO+g5bDB9HGQ6PEdGYvJ2TXjvyZkiLErP
7WUVo7a9N+ECdoVXWajcpRc1b+jen5md/wNWaCs59pU+H6R8+8OhyRMw3dgh2a3n
PIyBoZUgSI/AngyBALh4FucGt6xRma9hnhF5JaiUiDTOW+KVGo7janYjYOCGaOcf
kGcCRQRZLSjuv9Vkljt64D56VD95sw3MFOhwvKmffQttM2b+x0CKEufwT2Nf1GgR
5XfX+lfRzQ6hLON1ZHKR2/3zqUhVnshGz+RAWJqpINstj+EeFqsz3ydh+UXIF/Og
p+kSCerEMz2Wx++6rIS93KLic/T8lwisYqnxXGbKKRuPHwzir0s=
=+Jfg
-----END PGP SIGNATURE-----

--Sig_/YiI/R=z5mn+T5p.LXTzew_y--

