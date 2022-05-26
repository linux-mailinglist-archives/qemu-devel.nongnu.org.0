Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883B25355C6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 23:44:48 +0200 (CEST)
Received: from localhost ([::1]:48294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLHj-0000uM-Ky
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 17:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLBn-0000Ye-9w; Thu, 26 May 2022 17:38:39 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:45606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLBl-00084G-O2; Thu, 26 May 2022 17:38:39 -0400
Received: by mail-oi1-x230.google.com with SMTP id r68so3615290oie.12;
 Thu, 26 May 2022 14:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jxq0GoNMOrfMkh7Q+RRv6Q3I0KJxJA5pEEIoBSIidB8=;
 b=ETxb/kkEy2z5TwHhvuS8c0itwUF+nLPVlcvoXKHEZfwT3p/ji4YAJZGhtlTNz10aJY
 P2fqAbjfqw6Oqj1nCL45GdSOSETHdxP3XwmRXJqsD6YePrIdsJT68D/dp9bsnOe+rBO4
 uURFIKx0I0OAKljWLizg910IbUBGJ/t+Zq/8IeBXbj2JI+LscL3t9rNiy585xCG6mfSa
 kPH6tYwhaH6de1669B1RwBLJEdbnXdCMPNtOF8zhAzmT/jIV+x9s88nX+wmAKGWTaxwM
 p/VSIfGbq2SHnqm9vhD4SC+1o/KXbJWTAHQWI/XaOXE7SSEYeCC2LfxpweFR76D/wuU+
 OIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jxq0GoNMOrfMkh7Q+RRv6Q3I0KJxJA5pEEIoBSIidB8=;
 b=ULHSZej6kvMWSRwUh6hgK2SJrLjr/ADIgJOxKBD7QYQ+ygf59H2cKAk12yR55+a3h0
 psT59q5yLROGgxJs38d6uF/sLeVkUFBuXUzDBYDTO4xfDEr4Av8reDxuONXvqt1uervp
 h/IsmhPCJGDhyYR4GEEKKNzpbStcmGY03kF8Pv606JDYkiju6atpa470jA3Q6Ysfy803
 IIhe1RvUQKBwl05OwzMG72dYwWy1rQpB9uTf4hptWQAq6ef044whQ5SzPsgaSeIZJrwH
 1V1gl0WkkArDJq3iG49ZJCpxHAeAdbNm54Of2jhl349OXwlX2KVnPAAsiNRKWkk8P9lJ
 BhxQ==
X-Gm-Message-State: AOAM533uZYu5wcKnkhmcS5pw5zHRrsuMOzRYluhfg/qaW6pjlKiIPODi
 jdHV88aOPYkBPd7mRNNWzh0sw/xRTRs=
X-Google-Smtp-Source: ABdhPJy1FkuciUn8+Brk5Jxam/ibTPHTPNoDlVEOEUp5RTLc2pUacSWIawC+MluoDG2c5paj5wRcog==
X-Received: by 2002:a54:4f87:0:b0:324:ea60:b97d with SMTP id
 g7-20020a544f87000000b00324ea60b97dmr2394588oiy.87.1653601116098; 
 Thu, 26 May 2022 14:38:36 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:38:35 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PULL 02/34] hw/ppc/e500: Remove unused BINARY_DEVICE_TREE_FILE
Date: Thu, 26 May 2022 18:37:43 -0300
Message-Id: <20220526213815.92701-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Commit 28290f37e20cda27574f15be9e9499493e3d0fe8 'PPC: E500: Generate
device tree on reset' improved device tree generation and made
BINARY_DEVICE_TREE_FILE obsolete.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220505161805.11116-8-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/e500.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 2bc3dce1fb..7f7f5b3452 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -47,7 +47,6 @@
 #include "hw/irq.h"
 
 #define EPAPR_MAGIC                (0x45504150)
-#define BINARY_DEVICE_TREE_FILE    "mpc8544ds.dtb"
 #define DTC_LOAD_PAD               0x1800000
 #define DTC_PAD_MASK               0xFFFFF
 #define DTB_MAX_SIZE               (8 * MiB)
-- 
2.36.1


