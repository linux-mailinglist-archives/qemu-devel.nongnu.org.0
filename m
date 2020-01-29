Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B8714D12D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 20:25:34 +0100 (CET)
Received: from localhost ([::1]:50452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwsxw-0002jd-Vl
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 14:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47875)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iwswY-0001Rb-RY
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 14:24:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iwswW-0000lI-Sf
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 14:24:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22525
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iwswS-0000hf-PY
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 14:24:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580325840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tTkbxdpiXNcnlMHHc333yZ2bsSyaISyk5IUhQts7x6w=;
 b=ZYRApkc8B3k7niNiLfngiINCxwovb2GzR9mxheCFG5uYAsGDK//LHfIG0xEztIkmjDqUlX
 3dKDZEqnsrzPTCAfFPihxhMgMUA9rIQSZOP2edPvT3jzu1e90v9z56+vH+SHogixMvOHOv
 1WCwRtsV4BiRnYkiVTZC4i0yh4G9PYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-xKGunpWLO66R-OAnNS7XcQ-1; Wed, 29 Jan 2020 14:23:58 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F21311861AC8;
 Wed, 29 Jan 2020 19:23:56 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-184.brq.redhat.com [10.40.205.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ED0B7792C;
 Wed, 29 Jan 2020 19:23:52 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/hppa/Kconfig: LASI chipset requires PARALLEL port
Date: Wed, 29 Jan 2020 20:23:50 +0100
Message-Id: <20200129192350.27143-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: xKGunpWLO66R-OAnNS7XcQ-1
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, richard.henderson@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PARISC Lasi chipset emulation requires some of the common parallel
support and fails to build on a --without-default-devices:

    LINK    hppa-softmmu/qemu-system-hppa
  /usr/bin/ld: hw/hppa/lasi.o: in function `lasi_init':
  hw/hppa/lasi.c:324: undefined reference to `parallel_mm_init'
  collect2: error: ld returned 1 exit status
  make[1]: *** [Makefile:206: qemu-system-hppa] Error 1

Fixes: 376b851909d
Reported-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/hppa/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/hppa/Kconfig b/hw/hppa/Kconfig
index 82178c7dcb..22948db025 100644
--- a/hw/hppa/Kconfig
+++ b/hw/hppa/Kconfig
@@ -12,4 +12,5 @@ config DINO
     select LSI_SCSI_PCI
     select LASI_82596
     select LASIPS2
+    select PARALLEL
     select ARTIST
--=20
2.21.1


