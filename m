Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E4140AEDC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:26:07 +0200 (CEST)
Received: from localhost ([::1]:60982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8Rr-0002eN-0a
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mQ84S-0006MF-8O
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:01:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mQ84E-0008Jp-AI
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:01:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631624500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OfgYX6PmP1T6B3cZOYpZzDc1Zf6n3TPFc90g7uRtbmQ=;
 b=AipunrzCVsMxmtU5wtSmUlVbtkMwgHxfXvZYa4ugzj7e/pD5IWmFbk015k/hb5955c4E7u
 uuTUvOBBBAoOihzmfuPy8yta3maelsoAq3BO7KmnFol5KIbVm5XYqhNIheGR35/kCQX6nC
 hf+fOzvD6qBFwVtyPfp+RynkVuqJPrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-0fARd9xQNbWGmW7goAX3Jw-1; Tue, 14 Sep 2021 09:01:36 -0400
X-MC-Unique: 0fARd9xQNbWGmW7goAX3Jw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54C0719057A2;
 Tue, 14 Sep 2021 13:01:35 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A34AC7A8CE;
 Tue, 14 Sep 2021 13:01:31 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Misc patches
Date: Tue, 14 Sep 2021 17:01:23 +0400
Message-Id: <20210914130128.298226-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

The following changes since commit c6f5e042d89e79206cd1ce5525d3df219f13c3cc=
:=0D
=0D
  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210=
913-3' into staging (2021-09-13 21:06:15 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git@gitlab.com:marcandre.lureau/qemu.git tags/misc-pull-request=0D
=0D
for you to fetch changes up to 78e3e1d046e64b86e8c9bf3011d5a2a795b5e373:=0D
=0D
  chardev: add some comments about the class methods (2021-09-14 16:57:11 +=
0400)=0D
=0D
----------------------------------------------------------------=0D
chardev & doc misc=0D
=0D
----------------------------------------------------------------=0D
=0D
Marc-Andr=C3=A9 Lureau (4):=0D
  docs: add supported host CPU architectures section=0D
  meson.build: fix comment typo=0D
  chardev: remove needless class method=0D
  chardev: add some comments about the class methods=0D
=0D
Michal Privoznik (1):=0D
  chardev: Propagate error from logfile opening=0D
=0D
 docs/about/build-platforms.rst | 33 +++++++++++++++++++++++++++++++++=0D
 docs/about/deprecated.rst      |  2 ++=0D
 meson.build                    |  2 +-=0D
 include/chardev/char.h         | 34 +++++++++++++++++++++++++++++++++-=0D
 chardev/char-mux.c             |  6 ++----=0D
 chardev/char.c                 |  7 ++-----=0D
 6 files changed, 73 insertions(+), 11 deletions(-)=0D
=0D
--=20=0D
2.33.0.113.g6c40894d24=0D
=0D


