Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E0431A845
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 00:24:28 +0100 (CET)
Received: from localhost ([::1]:41670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAhnX-0005mv-8g
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 18:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAhkw-0003uC-0L
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 18:21:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAhks-0005m8-PZ
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 18:21:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613172101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YVdJaCevWr1PzeOS9Apeds+B6VHPOotSsZWrP2ZqIfQ=;
 b=LDKpOnyG++mrnMJ3WzqubIgsm5pgI16YKWz0V6Dya/6xwzctXurZ48XR7dDDwrmssO7FRc
 cy2vbdlcukKvbf9qWExmt7dBbRVPtoO1yluWZTAcHu7gWEfg27w3A3GHRXKX/65MHhEEp4
 JooUJ6kgZu5JBQ6louYlCiMwAkU1N0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-Kiq-AD_YPRW_si335oEzXQ-1; Fri, 12 Feb 2021 18:21:38 -0500
X-MC-Unique: Kiq-AD_YPRW_si335oEzXQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23B2F1E563
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 23:21:37 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4FC617B37
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 23:21:36 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] bitmaps patches through 2021-02-12
Date: Fri, 12 Feb 2021 17:21:29 -0600
Message-Id: <20210212232134.1462756-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

  https://repo.or.cz/qemu/ericb.git tags/pull-bitmaps-2021-02-12

for you to fetch changes up to 934aee14d36e67468260635af61c387227cdaf78:

  block: use return status of bdrv_append() (2021-02-12 15:39:44 -0600)

----------------------------------------------------------------
bitmaps patches for 2021-02-12

- add 'transform' member to manipulate bitmaps across migration
- work towards better error handling during bdrv_open

----------------------------------------------------------------
Peter Krempa (3):
      migration: dirty-bitmap: Use struct for alias map inner members
      migration: dirty-bitmap: Allow control of bitmap persistence
      qemu-iotests: 300: Add test case for modifying persistence of bitmap

Vladimir Sementsov-Ogievskiy (2):
      block: return status from bdrv_append and friends
      block: use return status of bdrv_append()

 qapi/migration.json            | 19 ++++++++-
 include/block/block.h          | 12 +++---
 block.c                        | 64 +++++++++++++++++------------
 block/backup-top.c             | 23 +++++------
 block/commit.c                 |  6 +--
 block/mirror.c                 |  6 +--
 blockdev.c                     |  6 +--
 migration/block-dirty-bitmap.c | 62 +++++++++++++++++++++-------
 tests/test-bdrv-graph-mod.c    |  6 +--
 tests/qemu-iotests/300         | 93 ++++++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/300.out     |  4 +-
 11 files changed, 226 insertions(+), 75 deletions(-)

-- 
2.30.1


