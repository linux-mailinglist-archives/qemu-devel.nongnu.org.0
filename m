Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9806833E7E0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 04:54:24 +0100 (CET)
Received: from localhost ([::1]:43110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMNGJ-0004fA-Kh
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 23:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lMNEr-0003E2-P7
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:52:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lMNEp-0002xO-UE
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615953171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dWnIOU5IKIBlQP30IBMXBagzbLD0IG94nMAu9q1plPM=;
 b=e9QGqNiShYwAxLIqNSiokmw3UtvN1UGxzPr5sJVmSXkViyjI3ZHeMiM7G89i6ENgDMmFSN
 rMTz/yet8iBIjYaGxsFwLktjFPZEP7wKqkUkrxJhdLnhfBfIero28UQzYhB/1DLtywVdS7
 y4uJMdWgqbKVFmcXVTmI/olJCI+JVGc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-B2a4oaeAPn6lmw6AVLrhMg-1; Tue, 16 Mar 2021 23:52:49 -0400
X-MC-Unique: B2a4oaeAPn6lmw6AVLrhMg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AF4880006E;
 Wed, 17 Mar 2021 03:52:48 +0000 (UTC)
Received: from localhost.net (ovpn-113-107.rdu2.redhat.com [10.10.113.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B555E5D9C0;
 Wed, 17 Mar 2021 03:52:43 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/5] Acceptance Tests and Python libs patches for 2021-03-16
Date: Tue, 16 Mar 2021 23:52:37 -0400
Message-Id: <20210317035242.24418-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 5b7f5586d182b0cafb1f8d558992a14763e2953e=
:=0D
=0D
  Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210315-pull-reque=
st=3D=0D
' into staging (2021-03-16 13:17:54 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/cleber.gnu/qemu.git/ tags/python-next-pull-request=0D
=0D
for you to fetch changes up to affc55e761ea4c96b9b2de582d813787a317aeda:=0D
=0D
  tests/acceptance: linux-related tests fix (2021-03-16 22:24:44 -0400)=0D
=0D
----------------------------------------------------------------=0D
Acceptance and Python Test Improvements=0D
=0D
Small collection of Acceptance and Python tests/improvements.=0D
=0D
GitLab CI pipeline: https://gitlab.com/cleber.gnu/qemu/-/pipelines/27167093=
0=0D
=0D
----------------------------------------------------------------=0D
=0D
Hyman (1):=0D
  tests/migration: fix unix socket batch migration=0D
=0D
Jagannathan Raman (1):=0D
  tests: Add functional test for out-of-process device emulation=0D
=0D
Pavel Dovgalyuk (1):=0D
  tests/acceptance: linux-related tests fix=0D
=0D
Wainer dos Santos Moschetta (1):=0D
  tests/acceptance: Print expected message on wait_for_console_pattern=0D
=0D
Willian Rampazzo (1):=0D
  avocado_qemu: add exec_command function=0D
=0D
 tests/acceptance/avocado_qemu/__init__.py | 23 +++++-=0D
 tests/acceptance/multiprocess.py          | 95 +++++++++++++++++++++++=0D
 tests/migration/guestperf/engine.py       |  7 ++=0D
 3 files changed, 121 insertions(+), 4 deletions(-)=0D
 create mode 100644 tests/acceptance/multiprocess.py=0D
=0D
--=3D20=0D
2.30.2=0D
=0D


