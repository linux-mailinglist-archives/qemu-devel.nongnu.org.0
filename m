Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC01B45CD3B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 20:30:36 +0100 (CET)
Received: from localhost ([::1]:42860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpxyV-0006yk-Ro
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 14:30:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxv2-0003QY-9j
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxv0-0007ah-6u
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:26:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637782017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PBTEAZEQKuPP4YZZ6qk1sANTnnhqAkeu8S4vVZSDsqk=;
 b=Xs2VdyDWYZyxZwa6FZPf0if5vZUDw+2GcF4F6Mbh1avVZTGuFRCcNBx58JMNEFtg/HHomt
 k7+MnJJKzLFNBt0tXJeBqmfYX9e7kuGEdMDlhxKNWghxDVYC5voisHEQsaGuvDb4LgUwoq
 6MboFqRRNHG9eMygHFq6yNhqHp+ylHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-J4X34Vj3MCuHYxj4_6W-Ww-1; Wed, 24 Nov 2021 14:26:49 -0500
X-MC-Unique: J4X34Vj3MCuHYxj4_6W-Ww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 338EE100DFC9;
 Wed, 24 Nov 2021 19:26:47 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45AA22B178;
 Wed, 24 Nov 2021 19:26:18 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/23] Python: delete qemu.qmp package
Date: Wed, 24 Nov 2021 14:25:54 -0500
Message-Id: <20211124192617.3396403-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-qmp-legacy-switch=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/415801786=0D
=0D
NOT intended for 6.2.=0D
=0D
This series swaps out qemu.qmp for qemu.aqmp permanently, instead of=0D
hiding it behind an environment variable toggle. This leaves us with=0D
just one QMP library to worry about.=0D
=0D
The series is organized like this:=0D
=0D
- 01-02: Fixes and improvements to Async QMP=0D
- 03-11: Switch python/* users to use AQMP exclusively=0D
- 12-17: Switch other users to use AQMP exclusively=0D
- 18-23: Finalize the switchover, delete python/qemu/qmp.=0D
=0D
Optional notes about the broader process of moving Python infrastructure=0D
onto PyPI are below, though it isn't required reading for reviewing this=0D
series. Consider it a newsletter from the Python dungeon:=0D
=0D
I was asked what the timeline for actually uploading anything to PyPI=0D
was. This series is part of my answer, but the steps look like this:=0D
=0D
Phase I:=0D
- Refactor everything in-tree to be a bona-fide python package  [Done]=0D
- Add unit testing and CI for all QEMU python packages          [Done]=0D
- Develop a version of QMP intended for public support via PyPI [Done]=0D
=0D
Phase II:=0D
- Switch machine.py and iotests to using async QMP by default   [Done]=0D
- Fix bugs in qemu.aqmp discovered during RC testing           [Ongoing]=0D
- Remove qemu.qmp in favor of qemu.aqmp                    [This Series]=0D
- Rename qemu.aqmp back to qemu.qmp=0D
- Add a proper "sync" version of qemu.aqmp.QMPClient       [In Progress]=0D
  designed to be more supportable via PyPI=0D
  current status: it's functional, but there are some FIXMEs.=0D
- Pivot in-tree users of qemu.(a)qmp.legacy to qemu.qmp.sync,=0D
  -OR- move the "legacy" wrapper outside of the qmp package and into utils.=
=0D
  (The goal is simply to avoid uploading the legacy wrapper to PyPI.)=0D
=0D
Phase III:=0D
- Fork python/qemu/qmp into its own git repo, with its own pkg version=0D
- Add sphinx doc generation to qemu.qmp repo and add readthedocs integratio=
n=0D
  [Doc generation is 95% done on a branch, needs polish. RTD is untouched.]=
=0D
- Convert in-tree users of qemu.qmp to pull the dependency from either=0D
  PyPI or a git URL. I think I'd like to avoid using git submodules ...=0D
=0D
That's broadly it. There's some code to do for the sync bridge to make=0D
the design tidier, but the goal there is to move a lot of the QMP event=0D
wrangling functions we have scattered across qmp, machine, and even=0D
iotests into a more central location with much stronger support.=0D
=0D
A lot of this will hopefully move pretty fast once the tree re-opens.=0D
=0D
One of the remaining skeletons in the closet that I have not yet fully=0D
addressed is how I will be moving remaining in-tree users of the QMP=0D
package onto a PyPI dependency. That's probably where most of the work=0D
will actually be; adding a python virtual environment to iotests et al.=0D
=0D
John Snow (23):=0D
  python/aqmp: add __del__ method to legacy interface=0D
  python/aqmp: handle asyncio.TimeoutError on execute()=0D
  python/aqmp: copy type definitions from qmp=0D
  python/aqmp: add SocketAddrT to package root=0D
  python/qemu-ga-client: update instructions to newer CLI syntax=0D
  python/qmp: switch qemu-ga-client to AQMP=0D
  python/qmp: switch qom tools to AQMP=0D
  python/qmp: switch qmp-shell to AQMP=0D
  python: move qmp utilities to python/qemu/utils=0D
  python: move qmp-shell under the AQMP package=0D
  python/machine: permanently switch to AQMP=0D
  scripts/cpu-x86-uarch-abi: fix CLI parsing=0D
  scripts/cpu-x86-uarch-abi: switch to AQMP=0D
  scripts/render-block-graph: switch to AQMP=0D
  scripts/bench-block-job: switch to AQMP=0D
  iotests/mirror-top-perms: switch to AQMP=0D
  iotests: switch to AQMP=0D
  python: temporarily silence pylint duplicate-code warnings=0D
  python/aqmp: take QMPBadPortError and parse_address from qemu.qmp=0D
  python/aqmp: fully separate from qmp.QEMUMonitorProtocol=0D
  python/aqmp: copy qmp docstrings to qemu.aqmp.legacy=0D
  python: remove the old QMP package=0D
  python: re-enable pylint duplicate-code warnings=0D
=0D
 python/PACKAGE.rst                           |   4 +-=0D
 python/README.rst                            |   4 +-=0D
 python/qemu/qmp/README.rst                   |   9 -=0D
 python/qemu/aqmp/__init__.py                 |  10 +-=0D
 python/qemu/aqmp/aqmp_tui.py                 |   2 +-=0D
 python/qemu/aqmp/legacy.py                   | 203 ++++++++-=0D
 python/qemu/aqmp/protocol.py                 |  16 +-=0D
 python/qemu/aqmp/qmp_client.py               |   8 +-=0D
 python/qemu/{qmp =3D> aqmp}/qmp_shell.py       |  31 +-=0D
 python/qemu/machine/machine.py               |  18 +-=0D
 python/qemu/machine/qtest.py                 |   2 +-=0D
 python/qemu/qmp/__init__.py                  | 422 -------------------=0D
 python/qemu/qmp/py.typed                     |   0=0D
 python/qemu/{qmp =3D> utils}/qemu_ga_client.py |  24 +-=0D
 python/qemu/{qmp =3D> utils}/qom.py            |   5 +-=0D
 python/qemu/{qmp =3D> utils}/qom_common.py     |   7 +-=0D
 python/qemu/{qmp =3D> utils}/qom_fuse.py       |  11 +-=0D
 python/setup.cfg                             |  21 +-=0D
 scripts/cpu-x86-uarch-abi.py                 |   7 +-=0D
 scripts/qmp/qemu-ga-client                   |   2 +-=0D
 scripts/qmp/qmp-shell                        |   2 +-=0D
 scripts/qmp/qom-fuse                         |   2 +-=0D
 scripts/qmp/qom-get                          |   2 +-=0D
 scripts/qmp/qom-list                         |   2 +-=0D
 scripts/qmp/qom-set                          |   2 +-=0D
 scripts/qmp/qom-tree                         |   2 +-=0D
 scripts/render_block_graph.py                |   8 +-=0D
 scripts/simplebench/bench_block_job.py       |   3 +-=0D
 tests/qemu-iotests/iotests.py                |   2 +-=0D
 tests/qemu-iotests/tests/mirror-top-perms    |   7 +-=0D
 30 files changed, 300 insertions(+), 538 deletions(-)=0D
 delete mode 100644 python/qemu/qmp/README.rst=0D
 rename python/qemu/{qmp =3D> aqmp}/qmp_shell.py (96%)=0D
 delete mode 100644 python/qemu/qmp/__init__.py=0D
 delete mode 100644 python/qemu/qmp/py.typed=0D
 rename python/qemu/{qmp =3D> utils}/qemu_ga_client.py (94%)=0D
 rename python/qemu/{qmp =3D> utils}/qom.py (98%)=0D
 rename python/qemu/{qmp =3D> utils}/qom_common.py (96%)=0D
 rename python/qemu/{qmp =3D> utils}/qom_fuse.py (97%)=0D
=0D
--=20=0D
2.31.1=0D
=0D


