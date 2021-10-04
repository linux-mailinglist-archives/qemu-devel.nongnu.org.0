Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A39FF4210B9
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 15:51:05 +0200 (CEST)
Received: from localhost ([::1]:45816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXOMy-0001NI-Np
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 09:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXOJr-00067F-C8
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:47:51 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXOJm-0007CM-8V
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 09:47:51 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 t16-20020a1c7710000000b003049690d882so19666702wmi.5
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 06:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7s+jokOdadsrB9ImtjPpK01MtYEBGF9XKyEbrtLXIJU=;
 b=j9aJLF2kSwRc0fXUpDhq2He5bQeWCY8wysIn9cp1CaKpNh4BLSLW1TpxV69PLGhiMX
 2mmI2Q/KZSNDkdIov0NsjdRpVopFk6uvIb8vXbmOCIUNBABEhvaDpI/lgUbji+mhvthJ
 dcpjvGr1jOdwtKjIpmHaRKadwUFYg9+0GwfFUA6VOohssvC38hAcP4leBk3eBcAYzkLF
 EAYBtgimLi9+xIwEZJN6amvR1F83qJSkORNK5OtjzKWOxhyiErKG1Htz3yFYjNWXrihR
 27350BaJEoml+RdtNv8PM7AHQY7LzBAuObgBbHiE8NE3eoRUlIKCyDi8352M3N/AuOGG
 4EYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7s+jokOdadsrB9ImtjPpK01MtYEBGF9XKyEbrtLXIJU=;
 b=AkWF+GDStVWvDC1d3P6ni+F622VImeldWJqP5yAVb3SWPgx3Fr91fmGaelXJYJgFIw
 tHA1pIu81JZVgmrH6HHIy5dk9a5D9QuetpzVmmn8gLxFbrVTHL+4UBHXovoSxjcVURXJ
 V/i+Eh2OIHibNg6nF3UkoRBPalnj/Ni8ghVaTjGSUqNUFAK3OQgN9KDMTUjmEI6aAQpY
 knJqxBGhLvzPzHKwLMAptdSbJ+Bk7IeOQjgTcYX9RCsBQYJ8yiFWJtEXbSlZP4BHFtSs
 hkkw48dNixh97FVybx+dJ+X5XhgXTiqxYSIiTeswL6mCCF7H/v4MWBkQi2LD9fc111O8
 0qxw==
X-Gm-Message-State: AOAM532H7ZmH7RXxQxxG6nMxSFIsT6qMsX3Cdvdl2LC/wKLJvIUAu0cM
 1AZeiqobQDtmFXKAVhFujxqyCw==
X-Google-Smtp-Source: ABdhPJwwU5D1q8fJIL9eAP6ZqSydshC/uY0GQOdbPxJu+U0z0H9s5Xx/D7IAs+KHzLqIqjLMFnTvDw==
X-Received: by 2002:a7b:c048:: with SMTP id u8mr18426941wmc.113.1633355264418; 
 Mon, 04 Oct 2021 06:47:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s3sm14457226wrm.40.2021.10.04.06.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 06:47:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 16AD61FF98;
 Mon,  4 Oct 2021 14:47:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/7] hw/misc/bcm2835_property: Add FIXME comment for
 uninitialized memory
Date: Mon,  4 Oct 2021 14:47:35 +0100
Message-Id: <20211004134742.2044280-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004134742.2044280-1-alex.bennee@linaro.org>
References: <20211004134742.2044280-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We are returning unintialized memory, this is probably unsafe.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/misc/bcm2835_property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 73941bdae9..791c7554ec 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -61,6 +61,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             qemu_log_mask(LOG_UNIMP,
                           "bcm2835_property: 0x%08x get board model NYI\n",
                           tag);
+            /* FIXME returning uninitialized memory */
             resplen = 4;
             break;
         case 0x00010002: /* Get board revision */
@@ -75,6 +76,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             qemu_log_mask(LOG_UNIMP,
                           "bcm2835_property: 0x%08x get board serial NYI\n",
                           tag);
+            /* FIXME returning uninitialized memory */
             resplen = 8;
             break;
         case 0x00010005: /* Get ARM memory */
-- 
2.30.2


