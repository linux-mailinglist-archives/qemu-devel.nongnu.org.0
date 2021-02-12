Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D8231A5F8
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 21:22:45 +0100 (CET)
Received: from localhost ([::1]:55878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAexg-00026Y-Lu
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 15:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAerl-0004DC-Cw
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAerf-0003rt-89
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613160990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2UN94T3S3QmzRiMgznbAJcrL/lGhxZBwq5MzXmZqKs8=;
 b=Y5witKgDeRsM0TQykI8N2nPJpbNYuTv1vzylNykF3cHho8UdAUTdaLWfBVQcerzKIbmzKO
 2rUXv7ZrnFLgM8zwVWy65wNruLn/UDoqrnTRoMqrGHDQlf4coaYBkAKd0IdaGoCDdbbmLz
 Csdj1TtBwGwGpEA+KCKUj7cjNk6FUzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-WLosAFLtMx-LAgvG05uNxA-1; Fri, 12 Feb 2021 15:16:22 -0500
X-MC-Unique: WLosAFLtMx-LAgvG05uNxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEACC835E23
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 20:16:21 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD8FD614EB
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 20:16:21 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/14] NBD patches through 2021-02-12
Date: Fri, 12 Feb 2021 14:16:05 -0600
Message-Id: <20210212201619.1388255-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit eac92d316351b855ba79eb374dd21cc367f1f9c1:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210211-1' into staging (2021-02-11 19:57:50 +0000)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-02-12

for you to fetch changes up to 594427fc56758cb944a85914eefe722cc2c667b8:

  iotests/264: add backup-cancel test-case (2021-02-12 12:19:46 -0600)

----------------------------------------------------------------
nbd patches for 2021-02-12

- let qemu-nbd handle larger backlog of connecting clients
- fix a few NBD-related iotest failures
- add block cancellation hook for faster response to NBD failures

----------------------------------------------------------------
Eric Blake (2):
      qemu-nbd: Use SOMAXCONN for socket listen() backlog
      qemu-nbd: Permit --shared=0 for unlimited clients

Jagannathan Raman (1):
      io: error_prepend() in qio_channel_readv_full_all() causes segfault

Max Reitz (1):
      iotests/210: Fix reference output

Vladimir Sementsov-Ogievskiy (10):
      block: add new BlockDriver handler: bdrv_cancel_in_flight
      block/nbd: implement .bdrv_cancel_in_flight
      block/raw-format: implement .bdrv_cancel_in_flight handler
      job: add .cancel handler for the driver
      block/mirror: implement .cancel job handler
      iotests/264: move to python unittest
      iotests.py: qemu_nbd_popen: remove pid file after use
      iotests/264: add mirror-cancel test-case
      block/backup: implement .cancel job handler
      iotests/264: add backup-cancel test-case

 docs/tools/qemu-nbd.rst       |   4 +-
 include/block/block.h         |   3 +
 include/block/block_int.h     |   9 +++
 include/qemu/job.h            |   5 ++
 block/io.c                    |  11 ++++
 block/backup.c                |  10 +++
 block/mirror.c                |   9 +++
 block/nbd.c                   |  15 +++++
 block/raw-format.c            |   6 ++
 blockdev-nbd.c                |   7 ++-
 io/channel.c                  |   3 +-
 job.c                         |   3 +
 qemu-nbd.c                    |  14 ++++-
 tests/qemu-iotests/210.out    |   2 +-
 tests/qemu-iotests/264        | 140 +++++++++++++++++++++++++++---------------
 tests/qemu-iotests/264.out    |  20 ++----
 tests/qemu-iotests/iotests.py |   6 +-
 17 files changed, 193 insertions(+), 74 deletions(-)

-- 
2.30.1


