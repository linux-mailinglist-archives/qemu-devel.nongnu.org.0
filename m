Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027F2357FF4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 11:52:22 +0200 (CEST)
Received: from localhost ([::1]:54778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lURKn-00043R-2a
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 05:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lURB8-0001hf-6r
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:42:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lURB6-0006Xd-IE
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 05:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617874939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=KfttdVU+ZOfwfzyVkOu/9A8qZQToirVThRovtIhY48w=;
 b=FEsmNpz9vrQSK3qqYaKBWGGVZmOVGwFM3p+0ObXdnyxuBJh1rno6I/A9BuZ8eBZe1qPmFW
 8OuEj4jVlsOmFlhGQL65fmZtCwmjjjd3fXzBmjCRqwKBT60fhVKnIWrZl2tGXlpZXu1/5k
 LkUr3/f7z4944o/KjUKD5dwp+NeTeDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-4opfQaCeNrKm6LkKFHWy_w-1; Thu, 08 Apr 2021 05:42:16 -0400
X-MC-Unique: 4opfQaCeNrKm6LkKFHWy_w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 863448030A1;
 Thu,  8 Apr 2021 09:42:15 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-61.pek2.redhat.com
 [10.72.13.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21F6E10013C1;
 Thu,  8 Apr 2021 09:42:13 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 0/6] Net patches
Date: Thu,  8 Apr 2021 17:42:05 +0800
Message-Id: <1617874931-4437-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d0d3dd401b70168a353450e031727affee828527:

  Update version for v6.0.0-rc2 release (2021-04-06 18:34:34 +0100)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 21df394d9e2ffce9fa308f496d1ae228cf6cdb57:

  tap-win32: correctly recycle buffers (2021-04-08 17:33:59 +0800)

----------------------------------------------------------------

Fixes for rc3:

- query-netdev is reverted (that's why the changeset is huge)
- fix a regression caused by padding for in TAP for win32


----------------------------------------------------------------
Jason Wang (6):
      Revert "net: Do not fill legacy info_str for backends"
      Revert "hmp: Use QAPI NetdevInfo in hmp_info_network"
      Revert "net: Move NetClientState.info_str to dynamic allocations"
      Revert "tests: Add tests for query-netdev command"
      Revert "qapi: net: Add query-netdev command"
      tap-win32: correctly recycle buffers

 hw/net/xen_nic.c                  |   5 +-
 include/net/net.h                 |   5 +-
 include/qapi/hmp-output-visitor.h |  30 ------
 net/l2tpv3.c                      |   8 +-
 net/net.c                         |  73 ++------------
 net/netmap.c                      |   7 --
 net/slirp.c                       | 124 +-----------------------
 net/socket.c                      |  92 +++++-------------
 net/tap-win32.c                   |  16 ++--
 net/tap.c                         | 107 +++------------------
 net/vde.c                         |  25 +----
 net/vhost-user.c                  |  20 +---
 net/vhost-vdpa.c                  |  15 +--
 qapi/hmp-output-visitor.c         | 193 --------------------------------------
 qapi/meson.build                  |   1 -
 qapi/net.json                     |  80 ----------------
 tests/qtest/meson.build           |   3 -
 tests/qtest/test-query-netdev.c   | 120 ------------------------
 18 files changed, 66 insertions(+), 858 deletions(-)
 delete mode 100644 include/qapi/hmp-output-visitor.h
 delete mode 100644 qapi/hmp-output-visitor.c
 delete mode 100644 tests/qtest/test-query-netdev.c



