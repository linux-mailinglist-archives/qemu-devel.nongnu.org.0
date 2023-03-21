Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617866C2D7D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 10:04:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peXuE-0000JT-Jm; Tue, 21 Mar 2023 05:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1peXuB-0000J1-NZ
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 05:03:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1peXuA-0001i4-0B
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 05:03:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679389420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=52soMhBlCkjbvBRoejdvJ4uPUTekawyDRv9a1hNkCds=;
 b=iv6U58GOnBQ/oWR+lxBAFExGHpnhQI8ioNmPE/fckhOObCLPStIHfaB+6H+5oPy2vRF/GN
 58CI8L2wsAf5sbyhuzp9RgV2gLGy0VINZtHrKPUOBtTC84oF349jTN4TPHDcUkTXLFFqaN
 nJ2uWmav/QgmbOm6OAa0EzVZEPQcvRA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-K05fMyq2OOeirhS65GptaQ-1; Tue, 21 Mar 2023 05:03:39 -0400
X-MC-Unique: K05fMyq2OOeirhS65GptaQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A80E296DC81;
 Tue, 21 Mar 2023 09:03:38 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E8E01121314;
 Tue, 21 Mar 2023 09:03:37 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PULL 0/7] ui/ fixes for 8.0
Date: Tue, 21 Mar 2023 13:03:27 +0400
Message-Id: <20230321090334.1841607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following changes since commit aa9e7fa4689d1becb2faf67f65aafcbcf664f1ce:

  Merge tag 'edk2-stable202302-20230320-pull-request' of https://gitlab.com/kraxel/qemu into staging (2023-03-20 13:43:35 +0000)

are available in the Git repository at:

  https://gitlab.com/marcandre.lureau/qemu.git tags/ui-pull-request

for you to fetch changes up to 49152ac47003ca21fc6f2a5c3e517f79649e1541:

  ui: fix crash on serial reset, during init (2023-03-21 11:46:22 +0400)

----------------------------------------------------------------
ui/ fixes for 8.0

----------------------------------------------------------------

Erico Nunes (1):
  ui/sdl2: remove workaround forcing x11

Marc-André Lureau (6):
  win32: add qemu_close_socket_osfhandle()
  ui/spice: fix SOCKET handling regression
  ui/dbus: fix passing SOCKET to GSocket API & leak
  ui/gtk: fix cursor moved to left corner
  ui: return the default console cursor when con == NULL
  ui: fix crash on serial reset, during init

 include/sysemu/os-win32.h | 15 ++++++--
 ui/console.c              |  3 ++
 ui/dbus.c                 |  9 +++++
 ui/gtk.c                  |  7 ++--
 ui/sdl2.c                 | 16 ---------
 ui/spice-core.c           | 29 +++++++++++++--
 util/oslib-win32.c        | 75 +++++++++++++++++++++------------------
 7 files changed, 97 insertions(+), 57 deletions(-)

-- 
2.39.2


