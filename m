Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 938E96F5ECA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 21:03:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puHkO-0001of-Uj; Wed, 03 May 2023 15:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1puHkN-0001oP-FT
 for qemu-devel@nongnu.org; Wed, 03 May 2023 15:02:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1puHkL-0004vf-Oz
 for qemu-devel@nongnu.org; Wed, 03 May 2023 15:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683140556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oTIXvl+pcgGms2Dbj53GITxljD2N0lm+5O3U/HDBNl0=;
 b=eHHydgGZZAQssWRna73spRcJdrrCBCYUksNefIl3vN2+DKiKMe4u3/oN8nofb0/MtzMyPJ
 h9sBFTlKM4FlFrPCOtRnMyeS9dSUvTP1s91rKPjqYc0YNJqegnc+d07CuImGyS/rqs2PVc
 pTuXAnevPV/KMfVGy1K5CbdR8o2Wl4M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-RrSFxhnWMqScVHCl-S2dgg-1; Wed, 03 May 2023 15:02:35 -0400
X-MC-Unique: RrSFxhnWMqScVHCl-S2dgg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B27F287B2A9
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 19:02:34 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DBA71410F2B
 for <qemu-devel@nongnu.org>; Wed,  3 May 2023 19:02:34 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] NBD pull request for 2023-05-03
Date: Wed,  3 May 2023 14:02:30 -0500
Message-Id: <20230503190232.362022-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 044f8cf70a2fdf3b9e4c4d849c66e7855d2c446a:

  Merge tag 'migration-20230428-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-05-03 10:29:30 +0100)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2023-05-03

for you to fetch changes up to de79b52604e43fdeba6cee4f5af600b62169f2d2:

  block/export: call blk_set_dev_ops(blk, NULL, NULL) (2023-05-03 14:00:08 -0500)

----------------------------------------------------------------
nbd patches for 2023-05-03

- Eric Blake: clear LISTEN_FDNAMES when consuming systemd sockets
- Stefan Hajnoczi: clear export BlockDeviceOps in central location

----------------------------------------------------------------
Eric Blake (1):
      systemd: Also clear LISTEN_FDNAMES during systemd socket activation

Stefan Hajnoczi (1):
      block/export: call blk_set_dev_ops(blk, NULL, NULL)

 block/export/export.c    | 2 ++
 block/export/vduse-blk.c | 1 -
 util/systemd.c           | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

base-commit: 044f8cf70a2fdf3b9e4c4d849c66e7855d2c446a
-- 
2.40.1


