Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9EB6958EF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 07:13:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRoXu-0001vD-NT; Tue, 14 Feb 2023 01:12:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pRoXo-0001uv-1n
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 01:12:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pRoXm-0007n0-2Z
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 01:11:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676355116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jNVDPDP8ZXoxRY4Eg1dJnZC6fz579DXGxepS1DgFdvU=;
 b=RUCgxkrC28ztazPn9Hu6Lyol2+OO0C6p1F9aAcKbqvStuzlI0g5hkekvIxEHy0uDUk8T//
 yZUssBdIvs5Efmf8eNmifRzmkKer2v7qWXIoySe8uTTg50s7I/GNR48iIy6i+sllFxikDJ
 e01gF9frxkvxYfwYcKSzmhxq5M3pIRE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-YAUmuSyePQ2yTgSMj4ngCg-1; Tue, 14 Feb 2023 01:11:52 -0500
X-MC-Unique: YAUmuSyePQ2yTgSMj4ngCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0F5B811E6E;
 Tue, 14 Feb 2023 06:11:51 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-89.pek2.redhat.com [10.72.12.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AC43140EBF6;
 Tue, 14 Feb 2023 06:11:49 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>
Subject: [PULL 00/10] Net patches
Date: Tue, 14 Feb 2023 14:11:30 +0800
Message-Id: <20230214061140.36696-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

The following changes since commit f670b3eec7f5d1ed8c4573ef244e7b8c6b32001b:

  Merge tag 'migration-20230213-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-02-13 11:54:05 +0000)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to e4b953a26da11d214f91516cb9b0542eab5afaa0:

  vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check (2023-02-14 14:00:30 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Christian Svensson (1):
      net: Increase L2TPv3 buffer to fit jumboframes

Eugenio Pérez (1):
      vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check

Fiona Ebner (1):
      hw/net/vmxnet3: allow VMXNET3_MAX_MTU itself as a value

Joelle van Dyne (1):
      vmnet: stop recieving events when VM is stopped

Laurent Vivier (1):
      net: stream: add a new option to automatically reconnect

Qiang Liu (2):
      hw/net/lan9118: log [read|write]b when mode_16bit is enabled rather than abort
      hw/net/can/xlnx-zynqmp-can: fix assertion failures in transfer_fifo()

Thomas Huth (3):
      net: Move the code to collect available NIC models to a separate function
      net: Restore printing of the help text with "-nic help"
      net: Replace "Supported NIC models" with "Available NIC models"

 hw/net/can/xlnx-zynqmp-can.c |   9 +++-
 hw/net/lan9118.c             |  17 ++++----
 hw/net/vmxnet3.c             |   2 +-
 hw/pci/pci.c                 |  29 +------------
 include/net/net.h            |  14 ++++++
 net/l2tpv3.c                 |   2 +-
 net/net.c                    |  50 +++++++++++++++++++--
 net/stream.c                 |  53 ++++++++++++++++++++++-
 net/vhost-vdpa.c             |   2 +-
 net/vmnet-common.m           |  48 ++++++++++++++------
 net/vmnet_int.h              |   2 +
 qapi/net.json                |   7 ++-
 qemu-options.hx              |   6 +--
 tests/qtest/netdev-socket.c  | 101 +++++++++++++++++++++++++++++++++++++++++++
 14 files changed, 280 insertions(+), 62 deletions(-)


