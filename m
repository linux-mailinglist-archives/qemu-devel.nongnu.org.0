Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAD63DB788
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 13:03:23 +0200 (CEST)
Received: from localhost ([::1]:34956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9QIU-0003A1-SI
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 07:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9QFA-0008UW-KO
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:59:56 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:41504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9QF9-0002Wn-7Z
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:59:56 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 n28-20020a05600c3b9cb02902552e60df56so6097470wms.0
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 03:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XsapCyUHRinZlDpvG4U0uaAG0gEMTFq+6AdmrnSbtBs=;
 b=Vnq4gE+H2pFgwQ/7o1fTKc0Rcz+6hQwJ9e2obba1FC6jmPb/QErZg4+gZ6RR/6lyCq
 eGaaWLw+lXhK55qIzhUaDQIY0Vy0KCenDyFhuBvPdbel0gZxk8WgVIVXC77oVusGgT+g
 KQvre1Shs4fDhk300aKQp39PWnusx9Uw65wzUPU/nu3xPyfb2osKODXZkV5gQU7KWPfJ
 OJKBICeLE/w5aNr8KSX5zeBcyn1YoTH7/SrqEAi/EdA0UplfZADQKijo1+jY5Fvr4cER
 qvRAlUQs/vNfIK77Sd0bJ6eVXnwwHUuNaQPrVzIzozQ3qGIW0p3sdeyJz+1OKs2WOiPY
 z/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XsapCyUHRinZlDpvG4U0uaAG0gEMTFq+6AdmrnSbtBs=;
 b=JcvqfI2SLbmCG0KpmKOMEWu2DDWpmsgg/i5QFnZNq1jVli6oUUYKNFA/M6dvSxGR8E
 exjpupt1b4eUvEqIq7pG3kq+DSIR7yPZ1GOD18noAhZCo6M8fF3a3N/Xv96qtG0QlJm1
 8lFS5lyHoYL/j/Ru/JAK19xgvU2NG28wXqbTzPsc4HS2MvvXz8KeiMBIMPLO/z1tVSxW
 6PuH482I9UF8lZ8/BmnJLOhi+crLot83a1rRlUsVB/1DyAvqHWsxloUbcVlwOHE16Jj8
 CNoYgd+oIEUrLWRPvnumDyeNMJ9QWtyC9/xWTqCD+QQf3zrEE3n61/TYuD4mzKzbCPSM
 LkTg==
X-Gm-Message-State: AOAM533G0u6I6EX933q3+as3onHBGiuyuLG5sydhF6Jg1g5grygKCrjU
 ERBHmlsCoSZWbZOI7FpVy3ONK5HHSlQetQ==
X-Google-Smtp-Source: ABdhPJyaQLTl93fCOnY3Wii2pN+KWvc90U4rF1tnKpuS0EXMXS+g/MW4KTw3LGtKm9aj9uXssW0BZg==
X-Received: by 2002:a7b:cb98:: with SMTP id m24mr2280819wmi.24.1627642793952; 
 Fri, 30 Jul 2021 03:59:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p2sm1349697wrr.21.2021.07.30.03.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 03:59:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 5/8] arch_init.h: Add QEMU_ARCH_HEXAGON
Date: Fri, 30 Jul 2021 11:59:44 +0100
Message-Id: <20210730105947.28215-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210730105947.28215-1-peter.maydell@linaro.org>
References: <20210730105947.28215-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When Hexagon was added we forgot to add it to the QEMU_ARCH_*
enumeration.  This doesn't cause a visible effect because at the
moment Hexagon is linux-user only and the QEMU_ARCH_* constants are
only used in softmmu, but we might as well add it in, since it's the
only architecture currently missing from the list.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/sysemu/arch_init.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 57caad1c675..60270c5ad15 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -23,6 +23,7 @@ enum {
     QEMU_ARCH_RISCV = (1 << 19),
     QEMU_ARCH_RX = (1 << 20),
     QEMU_ARCH_AVR = (1 << 21),
+    QEMU_ARCH_HEXAGON = (1 << 22),
 
     QEMU_ARCH_NONE = (1 << 31),
 };
-- 
2.20.1


