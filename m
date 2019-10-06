Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C441ECD92B
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Oct 2019 22:33:54 +0200 (CEST)
Received: from localhost ([::1]:36842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHDE1-0004yk-So
	for lists+qemu-devel@lfdr.de; Sun, 06 Oct 2019 16:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35718)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iHDCJ-0004SL-QL
 for qemu-devel@nongnu.org; Sun, 06 Oct 2019 16:32:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iHDCI-0007Zh-U6
 for qemu-devel@nongnu.org; Sun, 06 Oct 2019 16:32:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59218)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1iHDCA-0007X7-8D; Sun, 06 Oct 2019 16:32:04 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7B6488AC6F5;
 Sun,  6 Oct 2019 20:31:57 +0000 (UTC)
Received: from probe.redhat.com (ovpn-120-66.rdu2.redhat.com [10.10.120.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1774819C6A;
 Sun,  6 Oct 2019 20:31:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] IDE: Deprecate ide-drive
Date: Sun,  6 Oct 2019 16:31:49 -0400
Message-Id: <20191006203150.13054-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Sun, 06 Oct 2019 20:31:57 +0000 (UTC)
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
Cc: libvir-list@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



John Snow (1):
  IDE: deprecate ide-drive

 qemu-deprecated.texi          | 5 +++++
 hw/ide/qdev.c                 | 3 +++
 tests/qemu-iotests/051.pc.out | 6 ++++--
 3 files changed, 12 insertions(+), 2 deletions(-)

--=20
2.21.0


