Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 626ED3C276D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:20:55 +0200 (CEST)
Received: from localhost ([::1]:54464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tFG-00055U-Ek
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t58-0001dt-GG
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:26 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t50-0000yq-L1
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:26 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 y21-20020a7bc1950000b02902161fccabf1so6211831wmi.2
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Mv7J+7tjraCJlq85GUy80KHgiJAGBqDRnv9zd0CWMwk=;
 b=zYpYSv16odZT0psg1mjURzbnkoKy+nl7zlfS0M1X8OPh2hNQ688aM7Aa+EhqAdfmNG
 WZg6kSWSGFqZJfZPhJsHCxMDyGP5BZlkfR7OtZ+8KMHzGf/ShqKQy1UA9/N6+EbqDovq
 v2PC6pE3qOqOwisBDBIXrTuknXYeNxvLqmiataP4u6ph1y4Qp3T0Q1tP/XFpw53B84FK
 UUQXCH1U4l6dSrIM2IkrfXcKRRJc3n4wFD2dAtr28+QL+KsOv9zhmt4+b8yBt4YeP/Zj
 PU+EcMsYsYxccLeW8rFxyev8+4fzcRu5zDGaG9aiYo2xSaZa3Eg8E83kxT2uczkZnMy4
 mauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mv7J+7tjraCJlq85GUy80KHgiJAGBqDRnv9zd0CWMwk=;
 b=H8NDPjm1x+1qjyEHRA5hKNZkfEsKonbGWMbZmhPUxl7Zycu4BUaoenrIj+3D5mxjqC
 X4p7NZMNwKEwuLtVtNnUdtgR/MbFnBwpaF1I6e1iObZZ6CXf6a155E2c+Z00IKeXXowC
 WrL6hhk5IrQ9WpfUimU5b75zZz09rLp9CcPk2BgUdmqoToF4wJVZeoKjubgtl+JezFUq
 gPPDI0EMvhOl/LstZ0dn3R8ey47Itgds/8PMH0I6NlQIA+T6lDJl01c+kxTO254dGV0x
 SC/KBGwz9J+j0k77//xDMejXgCmcRw62Mll4P2J33tyXizDW4p2l9l3LTYhXkk4EzF9I
 DzLA==
X-Gm-Message-State: AOAM533C1ZakY11272zySvTVY2N1L3blsb+gqFqnV3WsO4mlkT9+RnmV
 6Sls7GL93ZL0re/DNKmNeEflEbcxEmQy41Yr
X-Google-Smtp-Source: ABdhPJxkNKK1Gbgfw09N8Xq5jb0glH5M76AUCyltkngrbdPbG+w7T9o6MK6sVj76Pjwy5y8tWViBkQ==
X-Received: by 2002:a05:600c:224a:: with SMTP id
 a10mr12973050wmm.7.1625847017044; 
 Fri, 09 Jul 2021 09:10:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x19sm5232277wmi.10.2021.07.09.09.10.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 09:10:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/17] hw/intc: Improve formatting of MEMTX_ERROR guest error
 message
Date: Fri,  9 Jul 2021 17:10:03 +0100
Message-Id: <20210709161003.25874-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709161003.25874-1-peter.maydell@linaro.org>
References: <20210709161003.25874-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rebecca Cran <rebecca@nuviainc.com>

Add a space in the message printed when gicr_read*/gicr_write* returns
MEMTX_ERROR in arm_gicv3_redist.c.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210706211432.31902-1-rebecca@nuviainc.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_redist.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 8645220d618..53da703ed84 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -453,7 +453,7 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
     if (r == MEMTX_ERROR) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest read at offset " TARGET_FMT_plx
-                      "size %u\n", __func__, offset, size);
+                      " size %u\n", __func__, offset, size);
         trace_gicv3_redist_badread(gicv3_redist_affid(cs), offset,
                                    size, attrs.secure);
         /* The spec requires that reserved registers are RAZ/WI;
@@ -510,7 +510,7 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
     if (r == MEMTX_ERROR) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write at offset " TARGET_FMT_plx
-                      "size %u\n", __func__, offset, size);
+                      " size %u\n", __func__, offset, size);
         trace_gicv3_redist_badwrite(gicv3_redist_affid(cs), offset, data,
                                     size, attrs.secure);
         /* The spec requires that reserved registers are RAZ/WI;
-- 
2.20.1


