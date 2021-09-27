Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7EF419F27
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 21:28:58 +0200 (CEST)
Received: from localhost ([::1]:36860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUwJ5-0004Jk-Ip
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 15:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwGa-0001f4-Nn
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:26:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwGY-0006JW-03
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632770776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1Y9FUNr9sJXEncOOrIzg4sKqRsMS57cPOk2sHDag7Iw=;
 b=DQDxlScqYv3RjN6IhNt319N9F9ax8WdG41RlUylR2jkz+CWp922tD6bCooovCvT1paulQ0
 rfv9baXXVIiwH09joQOPvJPhiBL2SsRkzLsa7jZ6FwyUn7mH3UDaWVpMqbF8PuY6s+sESX
 whRqmdj4E9ur0BSO+Nv1gI/QyepQk4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-kK7vg2OPNEGiyt32r72f0g-1; Mon, 27 Sep 2021 15:26:14 -0400
X-MC-Unique: kK7vg2OPNEGiyt32r72f0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 142B719200CF;
 Mon, 27 Sep 2021 19:26:13 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 736BE60938;
 Mon, 27 Sep 2021 19:25:14 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/32] Python patches
Date: Mon, 27 Sep 2021 15:24:41 -0400
Message-Id: <20210927192513.744199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit de8ed1055c2ce18c95f597eb10df360dcb534f99=
:=0D
=0D
  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-09-25-v2=
' into staging (2021-09-27 15:03:42 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/python-pull-request=0D
=0D
for you to fetch changes up to 99e45a6131a7fef19ffe0190f9c479fae4850d53:=0D
=0D
  python/aqmp-tui: Add syntax highlighting (2021-09-27 12:10:29 -0400)=0D
=0D
----------------------------------------------------------------=0D
Python Pull request=0D
=0D
----------------------------------------------------------------=0D
=0D
G S Niteesh Babu (5):=0D
  python: Add dependencies for AQMP TUI=0D
  python/aqmp-tui: Add AQMP TUI=0D
  python: Add entry point for aqmp-tui=0D
  python: add optional pygments dependency=0D
  python/aqmp-tui: Add syntax highlighting=0D
=0D
John Snow (27):=0D
  python/aqmp: add asynchronous QMP (AQMP) subpackage=0D
  python/aqmp: add error classes=0D
  python/pylint: Add exception for TypeVar names ('T')=0D
  python/aqmp: add asyncio compatibility wrappers=0D
  python/aqmp: add generic async message-based protocol support=0D
  python/aqmp: add runstate state machine to AsyncProtocol=0D
  python/aqmp: Add logging utility helpers=0D
  python/aqmp: add logging to AsyncProtocol=0D
  python/aqmp: add AsyncProtocol.accept() method=0D
  python/aqmp: add configurable read buffer limit=0D
  python/aqmp: add _cb_inbound and _cb_outbound logging hooks=0D
  python/aqmp: add AsyncProtocol._readline() method=0D
  python/aqmp: add QMP Message format=0D
  python/aqmp: add well-known QMP object models=0D
  python/aqmp: add QMP event support=0D
  python/pylint: disable too-many-function-args=0D
  python/aqmp: add QMP protocol support=0D
  python/pylint: disable no-member check=0D
  python/aqmp: Add message routing to QMP protocol=0D
  python/aqmp: add execute() interfaces=0D
  python/aqmp: add _raw() execution interface=0D
  python/aqmp: add asyncio_run compatibility wrapper=0D
  python/aqmp: add scary message=0D
  python: bump avocado to v90.0=0D
  python/aqmp: add AsyncProtocol unit tests=0D
  python/aqmp: add LineProtocol tests=0D
  python/aqmp: Add Coverage.py support=0D
=0D
 python/.gitignore              |   5 +=0D
 python/Makefile                |   9 +=0D
 python/Pipfile.lock            |  28 +-=0D
 python/avocado.cfg             |   3 +=0D
 python/qemu/aqmp/__init__.py   |  59 +++=0D
 python/qemu/aqmp/aqmp_tui.py   | 652 ++++++++++++++++++++++++=0D
 python/qemu/aqmp/error.py      |  50 ++=0D
 python/qemu/aqmp/events.py     | 706 ++++++++++++++++++++++++++=0D
 python/qemu/aqmp/message.py    | 209 ++++++++=0D
 python/qemu/aqmp/models.py     | 133 +++++=0D
 python/qemu/aqmp/protocol.py   | 902 +++++++++++++++++++++++++++++++++=0D
 python/qemu/aqmp/py.typed      |   0=0D
 python/qemu/aqmp/qmp_client.py | 621 +++++++++++++++++++++++=0D
 python/qemu/aqmp/util.py       | 217 ++++++++=0D
 python/setup.cfg               |  43 +-=0D
 python/tests/protocol.py       | 583 +++++++++++++++++++++=0D
 16 files changed, 4214 insertions(+), 6 deletions(-)=0D
 create mode 100644 python/qemu/aqmp/__init__.py=0D
 create mode 100644 python/qemu/aqmp/aqmp_tui.py=0D
 create mode 100644 python/qemu/aqmp/error.py=0D
 create mode 100644 python/qemu/aqmp/events.py=0D
 create mode 100644 python/qemu/aqmp/message.py=0D
 create mode 100644 python/qemu/aqmp/models.py=0D
 create mode 100644 python/qemu/aqmp/protocol.py=0D
 create mode 100644 python/qemu/aqmp/py.typed=0D
 create mode 100644 python/qemu/aqmp/qmp_client.py=0D
 create mode 100644 python/qemu/aqmp/util.py=0D
 create mode 100644 python/tests/protocol.py=0D
=0D
--=20=0D
2.31.1=0D
=0D


