Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D88136D7CB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 14:55:16 +0200 (CEST)
Received: from localhost ([::1]:39086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbjil-0005NE-Bc
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 08:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbjfT-0002Ut-23
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:51:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbjfO-00023i-KN
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:51:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619614305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jos5grHaKacU8I8E/oLFuKIo/PqOiILJ0QPnZ0LTw6s=;
 b=W1JQF/6OhCk0DwT5/bnBWQtDrgkI5hjPvXbJBMImLV52LFbgFgiWM+msqBweWsobQReYwz
 bH2RQQC8lUbzn3jEmFI55/13k5ktYx14NzhyenY7pVhc5Qy7ekexFCI0R9wp0yrAe92RSF
 wRio6Vspj71jlbpXNdY7fOzzcMHTLAk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-x-SZPPNZOFexhiMny5ssOg-1; Wed, 28 Apr 2021 08:51:44 -0400
X-MC-Unique: x-SZPPNZOFexhiMny5ssOg-1
Received: by mail-wr1-f70.google.com with SMTP id
 i43-20020adf90ae0000b029010a6364cdbaso5779342wri.18
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 05:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jos5grHaKacU8I8E/oLFuKIo/PqOiILJ0QPnZ0LTw6s=;
 b=UA2l9slOVL2qaBxee9FyfXh9XmsDEaHZG2W88TBklRWRgy6xWiBXicVsqOrFPP+Bgj
 Oicl4BBl+uNy0Egj5thTEN4jPbQDiIe8xUgIDh0RKrCFF+b8a1d68xB5yUM8OE4L/y46
 pCpINiXM0uLvAHeSAlIbo9dMbwdlTRCCstNEEAs5naXmHfB3hqWVnnG3hbuM/P9GxVDD
 X6PT8+fZ5Ue14rzXG0QAzDnW2PNJHROFWxeJA2sC0KoY+Xm3bbU4JHRpPRql+PWbQ5xY
 2YE9i3B4uC4ElS3DeSgp/GgX4C0FJK2ouCs7gP/eaSoV31GILiwfPNk7FBvs+jsAYvvl
 tG1w==
X-Gm-Message-State: AOAM5306o9Aiq/lGwlXPQVo6Sdgc3PoT6MQTXPnGj79PLNy9CHdjliXc
 f4ShoRVkGWQTPaqCEDMcSG7N82lRLmVP7nvk5gwU09zib6IZK0hV+O5mMHnfyy/QezMKCOqDFZy
 DTV6VGyfMsdJRtKw=
X-Received: by 2002:a05:600c:3587:: with SMTP id
 p7mr19275466wmq.75.1619614300881; 
 Wed, 28 Apr 2021 05:51:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjZZv+gnoNTT4I5fI775y5kkJ4b8PvPUWMRg3VuPSWROq9kSaZxV7Yr16Cow2iSPMOxnXq0g==
X-Received: by 2002:a05:600c:3587:: with SMTP id
 p7mr19275440wmq.75.1619614300696; 
 Wed, 28 Apr 2021 05:51:40 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id s64sm3659275wmf.2.2021.04.28.05.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 05:51:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] hw/block/fdc-sysbus: Add 'dma-channel' property
Date: Wed, 28 Apr 2021 14:51:03 +0200
Message-Id: <20210428125104.358535-8-philmd@redhat.com>
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

QDev properties to be set before the device is realized should
be exposed as a Property with a DEFINE_PROP_XXX() macro, then
accessed with the equivalent qdev_prop_set_xxx() API.

Do this with the FDCtrlSysBus 'dma-channel' property: convert
it to int32_t, default-initialize with DEFINE_PROP_INT32() and
use qdev_prop_set_int32() to set its value in fdctrl_init_sysbus().

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


