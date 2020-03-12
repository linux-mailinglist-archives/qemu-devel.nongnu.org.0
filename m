Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0A318367D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 17:46:42 +0100 (CET)
Received: from localhost ([::1]:45348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCQyn-0001UK-Sk
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 12:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35523)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCQxG-00084T-Fh
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 12:45:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCQxF-0004zL-75
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 12:45:06 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43747)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCQxF-0004z1-1D
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 12:45:05 -0400
Received: by mail-wr1-x434.google.com with SMTP id b2so2137427wrj.10
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 09:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2ZMyDKOs221YK54nfIMgl82UUxNxqh4DM/94KMAkg9o=;
 b=CF7jfNpfOU7qbI7yJqZ6pdFAAm+rFsSqSdPNkF3DTNia1p16dJHn/WBbAOImg2ixBU
 It2AO0ge5mhcburjxY+id3rTKUEfPtyaxt/ky0VW6HmPkHJ/239e73XzVhUMT7z0wOaW
 le9fTX4UIF8A+Ufmfu8SVPPUNAOmn+Gb7c2PrsS6pexsBgvgqcPT9OZzFc1U+MCV08Yk
 IrUBGJZsL5mYH8dxNBdHYT8i2jsEiLQ+Frt+JixjDbJeW4YPwcUOA5qCv8s7BKOYYBE0
 fXKHQJy7/O6G3V3XnskTrwwBnVpuhvxW81tmFAnuawezigR4fM7WPlpH7oJr52jZCp5o
 QG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ZMyDKOs221YK54nfIMgl82UUxNxqh4DM/94KMAkg9o=;
 b=Q30KZL8azOLj2wAVhm/lpMXXJIN87+h0qh+T4VMQ0sLIzLiMj/07980fbBzPZEh0iU
 aLFpUOQKVxbU+Z5meFVD2x17E+Z41UzQHkxKc5E5iY2bNoVLa7lSLg6wE2cWm4ZhRzwH
 7Tm5Sh3ffZblTHVOgPI2eGFlndKjrgnr2kbJgZnLpLzzg8VatVEMYoFu7e1w+d9hZTGY
 Ncs1zyCEFWMUv8MOSf1zoBr5rvB8Xjs/ZxgX+qbadXUdZYe5qBM/4jHWA/S/1T008z/s
 DkbXkio8Gc2/Xwwc0dm0W/PEn8eZf3l5Q3zEI/ZrihSgIUToK5WrQ6HzG68mQHzRJHYI
 oHgQ==
X-Gm-Message-State: ANhLgQ21cCnkpd8C0D148DktgAsjLwgHC56x/bsz0nJWoy4I7nm5c8Ug
 oW1REmSs4Muu9Wbnc8VBuFfdIAZBQTTMrQ==
X-Google-Smtp-Source: ADFU+vsMWJp5DePOdrLm6pWoaOoew70K1yBtbWQ/WoWvCD0Dip914jyCHePwUtRMuaeDBTHF2CQWSA==
X-Received: by 2002:a05:6000:120e:: with SMTP id
 e14mr12236218wrx.182.1584031503777; 
 Thu, 12 Mar 2020 09:45:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm36838640wrp.85.2020.03.12.09.45.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 09:45:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/36] hw/intc/armv7m_nvic: Rebuild hflags on reset
Date: Thu, 12 Mar 2020 16:44:24 +0000
Message-Id: <20200312164459.25924-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312164459.25924-1-peter.maydell@linaro.org>
References: <20200312164459.25924-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::434
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

Some of an M-profile CPU's cached hflags state depends on state that's
in our NVIC object. We already do an hflags rebuild when the NVIC
registers are written, but we also need to do this on NVIC reset,
because there's no guarantee that this will happen before the
CPU reset.

This fixes an assertion due to mismatched hflags which happens if
the CPU is reset from inside a HardFault handler.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200303174950.3298-2-peter.maydell@linaro.org
---
 hw/intc/armv7m_nvic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index a62587eb3f0..1ad35e55292 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2593,6 +2593,12 @@ static void armv7m_nvic_reset(DeviceState *dev)
             s->itns[i] = true;
         }
     }
+
+    /*
+     * We updated state that affects the CPU's MMUidx and thus its hflags;
+     * and we can't guarantee that we run before the CPU reset function.
+     */
+    arm_rebuild_hflags(&s->cpu->env);
 }
 
 static void nvic_systick_trigger(void *opaque, int n, int level)
-- 
2.20.1


