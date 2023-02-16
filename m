Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEF0699ADA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:12:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShna-0000uZ-To; Thu, 16 Feb 2023 12:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnW-0000jO-4y
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:54 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnU-0007zA-Ee
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:53 -0500
Received: by mail-wr1-x429.google.com with SMTP id d4so2453371wrj.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=evm0X8KpwexdZmoAXGBwk/4u+Ox8rhWrbCkUwekUiFs=;
 b=o8Nk+uCCSc1IK7uSlxoYhce9KLeTEePoVsBNjtUEbl3jZxX9RLPX6+a1CD70Vw7oEn
 z9oiieAAwE+Pk+fzMnr31FEZGbYNWaL3HzBkL/Ftza2ANmXi/QceiHWkf8Da1gctIyij
 lRKI590+aBY98XPSpydGNZAEzdk9ZxK2+dmZD0TYqdu6EcgX+5RKxNuTkkUbs5Yy8oID
 ZXIQ2wyy9RlLt1J/4n4tb0scPG8j/9qlWTv/uS3+W0rDhbZrev8peVZsBZXNT89dC2bw
 MZYbOFwkt6jxKBbU76pyocyIOyhZ1/MQQxeoS+VHNcGiU6IGrFQnFx14qOlPTKnqVU0w
 R1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=evm0X8KpwexdZmoAXGBwk/4u+Ox8rhWrbCkUwekUiFs=;
 b=lP7yU29H5eAROwjriUFsLyWcFv/1NStMRXg8I1WERy2ce6tEelEis3bu+Y82j/WUwR
 15P8xgV4HcRikxM6kURdVj3S6JLyW12E574FxiE9/BRKXCwU7snaxOllymSpvSz4U5Bb
 xLpr3TdXHE/O9nQg5lUbhkLzcyyH1dteKynHDKkvhX0sTGcDv7x+Pes/hLT6zvrh4W5F
 O7YT/H8oZatERKzDdP+lIlLEO/OHJ/+22bt+wZhExJ7UBeWKfvQwroAP5w1dQti0GN7n
 D5ODp4dUhDlT1QQ5w+Kcv6FW/mHSiHlz1ratE+MuDtgMiU7aMTVVf7nQpaRHwvo7hT6m
 UoAQ==
X-Gm-Message-State: AO0yUKVYPOLMoS/F+qQotNK2JRtB7kmi5vjP1wbm9SwnrW8FF9vl/GiW
 f/uhLrtkEkB6zoElYSQ2TCf8z8zZICcbpptb
X-Google-Smtp-Source: AK7set8VvcOYb/OkhhpIAFIC0bFowM1rWH6oVg8lNuRWgUQLyx8iTEuh6LpwX+vyLn4AapoAYn1azg==
X-Received: by 2002:a5d:640c:0:b0:2c5:52ef:b46b with SMTP id
 z12-20020a5d640c000000b002c552efb46bmr6519088wru.6.1676567511715; 
 Thu, 16 Feb 2023 09:11:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/30] tests/qtest: Restrict tpm-tis-devices-{swtpm}-test to
 CONFIG_TCG
Date: Thu, 16 Feb 2023 17:11:23 +0000
Message-Id: <20230216171123.2518285-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

From: Fabiano Rosas <farosas@suse.de>

These tests set -accel tcg, so restrict them to when TCG is present.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 222e1892fb5..29a4efb4c24 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -208,8 +208,8 @@ qtests_arm = \
 # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
 qtests_aarch64 = \
   (cpu != 'arm' and unpack_edk2_blobs ? ['bios-tables-test'] : []) +                            \
-  (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
-  (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
+  (config_all.has_key('CONFIG_TCG') and config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ?            \
+    ['tpm-tis-device-test', 'tpm-tis-device-swtpm-test'] : []) +                                         \
   (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
   (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
   ['arm-cpu-features',
-- 
2.34.1


