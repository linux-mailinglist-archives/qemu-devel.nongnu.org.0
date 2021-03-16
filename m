Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22F233CD74
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 06:44:26 +0100 (CET)
Received: from localhost ([::1]:52750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM2VF-00038X-N5
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 01:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM2PX-0006D0-O4
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 01:38:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM2PS-0004lb-QJ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 01:38:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615873106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FfyAUm3tIui612+DmhSzYLksj0RDKJRg4THJsa7WLyk=;
 b=IxCgZIiBgCeaPBwMjaS0gA9w5pHUs6v3/xWzA7TCVyDPejdMtMJTaqB84MZlNImC4DFohB
 AJ4/1tfPOm7rFqoRaSoe7ANpq0BHPZq5kAhJUykdIbaFjnwBsUpNTBWED1UCljV1LOXnf2
 23zz8pPe5d7MbjN9M89FhMlbxJGu/p0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-Ievw5kKuPmi7y2MKegLcWg-1; Tue, 16 Mar 2021 01:38:22 -0400
X-MC-Unique: Ievw5kKuPmi7y2MKegLcWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 333AA817469;
 Tue, 16 Mar 2021 05:38:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAEC42B394;
 Tue, 16 Mar 2021 05:38:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1608A18000AB; Tue, 16 Mar 2021 06:38:13 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] Ui 20210316 patches
Date: Tue, 16 Mar 2021 06:38:02 +0100
Message-Id: <20210316053813.1719442-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6157b0e19721aadb4c7fdcfe57b2924af6144b14=
:=0D
=0D
  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pul=
l-=3D=0D
request' into staging (2021-03-14 17:47:49 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/ui-20210316-pull-request=0D
=0D
for you to fetch changes up to ad7f2f8ee9fbded410fbf77158b0065f8e2f08e3:=0D
=0D
  ui/cocoa: Comment about modifier key input quirks (2021-03-16 06:36:45 +0=
10=3D=0D
0)=0D
=0D
----------------------------------------------------------------=0D
vnc+spice: password-secret option.=0D
bugfixes for cocoa, vnc, opengl.=0D
=0D
----------------------------------------------------------------=0D
=0D
Akihiko Odaki (3):=0D
  opengl: Do not convert format with glTexImage2D on OpenGL ES=0D
  ui/cocoa: Do not exit immediately after shutdown=0D
  ui/cocoa: Comment about modifier key input quirks=0D
=0D
Daniel P. Berrang=3DC3=3DA9 (7):=0D
  ui: introduce "password-secret" option for VNC servers=0D
  ui: introduce "password-secret" option for SPICE server=0D
  ui: deprecate "password" option for SPICE server=0D
  ui: add more trace points for VNC client/server messages=0D
  ui: avoid sending framebuffer updates outside client desktop bounds=0D
  ui: use client width/height in WMVi message=0D
  ui: honour the actual guest display dimensions without rounding=0D
=0D
Marc-Andr=3DC3=3DA9 Lureau (1):=0D
  ui: fold qemu_alloc_display in only caller=0D
=0D
 ui/vnc.h                   |  1 +=0D
 ui/console-gl.c            | 19 +++++++---=0D
 ui/console.c               | 14 ++------=0D
 ui/spice-core.c            | 32 +++++++++++++++--=0D
 ui/vnc-jobs.c              | 44 ++++++++++++++++++++---=0D
 ui/vnc.c                   | 71 +++++++++++++++++++++++++++++++++-----=0D
 docs/system/deprecated.rst |  8 +++++=0D
 qemu-options.hx            | 18 ++++++++--=0D
 ui/cocoa.m                 | 46 ++++++++++++++++++++++--=0D
 ui/trace-events            | 16 +++++++++=0D
 10 files changed, 234 insertions(+), 35 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D


