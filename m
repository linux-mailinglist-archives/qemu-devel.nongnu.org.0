Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DABF25E935C
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 15:28:22 +0200 (CEST)
Received: from localhost ([::1]:48198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocRgD-0000vw-Gt
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 09:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ocRYX-0001nj-4T
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 09:20:25 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ocRYS-0005gC-0r
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 09:20:21 -0400
Received: by mail-pl1-x634.google.com with SMTP id jm5so4020517plb.13
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 06:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=6zUl2HU3Z5FB+WM/KgUcWz+nUT78Ab2AAKdW88gdUHQ=;
 b=jdXKxa07OJy+ZDk6KdAV1YTitNjsRp/JtV9nwD4Pvltwm5rJ+HOqTUjpNwU5nEFahK
 +9lK6X/vnY10SMfnY2fRt2qLk6Niviml2S8SJ1ZMIAAvUbWtSTwo+veuMFBjFUMmnvpE
 rIy7UPfHvkFXDnrsfJKT3uCX+BHZAlpsbMfR31/U15YadOeBQeJ+/t4v3ydU2k+rIMJP
 Wzp72mc4aNUSbp+8C4bSc3Awz6MTxj3tM3b67KiFCrcpjDAkRTZFFZOIZGWkoEWWfuDC
 a1Qi0TLafaRV/I8D7JZZAu8uGU3yXuxcz8xwFvj3Xg6/supnhSwjnBqMMpMPKjPTsVTg
 5WQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=6zUl2HU3Z5FB+WM/KgUcWz+nUT78Ab2AAKdW88gdUHQ=;
 b=oHA6gYoC/fGu/R3TRHCB8lPL3a/KzsHvUC/JaX6b2bdNJ0aYcW84W3mQJ2FWgrds9j
 YiRHi42u9XmbrRkiMflTW2TVI5YKbqTlvmJkjb44UFt/hhtzjFAgKJqCkg70m1lgrArT
 iEwIAsG+G2O+bI+sIoOQvUt89FuVSjJVZCJZjVKbkJIZoPJYdQK65GAPz6MSMTduT0XJ
 kfI8+DiUvgy/acKDIHJvfozs3ZJT+S861lv88Kf1pQ7uK7EQDNSLtPrFO3hOuxSY5vXM
 8rc7JuhMxCHvhp72WS1fKXpvCF9tnTNDXycip7B2608R7R6eu6dsWWVXA+rSCcoZzIg+
 6Lhg==
X-Gm-Message-State: ACrzQf2hPRX2oHiW1b8KsBAZIUa0Mh+ZxpzQiEj371E0FxekZU0vCICo
 67JgSuX0WgZ62pOK8mCfG9ZeeDADT6/x4eEEwbCo8Ooj970VXuP7nQU2F5DrD1BDUyjMtSp7K52
 ozt9amkdxIKFVIA6HR5WyEuJwdXpzAXuQeeWvAXo4q14nKLoulnnOEDTeh4UT+eUF6Sk=
X-Google-Smtp-Source: AMsMyM70jkZOzdj/GH+EFVcJY2pUEEBVki72jFKeVfIv8HmI1soYMjSAYK402ZF67SQhXuYh67TewQ==
X-Received: by 2002:a17:90b:4c45:b0:202:6308:d9c4 with SMTP id
 np5-20020a17090b4c4500b002026308d9c4mr19688464pjb.40.1664112017660; 
 Sun, 25 Sep 2022 06:20:17 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a63d30f000000b004393cb720afsm8913295pgg.38.2022.09.25.06.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 06:20:17 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jim Shu <jim.shu@sifive.com>, Emmanuel Blot <emmanuel.blot@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] hw/intc: sifive_plic: fix hard-coded max priority level
Date: Sun, 25 Sep 2022 13:20:04 +0000
Message-Id: <20220925132010.5336-1-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=jim.shu@sifive.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The maximum priority level is hard-coded when writing to interrupt
priority register. However, when writing to priority threshold register,
the maximum priority level is from num_priorities Property which is
configured by platform.

Also change interrupt priority register to use num_priorities Property
in maximum priority level.

Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>
Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/intc/sifive_plic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index af4ae3630e..f864efa761 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -180,8 +180,10 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
     if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
         uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
 
-        plic->source_priority[irq] = value & 7;
-        sifive_plic_update(plic);
+        if (value <= plic->num_priorities) {
+            plic->source_priority[irq] = value;
+            sifive_plic_update(plic);
+        }
     } else if (addr_between(addr, plic->pending_base,
                             plic->num_sources >> 3)) {
         qemu_log_mask(LOG_GUEST_ERROR,
-- 
2.17.1


