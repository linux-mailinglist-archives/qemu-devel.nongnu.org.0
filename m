Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E481538C73B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 14:56:08 +0200 (CEST)
Received: from localhost ([::1]:43182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk4hD-0001DQ-VZ
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 08:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lk4e3-0005WF-9O
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:52:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lk4e1-0007rz-M4
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621601568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gJywbe54cIdUmsczAyrH8GhdUQTYueWsPwhve8YW/ag=;
 b=CMdDaR0rNmX4lMs7Jasl8SkLUruLdbCBJjV385HkfWRsOdDiVi7B3FqSFQSprnVoJnciop
 Kn/wFELXTSmVA0lKDYcsxh/Il0RWd+FWlFE8uSUkOrzeHO6/phUHCDbHDZYXRUwbqwam32
 9dI5Nh/y+te80cDKgaWoNASvChFOwXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-mtuY9-l7ORiB50Q4wrm1Fg-1; Fri, 21 May 2021 08:52:45 -0400
X-MC-Unique: mtuY9-l7ORiB50Q4wrm1Fg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77265800C60
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 12:52:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72104687F7;
 Fri, 21 May 2021 12:52:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3A24C1800386; Fri, 21 May 2021 14:51:19 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] Ui 20210521 patches
Date: Fri, 21 May 2021 14:51:08 +0200
Message-Id: <20210521125119.3173309-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 972e848b53970d12cb2ca64687ef8ff797fb6236=
:=0D
=0D
  Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210520-v=
2' into staging (2021-05-20 18:42:00 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/ui-20210521-pull-request=0D
=0D
for you to fetch changes up to d11ebe2ca257769337118d3b0ff3f76ea4928018:=0D
=0D
  ui/gtk: add clipboard support (2021-05-21 09:42:44 +0200)=0D
=0D
----------------------------------------------------------------=0D
ui: add cut+paste support.=0D
ui: bugfixes for spice and vnc.=0D
=0D
----------------------------------------------------------------=0D
=0D
Gerd Hoffmann (9):=0D
  build: add separate spice-protocol config option=0D
  ui: add clipboard infrastructure=0D
  ui: add clipboard documentation=0D
  ui/vdagent: core infrastructure=0D
  ui/vdagent: add mouse support=0D
  ui/vdagent: add clipboard support=0D
  ui/vnc: clipboard support=0D
  ui/gtk: move struct GtkDisplayState to ui/gtk.h=0D
  ui/gtk: add clipboard support=0D
=0D
Mauro Matteo Cascella (1):=0D
  ui/spice-display: check NULL pointer in interface_release_resource()=0D
=0D
Michael Tokarev (1):=0D
  vnc: spelling fix (enable->enabled)=0D
=0D
 configure              |  36 +-=0D
 include/ui/clipboard.h | 193 ++++++++++=0D
 include/ui/gtk.h       |  67 ++++=0D
 ui/vnc.h               |  24 ++=0D
 chardev/char.c         |   6 +=0D
 ui/clipboard.c         |  92 +++++=0D
 ui/gtk-clipboard.c     | 192 ++++++++++=0D
 ui/gtk.c               |  56 +--=0D
 ui/spice-display.c     |   4 +=0D
 ui/vdagent.c           | 803 +++++++++++++++++++++++++++++++++++++++++=0D
 ui/vnc-clipboard.c     | 323 +++++++++++++++++=0D
 ui/vnc.c               |  23 +-=0D
 docs/devel/index.rst   |   1 +=0D
 docs/devel/ui.rst      |   8 +=0D
 meson.build            |   4 +=0D
 qapi/char.json         |  21 +-=0D
 ui/meson.build         |   5 +-=0D
 ui/trace-events        |  10 +=0D
 18 files changed, 1800 insertions(+), 68 deletions(-)=0D
 create mode 100644 include/ui/clipboard.h=0D
 create mode 100644 ui/clipboard.c=0D
 create mode 100644 ui/gtk-clipboard.c=0D
 create mode 100644 ui/vdagent.c=0D
 create mode 100644 ui/vnc-clipboard.c=0D
 create mode 100644 docs/devel/ui.rst=0D
=0D
--=20=0D
2.31.1=0D
=0D


