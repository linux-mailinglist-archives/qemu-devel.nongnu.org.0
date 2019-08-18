Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D9A91A46
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 01:21:09 +0200 (CEST)
Received: from localhost ([::1]:43644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzUTz-0004ql-SC
	for lists+qemu-devel@lfdr.de; Sun, 18 Aug 2019 19:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50850)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1hzURa-0002yD-3t
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 19:18:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hzURY-0000f1-Ti
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 19:18:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59270)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hzURY-0000eY-Or
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 19:18:36 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BE93781DEC;
 Sun, 18 Aug 2019 23:18:35 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-33.brq.redhat.com [10.40.204.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B09A758C87;
 Sun, 18 Aug 2019 23:18:30 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 01:18:23 +0200
Message-Id: <20190818231827.27573-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Sun, 18 Aug 2019 23:18:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/4] docker: Update Travis-CI image to run
 acceptance tests
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds a 'test-acceptance' Docker target, so we can
run 'make docker-test-acceptance@travis' similarly to how the
Travis-CI service runs its builds.

This is particularly useful to debug Travis-CI failures locally.

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (4):
  tests/docker: Use one package per line to improve readability
  tests/docker: update our Travis image to run acceptance tests locally
  tests/docker: Add test-acceptance runner
  tests/docker: Use Travis-CI default environment variables

 tests/docker/dockerfiles/travis.docker | 22 ++++++++++++++++++----
 tests/docker/test-acceptance           | 21 +++++++++++++++++++++
 2 files changed, 39 insertions(+), 4 deletions(-)
 create mode 100755 tests/docker/test-acceptance

--=20
2.20.1


