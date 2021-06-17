Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614693ABAEE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:54:39 +0200 (CEST)
Received: from localhost ([::1]:35466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltwDu-0002vr-Fm
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw3j-0006rD-6l
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:44:07 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:34463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw3h-0001OY-HM
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:44:06 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso5279897wmc.1
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z+tQ+79u0v5Hqcb6NxLeyIdCtff9V34lJUP0h2IdROs=;
 b=W7aqm7R1Z2/GIxr9BhIHUWrmxcRVqb1INqfbf7Iavp6L3+WIKHUPd7B1rjn0cx+UW8
 dAXjiV2Ueu0Hgnf4q3a7E17VnLujF1Gd+8j/nbCLO21C9oPUX8raDQUHxsWN7aJVoVSG
 UcKiQ5+I133qHsxaQ0l2HDek9d3nUN+16vYbe85tjtmsVagKaAweVescnY/LXiC9kU47
 rZRRgSJ1bnhs8fD1JkcO4IMF3JDA27ztL2Vsk12vVS1rmUD9FwXPML3G4ZRZt5pdRSrv
 YhJKC1vkxW1vAnU0UYt3X/gCaxzp+H96DxDf6CQInhV+iQT5MSjEPmcZu2nfehgaeTdq
 +mkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=z+tQ+79u0v5Hqcb6NxLeyIdCtff9V34lJUP0h2IdROs=;
 b=aYrA6BAZxyoauQZLk/bf1Q9WrKJQC2KwJ+8vMU5s/WF22bVvOIk4Hp7z/BY89dGEIz
 CLsvGOCjYGQ5TLIeb0DkEhU3wfISmIgDAuMs0l2E7afgBJa+E7WnBoUYXSRYB4g2d9Is
 IUUixCPPt+/gfK85VBSvtMRCsoNjukOnNPk65OhNE1Mj74zpeEcB8Zq9atOudExdlbfg
 Q0dak8qnsbthRC3cm0I4tHS4QTGRXT/JTg4d6gFc9vRlsCMYUCCoFnWTGoD7/vFOhxUJ
 WEYHAtT/abJKqXWir85+npbmn+IYy2UEx2WUa+gHxZ8jEPuVz73HCsjdDDBKMVt28Hvc
 spbw==
X-Gm-Message-State: AOAM533LSm8cqsq9wV//YO4DQwhkWccRrX4JwcIq3ZJIfcYE9x4kN8Vk
 RYMSyzFZ6x0wtoaSQRgRlmVL/CO0tSWn2Q==
X-Google-Smtp-Source: ABdhPJxp9y2v3c9YVAeb1/osSH6nqfN8FCqznUXsM9loSLNi34jDVf185dZcUcwAJng0UxiQzDEqcw==
X-Received: by 2002:a05:600c:4f90:: with SMTP id
 n16mr6467326wmq.139.1623951843312; 
 Thu, 17 Jun 2021 10:44:03 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c7sm6204017wrs.23.2021.06.17.10.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:44:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] target/mips: Constify host_to_mips_errno[]
Date: Thu, 17 Jun 2021 19:43:22 +0200
Message-Id: <20210617174323.2900831-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617174323.2900831-1-f4bug@amsat.org>
References: <20210617174323.2900831-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keep host_to_mips_errno[] in .rodata by marking the array const.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 6de60fa6dd7..77108b0b1a9 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -75,7 +75,7 @@ enum UHIOpenFlags {
 };
 
 /* Errno values taken from asm-mips/errno.h */
-static uint16_t host_to_mips_errno[] = {
+static const uint16_t host_to_mips_errno[] = {
     [ENAMETOOLONG] = 78,
 #ifdef EOVERFLOW
     [EOVERFLOW]    = 79,
-- 
2.31.1


