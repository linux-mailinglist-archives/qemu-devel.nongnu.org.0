Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E612941A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 11:01:54 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51248 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hU65J-0004ni-Hi
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 05:01:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hU62y-0003f6-GP
	for qemu-devel@nongnu.org; Fri, 24 May 2019 04:59:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hU614-0000AE-EB
	for qemu-devel@nongnu.org; Fri, 24 May 2019 04:57:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50412)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hU614-00009u-9D
	for qemu-devel@nongnu.org; Fri, 24 May 2019 04:57:30 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 887923082E1E
	for <qemu-devel@nongnu.org>; Fri, 24 May 2019 08:57:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-101.ams2.redhat.com
	[10.36.116.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9AD5D679D8;
	Fri, 24 May 2019 08:57:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 6E85A11AB5; Fri, 24 May 2019 10:57:17 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 May 2019 10:57:14 +0200
Message-Id: <20190524085717.3493-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 24 May 2019 08:57:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/3] Vga 20190524 patches
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 8dc7fd56dd4f56ab8ff1df3765ae6b5d3ac11c5e:

  Merge remote-tracking branch 'remotes/philmd-gitlab/tags/fw_cfg-20190523-pull-request' into staging (2019-05-23 14:15:34 +0100)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/vga-20190524-pull-request

for you to fetch changes up to f79081b4b71b72640bedd40a7cd76f864c8287f1:

  hw/display/ramfb: initialize fw-config space with xres/ yres (2019-05-24 09:10:29 +0200)

----------------------------------------------------------------
ramfb: misc improvements.

----------------------------------------------------------------

Hou Qiming (3):
  hw/display/ramfb: fix guest memory un-mapping
  hw/display/ramfb: lock guest resolution after it's set
  hw/display/ramfb: initialize fw-config space with xres/ yres

 include/hw/display/ramfb.h    |  2 +-
 hw/display/ramfb-standalone.c | 12 ++++-
 hw/display/ramfb.c            | 89 ++++++++++++++++++++++++++++-------
 hw/vfio/display.c             |  4 +-
 stubs/ramfb.c                 |  2 +-
 5 files changed, 88 insertions(+), 21 deletions(-)

-- 
2.18.1


