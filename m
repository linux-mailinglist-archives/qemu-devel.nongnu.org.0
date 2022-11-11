Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E37CA625866
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 11:32:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otRJK-0007Tr-9U; Fri, 11 Nov 2022 05:30:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otRJH-0007Ob-6F
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:30:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otRJF-0000ee-Gy
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668162652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pnGgu3ZpwQdhGfGKC3wZz9u/h0b1aQczFzY4/hPRxKI=;
 b=SbhWhefW9t9vYCMjhJ5IAy5Gisqkajg6W9+mYOONG179QoFK/hg7d6mERBwPqmz8O8OIeR
 kMhvjJPQyJPTDFn1d9TjLhVsnRsuLiFfgn60XInDjwqdwwpFiJiTqIaohLJeDHdzRT3fW6
 X/+gk4+XOMHdycY2m5V/UUK/o2Z+FtI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-jLQdUJniNVuq7NioX7CdnQ-1; Fri, 11 Nov 2022 05:30:51 -0500
X-MC-Unique: jLQdUJniNVuq7NioX7CdnQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4DD7101A528
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:30:50 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56C16207B33D;
 Fri, 11 Nov 2022 10:30:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PULL 0/8] Misc fixes
Date: Fri, 11 Nov 2022 11:30:40 +0100
Message-Id: <20221111103048.202519-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

 Hi Stefan!

The following changes since commit 2ccad61746ca7de5dd3e25146062264387e43bd4:

  Merge tag 'pull-tcg-20221109' of https://gitlab.com/rth7680/qemu into staging (2022-11-09 13:26:45 -0500)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-11-11

for you to fetch changes up to 2cb40d446fac6a2aeccba7687448a9f48ec6b6c6:

  Fix several typos in documentation (found by codespell) (2022-11-11 09:39:25 +0100)

----------------------------------------------------------------
* Fix "unused variable" warnings from Clang 15
* Allow building of guest-agent without emulators or tools
* White space clean-ups
* Fixes for typos in the documentation

----------------------------------------------------------------
Ahmed Abouzied (1):
      net: Replace TAB indentations with spaces

Miroslav Rezanina (4):
      rtl8139: Remove unused variable
      tulip: Remove unused variable
      qemu-img: remove unused variable
      host-libusb: Remove unused variable

Stefan Weil (1):
      Fix several typos in documentation (found by codespell)

Thomas Huth (2):
      libdecnumber/dpd/decimal64: Fix compiler warning from Clang 15
      qga: Allow building of the guest agent without system emulators or tools

 docs/devel/acpi-bits.rst       |    2 +-
 docs/system/devices/can.rst    |    5 +-
 qapi/virtio.json               |    4 +-
 hw/net/can/ctu_can_fd_frame.h  |  180 +++---
 hw/net/can/ctu_can_fd_regs.h   | 1260 ++++++++++++++++++++--------------------
 hw/net/e1000_regs.h            |   30 +-
 hw/net/pcnet.h                 |    4 +-
 include/exec/memory.h          |    6 +-
 net/tap-linux.h                |   10 +-
 tests/qtest/libqos/qgraph.h    |    2 +-
 hw/net/mcf_fec.c               |    8 +-
 hw/net/ne2000.c                |  138 ++---
 hw/net/pcnet.c                 |  136 ++---
 hw/net/rtl8139.c               |    2 -
 hw/net/tulip.c                 |    4 +-
 hw/scsi/esp.c                  |    6 +-
 hw/usb/host-libusb.c           |   15 -
 libdecnumber/dpd/decimal64.c   |    3 +-
 qemu-img.c                     |    4 +-
 tests/qtest/libqos/virtio-9p.c |    2 +-
 qapi/meson.build               |    2 +-
 qemu-options.hx                |    6 +-
 stubs/meson.build              |    2 +-
 util/meson.build               |   20 +-
 24 files changed, 918 insertions(+), 933 deletions(-)


