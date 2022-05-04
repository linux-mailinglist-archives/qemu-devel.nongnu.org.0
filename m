Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A54519D06
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 12:36:00 +0200 (CEST)
Received: from localhost ([::1]:44230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmCMR-0005Gx-Ay
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 06:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmBon-0008Om-Ha
 for qemu-devel@nongnu.org; Wed, 04 May 2022 06:01:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmBol-00068w-8R
 for qemu-devel@nongnu.org; Wed, 04 May 2022 06:01:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651658470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cUwP0d3IGxjGq2UW5LvUxq1j03uk2ELtFYuyAO2RFKY=;
 b=WfnEgU5fKx6BMmxGY7WIyIEMohQUIdFpEcjJry+Cid6EKTZFV3MpkAyIUAMFnJA25CO+be
 o0KlHjPOS5MOCB9L531jb94w82FweEjYtQUNH4pI7HQ4hg4JvL0AZ4pgkrf3qeHn8nYWyn
 +fKiBQ1HoBM05z8n0alM4Jk31NKIlMg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-fNYa9rz6NXW4JeNhfvI0Iw-1; Wed, 04 May 2022 06:01:05 -0400
X-MC-Unique: fNYa9rz6NXW4JeNhfvI0Iw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05A5A101AA42;
 Wed,  4 May 2022 10:01:05 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 464C540CFD32;
 Wed,  4 May 2022 10:01:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 0/7] QGA patches
Date: Wed,  4 May 2022 14:00:54 +0400
Message-Id: <20220504100101.564747-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following changes since commit 2e3408b3cc7de4e87a9adafc8c19bfce3abec947:

  Merge tag 'misc-pull-request' of gitlab.com:marcandre.lureau/qemu into staging (2022-05-03 09:13:17 -0700)

are available in the Git repository at:

  git@gitlab.com:marcandre.lureau/qemu.git tags/qga-pull-request

for you to fetch changes up to 22668881f3def13e9ffcf16840e5fde974a55b1e:

  qga: Introduce disk smart (2022-05-04 13:03:19 +0400)

----------------------------------------------------------------
QGA Pull request

----------------------------------------------------------------

Andrew Deason (5):
  qga/commands-posix: Use getifaddrs when available
  qga/commands-posix: Fix iface hw address detection
  qga/commands-posix: Fix listing ifaces for Solaris
  qga/commands-posix: Log all net stats failures
  qga/commands-posix: 'guest-shutdown' for Solaris

Zhenwei Pi (2):
  qga: Introduce NVMe disk bus type
  qga: Introduce disk smart

 meson.build          |   1 +
 qga/qapi-schema.json |  56 +++-
 qga/commands-posix.c | 591 ++++++++++++++++++++++++++-----------------
 3 files changed, 413 insertions(+), 235 deletions(-)

-- 
2.36.0.44.g0f828332d5ac


