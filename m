Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C71265F0BD5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 14:40:46 +0200 (CEST)
Received: from localhost ([::1]:43866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeFJt-0003IA-Pp
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 08:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oeFCM-0006Ql-3X
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 08:32:58 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:37684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oeFCK-0003OT-BD
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 08:32:57 -0400
Received: by mail-pf1-x433.google.com with SMTP id a80so4127678pfa.4
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 05:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date;
 bh=6zUl2HU3Z5FB+WM/KgUcWz+nUT78Ab2AAKdW88gdUHQ=;
 b=HAHKycchr8f3wYESSTfbg/f0BOjWNauf0F6RnWgQpljzi9G6Q7QxuOFiTAaRcbbBX1
 pH5ZJxYQc6sDA8DLg3Ae0LaUm1F1+QBUJmwRfWbdncUbZdszkUEpdYM38silS5J4L217
 cw7DdNTyO3WkJ5nKxLT928J5jAFWR8Q1Sy66KOpuMN7QrdFEvl0gU4EFwDbbZf92GOgb
 mb2Exs6NzIA876n5MKAKJSewDFOZQnjZWMFKqsFrzY1MxHVdtegO79BUqR22pEJSh0Mw
 758ZfYktVFNP4aa7KTYfY/EiA3jeKh3I69kPEsk3LBVrFEqbIcQOHvlT2UoW4u01kp0H
 ofdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6zUl2HU3Z5FB+WM/KgUcWz+nUT78Ab2AAKdW88gdUHQ=;
 b=ymA3Ds1QPqU3QXLpxc4c1f8gDMmYwsTWe3xcdKBSj39BcbAGr+kMcs9xVh7pG3ZCKh
 X+kxs3CmsmeUGBS69uCzyiqAXkK6SfBiAcTBIzUCoQiwMJ3/uv8HltB1bm83rFsmak35
 7woE1IJZKilTAqPKEXiZyoMfeDddnjIVueNo3Hig7CFRW2wTCH93uzPAklNY4A9WO3ct
 TV7wVZyRpGLJNpK5GoZYJJZIb3aMq9ftHhN/7UICYfbmPdH9IiFxPOPdwe46Tx1l6eVZ
 VMIXZ8dEpiAU4tE+9HRQfUMyDSoLOzwRXLQ5rvlkyt0bs1CKSa+YYLW0J3+zijSJik4/
 gzgA==
X-Gm-Message-State: ACrzQf0a85aK3wiV398fJ6HTXPASpsBW4IqtTAEFkjL5wIDHPpiDejOU
 n5F1luPyrjE3VJ1TMK9Kf0fXyh8mSVk4Y8ntHbrYVhsdjm4VzKLwqaAtagyOucdYJeBHICiQvCB
 7gFbVub80cG+X2hRJUFIXb0kppMBlDxWltVhuDgIqCKE8x8FrDxRTZwnHzzq94VT1wCw=
X-Google-Smtp-Source: AMsMyM4/mKwclipNv+4Lw13Eseku9bmfVDXrao5T1MsmJkhgojIDfk8eoRq+iiazRU3p8ZLfhPcA6g==
X-Received: by 2002:a05:6a00:1248:b0:548:2e34:65e1 with SMTP id
 u8-20020a056a00124800b005482e3465e1mr9088095pfi.82.1664541174846; 
 Fri, 30 Sep 2022 05:32:54 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a62d154000000b00537aa0fbb57sm1649880pfl.51.2022.09.30.05.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 05:32:54 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 chigot@adacore.com, Jim Shu <jim.shu@sifive.com>,
 Emmanuel Blot <emmanuel.blot@sifive.com>
Subject: [PATCH v2 1/2] hw/intc: sifive_plic: fix hard-coded max priority level
Date: Fri, 30 Sep 2022 12:32:38 +0000
Message-Id: <20220930123239.15515-2-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220930123239.15515-1-jim.shu@sifive.com>
References: <20220930123239.15515-1-jim.shu@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x433.google.com
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


