Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CA63FD422
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 09:01:33 +0200 (CEST)
Received: from localhost ([::1]:40226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLKFO-0000hd-1o
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 03:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLK8C-0002R5-1x
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 02:53:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLK87-0000BO-So
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 02:53:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630479229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gnK9gcwTfeAtloDaKpMu5yZ7uGVQ6T7mnK+3EetaLEI=;
 b=FSSz/czfIpkgFuHtSqsn8vAENvNS1Lh4CH1ZpWJQNSXpnBS/4kkLshtqYJ2+ENJxK7gSQr
 SGCLX68pOiDLpc0Lqopvjsfj/RHV9I9ZOPslQcmPPzOAenMx197cJsz8LoVZYHycGJTNZ6
 e4e64up2oHCg52hm7gn26+nBVChuyE8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-jd73G2GqNF-MRnLfl1tCjw-1; Wed, 01 Sep 2021 02:53:48 -0400
X-MC-Unique: jd73G2GqNF-MRnLfl1tCjw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB7391854E40
 for <qemu-devel@nongnu.org>; Wed,  1 Sep 2021 06:53:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8E8218AAD;
 Wed,  1 Sep 2021 06:53:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 434AF18000A7; Wed,  1 Sep 2021 08:53:42 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Usb 20210901 patches
Date: Wed,  1 Sep 2021 08:53:40 +0200
Message-Id: <20210901065342.3316013-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit ad22d0583300df420819e6c89b1c022b998fac8a=
:=0D
=0D
  Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.2-20210827=
' into staging (2021-08-27 11:34:12 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/usb-20210901-pull-request=0D
=0D
for you to fetch changes up to ae420c957aff2871b8a1af9cf9ee1a7a75b3552b:=0D
=0D
  hw/usb: Fix typo in comments and print (2021-09-01 06:37:13 +0200)=0D
=0D
----------------------------------------------------------------=0D
usb: bugfixes.=0D
=0D
----------------------------------------------------------------=0D
=0D
Cai Huoqing (1):=0D
  hw/usb: Fix typo in comments and print=0D
=0D
Gerd Hoffmann (1):=0D
  uas: add stream number sanity checks.=0D
=0D
 hw/usb/desc.h            |  2 +-=0D
 hw/usb/quirks-ftdi-ids.h |  4 ++--=0D
 hw/usb/desc-msos.c       | 10 +++++-----=0D
 hw/usb/dev-audio.c       |  4 ++--=0D
 hw/usb/dev-uas.c         | 11 +++++++++++=0D
 hw/usb/host-libusb.c     |  2 +-=0D
 hw/usb/u2f-emulated.c    |  2 +-=0D
 7 files changed, 23 insertions(+), 12 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


