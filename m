Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24A650A3DD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:19:56 +0200 (CEST)
Received: from localhost ([::1]:43358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYb5-0006wk-Vg
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXU-0003L1-P8
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXP-0005lz-2X
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650554165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zBxzW40NaEvyyVwq19hse3UWenpqUnWUAiySUBCKxYE=;
 b=QrZJYk1LDSP+IoPk2j8hdsdvmJC0L9oGrEHRBmde4IPQBwCoeu1MgxXvZ9URlN5ocBRnkp
 GwGMp3sJTPylNxRVMZbQZiXelhmHe5sc1JBWeDJHxmR08evLE+B1mTGM8qdYkCVNyh6WeJ
 Dl1PBFVV+eJV/E/NZOwzddZRrsL/lZc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-QEDpm09NPii0MPEsVRid7g-1; Thu, 21 Apr 2022 11:16:02 -0400
X-MC-Unique: QEDpm09NPii0MPEsVRid7g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE5211E15C00;
 Thu, 21 Apr 2022 15:16:01 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37CF240D016A;
 Thu, 21 Apr 2022 15:16:01 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/17] Python patches
Date: Thu, 21 Apr 2022 11:15:43 -0400
Message-Id: <20220421151600.984189-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit b1efff6bf031a93b5b8bf3912ddc720cc1653a61=
:=0D
=0D
  Merge tag 'pull-ppc-20220420-2' of https://gitlab.com/danielhb/qemu into =
staging (2022-04-20 21:54:24 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/python-pull-request=0D
=0D
for you to fetch changes up to 47430775ed1a48d7beb2c7b8d7feaab73104ec46:=0D
=0D
  python/qmp: remove pylint workaround from legacy.py (2022-04-21 11:01:00 =
-0400)=0D
=0D
----------------------------------------------------------------=0D
Python patches=0D
=0D
This PR finalizes the switch from Luiz's QMP library to mine.=0D
=0D
----------------------------------------------------------------=0D
=0D
John Snow (17):=0D
  python/machine: permanently switch to AQMP=0D
  scripts/bench-block-job: switch to AQMP=0D
  iotests/mirror-top-perms: switch to AQMP=0D
  iotests: switch to AQMP=0D
  python/aqmp: add explicit GPLv2 license to legacy.py=0D
  python/aqmp: relicense as LGPLv2+=0D
  python/qmp-shell: relicense as LGPLv2+=0D
  python/aqmp-tui: relicense as LGPLv2+=0D
  python: temporarily silence pylint duplicate-code warnings=0D
  python/aqmp: take QMPBadPortError and parse_address from qemu.qmp=0D
  python/aqmp: fully separate from qmp.QEMUMonitorProtocol=0D
  python/aqmp: copy qmp docstrings to qemu.aqmp.legacy=0D
  python: remove the old QMP package=0D
  python: re-enable pylint duplicate-code warnings=0D
  python: rename qemu.aqmp to qemu.qmp=0D
  python: rename 'aqmp-tui' to 'qmp-tui'=0D
  python/qmp: remove pylint workaround from legacy.py=0D
=0D
 python/README.rst                             |   2 +-=0D
 python/qemu/qmp/README.rst                    |   9 -=0D
 python/qemu/aqmp/__init__.py                  |  59 ---=0D
 python/qemu/aqmp/legacy.py                    | 177 -------=0D
 python/qemu/aqmp/py.typed                     |   0=0D
 python/qemu/machine/machine.py                |  18 +-=0D
 python/qemu/machine/qtest.py                  |   2 +-=0D
 python/qemu/qmp/__init__.py                   | 445 ++----------------=0D
 python/qemu/{aqmp =3D> qmp}/error.py            |   0=0D
 python/qemu/{aqmp =3D> qmp}/events.py           |   2 +-=0D
 python/qemu/qmp/legacy.py                     | 315 +++++++++++++=0D
 python/qemu/{aqmp =3D> qmp}/message.py          |   0=0D
 python/qemu/{aqmp =3D> qmp}/models.py           |   0=0D
 python/qemu/{aqmp =3D> qmp}/protocol.py         |   4 +-=0D
 python/qemu/{aqmp =3D> qmp}/qmp_client.py       |  16 +-=0D
 python/qemu/{aqmp =3D> qmp}/qmp_shell.py        |  11 +-=0D
 .../qemu/{aqmp/aqmp_tui.py =3D> qmp/qmp_tui.py} |  17 +-=0D
 python/qemu/{aqmp =3D> qmp}/util.py             |   0=0D
 python/qemu/utils/qemu_ga_client.py           |   4 +-=0D
 python/qemu/utils/qom.py                      |   2 +-=0D
 python/qemu/utils/qom_common.py               |   4 +-=0D
 python/qemu/utils/qom_fuse.py                 |   2 +-=0D
 python/setup.cfg                              |  11 +-=0D
 python/tests/protocol.py                      |  14 +-=0D
 scripts/cpu-x86-uarch-abi.py                  |   2 +-=0D
 scripts/device-crash-test                     |   4 +-=0D
 scripts/qmp/qmp-shell                         |   2 +-=0D
 scripts/qmp/qmp-shell-wrap                    |   2 +-=0D
 scripts/render_block_graph.py                 |   4 +-=0D
 scripts/simplebench/bench_block_job.py        |   5 +-=0D
 tests/qemu-iotests/iotests.py                 |   3 +-=0D
 tests/qemu-iotests/tests/mirror-top-perms     |  11 +-=0D
 32 files changed, 422 insertions(+), 725 deletions(-)=0D
 delete mode 100644 python/qemu/qmp/README.rst=0D
 delete mode 100644 python/qemu/aqmp/__init__.py=0D
 delete mode 100644 python/qemu/aqmp/legacy.py=0D
 delete mode 100644 python/qemu/aqmp/py.typed=0D
 rename python/qemu/{aqmp =3D> qmp}/error.py (100%)=0D
 rename python/qemu/{aqmp =3D> qmp}/events.py (99%)=0D
 create mode 100644 python/qemu/qmp/legacy.py=0D
 rename python/qemu/{aqmp =3D> qmp}/message.py (100%)=0D
 rename python/qemu/{aqmp =3D> qmp}/models.py (100%)=0D
 rename python/qemu/{aqmp =3D> qmp}/protocol.py (99%)=0D
 rename python/qemu/{aqmp =3D> qmp}/qmp_client.py (97%)=0D
 rename python/qemu/{aqmp =3D> qmp}/qmp_shell.py (98%)=0D
 rename python/qemu/{aqmp/aqmp_tui.py =3D> qmp/qmp_tui.py} (98%)=0D
 rename python/qemu/{aqmp =3D> qmp}/util.py (100%)=0D
=0D
-- =0D
2.34.1=0D
=0D


