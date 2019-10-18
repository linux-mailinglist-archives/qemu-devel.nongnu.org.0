Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2613DC2A0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 12:19:47 +0200 (CEST)
Received: from localhost ([::1]:37542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLPMI-00079C-8b
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 06:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53263)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iLPJs-0005N3-Qt
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 06:17:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iLPJr-0002Vg-Pl
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 06:17:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41406)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iLPJr-0002Us-Kd
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 06:17:15 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DC2A38AC700;
 Fri, 18 Oct 2019 10:17:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A7E360BF1;
 Fri, 18 Oct 2019 10:17:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2C05D16E08; Fri, 18 Oct 2019 12:17:11 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] Ui 20191018 patches
Date: Fri, 18 Oct 2019 12:17:07 +0200
Message-Id: <20191018101711.24105-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Fri, 18 Oct 2019 10:17:14 +0000 (UTC)
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f22f553efffd083ff624be116726f843a39f11=
48:

  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20191013' into =
staging (2019-10-17 16:48:56 +0100)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/ui-20191018-pull-request

for you to fetch changes up to 707f75070a94c28889f887deef0ab4da09e25ddf:

  ui: fix keymap file search in input-barrier object (2019-10-18 10:40:46=
 +0200)

----------------------------------------------------------------
ui: bugfixes for cocoa, curses and input-barrier.

----------------------------------------------------------------

Hikaru Nishida (1):
  ui: Fix hanging up Cocoa display on macOS 10.15 (Catalina)

Laurent Vivier (1):
  ui: fix keymap file search in input-barrier object

Matthew Kilgore (2):
  curses: use the bit mask constants provided by curses
  curses: correctly pass the color pair to setcchar()

 ui/curses.c        |  8 +++++---
 ui/input-barrier.c | 14 +++++++-------
 ui/cocoa.m         | 12 ++++++++++++
 3 files changed, 24 insertions(+), 10 deletions(-)

--=20
2.18.1


