Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779283B769B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 18:46:29 +0200 (CEST)
Received: from localhost ([::1]:50246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyGsV-0006B4-Sn
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 12:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyGpL-0003a9-LS
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:43:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyGpI-000664-Oi
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:43:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624984988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0s2FJFfYICLNCT7k4LAzT3f+YWWf2l2uN4eH3r1PqGo=;
 b=XIOF2SuEFidBUNLFHsnlGU9vR7f8g7GXJIVj1tb7TYxHA14o/nkcxTGXy8iA0PY3ZENayV
 XOxLkfN+kvaX3oDCe62+JHeBLAG1vpa5Kviokwr2S47G4gA/wKDHwqzrB2Pu3AMobnyMbA
 mZEnqKPn8QQGNvCOqPvMl9zOmIYgimY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-tH_a1ZSFM1SVr9G9KxBz4g-1; Tue, 29 Jun 2021 12:43:04 -0400
X-MC-Unique: tH_a1ZSFM1SVr9G9KxBz4g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C3A31084F40;
 Tue, 29 Jun 2021 16:43:03 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FB1B19C79;
 Tue, 29 Jun 2021 16:42:53 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/12] Python: packaging cleanups
Date: Tue, 29 Jun 2021 12:42:41 -0400
Message-Id: <20210629164253.1272763-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series is a collection of touchups and small fixes to the Python=0D
packaging series that was initiated with commit ea1213b7.=0D
=0D
It fixes a small handful of annoyances and adjusts some readme files,=0D
help text, and so on.=0D
=0D
I'd like to make sure this is included prior to the 6.1 RC testing=0D
period.=0D
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
  [01] python-expose-typing         # [RB] WR,WdSM [SOB] JS=0D
  [02] python-remove-global-pylint  # [RB] WR,WdSM [SOB] JS=0D
  [03] python-re-lock-pipenv-at     # [RB] WR,WdSM [SOB] JS=0D
  [04] python-readme.rst-touchups   # [RB] WR,WdSM [SOB] JS=0D
  [05] python-add-no-install-usage  # [RB] WR,WdSM [SOB] JS=0D
  [06] python-rename-venv-check     # [RB] WR,WdSM [SOB] JS=0D
  [07] python-update-help-text-for  # [RB] WR      [SOB] JS=0D
  [08] python-fix-.phony-make       #              [SOB] JS=0D
  [09] python-add-make-check-venv   #              [SOB] JS=0D
  [10] python-update-help-text-on   # [RB] WR,WdSM [SOB] JS=0D
  [11] python-update-help-text-on-1 # [RB] WR,WdSM [SOB] JS=0D
  [12] python-remove-auto-generated # [RB] WR,WdSM [SOB] JS=0D
=0D
John Snow (12):=0D
  python: expose typing information via PEP 561=0D
  python: Remove global pylint suppressions=0D
  python: Re-lock pipenv at *oldest* supported versions=0D
  python: README.rst touchups=0D
  python: Add no-install usage instructions=0D
  python: rename 'venv-check' target to 'check-pipenv'=0D
  python: update help text for check-tox=0D
  python: Fix .PHONY Make specifiers=0D
  python: add 'make check-dev' invocation=0D
  python: Update help text on 'make check', 'make develop'=0D
  python: Update help text on 'make clean', 'make distclean'=0D
  python: remove auto-generated pyproject.toml file=0D
=0D
 python/README.rst              |  47 +++++++++++---=0D
 .gitlab-ci.d/static_checks.yml |   2 +-=0D
 python/Makefile                |  89 ++++++++++++++++++++------=0D
 python/Pipfile.lock            | 113 ++++++++++++++++-----------------=0D
 python/qemu/machine/machine.py |   3 +=0D
 python/qemu/machine/py.typed   |   0=0D
 python/qemu/machine/qtest.py   |   2 +=0D
 python/qemu/qmp/py.typed       |   0=0D
 python/qemu/utils/py.typed     |   0=0D
 python/setup.cfg               |  12 ++--=0D
 10 files changed, 175 insertions(+), 93 deletions(-)=0D
 create mode 100644 python/qemu/machine/py.typed=0D
 create mode 100644 python/qemu/qmp/py.typed=0D
 create mode 100644 python/qemu/utils/py.typed=0D
=0D
--=20=0D
2.31.1=0D
=0D


