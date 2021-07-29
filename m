Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3336C3DA390
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:58:30 +0200 (CEST)
Received: from localhost ([::1]:36832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95cL-0003U7-9T
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m95V8-0003XC-AP
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:51:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m95V6-0001XJ-2q
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:51:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627563059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W8XSvBcikguhMKWdYYd1hf+4DSG+TpsFCt3jwnBlt1Q=;
 b=MpoBdK8U1eoDaJ+htgf8HeIANhxYPmXClcn2KnKP3MxaBetAQ3Y2d7+I0U0TwN/PBFTAwH
 E81uTcBMZD+lz2kJhm/DrhES+t1TNjH+eLay/5IwciAJr8EJfM43/Dsdrco7Dk1VL84toJ
 WeDC97ac6CUZ+i/QIo8BWwhm2VV8VnQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-1PJM4AyENyWxGqJ3UmqpBg-1; Thu, 29 Jul 2021 08:50:58 -0400
X-MC-Unique: 1PJM4AyENyWxGqJ3UmqpBg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C5E49251D;
 Thu, 29 Jul 2021 12:50:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D2D35D6B1;
 Thu, 29 Jul 2021 12:50:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 899981800382; Thu, 29 Jul 2021 14:50:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] Usb 20210729 patches
Date: Thu, 29 Jul 2021 14:50:37 +0200
Message-Id: <20210729125044.3531457-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f2da205cb4142259d9bc6b9d4596ebbe2426fe49=
:=0D
=0D
  Update version for v6.1.0-rc1 release (2021-07-27 18:07:52 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/usb-20210729-pull-request=0D
=0D
for you to fetch changes up to 30a20f2c5a9cf8f01ffcc918a7a5751dfe956524:=0D
=0D
  docs: Fold usb2.txt passthrough information into usb.rst (2021-07-29 11:1=
8:55 +0200)=0D
=0D
----------------------------------------------------------------=0D
usb: fixes for 6.1: usbredir, usb-host for windows, docs.=0D
=0D
----------------------------------------------------------------=0D
=0D
Gerd Hoffmann (3):=0D
  usb-host: wire up timer for windows=0D
  ci: add libusb for windows builds=0D
  usbredir: fix free call=0D
=0D
Peter Maydell (4):=0D
  docs: Incorporate information in usb-storage.txt into rST manual=0D
  docs: Fold usb2.txt USB controller information into usb.rst=0D
  docs: Fold usb2.txt physical port addressing info into usb.rst=0D
  docs: Fold usb2.txt passthrough information into usb.rst=0D
=0D
 docs/usb-storage.txt                          |  59 -----=0D
 docs/usb2.txt                                 | 172 -------------=0D
 hw/usb/host-libusb.c                          |  33 ++-=0D
 hw/usb/redirect.c                             |   2 +-=0D
 MAINTAINERS                                   |   3 +-=0D
 docs/system/devices/usb.rst                   | 225 +++++++++++++++++-=0D
 .../dockerfiles/fedora-win32-cross.docker     |   1 +=0D
 .../dockerfiles/fedora-win64-cross.docker     |   1 +=0D
 8 files changed, 254 insertions(+), 242 deletions(-)=0D
 delete mode 100644 docs/usb-storage.txt=0D
 delete mode 100644 docs/usb2.txt=0D
=0D
--=20=0D
2.31.1=0D
=0D


