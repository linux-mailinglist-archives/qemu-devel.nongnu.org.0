Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBAD620F2E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 12:35:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osMre-0004DX-6p; Tue, 08 Nov 2022 06:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1osMrP-00049R-1J
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:33:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1osMrJ-0005e0-5P
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667907198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9uQK0sVrFg9Lbukq6QtY6qWtddi1HcrTIZO0f+demd0=;
 b=BpuO9jhKPIApWtTA20ssaAoSeG44+w2MX9QdZqIeD4uBx05l1Mpre/jZgdktqJGqoBilJl
 i2hCo4fjQj2GglQ1ZQqDIqmNeQdW22ua5kIe09b0q4fCujQn4mTAYVQ8eOmEQjT/9KqHtg
 ylvJJK1K+lSLhadrWHXafmVcOuQaWeE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-mB2kzRo_PqKf814VrTZHjw-1; Tue, 08 Nov 2022 06:33:17 -0500
X-MC-Unique: mB2kzRo_PqKf814VrTZHjw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D09878027EB;
 Tue,  8 Nov 2022 11:33:16 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2718F40C2064;
 Tue,  8 Nov 2022 11:33:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	kraxel@redhat.com
Subject: [PULL 0/5] s390x fix and white space cleanup
Date: Tue,  8 Nov 2022 12:33:08 +0100
Message-Id: <20221108113313.467923-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-11-08

for you to fetch changes up to 6c10e08a4f131431dbb50a11912cb2a726879df3:

  hw/usb: fix tab indentation (2022-11-08 11:13:48 +0100)

----------------------------------------------------------------
* Last minute s390x fixes before the hard freeze
* Whiste space clean-up in ui/, display/ and hw/usb/
  (Gerd seems to be away from keyboard, so I threw those in)

----------------------------------------------------------------
Amarjargal Gundjalam (3):
      ui: fix tab indentation
      hw/display: fix tab indentation
      hw/usb: fix tab indentation

Cédric Le Goater (2):
      Revert "s390x/s390-virtio-ccw: add zpcii-disable machine property"
      s390x/s390-virtio-ccw: Switch off zPCI enhancements on older machines

 hw/display/vga_regs.h              |    6 +-
 hw/usb/quirks-pl2303-ids.h         |  180 +-
 include/hw/s390x/s390-virtio-ccw.h |    1 -
 include/hw/usb.h                   |  100 +-
 include/hw/usb/dwc2-regs.h         | 1608 +++----
 ui/vgafont.h                       | 9214 ++++++++++++++++++------------------
 ui/vnc-enc-zywrle.h                |   16 +-
 ui/vnc_keysym.h                    |    2 +-
 hw/display/blizzard.c              |  352 +-
 hw/display/cirrus_vga.c            | 1606 +++----
 hw/display/omap_dss.c              |  598 +--
 hw/display/pxa2xx_lcd.c            |  196 +-
 hw/display/xenfb.c                 |  260 +-
 hw/s390x/s390-pci-kvm.c            |    4 +-
 hw/s390x/s390-virtio-ccw.c         |   29 +-
 hw/usb/dev-hub.c                   |   82 +-
 hw/usb/dev-network.c               |  286 +-
 hw/usb/dev-wacom.c                 |    4 +-
 hw/usb/hcd-musb.c                  |  328 +-
 ui/vnc-enc-zywrle-template.c       |   20 +-
 util/qemu-config.c                 |    4 -
 qemu-options.hx                    |    8 +-
 22 files changed, 7436 insertions(+), 7468 deletions(-)


