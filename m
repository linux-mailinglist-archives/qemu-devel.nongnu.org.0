Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AE23372CA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:37:31 +0100 (CET)
Received: from localhost ([::1]:43650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKZG-0006bq-L2
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKWC-0003fG-Rh
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:34:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKW5-0006US-K0
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:34:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615466051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BRx9Eu3UxRqOJFBAVbagJFDLFo0+KXBOeqIobCRbd60=;
 b=R7Mu37wHvH5xBJxAxqklr2TaAtVPEcZ3YMyPL4GxDNxygKrxpDEotHb7Jc33+tz0//CYCH
 nKP0DmwvvHGWD4Fls13lL3G8EyuFYL7yYkBHC0cT/OslPspeUA1oBe+DBuSkC/JjKBNtPx
 jc8hlmRck0yFANP3N/YuwkCtHFcCnaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-9Ulyl5CjNSq3Fexd84m_xg-1; Thu, 11 Mar 2021 07:34:09 -0500
X-MC-Unique: 9Ulyl5CjNSq3Fexd84m_xg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFAF43E74C;
 Thu, 11 Mar 2021 12:34:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DEBC1001281;
 Thu, 11 Mar 2021 12:34:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AF63A180087E; Thu, 11 Mar 2021 13:34:01 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/8] Ui 20210311 patches
Date: Thu, 11 Mar 2021 13:33:53 +0100
Message-Id: <20210311123401.340122-1-kraxel@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 821e7ed167f11f482d2d1a8eaf114a667295a581=
:=0D
=0D
  Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021=
-0=3D=0D
3-09' into staging (2021-03-10 17:22:45 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/ui-20210311-pull-request=0D
=0D
for you to fetch changes up to d1929069e355afb809a50a7f6b6affdea399cc8c:=0D
=0D
  ui/cocoa: Fix mouse association state (2021-03-11 13:33:20 +0100)=0D
=0D
----------------------------------------------------------------=0D
ui: mostly cocoa fixes=0D
=0D
----------------------------------------------------------------=0D
=0D
Akihiko Odaki (7):=0D
  ui/gtk: Remove NULL checks in gd_switch=0D
  ui/cocoa: Use kCGColorSpaceSRGB=0D
  ui/cocoa: Show QEMU icon in the about window=0D
  ui/cocoa: Do not rely on the first argument=0D
  ui/cocoa: Clear modifiers whenever possible=0D
  ui/cocoa: Mark variables static=0D
  ui/cocoa: Fix mouse association state=0D
=0D
Thomas Huth (1):=0D
  docs: Fix removal text of -show-cursor=0D
=0D
 ui/gtk.c                         |   6 +-=0D
 docs/system/removed-features.rst |   4 +-=0D
 ui/cocoa.m                       | 240 +++++++++++++++----------------=0D
 3 files changed, 118 insertions(+), 132 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D


