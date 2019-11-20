Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B659103EF0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 16:39:06 +0100 (CET)
Received: from localhost ([::1]:59482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXS4P-0006jX-Fd
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 10:39:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34501)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iXRuF-0003F8-Oj
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 10:28:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iXRuE-0007iv-Nw
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 10:28:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58351
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iXRuE-0007ip-KU
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 10:28:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574263714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R8dyC9yt8o2qjOQgTxme+zzYF9X/JQkRUMrF/lFPTG0=;
 b=NKWJUxzVKHJ69zD5BKA9qTK+KAHStk5T49ovm3fzTW9CwRDBR2wcLG7STxrs+d/qvJ6qV7
 flbwOTPhoeFhg9IprY1bbAptBWmcwjy9p5BbWyHs63/3oOYWfbJfdkSb0MqqoFeJLzeGiA
 UlXZ3MB5raApDdo0MdLnlFp7XY5akJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-4AWDb5c_MwO23qrcdj3fOw-1; Wed, 20 Nov 2019 10:28:30 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C39441005502;
 Wed, 20 Nov 2019 15:28:28 +0000 (UTC)
Received: from localhost (ovpn-112-56.ams2.redhat.com [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE6DF60499;
 Wed, 20 Nov 2019 15:28:24 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/37] mips: baudbase is 115200 by default
Date: Wed, 20 Nov 2019 19:24:23 +0400
Message-Id: <20191120152442.26657-19-marcandre.lureau@redhat.com>
In-Reply-To: <20191120152442.26657-1-marcandre.lureau@redhat.com>
References: <20191120152442.26657-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 4AWDb5c_MwO23qrcdj3fOw-1
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
Cc: peter.maydell@linaro.org, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/mips/mips_mipssim.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/mips/mips_mipssim.c b/hw/mips/mips_mipssim.c
index bfafa4d7e9..3cd0e6eb33 100644
--- a/hw/mips/mips_mipssim.c
+++ b/hw/mips/mips_mipssim.c
@@ -223,7 +223,6 @@ mips_mipssim_init(MachineState *machine)
     if (serial_hd(0)) {
         DeviceState *dev =3D qdev_create(NULL, TYPE_SERIAL_IO);
=20
-        qdev_prop_set_uint32(DEVICE(dev), "baudbase", 115200);
         qdev_prop_set_chr(dev, "chardev", serial_hd(0));
         qdev_set_legacy_instance_id(dev, 0x3f8, 2);
         qdev_init_nofail(dev);
--=20
2.24.0


