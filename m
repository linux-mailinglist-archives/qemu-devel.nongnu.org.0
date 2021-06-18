Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3723AD5A2
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:07:53 +0200 (CEST)
Received: from localhost ([::1]:57474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNaa-0001XO-PV
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNXu-0006oB-Pn
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNXq-000622-Rj
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7Pd8A5xrZGFuElsv3BpaIVmOAmIdDniysSBtPoEgO44=;
 b=XfX2Iq4FubBrpsrKKpaJ4gp02TXEm+fIvtDk0S7rnhHu+3HWV10twj9unRUsxtVwHezqMj
 kj9wWSQtiQzG7OSo/kDz5Dg+w6lAcv4+JQ6iJio68MVuGMK1h/bucGtBIVBgeOwiOP43XZ
 MSM7DkSY6sNr5uARy5P9P500JgA0/dY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-jaiDqHB0OHKwfKsUvVE6KA-1; Fri, 18 Jun 2021 19:04:58 -0400
X-MC-Unique: jaiDqHB0OHKwfKsUvVE6KA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D65E6801B0A;
 Fri, 18 Jun 2021 23:04:57 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A6241017CE5;
 Fri, 18 Jun 2021 23:04:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/72] Python patches
Date: Fri, 18 Jun 2021 19:03:43 -0400
Message-Id: <20210618230455.2891199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 3ccf6cd0e3e1dfd663814640b3b18b55715d7a75=
:=0D
=0D
  Merge remote-tracking branch 'remotes/kraxel/tags/audio-20210617-pull-req=
uest' into staging (2021-06-18 09:54:42 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/python-pull-request=0D
=0D
for you to fetch changes up to d08caefe6648fc0713af5361e2b88bee53b67ebb:=0D
=0D
  scripts/qmp-shell: add redirection shim (2021-06-18 16:10:07 -0400)=0D
=0D
----------------------------------------------------------------=0D
Python Pull request=0D
=0D
Moves QMP-related tools not used for build or automatic testing from=0D
scripts/ to python/qemu/qmp/ where they will be protected from bitrot by=0D
the check-python-* CI jobs.=0D
=0D
stub forwarders are left in the old locations for now.=0D
=0D
----------------------------------------------------------------=0D
=0D
John Snow (72):=0D
  python/pipenv: Update Pipfile.lock=0D
  python/qmp: Fix type of SocketAddrT=0D
  python/qmp: add parse_address classmethod=0D
  python/qmp: Add qom script rewrites=0D
  python/qmp: add qom script entry points=0D
  scripts/qmp: redirect qom-xxx scripts to python/qemu/qmp/=0D
  scripts/qom-fuse: apply isort rules=0D
  scripts/qom-fuse: apply flake8 rules=0D
  python: Add 'fh' to known-good variable names=0D
  scripts/qom-fuse: Apply pylint rules=0D
  scripts/qom-fuse: Add docstrings=0D
  scripts/qom-fuse: Convert to QOMCommand=0D
  scripts/qom-fuse: use QOMCommand.qom_list()=0D
  scripts/qom-fuse: ensure QOMFuse.read always returns bytes=0D
  scripts/qom-fuse: add static type hints=0D
  python: add optional FUSE dependencies=0D
  scripts/qom-fuse: move to python/qemu/qmp/qom_fuse.py=0D
  scripts/qom-fuse: add redirection shim to python/qemu/qmp/qom-fuse.py=0D
  python/qmp: add fuse command to 'qom' tools=0D
  scripts/qemu-ga-client: apply isort rules=0D
  scripts/qemu-ga-client: apply (most) flake8 rules=0D
  scripts/qemu-ga-client: Fix exception handling=0D
  scripts/qemu-ga-client: replace deprecated optparse with argparse=0D
  scripts/qemu-ga-client: add module docstring=0D
  scripts/qemu-ga-client: apply (most) pylint rules=0D
  python/qmp: Correct type of QMPReturnValue=0D
  scripts/qemu-ga-client: add mypy type hints=0D
  scripts/qemu-ga-client: move to python/qemu/qmp/qemu_ga_client.py=0D
  python/qemu-ga-client: add entry point=0D
  scripts/qemu-ga-client: Add forwarder shim=0D
  scripts/qmp-shell: apply isort rules=0D
  scripts/qmp-shell: Apply flake8 rules=0D
  scripts/qmp-shell: fix show_banner signature=0D
  scripts/qmp-shell: fix exception handling=0D
  scripts/qmp-shell: fix connect method signature=0D
  scripts/qmp-shell: remove shadowed variable from _print()=0D
  scripts/qmp-shell: use @classmethod where appropriate=0D
  scripts/qmp-shell: Use python3-style super()=0D
  scripts/qmp-shell: declare verbose in __init__=0D
  scripts/qmp-shell: use triple-double-quote docstring style=0D
  scripts/qmp-shell: ignore visit_Name name=0D
  scripts/qmp-shell: make QMPCompleter returns explicit=0D
  scripts/qmp-shell: rename one and two-letter variables=0D
  scripts/qmp-shell: fix shell history exception handling=0D
  scripts/qmp-shell: remove if-raise-else patterns=0D
  scripts/qmp-shell: use isinstance() instead of type()=0D
  scripts/qmp-shell: use argparse=0D
  scripts/qmp-shell: Add pretty attribute to HMP shell=0D
  scripts/qmp-shell: Make verbose a public attribute=0D
  scripts/qmp-shell: move get_prompt() to prompt property=0D
  scripts/qmp-shell: remove prompt argument from read_exec_command=0D
  scripts/qmp-shell: move the REPL functionality into QMPShell=0D
  scripts/qmp-shell: Fix "FuzzyJSON" parser=0D
  scripts/qmp-shell: refactor QMPCompleter=0D
  scripts/qmp-shell: initialize completer early=0D
  python/qmp: add QMPObject type alias=0D
  scripts/qmp-shell: add mypy types=0D
  scripts/qmp-shell: Accept SocketAddrT instead of string=0D
  scripts/qmp-shell: unprivatize 'pretty' property=0D
  python/qmp: return generic type from context manager=0D
  scripts/qmp-shell: Use context manager instead of atexit=0D
  scripts/qmp-shell: use logging to show warnings=0D
  scripts/qmp-shell: remove TODO=0D
  scripts/qmp-shell: Fix empty-transaction invocation=0D
  scripts/qmp-shell: Remove too-broad-exception=0D
  scripts/qmp-shell: convert usage comment to docstring=0D
  scripts/qmp-shell: remove double-underscores=0D
  scripts/qmp-shell: make QMPShellError inherit QMPError=0D
  scripts/qmp-shell: add docstrings=0D
  scripts/qmp-shell: move to python/qemu/qmp/qmp_shell.py=0D
  python: add qmp-shell entry point=0D
  scripts/qmp-shell: add redirection shim=0D
=0D
 python/Pipfile.lock               |  97 +++++-=0D
 python/qemu/qmp/__init__.py       |  61 +++-=0D
 python/qemu/qmp/qemu_ga_client.py | 323 ++++++++++++++++++=0D
 python/qemu/qmp/qmp_shell.py      | 535 ++++++++++++++++++++++++++++++=0D
 python/qemu/qmp/qom.py            | 272 +++++++++++++++=0D
 python/qemu/qmp/qom_common.py     | 178 ++++++++++=0D
 python/qemu/qmp/qom_fuse.py       | 206 ++++++++++++=0D
 python/setup.cfg                  |  35 +-=0D
 scripts/qmp/qemu-ga-client        | 297 +----------------=0D
 scripts/qmp/qmp-shell             | 454 +------------------------=0D
 scripts/qmp/qom-fuse              | 144 +-------=0D
 scripts/qmp/qom-get               |  66 +---=0D
 scripts/qmp/qom-list              |  63 +---=0D
 scripts/qmp/qom-set               |  63 +---=0D
 scripts/qmp/qom-tree              |  74 +----=0D
 15 files changed, 1713 insertions(+), 1155 deletions(-)=0D
 create mode 100644 python/qemu/qmp/qemu_ga_client.py=0D
 create mode 100644 python/qemu/qmp/qmp_shell.py=0D
 create mode 100644 python/qemu/qmp/qom.py=0D
 create mode 100644 python/qemu/qmp/qom_common.py=0D
 create mode 100644 python/qemu/qmp/qom_fuse.py=0D
=0D
--=20=0D
2.31.1=0D
=0D


