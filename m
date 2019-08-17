Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F154690B8D
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Aug 2019 01:50:42 +0200 (CEST)
Received: from localhost ([::1]:33586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hylzW-0003SK-3L
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 19:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47595)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1hylSA-0001ZJ-5l
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 19:16:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hylS9-0007pa-2E
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 19:16:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48128)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hylS8-0007pH-TC; Fri, 16 Aug 2019 19:16:13 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3B0E2308FE9A;
 Fri, 16 Aug 2019 23:16:12 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-187.bos.redhat.com [10.18.17.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73F6A18118;
 Fri, 16 Aug 2019 23:16:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 16 Aug 2019 19:16:06 -0400
Message-Id: <20190816231609.9521-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 16 Aug 2019 23:16:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/3] Ide patches
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
Cc: peter.maydell@linaro.org, jsnow@redhat.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit afd760539308a5524accf964107cdb1d54a059=
e3:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-201=
90816' into staging (2019-08-16 17:21:40 +0100)

are available in the Git repository at:

  https://github.com/jnsnow/qemu.git tags/ide-pull-request

for you to fetch changes up to 614ab7d127536655ef105d4153ea264c88e855c1:

  hw/ide/atapi: Use the ldst API (2019-08-16 19:14:04 -0400)

----------------------------------------------------------------
Pull request

Stable notes: patches one and two can be considered
              for the next -stable release.

----------------------------------------------------------------

John Snow (1):
  Revert "ide/ahci: Check for -ECANCELED in aio callbacks"

Paolo Bonzini (1):
  dma-helpers: ensure AIO callback is invoked after cancellation

Philippe Mathieu-Daud=C3=A9 (1):
  hw/ide/atapi: Use the ldst API

 dma-helpers.c  | 13 +++++---
 hw/ide/ahci.c  |  3 --
 hw/ide/atapi.c | 80 ++++++++++++++++++--------------------------------
 hw/ide/core.c  | 14 ---------
 4 files changed, 37 insertions(+), 73 deletions(-)

--=20
2.21.0


