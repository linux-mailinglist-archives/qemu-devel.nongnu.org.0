Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B876149AF
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 12:46:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oppiJ-0006qk-NM; Tue, 01 Nov 2022 07:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oppi5-0006o6-RG
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 07:45:37 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oppi2-0004PZ-Vf
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 07:45:36 -0400
Received: by mail-wm1-x333.google.com with SMTP id t1so5016937wmi.4
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 04:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QwExV9b1gxk9FCZRhGhlwZgX/20JdEDXF8rXM3evK2M=;
 b=qq3QRTsNqbVaqo6keWPucC2l3VHTU/1GVSxi6xVCY4HyvjuHiM1f9lREYYKGY/ECfI
 3eZNczL9y+qHNLh9drIa3plHjJDkEKdjHMjO15ABA6LJHt4qZnuQ9yWFlRTH4bFSYNgF
 wS9aShRODghsGsvxIFv8F0k+XBIxFLTcE3pu8NUTwx5gEYSSAXkpSYCIeerEz8q/ocvs
 Yim+WpQkVxrtmsiS6Eh+moLfrHssMIxcaynWm+3GMva6Q+Z54Mnv0Mm4Uk9j08OnyPlM
 Vb4ycBOIb2zlmdF92N/uwi0WqvRw6mO9+nq9kYEWqaZPUy4nLkzO0JNiiiaeYlnxTeNJ
 ZZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QwExV9b1gxk9FCZRhGhlwZgX/20JdEDXF8rXM3evK2M=;
 b=RCz72O6fM5gkiXjEi9Y3WGcmRNbXOEel+2mnT8aDSV/NN2c46Wal2wtOOXYCZHNoy0
 XC69ghnekTXR/wEeSop4LElhy1g7DiI3gl1llq/Wq8DN365tCZNbpuhmxRN9+ljmJ/Dh
 qmnTGAIEolXle5jTkCoe+1PiT8zrF8atI3EIwP34BotKv4BTDP+qwzW6ymD0RnypAHAU
 jmUP5zFv+gOkqytcV0sjKKang27rzx0AgD6yoDZEgY97xKEM9FQwNCNUqzEsED2pCkQP
 ZvSRU+6fQY+eWTC63fv8aCwfigphmCF3ZCfVfhCZKshz4HoJQXhks6GIzsk9ZVCcBKYY
 1r5w==
X-Gm-Message-State: ACrzQf12PAQ+pN7ULCkGQ8iuazckrEYFakKIm6QlJnbWLp9FCmQfAw0I
 mh+qcIWt5Bo7IfxHiXEysBKIeOQmW0HfjQ==
X-Google-Smtp-Source: AMsMyM53/3hARVI/0d3Zqb9tPGHiO0Xs1D3ZXd604PTDtegq8gBrvZ+UlMmPj5KtY6vgTnxBLHSPew==
X-Received: by 2002:a7b:cb17:0:b0:3cf:7801:c76f with SMTP id
 u23-20020a7bcb17000000b003cf7801c76fmr4618373wmj.1.1667303133185; 
 Tue, 01 Nov 2022 04:45:33 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k36-20020a05600c1ca400b003b47b80cec3sm10670612wms.42.2022.11.01.04.45.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Nov 2022 04:45:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Petar Jovanovic <mips32r2@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 5/5] MAINTAINERS: Inherit from nanoMIPS
Date: Tue,  1 Nov 2022 12:44:58 +0100
Message-Id: <20221101114458.25756-6-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101114458.25756-1-philmd@linaro.org>
References: <20221101114458.25756-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

6 months ago Stefan Pejic stepped in as nanoMIPS maintainer
(see commit a 8e0e23445a "target/mips: Undeprecate nanoMIPS
ISA support in QEMU"), however today his email is bouncing:

  ** Message blocked **

  Your message to stefan.pejic@syrmia.com has been blocked. See technical details below for more information.

  The response from the remote server was:
  550 5.4.1 Recipient address rejected: Access denied. AS(201806281) [DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com]

To avoid unmaintained code, I feel forced to merge this code
back with the generic MIPS section.

Historical references:
- https://lore.kernel.org/qemu-devel/TY0PR03MB679726901BD6C6BE40114A2FE2A79@TY0PR03MB6797.apcprd03.prod.outlook.com/
- https://lore.kernel.org/qemu-devel/b858a20e97b74e7b90a94948314d0008@MTKMBS62N2.mediatek.inc/

Cc: Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <49f41916-687f-b9e5-2de7-9c658fe0d4c7@linaro.org>
---
 MAINTAINERS | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c41d8d65e2..0fa3c92b29 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -237,16 +237,10 @@ R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Odd Fixes
 F: target/mips/
-F: disas/mips.c
+F: disas/*mips.c
 F: docs/system/cpu-models-mips.rst.inc
 F: tests/tcg/mips/
 
-MIPS TCG CPUs (nanoMIPS ISA)
-M: Stefan Pejic <stefan.pejic@syrmia.com>
-S: Maintained
-F: disas/nanomips.*
-F: target/mips/tcg/*nanomips*
-
 NiosII TCG CPUs
 M: Chris Wulff <crwulff@gmail.com>
 M: Marek Vasut <marex@denx.de>
-- 
2.37.3


