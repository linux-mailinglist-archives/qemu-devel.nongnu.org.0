Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C35380E55
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:41:20 +0200 (CEST)
Received: from localhost ([::1]:43116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhasJ-0004eO-K1
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhajT-0000Gp-Qq
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:32:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhajH-0001Aj-6Y
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621009918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rfUJ8z0CeU8aENIPf/nCtzLzHptcUMc+lZqTv/ZwLEg=;
 b=f31cseCzrCZ3UkY4bX7mN+wbVR6BLBUaBEHmDiT+hgAi6oYQ3/c7/U40Uo+Nm/7LpPOXUV
 Gc4QRuwBN+buTPe9qjkzloZFDFl9UfQ+8CEIOxdIMSzAKKM05QKQyAOpuHv3gD+onIb3Jr
 5n0pydTMWuu3mpum8fBf15RJy5a7bVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-cj_1i31MOOeqE6J6bKczIw-1; Fri, 14 May 2021 12:31:56 -0400
X-MC-Unique: cj_1i31MOOeqE6J6bKczIw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40BFB800D55;
 Fri, 14 May 2021 16:31:55 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-116.ams2.redhat.com [10.36.114.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4838619D9B;
 Fri, 14 May 2021 16:31:54 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/14] Block layer patches
Date: Fri, 14 May 2021 18:31:10 +0200
Message-Id: <20210514163124.251741-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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

The following changes since commit 96662996eda78c48aadddd4e76d8615c7eb72d80:

  Merge remote-tracking branch 'remotes/dgilbert/tags/pull-migration-20210513a' into staging (2021-05-14 12:03:47 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to b773c9fb68ceff9a9692409d7afbc5d6865983c6:

  vhost-user-blk: Check that num-queues is supported by backend (2021-05-14 18:04:27 +0200)

----------------------------------------------------------------
Block layer patches

- vhost-user-blk: Fix error handling during initialisation
- Add test cases for the vhost-user-blk export
- Fix leaked Transaction objects
- qcow2: Expose dirty bit in 'qemu-img info'

----------------------------------------------------------------
Coiby Xu (1):
      test: new qTest case to test the vhost-user-blk-server

Kevin Wolf (8):
      block: Fix Transaction leak in bdrv_root_attach_child()
      block: Fix Transaction leak in bdrv_reopen_multiple()
      vhost-user-blk: Make sure to set Error on realize failure
      vhost-user-blk: Don't reconnect during initialisation
      vhost-user-blk: Improve error reporting in realize
      vhost-user-blk: Get more feature flags from vhost device
      virtio: Fail if iommu_platform is requested, but unsupported
      vhost-user-blk: Check that num-queues is supported by backend

Michael Tokarev (1):
      qapi: spelling fix (addtional)

Stefan Hajnoczi (3):
      block/export: improve vu_blk_sect_range_ok()
      tests/qtest: add multi-queue test case to vhost-user-blk-test
      vhost-user-blk-test: test discard/write zeroes invalid inputs

Vladimir Sementsov-Ogievskiy (1):
      qcow2: set bdi->is_dirty

 qapi/qom.json                        |   4 +-
 include/hw/virtio/vhost.h            |   2 +
 tests/qtest/libqos/vhost-user-blk.h  |  48 ++
 block.c                              |   9 +-
 block/export/vhost-user-blk-server.c |   9 +-
 block/qcow2.c                        |   1 +
 hw/block/vhost-user-blk.c            |  85 ++-
 hw/virtio/vhost-user.c               |   5 +
 hw/virtio/virtio-bus.c               |   5 +
 tests/qtest/libqos/vhost-user-blk.c  | 130 +++++
 tests/qtest/vhost-user-blk-test.c    | 989 +++++++++++++++++++++++++++++++++++
 MAINTAINERS                          |   2 +
 tests/qtest/libqos/meson.build       |   1 +
 tests/qtest/meson.build              |   4 +
 14 files changed, 1232 insertions(+), 62 deletions(-)
 create mode 100644 tests/qtest/libqos/vhost-user-blk.h
 create mode 100644 tests/qtest/libqos/vhost-user-blk.c
 create mode 100644 tests/qtest/vhost-user-blk-test.c


