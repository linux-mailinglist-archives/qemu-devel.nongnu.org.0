Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 437FE441FCE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:10:06 +0100 (CET)
Received: from localhost ([::1]:43326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbkz-0004WW-AZ
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhb99-0007lm-AP
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:30:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhb95-0001Ax-7J
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:30:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635787853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6FGn7kYJ8VtNsK9DPrVM2c2XkauyMqlasmvHdEO3EtQ=;
 b=HzzJ2p6/EXJLCEO75YsDbWWtDMbuxFnV1xd0WJUffS/UmMVUxRUS+FgDM+Yxxn/kWJ5IW1
 CPOBotpClE7bzPwpm9mPiMa7SBDW8P3fWdNkss0fCkez/Awox3lvgUx3M++K1wJ+h9nAex
 SLWP+1BpkVe7+6c0++FzgbtgXJbj3DE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-IfmKNcywMaexBa14_FVxRA-1; Mon, 01 Nov 2021 13:30:50 -0400
X-MC-Unique: IfmKNcywMaexBa14_FVxRA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE63019253C6;
 Mon,  1 Nov 2021 17:30:48 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 431FD19C79;
 Mon,  1 Nov 2021 17:30:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/22] Python patches
Date: Mon,  1 Nov 2021 13:29:44 -0400
Message-Id: <20211101173006.656673-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit af531756d25541a1b3b3d9a14e72e7fedd941a2e=
:=0D
=0D
  Merge remote-tracking branch 'remotes/philmd/tags/renesas-20211030' into =
staging (2021-10-30 11:31:41 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/python-pull-request=0D
=0D
for you to fetch changes up to 76cd358671e6b8e7c435ec65b1c44200254514a9:=0D
=0D
  python, iotests: replace qmp with aqmp (2021-11-01 11:54:59 -0400)=0D
=0D
----------------------------------------------------------------=0D
Pull request=0D
=0D
----------------------------------------------------------------=0D
=0D
John Snow (22):=0D
  iotests/297: Move pylint config into pylintrc=0D
  iotests/297: Split mypy configuration out into mypy.ini=0D
  iotests/297: Add get_files() function=0D
  iotests/297: Create main() function=0D
  iotests/297: Don't rely on distro-specific linter binaries=0D
  iotests/297: Split run_linters apart into run_pylint and run_mypy=0D
  iotests/297: refactor run_[mypy|pylint] as generic execution shim=0D
  iotests/297: Change run_linter() to raise an exception on failure=0D
  iotests/297: update tool availability checks=0D
  iotests/297: split test into sub-cases=0D
  iotests: split linters.py out from 297=0D
  iotests/linters: Add entry point for linting via Python CI=0D
  iotests/linters: Add workaround for mypy bug #9852=0D
  python: Add iotest linters to test suite=0D
  python/machine: remove has_quit argument=0D
  python/machine: Handle QMP errors on close more meticulously=0D
  python/aqmp: Remove scary message=0D
  iotests: Accommodate async QMP Exception classes=0D
  iotests: Conditionally silence certain AQMP errors=0D
  iotests/300: avoid abnormal shutdown race condition=0D
  python/aqmp: Create sync QMP wrapper for iotests=0D
  python, iotests: replace qmp with aqmp=0D
=0D
 python/qemu/aqmp/__init__.py              |  12 --=0D
 python/qemu/aqmp/legacy.py                | 138 ++++++++++++++++++++++=0D
 python/qemu/machine/machine.py            |  85 +++++++++----=0D
 python/tests/iotests-mypy.sh              |   4 +=0D
 python/tests/iotests-pylint.sh            |   4 +=0D
 scripts/simplebench/bench_block_job.py    |   3 +-=0D
 tests/qemu-iotests/040                    |   7 +-=0D
 tests/qemu-iotests/218                    |   2 +-=0D
 tests/qemu-iotests/255                    |   2 +-=0D
 tests/qemu-iotests/297                    | 103 +++++++---------=0D
 tests/qemu-iotests/300                    |  13 +-=0D
 tests/qemu-iotests/iotests.py             |  20 +++-=0D
 tests/qemu-iotests/linters.py             | 105 ++++++++++++++++=0D
 tests/qemu-iotests/mypy.ini               |  12 ++=0D
 tests/qemu-iotests/pylintrc               |  16 +++=0D
 tests/qemu-iotests/tests/mirror-top-perms |  17 ++-=0D
 16 files changed, 424 insertions(+), 119 deletions(-)=0D
 create mode 100644 python/qemu/aqmp/legacy.py=0D
 create mode 100755 python/tests/iotests-mypy.sh=0D
 create mode 100755 python/tests/iotests-pylint.sh=0D
 create mode 100644 tests/qemu-iotests/linters.py=0D
 create mode 100644 tests/qemu-iotests/mypy.ini=0D
=0D
--=20=0D
2.31.1=0D
=0D


