Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F71F39BCA7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:11:21 +0200 (CEST)
Received: from localhost ([::1]:37984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCPo-0004Hj-BY
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8Y-0002mU-FY
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:30 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8V-0008VI-S0
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:30 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso8196130wmi.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TUAH7JH6sleif6Yi/np3XOEDj2fTn8clJjdpTJ+Ga34=;
 b=ujGNIWqbA5UJVSACD3kh2IHSs8XLv2gFrHwVH4KjpF01wDk4mOEyK1yPukApQGZAFA
 ftZwampw5bHyS6XePvbsZaVIK7L5TiEMsXcBrZdhRNmMsGaRjROThLBzOqICw7P1YknS
 C9cGsmtqOn49/QZr6i6ICP/llP5VSDRRlz4YOKcDTzVWLlmZSEOg1VHHC1MquiNmDnOd
 0lX095Kz+6WOpzrRWJO3GKOr5PCaA4uTxId8jJUQKAbHijHF3qTO0ejXGPuk/7ujKUNu
 KJ0o7e9VaGqKu1mb0MV0IsIWOxBNTGLETuRWKm+yDwURhyKlEUU54onyVdKXFDmZnKkY
 VPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TUAH7JH6sleif6Yi/np3XOEDj2fTn8clJjdpTJ+Ga34=;
 b=YqAwUfCGB/k/1N4Avr45texPxYzcLspZm4DjVqfvbpqiXmsM3WEkBW+5g6OuJm4Txd
 If1jIKD2aNRyUt/piU0X6f66RxCsKfjQhPRf9LL9Z3Sl+aY49nwdfOfXeLW3aAi0LfMc
 zBRmM5g8KzyGKr2RTt2PzmWHaKyf8dJxkZn/Fyo5WDhqJxjAkAZ9jgZNnnhFDdr9Y5AU
 w9UfP93k92Y0T97rNCJzya/KNEoY/LK8PDfkVlQ0GXeTBbJNIGUvOnPc6fzOuMNadCXQ
 hzJGr+rLtrGUgQMRM1606wcdrgsZKNDK3l0wInSRoMxSCxDAznYAgjXwrK4i7kZtBBQH
 YckQ==
X-Gm-Message-State: AOAM531aY+fxUPTsaPhrNgOTe6Dgk16hVvK+oNz6FHt+2DmKYBAvQlrg
 2s9wODD0eNumAJMU17g2/G/MP99Eod4DTA==
X-Google-Smtp-Source: ABdhPJwN7yHNbXjEeSpNqpSxh5+ShIZZhSbXwRml4aeT3QvbtnruJtOwiTz3x3VcWm9qpjDZJzPWVA==
X-Received: by 2002:a7b:c157:: with SMTP id z23mr4471975wmi.148.1622822006340; 
 Fri, 04 Jun 2021 08:53:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b22sm2782729wmj.22.2021.06.04.08.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:53:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7374F1FF9B;
 Fri,  4 Jun 2021 16:53:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 12/99] qtest: Do not restrict bios-tables-test to Aarch64
 hosts anymore
Date: Fri,  4 Jun 2021 16:51:45 +0100
Message-Id: <20210604155312.15902-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
32-bit Arm hosts") we can remove the comment / check added in
commit ab6b6a77774 and directly run the bios-tables-test.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210505125806.1263441-13-philmd@redhat.com>
---
 tests/qtest/meson.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c3a223a83d..2c7415d616 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -176,14 +176,13 @@ qtests_arm = \
    'boot-serial-test',
    'hexloader-test']
 
-# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
 qtests_aarch64 = \
-  (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
+   'bios-tables-test',
    'xlnx-can-test',
    'migration-test']
 
-- 
2.20.1


