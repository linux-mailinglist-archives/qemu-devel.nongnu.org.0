Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF04748E4A2
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 07:59:32 +0100 (CET)
Received: from localhost ([::1]:52028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8GYd-0001un-SL
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 01:59:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GTM-00073v-Tc
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:54:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GTJ-0007PR-Vi
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:54:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4XJ+58jJGCdFxaySgzzEUKonrfDKOYCdg90+Vwi9Lzs=;
 b=WxK8mNrGDzVYqbytcKwK0rPEqjl+B9vgOubwE8jEcCvvhKe+y4pfvKJKv/eZ4E2JjQ7C3+
 cAFgoaY5PvAUdpk6PWgv+CC8gJX5iWZOKULA6U+H9fw8ED60vvyb/f5/H943WmG+ATzBcN
 APgvtB4zDQ4p3nlnZ/G+V8jhcQJuRog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-Cw_ES-p2MjmjdvLY4q23DQ-1; Fri, 14 Jan 2022 01:53:58 -0500
X-MC-Unique: Cw_ES-p2MjmjdvLY4q23DQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ABE981CCB4;
 Fri, 14 Jan 2022 06:53:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF3BF5E491;
 Fri, 14 Jan 2022 06:53:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 55FD7180060A; Fri, 14 Jan 2022 07:53:26 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/20] Kraxel 20220114 patches
Date: Fri, 14 Jan 2022 07:53:06 +0100
Message-Id: <20220114065326.782420-1-kraxel@redhat.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 91f5f7a5df1fda8c34677a7c49ee8a4bb5b56a36=
:=0D
=0D
  Merge remote-tracking branch 'remotes/lvivier-gitlab/tags/linux-user-for-=
7.0-pull-request' into staging (2022-01-12 11:51:47 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/kraxel-20220114-pull-request=0D
=0D
for you to fetch changes up to 17f6315ef883a142b6a41a491b63a6554e784a5c:=0D
=0D
  ui/input-legacy: pass horizontal scroll information (2022-01-13 15:33:18 =
+0100)=0D
=0D
----------------------------------------------------------------=0D
- bugfixes for ui, usb, audio, display=0D
- change default display resolution=0D
- add horizontal scrolling support=0D
=0D
----------------------------------------------------------------=0D
=0D
Daniel P. Berrang=C3=A9 (1):=0D
  edid: set default resolution to 1280x800 (WXGA)=0D
=0D
Dario Binacchi (1):=0D
  hw/usb/dev-wacom: add missing HID descriptor=0D
=0D
Dmitry Petrov (5):=0D
  ps2: Initial horizontal scroll support=0D
  ui/cocoa: pass horizontal scroll information to the device code=0D
  ui/gtk: pass horizontal scroll information to the device code=0D
  ui/sdl2: pass horizontal scroll information to the device code=0D
  ui/input-legacy: pass horizontal scroll information=0D
=0D
Gerd Hoffmann (1):=0D
  uas: add missing return=0D
=0D
Marc-Andr=C3=A9 Lureau (2):=0D
  ui/dbus: fix buffer-overflow detected by ASAN=0D
  ui: fix gtk clipboard clear assertion=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  hw/display: Rename VGA_ISA_MM -> VGA_MMIO=0D
  hw/display/vga-mmio: Inline vga_mm_init()=0D
  hw/display/vga-mmio: QOM'ify vga_mmio_init() as TYPE_VGA_MMIO=0D
  hw/mips/jazz: Inline vga_mmio_init() and remove it=0D
=0D
Rao Lei (1):=0D
  ui/vnc.c: Fixed a deadlock bug.=0D
=0D
Satyeshwar Singh (1):=0D
  edid: Added support for 4k@60 Hz monitor=0D
=0D
Volker R=C3=BCmelin (3):=0D
  jackaudio: use ifdefs to hide unavailable functions=0D
  dsoundaudio: fix crackling audio recordings=0D
  hw/audio/intel-hda: fix stream reset=0D
=0D
Zhenwei Pi (1):=0D
  usb: allow max 8192 bytes for desc=0D
=0D
 hw/usb/desc.h                           |   1 +=0D
 include/hw/display/vga.h                |   6 +-=0D
 include/hw/virtio/virtio-gpu.h          |   4 +-=0D
 audio/dsoundaudio.c                     |   7 +-=0D
 audio/jackaudio.c                       |   4 +=0D
 hw/audio/intel-hda.c                    |   2 +-=0D
 hw/display/edid-generate.c              |   7 +-=0D
 hw/display/vga-isa-mm.c                 | 114 -------------------=0D
 hw/display/vga-mmio.c                   | 139 ++++++++++++++++++++++++=0D
 hw/input/ps2.c                          |  57 ++++++++--=0D
 hw/mips/jazz.c                          |   9 +-=0D
 hw/usb/desc.c                           |  15 +--=0D
 hw/usb/dev-uas.c                        |   1 +=0D
 hw/usb/dev-wacom.c                      |  72 +++++++++++-=0D
 qemu-edid.c                             |   4 +-=0D
 ui/dbus.c                               |   1 +=0D
 ui/gtk-clipboard.c                      |  19 ++--=0D
 ui/gtk.c                                |  54 +++++++--=0D
 ui/input-legacy.c                       |  15 +++=0D
 ui/sdl2.c                               |   5 +=0D
 ui/vnc.c                                |   4 +-=0D
 configs/devices/mips-softmmu/common.mak |   2 +-=0D
 hw/display/Kconfig                      |   2 +-=0D
 hw/display/meson.build                  |   2 +-=0D
 hw/mips/Kconfig                         |   2 +-=0D
 qapi/ui.json                            |   2 +-=0D
 ui/cocoa.m                              |  18 ++-=0D
 27 files changed, 387 insertions(+), 181 deletions(-)=0D
 delete mode 100644 hw/display/vga-isa-mm.c=0D
 create mode 100644 hw/display/vga-mmio.c=0D
=0D
--=20=0D
2.34.1=0D
=0D


