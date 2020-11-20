Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36072BB143
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:20:48 +0100 (CET)
Received: from localhost ([::1]:50962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgA5X-0006r9-DR
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:20:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kgA3X-00055Y-Fi
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:18:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kgA3U-0008Vz-0V
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605892718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6c9qIu8mbXinWwRP2TEMgRB6hY1WP2B/VqtP85FI/Kg=;
 b=gzEsz9C78dK//YAZTQ6BK//H3DDWJI0ghxYg3F+Z55HV7+Tkr6DSImb1FwlzcbSTFKeAL8
 nz5UjewaHozIYvc1AdvYfB6l63nM9D5xocUNRfwOt05752/JbciqrHbCO4DlnyYnJaYx3z
 0qN/aMz+XOWjFApweyzhhDEqChA5kho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-jLZPLQovMcWryN4MBUkFVA-1; Fri, 20 Nov 2020 12:18:34 -0500
X-MC-Unique: jLZPLQovMcWryN4MBUkFVA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 469B980EFAA;
 Fri, 20 Nov 2020 17:18:33 +0000 (UTC)
Received: from thuth.com (ovpn-112-135.ams2.redhat.com [10.36.112.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 859A85D6D3;
 Fri, 20 Nov 2020 17:18:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/4] docs + qtest patches
Date: Fri, 20 Nov 2020 18:18:24 +0100
Message-Id: <20201120171828.488611-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter,

the following changes since commit 7fbd7e710323c8f4c5f6a38a8ae0e6726b5a4599:

  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/tracing-pull-request' into staging (2020-11-19 17:08:42 +0000)

are available in the Git repository at:

  https://gitlab.com/huth/qemu.git tags/pull-request-2020-11-20

for you to fetch changes up to 88a8b27e556f5cb49a19d4c98a96590f61b74ed2:

  qtest: do not return freed argument vector from qtest_rsp (2020-11-20 15:04:16 +0100)

gitlab-CI run: https://gitlab.com/huth/qemu/-/pipelines/219170774

----------------------------------------------------------------
* Some small qtest fixes
* One documentation update
----------------------------------------------------------------

Chen Qun (2):
      tests/qtest: variable defined by g_autofree need to be initialized
      tests/qtest: fix memleak in npcm7xx_watchdog_timer-test

Paolo Bonzini (1):
      qtest: do not return freed argument vector from qtest_rsp

Thomas Huth (1):
      docs: Get rid of the weird _005f links in the man page

 docs/system/gdb.rst                       |  2 +-
 docs/system/images.rst                    |  2 +-
 docs/system/monitor.rst                   |  2 +-
 docs/system/mux-chardev.rst               |  2 +-
 docs/system/usb.rst                       |  6 ++---
 docs/system/vnc-security.rst              |  2 +-
 qemu-options.hx                           | 38 ++++++++++++++++---------------
 tests/qtest/libqtest.c                    |  1 +
 tests/qtest/npcm7xx_timer-test.c          |  8 +++----
 tests/qtest/npcm7xx_watchdog_timer-test.c |  6 +++--
 10 files changed, 36 insertions(+), 33 deletions(-)


