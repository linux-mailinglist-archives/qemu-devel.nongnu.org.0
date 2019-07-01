Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF1521B52
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 18:17:05 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50888 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRfXc-0006wC-Kx
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 12:17:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hRfTs-0004GU-NB
	for qemu-devel@nongnu.org; Fri, 17 May 2019 12:13:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hRfTn-00088r-0p
	for qemu-devel@nongnu.org; Fri, 17 May 2019 12:13:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:31197)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hRfTl-0007oa-6W
	for qemu-devel@nongnu.org; Fri, 17 May 2019 12:13:06 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7880A3082137
	for <qemu-devel@nongnu.org>; Fri, 17 May 2019 16:12:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A34BC1001E61;
	Fri, 17 May 2019 16:12:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id A367A11AA3; Fri, 17 May 2019 18:12:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 17 May 2019 18:12:37 +0200
Message-Id: <20190517161241.11813-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 17 May 2019 16:12:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/4] Ui 20190517 patches
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit b0f9690e78827d55a508c73432c73f057f59fd41:

  Merge remote-tracking branch 'remotes/vivier/tags/m68k-staging-pull-request' into staging (2019-05-17 10:28:23 +0100)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/ui-20190517-pull-request

for you to fetch changes up to 5fff13f245cddd3bc260dfe6ebe1b1f05b72116f:

  kbd-state: fix autorepeat handling (2019-05-17 13:21:40 +0200)

----------------------------------------------------------------
ui: bugfixes for curses, opengl console and kbd state tracker.

----------------------------------------------------------------

Gerd Hoffmann (1):
  kbd-state: fix autorepeat handling

HOU Qiming (1):
  ui/console: Precautionary glBindTexture and surface->texture
    validation in surface_gl_update_texture

Samuel Thibault (2):
  ui/curses: do not assume wchar_t contains unicode
  ui/curses: manipulate cchar_t with standard curses functions

 ui/console-gl.c |  18 +++--
 ui/curses.c     | 190 +++++++++++++++++++++++++++++++-----------------
 ui/kbd-state.c  |   6 +-
 3 files changed, 140 insertions(+), 74 deletions(-)

-- 
2.18.1


