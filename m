Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFA21B46A0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 15:50:59 +0200 (CEST)
Received: from localhost ([::1]:51084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRFmE-0002kw-0m
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 09:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39468)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jRFjk-00008d-Oi
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:48:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jRFji-000896-G4
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:48:23 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37432
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jRFjh-00084T-U2
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 09:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587563300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cfTlLXtoGanxq3ON/PmXohAadgw+dyYLdekRQbAtnks=;
 b=cAor98Nnhw+MOeARumw6SjCPNu3cXYwum236D8nnn6PG2eYKYWuOhOiRS53viwhP0+THNb
 UAt1cryr/qA9CG5D4JI2pVPhV9+zP4b/84XjS2sCuOBf4GIb3jE2otGKXOxlrwdHUq/+oG
 LbglJWp7MVHjVxI7XWhlIaq6VPGnEPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-pmaZnJSVPniW2U4bk3QMHQ-1; Wed, 22 Apr 2020 09:48:19 -0400
X-MC-Unique: pmaZnJSVPniW2U4bk3QMHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 117418010FB;
 Wed, 22 Apr 2020 13:48:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7ADC8600DE;
 Wed, 22 Apr 2020 13:48:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CF29811358BD; Wed, 22 Apr 2020 15:48:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] sam460ex: Suppress useless warning on -m 32 and -m 64
Date: Wed, 22 Apr 2020 15:48:12 +0200
Message-Id: <20200422134815.1584-2-armbru@redhat.com>
In-Reply-To: <20200422134815.1584-1-armbru@redhat.com>
References: <20200422134815.1584-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:57:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Requesting 32 or 64 MiB of RAM with the sam460ex machine type produces
a useless warning:

    qemu-system-ppc: warning: Memory size is too small for SDRAM type, adju=
sting type

This is because sam460ex_init() asks spd_data_generate() for DDR2,
which is impossible, so spd_data_generate() corrects it to DDR.

The warning goes back to commit 08fd99179a "sam460ex: Clean up SPD
EEPROM creation".

Make sam460ex_init() pass the correct SDRAM type to get rid of the
warning.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/ppc/sam460ex.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 898453cf30..1e3eaac0db 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -335,7 +335,8 @@ static void sam460ex_init(MachineState *machine)
     dev =3D sysbus_create_simple(TYPE_PPC4xx_I2C, 0x4ef600700, uic[0][2]);
     i2c =3D PPC4xx_I2C(dev)->bus;
     /* SPD EEPROM on RAM module */
-    spd_data =3D spd_data_generate(DDR2, ram_sizes[0], &err);
+    spd_data =3D spd_data_generate(ram_sizes[0] < 128 * MiB ? DDR : DDR2,
+                                 ram_sizes[0], &err);
     if (err) {
         warn_report_err(err);
     }
--=20
2.21.1


