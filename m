Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46175186D08
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 15:29:12 +0100 (CET)
Received: from localhost ([::1]:38974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDqju-0006fP-Pi
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 10:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36324)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jDpAT-0004Vs-KJ
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 08:48:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1jDpAR-0004kb-Kc
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 08:48:29 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55346
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1jDpAR-0004db-EX
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 08:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584362907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FsYEDdVSz/MUMhYooNcMwkgwpdxw+j3xsGfqxLsmlFM=;
 b=GPL4gd/bs3m8LjitEj+z5pYqw1b7FNgklMzJWlSrzXj0s6rNzshZpNf5mmrNKzZzqikP79
 epXBGREZ+lyuaFMTozwgQ08LqlFzdi8cjAfJQMMV5r0JtRo+WJZzzmIOPgJXarrnoZPunO
 Uf3KV6h5FLtMx6vvbPV2ziX2APgXzZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-mxQxXGMuNqqemDwyqqVeIA-1; Mon, 16 Mar 2020 08:48:25 -0400
X-MC-Unique: mxQxXGMuNqqemDwyqqVeIA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44666100550D
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 12:48:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-117.ams2.redhat.com
 [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F7DB5C1B2;
 Mon, 16 Mar 2020 12:48:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6AF7917535; Mon, 16 Mar 2020 13:48:20 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Vga 20200316 patches
Date: Mon, 16 Mar 2020 13:48:19 +0100
Message-Id: <20200316124820.22063-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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

The following changes since commit 61c265f0660ee476985808c8aa7915617c44fd53=
:

  Merge remote-tracking branch 'remotes/dgilbert/tags/pull-migration-202003=
13a' into staging (2020-03-13 10:33:04 +0000)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/vga-20200316-pull-request

for you to fetch changes up to f872c76296b991fde4db5fb87a1cfbd8d4c22c88:

  stdvga+bochs-display: add dummy mmio handler (2020-03-16 12:40:47 +0100)

----------------------------------------------------------------
vga: stdvga/bochs mmio fix.

----------------------------------------------------------------

Gerd Hoffmann (1):
  stdvga+bochs-display: add dummy mmio handler

 hw/display/bochs-display.c | 4 ++--
 hw/display/vga-pci.c       | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

--=20
2.18.2


