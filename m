Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FC0127C50
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 15:10:38 +0100 (CET)
Received: from localhost ([::1]:56528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiIzF-000567-5a
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 09:10:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iiIea-0006D7-NM
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:49:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iiIeZ-0005Ag-Dk
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:49:16 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26975
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iiIeZ-00059G-6o
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 08:49:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576849754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jz7FM9d++rLKpXEPo+ycYdkEZnKY0xtumNnSuPHxPIY=;
 b=PhXvezDyIBP7DV8FlwRdpO9ln9oUdGc77egdcjNMNKofgmBtXGuTBSQ9efUiP6G+S56rC9
 urRmeRB69z6Fm6TLgrY/c2Ie/GhOJFy0RmdZtRXT9zlpQudEL7dGs97WgT3T67tV8Hy9Kv
 a42OaNSLUpApAx/maBUcqfVF3U8icEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-Fe3LxP0yOYOPFs_GwrGlHA-1; Fri, 20 Dec 2019 08:49:11 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8200380306D;
 Fri, 20 Dec 2019 13:49:10 +0000 (UTC)
Received: from localhost (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31A9A5DA76;
 Fri, 20 Dec 2019 13:49:01 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 18/37] mips: baudbase is 115200 by default
Date: Fri, 20 Dec 2019 17:45:42 +0400
Message-Id: <20191220134601.571905-19-marcandre.lureau@redhat.com>
In-Reply-To: <20191220134601.571905-1-marcandre.lureau@redhat.com>
References: <20191220134601.571905-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Fe3LxP0yOYOPFs_GwrGlHA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(The default value is set for TYPE_SERIAL in serial_properties)

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 hw/mips/mips_mipssim.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/mips/mips_mipssim.c b/hw/mips/mips_mipssim.c
index 5ee26108f5..3cd0e6eb33 100644
--- a/hw/mips/mips_mipssim.c
+++ b/hw/mips/mips_mipssim.c
@@ -223,7 +223,6 @@ mips_mipssim_init(MachineState *machine)
     if (serial_hd(0)) {
         DeviceState *dev =3D qdev_create(NULL, TYPE_SERIAL_IO);
=20
-        qdev_prop_set_uint32(dev, "baudbase", 115200);
         qdev_prop_set_chr(dev, "chardev", serial_hd(0));
         qdev_set_legacy_instance_id(dev, 0x3f8, 2);
         qdev_init_nofail(dev);
--=20
2.24.0.308.g228f53135a


