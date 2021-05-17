Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B183383D06
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:15:36 +0200 (CEST)
Received: from localhost ([::1]:54572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiiF-00044c-8s
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1liiAT-0006eO-Iq
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:40:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1liiAR-0002Ah-J0
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621276839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z14YRAeNHkM20zQ1K99pTtwaHYhMgqGiS7m7zkt7SV4=;
 b=QahpLHbBRRrGQUEy07GUtlBVojaxNt8XWyuDvWC1oxJXBMQYtPnYwJXpqL4bLFihLNE/y/
 +XckHYgsDRscQII2Eah/K63Q2iSdvlFCL77OnZfuHEvWpQlhBUTdOtPOrvMrwVTYYbQL/o
 w5T4T12UweIMHQ2nAEF9kjLlOK35CFk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-Huf26XiJP0OJs8suLMeaIA-1; Mon, 17 May 2021 14:40:37 -0400
X-MC-Unique: Huf26XiJP0OJs8suLMeaIA-1
Received: by mail-ej1-f69.google.com with SMTP id
 eb10-20020a170907280ab02903d65bd14481so1114055ejc.21
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 11:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z14YRAeNHkM20zQ1K99pTtwaHYhMgqGiS7m7zkt7SV4=;
 b=LjX5h0mZAfjp7rFuqkTWhpMHf4UGOlP4WFIilcBz1ZnWcGasaKy+64qL1tSY5Muwqk
 hzNlH3OQfABNVX8upxdTcpY+8ZHkzZ3jj5PKgF4oHLXLGRQzPgy6N/1/R3tXGI/hxgKP
 OvgtadR/vqgIafptR9Tfr44HHdQ4m372ZMjWWtrSfRH6jpQXkY2t7fuZW0hRvB4WMqz9
 WmVX6fdhB5AslNRG6D5IYCW9OKKINZ3iVFguKaRJWJfwyHqft35H3/MUQEGRAzv0q5jN
 V1hIFyFgGjDXwy3xKtaXVp4y17jLRP93bwn7fu6F/1/Z662GNjoEE4GPPeM/LJLKKMSl
 U8rg==
X-Gm-Message-State: AOAM530eHIgQZzmuUAhN1aB8SPVAibU32LaIAHEMOBLXQ+YGKADlqmd6
 3rRsmkmkpW99vQOyeO+OsP0f5aK5t5CfBqGrPKCdH3fSITPRJpOnOTK1mhcFHng4bh6OHAPaMVW
 bU0xbXoPCvfgkHKoMrOrM2yWS+8ZLoP6zsLbcqFiGCtin/52zDoZs8WqOu7H6CKD/
X-Received: by 2002:aa7:db48:: with SMTP id n8mr1725981edt.11.1621276835634;
 Mon, 17 May 2021 11:40:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYLL+ze476YMflHqPfYWNsGren6lsk0H51u5x+5cROb+/Ydta/5Vg8NooW6UKSLfn+rd6t8g==
X-Received: by 2002:aa7:db48:: with SMTP id n8mr1725959edt.11.1621276835452;
 Mon, 17 May 2021 11:40:35 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id bw16sm9166863ejb.50.2021.05.17.11.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 11:40:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v4 8/9] hw/block/fdc-sysbus: Add 'dma-channel' property
Date: Mon, 17 May 2021 20:39:53 +0200
Message-Id: <20210517183954.1223193-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517183954.1223193-1-philmd@redhat.com>
References: <20210517183954.1223193-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QDev properties to be set before the device is realized should
be exposed as a Property with a DEFINE_PROP_XXX() macro, then
accessed with the equivalent qdev_prop_set_xxx() API.

Do this with the FDCtrlSysBus 'dma-channel' property: convert
it to int32_t, default-initialize with DEFINE_PROP_INT32() and
use qdev_prop_set_int32() to set its value in fdctrl_init_sysbus().

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/fdc-internal.h | 2 +-
 hw/block/fdc-sysbus.c   | 9 ++-------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/hw/block/fdc-internal.h b/hw/block/fdc-internal.h
index 278de725e69..29b318f7525 100644
--- a/hw/block/fdc-internal.h
+++ b/hw/block/fdc-internal.h
@@ -96,7 +96,7 @@ struct FDCtrl {
     qemu_irq irq;
     /* Controller state */
     QEMUTimer *result_timer;
-    int dma_chann;
+    int32_t dma_chann;
     uint8_t phase;
     IsaDma *dma;
     /* Controller's identification */
diff --git a/hw/block/fdc-sysbus.c b/hw/block/fdc-sysbus.c
index 8f94c2efb63..74c7c8f2e01 100644
--- a/hw/block/fdc-sysbus.c
+++ b/hw/block/fdc-sysbus.c
@@ -106,15 +106,11 @@ void sysbus_fdc_init_drives(SysBusDevice *dev, DriveInfo **fds)
 void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
                         hwaddr mmio_base, DriveInfo **fds)
 {
-    FDCtrl *fdctrl;
     DeviceState *dev;
     SysBusDevice *sbd;
-    FDCtrlSysBus *sys;
 
     dev = qdev_new("sysbus-fdc");
-    sys = SYSBUS_FDC(dev);
-    fdctrl = &sys->state;
-    fdctrl->dma_chann = dma_chann; /* FIXME */
+    qdev_prop_set_int32(dev, "dma-channel", dma_chann);
     sbd = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(sbd, &error_fatal);
     sysbus_connect_irq(sbd, 0, irq);
@@ -131,8 +127,6 @@ static void sysbus_fdc_common_initfn(Object *obj)
     FDCtrlSysBus *sys = SYSBUS_FDC(obj);
     FDCtrl *fdctrl = &sys->state;
 
-    fdctrl->dma_chann = -1;
-
     qdev_set_legacy_instance_id(dev, 0 /* io */, 2); /* FIXME */
 
     memory_region_init_io(&fdctrl->iomem, obj,
@@ -173,6 +167,7 @@ static Property sysbus_fdc_properties[] = {
     DEFINE_PROP_SIGNED("fallback", FDCtrlSysBus, state.fallback,
                         FLOPPY_DRIVE_TYPE_144, qdev_prop_fdc_drive_type,
                         FloppyDriveType),
+    DEFINE_PROP_INT32("dma-channel", FDCtrlSysBus, state.dma_chann, -1),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.26.3


