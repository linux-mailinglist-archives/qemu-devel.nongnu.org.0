Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16835606D2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 15:49:46 +0200 (CEST)
Received: from localhost ([::1]:53332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjOau-0001OU-3K
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 09:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40897)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hjOUD-0007dj-TS
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 09:42:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hjOUC-0007hN-RF
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 09:42:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51554)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hjOUC-0007gV-JI
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 09:42:48 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CD7F930C34D2
 for <qemu-devel@nongnu.org>; Fri,  5 Jul 2019 13:42:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-90.ams2.redhat.com
 [10.36.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A0C2900B1;
 Fri,  5 Jul 2019 13:42:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 93B4216E1A; Fri,  5 Jul 2019 15:42:39 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 15:42:35 +0200
Message-Id: <20190705134239.11718-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 05 Jul 2019 13:42:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/4] Vga 20190705 patches
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 57dfc2c4d51e770ed3f617e5d1456d1e2bacf3f0:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20190704-1' into staging (2019-07-04 17:32:24 +0100)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/vga-20190705-pull-request

for you to fetch changes up to 146dd326c1ff5869ba9e243e30325c44d696c996:

  ati-vga: Fix setting offset together with pitch for r128pro (2019-07-05 09:50:33 +0200)

----------------------------------------------------------------
vga: more ati bugfixes.

----------------------------------------------------------------

BALATON Zoltan (4):
  ati-vga: Improve readability of ati_2d_blt function
  ati-vga: Fix frame buffer endianness for big endian target
  ati-vga: Fix reverse bit blts
  ati-vga: Fix setting offset together with pitch for r128pro

 hw/display/ati.c    |   5 +-
 hw/display/ati_2d.c | 133 ++++++++++++++++++++++++--------------------
 2 files changed, 75 insertions(+), 63 deletions(-)

-- 
2.18.1


