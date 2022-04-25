Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85CB50E2D8
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:17:56 +0200 (CEST)
Received: from localhost ([::1]:33366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizXH-000346-QS
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nizO7-0004OD-Mk
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nizO6-0001wN-0m
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:08:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650895705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AJ9XbFgj9jPo6dU7Ccel7PO4pkey4h43trSNIOpdr3A=;
 b=MBdA3msw9ZbvAJBhI1IS66OBUUMNGQoRwIHwGsJpOZc5omjVwQTs8RCwKIN4GziGAE1UEX
 0HZsqXXIPhbZG9A/RcX6sP9xW44NcWb2lpha/tI6P6Sqt3Bt23FcwneCNXAiLkeHw6cUk+
 V5m9bhBtd/r8rGXDEHAz389yfUE8Tj4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-jHzlSKRQO5GAIhpPu7lFFQ-1; Mon, 25 Apr 2022 10:08:23 -0400
X-MC-Unique: jHzlSKRQO5GAIhpPu7lFFQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41ADA380673A;
 Mon, 25 Apr 2022 14:08:23 +0000 (UTC)
Received: from localhost (unknown [10.39.194.198])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBE002024CBC;
 Mon, 25 Apr 2022 14:08:22 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/14] Block patches
Date: Mon, 25 Apr 2022 16:08:07 +0200
Message-Id: <20220425140821.957511-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 754f756cc4c6d9d14b7230c62b5bb20f9d655888:

  Merge tag 'pull-target-arm-20220422-1' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-04-22 08:03:18 -0700)

are available in the Git repository at:

  https://gitlab.com/hreitz/qemu.git tags/pull-block-2022-04-25

for you to fetch changes up to 348a0740afc5b313599533eb69bbb2b95d2f1bba:

  iotests/108: Fix when missing user_allow_other (2022-04-25 14:46:45 +0200)

----------------------------------------------------------------
Block patches:
- New @force parameter for blockdev-change-medium
- Improvements to the iotests to help with debugging
- Fix iotest 108 on systems without user_allow_other in fuse.conf

----------------------------------------------------------------
Denis V. Lunev (1):
  block: add 'force' parameter to 'blockdev-change-medium' command

Hanna Reitz (1):
  iotests/108: Fix when missing user_allow_other

John Snow (12):
  iotests: replace calls to log(qemu_io(...)) with qemu_io_log()
  iotests/163: Fix broken qemu-io invocation
  iotests: Don't check qemu_io() output for specific error strings
  iotests/040: Don't check image pattern on zero-length image
  iotests/040: Fix TestCommitWithFilters test
  iotests: create generic qemu_tool() function
  iotests: rebase qemu_io() on top of qemu_tool()
  iotests/migration-permissions: use assertRaises() for qemu_io()
    negative test
  iotests/image-fleecing: switch to qemu_io()
  iotests: remove qemu_io_pipe_and_status()
  iotests: remove qemu_io_silent() and qemu_io_silent_check().
  iotests: make qemu_io_log() check return codes by default

 qapi/block.json                               |  6 ++
 block/qapi-sysemu.c                           |  3 +-
 monitor/hmp-cmds.c                            |  4 +-
 hmp-commands.hx                               | 11 ++-
 tests/qemu-iotests/030                        | 85 +++++++++++--------
 tests/qemu-iotests/040                        | 53 +++++++-----
 tests/qemu-iotests/056                        |  2 +-
 tests/qemu-iotests/108                        |  2 +-
 tests/qemu-iotests/149                        |  6 +-
 tests/qemu-iotests/163                        |  5 +-
 tests/qemu-iotests/205                        |  4 +-
 tests/qemu-iotests/216                        | 12 +--
 tests/qemu-iotests/218                        |  5 +-
 tests/qemu-iotests/224                        |  4 +-
 tests/qemu-iotests/242                        |  6 +-
 tests/qemu-iotests/245                        | 17 ++--
 tests/qemu-iotests/255                        |  4 +-
 tests/qemu-iotests/258                        | 11 ++-
 tests/qemu-iotests/298                        | 17 ++--
 tests/qemu-iotests/303                        |  4 +-
 tests/qemu-iotests/310                        | 22 ++---
 tests/qemu-iotests/iotests.py                 | 69 ++++++++-------
 tests/qemu-iotests/tests/image-fleecing       | 30 ++++---
 .../qemu-iotests/tests/migration-permissions  | 28 +++---
 .../tests/mirror-ready-cancel-error           |  2 +-
 .../qemu-iotests/tests/nbd-reconnect-on-open  |  2 +-
 .../qemu-iotests/tests/stream-error-on-reset  |  4 +-
 ui/cocoa.m                                    |  1 +
 28 files changed, 231 insertions(+), 188 deletions(-)

-- 
2.35.1


