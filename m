Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7890E6BD318
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 16:14:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcpHY-0001Qo-Nf; Thu, 16 Mar 2023 11:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcpHN-0001QN-Fc
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:12:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcpHL-0003HV-2K
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:12:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678979549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G+70bySaviziP5TlEV1lrGMYkOioXW1zh+xkXqvOiEM=;
 b=N2c9/BIQNUMOtI4yQqW1oJproDTul0ODQj12v8UVmK2C0p45Fl9HxDebj3urN3PbGNhQMy
 au29MDENnZOjN8KcYJiLUoPH12/WIGUIvYdpdVw1LiwudGhI+N+vgz42jrp6ZHHs2AllVB
 +t4lvvcmL7+GiERF38Y5ag+xFdZA3YI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-AGbVT0JxOl-kTer02jWYdw-1; Thu, 16 Mar 2023 11:12:27 -0400
X-MC-Unique: AGbVT0JxOl-kTer02jWYdw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 401482807D76
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 15:12:27 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5F10492B06;
 Thu, 16 Mar 2023 15:12:26 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 0/7] Migration 20230316 patches
Date: Thu, 16 Mar 2023 16:12:18 +0100
Message-Id: <20230316151225.11362-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 9636e513255362c4a329e3e5fb2c97dab3c5ce47:

  Merge tag 'misc-next-pull-request' of https://gitlab.com/berrange/qemu into staging (2023-03-15 17:20:04 +0000)

are available in the Git repository at:

  https://gitlab.com/juan.quintela/qemu.git tags/migration-20230316-pull-request

for you to fetch changes up to fa76c854ae837328187bef41d80af5d1ad36681f:

  migration: fix populate_vfio_info (2023-03-16 16:07:07 +0100)

----------------------------------------------------------------
Migration Pull request

Hi

This is just fixes for migration.
- Fix rdma (dave)
- Remove unused variable (Zhijian)
- Fix AVX512 and XBZRLE (Matheus)
- Fix migration preempt (Peter)
- Fix populate_vfio_info (Steve)
- Fix multifd send trace (Wei)

Please apply.

Later, Juan.

----------------------------------------------------------------

Dr. David Alan Gilbert (1):
  migration/rdma: Fix return-path case

Li Zhijian (1):
  migration/rdma: Remove deprecated variable rdma_return_path

Matheus Tavares Bernardino (2):
  migration/xbzrle: use ctz64 to avoid undefined result
  migration/xbzrle: fix out-of-bounds write with axv512

Peter Xu (1):
  migration: Wait on preempt channel in preempt thread

Steve Sistare (1):
  migration: fix populate_vfio_info

Wei Wang (1):
  migration/multifd: correct multifd_send_thread to trace the flags

 migration/multifd.c      |  3 ++-
 migration/postcopy-ram.c | 11 ++++++-----
 migration/rdma.c         | 11 ++++++-----
 migration/target.c       |  2 +-
 migration/xbzrle.c       | 12 ++++++------
 5 files changed, 21 insertions(+), 18 deletions(-)

-- 
2.39.2


