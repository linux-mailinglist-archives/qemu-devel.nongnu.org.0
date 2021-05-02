Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C34370E02
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:39:00 +0200 (CEST)
Received: from localhost ([::1]:40596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldF7T-0001Zj-Rj
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldElY-0005aw-Rk
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:16:21 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:54114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldElX-0007S4-C7
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:16:20 -0400
Received: by mail-wm1-x331.google.com with SMTP id s82so1919760wmf.3
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pGVpj51cW5V28vRCX7GintOUgmx2bc45xybHGDvB0WI=;
 b=LW3cXiFIoM7DuVzxWouIwiHV78U1YdhWOWrxx6r0VpPrkPHe7c/TA1RjQPxwOZEwnr
 Vp80CFNqgIaSBMByLiG+kFH8iFmI207UNmfw84gFSaQXs1E/Liqse6dt7QKaOocYry7i
 pykQ0AT64GvKySABbRweYY9fdvc4zBMieHJiqwN6WEnloUKMqEOzUCuKZKlbx+OlmwL4
 Qsy3anMrc0fVKSdf032zno81BKBR9FcC3kxy7eA6d8kmuuUA1a1/1pGFEXV+FqRH9y/O
 Z4KLoQCF5H7fuh6RQqw7n8ikbftMNpL3aL82KXw0k5zIWGRmJ1XcV3pksRHrulCt28z9
 z12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pGVpj51cW5V28vRCX7GintOUgmx2bc45xybHGDvB0WI=;
 b=sFVfEv0HDhoCHWq5VAMOkljB5SgXvEHa+msI2tYE2DTnqunVWepa2FY2fwy+ZgXdQh
 SeKRb2wbRdwIxijMtAiiueHkblE+NzE7Yin4GgMAbCzdeXOEn+pa3nw2fVJYbGiJwdFC
 F+RM0/bTsLOEPFoqfWORQwvsvWIv47WYmqFeOQ7NsgLC/Xr1C8oxaEzHQSpiKS6FMyTm
 x3wgRWulcV2x7t5gZ6ylg3pbbsahtGvIP94djWQj7Vnv0cL8Fr96Mv59ALgKFUlFBj5p
 JK2TuMNxCtLTulpMB2/ZpGdP+cz0w24dHtSzwkmzP1V6pbifYaq4A5FayYGXrEOfayy3
 mDsw==
X-Gm-Message-State: AOAM533HAY/eaCgxGBoqDkrUA73ElvT1+JTfqqPrkXjOEUvdMDhK9k86
 L7ibaOKBqQkjw0RO26KIOc1gNshcT/Rrscus
X-Google-Smtp-Source: ABdhPJwdCUyFzssT0wgZqAc/+5ErYa0h/aBwhvxdk7c32XRksKHUxhGqmoR46XizeLOpr1OaKzm2BQ==
X-Received: by 2002:a7b:c846:: with SMTP id c6mr26999235wml.75.1619972176866; 
 Sun, 02 May 2021 09:16:16 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id l5sm8960057wmh.0.2021.05.02.09.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:16:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/36] target/mips: Simplify meson TCG rules
Date: Sun,  2 May 2021 18:15:09 +0200
Message-Id: <20210502161538.534038-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have the mips_tcg_ss source set for TCG-specific files,
use it for mxu_translate.c and tx79_translate.c to simplify a bit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210428170410.479308-2-f4bug@amsat.org>
---
 target/mips/meson.build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/mips/meson.build b/target/mips/meson.build
index 3b131c4a7f6..3733d1200f7 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -26,10 +26,9 @@
   'translate_addr_const.c',
   'txx9_translate.c',
 ))
-mips_ss.add(when: ['CONFIG_TCG', 'TARGET_MIPS64'], if_true: files(
+mips_tcg_ss.add(when: 'TARGET_MIPS64', if_true: files(
   'tx79_translate.c',
-))
-mips_tcg_ss.add(when: 'TARGET_MIPS64', if_false: files(
+), if_false: files(
   'mxu_translate.c',
 ))
 
-- 
2.26.3


