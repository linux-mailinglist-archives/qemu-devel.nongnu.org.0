Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FD04CD6C1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:50:36 +0100 (CET)
Received: from localhost ([::1]:59148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9GN-0004Bo-UP
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:50:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8ob-0007mr-Me
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:21:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nQ8oW-00007f-Fv
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:21:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646403707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SN5fZTngLfhpN/8EzfYi7DnNVMWkeZb6aI9YsFyfraU=;
 b=PkegVLGfACyRZKc3Pf2ki8ZQef3Lkc2DRmYRTzl6+n+rr2sNSXiXjOnIjw/emxJ44/Wcie
 azQujqN7krpVVCjWaom9Yo1EVQ54XjMUYoNdNi69PXHUXtkdpCHpnRBVYHqanlDhlIsMBf
 ooOgqXNLlMA2aAgo41bQvI1iCyVAef4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-80-REPRgfP7P5SVTZjju7sdaA-1; Fri, 04 Mar 2022 09:21:46 -0500
X-MC-Unique: REPRgfP7P5SVTZjju7sdaA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8A411091DA0;
 Fri,  4 Mar 2022 14:21:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6041F2ED81;
 Fri,  4 Mar 2022 14:21:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CA37018000B4; Fri,  4 Mar 2022 15:21:23 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/35] Kraxel 20220304 patches
Date: Fri,  4 Mar 2022 15:20:48 +0100
Message-Id: <20220304142123.956171-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6629bf78aac7e53f83fd0bcbdbe322e2302dfd1f=
:=0D
=0D
  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220=
302' into staging (2022-03-03 14:46:48 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/kraxel-20220304-pull-request=0D
=0D
for you to fetch changes up to 02218aedb1c851340207db89b8eeb96843fed241:=0D
=0D
  hw/display/vmware_vga: replace fprintf calls with trace events (2022-03-0=
4 11:38:07 +0100)=0D
=0D
----------------------------------------------------------------=0D
usb: fixes for ohci, xhci, mtp and redirect=0D
audio: latency fixes=0D
ui: opengl and cocoa fixes=0D
firmware: ovmf tabel aprser fixes=0D
=0D
----------------------------------------------------------------=0D
=0D
Akihiko Odaki (4):=0D
  coreaudio: Notify error in coreaudio_init_out=0D
  ui/cocoa: Add Services menu=0D
  softmmu/qdev-monitor: Add virtio-gpu-gl aliases=0D
  edid: Fix clock of Detailed Timing Descriptor=0D
=0D
BALATON Zoltan (5):=0D
  usb/ohci: Move trace point and log ep number to help debugging=0D
  usb/ohci: Move cancelling async packet to ohci_stop_endpoints()=0D
  usb/ohci: Move USBPortOps related functions together=0D
  usb/ohci: Merge ohci_async_cancel_device() into ohci_child_detach()=0D
  usb/ohci: Don't use packet from OHCIState for isochronous transfers=0D
=0D
Carwyn Ellis (1):=0D
  hw/display/vmware_vga: replace fprintf calls with trace events=0D
=0D
Denis V. Lunev (1):=0D
  hw/usb: pacify xhciwmi.exe warning=0D
=0D
Dov Murik (3):=0D
  hw/i386: Improve bounds checking in OVMF table parsing=0D
  hw/i386: Replace magic number with field length calculation=0D
  docs: Add spec of OVMF GUIDed table for SEV guests=0D
=0D
Marc-Andr=C3=A9 Lureau (4):=0D
  ui/console: fix crash when using gl context with non-gl listeners=0D
  ui/console: fix texture leak when calling surface_gl_create_texture()=0D
  ui: do not create a surface when resizing a GL scanout=0D
  ui/clipboard: fix use-after-free regression=0D
=0D
Peter Maydell (1):=0D
  hw/usb/redirect.c: Stop using qemu_oom_check()=0D
=0D
Volker R=C3=BCmelin (16):=0D
  hw/usb/dev-mtp: create directories with a+x mode mask=0D
  audio: replace open-coded buffer arithmetic=0D
  audio: move function audio_pcm_hw_clip_out()=0D
  audio: add function audio_pcm_hw_conv_in()=0D
  audio: inline function audio_pcm_sw_get_rpos_in()=0D
  paaudio: increase default latency to 46ms=0D
  jackaudio: use more jack audio buffers=0D
  audio: copy playback stream in sequential order=0D
  audio: add pcm_ops function table for capture backend=0D
  Revert "audio: fix wavcapture segfault"=0D
  audio: restore mixing-engine playback buffer size=0D
  paaudio: reduce effective playback buffer size=0D
  dsoundaudio: reduce effective playback buffer size=0D
  ossaudio: reduce effective playback buffer size=0D
  paaudio: fix samples vs. frames mix-up=0D
  sdlaudio: fix samples vs. frames mix-up=0D
=0D
 audio/audio_int.h                 |  20 +-=0D
 audio/alsaaudio.c                 |   1 +=0D
 audio/audio.c                     | 200 +++++++++++---------=0D
 audio/coreaudio.c                 |  15 +-=0D
 audio/dsoundaudio.c               |  30 +--=0D
 audio/jackaudio.c                 |   5 +-=0D
 audio/noaudio.c                   |   1 +=0D
 audio/ossaudio.c                  |  17 +-=0D
 audio/paaudio.c                   |  63 +++---=0D
 audio/sdlaudio.c                  |  21 +-=0D
 audio/wavaudio.c                  |   1 +=0D
 hw/display/edid-generate.c        |  66 ++++---=0D
 hw/display/vmware_vga.c           |  30 +--=0D
 hw/i386/pc_sysfw_ovmf.c           |  18 +-=0D
 hw/usb/dev-mtp.c                  |   4 +-=0D
 hw/usb/hcd-ohci.c                 | 305 +++++++++++++++---------------=0D
 hw/usb/hcd-xhci.c                 |   2 +-=0D
 hw/usb/redirect.c                 |  17 +-=0D
 softmmu/qdev-monitor.c            |   2 +=0D
 ui/clipboard.c                    |   6 +-=0D
 ui/console-gl.c                   |   4 +=0D
 ui/console.c                      |  29 +--=0D
 docs/specs/index.rst              |   1 +=0D
 docs/specs/sev-guest-firmware.rst | 125 ++++++++++++=0D
 hw/display/trace-events           |   3 +=0D
 hw/usb/trace-events               |   2 +-=0D
 ui/cocoa.m                        |   4 +=0D
 27 files changed, 614 insertions(+), 378 deletions(-)=0D
 create mode 100644 docs/specs/sev-guest-firmware.rst=0D
=0D
--=20=0D
2.35.1=0D
=0D


