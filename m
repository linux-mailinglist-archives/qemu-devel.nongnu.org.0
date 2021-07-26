Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864063D584E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 13:09:53 +0200 (CEST)
Received: from localhost ([::1]:46730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7yUa-0007zJ-Ic
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 07:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m7yQq-0001MD-GS
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:06:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m7yQi-0004XO-4h
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627297551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yFI/grHANkwgUrvMvQNBnH4O4JxWVJ4Zyp1pB7Hsols=;
 b=dckGaKyBieOjXN7WDh2wR7GI61BzbhqIuFNxnDs7bYaNk9W+q+YxZUbCs4LQZu06URdpJV
 SRE6r5UnoNf1y/0Yo08OfY+YV9IzmEaem7XeJL8bwz2NMtvTECFi+sY+V92+XYlG46AOmg
 emz/A2vCH/IH2CP5l+UslCc6CDSRb7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-afXrsYhJNCa1gkENr78cog-1; Mon, 26 Jul 2021 07:05:50 -0400
X-MC-Unique: afXrsYhJNCa1gkENr78cog-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80D74C7400;
 Mon, 26 Jul 2021 11:05:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC1C160C0F;
 Mon, 26 Jul 2021 11:05:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3839E18003A4; Mon, 26 Jul 2021 13:05:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] Fixes 20210726 patches
Date: Mon, 26 Jul 2021 13:05:38 +0200
Message-Id: <20210726110544.1934386-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

The following changes since commit a2376507f615495b1d16685449ce0ea78c2caf9d=
:=0D
=0D
  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' i=
nto staging (2021-07-24 11:04:57 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/fixes-20210726-pull-request=0D
=0D
for you to fetch changes up to 584af1f1d955476aacba3350c4efb5865fc91c09:=0D
=0D
  ui/gtk: add a keyboard fifo to the VTE consoles (2021-07-26 10:24:49 +020=
0)=0D
=0D
----------------------------------------------------------------=0D
ui: fixes for 6.1=0D
=0D
----------------------------------------------------------------=0D
=0D
Akihiko Odaki (4):=0D
  ui/spice: Use HAVE_SPICE_GL for OpenGL checks=0D
  ui/egl-headless: Remove a check for CONFIG_OPENGL=0D
  ui/cocoa: Fix the type of main's argv=0D
  ui: update keycodemapdb submodule commit=0D
=0D
Dennis W=C3=B6lfing (1):=0D
  ui/gtk: Fix relative mouse with multiple monitors=0D
=0D
Volker R=C3=BCmelin (1):=0D
  ui/gtk: add a keyboard fifo to the VTE consoles=0D
=0D
 include/ui/gtk.h  |  4 +++=0D
 ui/egl-headless.c |  2 --=0D
 ui/gtk.c          | 68 ++++++++++++++++++++++++++++-------------------=0D
 ui/spice-app.c    |  3 ++-=0D
 ui/spice-core.c   |  2 +-=0D
 ui/cocoa.m        |  4 +--=0D
 ui/keycodemapdb   |  2 +-=0D
 7 files changed, 50 insertions(+), 35 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


