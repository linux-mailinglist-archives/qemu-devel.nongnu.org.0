Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 009BC3B7A06
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 23:45:32 +0200 (CEST)
Received: from localhost ([::1]:54208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyLXu-0002PP-Ve
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 17:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyLW8-0000Fs-9o
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 17:43:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyLW5-0005eM-Mc
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 17:43:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625003016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AW6efUlOBK2gzEdEMjyArfW0S3uxi0GHPirbjWG9siw=;
 b=TqBXUzxiCP+TL44fEU/NzG/zw+5x8FAc2OmW8uKtMuGYq3Zc74B/1oJyVVUyH7MgGYVlrc
 a29usNTdPscfWMLF600oItKZhZKooDSa4HytrKSv0jzGbB4Ynx33szaDdpB3S3w1Io9lRu
 HMjopo+0vaKpjxXx6Xi0ITgTvbr9Ebg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-D-TSUHy5OP6ggi4l7DwInw-1; Tue, 29 Jun 2021 17:43:32 -0400
X-MC-Unique: D-TSUHy5OP6ggi4l7DwInw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75FB31835AC7;
 Tue, 29 Jun 2021 21:43:31 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA51060C13;
 Tue, 29 Jun 2021 21:43:23 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/15] Python: packaging cleanups
Date: Tue, 29 Jun 2021 17:43:08 -0400
Message-Id: <20210629214323.1329806-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series is a collection of touchups and small fixes to the Python=0D
packaging series that was initiated with commit ea1213b7.=0D
=0D
It fixes a small handful of annoyances and adjusts some readme files,=0D
help text, and so on.=0D
=0D
I'd like to make sure this is included prior to the 6.1 RC testing=0D
period. (And now, at the very least, patch #01 needs to go in ASAP.)=0D
=0D
V3:=0D
  001/15:[down] 'python/qom: Do not use 'err' name at module scope'=0D
  010/15:[down] 'python: only check qemu/ subdir with flake8'=0D
  015/15:[down] 'python: Fix broken ReST docstrings'=0D
=0D
 - 01: Update library for pylint 2.9.0 which happened ~2hrs ago=0D
 - 10: Fix pylint checking stuff it shouldn't (Wainer)=0D
 - 15: Also new, it helps me along with Sphinx doc work.=0D
=0D
V2:=0D
  007/12:[0002] [FC] 'python: update help text for check-tox'=0D
  008/12:[down] 'python: Fix .PHONY Make specifiers'=0D
  009/12:[down] 'python: add 'make check-dev' invocation'=0D
=0D
 - 07: Changed '3.6-3.10' to '3.6 - 3.10'.=0D
       (Kept Willian's RB)=0D
 - 08: New, based on Wainer's observation I had missed 'check-tox'.=0D
 - 09: Renamed targets based on Wainer's review.=0D
=0D
Status:=0D
=0D
[01] python-qom-do-not-use-err-at  #              [SOB] JS=0D
[02] python-expose-typing          # [RB] WR,WdSM [SOB] JS=0D
[03] python-remove-global-pylint   # [RB] WR,WdSM [SOB] JS=0D
[04] python-re-lock-pipenv-at      # [RB] WR,WdSM [SOB] JS=0D
[05] python-readme.rst-touchups    # [RB] WR,WdSM [SOB] JS=0D
[06] python-add-no-install-usage   # [RB] WR,WdSM [SOB] JS=0D
[07] python-rename-venv-check      # [RB] WR,WdSM [SOB] JS=0D
[08] python-update-help-text-for   # [RB] WR,WdSM [SOB] JS=0D
[09] python-fix-.phony-make        # [RB] WR,WdSM [SOB] JS=0D
[10] python-only-check-qemu-subdir #              [SOB] JS=0D
[11] python-add-make-check-venv    #              [SOB] JS=0D
[12] python-update-help-text-on    # [RB] WR,WdSM [SOB] JS=0D
[13] python-update-help-text-on-1  # [RB] WR,WdSM [SOB] JS=0D
[14] python-remove-auto-generated  # [RB] WR,WdSM [SOB] JS=0D
[15] python-fix-broken-rest        #              [SOB] JS=0D
=0D
John Snow (15):=0D
  python/qom: Do not use 'err' name at module scope=0D
  python: expose typing information via PEP 561=0D
  python: Remove global pylint suppressions=0D
  python: Re-lock pipenv at *oldest* supported versions=0D
  python: README.rst touchups=0D
  python: Add no-install usage instructions=0D
  python: rename 'venv-check' target to 'check-pipenv'=0D
  python: update help text for check-tox=0D
  python: Fix .PHONY Make specifiers=0D
  python: only check qemu/ subdir with flake8=0D
  python: add 'make check-dev' invocation=0D
  python: Update help text on 'make check', 'make develop'=0D
  python: Update help text on 'make clean', 'make distclean'=0D
  python: remove auto-generated pyproject.toml file=0D
  python: Fix broken ReST docstrings=0D
=0D
 python/README.rst               |  47 ++++++++++---=0D
 .gitlab-ci.d/static_checks.yml  |   2 +-=0D
 python/Makefile                 |  89 +++++++++++++++++++------=0D
 python/Pipfile.lock             | 113 +++++++++++++++-----------------=0D
 python/qemu/machine/__init__.py |   6 +-=0D
 python/qemu/machine/machine.py  |   6 +-=0D
 python/qemu/machine/py.typed    |   0=0D
 python/qemu/machine/qtest.py    |   2 +=0D
 python/qemu/qmp/__init__.py     |   1 +=0D
 python/qemu/qmp/py.typed        |   0=0D
 python/qemu/qmp/qom.py          |   4 +-=0D
 python/qemu/qmp/qom_common.py   |   2 +-=0D
 python/qemu/utils/accel.py      |   2 +-=0D
 python/qemu/utils/py.typed      |   0=0D
 python/setup.cfg                |  14 ++--=0D
 python/tests/flake8.sh          |   2 +-=0D
 16 files changed, 186 insertions(+), 104 deletions(-)=0D
 create mode 100644 python/qemu/machine/py.typed=0D
 create mode 100644 python/qemu/qmp/py.typed=0D
 create mode 100644 python/qemu/utils/py.typed=0D
=0D
--=20=0D
2.31.1=0D
=0D


