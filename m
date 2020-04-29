Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0215F1BDB23
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 13:54:09 +0200 (CEST)
Received: from localhost ([::1]:45856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTlI0-0007YG-1x
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 07:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50884)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jTlGj-0005sV-4w
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 07:52:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jTlGh-0001zQ-Vw
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 07:52:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45109
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jTlGh-0001yk-I4
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 07:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588161166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8HzfMaz5xTJAgTkcw7l/JDpnlBvQ2/56TeX1FDlCG+s=;
 b=YT2fGNdaIB+df7Y1xQ3PM95Cdbq7QdxALDOT7Y5xyB7hmCl4tUe9Dt3VvKzM2yPyGwtOT1
 C6ECz+exu0+OctWRHmGn4Qjsf3EKpt/vYyciZ7OJ4HAvtHihL96/GYX56r4j8CtGgpaVLb
 oosgM62YXnhwrYpK4x/kD6YpWZQqJ1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-SD4R5NGEPS2NeZI-Q0u2Ww-1; Wed, 29 Apr 2020 07:52:44 -0400
X-MC-Unique: SD4R5NGEPS2NeZI-Q0u2Ww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 531A1835B49;
 Wed, 29 Apr 2020 11:52:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C30F15D9C9;
 Wed, 29 Apr 2020 11:52:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 109749D9C; Wed, 29 Apr 2020 13:52:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] ramfb: drop leftover debug message
Date: Wed, 29 Apr 2020 13:52:33 +0200
Message-Id: <20200429115236.28709-4-kraxel@redhat.com>
In-Reply-To: <20200429115236.28709-1-kraxel@redhat.com>
References: <20200429115236.28709-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 01:42:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, lersek@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, hqm03ster@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
---
 hw/display/ramfb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/display/ramfb.c b/hw/display/ramfb.c
index 9d41c2ad2868..228defee5683 100644
--- a/hw/display/ramfb.c
+++ b/hw/display/ramfb.c
@@ -81,8 +81,6 @@ static void ramfb_fw_cfg_write(void *dev, off_t offset, s=
ize_t len)
     addr      =3D be64_to_cpu(s->cfg.addr);
     format    =3D qemu_drm_format_to_pixman(fourcc);
=20
-    fprintf(stderr, "%s: %dx%d @ 0x%" PRIx64 "\n", __func__,
-            s->width, s->height, addr);
     s->ds =3D ramfb_create_display_surface(s->width, s->height,
                                          format, stride, addr);
 }
--=20
2.18.2


