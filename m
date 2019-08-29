Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F11A1262
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 09:13:00 +0200 (CEST)
Received: from localhost ([::1]:46130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3Ec7-00034l-O4
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 03:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43476)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1i3EZf-0001Mj-GT
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 03:10:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1i3EZd-00052U-7D
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 03:10:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47014)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1i3EZb-0004y5-69
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 03:10:23 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D0E998AB25B
 for <qemu-devel@nongnu.org>; Thu, 29 Aug 2019 07:10:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
 [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D2D4194B2;
 Thu, 29 Aug 2019 07:10:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3C97B59F2; Thu, 29 Aug 2019 09:10:16 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 29 Aug 2019 09:10:13 +0200
Message-Id: <20190829071016.16589-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Thu, 29 Aug 2019 07:10:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/3] Usb 20190829 patches
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

The following changes since commit 23919ddfd56135cad3cb468a8f54d5a595f024f4:

  Merge remote-tracking branch 'remotes/aperard/tags/pull-xen-20190827' into staging (2019-08-27 15:52:36 +0100)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/usb-20190829-pull-request

for you to fetch changes up to e4c1c64112565a9be50008e6f28dbc41b53da740:

  usb-mtp: add sanity checks on rootdir (2019-08-29 07:31:12 +0200)

----------------------------------------------------------------
usb: bugfixes for xhci and mtp.

----------------------------------------------------------------

Bandan Das (1):
  usb-mtp: add sanity checks on rootdir

Ying Fang (1):
  xhci: Fix memory leak in xhci_address_slot

fangying (1):
  xhci: Fix memory leak in xhci_kick_epctx

 hw/usb/dev-mtp.c  | 38 ++++++++++++++++++++++++--------------
 hw/usb/hcd-xhci.c |  2 ++
 2 files changed, 26 insertions(+), 14 deletions(-)

-- 
2.18.1


