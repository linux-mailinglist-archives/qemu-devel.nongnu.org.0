Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2898642AF26
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 23:44:24 +0200 (CEST)
Received: from localhost ([::1]:49612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maPZP-0004uN-34
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 17:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maPXZ-0003ek-SL
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:42:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maPXX-0007Zd-4i
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:42:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634074946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/N1hz+vfiE05CCD07/1H7+60TEoF4s1sJO1Epznmgzk=;
 b=GZFR5vaVM/fKFzRZKOu2p/SwoK8pUR5xEQ0bioV4DB0b5/3ad3P0Jr60Qec5AaRzapUbrS
 DodsxUICeFZaJrUOVxPWGVMxW5b1AdkEYQqnw29sHKNBSAJ9M9Dsr0ya0XRVLVdTjr4xrm
 U8xG6gWXl2p7n8V4KMyG5iFyX1uSwGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-bYKOBZm-NYW6V3Tp2LS28g-1; Tue, 12 Oct 2021 17:42:25 -0400
X-MC-Unique: bYKOBZm-NYW6V3Tp2LS28g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F170800FF0;
 Tue, 12 Oct 2021 21:42:24 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2946E5F4E2;
 Tue, 12 Oct 2021 21:41:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/10] Python patches
Date: Tue, 12 Oct 2021 17:41:42 -0400
Message-Id: <20211012214152.802483-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit bfd9a76f9c143d450ab5545dedfa74364b39fc56=
:=0D
=0D
  Merge remote-tracking branch 'remotes/stsquad/tags/pull-for-6.2-121021-2'=
 into staging (2021-10-12 06:16:25 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/jsnow/qemu.git tags/python-pull-request=0D
=0D
for you to fetch changes up to c163c723ef92d0f629d015902396f2c67328b2e5:=0D
=0D
  python, iotests: remove socket_scm_helper (2021-10-12 12:22:11 -0400)=0D
=0D
----------------------------------------------------------------=0D
Pull request=0D
=0D
----------------------------------------------------------------=0D
=0D
John Snow (10):=0D
  python/aqmp: add greeting property to QMPClient=0D
  python/aqmp: add .empty() method to EventListener=0D
  python/aqmp: Return cleared events from EventListener.clear()=0D
  python/aqmp: add send_fd_scm=0D
  python/aqmp: Add dict conversion method to Greeting object=0D
  python/aqmp: Reduce severity of EOFError-caused loop terminations=0D
  python/aqmp: Disable logging messages by default=0D
  python/qmp: clear events on get_events() call=0D
  python/qmp: add send_fd_scm directly to QEMUMonitorProtocol=0D
  python, iotests: remove socket_scm_helper=0D
=0D
 tests/qemu-iotests/socket_scm_helper.c | 136 -------------------------=0D
 python/qemu/aqmp/__init__.py           |   4 +=0D
 python/qemu/aqmp/events.py             |  15 ++-=0D
 python/qemu/aqmp/models.py             |  13 +++=0D
 python/qemu/aqmp/protocol.py           |   7 +-=0D
 python/qemu/aqmp/qmp_client.py         |  27 +++++=0D
 python/qemu/machine/machine.py         |  48 ++-------=0D
 python/qemu/machine/qtest.py           |   2 -=0D
 python/qemu/qmp/__init__.py            |  27 +++--=0D
 python/qemu/qmp/qmp_shell.py           |   1 -=0D
 tests/Makefile.include                 |   1 -=0D
 tests/meson.build                      |   4 -=0D
 tests/qemu-iotests/iotests.py          |   3 -=0D
 tests/qemu-iotests/meson.build         |   5 -=0D
 tests/qemu-iotests/testenv.py          |   8 +-=0D
 15 files changed, 85 insertions(+), 216 deletions(-)=0D
 delete mode 100644 tests/qemu-iotests/socket_scm_helper.c=0D
 delete mode 100644 tests/qemu-iotests/meson.build=0D
=0D
--=20=0D
2.31.1=0D
=0D


