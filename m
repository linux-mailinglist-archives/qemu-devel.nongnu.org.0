Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2561B3CB7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 12:08:16 +0200 (CEST)
Received: from localhost ([::1]:47162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRCIh-0000aR-5Z
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 06:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40956)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jRCD8-0002Vg-H6
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 06:02:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jRCD8-0004sv-1S
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 06:02:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20979
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jRCD7-0004kz-IT
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 06:02:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587549748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zuWjTNacGN/P940gLDLAUtY2OcW3hRziwkgJsSOLJZ4=;
 b=XIVUXH7YjqNptxpJ+DmFRUxaRw1qEMJWO+8cus7/Wb/kP9xvCqt/U4hCx1+ATZWWP/yOcY
 ptDJbDTcBVsGOL0XFbW0FgnOywEL96/FTqzCOvCMeJm+GisKONbKbrYz6+HWFaOpDxrOBE
 l3Yy/V/D3EJmbaHGmuGpgh3BDdb9sSo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-3hltm4uHO_KsmyxOS04OUA-1; Wed, 22 Apr 2020 06:02:26 -0400
X-MC-Unique: 3hltm4uHO_KsmyxOS04OUA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D41408018A6;
 Wed, 22 Apr 2020 10:02:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B6E05D710;
 Wed, 22 Apr 2020 10:02:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F12BF9D9E; Wed, 22 Apr 2020 12:02:11 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] ramfb: drop leftover debug message
Date: Wed, 22 Apr 2020 12:02:11 +0200
Message-Id: <20200422100211.30614-6-kraxel@redhat.com>
In-Reply-To: <20200422100211.30614-1-kraxel@redhat.com>
References: <20200422100211.30614-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:04:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, lersek@redhat.com,
 hqm03ster@gmail.com, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/ramfb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/display/ramfb.c b/hw/display/ramfb.c
index d1b1cb9bb294..be884c9ea837 100644
--- a/hw/display/ramfb.c
+++ b/hw/display/ramfb.c
@@ -88,8 +88,6 @@ static void ramfb_fw_cfg_write(void *dev, off_t offset, s=
ize_t len)
     addr   =3D be64_to_cpu(s->cfg.addr);
     format =3D qemu_drm_format_to_pixman(fourcc);
=20
-    fprintf(stderr, "%s: %dx%d @ 0x%" PRIx64 "\n", __func__,
-            s->width, s->height, addr);
     surface =3D ramfb_create_display_surface(width, height,
                                            format, stride, addr);
     if (!surface)
--=20
2.18.2


