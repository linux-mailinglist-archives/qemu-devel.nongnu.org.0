Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC884EABA0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 12:48:22 +0200 (CEST)
Received: from localhost ([::1]:54192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ9Of-0006AD-OO
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 06:48:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ9D3-0003lV-Mg
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:36:22 -0400
Received: from [2a00:1450:4864:20::42d] (port=35725
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ9D1-00019M-9h
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:36:21 -0400
Received: by mail-wr1-x42d.google.com with SMTP id w21so19573158wra.2
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 03:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pzkR8/kAabmvhc+t7Xvkr9admFp65gGBNYh313N0BrM=;
 b=iCLwhL5k6ToVvHGQh5j43Eq/3p/FqZiaeO/nXBoL6A+5UyEyZ+3443yuCfCKyV0y2e
 o0ojdJyuJnI+knCBJ56xACbvbDvHkkbmZSMvYx7a1Akhf/3GqBYUSk+A/k9bGTAZ/c1c
 DopOiUpkKP7OmjYiQrF0dY2lN83Akmjz9vDywRfvSoD3sL42kHXH97aHqHt4k6ByJPiL
 hI0j0mYZ95zjPVRkA1umOek9zNPRHDxSEq8ffqbuZ/t9hMjcKfyYKOubt2SHriS0UCPR
 myunKf+2tK+SqR0lQ8nNvDrN8wAGRiRS+V405Bl45WDl59jDpZbqeEWugWZINZ2iW93g
 y1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pzkR8/kAabmvhc+t7Xvkr9admFp65gGBNYh313N0BrM=;
 b=fcKdhxUHYTmIRJAZWhnQ6UpD7LLRIY6XMDzrJsHMfIGSdz4A83eSb7CbY4HfDZlJWi
 C3po6YpvygF6GWzuKFqIVd5mg7V9UwaKjSLJnMBNdeeBGw7sDItI7yDPAuTyw4Lnin9p
 HiUt04EZxuy9vvM2N1i7BWhAEsgQcc1K9FDWd1QWXri4hTRWoQbPTDY+cq1UCLOoFZmW
 +6z+VD30IogQWhJwj1asSzb9DiSS1qbDRUfEz7gDBtRBJCky3HsgL/rL8BZeZ2x+Euh0
 p8EWfp7e33g6SBeBPZPXXDgY0qaqTCGlnakKd/fpepab76IjLsaf19TGx/Nn1p41BfqX
 N+0A==
X-Gm-Message-State: AOAM532YROm+xakNzOi8Vi/j8+7OXFjKrlBO2Cj4/L63YlYcdVDaGgTY
 Q8csuS6CKKNPNR8BBmrEIqWIowplUDnbYg==
X-Google-Smtp-Source: ABdhPJwFyzyLmef00KytD/4OHSTIzNEsLcvDPT4vNbXLBQ3xW6a/zUrnsYXSSDLi7TBYyu0msDElGg==
X-Received: by 2002:a05:6000:10ce:b0:204:203:9c87 with SMTP id
 b14-20020a05600010ce00b0020402039c87mr29606810wrx.181.1648550177737; 
 Tue, 29 Mar 2022 03:36:17 -0700 (PDT)
Received: from localhost.localdomain ([2600:70ff:f07f:0:d557:f3bb:5d8b:b5f3])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c3b0800b0038cc8f116d3sm1769565wms.44.2022.03.29.03.36.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 29 Mar 2022 03:36:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] target/mips: Fix address space range declaration on n32
Date: Tue, 29 Mar 2022 12:36:03 +0200
Message-Id: <20220329103604.41208-3-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329103604.41208-1-philippe.mathieu.daude@gmail.com>
References: <20220329103604.41208-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Andreas K . Huettel" <dilfridge@gentoo.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 WANG Xuerui <xen0n@gentoo.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <xen0n@gentoo.org>

This bug is probably lurking there for so long, I cannot even git-blame
my way to the commit first introducing it.

Anyway, because n32 is also TARGET_MIPS64, the address space range
cannot be determined by looking at TARGET_MIPS64 alone. Fix this by only
declaring 48-bit address spaces for n64, or the n32 user emulation will
happily hand out memory ranges beyond the 31-bit limit and crash.

Confirmed to make the minimal reproducing example in the linked issue
behave.

Closes: https://gitlab.com/qemu-project/qemu/-/issues/939
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
Tested-by: Andreas K. Huettel <dilfridge@gentoo.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220328035942.3299661-1-xen0n@gentoo.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu-param.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/cpu-param.h b/target/mips/cpu-param.h
index 9c4a6ea45e..1aebd01df9 100644
--- a/target/mips/cpu-param.h
+++ b/target/mips/cpu-param.h
@@ -12,7 +12,7 @@
 #else
 # define TARGET_LONG_BITS 32
 #endif
-#ifdef TARGET_MIPS64
+#ifdef TARGET_ABI_MIPSN64
 #define TARGET_PHYS_ADDR_SPACE_BITS 48
 #define TARGET_VIRT_ADDR_SPACE_BITS 48
 #else
-- 
2.35.1


