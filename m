Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CE56A443B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:22:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeAY-0000ze-37; Mon, 27 Feb 2023 09:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeAV-0000d1-Nk
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:55 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeAT-0000Lb-SB
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:55 -0500
Received: by mail-wr1-x433.google.com with SMTP id h14so6365013wru.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9BQv1kTB2L0mnCbjAHXP+un9EH4FVICZqpzI5v7B5ww=;
 b=ww56SprYy/WgKYYwysoYvV/+aY16HBvRbmo95k9guREgWVpeuroFyWlDTpC0H1JldR
 b3BmImq757spZfuj5V0b2IkIBn3Ae4PlJ8/ExuIQPRk1tjr3f1i6Zq1Uq2VCMs2mHAAc
 G1hDCZY/vEcb4T3JfE2LIsHxqEO2Fjek3SdrkLwHYbuUUWgjrxvqR4qP0TmUyvbe2dtV
 vk+dHhsctSzugHe2yZ5Om+UAFUTEFz27rJQACvLVjT2D1Hm3FjmBqzwrNFkbfNz32n0W
 srjUjKovdHrCk/KFpo8I0J6kS1iXo1w9vV6bvYg/PhyD9O4K17FBmEWskkvJh7I1vQIX
 I13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9BQv1kTB2L0mnCbjAHXP+un9EH4FVICZqpzI5v7B5ww=;
 b=GtkjGKGXs3bNDJMLAd37G1mug5jLkhHs84jdEA6O7cqcZYpvIvgrNHzxwvfRe0jIHG
 qSR/vQrKa2Q2K2UEHm1Upsypp+J+dbeTgqVlRQL2rwLcBtBlQJWf7/LOIf6hvowpk+H3
 MYH/6MTY0BEEYNzxYpS9BOKzNNYoaRu6eEvitgQbzM+ptTjPXzfGqtli6jde5tyzQOCD
 4SQHB4rrovDgdUPPXTjuFhWt1reOtU90E+sp2JJIVqAkViik3F69llRZndbK623nfO1D
 T1O1Y53+ETWpSwn98jdRk/6F92ro8HXWRsPXOcg7JgBwBFI8AVSeix4fTvbRsZHOetp3
 wEcA==
X-Gm-Message-State: AO0yUKWkFACrkP2kfuXJ/sxH6kRqZZ+frdnxUElIeWkbapY6UOzE5mCO
 G8CBkQ52Hf1634it1CMsfMsjiCkHLjJvMkAR
X-Google-Smtp-Source: AK7set8IcY09psHG2aE8UuOKisUVteXglH1QMFd1DkRDnUSgiIkC4WWXxPq+nCIqBL1yk+ACb9t8Iw==
X-Received: by 2002:a5d:6147:0:b0:2c9:ed98:c3bd with SMTP id
 y7-20020a5d6147000000b002c9ed98c3bdmr5054984wrt.60.1677506872002; 
 Mon, 27 Feb 2023 06:07:52 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 fm26-20020a05600c0c1a00b003e6dcd562a6sm9640860wmb.28.2023.02.27.06.07.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:07:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 071/126] hw/audio/es1370: Avoid forward-declaring ES1370State
Date: Mon, 27 Feb 2023 15:01:18 +0100
Message-Id: <20230227140213.35084-62-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

To avoid forward-declaring ES1370State, declare ES1370 QOM
definitions before its use in the chan_bits structure.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230220131837.26292-3-philmd@linaro.org>
---
 hw/audio/es1370.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
index 54cc19a637..ea76c9a734 100644
--- a/hw/audio/es1370.c
+++ b/hw/audio/es1370.c
@@ -256,6 +256,9 @@ static void print_sctl (uint32_t val)
 #define lwarn(...)
 #endif
 
+#define TYPE_ES1370 "ES1370"
+OBJECT_DECLARE_SIMPLE_TYPE(ES1370State, ES1370)
+
 struct chan {
     uint32_t shift;
     uint32_t leftover;
@@ -278,7 +281,6 @@ struct ES1370State {
     uint32_t codec;
     uint32_t sctl;
 };
-typedef struct ES1370State ES1370State;
 
 struct chan_bits {
     uint32_t ctl_en;
@@ -292,9 +294,6 @@ struct chan_bits {
                        uint32_t *old_freq, uint32_t *new_freq);
 };
 
-#define TYPE_ES1370 "ES1370"
-OBJECT_DECLARE_SIMPLE_TYPE(ES1370State, ES1370)
-
 static void es1370_dac1_calc_freq (ES1370State *s, uint32_t ctl,
                                    uint32_t *old_freq, uint32_t *new_freq);
 static void es1370_dac2_and_adc_calc_freq (ES1370State *s, uint32_t ctl,
-- 
2.38.1


