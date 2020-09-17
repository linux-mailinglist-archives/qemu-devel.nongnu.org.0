Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104B326E9AC
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 01:59:05 +0200 (CEST)
Received: from localhost ([::1]:35392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJ3nr-0005Im-K4
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 19:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kJ3mL-0003kf-Vc
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 19:57:29 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:45130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kJ3mK-0006du-8z
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 19:57:29 -0400
Received: by mail-pl1-x641.google.com with SMTP id q12so1981938plr.12
 for <qemu-devel@nongnu.org>; Thu, 17 Sep 2020 16:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uTrm0sdq7gARiBpxaC3cYgqckLUxE92nb3e9fV7DsLA=;
 b=l30gwEIFVxytLmJeEP0GRYF9BTHFlcbeB568YVbbigVaClybqQxlk78bHOdltWILne
 aMEHpVicYHW4pyL+aWBnU4SC/0m10IisRILhuITrKu/4b6ltIFm0K7YqQrZjZVczYdiN
 SN8an7OzmDTc7GGzz7GbjMzk4UvPza9lEFAWRFAYMrtkHSZriklcsINIykyk/jtbs49Z
 weYTtCGA6reruFPgHl8QX7BwFh2kFezej+bWcD17Y+KE2yZhpO0AyJmq3OtASYLAYW37
 kBHsr9lFKYGMbIW3M51iQCKO/GxUYxpoqvRq5yVYWT0yPxCW4+RS4WejkgiN4VocmHhv
 b80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uTrm0sdq7gARiBpxaC3cYgqckLUxE92nb3e9fV7DsLA=;
 b=fH2NsZCwnzpODCUI6ENmQz/kBxeRytCYg7LbY+B+9zvZkyx7JMVuafKmktlsLMfR3m
 Jg5T4uXWyFJeFoLUnO48m6SunEePRjy1Xzjeum2KKRvlcywKwS5TcpkrgfL/ZnfaL/oJ
 rkZT3k3BB0ZAw+3eTdJ3ect+0lR87WqKvBoqPWPAP2SIaTWmhSC1lay5EXFOM2Eg0j+2
 zXLHswQfVsN0umZUGfJJca4pogr2BxZNr+lJhIulEr5CQUzlT7HeUUoAA3axzsx0hosm
 a0De9ChF2RD2PfdQkHRj4RN0+UG9UiztwmN1+P5Cj0VzI/O+vUynw4uyVTPoZSbcvl/i
 de0A==
X-Gm-Message-State: AOAM532DuTllCRZAGkL70gFYhP23z4OJeEhyZ0S1v84j7uSZAmfetnEz
 g9vMUshC6SHYWEMsAXZ0dqW5I/8eUJBGPg==
X-Google-Smtp-Source: ABdhPJw/1/230V1gHJFq9r09RNJbzyy4VR/lRPsXyRY5XBZLCzCIapqVIgyEbfeoe81C2f/QyT4Afg==
X-Received: by 2002:a17:902:fe84:b029:d1:e598:3ff6 with SMTP id
 x4-20020a170902fe84b02900d1e5983ff6mr13364654plm.48.1600387044921; 
 Thu, 17 Sep 2020 16:57:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id m13sm772699pfk.103.2020.09.17.16.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 16:57:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/10] capstone: Update to upstream "next" branch
Date: Thu, 17 Sep 2020 16:57:12 -0700
Message-Id: <20200917235720.2685978-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200917235720.2685978-1-richard.henderson@linaro.org>
References: <20200917235720.2685978-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This branch contains a number of improvements over master,
including making all of the disassembler data constant.

We are skipping past the 4.0 branchpoint, which changed
the location of the includes within the source directory.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 capstone    | 2 +-
 meson.build | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/capstone b/capstone
index 22ead3e0bf..f8b1b83301 160000
--- a/capstone
+++ b/capstone
@@ -1 +1 @@
-Subproject commit 22ead3e0bfdb87516656453336160e0a37b066bf
+Subproject commit f8b1b833015a4ae47110ed068e0deb7106ced66d
diff --git a/meson.build b/meson.build
index f23273693d..4c92b43fe5 100644
--- a/meson.build
+++ b/meson.build
@@ -677,6 +677,7 @@ if capstone_opt == 'internal'
       'capstone/arch/X86/X86DisassemblerDecoder.c',
       'capstone/arch/X86/X86ATTInstPrinter.c',
       'capstone/arch/X86/X86IntelInstPrinter.c',
+      'capstone/arch/X86/X86InstPrinterCommon.c',
       'capstone/arch/X86/X86Mapping.c',
       'capstone/arch/X86/X86Module.c'
     )
@@ -701,7 +702,7 @@ if capstone_opt == 'internal'
                                c_args: capstone_cargs,
                                include_directories: 'capstone/include')
   capstone = declare_dependency(link_with: libcapstone,
-                                include_directories: 'capstone/include')
+                                include_directories: 'capstone/include/capstone')
 endif
 config_host_data.set('CONFIG_CAPSTONE', capstone.found())
 
-- 
2.25.1


