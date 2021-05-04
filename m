Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EC53727A7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:56:43 +0200 (CEST)
Received: from localhost ([::1]:34062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqrB-0002o8-P4
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldqoH-00089a-M3
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:53:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldqoC-0005YG-UP
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620118415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xBv6c9ucSae68a2F7/Bg0Y6tDtEJmpBBPOr5Of/VjtI=;
 b=IYO9wq4fpqSj+yXKwKNA+5k3fA4pBbftF31inCaSKjuxLoe8WrV68QWsxGd9egie9c6IdI
 yBywUn77gAoRW+TiM1NDnwMnMv4z+P40qOsMT75v0MfsXzOcJHZrGhGbJHfZzhGUWboZ+R
 AR9cTeNpziTZ8FvEH+0TzKxFYjMX1L4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-3NKfNeu9MbqhIullJWIHLg-1; Tue, 04 May 2021 04:53:34 -0400
X-MC-Unique: 3NKfNeu9MbqhIullJWIHLg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDA2C18B615C
 for <qemu-devel@nongnu.org>; Tue,  4 May 2021 08:53:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 695BA2AABD;
 Tue,  4 May 2021 08:53:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8A1701800383; Tue,  4 May 2021 10:53:17 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] Usb 20210504 patches
Date: Tue,  4 May 2021 10:53:10 +0200
Message-Id: <20210504085317.207369-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 15106f7dc3290ff3254611f265849a314a93eb0e=
:=0D
=0D
  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-hex-20210502' =
into staging (2021-05-02 16:23:05 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/usb-20210504-pull-request=0D
=0D
for you to fetch changes up to 6d900b0752a72d1236a37dd31ff4a9e685e5ff56:=0D
=0D
  usb: limit combined packets to 1 MiB (CVE-2021-3527) (2021-05-04 08:38:55=
 +0200)=0D
=0D
----------------------------------------------------------------=0D
usb: fix some memory allocation issues (CVE-2021-3527).=0D
usb: add stubs, allow building without usb subsystem.=0D
=0D
----------------------------------------------------------------=0D
=0D
Gerd Hoffmann (5):=0D
  usb/hid: avoid dynamic stack allocation=0D
  usb/redir: avoid dynamic stack allocation (CVE-2021-3527)=0D
  usb/mtp: avoid dynamic stack allocation=0D
  usb/xhci: sanity check packet size (CVE-2021-3527)=0D
  usb: limit combined packets to 1 MiB (CVE-2021-3527)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/usb/host-stub: Remove unused header=0D
  hw/usb: Do not build USB subsystem if not required=0D
=0D
 hw/usb/combined-packet.c |  4 +++-=0D
 hw/usb/dev-hid.c         |  2 +-=0D
 hw/usb/dev-mtp.c         |  3 ++-=0D
 hw/usb/dev-wacom.c       |  2 +-=0D
 hw/usb/hcd-xhci.c        |  5 +++++=0D
 hw/usb/host-stub.c       |  1 -=0D
 hw/usb/redirect.c        |  6 +++---=0D
 stubs/usb-dev-stub.c     | 25 +++++++++++++++++++++++++=0D
 MAINTAINERS              |  1 +=0D
 hw/usb/meson.build       |  9 +++------=0D
 stubs/meson.build        |  1 +=0D
 11 files changed, 45 insertions(+), 14 deletions(-)=0D
 create mode 100644 stubs/usb-dev-stub.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


