Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A56BA3B8BF9
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 04:12:32 +0200 (CEST)
Received: from localhost ([::1]:37170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lymBr-000490-Ja
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 22:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym98-0008As-S8
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:09:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym92-00064X-2O
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:09:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625105372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9cCo5oYkwRip06mp8Wp0PHPo1NG3UqavPp2mB9O+g14=;
 b=JW/IGOXe312QSaqzEmatcGY/JGvRfpe5JminCShStc0eOM0VC+heQOVSFJldY5p6JGFaHq
 LbvF2kn6czFw2J3dgWNFbEA++nAApJBDLkaOJyjYRoFeshjBGlfNtVMf8NHOndLYTnLKBz
 NLHuvxQka64suU0yPMnCh+6LpoL8+bc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-IiX62R_sNxutwaFLeMavGQ-1; Wed, 30 Jun 2021 22:09:31 -0400
X-MC-Unique: IiX62R_sNxutwaFLeMavGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31E6D100B3AF;
 Thu,  1 Jul 2021 02:09:30 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76DA16788B;
 Thu,  1 Jul 2021 02:09:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/15] Python patches
Date: Wed, 30 Jun 2021 22:09:06 -0400
Message-Id: <20210701020921.1679468-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d940d468e29bff5eb5669c0dd8f3de0c3de17bfb=
:=0D
=0D
  Merge remote-tracking branch 'remotes/quic/tags/pull-hex-20210629' into s=
taging (2021-06-30 19:09:45 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/python-pull-request=0D
=0D
for you to fetch changes up to 5c02c865866fdd2d17e8f5507deb4aa1f74bf59f:=0D
=0D
  python: Fix broken ReST docstrings (2021-06-30 21:57:08 -0400)=0D
=0D
----------------------------------------------------------------=0D
Pull request=0D
=0D
Patch 01/15 fixes the check-python-tox test.=0D
=0D
----------------------------------------------------------------=0D
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
 python/.gitignore               |   1 +=0D
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
 17 files changed, 187 insertions(+), 104 deletions(-)=0D
 create mode 100644 python/qemu/machine/py.typed=0D
 create mode 100644 python/qemu/qmp/py.typed=0D
 create mode 100644 python/qemu/utils/py.typed=0D
=0D
--=20=0D
2.31.1=0D
=0D


