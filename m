Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A3E3FD7F6
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:46:59 +0200 (CEST)
Received: from localhost ([::1]:39816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNli-00069P-R8
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcO-00078n-Ux
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:20 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcL-0005sN-FD
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:20 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso4372877wmc.5
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qx8wsOMhtL2NtE+ycWwK1nQUW28qH1evLQrUvakhzE0=;
 b=mObLd0wL3pG6jt4vXlwYBCTsV2ygYUvQFsL4+13vixOCjsOGhmhxO37M3xfl01pGug
 43xuEHDGUvTLYB/8W3TqAsApXtevQa0ET62mH0QYtPZb4NO/9JMvpkhhmjMy6UFYsT4A
 +fXxmKNhVNTzx4SomUSWpg4hLL5H1mlb4JKWNnpobng9w5gvadPQ9Qk0bnht/epoq6qM
 3MknmutnUEb7dwvh0CU2aoMY7IQ3aUW2LlOd0roc4GYttynWGTPCthBfJjJpMkCS/UJ+
 lhiLZjQJ7Aqxz3bt7QGG9EgwkVDVvFjjiBk0zSnWA32ocxo61/ZiyU5up34SQg1lBhsw
 ZtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qx8wsOMhtL2NtE+ycWwK1nQUW28qH1evLQrUvakhzE0=;
 b=Com3ClDYuJhjFqYf5GpxT6VtXk4bnMeb5cRxdiVcLIIJM93oP+TD0p45J2smluhzNy
 uQkuuFUPU5FPLvBS51EkNZZO0MiCU5ii9NxNpPxxduLjieGtfYK0BvAJF5OsBxE1mSPt
 cg/yYJJ0y6Uueci2RcH6CBUTetJD6JkHDeA5Q/ZwbVAtZUriSDvUxDSlS/mlEcAX0dXn
 MHsLhvrHmT8kQE5rwkkAfVuxNDvi1WwmHO1Dv4ZnGUD/Um462159TlBE6VUir1PpUtb+
 LiRW4VlHPbLQ2LrCOJ2TpmooHIVSDXOSLQo6tmwoGGv3BLNeu675rIFZVFsf637khzPa
 W6kg==
X-Gm-Message-State: AOAM533Zye0uLhHV9RPrV11fIagdny2u0Lu5AIkrR9GDzx7uoG/awIhv
 +pUQFqFs4nRhz6H7gODbfX+efi2NQY/Hmw==
X-Google-Smtp-Source: ABdhPJyI6lfN2uG2lDm3OVpqtXU8lKQ6ed06CB7MYK0JDTKh2X6kIJiiXvCNQ6BsGhIR0mKGCG8Keg==
X-Received: by 2002:a1c:f30b:: with SMTP id q11mr8915602wmq.91.1630492636148; 
 Wed, 01 Sep 2021 03:37:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/51] hw/timer/armv7m_systick: Add usual QEMU interface comment
Date: Wed,  1 Sep 2021 11:36:32 +0100
Message-Id: <20210901103653.13435-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Add the usual-style QEMU interface comment documenting what
properties, etc, this device exposes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210812093356.1946-5-peter.maydell@linaro.org
---
 include/hw/timer/armv7m_systick.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/hw/timer/armv7m_systick.h b/include/hw/timer/armv7m_systick.h
index 84496faaf96..685fc5bc0d7 100644
--- a/include/hw/timer/armv7m_systick.h
+++ b/include/hw/timer/armv7m_systick.h
@@ -20,6 +20,13 @@
 
 OBJECT_DECLARE_SIMPLE_TYPE(SysTickState, SYSTICK)
 
+/*
+ * QEMU interface:
+ *  + sysbus MMIO region 0 is the register interface (covering
+ *    the registers which are mapped at address 0xE000E010)
+ *  + sysbus IRQ 0 is the interrupt line to the NVIC
+ */
+
 struct SysTickState {
     /*< private >*/
     SysBusDevice parent_obj;
-- 
2.20.1


