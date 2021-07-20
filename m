Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BCF3CFE63
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:57:48 +0200 (CEST)
Received: from localhost ([::1]:34100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5s7v-0005Xu-Fo
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rtg-00015Y-WB
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:43:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rtf-0005Wy-F7
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:43:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626795782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rqXYU/PxcgPvoefVIbDKIx4Oq81EFF0UhzX0mVLsvu0=;
 b=B44hRaYG6cBclDdkR4l2ANWR1kADLkPiNxEbL9Fl6rbz06RWo2Xo7xir+WvL6P0i1/OBL7
 9TB3IYdZiPKls0yzd4TIVqBm2elqVFKtgtvwtONtaIUpJA0lIxoItO5lgBW+9PMG1lSl3N
 gXQkxxArSXFoa0J5ltP2WGHIz45qrEc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-qtJ1JtQaOw6tO_lA-rZNfQ-1; Tue, 20 Jul 2021 11:42:40 -0400
X-MC-Unique: qtJ1JtQaOw6tO_lA-rZNfQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 g13-20020a05600c4ecdb0290242a8f4cf9cso1385441wmq.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rqXYU/PxcgPvoefVIbDKIx4Oq81EFF0UhzX0mVLsvu0=;
 b=mIMfjLJuL3Lx4te3WALeovxT5s2onP0bXlaBJkO9UQ/u7A0VkyDCZllawfY6e1TgMj
 03DmM+1aWIzNfBCl4kneyw4lolmm9ds/02NqcjwhpwaumCjeoNXTUB7SToaRs7CUwJTv
 Zi1wtoez1MAKtSux2C1U5/xcDN/EAfLTbUbE07PBF0HYUuOYnma0W8B+I6XG1KXwIDmU
 Q7tSuupYInRwQmPGI19J4yzlf9UOuCCwD30SPJYj3zhXc9Yd2mELVkFEU3yW7749ZVMy
 B4I9nC8YNR9RLs7IWMWCX0+RfLmi1I9HWl9Qd9qE8fKTI0va1nuKLbSpqzHpgMYCqrAI
 L7LQ==
X-Gm-Message-State: AOAM533hRkmaXyFDKpq6e33RGinPvONcllI+OOKjWHj4bRBk5AUgJ0v8
 8eUHUsde17cmqsB2l01Qa8yWaXJMEyIya7tH2TPv9PwQ+AB/eGN5lf5SuRiRrR3RuiWV0EpuIjm
 Ctr3JX7EW5Xjh5YchqVmNDaLkx0JV5CX8YzGJpN7EvsAJSoz+PX1xw0fuCm5mUNZa
X-Received: by 2002:a7b:c013:: with SMTP id c19mr37621498wmb.158.1626795746545; 
 Tue, 20 Jul 2021 08:42:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxx4iylR7B4RFdXbmNcxwsmOYdvDAmZeJlTVlqOoF7Gt8h7JNXj4eMb1w4uNPQqGyhSKr5Q9Q==
X-Received: by 2002:a7b:c013:: with SMTP id c19mr37621478wmb.158.1626795746328; 
 Tue, 20 Jul 2021 08:42:26 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 n5sm2737607wmd.4.2021.07.20.08.42.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:42:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/17] hw/riscv/Kconfig: Add missing dependency MICROCHIP_PFSOC
 -> SERIAL
Date: Tue, 20 Jul 2021 17:41:34 +0200
Message-Id: <20210720154141.3919817-11-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720154141.3919817-1-philmd@redhat.com>
References: <20210720154141.3919817-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit a8fb0a500a6 ("hw/char: Add Microchip PolarFire SoC MMUART
emulation") added a dependency on the SERIAL model, but forgot to
add the Kconfig selector.
Add the dependency to the MCHP_PFSOC_MMUART symbol to fix when
building the MICROCHIP_PFSOC machine stand-alone:

  /usr/bin/ld: libcommon.fa.p/hw_char_mchp_pfsoc_mmuart.c.o: in function `mchp_pfsoc_mmuart_create':
  hw/char/mchp_pfsoc_mmuart.c:79: undefined reference to `serial_mm_init'

Fixes: a8fb0a500a6 ("hw/char: Add Microchip PolarFire SoC MMUART emulation")
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210515173716.358295-7-philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/char/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/Kconfig b/hw/char/Kconfig
index 4cf36ac637b..2e4f620b13e 100644
--- a/hw/char/Kconfig
+++ b/hw/char/Kconfig
@@ -61,6 +61,7 @@ config AVR_USART
 
 config MCHP_PFSOC_MMUART
     bool
+    select SERIAL
 
 config SIFIVE_UART
     bool
-- 
2.31.1


