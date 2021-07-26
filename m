Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A376A3D59BD
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 14:47:14 +0200 (CEST)
Received: from localhost ([::1]:34650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m800n-0002S1-8p
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 08:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7zxd-00004z-Ej
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:43:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7zxa-0007oP-Kz
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627303432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zdwnGSDmF1ho7BP/aogDzJoVruq1j/cdBobaW4LzoOE=;
 b=HBm/bmUTZtyIo3b+qSaZOnGddBZX7xz/s6uqH2vWwSg9uEXUFnh4MHBBHuXsBWh4jhtLUt
 i5XrfL2LH6iUnEhp0vvPGk4LSkNljfd9jvoBL4G7DES6Kj79HUn9Tbbocj1KZFU/PSp4oW
 hbmkiinBeKO5htUfSm3NH2GsZOlZPkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-wKP9ryi2MnOgPG8XKAzRUg-1; Mon, 26 Jul 2021 08:43:50 -0400
X-MC-Unique: wKP9ryi2MnOgPG8XKAzRUg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80E89107B78C;
 Mon, 26 Jul 2021 12:43:49 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-117.ams2.redhat.com
 [10.36.113.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E7A860C4A;
 Mon, 26 Jul 2021 12:43:36 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	wei.w.wang@intel.com,
	peterx@redhat.com
Subject: [PULL 0/7] migration queue
Date: Mon, 26 Jul 2021 13:43:24 +0100
Message-Id: <20210726124331.124710-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: berrange@redhat.com, leobras@redhat.com, david@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit a2376507f615495b1d16685449ce0ea78c2caf9d:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-07-24 11:04:57 +0100)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-migration-20210726a

for you to fetch changes up to 3143577d6a3f363514219c03d936e653ede44f32:

  migration: clear the memory region dirty bitmap when skipping free pages (2021-07-26 12:50:13 +0100)

----------------------------------------------------------------
Migration fixes 2021-07-26

Peter's fix for a bunch of races
 -> Seem to fix the occasional crash seen by Peter

Wei's fix for migration with free page hinting
 -> Bug has been around for a while, but makes a huge difference

My fix for OpenBSD test corner case

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Dr. David Alan Gilbert (1):
      tests/qtest/migration-test.c: use 127.0.0.1 instead of 0

Peter Xu (5):
      migration: Fix missing join() of rp_thread
      migration: Make from_dst_file accesses thread-safe
      migration: Introduce migration_ioc_[un]register_yank()
      migration: Teach QEMUFile to be QIOChannel-aware
      migration: Move the yank unregister of channel_close out

Wei Wang (1):
      migration: clear the memory region dirty bitmap when skipping free pages

 migration/channel.c           | 15 ++-------
 migration/migration.c         | 57 +++++++++++++++++++++++++-------
 migration/migration.h         | 15 +++++++--
 migration/multifd.c           |  8 ++---
 migration/qemu-file-channel.c | 11 ++-----
 migration/qemu-file.c         | 17 +++++++++-
 migration/qemu-file.h         |  4 ++-
 migration/ram.c               | 77 ++++++++++++++++++++++++++++++++-----------
 migration/savevm.c            | 11 +++++--
 migration/yank_functions.c    | 42 +++++++++++++++++++++++
 migration/yank_functions.h    |  3 ++
 tests/qtest/migration-test.c  |  4 +--
 12 files changed, 196 insertions(+), 68 deletions(-)


