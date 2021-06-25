Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852FF3B46E5
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 17:48:05 +0200 (CEST)
Received: from localhost ([::1]:48630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwo3o-0003OY-1k
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 11:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwo1q-0000eL-9S
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 11:46:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwo1n-0007Tl-PZ
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 11:46:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624635958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OVnpPRi4mFLlevC58cHc0iFSc7KJYZdyDGlyxpSLDQ0=;
 b=Ezc/DupFo0MkFpt0dzh3g9OP7ZnA7XLIXFIHxaWX5QuibjJ3GezLlkRmh1aHmFQFLErYCC
 cyfQuXAVfwVttsjhyGVgm0NneuM+bxInZe5c95kTMKvXEV7MZyxw/4XursQbTKNiNfKzyS
 nBAkfMdzOI0AHbL/BiYuOVAnzsWug4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-O61S_h3ENLCDVONy2naQWw-1; Fri, 25 Jun 2021 11:45:55 -0400
X-MC-Unique: O61S_h3ENLCDVONy2naQWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 622089F92A;
 Fri, 25 Jun 2021 15:45:54 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD9901A86F;
 Fri, 25 Jun 2021 15:45:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] Python: packaging cleanups
Date: Fri, 25 Jun 2021 11:45:29 -0400
Message-Id: <20210625154540.783306-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
period.=0D
=0D
John Snow (11):=0D
  python: expose typing information via PEP 561=0D
  python: Remove global pylint suppressions=0D
  python: Re-lock pipenv at *oldest* supported versions=0D
  python: README.rst touchups=0D
  python: Add no-install usage instructions=0D
  python: rename 'venv-check' target to 'check-pipenv'=0D
  python: update help text for check-tox=0D
  python: add 'make check-venv' invocation=0D
  python: Update help text on 'make check', 'make develop'=0D
  python: Update help text on 'make clean', 'make distclean'=0D
  python: remove auto-generated pyproject.toml file=0D
=0D
 python/README.rst              |  47 +++++++++++---=0D
 .gitlab-ci.d/static_checks.yml |   2 +-=0D
 python/Makefile                |  81 +++++++++++++++++------=0D
 python/Pipfile.lock            | 113 ++++++++++++++++-----------------=0D
 python/qemu/machine/machine.py |   3 +=0D
 python/qemu/machine/py.typed   |   0=0D
 python/qemu/machine/qtest.py   |   2 +=0D
 python/qemu/qmp/py.typed       |   0=0D
 python/qemu/utils/py.typed     |   0=0D
 python/setup.cfg               |  12 ++--=0D
 10 files changed, 167 insertions(+), 93 deletions(-)=0D
 create mode 100644 python/qemu/machine/py.typed=0D
 create mode 100644 python/qemu/qmp/py.typed=0D
 create mode 100644 python/qemu/utils/py.typed=0D
=0D
--=20=0D
2.31.1=0D
=0D


