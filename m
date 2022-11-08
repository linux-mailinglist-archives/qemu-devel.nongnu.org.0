Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2455E620830
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 05:20:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osG5M-0000Cr-Hk; Mon, 07 Nov 2022 23:19:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1osG5K-0000Ce-BG
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 23:19:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1osG5I-0004LV-O7
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 23:19:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667881174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3R7QvoupxUto1N6dDsXvepHfE8nt+oCb5uuYNpkGTFA=;
 b=Ygzz8Qs8guQZLOQBeYI0r1NHVidfJ7gEDBxs+ljPttoTZI5aR03OMqRtHrXcZ5aTfTN5K9
 jSs8NipDB5v9x89NvDkZ8KvMeQU/8w09/zs3bZHEDMAWkdSQT6iCNHBs7v8kCEtczuyeZz
 veOPGofGARea5ictBl50gib0q/+wB90=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-jF2ke-wONPOjMDRT2tM2tQ-1; Mon, 07 Nov 2022 23:19:33 -0500
X-MC-Unique: jF2ke-wONPOjMDRT2tM2tQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 201438027EC
 for <qemu-devel@nongnu.org>; Tue,  8 Nov 2022 04:19:33 +0000 (UTC)
Received: from localhost.localdomain (ovpn-14-19.pek2.redhat.com [10.72.14.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 757D4111F3BB;
 Tue,  8 Nov 2022 04:19:31 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: stefanha@redhat.com
Cc: qemu-devel@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Subject: [PULL 0/2] Net patches
Date: Tue,  8 Nov 2022 12:19:27 +0800
Message-Id: <20221108041929.18417-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

The following changes since commit 524fc737431d240f9d9f10aaf381003092868bac:

  util/log: Ignore per-thread flag if global file already there (2022-11-07 16:00:02 -0500)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to fd2c87c7b0c97be2ac8d334885419f51f5963b51:

  tests/qtest: netdev: test stream and dgram backends (2022-11-08 12:10:26 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Laurent Vivier (1):
      tests/qtest: netdev: test stream and dgram backends

Si-Wei Liu (1):
      vhost-vdpa: fix assert !virtio_net_get_subqueue(nc)->async_tx.elem in virtio_net_reset

 net/vhost-vdpa.c            |   2 +-
 tests/qtest/meson.build     |   2 +
 tests/qtest/netdev-socket.c | 435 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 438 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/netdev-socket.c



