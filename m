Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D16A1756CC
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 10:19:58 +0100 (CET)
Received: from localhost ([::1]:57114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8hEz-0005hZ-83
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 04:19:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43961)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1j8hDp-0004WH-Dc
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 04:18:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1j8hDo-0007lN-2u
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 04:18:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24454
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1j8hDn-0007l0-W8
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 04:18:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583140722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TvXneKM7rDWiTOI0Xj2IfZ/nTwAbvf8/wkM3l8DSXsk=;
 b=b9gFXdPbC7E3rx73wJQBO4RcD0tg3JXqnCgvyyGthIO1aRvbgnkNSjdO+d+w+hRm81NVad
 xvOvJQOk5nmw2iv+sw1s6DN3V4Ykpbp1u6EKwOEGX93Q71Z3GS8btyLLJlmTtAGsXuXWw/
 WmGF977/WPY/tNBToCfr+y9hDHTLFEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-PHZUzAEjM16XVafkgc6xBA-1; Mon, 02 Mar 2020 04:18:41 -0500
X-MC-Unique: PHZUzAEjM16XVafkgc6xBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E8E813E4
 for <qemu-devel@nongnu.org>; Mon,  2 Mar 2020 09:18:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCDF45DA75;
 Mon,  2 Mar 2020 09:18:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D768517506; Mon,  2 Mar 2020 10:18:36 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Vga 20200302 patches
Date: Mon,  2 Mar 2020 10:18:34 +0100
Message-Id: <20200302091836.29012-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

The following changes since commit e0175b71638cf4398903c0d25f93fe62e0606389=
:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200=
228' into staging (2020-02-28 16:39:27 +0000)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/vga-20200302-pull-request

for you to fetch changes up to 44b5c1ebfa5db337714180e9d4a8d525da5595d6:

  qxl: map rom r/o (2020-03-02 08:24:36 +0100)

----------------------------------------------------------------
vga: bugfixes for qxl and edid generator.

----------------------------------------------------------------

Anton V. Boyarshinov (1):
  Arithmetic error in EDID generation fixed

Gerd Hoffmann (1):
  qxl: map rom r/o

 hw/display/edid-generate.c | 4 ++--
 hw/display/qxl.c           | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

--=20
2.18.2


