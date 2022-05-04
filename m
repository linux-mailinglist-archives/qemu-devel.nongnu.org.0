Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB7B51A231
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:29:04 +0200 (CEST)
Received: from localhost ([::1]:58614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmFzz-0004ha-Oy
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwd-0000mB-V5
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwc-0007E5-8o
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651674333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=b+P3PiqwGea+oVSwAGMVOqLoLaam+vt1T5Xy6afs/mc=;
 b=dSs+9bXOcFwhwISxSokLoduMbfqJVq0ksqzCdBBbCAIX8MRweB0VwECnBjjnliJJd6RDhN
 D0G/l34ACQkYSwBRyY4aC1yKp3X7Malq+igjv3Gzmfv2WWYzRa7UwmY6HIBGmXXKftZsqA
 bx6ACD0phkJhs1T60uBO7FmcOypNrFQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-7767qIsJNcmyPo_sL53gAA-1; Wed, 04 May 2022 10:25:30 -0400
X-MC-Unique: 7767qIsJNcmyPo_sL53gAA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7579811E76;
 Wed,  4 May 2022 14:25:29 +0000 (UTC)
Received: from merkur.str.redhat.com (dhcp-192-180.str.redhat.com
 [10.33.192.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35EFF4021A2;
 Wed,  4 May 2022 14:25:29 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 00/13] Block layer patches
Date: Wed,  4 May 2022 16:25:09 +0200
Message-Id: <20220504142522.167506-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The following changes since commit 2e3408b3cc7de4e87a9adafc8c19bfce3abec947:

  Merge tag 'misc-pull-request' of gitlab.com:marcandre.lureau/qemu into staging (2022-05-03 09:13:17 -0700)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to c1fe694357a328c807ae3cc6961c19e923448fcc:

  coroutine-win32: use QEMU_DEFINE_STATIC_CO_TLS() (2022-05-04 15:55:23 +0200)

----------------------------------------------------------------
Block layer patches

- Fix and re-enable GLOBAL_STATE_CODE assertions
- vhost-user: Fixes for VHOST_USER_ADD/REM_MEM_REG
- vmdk: Fix reopening bs->file
- coroutine: use QEMU_DEFINE_STATIC_CO_TLS()
- docs/qemu-img: Fix list of formats which implement check

----------------------------------------------------------------
Denis V. Lunev (1):
      qemu-img: properly list formats which have consistency check implemented

Hanna Reitz (6):
      block: Classify bdrv_get_flags() as I/O function
      qcow2: Do not reopen data_file in invalidate_cache
      Revert "main-loop: Disable GLOBAL_STATE_CODE() assertions"
      iotests: Add regression test for issue 945
      block/vmdk: Fix reopening bs->file
      iotests/reopen-file: Test reopening file child

Kevin Wolf (3):
      docs/vhost-user: Clarifications for VHOST_USER_ADD/REM_MEM_REG
      libvhost-user: Fix extra vu_add/rem_mem_reg reply
      vhost-user: Don't pass file descriptor for VHOST_USER_REM_MEM_REG

Stefan Hajnoczi (3):
      coroutine-ucontext: use QEMU_DEFINE_STATIC_CO_TLS()
      coroutine: use QEMU_DEFINE_STATIC_CO_TLS()
      coroutine-win32: use QEMU_DEFINE_STATIC_CO_TLS()

 docs/interop/vhost-user.rst                        |  17 ++++
 docs/tools/qemu-img.rst                            |   4 +-
 include/block/block-global-state.h                 |   1 -
 include/block/block-io.h                           |   1 +
 include/qemu/main-loop.h                           |   3 +-
 block.c                                            |   2 +-
 block/qcow2.c                                      | 104 ++++++++++++---------
 block/vmdk.c                                       |  56 ++++++++++-
 hw/virtio/vhost-user.c                             |   2 +-
 subprojects/libvhost-user/libvhost-user.c          |  17 ++--
 util/coroutine-ucontext.c                          |  38 +++++---
 util/coroutine-win32.c                             |  18 +++-
 util/qemu-coroutine.c                              |  41 ++++----
 tests/qemu-iotests/tests/export-incoming-iothread  |  81 ++++++++++++++++
 .../tests/export-incoming-iothread.out             |   5 +
 tests/qemu-iotests/tests/reopen-file               |  89 ++++++++++++++++++
 tests/qemu-iotests/tests/reopen-file.out           |   5 +
 17 files changed, 388 insertions(+), 96 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/export-incoming-iothread
 create mode 100644 tests/qemu-iotests/tests/export-incoming-iothread.out
 create mode 100755 tests/qemu-iotests/tests/reopen-file
 create mode 100644 tests/qemu-iotests/tests/reopen-file.out


