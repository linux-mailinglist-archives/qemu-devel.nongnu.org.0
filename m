Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A682E2B1B2F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 13:31:39 +0100 (CET)
Received: from localhost ([::1]:52076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdYEs-0007Hx-M1
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 07:31:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kdYDN-0005fQ-M1
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 07:30:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kdYDL-0002Bw-Qm
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 07:30:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605270602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LuuTuKHSPwlDGXYjf+nVWvh+5mBgyV0FW5HJI1IWyKY=;
 b=V2B5rVox5ZnwNESofy4Ul8Ki8AtVpYTlLvHfu8qAEkVS0pfmw5SsNJB9Ffgd2/TW1fbwUr
 4xs9yJTM8168GoLTWWiCS0Hb3c64g7i1jbR4YSvN+IhWxjJIYEMxLCiQQoNP1AOoUpty0m
 KOiBDKnG/63Brz2WrW+nwYt237CSheg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-_Ku5nBBBNimAmh6onPADGg-1; Fri, 13 Nov 2020 07:30:00 -0500
X-MC-Unique: _Ku5nBBBNimAmh6onPADGg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDE03809DE6
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 12:29:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C0A35D9E8;
 Fri, 13 Nov 2020 12:29:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 569C9A1E2; Fri, 13 Nov 2020 13:29:55 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] Fixes 20201113 patches
Date: Fri, 13 Nov 2020 13:29:49 +0100
Message-Id: <20201113122955.759-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit cb5d19e8294486551c422759260883ed290226d9=
:=0D
=0D
  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-macppc-20201112'=
 i=3D=0D
nto staging (2020-11-12 11:33:26 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/fixes-20201113-pull-request=0D
=0D
for you to fetch changes up to 172bc8520db1cb98d09b367360068a675fbc9413:=0D
=0D
  xhci: fix nec-usb-xhci properties (2020-11-13 07:36:33 +0100)=0D
=0D
----------------------------------------------------------------=0D
fixes for console, audio, usb, vga.=0D
=0D
----------------------------------------------------------------=0D
=0D
Geoffrey McRae (1):=0D
  audio/jack: fix use after free segfault=0D
=0D
Gerd Hoffmann (1):=0D
  xhci: fix nec-usb-xhci properties=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (3):=0D
  hw/usb/Kconfig: Fix USB_XHCI_NEC (depends on USB_XHCI_PCI)=0D
  hw/display/cirrus_vga: Remove debugging code commented out=0D
  hw/display/cirrus_vga: Fix hexadecimal format string specifier=0D
=0D
lichun (1):=0D
  console: avoid passing con=3D3DNULL to graphic_hw_update_done()=0D
=0D
 audio/jackaudio.c       | 50 ++++++++++++++++++++++++++++++-----------=0D
 hw/display/cirrus_vga.c | 20 +----------------=0D
 hw/usb/hcd-xhci-nec.c   | 31 ++++++++++++++++++++-----=0D
 ui/console.c            |  5 +++--=0D
 hw/usb/Kconfig          |  3 +--=0D
 5 files changed, 68 insertions(+), 41 deletions(-)=0D
=0D
--=3D20=0D
2.27.0=0D
=0D


