Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6B036D7D1
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 14:56:37 +0200 (CEST)
Received: from localhost ([::1]:45424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbjk4-0007zr-OU
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 08:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbjfT-0002Ux-Hw
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:51:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbjfO-00023n-Ou
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619614306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N0dhowChTqRyBuuWWaw5DLSXvEEABTOd2xLvFKLygv0=;
 b=GfcL4IZd9Zku4ZE5WmqrK5yKa+4zx1m+SSS1/WxvDZu5WRQXa7FGvXpXPHYsmmiKUojPOE
 Bc+9EFBMK4uIZ/DFTvJEGL03g9wy5Jzrb+rX+l4Adwz9dJ3oVsiXuvZJIjvQdubTRi0WfY
 QNXEw37wNIZ7OLnMnQWSAjaoGWC3R30=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-t2leiDxGNtC6rXuLpd9OEg-1; Wed, 28 Apr 2021 08:51:39 -0400
X-MC-Unique: t2leiDxGNtC6rXuLpd9OEg-1
Received: by mail-wr1-f72.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so143569wre.22
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 05:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N0dhowChTqRyBuuWWaw5DLSXvEEABTOd2xLvFKLygv0=;
 b=D2oBa515+Tev20KCkMu3V3P8++GwHOd4tbTv+iKf4jPvP6sBBOl9Nxq+BMRgn3Z61K
 Pw+ciZWEquduL2L+iH0xzYn4KNkRA2ssysyozsNz/qGJTPABUEdcv+sHjiWFz9dOO4LL
 FNlDGya7v6gQjvyjC339Yrjacv/Bic97ZKlxP+JyeKn7/QvQz9aLQsCoc9yaIWjp9+KY
 gNDpWQsFleaIPgQ9dAyU4TU8kQtZ2i+NKOa8lJ4fbQBfKCPLOTt8WaPGPU2qRMHtXbq5
 kizn5n3izZ4+l8Bib/rFVvRerAR/BymtKKfis8UZnQkL9+5SIfN/CtwEqTsBSiLb/NYv
 HiGg==
X-Gm-Message-State: AOAM531CfvC4K6hXKWe4I0KsN+FETpUSLdfGpJ+IIE+vDZYpD288StVX
 FeRI6ExlBXgYl2EZxw5rYYr9sopAmOgke8KNxwMz0FyTpD9IBkjqQI2Xw33s84CuLYZPr7DAD/s
 ea8JwUsGyKsen5gI=
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr13888422wmg.49.1619614296229; 
 Wed, 28 Apr 2021 05:51:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysyzOYQFoaX5a3Iv3QV9SuIbCpjqyoOS3fc46vp//pW6STA0imv9e2G9yhC7nFwE9/9z5ogA==
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr13888399wmg.49.1619614296064; 
 Wed, 28 Apr 2021 05:51:36 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id x189sm6770544wmg.17.2021.04.28.05.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 05:51:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] hw/sparc/sun4m: Inline sun4m_fdctrl_init()
Date: Wed, 28 Apr 2021 14:51:02 +0200
Message-Id: <20210428125104.358535-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428125104.358535-1-philmd@redhat.com>
References: <20210428125104.358535-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is only one call site for sun4m_fdctrl_init(), and this
function is specific to the sun4m machines, not part of the
SYSBUS_FDC API. Move it locally with the machine code, and
remove its declaration in "hw/block/fdc.h".

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/block/fdc.h |  2 --
 hw/block/fdc-sysbus.c  | 16 ----------------
 hw/sparc/sun4m.c       | 16 ++++++++++++++++
 3 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/include/hw/block/fdc.h b/include/hw/block/fdc.h
index 52e45c53078..06612218630 100644
--- a/include/hw/block/fdc.h
+++ b/include/hw/block/fdc.h
@@ -14,8 +14,6 @@ void isa_fdc_init_drives(ISADevice *fdc, DriveInfo **fds);
 void sysbus_fdc_init_drives(SysBusDevice *dev, DriveInfo **fds);
 void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
                         hwaddr mmio_base, DriveInfo **fds);
-void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
-                       DriveInfo **fds, qemu_irq *fdc_tc);
 
 FloppyDriveType isa_fdc_get_drive_type(ISADevice *fdc, int i);
 int cmos_get_fd_drive_type(FloppyDriveType fd0);
diff --git a/hw/block/fdc-sysbus.c b/hw/block/fdc-sysbus.c
index 1163e53165d..8f94c2efb63 100644
--- a/hw/block/fdc-sysbus.c
+++ b/hw/block/fdc-sysbus.c
@@ -123,22 +123,6 @@ void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
     sysbus_fdc_init_drives(sbd, fds);
 }
 
-void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
-                       DriveInfo **fds, qemu_irq *fdc_tc)
-{
-    DeviceState *dev;
-    SysBusDevice *sbd;
-
-    dev = qdev_new("sun-fdtwo");
-    sbd = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(sbd, &error_fatal);
-    sysbus_connect_irq(sbd, 0, irq);
-    sysbus_mmio_map(sbd, 0, io_base);
-    *fdc_tc = qdev_get_gpio_in(dev, 0);
-
-    sysbus_fdc_init_drives(sbd, fds);
-}
-
 static void sysbus_fdc_common_initfn(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 1a00816d9a8..27bcea07157 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -837,6 +837,22 @@ static void dummy_fdc_tc(void *opaque, int irq, int level)
 {
 }
 
+static void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
+                              DriveInfo **fds, qemu_irq *fdc_tc)
+{
+    DeviceState *dev;
+    SysBusDevice *sbd;
+
+    dev = qdev_new("sun-fdtwo");
+    sbd = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(sbd, &error_fatal);
+    sysbus_connect_irq(sbd, 0, irq);
+    sysbus_mmio_map(sbd, 0, io_base);
+    *fdc_tc = qdev_get_gpio_in(dev, 0);
+
+    sysbus_fdc_init_drives(sbd, fds);
+}
+
 static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
                           MachineState *machine)
 {
-- 
2.26.3


