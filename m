Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 954E837ABB2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 18:18:17 +0200 (CEST)
Received: from localhost ([::1]:53030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgV5M-0007i2-DF
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 12:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgV2s-0004ua-9b
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:15:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgV2j-0002ir-VN
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:15:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620749731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=htAjo2GS8BtMQHaSpcJt9cMrsO0yCT7qU8z7oOuRmAY=;
 b=S6Lbg4ai4pNWlH/N+CNjZk0joeBRhZU7hKNMb/C0O6QdpbRveVFqfRpL51DRNbeMQZ+CyS
 YXO7Hin7dmroZGICOuCJ4IgJ9wLVpGfvx/a+l9J0vOtlqPV1ZOXKS62hKumRQYZQemSUg3
 GA/v72WNOCOISaqBKDvLgYgOQb4OtLQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-WU_QQPrCPgyhmYKdTBJ8kA-1; Tue, 11 May 2021 12:15:27 -0400
X-MC-Unique: WU_QQPrCPgyhmYKdTBJ8kA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n9-20020a1c40090000b02901401bf40f9dso65067wma.0
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 09:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=htAjo2GS8BtMQHaSpcJt9cMrsO0yCT7qU8z7oOuRmAY=;
 b=WMLUgNSiDsz7SMASGijKfJbl7HTauetcNSOp7HaUY4THtNEk4qBOAKyUnjBxSjeGat
 PcizGzTlJzt9Xy6TpvPfpiWuZdJEIWFoilscD1mHWI9XQKFjourbnIrAc6xIG5osPllR
 fqUiW20NsJ2f2ixa615iXB4Zwt/CPKU1wOH4zIulkaoKM4MuxlTs1wxB+TsCn0Pe85Od
 WX5OhIHpI5sPVDeAjjFu9ssAxMC1L5isey5Hz3EnqrwsEFCnUH6CVMi1P5MMMz2MB/e8
 KuVfk1/8G5zbELjofMg6exwF8TuTWPifM8ckmuOQBy4UoMSITRzcYnYudog28YhSDCDN
 z8vQ==
X-Gm-Message-State: AOAM531w9BjgrYxyyQAYrVTQaAK99HyH/L58EjenG25SeU6RGpZdPZLy
 DAiYD8SRgx2dtbPu7CPYaQTNWa4Xtu8B+Pg3VDTZA1Hj709Gjx39YtAvzEYOV7JoGiW4xhx0Av8
 N8GxQisxAqdeFylz0ixACCZ2gQGRJBvxWNGNkHHzezsAzMKA0mUva+qKLKP6teNwA
X-Received: by 2002:a5d:45cb:: with SMTP id b11mr39459626wrs.343.1620749726105; 
 Tue, 11 May 2021 09:15:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTSK3g2wBGq5wt10Os/NTw/+Hj9SlFtkqQEpCHMtP88sLP4+OqvgjtZiMKwyAoiC9lEWFN3A==
X-Received: by 2002:a5d:45cb:: with SMTP id b11mr39459598wrs.343.1620749725961; 
 Tue, 11 May 2021 09:15:25 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id x8sm27289226wru.70.2021.05.11.09.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 09:15:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] hw/block/pflash_cfi02: Set romd mode in
 pflash_cfi02_realize()
Date: Tue, 11 May 2021 18:15:03 +0200
Message-Id: <20210511161504.3076204-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511161504.3076204-1-philmd@redhat.com>
References: <20210511161504.3076204-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The ROMD mode isn't related to mapping setup.
Ideally we'd set this mode when the state machine resets,
but for now simply move it to pflash_cfi02_realize() to
not introduce logical change.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210325120921.858993-2-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 25c053693ce..35e30bb812c 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -173,7 +173,6 @@ static void pflash_setup_mappings(PFlashCFI02 *pfl)
                                  "pflash-alias", &pfl->orig_mem, 0, size);
         memory_region_add_subregion(&pfl->mem, i * size, &pfl->mem_mappings[i]);
     }
-    pfl->rom_mode = true;
 }
 
 static void pflash_reset_state_machine(PFlashCFI02 *pfl)
@@ -917,6 +916,7 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
     /* Allocate memory for a bitmap for sectors being erased. */
     pfl->sector_erase_map = bitmap_new(pfl->total_sectors);
 
+    pfl->rom_mode = true;
     pflash_setup_mappings(pfl);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
 
-- 
2.26.3


