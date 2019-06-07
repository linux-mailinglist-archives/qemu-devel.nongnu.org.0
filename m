Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61A639248
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 18:38:04 +0200 (CEST)
Received: from localhost ([::1]:49462 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZHsR-0003Cx-PG
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 12:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48703)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <crosa@redhat.com>) id 1hZGhd-0004vo-5m
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:22:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1hZGhb-0005Ri-P1
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:22:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36362)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1hZGhb-0005Lh-JQ
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:22:47 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BD1AEC0741ED;
 Fri,  7 Jun 2019 15:22:37 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-122-62.rdu2.redhat.com
 [10.10.122.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5395B842B0;
 Fri,  7 Jun 2019 15:22:30 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Jun 2019 11:22:15 -0400
Message-Id: <20190607152223.9467-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 07 Jun 2019 15:22:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/8] Miscellaneous acceptance test and Travis
 CI improvements
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a collection of small improvements to some of the acceptance
tests, and the Travis CI experience.

The main goal was to make tests a bit more robust when run in parallel
(an Avocado feature pending review), and Travis CI diagnostics better
by printing out the full Avocado job log when any error or test
failure occurs.

Cleber Rosa (8):
  Travis: print acceptance tests logs in case of job failure
  tests/requirements.txt: pin paramiko version requirement
  Acceptance tests: drop left over usage of ":avocado: enable"
  Boot Linux Console Test: add a test for ppc64 + pseries
  VNC Acceptance test: use UNIX domain sockets to avoid port collisions
  VNC Acceptance test: simplify test names
  VNC Acceptance test: check protocol version
  Migration acceptance test: reduce the possibility of port collisions

 .travis.yml                            |  4 ++-
 tests/acceptance/boot_linux_console.py | 19 ++++++++++++++
 tests/acceptance/migration.py          |  5 +---
 tests/acceptance/vnc.py                | 36 +++++++++++++++++++++++---
 tests/requirements.txt                 |  2 +-
 5 files changed, 56 insertions(+), 10 deletions(-)

--=20
2.21.0


