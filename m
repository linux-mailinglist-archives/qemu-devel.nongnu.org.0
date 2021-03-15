Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFE533C582
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:25:41 +0100 (CET)
Received: from localhost ([::1]:44502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLruO-0002b3-L7
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLrYR-00029V-Na
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:03:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLrYN-0000XJ-SF
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615831374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=u2hGZvp4MKnd8tazMCvCJyLnzgPOaA+6fZPjk4X3NC0=;
 b=gYR3x7xTTpOerLqaBDBqjzpx/hJqXYd6OGEPoIeUhpHRhpQEmxdSaGfMx5Ew6ULdig70J8
 Urrx8IKauR3Lwfu4UujK73BeP1pTFTPR2l6HlS59mhdkBKR2xUV/0ZpEw23niS6Ba9iW7R
 h5QohT78JyfTerpdgLHlaErU/TdeM9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-yT9gqLrtNrm3mXXKbewv1w-1; Mon, 15 Mar 2021 14:02:50 -0400
X-MC-Unique: yT9gqLrtNrm3mXXKbewv1w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75CE91015C91;
 Mon, 15 Mar 2021 18:02:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A09AD6060F;
 Mon, 15 Mar 2021 18:02:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 036F81800614; Mon, 15 Mar 2021 19:02:41 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/13] Usb 20210315 patches
Date: Mon, 15 Mar 2021 19:02:27 +0100
Message-Id: <20210315180240.1597240-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6157b0e19721aadb4c7fdcfe57b2924af6144b14=
:=0D
=0D
  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pul=
l-=3D=0D
request' into staging (2021-03-14 17:47:49 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/usb-20210315-pull-request=0D
=0D
for you to fetch changes up to 39912c14da07a2dbc73854addcfa0a42596340ac:=0D
=0D
  usb/storage: clear csw on reset (2021-03-15 17:01:17 +0100)=0D
=0D
----------------------------------------------------------------=0D
usb: -usbdevice cleanup and un-deprecation.=0D
usb: split usb-storage.=0D
usb: misc fixes and cleanups.=0D
=0D
----------------------------------------------------------------=0D
=0D
Gerd Hoffmann (5):=0D
  usb/storage: move declarations to usb/msd.h header=0D
  usb/storage: move usb-bot device to separate source file=0D
  usb/storage move usb-storage device to separate source file=0D
  usb/storage: add kconfig symbols=0D
  usb/storage: clear csw on reset=0D
=0D
Paolo Bonzini (2):=0D
  usb: remove support for -usbdevice parameters=0D
  usb: remove '-usbdevice u2f-key'=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (3):=0D
  hw/southbridge: Add missing Kconfig dependency VT82C686 on USB_UHCI=0D
  hw/usb/hcd-uhci: Expose generic prototypes to local header=0D
  hw/usb: Extract VT82C686 UHCI PCI function into a new unit=0D
=0D
Thomas Huth (3):=0D
  hw/usb/bus: Remove the "full-path" property=0D
  usb: Un-deprecate -usbdevice (except for -usbdevice audio which gets=0D
    removed)=0D
  usb: Document the missing -usbdevice options=0D
=0D
 hw/usb/hcd-uhci.h                |  93 +++++++++++++=0D
 include/hw/usb.h                 |   3 +-=0D
 include/hw/usb/msd.h             |  54 ++++++++=0D
 hw/usb/bus.c                     |  39 ++----=0D
 hw/usb/dev-audio.c               |   1 -=0D
 hw/usb/dev-serial.c              |   2 +-=0D
 hw/usb/dev-storage-bot.c         |  63 +++++++++=0D
 hw/usb/dev-storage-classic.c     | 156 +++++++++++++++++++++=0D
 hw/usb/dev-storage.c             | 226 +------------------------------=0D
 hw/usb/hcd-uhci.c                |  83 +-----------=0D
 hw/usb/u2f.c                     |   1 -=0D
 hw/usb/vt82c686-uhci-pci.c       |  43 ++++++=0D
 softmmu/vl.c                     |   2 -=0D
 MAINTAINERS                      |   1 +=0D
 docs/system/deprecated.rst       |   9 --=0D
 docs/system/removed-features.rst |   8 ++=0D
 hw/isa/Kconfig                   |   1 +=0D
 hw/usb/Kconfig                   |  13 +-=0D
 hw/usb/meson.build               |   5 +-=0D
 qemu-options.hx                  |  35 ++++-=0D
 20 files changed, 484 insertions(+), 354 deletions(-)=0D
 create mode 100644 hw/usb/hcd-uhci.h=0D
 create mode 100644 include/hw/usb/msd.h=0D
 create mode 100644 hw/usb/dev-storage-bot.c=0D
 create mode 100644 hw/usb/dev-storage-classic.c=0D
 create mode 100644 hw/usb/vt82c686-uhci-pci.c=0D
=0D
--=3D20=0D
2.29.2=0D
=0D


