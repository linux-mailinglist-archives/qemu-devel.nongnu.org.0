Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACC84432C2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:32:28 +0100 (CET)
Received: from localhost ([::1]:38042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwi3-0004wF-Hf
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhwcP-0005R9-GS
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:26:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mhwcN-0002ZF-TL
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635870395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jMrKKJ7I3nefs5AK6WqkFSPDxL3+IqxDfaU06jxZ5Fg=;
 b=iK5B1pkxMrWpX4+Nog/UgV4SSxW6dTKmLG5UGey6gn6XCuWTfu48ZT1BTjXC8IQ3uINfVY
 U/ItG9kXQjnqWnNbmRcMj/2BDT+9aQDuD0RUo/WVKkmSSQ6E4XVl8k6tmHUlswoOrwCYSm
 atdlCxtn9E/K9iNVzAL/VdYkiKv+7y8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-c1s8AypPOi-NHgLCPzrALg-1; Tue, 02 Nov 2021 12:26:34 -0400
X-MC-Unique: c1s8AypPOi-NHgLCPzrALg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EADB51B18BE8;
 Tue,  2 Nov 2021 16:26:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEF7F60D30;
 Tue,  2 Nov 2021 16:26:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 80466180092D; Tue,  2 Nov 2021 17:26:19 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/10] Misc 20211102 patches
Date: Tue,  2 Nov 2021 17:26:09 +0100
Message-Id: <20211102162619.2760593-1-kraxel@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 8cb41fda78c7ebde0dd248c6afe1d336efb0de50=
:=0D
=0D
  Merge remote-tracking branch 'remotes/philmd/tags/machine-20211101' into =
staging (2021-11-02 05:53:45 -0400)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/misc-20211102-pull-request=0D
=0D
for you to fetch changes up to 58d7d4c7869cb3addb0714aa7b6bd88f2b6b7edf:=0D
=0D
  usb-storage: tag usb_msd_csw as packed struct (2021-11-02 17:24:18 +0100)=
=0D
=0D
----------------------------------------------------------------=0D
MAINTAINERS: audio updates=0D
microvm: device tree support=0D
console: chardev fixes=0D
misc: deprecate sga=0D
usb: fix struct usb_msd_csw=0D
=0D
----------------------------------------------------------------=0D
=0D
Christian Schoenebeck (1):=0D
  MAINTAINERS: add myself as partial audio reviewer=0D
=0D
Daniel P. Berrang=C3=A9 (1):=0D
  hw/misc: deprecate the 'sga' device=0D
=0D
Dongwon Kim (1):=0D
  ui/gtk: skip any extra draw of same guest scanout blob res=0D
=0D
Gerd Hoffmann (2):=0D
  microvm: add device tree support.=0D
  usb-storage: tag usb_msd_csw as packed struct=0D
=0D
Nikola Pavlica (1):=0D
  ui/gtk: Update the refresh rate for gl-area too=0D
=0D
Thomas Huth (1):=0D
  MAINTAINERS: Add myself as a reviewer for SDL audio=0D
=0D
Volker R=C3=BCmelin (3):=0D
  ui/console: replace QEMUFIFO with Fifo8=0D
  ui/console: replace kbd_timer with chr_accept_input callback=0D
  ui/console: remove chardev frontend connected test=0D
=0D
 hw/i386/microvm-dt.h               |   8 +=0D
 include/hw/i386/microvm.h          |   4 +=0D
 include/hw/usb/msd.h               |   2 +-=0D
 include/ui/console.h               |   1 +=0D
 hw/display/virtio-gpu-udmabuf.c    |   2 +-=0D
 hw/i386/microvm-dt.c               | 341 +++++++++++++++++++++++++++++=0D
 hw/i386/microvm.c                  |   2 +=0D
 hw/misc/sga.c                      |   2 +=0D
 ui/console.c                       | 109 +++------=0D
 ui/gtk-egl.c                       |  40 ++--=0D
 ui/gtk-gl-area.c                   |  52 +++--=0D
 .gitlab-ci.d/buildtest.yml         |   1 -=0D
 MAINTAINERS                        |   4 +=0D
 configs/targets/i386-softmmu.mak   |   1 +=0D
 configs/targets/x86_64-softmmu.mak |   1 +=0D
 docs/about/deprecated.rst          |  10 +=0D
 hw/i386/meson.build                |   2 +-=0D
 17 files changed, 466 insertions(+), 116 deletions(-)=0D
 create mode 100644 hw/i386/microvm-dt.h=0D
 create mode 100644 hw/i386/microvm-dt.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


