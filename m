Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8560CB8E2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 13:06:06 +0200 (CEST)
Received: from localhost ([::1]:46266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGLPR-00012T-51
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 07:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58001)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iGKNo-00035P-Vf
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 06:00:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iGKNm-0007BJ-Ih
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 06:00:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42224)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iGKNc-00076j-FN; Fri, 04 Oct 2019 06:00:09 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4F3C13066FBF;
 Fri,  4 Oct 2019 10:00:06 +0000 (UTC)
Received: from linux.fritz.box.com (unknown [10.36.118.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37FEE60852;
 Fri,  4 Oct 2019 10:00:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL v3 0/4] Block layer patches
Date: Fri,  4 Oct 2019 11:59:55 +0200
Message-Id: <20191004095959.22891-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 04 Oct 2019 10:00:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 4f59102571fce49af180cfc6d4cdd2b5df7bdb=
14:

  Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-oct-01-=
2019' into staging (2019-10-01 16:21:42 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 7e693a0500455edab21754573c32b7146138cffd:

  iotests: Remove Python 2 compatibility code (2019-10-04 11:59:16 +0200)

----------------------------------------------------------------
Block layer patches:

- Fix internal snapshots with typical -blockdev setups
- iotests: Require Python 3.6 or later

----------------------------------------------------------------
Kevin Wolf (4):
      block/snapshot: Restrict set of snapshot nodes
      iotests: Test internal snapshots with -blockdev
      iotests: Require Python 3.6 or later
      iotests: Remove Python 2 compatibility code

 block/snapshot.c                 |  26 ++++--
 tests/qemu-iotests/044           |   3 -
 tests/qemu-iotests/163           |   3 -
 tests/qemu-iotests/267           | 168 +++++++++++++++++++++++++++++++++=
+++
 tests/qemu-iotests/267.out       | 182 +++++++++++++++++++++++++++++++++=
++++++
 tests/qemu-iotests/check         |  13 ++-
 tests/qemu-iotests/common.filter |  11 ++-
 tests/qemu-iotests/group         |   1 +
 tests/qemu-iotests/iotests.py    |  13 +--
 9 files changed, 392 insertions(+), 28 deletions(-)
 create mode 100755 tests/qemu-iotests/267
 create mode 100644 tests/qemu-iotests/267.out

