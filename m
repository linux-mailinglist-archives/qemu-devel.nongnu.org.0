Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277A0320B0A
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:46:40 +0100 (CET)
Received: from localhost ([::1]:54580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDq0N-0002cY-1S
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpr2-0007wO-Hw
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:00 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpqX-0003Bk-Rn
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:00 -0500
Received: by mail-wr1-x436.google.com with SMTP id n4so16376456wrx.1
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8H71CdRSoAovW6NsHJmiVRZtkb7u06YlcS4FCzZPkNU=;
 b=LFJKHSCtp58C1h7Ts7Qp1UcFFCTcmFo6vFTwJ1ALxX5zHoA/pJw3mkIDZ4vu8kyAjF
 EwSbKlIlL2qN6YH0JG8y9bywgIaYjwQ1DCuAOI/LciS3GLbB4MZToH4cZCzH3vb9X5gW
 YSPVrKqpmESrDpHz8bkjrtfOTX0wQxUJ0BfyfzKQhvZG5JxKLLamLTADPteotMXSnnrU
 /BgdGpB9xAmbRSc5giR4JN/Mdvg/G2HgjKKC1+NjAa5nBbJGzK3j4WE/QA2DuHd2FbkJ
 wGYGQGlgXW9Zb8CjIpEM5sfwEwBQsj1U3tc1VmP1CkZfazqKRg0X93Y3IhP2yRV6XqNS
 9GAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8H71CdRSoAovW6NsHJmiVRZtkb7u06YlcS4FCzZPkNU=;
 b=uUmxvsPr0guv75nhcWjOTQeHVvak7Ee8MDZTfzYiIgNk+YLcgRQFRYlANkiBTAB4C1
 dD0e4XoZ1xsTM8QX0B6qAveUiELTdWDOrkQGV7y8ExSiaAvCJezNCVu5LHMHzWKr/5YV
 p33t/LkyFmrFVFlIEtPvso/0s8EIenaTgnZ+qP+9nv6F5gK9UEyHIUDT8hFiFQAYJuPa
 5IT0W0ZJKvooX6toToCxWJI51dxLbjPtzLLR6oNrHc2iKfohbRCUlULFimOgpJRzzgXz
 Tnbx21t7LfuR6oIyoeBn5v1ouOo6+bSVOI1tPX5c4wEk93CvAwkRVjpRdxHwzrZZPtJj
 /bKA==
X-Gm-Message-State: AOAM533nvB2IMi5rx0QM2QDI+tjhG9tqbiqH3wbZZ1PUSHNFPbdXdHxN
 cM/vWnMEdOy8V9sz6dIBvFjX0EfNuYI=
X-Google-Smtp-Source: ABdhPJzdxX5rLYkAKBXFtq9pEP7Mf62Xy9qJAroxBcsqsTZt2g58uYKJZo7fqyoU9RSaavoUCRPk4Q==
X-Received: by 2002:adf:fecc:: with SMTP id q12mr1115581wrs.317.1613918188475; 
 Sun, 21 Feb 2021 06:36:28 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x13sm7695603wrt.21.2021.02.21.06.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:36:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/43] target/mips: Make cpu_HI/LO registers public
Date: Sun, 21 Feb 2021 15:34:12 +0100
Message-Id: <20210221143432.2468220-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will access the cpu_HI/LO registers outside of translate.c.
Make them publicly accessible.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-4-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h | 1 +
 target/mips/translate.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index f47b5f2c8d0..2a1d8f570bb 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -145,6 +145,7 @@ bool gen_lsa(DisasContext *ctx, int rd, int rt, int rs, int sa);
 bool gen_dlsa(DisasContext *ctx, int rd, int rt, int rs, int sa);
 
 extern TCGv cpu_gpr[32], cpu_PC;
+extern TCGv cpu_HI[MIPS_DSP_ACC], cpu_LO[MIPS_DSP_ACC];
 extern TCGv_i32 fpu_fcr0, fpu_fcr31;
 extern TCGv_i64 fpu_f64[32];
 extern TCGv bcond;
diff --git a/target/mips/translate.c b/target/mips/translate.c
index a6e835809aa..c20f630b7e7 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2179,7 +2179,7 @@ enum {
 
 /* global register indices */
 TCGv cpu_gpr[32], cpu_PC;
-static TCGv cpu_HI[MIPS_DSP_ACC], cpu_LO[MIPS_DSP_ACC];
+TCGv cpu_HI[MIPS_DSP_ACC], cpu_LO[MIPS_DSP_ACC];
 static TCGv cpu_dspctrl, btarget;
 TCGv bcond;
 static TCGv cpu_lladdr, cpu_llval;
-- 
2.26.2


