Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B35BBB07
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 20:13:35 +0200 (CEST)
Received: from localhost ([::1]:60608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCSq6-0001of-TY
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 14:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47322)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iCSoO-0000tg-I5
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 14:11:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iCSoN-0000iP-9E
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 14:11:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:8532)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1iCSoN-0000hz-3I
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 14:11:47 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 67DA5300C72B;
 Mon, 23 Sep 2019 18:11:46 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-231.bos.redhat.com [10.18.17.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D019A1001B00;
 Mon, 23 Sep 2019 18:11:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] docker: misc cleanups
Date: Mon, 23 Sep 2019 14:11:34 -0400
Message-Id: <20190923181140.7235-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Mon, 23 Sep 2019 18:11:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This should include anything I've sent so far (not including the RFC for
more exploratory changes) that hasn't already been included in a roundup
by Alex Benn=C3=A9e.

Mostly, it removes unused docker files and replaces python2 with python3
in all of the container environments.

V3:
- Reorder patches to remove everything first, THEN patch for python3
- Split removal of debian-ports and debian-sid into two patches.

V2:
- Rolled in python2 --> python3 conversion
- Added travis conversion to python patch
- Remove debian8 dockerfile, which is also now unused.

John Snow (6):
  docker: remove debian8-mxe definitions
  docker: removed unused debian8 partial image
  docker: remove 'deprecated' image definitions
  docker: remove unused debian-ports
  docker: remove unused debian-sid
  docker: move tests from python2 to python3

 tests/docker/Makefile.include                 |  9 +++--
 tests/docker/dockerfiles/centos7.docker       |  2 +-
 tests/docker/dockerfiles/debian-ports.docker  | 36 -------------------
 tests/docker/dockerfiles/debian-sid.docker    | 35 ------------------
 .../dockerfiles/debian-xtensa-cross.docker    |  2 +-
 tests/docker/dockerfiles/debian10.docker      |  2 +-
 tests/docker/dockerfiles/debian8.docker       | 34 ------------------
 tests/docker/dockerfiles/debian9.docker       |  2 +-
 tests/docker/dockerfiles/travis.docker        |  2 +-
 tests/docker/dockerfiles/ubuntu.docker        |  2 +-
 tests/docker/dockerfiles/ubuntu1804.docker    |  2 +-
 11 files changed, 11 insertions(+), 117 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/debian-ports.docker
 delete mode 100644 tests/docker/dockerfiles/debian-sid.docker
 delete mode 100644 tests/docker/dockerfiles/debian8.docker

--=20
2.21.0


