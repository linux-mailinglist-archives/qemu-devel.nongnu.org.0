Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D58EF88D2
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 07:52:18 +0100 (CET)
Received: from localhost ([::1]:59534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUQ2D-00057n-9F
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 01:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58152)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iUPu0-0005Xo-Cz
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 01:43:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iUPtz-0000WV-28
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 01:43:48 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40440
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iUPty-0000Vp-Uq
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 01:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573541026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mPporNFL0AHIftOFO7b/4qzwt0OV6ge/YucoGK+qrCc=;
 b=c+NQEjmCxmwjC1Jkh3/n3MaPAJqHTgxlVAlDT0KLqUmV7n9BpJIQUCTiBTQWp+q+7awwJB
 JbsLUV6Q5PXWtE3yIJl6uXm4VKe2uXXjdIZ+mwi1atbOBy4bSG9aqDw2ydHWDMOTeVSXCv
 s5lWRY/4YBVUkc6NotyoCPl7nplBdMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-rnmoRC4BOXqaA37EvYeELg-1; Tue, 12 Nov 2019 01:43:44 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAA3F800C61;
 Tue, 12 Nov 2019 06:43:43 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-124.ams2.redhat.com
 [10.36.116.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE76B5DDA8;
 Tue, 12 Nov 2019 06:43:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/6] MAINTAINERS: slirp: Remove myself as maintainer
Date: Tue, 12 Nov 2019 07:43:29 +0100
Message-Id: <20191112064332.5074-4-thuth@redhat.com>
In-Reply-To: <20191112064332.5074-1-thuth@redhat.com>
References: <20191112064332.5074-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: rnmoRC4BOXqaA37EvYeELg-1
X-Mimecast-Spam-Score: 0
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jan Kiszka <jan.kiszka@siemens.com>

I haven't been doing anything here for a long time, nor does my git repo
still play a role.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Message-Id: <759f8f44-9a01-a9f1-c7cf-65d40151a93a@web.de>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Acked-by: Samuel Thibault <samuel.thibault@gnu.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 363e72a467..ff8d0d29f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2143,13 +2143,11 @@ F: include/hw/registerfields.h
=20
 SLIRP
 M: Samuel Thibault <samuel.thibault@ens-lyon.org>
-M: Jan Kiszka <jan.kiszka@siemens.com>
 S: Maintained
 F: slirp/
 F: net/slirp.c
 F: include/net/slirp.h
 T: git https://people.debian.org/~sthibault/qemu.git slirp
-T: git git://git.kiszka.org/qemu.git queues/slirp
=20
 Stubs
 M: Paolo Bonzini <pbonzini@redhat.com>
--=20
2.23.0


