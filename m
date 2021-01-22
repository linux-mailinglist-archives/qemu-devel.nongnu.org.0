Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28616300A4D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 18:53:52 +0100 (CET)
Received: from localhost ([::1]:56014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l30d5-00007w-6B
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 12:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l30YS-0003Lp-3Z
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:49:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l30YO-0004ee-2T
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 12:49:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611337738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Xdl2fcz/GR1kdHrq8DDtKEfotv+BjwdmsqAA8tEk9NE=;
 b=Ing8pS0hiBYz8Ry0tFBAt9LvaorbFAxKNBmCSvBtsJouqq/tBnR9jrRDkKOJpj8m/+3Evt
 tw9CWpN++z9YPLe2CB/wdQoWUkhv9I5ffErcjcUciBYAkun8xQooOoDCAf7ruGlMwqCsOx
 YQrJbN2WM7vktx96YmxzCBx/uJILJUY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-VVOOyS3aM0qoVEVQAiFOag-1; Fri, 22 Jan 2021 12:48:56 -0500
X-MC-Unique: VVOOyS3aM0qoVEVQAiFOag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C27A91005D4D;
 Fri, 22 Jan 2021 17:48:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CD54100AE4E;
 Fri, 22 Jan 2021 17:48:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EEFD118000AB; Fri, 22 Jan 2021 18:48:49 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/8] Usb 20210122 patches
Date: Fri, 22 Jan 2021 18:48:41 +0100
Message-Id: <20210122174849.3936119-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 0e32462630687a18039464511bd0447ada5709c3=
:=0D
=0D
  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pul=
l-=3D=0D
request' into staging (2021-01-22 10:35:55 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/usb-20210122-pull-request=0D
=0D
for you to fetch changes up to 2980a316734c420e7398aec026909dcfc8614c1d:=0D
=0D
  usb-host: map LIBUSB_SPEED_SUPER_PLUS to USB_SPEED_SUPER (2021-01-22 14:5=
1:=3D=0D
35 +0100)=0D
=0D
----------------------------------------------------------------=0D
usb: cleanups and fixes.=0D
usb: add pcap support.=0D
=0D
----------------------------------------------------------------=0D
=0D
Alex Chen (1):=0D
  hw/usb: Fix bad printf format specifiers=0D
=0D
Fabrice Fontaine (1):=0D
  hw/usb/host-libusb.c: fix build with kernel < 5.0=0D
=0D
Gerd Hoffmann (2):=0D
  usb: add pcap support.=0D
  usb-host: map LIBUSB_SPEED_SUPER_PLUS to USB_SPEED_SUPER=0D
=0D
Markus Armbruster (1):=0D
  hw/usb: Convert to qdev_realize()=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (3):=0D
  hw/usb/hcd-xhci: Fix extraneous format-truncation error on 32-bit=0D
    hosts=0D
  scsi/utils: Add INVALID_PARAM_VALUE sense code definition=0D
  hw/usb/dev-uas: Report command additional adb length as unsupported=0D
=0D
 hw/usb/hcd-xhci.h             |   2 +-=0D
 include/hw/usb.h              |   8 ++=0D
 include/scsi/utils.h          |   2 +=0D
 hw/usb/bus.c                  |  16 +++=0D
 hw/usb/ccid-card-passthru.c   |   2 +-=0D
 hw/usb/core.c                 |  21 ++-=0D
 hw/usb/dev-smartcard-reader.c |   8 +-=0D
 hw/usb/dev-uas.c              |  12 +-=0D
 hw/usb/hcd-ehci.c             |   4 +-=0D
 hw/usb/hcd-xhci-pci.c         |   4 +-=0D
 hw/usb/hcd-xhci-sysbus.c      |   5 +-=0D
 hw/usb/host-libusb.c          |  18 ++-=0D
 hw/usb/pcap.c                 | 251 ++++++++++++++++++++++++++++++++++=0D
 scsi/utils.c                  |   5 +=0D
 hw/usb/meson.build            |   1 +=0D
 15 files changed, 340 insertions(+), 19 deletions(-)=0D
 create mode 100644 hw/usb/pcap.c=0D
=0D
--=3D20=0D
2.29.2=0D
=0D


