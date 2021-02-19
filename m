Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A4F320119
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:03:04 +0100 (CET)
Received: from localhost ([::1]:40582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDDrb-0005Fy-2O
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lDDpQ-0003MN-SN
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:00:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lDDpO-0005d0-MC
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:00:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613772045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Q1Y/iSG2AdcypQC39o3riddhaFcMEcz56ltE+0vBA+Q=;
 b=h3TBlALw+yfXvY55GNQObIIDbObR3RIjoSOvJwgZihtyaqtk+MLkZCyAku3yUX++TksKn4
 8WI9wKhpHNCt2QLHUF4HDw5eFA674zkoPeOcmw3AhvZzPxZyBOF+d3XyNVPC8LGnYgzWRO
 j/xCz0GAeKhjJr8s3h11Yw2cAOkIOZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-bZCHvmTyPHC_gQ_9ece9hQ-1; Fri, 19 Feb 2021 17:00:42 -0500
X-MC-Unique: bZCHvmTyPHC_gQ_9ece9hQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC5C4C293;
 Fri, 19 Feb 2021 22:00:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AEBB19801;
 Fri, 19 Feb 2021 22:00:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D50F518000A2; Fri, 19 Feb 2021 23:00:36 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/8] Ui 20210219 patches
Date: Fri, 19 Feb 2021 23:00:28 +0100
Message-Id: <20210219220036.100654-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The following changes since commit c79f01c9450bcf90c08a77f13fbf67bdba59a316=
:=0D
=0D
  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-hex-20210218' =
in=3D=0D
to staging (2021-02-18 16:33:36 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/ui-20210219-pull-request=0D
=0D
for you to fetch changes up to 075e7a5b7f3c640823fce76c8dab503c42f0d7f6:=0D
=0D
  ui/console: Remove dpy_gl_ctx_get_current (2021-02-19 15:07:14 +0100)=0D
=0D
----------------------------------------------------------------=0D
ui: spice bugfixes.=0D
ui: first batch of cocoa updates.=0D
=0D
----------------------------------------------------------------=0D
=0D
Akihiko Odaki (5):=0D
  ui/cocoa: Support unique keys of JIS keyboards=0D
  ui/cocoa: Do not copy members of pixman image=0D
  ui/cocoa: Interpret left button down as is when command is pressed=0D
  ui/cocoa: Statically allocate dcl=0D
  ui/console: Remove dpy_gl_ctx_get_current=0D
=0D
Bruce Rogers (1):=0D
  spice-app: avoid crash when core spice module doesn't loaded=0D
=0D
Marc-Andr=3DC3=3DA9 Lureau (2):=0D
  spice: flush on GL update before notifying client=0D
  spice: flush drawing before notifying client=0D
=0D
 include/ui/gtk.h   |   1 -=0D
 ui/gtk-gl-area.c   |   5 --=0D
 ui/spice-app.c     |   8 ++-=0D
 ui/spice-display.c |   2 +=0D
 ui/cocoa.m         | 126 +++++++++++++++++++++------------------------=0D
 5 files changed, 69 insertions(+), 73 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D


