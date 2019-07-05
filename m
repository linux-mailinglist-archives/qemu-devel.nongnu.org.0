Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0055F33C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 09:09:44 +0200 (CEST)
Received: from localhost ([::1]:43220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hivsF-0003LU-KP
	for lists+qemu-devel@lfdr.de; Thu, 04 Jul 2019 03:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44792)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hivne-0000QN-8E
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 03:04:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hivnd-0008OO-4o
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 03:04:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48972)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hivnc-0008O6-WB
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 03:04:57 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2C4DD30A56A6
 for <qemu-devel@nongnu.org>; Thu,  4 Jul 2019 07:04:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-222.ams2.redhat.com
 [10.36.116.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6877D1001B29;
 Thu,  4 Jul 2019 07:04:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8006E16E05; Thu,  4 Jul 2019 09:04:42 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  4 Jul 2019 09:04:41 +0200
Message-Id: <20190704070442.2277-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 04 Jul 2019 07:04:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/1] Ui 20190704 patches
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

The following changes since commit 506179e42112be77bfd071f050b15762d3b2cd43:

  Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-4.1-20190702' into staging (2019-07-02 18:56:44 +0100)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/ui-20190704-pull-request

for you to fetch changes up to 5b8541c6c70db776d0701bb5ce5862ae15779fb5:

  console: fix cell overflow (2019-07-03 10:57:12 +0200)

----------------------------------------------------------------
ui: terminal emulation fix.

----------------------------------------------------------------

Gerd Hoffmann (1):
  console: fix cell overflow

 ui/console.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.18.1


