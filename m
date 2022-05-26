Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4455535607
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 00:13:48 +0200 (CEST)
Received: from localhost ([::1]:54530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLjn-0004XR-Of
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 18:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLDC-0003Jm-Af; Thu, 26 May 2022 17:40:06 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:36629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLDA-0008M3-PV; Thu, 26 May 2022 17:40:06 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 e11-20020a9d6e0b000000b0060afcbafa80so1834296otr.3; 
 Thu, 26 May 2022 14:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MDV5AXSg43OCgKun7NZjxUBaec2GyjsWOvvyjfcmfIg=;
 b=L5RIC5YzE9YwyOYAyOd3BCPP2TEkfZ2qRjMoU9iJ4RNpMumwAeICYkPdPM+b0JIdqy
 h8vZfp8h8n+nwax8sXuNhTh8BJtCdBgYTntszHhRXnjdGGKDgHnuxtz6VH6GCYcPh3dx
 KJCbXboRZEobBlBioQzlrGfyVlqL5PyOmzetBdwZIyCQp3tW0U+zMJrobm6bnxX2/zEQ
 pf1LdHM3SYZcTbBQJ1bYKSGnwpnvKZHKaabozY9JdB0Q4HwhYzfmdNhoZfGFWs7YBRPi
 /bLtgU0uSzFu1K1fNjwGtVDss/mK86+8CQaaQY96TpdBpUvo12K+SVKd+fvr7xaW3M/H
 MC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MDV5AXSg43OCgKun7NZjxUBaec2GyjsWOvvyjfcmfIg=;
 b=nrGFyQxtbd7NZ6Tw0lv1hB1yoqClWW1ZcXF+5KntzzjMqunFcjNUDqhqbO5DXkbSYi
 cw9TBy62t/Li6OD5wfSaUS9jXOMk5u9hXlmQ/mmhL73WN65Rf+qHmWSpYvNnfEDRaojW
 dnnuFfVsfrUctFV6EKyCnxvmhSXGAAiArnpEOB22NfoXYMUT/XtWR6nFX0JK/B5B2ZXW
 9v0BeQxbiVtvKQwUvcrAZ/7AepI0Lx+xngxoL6NAE+6T4xfkqHbZ9K1jIh5RdxtSiMNE
 3MDrXHuNYCdOWjYS8iCP6xK/kZ2VeS+r0kwQhpWASUkHBLPggazXtrCsjBWI6G3vU+qT
 QvGQ==
X-Gm-Message-State: AOAM530cb6oJKwlrSdWuL25fp48ExrNpunQMuVPWb9RJ1udpuleoQaqm
 x21bOo6yB26ADPnPoVSL1qJFz8pxGI0=
X-Google-Smtp-Source: ABdhPJzrFOq4YbroWozVysRgpnsr5rHq9N9TSL21z1XQLU2Uy8OufxL40RHS3r9jXsnFNPbcdkg9ag==
X-Received: by 2002:a05:6830:1aee:b0:60a:ee99:f2 with SMTP id
 c14-20020a0568301aee00b0060aee9900f2mr12973798otd.40.1653601203181; 
 Thu, 26 May 2022 14:40:03 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:40:02 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Joel Stanley <joel@jms.id.au>
Subject: [PULL 34/34] linux-user: Add PowerPC ISA 3.1 and MMA to hwcap
Date: Thu, 26 May 2022 18:38:15 -0300
Message-Id: <20220526213815.92701-35-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32b.google.com
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

From: Joel Stanley <joel@jms.id.au>

These are new hwcap bits added for power10.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220524140537.27451-9-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 linux-user/elfload.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index acc21748f9..f7eae357f4 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -779,6 +779,8 @@ enum {
     QEMU_PPC_FEATURE2_DARN = 0x00200000, /* darn random number insn */
     QEMU_PPC_FEATURE2_SCV = 0x00100000, /* scv syscall */
     QEMU_PPC_FEATURE2_HTM_NO_SUSPEND = 0x00080000, /* TM w/o suspended state */
+    QEMU_PPC_FEATURE2_ARCH_3_1 = 0x00040000, /* ISA 3.1 */
+    QEMU_PPC_FEATURE2_MMA = 0x00020000, /* Matrix-Multiply Assist */
 };
 
 #define ELF_HWCAP get_elf_hwcap()
@@ -836,6 +838,8 @@ static uint32_t get_elf_hwcap2(void)
                   QEMU_PPC_FEATURE2_VEC_CRYPTO);
     GET_FEATURE2(PPC2_ISA300, QEMU_PPC_FEATURE2_ARCH_3_00 |
                  QEMU_PPC_FEATURE2_DARN | QEMU_PPC_FEATURE2_HAS_IEEE128);
+    GET_FEATURE2(PPC2_ISA310, QEMU_PPC_FEATURE2_ARCH_3_1 |
+                 QEMU_PPC_FEATURE2_MMA);
 
 #undef GET_FEATURE
 #undef GET_FEATURE2
-- 
2.36.1


