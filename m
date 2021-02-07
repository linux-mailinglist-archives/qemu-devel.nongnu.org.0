Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86443125A8
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 16:58:04 +0100 (CET)
Received: from localhost ([::1]:32870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8mRn-0006zS-ET
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 10:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l8mOy-0005w2-JL
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 10:55:08 -0500
Received: from mout.web.de ([212.227.17.12]:36447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1l8mOw-0006Lq-Ps
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 10:55:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1612713301;
 bh=+SfqWGs3H24X2CfYxAHK43P0Yq6whSwTWylXt0psaN4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=i9zYbuWtgPXnZMsYiPTNBTqqjKHdO0whzYU5BEAM/LuLerqypV7gDepRki2uMhDsG
 5RLwlLeLnci2WyG4BYH851gOVp/1EZhX4jyM/9MRaP13VLiU35LxeWZuK5SbUll514
 6oPsfQFr5WLan0U9MPuk2bWoutOhb1Y0rCmD5M6w=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([87.123.206.85]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M4sc1-1lAhXf3JWJ-0022Rd; Sun, 07
 Feb 2021 16:55:00 +0100
Date: Sun, 7 Feb 2021 16:54:22 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v4 0/6] colo: Introduce resource agent and test suite/CI
Message-ID: <cover.1612712637.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0sfJFWlFdQO=QnETt7HoZJd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:Y9z2HRt4GzVR/nMJ/YMm7ZM0Q2kod/DCySomA3Eg3tWPWSGkNij
 dqykdHbNxn9nNyFQzVDHrIQaz4XZ9/LGaTSxT3NszOlqpqQ8L02RHQY6XMrr74ExRIipsvD
 XsEoUXmdf3wWSTtpsLoi59RaB7tnr6K0A3lDqfB8IxRZ3wJBP/gPRle7EdRcKoofIuNqnMV
 L00Ia/gC+S0g+ZtbheEXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:d/4V7htL0/A=:MdTw5rqRv6mhqPWjiJUtDf
 RmInXRumyjdNM8GiCitSkq/fKMMZeTVH5GG71l6UMwvX2r6q40ASnk/xXQJ+4dDvlUSDBzOJI
 WF57mLGj7ObblBeulp6j7iegoKfVzVH2Wp6OBbOf0tKJLtScnAlLTAwaFl/AklpSGXB9VQl5m
 QEclBuUWKkuXVJlJJu8JjcVFGflB3WLxWcnZzgw0ufy1Ecq6RHO9VFDvkQPVR7rC41Lm+9CXN
 Yb/tBYDGCiVO6MV/beIrFXPkaB5i/R+XnW07oN1UJSKBKCegpG9XWGK3QoPnso7mTECMHhyff
 Tgv2/wnetzTk8lK1Wdq1+wwQP0bn2IiAiHhSo0Ap07Jfi4cC1hCjihbDsH5/LbP1fr+0moOYg
 C4uejgQq7EmNzhBqGnWlhtWcp+uXgQkm4joS6Rg9MF3fvy/7KIutv2VXKt/d5ouVC5vXBJwRW
 iATTK+kyrJ3kEZYgqZi3wXoAPjXI4G5US7W2XmLFsnPB8HGZXe4JKL0V+I8eJLLXcpgS/A65Y
 AndMIqcxkO4owTIoJ6X7QLbqIeH75iIoJ6zqQeRaZ6Fs/h2o3jzWJYxH50i506jWZXF5wNCeS
 qynT6W5lhCCYF2cI42Ogc5f97xu1HDjEgIeDD7ugziJ1ebQEj5Mn49jL0+y7eGyay3NHC1Nk8
 vcM0qJ6gW7wGzcHoXX123/1ahIwXVRQ73Tc2wKF1CD3hfkdLNa1/WLh2/cgDaMNht5682oh5A
 P+IaRADWOcgKtjOpX9K9liGMxbPt69Zri9srUkAQ9XTvkrLKfNDAoCwlnlGJWpkpACTGPjlhI
 mosF/udhz+vyPUJRCWenqFBsc784hiDPYsE//WDTPv/jUdrd+BprtgHMcN71YI4laZuOTrho+
 JyyNJdDX3LpQgTSqo2apONzh8Hj0tXCZrT9gTXePM=
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
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/0sfJFWlFdQO=QnETt7HoZJd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello Everyone,
So here is v4.

Regards,
Lukas Straub

Changes:

v4:
 -use new yank api that finally has been merged
 -cleanup the test a bit by using numbers instead of "hosta" and "hostb"
 -resource-agent: Don't set master-score to 0 on invalid configuration

v3:
 -resource-agent: Don't determine local qemu state by remote master-score, =
query
  directly via qmp instead
 -resource-agent: Add max_queue_size parameter for colo-compare
 -resource-agent: Fix monitor action on secondary returning error during
  clean shutdown
 -resource-agent: Fix stop action setting master-score to 0 on primary on
  clean shutdown

v2:
 -use new yank api
 -drop disk_size parameter
 -introduce pick_qemu_util function and use it

Overview:

Hello Everyone,
These patches introduce a resource agent for fully automatic management of =
colo
and a test suite building upon the resource agent to extensively test colo.

Test suite features:
-Tests failover with peer crashing and hanging and failover during checkpoi=
nt
-Tests network using ssh and iperf3
-Quick test requires no special configuration
-Network test for testing colo-compare
-Stress test: failover all the time with network load

Resource agent features:
-Fully automatic management of colo
-Handles many failures: hanging/crashing qemu, replication error, disk erro=
r, ...
-Recovers from hanging qemu by using the "yank" oob command
-Tracks which node has up-to-date data
-Works well in clusters with more than 2 nodes

Run times on my laptop:
Quick test: 200s
Network test: 800s (tagged as slow)
Stress test: 1300s (tagged as slow)

For the last two tests, the test suite needs access to a network bridge to
properly test the network, so some parameters need to be given to the test
run. See tests/acceptance/colo.py for more information.

Regards,
Lukas Straub

Lukas Straub (6):
  avocado_qemu: Introduce pick_qemu_util to pick qemu utility binaries
  boot_linux.py: Use pick_qemu_util
  colo: Introduce resource agent
  colo: Introduce high-level test suite
  configure,Makefile: Install colo resource-agent
  MAINTAINERS: Add myself as maintainer for COLO resource agent

 MAINTAINERS                               |    6 +
 configure                                 |    7 +
 meson.build                               |    5 +
 meson_options.txt                         |    2 +
 scripts/colo-resource-agent/colo          | 1527 +++++++++++++++++++++
 scripts/colo-resource-agent/crm_master    |   44 +
 scripts/colo-resource-agent/crm_resource  |   12 +
 tests/acceptance/avocado_qemu/__init__.py |   15 +
 tests/acceptance/boot_linux.py            |   11 +-
 tests/acceptance/colo.py                  |  654 +++++++++
 10 files changed, 2274 insertions(+), 9 deletions(-)
 create mode 100755 scripts/colo-resource-agent/colo
 create mode 100755 scripts/colo-resource-agent/crm_master
 create mode 100755 scripts/colo-resource-agent/crm_resource
 create mode 100644 tests/acceptance/colo.py

--
2.30.0

--Sig_/0sfJFWlFdQO=QnETt7HoZJd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmAgDS4ACgkQNasLKJxd
sljpMRAAnFs1sl/uEJ05Hl96umcqXBCILzvJLcyoB7EovglBFhauOU0Tpdumzwj5
ZQXnjgEreiqnQEXwXrNHxW1vb4Fu0mlr2GoGV3E9e/bgpqbUvRSMibKBdI7KzH4H
2awJ71Q9tVDWqnD1uT7YemNVb4ZIe/qIFD85LcWvphTTUTB4y1kLaj2nyRS1/xDM
QKCzMbwHkzMVRC0Pd8hvHQPJ7XtmKYdOCEZ6M5V1+i4KIyiYe7Hz++MMT1i7f+40
jBTiANYq62EpRJwzxA5mHvlLrttGD/DwRdG0dul+M8/J/y1f+co3+tLXPoE+8Jm3
/fwpAJxK0DqBDvu5464UfKpPOtaJxr+wNakQKC53vtPkYGrmeSihgNoXHlsr0yqh
x1R0l2PSBMruw4AUoUYv7EVoQjNtqyE48/kHOEvlD1vZ8Niw6ag2GPvnLLnL/4dg
hGavsbOX3Uvy8Ckq6I9nkTxCONBtF9YSZPmDQXcBKZahLUY70231NbcBDMlepDo5
h6n9wWfEKpeQNxFWGY6b4JLwawIfTr4a7dvBmG6S6r44k66DFVXt2JI3n5yuHdPE
DScd5tjuwVVKgVV3ODvY6g4km8AaYowMOwdRV8F/M8gK6j+hsfZNVeB9biUpNNwi
XsTh+82v8kvLPxNzo5PeWiIR5SkLK87UN+Yp1VTcesnizCFhR54=
=ghFP
-----END PGP SIGNATURE-----

--Sig_/0sfJFWlFdQO=QnETt7HoZJd--

