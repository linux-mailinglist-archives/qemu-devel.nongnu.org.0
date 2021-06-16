Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F12F43AA64B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 23:48:40 +0200 (CEST)
Received: from localhost ([::1]:51274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltdOp-0001pe-VM
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 17:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdJq-0001Be-GL; Wed, 16 Jun 2021 17:43:30 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:41538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltdJm-0006MY-Om; Wed, 16 Jun 2021 17:43:30 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so2489724wma.0; 
 Wed, 16 Jun 2021 14:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+jgVQlH2ZLclahkepwe/jy0S2FD3dNErrT3z+1Ksb0M=;
 b=kGzSERqh+8wBxiJCuZax69b35h3ezUK0XWigjo4qNm3l/5MYGNdOHFhNYAq+qNwNJk
 5YcH4FdjrTrP0w4CA5xdInQP3jwZS+ZlMcd5FvN3uAiNwv5G4VNgAFaxLZrmYLfSXfAn
 +JjYTuUyo8SvVxI8jhKsT/XnfwTEdcBqBlcFCDlt37BdTJipV7fG4NTOCBcGBfSNj9o6
 It+Pz2Jhqguz0hggdTIj7M8TFWA9Oig+nFZ6h/qtR09D49wbEJaqxwr2FdOBZfTlkCzX
 oMsNghWh08w+8GDexu5kYihYcPFckGtX/q8QxfOVWRKyvw/VM27h4BY+kSPoyki6K87r
 XP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+jgVQlH2ZLclahkepwe/jy0S2FD3dNErrT3z+1Ksb0M=;
 b=TVxB6LIzqGBqbHRY9XcEgqx+997nz2yncrmNjqc9y35WXDiOhTCYR8t/d9GJ/HzZlC
 DpwxWWM93dfEZCI3UNaWmz3+nU5nrl3xWXEWit1L8TlpQwBdsnyWiMpMDMpIIgcn7CtL
 SGLbyId04VsLvcH51fubUADSZvMf6Cw0fuqeo6xy6Aw8fZlV6Pz/jvk9eH2SKTVpknAI
 XlEWq5APnIQYUlmfvHj9IeqLLvHZ+acodnb6H2BLgY4HoNmeICmlG+6ov09Eh5C9Dzue
 PPoKCYKe94+Up+/5/wYXlAaKTLRjnvdXyZ3LBALedUO/1wjzV77dv4Z3QeP6lnxNDWjw
 JSFA==
X-Gm-Message-State: AOAM531+AQRSFFmTNeIahP4zQ5CBy/FAAwLDSXQB0yZvswhZr4ajfaGd
 ijIOXIYZ1bw3uxrsnED1NAD3QDY6DRhiLA==
X-Google-Smtp-Source: ABdhPJyKCwyfFF7V0tlQyJx7sNkEw2Tvt9Ymyf0BG/IOIggzM/3tTVdeosh3rA30n7fJii+IiyYwrg==
X-Received: by 2002:a7b:c10b:: with SMTP id w11mr1117395wmi.186.1623879804348; 
 Wed, 16 Jun 2021 14:43:24 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p11sm3284037wrx.85.2021.06.16.14.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 14:43:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/15] hw/i2c/ppc4xx_i2c: Add reference to datasheet
Date: Wed, 16 Jun 2021 23:42:44 +0200
Message-Id: <20210616214254.2647796-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616214254.2647796-1-f4bug@amsat.org>
References: <20210616214254.2647796-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It took me a while to find this model datasheet, since it is
an OCR scan. Add a reference to save other developers time.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/ppc4xx_i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
index c0a8e045670..f4c5bc12d36 100644
--- a/hw/i2c/ppc4xx_i2c.c
+++ b/hw/i2c/ppc4xx_i2c.c
@@ -1,6 +1,8 @@
 /*
  * PPC4xx I2C controller emulation
  *
+ * Documentation: PPC405GP User's Manual, Chapter 22. IIC Bus Interface
+ *
  * Copyright (c) 2007 Jocelyn Mayer
  * Copyright (c) 2012 François Revol
  * Copyright (c) 2016-2018 BALATON Zoltan
-- 
2.31.1


