Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C986D149C
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 03:04:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi39K-0003Dd-3J; Thu, 30 Mar 2023 21:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3-DAmZAcKChsBFDCF497FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--komlodi.bounces.google.com>)
 id 1pi39I-0003D6-Bc
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:48 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3-DAmZAcKChsBFDCF497FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--komlodi.bounces.google.com>)
 id 1pi39G-0006b5-Rs
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:48 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 i26-20020aa796fa000000b006261da7aeceso9538682pfq.5
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 18:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680224505;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=NSxgqMkN76sf5i6jVWeEWEGMcfgMjXp+O1ZiyMeH4SQ=;
 b=o8L7wtD1IgMev5WTcAGcXqWUNOeQsdepMRIgclkB+2GfZ/1PEx4bdil/2vf3PWhjFo
 L+9sLnGOf9H2eAkTkyV48Mme1jQfY+udWbgbYcnFNwx0UTtYuZK6Ymu+1DxJokH76Fii
 ckj2hH01r8CZCV9iloqQoNPXIk1CebwXvjP44NmuluKrP9jIBa17g9gbLTqWGc3trOmN
 czsZbjSBJonD4KQJgDg62fS9DIQqSCyg9rYiF/HDLaBzBaDUNBhJq7mBxMq3rTAnlUVe
 gxvR2+BJidnl92wGYjNk7dFJhnWp08huHjZS/A2zsDFieLaMgrOe5wi4FcZe1q3C32i/
 681Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680224505;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NSxgqMkN76sf5i6jVWeEWEGMcfgMjXp+O1ZiyMeH4SQ=;
 b=kdeeq0iMTmXS8qQg3u197bOB5iLLHkyyFsSoQo6AQtbnNcqsYrT2nOfoYLdY4CkctF
 tq/0SRfFOSMmMD8nyPxCd6jBhsKHXGJyfU+sNZcV57sA59hxWqe58ypAisBSlo83mLYE
 QlstFySzRShEl2jRkTM+NZciWpBtNYD6Ix8TUT3CeLvycifRXLe0Od76ZqYTehEMajjH
 XMzuve87M8sMwfNL0KAtv4RcrULBRkl/K8tra0flxRXmKqyv1/i1/3HyXxS+H/9lHuFk
 xGGN1KPrBoBpDBdPnk60whx47cEkDjmc8bQcnuo6vnaUF383DQb1Amv7RRDHSNg+DzF+
 +iQQ==
X-Gm-Message-State: AAQBX9dGssUXmnd0UyM9mOCue4dvU6GeYxuZzLXZz93Z+xdbSDuWByom
 57GZKuPH+WausP686EpnzMfcSKyn+LbQs0Hw5UKAddT71sirYoYLBBJA6ucO8YG419Y7JEaK1SS
 xKga0XBQr9Huncu9Wy9TB+rC3kT4z56fGmTc/iZ0DmJ8A7F47K3r4JgNuWixf8Xg=
X-Google-Smtp-Source: AKy350aIts+j/jJCbFyHyfH6vY8hLBQVpfrntaX0K7I1uEIrshSNmqkP1G286kVjpClJZTpHtPFsurrwBJSj
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a17:90a:2dce:b0:23d:33e5:33ec with SMTP id
 q14-20020a17090a2dce00b0023d33e533ecmr7951388pjm.1.1680224504784; Thu, 30 Mar
 2023 18:01:44 -0700 (PDT)
Date: Fri, 31 Mar 2023 01:01:22 +0000
In-Reply-To: <20230331010131.1412571-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230331010131.1412571-1-komlodi@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230331010131.1412571-8-komlodi@google.com>
Subject: [PATCH 07/16] hw/i3c/aspeed_i3c: Use 32 bits on MMIO writes
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3-DAmZAcKChsBFDCF497FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--komlodi.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The registers are only 32 bits wide, so we should cast the 64-bit value
passed in to only be 32 bits wide.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
---
 hw/i3c/aspeed_i3c.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/i3c/aspeed_i3c.c b/hw/i3c/aspeed_i3c.c
index 79715f462d..2ed09234ff 100644
--- a/hw/i3c/aspeed_i3c.c
+++ b/hw/i3c/aspeed_i3c.c
@@ -441,10 +441,11 @@ static void aspeed_i3c_device_write(void *opaque, hwaddr offset,
 {
     AspeedI3CDevice *s = ASPEED_I3C_DEVICE(opaque);
     uint32_t addr = offset >> 2;
+    uint32_t val32 = (uint32_t)value;
 
     trace_aspeed_i3c_device_write(s->id, offset, value);
 
-    value &= ~ast2600_i3c_device_ro[addr];
+    val32 &= ~ast2600_i3c_device_ro[addr];
     switch (addr) {
     case R_HW_CAPABILITY:
     case R_RESPONSE_QUEUE_PORT:
@@ -470,7 +471,7 @@ static void aspeed_i3c_device_write(void *opaque, hwaddr offset,
     case R_RESET_CTRL:
         break;
     default:
-        s->regs[addr] = value;
+        s->regs[addr] = val32;
         break;
     }
 }
-- 
2.40.0.348.gf938b09366-goog


