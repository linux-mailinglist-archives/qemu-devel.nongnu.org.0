Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C66691F61
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 13:57:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQSxf-0003a0-A3; Fri, 10 Feb 2023 07:57:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQSxd-0003Zk-C8
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:57:05 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQSxb-0007sR-SG
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 07:57:05 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so3984330wmb.5
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 04:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rBGJ/ZhXy98VsBlus7Z3MhlRHFgf7EUoDXRfC8PcIpw=;
 b=zPtFjQLaG+k122FoRvxVizF0tDnponl7Rw/xkpqgSIb+cBLSn+iFMxEMyva+qEl8SL
 8r8xJCA2wjFTvUw+u7Kr4+w3qZc+lFvP4q4hlI1rr4HQTDuNoMrhZojYae5ytgs/ie4B
 iBTbVGp4wGuq75uGxE+ZkO2zJdY9eKHXr9LW3h+k/MrgjPIzN+gtDiyRkdcZPXWFlVuh
 vLU0rzIrTphHY5DuJf0Z2PtEBQe8UuMebSEwNEp5KVJNBFHdPjHDYnpM/E8+9XUVLo8m
 GUyOwtM+nay/z/VbI2CTBo2xRQOlDqPQbSno5wYgYYK0qfnY9V+G3/4Ulg217iEnyrj/
 EPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rBGJ/ZhXy98VsBlus7Z3MhlRHFgf7EUoDXRfC8PcIpw=;
 b=ckZ0dDX26LiPBXd0HK9jg3QcJuFgQUZwputJNwJlE5GkvtcSBTiSyezLJ57CkE61Se
 v0KFZlS0TifdFkpCf+taJ94nUzmS/CNPlSv7pC0vfr/fjdnbBzP7vuf73OzCvBgmxctC
 58+tDgfpsXKU32ooH9yzQao7N7I1M3K7bzkceoWyMVpQhE411+FZQj2V+edD8LRgy03D
 rBz7fzC8hPse6NvK3rFrUzlwKbTxrUpkfce6p3zBs/8PJcy2oSxPHzymWo0yMuhEpnaR
 ibuI0d+qc0gasWdHnFAV+jayvFRNmpvolsRnAbYg1XWlo2GOy7ZbbR85T3Qhwl92/PuT
 a+BQ==
X-Gm-Message-State: AO0yUKWZLy/ibF7nbgbBfUSPwkbxt1walMVdcxPAkBN8w7O5XyH+wu8l
 QZz3XCp9PqV2kDdo8nHo7jBFvmNHw8cDVD4G
X-Google-Smtp-Source: AK7set/MWYifCooo/yeKs2nEwqIOWeyNeAQTMwwJOFV8Y6l44/OuZf6mRM+CgJ3QcunFSkLn2U+IDw==
X-Received: by 2002:a05:600c:16c4:b0:3df:f71b:3f68 with SMTP id
 l4-20020a05600c16c400b003dff71b3f68mr12771925wmn.39.1676033822113; 
 Fri, 10 Feb 2023 04:57:02 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600012c300b002c54911f50bsm1596725wrx.84.2023.02.10.04.57.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Feb 2023 04:57:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH] target/i386: Remove pointless env_archcpu() in helper_rdmsr()
Date: Fri, 10 Feb 2023 13:57:00 +0100
Message-Id: <20230210125700.13474-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

We have a X86CPU *cpu pointer available at the start of the function.

Inspired-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/tcg/sysemu/misc_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index e1528b7f80..e47db9376e 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -326,7 +326,7 @@ void helper_rdmsr(CPUX86State *env)
         val = env->sysenter_eip;
         break;
     case MSR_IA32_APICBASE:
-        val = cpu_get_apic_base(env_archcpu(env)->apic_state);
+        val = cpu_get_apic_base(x86_cpu->apic_state);
         break;
     case MSR_EFER:
         val = env->efer;
-- 
2.38.1


