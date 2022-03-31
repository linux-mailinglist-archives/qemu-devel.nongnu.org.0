Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5D54ED27B
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 06:35:19 +0200 (CEST)
Received: from localhost ([::1]:59988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZmWk-0002as-1K
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 00:35:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3-i5FYgcKCoUtxvuxmrpxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--komlodi.bounces.google.com>)
 id 1nZmUY-0000fw-7R
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 00:33:02 -0400
Received: from [2607:f8b0:4864:20::1049] (port=35548
 helo=mail-pj1-x1049.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3-i5FYgcKCoUtxvuxmrpxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--komlodi.bounces.google.com>)
 id 1nZmUW-0001OA-KX
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 00:33:01 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 mw8-20020a17090b4d0800b001c717bb058eso1183377pjb.0
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 21:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9Kb0j529OtA4PzmjIiL8cVpqcb33BADcTAWZrsvn63M=;
 b=BDq9s32LgYym4scN4KIEdTA871pQkJuqOhbtiQOmXbTS6Rabzn6uqNnbvEsP51Qs1A
 6z3e4SKkysVCIO2iGdcUZ+9a6u6lOnQ+/bTCeUhbQCO8YzPN8s1BJZmjxTZfEWVnGEHg
 DUXOfQKxeSbIOfOHBL1XtwwpIQTrHPRJMuAXF8ISBiBSc470p64lqeAB2geUlVcdzwqF
 hVXKZcl1Xo8u62YCIt0HVtT9aOg+2qDorL0dFoUL+AzEttTfmMwf7pnSDfEFprf+rtBp
 ExHG6kWGkcrex4cnkjfTsyakKXi5cdscsVowhnrOpH79rC3/Ov+PEdGzMfFgPnyr0SL7
 jlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9Kb0j529OtA4PzmjIiL8cVpqcb33BADcTAWZrsvn63M=;
 b=RZ+RZ4reGXuXz4Wu6ksLLWeC6PcU8I0LQxVTcDJhmcvkearcJFD/eTLAJaXcBAmfwk
 fXj+2we/yziQgy3r8tJqOo34HYDZ7OQIC3MhcVXQfn+XZCRJJIObOpSlubVOaHvH+Gt+
 7NKWFmyGonznFm2LHBOWTP9ANjpNlXOFTFvzBnjeSTb0KQy/e3uDYTgZhzubtCfenQKd
 R8NZFAjc/rur2tEUIGrOu1908QsoZWFiDTJFeyCMKvl500fYkSvTJ++p5TpsEMm2lEo1
 UrIND5QbOZuEY59sAz+5zVpcT66XBIRNcw2FwhvmodYhrddhBZ5wcHIiYmzZ0fay1k5A
 ER8Q==
X-Gm-Message-State: AOAM532BoexPEnrNGQXmgEmAS/Tk7v/r7WN+g+G7jgp+0fQSXMhkroPT
 xAjBQTGw2QHe/RItSTnK7BbnIfnhXhTafBZJhzba08RgmYCcdSxHBzpqjdKgkijPkm0gnnUFugE
 ubW12/W1VDuSQ9pOtWU8HrSqw7tQcgfAQMyKHULAqsxbakUeUuaZ/Az9lA+8QvzI=
X-Google-Smtp-Source: ABdhPJz/433av13QdO5Q6WMd+CMdgO3WyAOiq/1cMTdUIMipP8V53RhlKB3QZ8U7BAoeX2pNRBTDv6Q7wS75
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a17:90b:e81:b0:1c6:5a9c:5afa with SMTP id
 fv1-20020a17090b0e8100b001c65a9c5afamr360539pjb.1.1648701178435; Wed, 30 Mar
 2022 21:32:58 -0700 (PDT)
Date: Thu, 31 Mar 2022 04:32:47 +0000
In-Reply-To: <20220331043248.2237838-1-komlodi@google.com>
Message-Id: <20220331043248.2237838-7-komlodi@google.com>
Mime-Version: 1.0
References: <20220331043248.2237838-1-komlodi@google.com>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
Subject: [RFC PATCH 6/7] aspeed: i2c: Add PKT_DONE IRQ to trace
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au, 
 venture@google.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1049
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3-i5FYgcKCoUtxvuxmrpxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--komlodi.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

Signed-off-by: Joe Komlodi <komlodi@google.com>
Change-Id: I566eb09f4b9016e24570572f367627f6594039f5
---
 hw/i2c/aspeed_i2c.c | 3 +++
 hw/i2c/trace-events | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 948d8dc2bb..f179f78ee9 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -305,6 +305,9 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
     bool raise_irq;
 
     trace_aspeed_i2c_bus_raise_interrupt(bus->regs[reg_intr_sts],
+        aspeed_i2c_bus_pkt_mode_en(bus) &&
+        ARRAY_FIELD_EX32(bus->regs, I2CM_INTR_STS, PKT_CMD_DONE) ?
+                                                               "pktdone|" : "",
         SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_NAK) ? "nak|" : "",
         SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_ACK) ? "ack|" : "",
         SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, RX_DONE) ? "done|"
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index 7d8907c1ee..85e4bddff9 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -9,7 +9,7 @@ i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
 # aspeed_i2c.c
 
 aspeed_i2c_bus_cmd(uint32_t cmd, const char *cmd_flags, uint32_t count, uint32_t intr_status) "handling cmd=0x%x %s count=%d intr=0x%x"
-aspeed_i2c_bus_raise_interrupt(uint32_t intr_status, const char *str1, const char *str2, const char *str3, const char *str4, const char *str5) "handled intr=0x%x %s%s%s%s%s"
+aspeed_i2c_bus_raise_interrupt(uint32_t intr_status, const char *str1, const char *str2, const char *str3, const char *str4, const char *str5, const char *str6) "handled intr=0x%x %s%s%s%s%s%s"
 aspeed_i2c_bus_read(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
 aspeed_i2c_bus_write(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
 aspeed_i2c_bus_send(const char *mode, int i, int count, uint8_t byte) "%s send %d/%d 0x%02x"
-- 
2.35.1.1021.g381101b075-goog


