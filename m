Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1BB694F4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 16:55:07 +0200 (CEST)
Received: from localhost ([::1]:39732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn2Ne-0007uT-Hv
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 10:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40827)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <thuth@redhat.com>) id 1hn2NK-00076i-7G
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:54:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hn2NJ-0004IG-8o
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 10:54:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39838)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hn2NH-0004Fs-Cr; Mon, 15 Jul 2019 10:54:43 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 63E2930842A0;
 Mon, 15 Jul 2019 14:54:42 +0000 (UTC)
Received: from thuth.com (reserved-198-198.str.redhat.com [10.33.198.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5345360C4C;
 Mon, 15 Jul 2019 14:54:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 16:54:36 +0200
Message-Id: <20190715145438.6880-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 15 Jul 2019 14:54:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] Enable iotests during "make check"
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First patch removes some more problematic tests from the "auto" group,
so that we can finally enable the "iotests" during "make check" in the
second patch.

Thomas Huth (2):
  tests/qemu-iotests/group: Remove some more tests from the "auto" group
  tests: Run the iotests during "make check" again

 tests/Makefile.include      |   8 +--
 tests/check-block.sh        |  44 +++++++++++----
 tests/qemu-iotests-quick.sh |   8 ---
 tests/qemu-iotests/group    | 109 ++++++++++++++++++------------------
 4 files changed, 93 insertions(+), 76 deletions(-)
 delete mode 100755 tests/qemu-iotests-quick.sh

--=20
2.21.0


