Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86FD354D3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 03:02:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33541 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYKK3-0007cJ-HX
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 21:02:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cuser@cusers-Mac-mini.local>) id 1hYKI9-0006an-Pg
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 21:00:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cuser@cusers-Mac-mini.local>) id 1hYKI7-000785-8s
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 21:00:37 -0400
Received: from [36.106.167.139] (port=63965 helo=cusers-Mac-mini.local)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cuser@cusers-Mac-mini.local>) id 1hYKI5-00070p-9h
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 21:00:34 -0400
Received: by cusers-Mac-mini.local (Postfix, from userid 501)
	id C9ED3EFD861; Tue,  4 Jun 2019 17:13:53 +0800 (CST)
To: peter.maydell@linaro.org,
	kraxel@redhat.com
Date: Tue,  4 Jun 2019 17:12:43 +0800
Message-Id: <cover.1559638310.git.tgfbeta@me.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Mac OS X  [generic] [fuzzy]
X-Received-From: 36.106.167.139
Subject: [Qemu-devel] [PATCH 0/2] ui/cocoa: Fix input device issues on Mojave
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
From: Chen Zhang via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Chen Zhang <tgfbeta@me.com>
Cc: qemu-devel@nongnu.org, Chen Zhang <tgfbeta@me.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following patches fixed issues of absolute and relative input devices=
 on macOS Mojave.

Chen Zhang (2):
  ui/cocoa: Fix absolute input device grabbing issue on Mojave
  ui/cocoa: Fix mouse grabbing in fullscreen mode for relative input
    device

 ui/cocoa.m | 50 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

--=20
2.21.0


