Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A8958D02D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 00:36:29 +0200 (CEST)
Received: from localhost ([::1]:37212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLBMK-00049o-5h
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 18:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLBK1-0000Hq-B9
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 18:34:05 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:35596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLBJz-0001Cn-Gr
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 18:34:05 -0400
Received: by mail-pf1-x432.google.com with SMTP id p125so5745620pfp.2
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 15:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc;
 bh=+SFuivbmRDhPEXUxhRtAAtVm8SoaHrZvF1NuHWlQhSs=;
 b=aWkfAvV+hQoQMgprHWBFjgSqgydKgAuc8+SMw8h77RV+7Lt9C4J35V75X5Wvn7bY12
 lR+5Hk1uoChdm5J1OTiqCOyezupPrzRdqGQhomFhRjBvotJ9a9EIzhpl4ZnkE3HnTuRP
 q9JkKCHMQcI4YrAH7x6901U6+MB09/Gl0CreZVAxcNkgj6/CpGQySYXhkl6wDfoNz4rf
 7FbuW6PWBGIaBmDzMv8UuMmjm/kt4OQ5A/SBb36WxZoROJW+ezFAMjx46IDIzKDfUakz
 4bVXLNvTTg5v42su8wG+B3kHu75EiPh1A4Ha0zrNg4gKnDn0D2uiMvaJMZCk5Bz6lDJd
 4VNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc;
 bh=+SFuivbmRDhPEXUxhRtAAtVm8SoaHrZvF1NuHWlQhSs=;
 b=IkCb022A3ukhqVkMaSDOQFUvd8MSyhi2NvAvKk4kS1i/IvdYrjRscsIpWJNpDO5KoU
 FyG69GY0dC+O8hSJL5fzO0TXKVvVeX/2o/kh2zxEMXPv1PqTusXisVgSt7PDXGzda95G
 zQSFKC/lIlusd1dglYPX4wsJ7JyvZEYIgp95+gDEv6Z0Z0CwsHbPKXEyXx/B9J8jJwzc
 D8WkQH7ZqLnUKiBQ8E+Oo9q6swB4GS+7CD+c6PILuipx+Bk4ydIxMKSb18LLG9mS16af
 c5Yk9zenPM57t4eKFV3jNxP01e0tM1mEUxS7AxxM8NXjbiuTrhELeGB+n4q+BQyaHSw6
 raOg==
X-Gm-Message-State: ACgBeo3USAJ3bloj7TTEiitQNTqJyfkgFKIHPqbi60UEUToZP6GE39Nn
 7a9QSZ23SOT9YiHZvlzhZjBZlDe2VEtPsw==
X-Google-Smtp-Source: AA6agR63CrEXeD7flVXdwvUfwNHPQ7EmkfJkffAg0Y0h33pAFtY0qyndfpg/edr3EOcgABiYgqFraA==
X-Received: by 2002:a65:6b8a:0:b0:3fc:4c06:8a8d with SMTP id
 d10-20020a656b8a000000b003fc4c068a8dmr16964182pgw.83.1659998040924; 
 Mon, 08 Aug 2022 15:34:00 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a170902da8d00b001709aea1516sm4385336plx.276.2022.08.08.15.33.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 08 Aug 2022 15:34:00 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>, Frederic Konrad <fkonrad@amd.com>
Subject: [PULL 3/3] hw/misc/grlib_ahb_apb_pnp: Support 8 and 16 bit accesses
Date: Tue,  9 Aug 2022 00:33:12 +0200
Message-Id: <20220808223312.53720-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220808223312.53720-1-f4bug@amsat.org>
References: <20220808223312.53720-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

In real hardware, the APB and AHB PNP data tables can be accessed
with byte and halfword reads as well as word reads.  Our
implementation currently only handles word reads.  Add support for
the 8 and 16 bit accesses.  Note that we only need to handle aligned
accesses -- unaligned accesses should continue to trap, as happens on
hardware.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1132
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Frederic Konrad <fkonrad@amd.com>
Message-Id: <20220802131925.3380923-1-peter.maydell@linaro.org>
Tested-by: Tomasz Martyniak <gitlab.com/tom4r>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/grlib_ahb_apb_pnp.c | 10 ++++++----
 hw/misc/trace-events        |  4 ++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/misc/grlib_ahb_apb_pnp.c b/hw/misc/grlib_ahb_apb_pnp.c
index 43e001c3c7..5b05f15859 100644
--- a/hw/misc/grlib_ahb_apb_pnp.c
+++ b/hw/misc/grlib_ahb_apb_pnp.c
@@ -136,7 +136,8 @@ static uint64_t grlib_ahb_pnp_read(void *opaque, hwaddr offset, unsigned size)
     uint32_t val;
 
     val = ahb_pnp->regs[offset >> 2];
-    trace_grlib_ahb_pnp_read(offset, val);
+    val = extract32(val, (4 - (offset & 3) - size) * 8, size * 8);
+    trace_grlib_ahb_pnp_read(offset, size, val);
 
     return val;
 }
@@ -152,7 +153,7 @@ static const MemoryRegionOps grlib_ahb_pnp_ops = {
     .write      = grlib_ahb_pnp_write,
     .endianness = DEVICE_BIG_ENDIAN,
     .impl = {
-        .min_access_size = 4,
+        .min_access_size = 1,
         .max_access_size = 4,
     },
 };
@@ -247,7 +248,8 @@ static uint64_t grlib_apb_pnp_read(void *opaque, hwaddr offset, unsigned size)
     uint32_t val;
 
     val = apb_pnp->regs[offset >> 2];
-    trace_grlib_apb_pnp_read(offset, val);
+    val = extract32(val, (4 - (offset & 3) - size) * 8, size * 8);
+    trace_grlib_apb_pnp_read(offset, size, val);
 
     return val;
 }
@@ -263,7 +265,7 @@ static const MemoryRegionOps grlib_apb_pnp_ops = {
     .write      = grlib_apb_pnp_write,
     .endianness = DEVICE_BIG_ENDIAN,
     .impl = {
-        .min_access_size = 4,
+        .min_access_size = 1,
         .max_access_size = 4,
     },
 };
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 4d51a80de1..c18bc0605e 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -247,8 +247,8 @@ via1_adb_poll(uint8_t data, const char *vadbint, int status, int index, int size
 via1_auxmode(int mode) "setting auxmode to %d"
 
 # grlib_ahb_apb_pnp.c
-grlib_ahb_pnp_read(uint64_t addr, uint32_t value) "AHB PnP read addr:0x%03"PRIx64" data:0x%08x"
-grlib_apb_pnp_read(uint64_t addr, uint32_t value) "APB PnP read addr:0x%03"PRIx64" data:0x%08x"
+grlib_ahb_pnp_read(uint64_t addr, unsigned size, uint32_t value) "AHB PnP read addr:0x%03"PRIx64" size:%u data:0x%08x"
+grlib_apb_pnp_read(uint64_t addr, unsigned size, uint32_t value) "APB PnP read addr:0x%03"PRIx64" size:%u data:0x%08x"
 
 # led.c
 led_set_intensity(const char *color, const char *desc, uint8_t intensity_percent) "LED desc:'%s' color:%s intensity: %u%%"
-- 
2.36.1


