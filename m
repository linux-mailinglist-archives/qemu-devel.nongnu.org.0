Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1796F31B1FC
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:27:35 +0100 (CET)
Received: from localhost ([::1]:46026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBM7K-0003LS-1D
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLiK-0000Ww-Vh
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:45 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLiJ-0004c2-8r
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:44 -0500
Received: by mail-wr1-x42a.google.com with SMTP id b3so6108979wrj.5
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TFe7rNxsyeddhlBqR6Hor/4xHDWb1CnQmr8o6p9Au7E=;
 b=J3Dpl81YbZnCLeorYdgQJY+bXN2UQr0AiYPkE/6GrElm43ZY5kVLzVTpJH21XtwKcU
 j2GeRSkLkU8cCHn5i+nj/O9w0Yj61bAEpp7dZENMJa6WBmpaOeiRPgfraKQngDOYoWWl
 8SbN2QuY8phZy5SfwmEIVfTN1b5fOutyGcM3vyzsYLonluIxZiT5MQRrj4Pa8IBVcOh6
 fQNXCXJaTh/4Fl0bQ/su9YxbtAivlDJPGCPCXbSe/TDN0GU2EdjdX3g2RpkPE0IF0bzK
 jpdHiTkDp9K0uycgnjVLQMNNQETVOaN/+dR9u2ZvjLAtvFcyPrVSiR6XMFmUK867uRlh
 h2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TFe7rNxsyeddhlBqR6Hor/4xHDWb1CnQmr8o6p9Au7E=;
 b=DlSZhIFIRgmicoDa8bnrIvWdTP2xXNCx/Uydd3uETCEu5yghoRRTEljPR1ilm4rPSY
 h+FyhQ4KNNVOCJbtoXs4+inzZuiL4+SCkCjUJztyo7NHNCc3d3UW9m3WMrPEL70k9cYU
 nFUfCY8+vPJFx4Zd0s5r3+NX5cdhHRk1XRNPRznHJ9bqyFG9i6iVjuXhbL0z6naPBbHw
 o6Pp+QfbyXltiJF5+QTHfnbFBYaBpxW1oZTFnmlA8hggy0ZgbejU7NmSCLfYtYpVus03
 XeGbkrY48KmJZxCdXgvz6jGTFfSUzmpQ5TpL2rN4PBX9YoQJY2T+ARHKJ6IMMGXqgwNn
 0jDA==
X-Gm-Message-State: AOAM532XnhZ11GS7U9/ejhtHjvl0HkuNgkrQPs31dsuMd5k7Z9MPIRyI
 XThmIGNuAHVydve4FqFeN7LR9NmU6jc=
X-Google-Smtp-Source: ABdhPJyQblBH1j/6HA1/BuXe53lnWPfN4LBzEaZgB75nUkPamE6oeXlBQzb/kCb09DVb6rzp0WT21A==
X-Received: by 2002:adf:fc4e:: with SMTP id e14mr2032831wrs.310.1613325700084; 
 Sun, 14 Feb 2021 10:01:40 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q20sm22392771wmc.14.2021.02.14.10.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:01:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 29/42] linux-user/mips64: Support the n32 ABI for the R5900
Date: Sun, 14 Feb 2021 18:58:59 +0100
Message-Id: <20210214175912.732946-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fredrik Noring <noring@nocrew.org>

Recognise the R5900, which reports itself as MIPS III, as a 64-bit CPU
supporting the n32 ABI.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <5bea109f0c140da6a821aa7f9705d4b3717e86dc.1541701393.git.noring@nocrew.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/mips64/target_elf.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/mips64/target_elf.h b/linux-user/mips64/target_elf.h
index ec55d8542ae..5f2f2df29f7 100644
--- a/linux-user/mips64/target_elf.h
+++ b/linux-user/mips64/target_elf.h
@@ -12,6 +12,9 @@ static inline const char *cpu_get_model(uint32_t eflags)
     if ((eflags & EF_MIPS_ARCH) == EF_MIPS_ARCH_64R6) {
         return "I6400";
     }
+    if ((eflags & EF_MIPS_MACH) == EF_MIPS_MACH_5900) {
+        return "R5900";
+    }
     return "5KEf";
 }
 #endif
-- 
2.26.2


