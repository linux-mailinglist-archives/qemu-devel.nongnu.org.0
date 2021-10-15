Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C61F42F63B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 16:51:09 +0200 (CEST)
Received: from localhost ([::1]:46690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbOY8-0002bR-5G
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 10:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbOVe-0008Gn-Na
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:48:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mbOVU-0001T9-K4
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 10:48:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634309303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HlTOguKDPqBHn1E3r8ayd+ju7HHcg1c25950vRvtYu8=;
 b=cZt1bV9tPFyJk0sySGg7lZFmRyCLWVfTjlKF03UVjhUhzadWrTfZTrEohznEAuWhIGIwNF
 +cNsL0UXFW4wWADH/9WBOba4h4b3yPEcguAziIFXzCbgqne1NSi6D7/yYsStbB1ULsT05b
 g0tet5zlV4J3Hnr79+F4uHW4ZJXpUDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-8L1wB737PqW4943_p7PAuQ-1; Fri, 15 Oct 2021 10:48:20 -0400
X-MC-Unique: 8L1wB737PqW4943_p7PAuQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2325DF8A0
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 14:48:19 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B82319736;
 Fri, 15 Oct 2021 14:48:11 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/15] qdev: Add JSON -device
Date: Fri, 15 Oct 2021 16:46:25 +0200
Message-Id: <20211015144640.198044-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: kwolf@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 4d1a525dfafe995a98bb486e702da09e31b68b9c:

  Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2021-10-14 10:49:38 -0700)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 5dacda5167560b3af8eadbce5814f60ba44b467e:

  vl: Enable JSON syntax for -device (2021-10-15 16:11:22 +0200)

----------------------------------------------------------------
qdev: Add JSON -device

- Add a JSON mode to the -device command line option
- net/vhost-{user,vdpa}: Fix device compatibility check
- Minor iotests fixes

----------------------------------------------------------------
Damien Hedde (1):
      softmmu/qdev-monitor: add error handling in qdev_set_id

Kevin Wolf (14):
      net: Introduce NetClientInfo.check_peer_type()
      net/vhost-user: Fix device compatibility check
      net/vhost-vdpa: Fix device compatibility check
      qom: Reduce use of error_propagate()
      iotests/245: Fix type for iothread property
      iotests/051: Fix typo
      qdev: Avoid using string visitor for properties
      qdev: Make DeviceState.id independent of QemuOpts
      qemu-option: Allow deleting opts during qemu_opts_foreach()
      qdev: Add Error parameter to hide_device() callbacks
      virtio-net: Store failover primary opts pointer locally
      virtio-net: Avoid QemuOpts in failover_find_primary_device()
      qdev: Base object creation on QDict rather than QemuOpts
      vl: Enable JSON syntax for -device

 qapi/qdev.json                      |  15 ++++--
 include/hw/qdev-core.h              |  16 ++++--
 include/hw/virtio/virtio-net.h      |   2 +
 include/monitor/qdev.h              |  27 +++++++++-
 include/net/net.h                   |   2 +
 hw/arm/virt.c                       |   2 +-
 hw/core/qdev-properties-system.c    |   6 +++
 hw/core/qdev.c                      |  11 ++--
 hw/net/virtio-net.c                 |  85 +++++++++++++++---------------
 hw/pci-bridge/pci_expander_bridge.c |   2 +-
 hw/ppc/e500.c                       |   2 +-
 hw/vfio/pci.c                       |   4 +-
 hw/xen/xen-legacy-backend.c         |   3 +-
 net/vhost-user.c                    |  41 +++++----------
 net/vhost-vdpa.c                    |  37 +++++--------
 qom/object.c                        |   7 ++-
 qom/object_interfaces.c             |  19 +++----
 softmmu/qdev-monitor.c              | 100 +++++++++++++++++++++++-------------
 softmmu/vl.c                        |  63 ++++++++++++++++++++---
 util/qemu-option.c                  |   4 +-
 tests/qemu-iotests/051              |   2 +-
 tests/qemu-iotests/051.pc.out       |   4 +-
 tests/qemu-iotests/245              |   4 +-
 23 files changed, 280 insertions(+), 178 deletions(-)


