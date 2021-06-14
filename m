Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245213A6F3E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:38:23 +0200 (CEST)
Received: from localhost ([::1]:59796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lssPe-0008TK-6F
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssKL-0005DN-C1
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:32:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssKJ-00051y-Sj
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:32:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623699171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GUFeEEoFjmM1/XYciNn6ZhunPr6SB2W2GijMTTXjMzY=;
 b=WZQSJRfL+2NaZFu7Fkf95CUHZzWr/0sCANiFobWMKWAldFOYBURI3kkliteFrAY8U0YOoM
 FyV0X67tZ3Ouob/fo7C3MBmfzazftEQAXvLXudx/6hVnwV+a29V4jbzjz/1PK5/X66dmjl
 StuS6kLgDvMCGNuiRXw4qnJX1nLrxpY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-p2ZgV8tKObaW2gpkV6BADQ-1; Mon, 14 Jun 2021 15:32:50 -0400
X-MC-Unique: p2ZgV8tKObaW2gpkV6BADQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 g14-20020a05600c4eceb02901b609849650so25085wmq.6
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 12:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GUFeEEoFjmM1/XYciNn6ZhunPr6SB2W2GijMTTXjMzY=;
 b=RacFKhQYCHrdLZ8wlehjmTv5kLeZXcdSPRdKcdPSjsBTbmLfC910qD09fl27N9CIce
 yikwf/VPWcgjUOj/u6KzsGZFzNlYgUZyj+HF3AUre0QA9jhQhiy2bOyr4z2an+Xvb8Cb
 rfGcLh8lXE1lsCQ8Mj+3u4AMhqC7aMLwRqH4JqwAbODNx5S98xJtz5bMNUhMxvLEXynm
 xbcSgQzvofcEsIrzts/VKGrG90A6EQqFaV3KgLxgQRxgiQs31svoBBS0eQfMCEv9ixEf
 TPi/I4L3uK97Ay68AT1D8MYmdOxZimAd71+U5A28ckgz8l2kanZAnNftABXSqaNCRSax
 i+qQ==
X-Gm-Message-State: AOAM530z1bE3DonY35nUnyiuKXzknJAD42DnK8aQHxCDJJsPDCIXWWlu
 ee9SzAG9hLLPpKhjNtDv9ERr7QvXWg8WuQXj7pxMgmvJEcuZ4ukSw8PRIG/Pta8dKfgwDBc0JXA
 3omUUtZnL6bJr1QGrys529S+b1wTnEv2bFgXGWPAnwT/fSSYnZP+U6zzSCEj/fLXL
X-Received: by 2002:a1c:f70b:: with SMTP id v11mr18391385wmh.186.1623699168879; 
 Mon, 14 Jun 2021 12:32:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfbP4V9/Mk6OJddPy8rsorzrIj3a1vmo4xISdIF7SCVUGnUqELygV9w2TNyorUiMtCmHOHWw==
X-Received: by 2002:a1c:f70b:: with SMTP id v11mr18391361wmh.186.1623699168633; 
 Mon, 14 Jun 2021 12:32:48 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id k5sm17726461wrv.85.2021.06.14.12.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 12:32:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 6/6] hw/block/fdc: Add description to floppy controllers
Date: Mon, 14 Jun 2021 21:32:20 +0200
Message-Id: <20210614193220.2007159-7-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614193220.2007159-1-philmd@redhat.com>
References: <20210614193220.2007159-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change the '-device help' output from:

  Storage devices:
  name "floppy", bus floppy-bus, desc "virtual floppy drive"
  name "isa-fdc", bus ISA

to:

  Storage devices:
  name "floppy", bus floppy-bus, desc "virtual floppy drive"
  name "isa-fdc", bus ISA, desc "virtual floppy controller"

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/fdc-isa.c    | 1 +
 hw/block/fdc-sysbus.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/hw/block/fdc-isa.c b/hw/block/fdc-isa.c
index 0e22a10732d..3bf64e06657 100644
--- a/hw/block/fdc-isa.c
+++ b/hw/block/fdc-isa.c
@@ -282,6 +282,7 @@ static void isabus_fdc_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
 
+    dc->desc = "virtual floppy controller";
     dc->realize = isabus_fdc_realize;
     dc->fw_name = "fdc";
     dc->reset = fdctrl_external_reset_isa;
diff --git a/hw/block/fdc-sysbus.c b/hw/block/fdc-sysbus.c
index c6308f53004..57fc8773f12 100644
--- a/hw/block/fdc-sysbus.c
+++ b/hw/block/fdc-sysbus.c
@@ -205,6 +205,7 @@ static void sysbus_fdc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->desc = "virtual floppy controller";
     device_class_set_props(dc, sysbus_fdc_properties);
 }
 
@@ -230,6 +231,7 @@ static void sun4m_fdc_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     sbdc->use_strict_io = true;
+    dc->desc = "virtual floppy controller";
     device_class_set_props(dc, sun4m_fdc_properties);
 }
 
-- 
2.31.1


