Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B117A6DC
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 13:26:16 +0200 (CEST)
Received: from localhost ([::1]:59832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsQGl-0005Gk-VO
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 07:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52199)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hsQFD-0003Xd-Fs
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 07:24:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hsQFB-0006fw-82
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 07:24:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34520)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hsQF5-0006ck-GN; Tue, 30 Jul 2019 07:24:31 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B55063082AEF;
 Tue, 30 Jul 2019 11:24:29 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-75.ams2.redhat.com
 [10.36.117.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A6F1B6092F;
 Tue, 30 Jul 2019 11:24:28 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 30 Jul 2019 13:24:21 +0200
Message-Id: <20190730112425.21497-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 30 Jul 2019 11:24:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/4] Block layer and multiboot test patches
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

The following changes since commit ee9545ed1543020fba52fa5fb8f2b71c63e538=
9f:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into stagi=
ng (2019-07-30 09:43:32 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 7cef3d1290c9d675deff95029ba78e51fb727125:

  scsi-cd: Fix inserting read-only media in empty drive (2019-07-30 13:21=
:38 +0200)

----------------------------------------------------------------
Block layer patches:

- scsi-cd: Fix inserting read-only media in empty drive
- block/copy-on-read: Fix permissions for inactive node
- Test case fixes

----------------------------------------------------------------
Andrey Shinkevich (1):
      Fixes: add read-zeroes to 051.out

Kevin Wolf (3):
      tests/multiboot: Fix load address of test kernels
      block/copy-on-read: Fix permissions for inactive node
      scsi-cd: Fix inserting read-only media in empty drive

 block/copy-on-read.c       | 16 +++++++---------
 hw/scsi/scsi-disk.c        | 10 ++++++++--
 tests/multiboot/link.ld    |  6 +++---
 tests/qemu-iotests/051.out | 10 +++++-----
 4 files changed, 23 insertions(+), 19 deletions(-)

