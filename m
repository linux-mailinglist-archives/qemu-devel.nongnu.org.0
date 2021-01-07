Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839D42EE8AC
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:29:43 +0100 (CET)
Received: from localhost ([::1]:37856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdmo-0007Hj-Hs
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:29:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdic-0000oJ-2O
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:23 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdiX-0005QB-SC
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:25:19 -0500
Received: by mail-wr1-x42f.google.com with SMTP id y17so7095350wrr.10
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QyeTQF7UvXhfCkJ2JeL3ZW1k3uAkuDX0bwVNyPuFC3M=;
 b=HbwznF7eh8ZevHZw/xcKKNxfDRZuQ/AC5SmusboRY44m9RvgB/mGd0Vg2YhaHbXNW8
 knB0qnN82vHsL3MC6h/9mljFPeh0RR75AFbxrGYzCwwUjRHWeqiyzeGK9WqIEcsJpPoP
 ZVVapJ98yo9rIRenMQtnCiLDi773PAmjXNljlBzIowsL2qrddShtaX11c+92BpDaFp3I
 +uHbVhQuLWIqxTF+93X3aH5Y3k0SjGlAgGOW9c7FPuiO1p79Lak7D+hzJBroiQT/6mQM
 ExoZRhQXZ26yeS/79H7BZs6wtBK6xNw9+RYOcFXn/3fEIkGJBIhAR/6CyQMchv2xRrNf
 iGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QyeTQF7UvXhfCkJ2JeL3ZW1k3uAkuDX0bwVNyPuFC3M=;
 b=UplbuEMva6Uz0BWXjiAI/IlJ1dq6iejH7jd2m2mOkSDZQzeTzeKS1e1uVf+bjd4Njd
 2NSUKEycLUS8BVHIWfJY5Ygrrr8mzc5RnYTAWvFrfLji1ZddGienftbS/lbSrfK/NFfD
 oB3pIB224XPGNUHCV0TOGWKEsxr0fsbZGmTmszq/GIYN52MKM/5ebT6dX8ngpI6yIhqZ
 WKQtflWHxbLqQ82UAJPl2OOz5MNW0mwFpA/RpvOkYEVPuvEg/RY2GpwsarpN9A+6ePB1
 eO6ilbrF9TDgV9XZg/3bBKA8bKHKI/1PoWnmg151pyUp4R4J3tD1jh6MXX+tUwq4yhAA
 mYeg==
X-Gm-Message-State: AOAM532S2tZ8LEwN3II5L0WPvSyz/Ocvhckz9cATFx89oPQIjRAqLKYJ
 +amlUnYW2j2YJYmi9Fo35naxDGTGOOA=
X-Google-Smtp-Source: ABdhPJyH6h8WC+O5aY6j+igrFTma98XjZTCEhgTN14u1Bv21LP2Kk6nJIKKMpVHv549JiPNNjfbaMQ==
X-Received: by 2002:a05:6000:90:: with SMTP id
 m16mr668214wrx.165.1610058316126; 
 Thu, 07 Jan 2021 14:25:16 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id s3sm8998055wmc.44.2021.01.07.14.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:25:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/66] target/mips: Rename translate_init.c as cpu-defs.c
Date: Thu,  7 Jan 2021 23:22:14 +0100
Message-Id: <20210107222253.20382-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This file is not TCG specific, contains CPU definitions
and is consumed by cpu.c. Rename it as such.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201214183739.500368-10-f4bug@amsat.org>
---
 target/mips/cpu.c                                    | 2 +-
 target/mips/{translate_init.c.inc => cpu-defs.c.inc} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename target/mips/{translate_init.c.inc => cpu-defs.c.inc} (100%)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 26b4c3e9cd5..55c6a054bba 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -311,7 +311,7 @@ static bool mips_cpu_has_work(CPUState *cs)
     return has_work;
 }
 
-#include "translate_init.c.inc"
+#include "cpu-defs.c.inc"
 
 static void mips_cpu_reset(DeviceState *dev)
 {
diff --git a/target/mips/translate_init.c.inc b/target/mips/cpu-defs.c.inc
similarity index 100%
rename from target/mips/translate_init.c.inc
rename to target/mips/cpu-defs.c.inc
-- 
2.26.2


