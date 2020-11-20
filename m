Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A852BB844
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 22:24:09 +0100 (CET)
Received: from localhost ([::1]:46334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgDt2-0001Z9-Os
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 16:24:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDfk-0004IY-AJ
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:10:24 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDfg-00048b-5y
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:10:23 -0500
Received: by mail-wm1-x344.google.com with SMTP id a65so11267174wme.1
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0+8w6ImWecSqTCfHwLUXCfd+P5NiNx/WvPTWih6RYyo=;
 b=pkTNOvB8y+OJrLv8XH7UxY7qKIJUp9HWlgtIbr4Oee45ESlB0oGO3acFYXDvChJfuk
 JJXdgTmg+jJJsNc837QWZ+KIoOZqnawjFPBvuWlcYy0ZEFu12duRZoOcuGGaWBaADIKs
 Py6TGiRLRGd2FsUmHmtNRsT7qqr5wJ2Upcz2tvI6iB7KdpAQot9LXwzfEko7jagGn9Z7
 ll9/YgT7yKpxtENtQQrFjR5IvvI4zQs0rvhR6SaMkAv+QXOzELua2uwVnrfUa40Ymo+0
 4INX8IOfPZbTgeryQBwhJrc/bibARCA57EivkDPfGbOTSeUhZ5nfzdKXFnsHEA2FFTJe
 yEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0+8w6ImWecSqTCfHwLUXCfd+P5NiNx/WvPTWih6RYyo=;
 b=IAR7DQ/J7k8NuLFsnAx0D7YuqLWaJ0MdTXMSDC4/98oNFvI2Ti7+mLk4XkDqRMefPD
 t4AuvuSgoCJFm3dn3BaHEYr8/9+/ouWrvxVG5sXTEhfJxE5kT5BRbmlwkro2lfb7UcXg
 9AiKJpeRnFOAyK/06VfPut/WlW0XySwEuMRP+bqN6pjpfL7ua/9xcysDV7r4IToMMayA
 W4YuHlvDaukqwITX0ZmN0Si5pFyi8eU+gibpO2Fcqw40HLsYc1S5lASumEFqDhF1+DIU
 XHBftdxIBLNDyIdmjku4xpr65eIJnRO27fWjFEjcAzHx5VwEtJoOWFamVvrIOiHBkDp4
 U6TQ==
X-Gm-Message-State: AOAM532uPbbvXtr7NxmwpNHX27ylmNstnt3JoMzMRFHxq6fMCLXnzUlH
 oyhTOA5/ZoOVht0vsm3/psN9fwymU1Y=
X-Google-Smtp-Source: ABdhPJwCIMNdi8KuCnWJZjUu/GQRCPiA/Z4qFnmC7EL7gx+d3s4WLNmjHYwiZEqWrlnNYZ7zQwLzzg==
X-Received: by 2002:a1c:44d4:: with SMTP id r203mr11817646wma.60.1605906611337; 
 Fri, 20 Nov 2020 13:10:11 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id i10sm6845357wrs.22.2020.11.20.13.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 13:10:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/26] target/mips: Rename lmmi_helper.c as loong-simd_helper.c
Date: Fri, 20 Nov 2020 22:08:34 +0100
Message-Id: <20201120210844.2625602-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120210844.2625602-1-f4bug@amsat.org>
References: <20201120210844.2625602-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The LoongMMI extension has been renamed LoongSIMD
(part of the LoongISA). Rename the helper file accordingly.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/{lmmi_helper.c => vendor-loong-simd_helper.c} | 0
 target/mips/meson.build                                   | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename target/mips/{lmmi_helper.c => vendor-loong-simd_helper.c} (100%)

diff --git a/target/mips/lmmi_helper.c b/target/mips/vendor-loong-simd_helper.c
similarity index 100%
rename from target/mips/lmmi_helper.c
rename to target/mips/vendor-loong-simd_helper.c
diff --git a/target/mips/meson.build b/target/mips/meson.build
index b63ef41cb1d..e8f0c080099 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -4,10 +4,10 @@
   'fpu_helper.c',
   'gdbstub.c',
   'helper.c',
-  'lmmi_helper.c',
   'op_helper.c',
   'mod-mips-dsp_helper.c',
   'mod-mips-msa_helper.c',
+  'vendor-loong-simd_helper.c',
   'vendor-vr54xx_helper.c',
 
   'translate.c',
-- 
2.26.2


