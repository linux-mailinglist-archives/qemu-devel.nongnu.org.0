Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5961439442A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 16:23:57 +0200 (CEST)
Received: from localhost ([::1]:37356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmdP2-0005Ed-0t
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 10:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmdNO-0003qs-MU
 for qemu-devel@nongnu.org; Fri, 28 May 2021 10:22:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmdNL-0001nC-Il
 for qemu-devel@nongnu.org; Fri, 28 May 2021 10:22:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622211730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0GHo/YIHhr6iGOoWaipCMMXx0OlfFrYAu0g28GWdW68=;
 b=ZveAJnALJdzm25lzFPRgbSWXGPPYBM+2p8FAFybh242cqI+6YonB/2LIaSDHk5E27Hsyei
 e5p6bSKWTgocaeaDFGN064mQ3yTI3bAU9ziNQlSCYmQ4Jp5M0GgKQEIqYS3kwDwY4jDSF6
 ituD3yOVvLcCRnarss4NrAQjItd6uxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-Abp4NA-MNNeYY0A4fy0UDw-1; Fri, 28 May 2021 10:22:08 -0400
X-MC-Unique: Abp4NA-MNNeYY0A4fy0UDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 570ED801B14
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 14:22:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D8C51378E;
 Fri, 28 May 2021 14:22:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AE2EA1800396; Fri, 28 May 2021 16:22:02 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Usb 20210528 patches
Date: Fri, 28 May 2021 16:21:59 +0200
Message-Id: <20210528142202.2154592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit c8616fc7670b884de5f74d2767aade224c1c5c3a=
:=0D
=0D
  Merge remote-tracking branch 'remotes/philmd/tags/gitlab-ci-20210527' int=
o staging (2021-05-27 16:32:57 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/usb-20210528-pull-request=0D
=0D
for you to fetch changes up to fc967aad408eb4777b099d17ada1f39be5f6fd2e:=0D
=0D
  hw/usb: hcd-xhci-pci: Fix spec violation of IP flag for MSI/MSI-X (2021-0=
5-28 09:10:20 +0200)=0D
=0D
----------------------------------------------------------------=0D
usb: bugfixes for hid and xhci.=0D
=0D
----------------------------------------------------------------=0D
=0D
Katsuhiro Ueno (1):=0D
  hw/input/hid: Add support for keys of jp106 keyboard.=0D
=0D
Ruimei Yan (2):=0D
  hw/usb: hcd-xhci-pci: Raise MSI/MSI-X interrupts only when told to=0D
  hw/usb: hcd-xhci-pci: Fix spec violation of IP flag for MSI/MSI-X=0D
=0D
 hw/usb/hcd-xhci.h        |  2 +-=0D
 hw/input/hid.c           |  4 ++--=0D
 hw/usb/hcd-xhci-pci.c    | 13 ++++++++-----=0D
 hw/usb/hcd-xhci-sysbus.c |  4 +++-=0D
 hw/usb/hcd-xhci.c        |  8 ++++++--=0D
 5 files changed, 20 insertions(+), 11 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


