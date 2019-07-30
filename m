Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227357AC77
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 17:36:01 +0200 (CEST)
Received: from localhost ([::1]:34004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsUAS-00016d-BF
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 11:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45148)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hsU8J-0007gx-Vw
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 11:33:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hsU8J-0004Ya-3q
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 11:33:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55192)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hsU8G-0004Vq-E4; Tue, 30 Jul 2019 11:33:44 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A5E4681DFF;
 Tue, 30 Jul 2019 15:33:43 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-75.ams2.redhat.com
 [10.36.117.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 867ED608C1;
 Tue, 30 Jul 2019 15:33:42 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 30 Jul 2019 17:33:29 +0200
Message-Id: <20190730153331.24515-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 30 Jul 2019 15:33:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/2] fdc: Fix inserting read-only media in empty
 drive
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

The following changes since commit 8517bf84056282ea3e27772d51f76db3a6fa2d=
26:

  Merge remote-tracking branch 'remotes/maxreitz/tags/pull-block-2019-07-=
30' into staging (2019-07-30 14:23:07 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 68174160144c9263366a4397ef8b417698e2735c:

  iotests/118: Test inserting a read-only medium (2019-07-30 17:32:01 +02=
00)

----------------------------------------------------------------
Block layer patches:

- fdc: Fix inserting read-only media in empty drive

----------------------------------------------------------------
Kevin Wolf (2):
      fdc: Fix inserting read-only media in empty drive
      iotests/118: Test inserting a read-only medium

 hw/block/fdc.c             | 11 ++++++++---
 tests/qemu-iotests/118     |  6 +++++-
 tests/qemu-iotests/118.out |  4 ++--
 3 files changed, 15 insertions(+), 6 deletions(-)

