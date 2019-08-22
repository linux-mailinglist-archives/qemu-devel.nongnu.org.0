Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED4498A81
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 06:44:22 +0200 (CEST)
Received: from localhost ([::1]:38106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0exQ-0005Nl-NP
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 00:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51423)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1i0evY-00047W-9A
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 00:42:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1i0evW-0002cc-Sm
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 00:42:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38558)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1i0evW-0002by-Lk
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 00:42:22 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9F52518C4267
 for <qemu-devel@nongnu.org>; Thu, 22 Aug 2019 04:42:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F90F7E2A;
 Thu, 22 Aug 2019 04:42:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 554209AF5; Thu, 22 Aug 2019 06:42:18 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 06:42:16 +0200
Message-Id: <20190822044218.9374-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Thu, 22 Aug 2019 04:42:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/2] Ui 20190822 patches
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 17dc57990320edaad52ac9ea808be9719c91cea6:

  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2019-08-20' into staging (2019-08-20 14:14:20 +0100)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/ui-20190822-pull-request

for you to fetch changes up to a923b471fc59389e49575f38f4db3cd622619bf5:

  input-linux: add shift+shift as a grab toggle (2019-08-21 12:25:46 +0200)

----------------------------------------------------------------
curses: assert get_wch return value is okay
input-linux: add shift+shift as a grab toggle

----------------------------------------------------------------

Niklas Haas (1):
  input-linux: add shift+shift as a grab toggle

Paolo Bonzini (1):
  curses: assert get_wch return value is okay

 ui/curses.c      | 2 ++
 ui/input-linux.c | 4 ++++
 qapi/ui.json     | 3 ++-
 3 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.18.1


