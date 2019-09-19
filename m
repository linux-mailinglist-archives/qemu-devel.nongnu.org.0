Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB154B760F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 11:17:50 +0200 (CEST)
Received: from localhost ([::1]:40630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAsZR-0002Un-UR
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 05:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39842)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iAsSg-0003tt-Ot
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 05:10:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iAsSf-0003SK-Oy
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 05:10:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48188)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iAsSf-0003Ro-Jh
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 05:10:49 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D9F6C87638
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 09:10:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C62960872;
 Thu, 19 Sep 2019 09:10:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 64B641747D; Thu, 19 Sep 2019 11:10:43 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 19 Sep 2019 11:10:41 +0200
Message-Id: <20190919091043.24503-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 19 Sep 2019 09:10:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/2] Ati 20190919 patches
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

The following changes since commit f8c3db33a5e863291182f8862ddf81618a7c61=
94:

  target/sparc: Switch to do_transaction_failed() hook (2019-09-17 12:01:=
00 +0100)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/ati-20190919-pull-request

for you to fetch changes up to aab0e2a661b2b6bf7915c0aefe807fb60d6d9d13:

  ati: use vga_read_byte in ati_cursor_define (2019-09-19 10:37:46 +0200)

----------------------------------------------------------------
vga: fix cursor code in ati-vga.

----------------------------------------------------------------

Gerd Hoffmann (2):
  vga: move access helpers to separate include file
  ati: use vga_read_byte in ati_cursor_define

 hw/display/vga-access.h  | 49 ++++++++++++++++++++++++++++++++++++++++
 hw/display/vga-helpers.h | 26 ---------------------
 hw/display/ati.c         | 19 ++++++++--------
 hw/display/vga.c         |  1 +
 4 files changed, 60 insertions(+), 35 deletions(-)
 create mode 100644 hw/display/vga-access.h

--=20
2.18.1


