Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9194D8598
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:03:29 +0100 (CET)
Received: from localhost ([::1]:56848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTkMC-0006eW-65
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:03:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nTkIk-0003r2-8m
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 08:59:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nTkIg-0002ft-QH
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 08:59:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647262788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rrYjzU23Mpj7dXHImYx07EcBHLxDS4ueRcyL1XTK3wg=;
 b=fymbXOcb+jM+r6WJdL09/tG1ZK+gm4mGHEfVtpc49beB+D+cN7YHGFPQ2kTjf64S/qFNlw
 VTMnEux7wR9KhRaw0SkLT2yJntxmGNE/sEuOJtfCA0bqsKrTNSMwe/nb27MXdbkyJP01Eg
 vuGepjnZ6OzjzZKwSqz3lKjMnnwvMJw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-gbDOvUGKPSKSl23HRoCRHg-1; Mon, 14 Mar 2022 08:59:46 -0400
X-MC-Unique: gbDOvUGKPSKSl23HRoCRHg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B6FD85A5BE;
 Mon, 14 Mar 2022 12:59:45 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EC47463DE8;
 Mon, 14 Mar 2022 12:59:43 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 00/12] dbus console fixes
Date: Mon, 14 Mar 2022 16:59:28 +0400
Message-Id: <20220314125940.1866728-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

The following changes since commit 1416688c53be6535be755b44c15fb2eb9defd20f=
:=0D
=0D
  Merge remote-tracking branch 'remotes/mcayland/tags/q800-updates-for-7.0-=
20220309' into staging (2022-03-10 13:16:37 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git@gitlab.com:marcandre.lureau/qemu.git tags/dbus-pull-request=0D
=0D
for you to fetch changes up to c923967ca32600aa4e8ab817565ebf5415b4e195:=0D
=0D
  ui/console: call gfx_switch() even if the current scanout is GL (2022-03-=
14 15:16:29 +0400)=0D
=0D
----------------------------------------------------------------=0D
GL & D-Bus display related fixes=0D
=0D
Hi,=0D
=0D
Here are pending fixes related to D-Bus and GL, most of them reported thank=
s to=0D
Akihiko Odaki.=0D
=0D
----------------------------------------------------------------=0D
=0D
Marc-Andr=C3=A9 Lureau (12):=0D
  ui/console: move check for compatible GL context=0D
  ui/console: move dcl compatiblity check to a callback=0D
  ui/console: egl-headless is compatible with non-gl listeners=0D
  ui/dbus: associate the DBusDisplayConsole listener with the given=0D
    console=0D
  ui/console: move console compatibility check to dcl_display_console()=0D
  ui/shader: fix potential leak of shader on error=0D
  ui/shader: free associated programs=0D
  ui/console: add a dpy_gfx_switch callback helper=0D
  ui/console: optionally update after gfx switch=0D
  ui/dbus: fix texture sharing=0D
  ui/dbus: do not send 2d scanout until gfx_update=0D
  ui/console: call gfx_switch() even if the current scanout is GL=0D
=0D
 include/ui/console.h |  19 +++++---=0D
 ui/dbus.h            |   3 ++=0D
 ui/console.c         | 102 ++++++++++++++++++++++++++-----------------=0D
 ui/dbus-console.c    |  27 ++++++------=0D
 ui/dbus-listener.c   |  48 +++++++++-----------=0D
 ui/dbus.c            |  35 ++++++++++++++-=0D
 ui/egl-headless.c    |  17 +++++++-=0D
 ui/gtk.c             |  18 +++++++-=0D
 ui/sdl2.c            |   9 +++-=0D
 ui/shader.c          |   9 +++-=0D
 ui/spice-display.c   |   9 +++-=0D
 11 files changed, 200 insertions(+), 96 deletions(-)=0D
=0D
--=20=0D
2.35.1.273.ge6ebfd0e8cbb=0D
=0D


