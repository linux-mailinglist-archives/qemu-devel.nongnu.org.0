Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1731A67092
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 15:53:29 +0200 (CEST)
Received: from localhost ([::1]:49664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlvzL-0004Ep-Si
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 09:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32895)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hlvyx-0003RI-Jm
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 09:53:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hlvyw-0001Xo-ME
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 09:53:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38778)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hlvyu-0001Ut-Hk; Fri, 12 Jul 2019 09:53:00 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A4673307D874;
 Fri, 12 Jul 2019 13:52:59 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
 [10.33.200.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B91F25D739;
 Fri, 12 Jul 2019 13:52:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 12 Jul 2019 15:52:51 +0200
Message-Id: <20190712135253.9410-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 12 Jul 2019 13:52:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/2] Block layer patches
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

The following changes since commit a2a9d4adabe340617a24eb73a8b2a116d28a6b=
38:

  Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-4.1-20190712=
' into staging (2019-07-12 11:06:48 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 867eccfed84f96b54f4a432c510a02c2ce03b430:

  file-posix: Use max transfer length/segment count only for SCSI passthr=
ough (2019-07-12 15:42:23 +0200)

----------------------------------------------------------------
Block layer patches:

- file-posix: Fix max transfer length for non-SCSI-passthrough
- iotests: Fix 082 reference output

----------------------------------------------------------------
Eric Blake (1):
      iotests: Update 082 expected output

Maxim Levitsky (1):
      file-posix: Use max transfer length/segment count only for SCSI pas=
sthrough

 block/file-posix.c         | 54 ++++++++++++++++++++++++----------------=
------
 tests/qemu-iotests/082.out | 54 +++++++++++++++++++++++-----------------=
------
 2 files changed, 55 insertions(+), 53 deletions(-)

