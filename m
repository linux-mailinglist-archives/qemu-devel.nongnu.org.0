Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A300187335
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 20:19:27 +0100 (CET)
Received: from localhost ([::1]:47418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDvGo-0007eK-6Q
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 15:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jDupz-0001Z3-Cu
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:51:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jDupy-0000dL-EP
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:51:43 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:25984)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jDupy-0000bn-Ay
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584384702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d82MUeKk+/4B02rjdl6yI9CuL1FxqpOnif29vr+0CBA=;
 b=XmUHB5zhQTc9V88/yje31225NdT/twiLBR37qnx/a/2UyTRSgWPrXp6x7V8lJf1T+EZks6
 k1cPgm4PEa4F7tht/vAfY2hq+KmoLYzsN1SrYEsuSa/njR2FKjJ5BSdu30kf0ztUVjWbg6
 Rx/DSKawUKcQGZE3QyjK0EtAZB50i8c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-EoRbDIeLM-Gv0q2u8EdyGQ-1; Mon, 16 Mar 2020 14:51:37 -0400
X-MC-Unique: EoRbDIeLM-Gv0q2u8EdyGQ-1
Received: by mail-wr1-f72.google.com with SMTP id p2so6924790wrw.8
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 11:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S/FBDGV/15lXYdA91sXPdJa+d5WfDFcmkJ3uIRUkYtg=;
 b=WTBng64nSNy12v73yt4+zjosBS0krwp/AJpEE5KF43lRpZqfzzvt5DEQjyg0Wnn72K
 d3KW+IRUbFjdrp1Vkdxw68VIdx9qOYXPNy7sOCVoU1qPKLv1fOb6y6mu+NxeuWivQv/Y
 Ubh1VfV49Ea2txadijSBBYzO5yo4W/maCKXsmjBI+dOdrL2Qsj5za9oKHhjFANlj+go7
 G8uCQ2eGsXgsnUuzuuG7rzJIWv79C+buFx5eWN+cdbB1JuDjSmbsZ4FnKXpT4iZgbBAe
 RijX71asGEl8kW/JrblM5YDX5AEJx9V7SZ/S7RUKrN5vromP4cEGEwfKCOVMostLbu6f
 Baog==
X-Gm-Message-State: ANhLgQ3uh00H4kvJzBUPfyo+vPrmN/lujHU5bR7eY/5jC+65KmU5FuvQ
 2ZSiADWWlolX3LlRGD5EBoRrwZcFGlZkqyki/Zwklwq9N1JOjs/P5eUq9Xn4GbwTUNEYrAAFaAd
 HZtAuO3/ceCPr0po=
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr819152wrn.106.1584384696511; 
 Mon, 16 Mar 2020 11:51:36 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuMJCY6sWlRrJ/mFfOn5ylCypiBCw1oT6GumW7HgBf2HYpkbKc+2TF6mlV/AlK4WQbxyG8nZA==
X-Received: by 2002:adf:ec4f:: with SMTP id w15mr819137wrn.106.1584384696350; 
 Mon, 16 Mar 2020 11:51:36 -0700 (PDT)
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.96])
 by smtp.gmail.com with ESMTPSA id y11sm1102956wrd.65.2020.03.16.11.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 11:51:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 17/25] hw/core: Let devices own the MemoryRegion they create
Date: Mon, 16 Mar 2020 19:49:58 +0100
Message-Id: <20200316185006.576-18-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316185006.576-1-philmd@redhat.com>
References: <20200316185006.576-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid orphan memory regions being added in the /unattached QOM
container.

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/core/platform-bus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/core/platform-bus.c b/hw/core/platform-bus.c
index 22c5f76dd0..d494e5cec1 100644
--- a/hw/core/platform-bus.c
+++ b/hw/core/platform-bus.c
@@ -187,7 +187,8 @@ static void platform_bus_realize(DeviceState *dev, Erro=
r **errp)
     d =3D SYS_BUS_DEVICE(dev);
     pbus =3D PLATFORM_BUS_DEVICE(dev);
=20
-    memory_region_init(&pbus->mmio, NULL, "platform bus", pbus->mmio_size)=
;
+    memory_region_init(&pbus->mmio, OBJECT(dev), "platform bus",
+                       pbus->mmio_size);
     sysbus_init_mmio(d, &pbus->mmio);
=20
     pbus->used_irqs =3D bitmap_new(pbus->num_irqs);
--=20
2.21.1


