Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 896EE4507AF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:57:42 +0100 (CET)
Received: from localhost ([::1]:53932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdQT-00088e-II
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:57:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmdNG-00038X-46
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:54:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmdNE-0007l4-44
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:54:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jdtNZeQ2OpN7dpENocsOvVaOolT8SqemiwMutezgQl8=;
 b=awtjpiRt0AC8GTie3s1TWZv6Ms2fjwgXOLAgrJS+RlLUrIdQ8Zc2cnCPW82z3tuEq55qHi
 N3P3dKyt1jBwc+gMXCpZNyG4YubZxc3V+2vYIGP2hoVVoABSJRJ1koIdfY03Rrpq+gupxd
 m9yusBnfUPyCmMFkl63UJWqW/bwmyi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-IUJiPHMhPNGLTWR_qN9hzQ-1; Mon, 15 Nov 2021 09:54:15 -0500
X-MC-Unique: IUJiPHMhPNGLTWR_qN9hzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 902CF87D546;
 Mon, 15 Nov 2021 14:54:14 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94A1519D9F;
 Mon, 15 Nov 2021 14:54:13 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/13] Block layer patches
Date: Mon, 15 Nov 2021 15:53:56 +0100
Message-Id: <20211115145409.176785-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 42f6c9179be4401974dd3a75ee72defd16b5092d:

  Merge tag 'pull-ppc-20211112' of https://github.com/legoater/qemu into staging (2021-11-12 12:28:25 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 7461272c5f6032436ef9032c091c0118539483e4:

  softmmu/qdev-monitor: fix use-after-free in qdev_set_id() (2021-11-15 15:49:46 +0100)

----------------------------------------------------------------
Block layer patches

- Fixes to image streaming job and block layer reconfiguration to make
  iotest 030 pass again
- docs: Deprecate incorrectly typed device_add arguments
- file-posix: Fix alignment after reopen changing O_DIRECT

----------------------------------------------------------------
Hanna Reitz (10):
      stream: Traverse graph after modification
      block: Manipulate children list in .attach/.detach
      block: Unite remove_empty_child and child_free
      block: Drop detached child from ignore list
      block: Pass BdrvChild ** to replace_child_noperm
      block: Restructure remove_file_or_backing_child()
      transactions: Invoke clean() after everything else
      block: Let replace_child_tran keep indirect pointer
      block: Let replace_child_noperm free children
      iotests/030: Unthrottle parallel jobs in reverse

Kevin Wolf (2):
      docs: Deprecate incorrectly typed device_add arguments
      file-posix: Fix alignment after reopen changing O_DIRECT

Stefan Hajnoczi (1):
      softmmu/qdev-monitor: fix use-after-free in qdev_set_id()

 docs/about/deprecated.rst   |  14 +++
 include/qemu/transactions.h |   3 +
 block.c                     | 233 +++++++++++++++++++++++++++++++++-----------
 block/file-posix.c          |  20 +++-
 block/stream.c              |   7 +-
 softmmu/qdev-monitor.c      |   2 +-
 util/transactions.c         |   8 +-
 tests/qemu-iotests/030      |  11 ++-
 tests/qemu-iotests/142      |  22 +++++
 tests/qemu-iotests/142.out  |  15 +++
 10 files changed, 269 insertions(+), 66 deletions(-)


