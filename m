Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63C76875D1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 07:23:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNSyY-0005hl-CE; Thu, 02 Feb 2023 01:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pNSyW-0005hY-8F
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 01:21:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pNSyU-0006b7-2t
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 01:21:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675318892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uhoQLU42WidN7WKV9X+1xYuzuebXYcDUmROjHkuJbMk=;
 b=Cd8EjrxG7oxnKUDd2lsi9AkHuQ5/kCWWNf7gh8PE+frOyUIlhgmo0OUrkKxSWggeP9zklP
 VDWmFCeto/6CW1I7lyMgFnKUWtz92+FlP0PXbP6eRd7j3ss9I3VBxYVETyZzK/lK2hPonb
 B4Vo0XSl7jCZatBpHyeiEy3SBaZa7TY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-UQ3P7R5qOOCbortF7U0bgA-1; Thu, 02 Feb 2023 01:21:31 -0500
X-MC-Unique: UQ3P7R5qOOCbortF7U0bgA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA18038012CB;
 Thu,  2 Feb 2023 06:21:30 +0000 (UTC)
Received: from localhost.localdomain (ovpn-14-0.pek2.redhat.com [10.72.14.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62A45404BEC0;
 Thu,  2 Feb 2023 06:21:29 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Jason Wang <jasowang@redhat.com>
Subject: [PULL 00/11] Net patches
Date: Thu,  2 Feb 2023 14:21:15 +0800
Message-Id: <20230202062126.67550-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-01-24 09:45:33 +0000)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 2bd492bca521ee8594f1d5db8dc9aac126fc4f85:

  vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check (2023-02-02 14:16:48 +0800)

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

Laurent Vivier (2):
      tests/qtest: netdev: test stream and dgram backends
      net: stream: add a new option to automatically reconnect

Qiang Liu (2):
      hw/net/lan9118: log [read|write]b when mode_16bit is enabled rather than abort
      hw/net/can/xlnx-zynqmp-can: fix assertion failures in transfer_fifo()

Thomas Huth (3):
      net: Move the code to collect available NIC models to a separate function
      net: Restore printing of the help text with "-nic help"
      net: Replace "Supported NIC models" with "Available NIC models"

 hw/net/can/xlnx-zynqmp-can.c |   9 +-
 hw/net/lan9118.c             |  17 +-
 hw/net/vmxnet3.c             |   2 +-
 hw/pci/pci.c                 |  29 +--
 include/net/net.h            |  14 ++
 net/l2tpv3.c                 |   2 +-
 net/net.c                    |  50 +++-
 net/stream.c                 |  53 ++++-
 net/vhost-vdpa.c             |   2 +-
 net/vmnet-common.m           |  48 +++-
 net/vmnet_int.h              |   2 +
 qapi/net.json                |   7 +-
 qemu-options.hx              |   6 +-
 tests/qtest/meson.build      |   2 +
 tests/qtest/netdev-socket.c  | 549 +++++++++++++++++++++++++++++++++++++++++++
 15 files changed, 730 insertions(+), 62 deletions(-)
 create mode 100644 tests/qtest/netdev-socket.c



