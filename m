Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2A73CFD2B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:13:50 +0200 (CEST)
Received: from localhost ([::1]:49442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rRN-0005wL-6p
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rOm-0002il-Sd
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rOg-0000fE-Qo
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626793861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DbHcgeyAx6JNOXczQsZjnjm0ycw5kLyZbuUh1mm4slw=;
 b=g/wlP+92tqXCKDdNSPaEcDNZBnNjlG0TyzZlRG/tnBlWoDEXZQSTVPkuIYhh1s03lJrg9U
 mcGMZKQ9endOojWDToSkEU/VoYjnvWl5opyuVPJRSwPz7t6jxUXyaMTMvrs5QEWrYAbuP7
 xC2jGoEx62tKQPDmIO5FwZCIByr5c3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-sI0hA0JmPIqsq9e6SdSJHA-1; Tue, 20 Jul 2021 11:10:57 -0400
X-MC-Unique: sI0hA0JmPIqsq9e6SdSJHA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9DB1100C609;
 Tue, 20 Jul 2021 15:10:56 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9942983BF9;
 Tue, 20 Jul 2021 15:10:55 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/11] Block layer patches
Date: Tue, 20 Jul 2021 17:10:42 +0200
Message-Id: <20210720151053.226144-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 143c2e0432859826c9e8d5b2baa307355f1a5332:

  Merge remote-tracking branch 'remotes/maxreitz/tags/pull-block-2021-07-19' into staging (2021-07-19 19:06:05 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to d21471696b07f30cb00453709d055a25c1afde85:

  iotests/307: Test iothread conflict for exports (2021-07-20 16:49:50 +0200)

----------------------------------------------------------------
Block layer patches

- mirror: Fix active mirror deadlock
- replication: Fix crashes due to operations on wrong BdrvChild
- configure: Add option to use driver whitelist even in tools
- vvfat: Fix crash when opening image read-write
- export: Fix crash in error path with fixed-iothread=false

----------------------------------------------------------------
Kevin Wolf (1):
      block: Add option to use driver whitelist even in tools

Lukas Straub (4):
      replication: Remove s->active_disk
      replication: Reduce usage of s->hidden_disk and s->secondary_disk
      replication: Properly attach children
      replication: Remove workaround

Max Reitz (2):
      block/export: Conditionally ignore set-context error
      iotests/307: Test iothread conflict for exports

Vladimir Sementsov-Ogievskiy (4):
      block/mirror: set .co for active-write MirrorOp objects
      iotest 151: add test-case that shows active mirror dead-lock
      block/mirror: fix active mirror dead-lock in mirror_wait_on_conflicts
      block/vvfat: fix: drop backing

 configure                  |  14 +++++-
 block.c                    |   3 ++
 block/export/export.c      |   5 +-
 block/mirror.c             |  13 ++++++
 block/replication.c        | 111 +++++++++++++++++++++++++++------------------
 block/vvfat.c              |  43 ++----------------
 meson.build                |   1 +
 tests/qemu-iotests/151     |  54 +++++++++++++++++++++-
 tests/qemu-iotests/151.out |   4 +-
 tests/qemu-iotests/307     |  15 ++++++
 tests/qemu-iotests/307.out |   8 ++++
 11 files changed, 182 insertions(+), 89 deletions(-)


