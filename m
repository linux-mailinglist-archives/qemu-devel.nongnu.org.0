Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A56B612D68
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:33:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGrN-00022U-8B; Sun, 30 Oct 2022 18:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGqt-00008R-VH
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:32:24 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGqs-0008Of-4s
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:32:23 -0400
Received: by mail-wr1-x429.google.com with SMTP id h9so13721867wrt.0
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XG3sgTPrYyBX5qscbuiJzqy4z78ePhiDy+Vo34aVSx0=;
 b=RjQG5K/thBtl2J2wrWHPSYQZfER0gIFxaFUEkSKduvW3YERp2rIPBz+aFI9D1oQKle
 8IFHtG1bmGJi06po8YOD4m5nOYlpCDwGrcEprv1YCogigMOPtcsJH4L4oi2vdBzlZy7q
 HQRf/of5rYHcJQO69q276Dt2AXWuCOQnBl+ZHYqODpjGRq/4PWhNDpIktARJDntuxSF/
 eVphyTrYQ3UiOfNGRmIaFDejrVf96pHDMaci0oVbefj1zfh3ZVf4AACV4CXAi9PAz4oP
 MdyRFC2LacIbHrod6XsZdIEGQj6DZY4yuJrUvrUtAIdsmBjVm+Blcf8NUOcFTAX9TuFf
 Knlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XG3sgTPrYyBX5qscbuiJzqy4z78ePhiDy+Vo34aVSx0=;
 b=FaK2ZqbpLn5t0pGIsVRxfQMIbSrF2lhoFPp/v9avW4ZuylmqiYgx+JnpJwglWOPDpw
 gQ8iU3Z+Z5dlMZD9fbT3tkzcK7sw1lpKk7IzH+4UT2o9M61ZXM7EKD2V/1iJ6kJW9AwJ
 VxxBVzgJKR3W4IgeEiwHnSXtlylvKsSEHLE5f+gCKl4Jk2WkkUMRQzrgMZEYmwfUtCNO
 hKSxQqQGPx1Lg7F4YHz3J/ozvUzU7rhThtZO8XXsVov3112Qb8GWjknmYvwi9FeO7JBY
 TqSq98molEHZmW0byw8RShwFw1OGdej+9hs/ikTPuah+JMzU9LKXHR9EnTg3O+Jj4Y9L
 +wsw==
X-Gm-Message-State: ACrzQf1UAnXS9/R2jjtJzbga5Ldge3r2xzrqpCxruzyp53GcFPhu1E2H
 9dh6CCIAHXOkQb91pfVr8YY6zN4CsBfFZQ==
X-Google-Smtp-Source: AMsMyM5QxdM8f5G13hGL4gBa53tNV8ItIRTanA+udCM8JxAR9X+ZhxebtdlassrdewSe/mVBtuKfTA==
X-Received: by 2002:a5d:4804:0:b0:236:94d4:5472 with SMTP id
 l4-20020a5d4804000000b0023694d45472mr6095829wrq.286.1667169139252; 
 Sun, 30 Oct 2022 15:32:19 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k25-20020a7bc419000000b003cf4eac8e80sm5874622wmi.23.2022.10.30.15.32.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:32:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 33/55] disas/nanomips: Remove function overloading
Date: Sun, 30 Oct 2022 23:28:19 +0100
Message-Id: <20221030222841.42377-34-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Milica Lazarevic <milica.lazarevic@syrmia.com>

Disassemble function that calls the other variant of it is deleted.
Where it is called, now we're directly calling the other implementation.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-20-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.cpp | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index ce93fdad62..85f5784770 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -21917,12 +21917,6 @@ static const Pool MAJOR[2] = {
        0x0                 },        /* P16 */
 };
 
-static int Disassemble(const uint16 *data, char **dis,
-                       TABLE_ENTRY_TYPE & type, Dis_info *info)
-{
-    return Disassemble(data, dis, type, MAJOR, 2, info);
-}
-
 static int nanomips_dis(char **buf,
                  Dis_info *info,
                  unsigned short one,
@@ -21932,7 +21926,7 @@ static int nanomips_dis(char **buf,
     uint16 bits[3] = {one, two, three};
 
     TABLE_ENTRY_TYPE type;
-    int size = Disassemble(bits, buf, type, info);
+    int size = Disassemble(bits, buf, type, MAJOR, 2, info);
     return size;
 }
 
-- 
2.37.3


