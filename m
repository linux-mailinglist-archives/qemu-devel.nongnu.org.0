Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502185C538
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 23:55:10 +0200 (CEST)
Received: from localhost ([::1]:45804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi4GT-0006Vd-Gr
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 17:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54904)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hi3WK-0006qa-Sp
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 17:07:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hi3WH-0005e5-Jt
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 17:07:27 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:55422)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hi3WH-0005cz-BV
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 17:07:25 -0400
Received: by mail-wm1-f53.google.com with SMTP id a15so843347wmj.5
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 14:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=O0qux12GpX3gODzOI2UowV8fi9llKB8go8fG3JIr+S8=;
 b=WrtLyyntmoC4ZuLUeUCgEuzq/5QpinYuVKuaXzq/FLGL5WBS5BTpDgrZ6b/7H9YocE
 YxYFtqTpK2hf88InI9tg3fxGXFsL6EHAhTQw1oDfgbbkc85tQjjszhVp9Ge5s0TxmsXa
 cM3QNc5009w7vYHi/+6wFfhuXZfKNjoZiK6wtvhdFp7TKf8Q9SXGVYPzz35E9oPZdMrw
 oCcaC+18Qsy6pl3RApboc76jsXhzDXL2/0Wjl52IaQKty9imG/lwR6MpxIQOskFGt1ff
 1ZNEyA8VqePYF96yYH0li/GeW43YKfuEjVfIbyLH5xqVC3f1ihiv7hVl8U8xbM1QCeld
 583Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O0qux12GpX3gODzOI2UowV8fi9llKB8go8fG3JIr+S8=;
 b=F5lFrs7cZRmzTZs/QRybvnugSaz1ft0jbAzB9BMsgQqDDeKoHPFGbiihgZerMM1+ac
 +m0osFVeXzaKOOgVMd2skltkKmo59nyb1SzpqC7Yinvlq39AgIn91yH11v5bf+NF3XTQ
 T2fbNfKOT5LO3uXpssCvJk4a8ojdH+TfCZs4JcyPTlAs3ggeGSDQrGzooPTsMtPAPpWk
 BmcjcPRfim3+J9zfW6Dh8gjgWhZVn/a+lzfoV58HrP1KcqrDbW+2x/YM7SS8TDfZepsc
 +JdMWOG7FRUkMlRzG4Q+V/Z0uEuzOOAEAmRM51s3pYlnZoLrfNeIK576v+H5OrE+4b4x
 9Xmg==
X-Gm-Message-State: APjAAAWk8MP6mNq3p9oXSZ3mPJyXED6SMshXCsUNofDF6fWL/VABI1op
 WpJzgibxbFFkriuzieN8OSfxJ/8TRRGtJw==
X-Google-Smtp-Source: APXvYqwHo1LY6zFx8HWkozeobRgA0Ah6oOAEFTOPy7YZAv4fXNURX4Bg9AwJpdUfzIOkCHnGo19wfg==
X-Received: by 2002:a1c:63d7:: with SMTP id x206mr122570wmb.19.1561999205891; 
 Mon, 01 Jul 2019 09:40:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o6sm26573508wra.27.2019.07.01.09.40.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 09:40:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 17:39:16 +0100
Message-Id: <20190701163943.22313-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190701163943.22313-1-peter.maydell@linaro.org>
References: <20190701163943.22313-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.53
Subject: [Qemu-devel] [PULL 19/46] aspeed: remove the "ram" link
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

It has never been used as far as I can tell from the git history.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-id: 20190618165311.27066-13-clg@kaod.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/aspeed.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 96de4f5c2a8..5d73267da16 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -195,8 +195,6 @@ static void aspeed_board_init(MachineState *machine,
     memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_size);
     memory_region_add_subregion(get_system_memory(),
                                 sc->info->memmap[ASPEED_SDRAM], &bmc->ram);
-    object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc->ram),
-                                   &error_abort);
 
     max_ram_size = object_property_get_uint(OBJECT(&bmc->soc), "max-ram-size",
                                             &error_abort);
-- 
2.20.1


