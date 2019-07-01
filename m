Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3832B3955F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 21:16:05 +0200 (CEST)
Received: from localhost ([::1]:51514 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZKLM-00076j-9p
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 15:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51162)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hZIAn-00043C-HO
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 12:57:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hZIAj-0001rI-Mx
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 12:56:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56164)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hZIAh-0001mM-VH
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 12:56:56 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EC9F83003A5A
 for <qemu-devel@nongnu.org>; Fri,  7 Jun 2019 16:56:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-25.ams2.redhat.com
 [10.36.117.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80E205F9DF;
 Fri,  7 Jun 2019 16:56:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1CC6C16E1A; Fri,  7 Jun 2019 18:56:50 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Jun 2019 18:56:49 +0200
Message-Id: <20190607165650.8801-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 07 Jun 2019 16:56:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/1] Usb 20190607 patches
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

The following changes since commit 442bac16a6cd708a9f87adb0a263f9d833f03ed5:

  usb-tablet: fix serial compat property (2019-05-29 07:10:02 +0200)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/usb-20190607-pull-request

for you to fetch changes up to e39b8a66d2af913e873256aa77ea71a179dfe5e0:

  usb-mtp: refactor the flow of usb_mtp_write_data (2019-06-07 18:56:14 +0200)

----------------------------------------------------------------
usb-mtp: refactor the flow of usb_mtp_write_data

----------------------------------------------------------------

Bandan Das (1):
  usb-mtp: refactor the flow of usb_mtp_write_data

 hw/usb/dev-mtp.c | 57 +++++++++++++++++++++++++-----------------------
 1 file changed, 30 insertions(+), 27 deletions(-)

-- 
2.18.1


