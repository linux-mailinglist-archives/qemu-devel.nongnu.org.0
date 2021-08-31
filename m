Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7CA3FC852
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:34:54 +0200 (CEST)
Received: from localhost ([::1]:37766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3ue-0000NF-SQ
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mL3rl-0006DD-VZ
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:31:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mL3rj-0007Mh-2q
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630416708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LG1h8RyJpLp464syLIcL6bwdTgiUqEYcnMZlsWNTP6Y=;
 b=dVCUVQv7fRpnjGsTNAznzOitqx31WK0RC3NybnZhqo75UFIIxiwaEXDnS9hmd3xI9dBvZa
 yrSnXB70p1UMz0kS5u3n5Y/jNgGfCAUTAvSH2dDI0AYcKQof5tGuPxN5fqUeVOoyfGYdHP
 fPg5a/8Q1WgGC3++nAKVw1fplGdqFAI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-L1kjmgzDNUCeHZCpQR404A-1; Tue, 31 Aug 2021 09:31:45 -0400
X-MC-Unique: L1kjmgzDNUCeHZCpQR404A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3756E18C8C01;
 Tue, 31 Aug 2021 13:31:44 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C82BF5C1A1;
 Tue, 31 Aug 2021 13:31:35 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 00/18] UI/clipboard fixes
Date: Tue, 31 Aug 2021 17:31:14 +0400
Message-Id: <20210831133132.1697228-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

The following changes since commit ad22d0583300df420819e6c89b1c022b998fac8a=
:=0D
=0D
  Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.2-20210827=
' into staging (2021-08-27 11:34:12 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git@gitlab.com:marcandre.lureau/qemu.git tags/clip-pull-request=0D
=0D
for you to fetch changes up to 90208bc9657b7e0f8a6bc6af82b69c65c97b2d64:=0D
=0D
  ui/vdagent: add a migration blocker (2021-08-31 17:25:14 +0400)=0D
=0D
----------------------------------------------------------------=0D
=0D
----------------------------------------------------------------=0D
=0D
Marc-Andr=C3=A9 Lureau (18):=0D
  ui/vdagent: fix leak on error path=0D
  ui/vdagent: remove copy-pasta comment=0D
  ui/gtk-clipboard: use existing macros=0D
  ui/gtk-clipboard: fix clipboard enum typo=0D
  ui/clipboard: add helper to retrieve current clipboard=0D
  ui/clipboard: add qemu_clipboard_peer_owns() helper=0D
  ui/clipboard: add qemu_clipboard_peer_release() helper=0D
  ui/clipboard: release owned grabs on unregister=0D
  ui/vdagent: disconnect handlers and reset state on finalize=0D
  ui/vdagent: reset outbuf on disconnect=0D
  ui/vdagent: split clipboard recv message handling=0D
  ui/vdagent: use qemu_clipboard_peer_release helper=0D
  ui/vdagent: use qemu_clipboard_info helper=0D
  ui/vdagent: send empty clipboard when unhandled=0D
  ui/gtk-clipboard: use qemu_clipboard_info helper=0D
  ui/vdagent: send release when no clipboard owner=0D
  ui/gtk-clipboard: emit release clipboard events=0D
  ui/vdagent: add a migration blocker=0D
=0D
 include/ui/clipboard.h |  33 ++++++=0D
 include/ui/gtk.h       |   1 -=0D
 ui/clipboard.c         |  41 +++++++=0D
 ui/gtk-clipboard.c     |  24 ++---=0D
 ui/vdagent.c           | 240 ++++++++++++++++++++++++++---------------=0D
 ui/trace-events        |   1 +=0D
 6 files changed, 241 insertions(+), 99 deletions(-)=0D
=0D
--=20=0D
2.33.0.rc2=0D
=0D


