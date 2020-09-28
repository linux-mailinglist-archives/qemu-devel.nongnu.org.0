Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A747A27B0D9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 17:23:44 +0200 (CEST)
Received: from localhost ([::1]:39996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMv0B-0002QT-4r
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 11:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kMuxB-0000eb-0w
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 11:20:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kMux9-0004dd-Dh
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 11:20:36 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601306432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c8TuIfohHbPGsMVOBo2pPgBrPk7uaEGzXKGfRuYcKcY=;
 b=czaOOBkvIkoQUcA8mix3lfpWvOGbL3v6C+lEH8lFzSgHZxbDH9XpjHvNV7Wszbv2pK+Ht8
 CSEO4rA/mvhyzb/bt57D0+PdgA4rvvwTY6fQe9vB1ZAXYqStKxlpAoubghftsEOSqYhCJM
 jnm10pELE5cy4+iw2Ygx5hfLc2els4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-7DCRQ0WTOe2rsavGdsqAbg-1; Mon, 28 Sep 2020 11:20:30 -0400
X-MC-Unique: 7DCRQ0WTOe2rsavGdsqAbg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A01FE10BBEC3
 for <qemu-devel@nongnu.org>; Mon, 28 Sep 2020 15:20:29 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-190.ams2.redhat.com
 [10.36.114.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCF67614F5;
 Mon, 28 Sep 2020 15:20:25 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	peterx@redhat.com
Subject: [PULL 0/1] migration queue
Date: Mon, 28 Sep 2020 16:20:23 +0100
Message-Id: <20200928152024.209894-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 03:47:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 8d16e72f2d4df2c9e631393adf1669a1da7efe8a:

  Merge remote-tracking branch 'remotes/dgilbert/tags/pull-migration-20200925a' into staging (2020-09-25 14:46:18 +0100)

are available in the Git repository at:

  git://github.com/dagrh/qemu.git tags/pull-migration-20200928a

for you to fetch changes up to 1783c00fc998220f9ca13b7eeca1d610243bc11b:

  Revert "migration: Properly destroy variables on incoming side" (2020-09-28 16:18:02 +0100)

----------------------------------------------------------------
Migration: Revert one patch for 068 fix

One patch in the last pull broke test 068 which
does a pair of vmload's.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Dr. David Alan Gilbert (1):
      Revert "migration: Properly destroy variables on incoming side"

 migration/migration.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)


