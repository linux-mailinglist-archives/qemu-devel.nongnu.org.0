Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3928B311FD9
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 21:08:04 +0100 (CET)
Received: from localhost ([::1]:49032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8TsA-0001ys-Ow
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 15:08:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8Tq0-0000vQ-QD
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 15:05:49 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8Tpt-0003Mj-C4
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 15:05:45 -0500
Received: by mail-wr1-x436.google.com with SMTP id 7so12160209wrz.0
 for <qemu-devel@nongnu.org>; Sat, 06 Feb 2021 12:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fly1nuMO1CBfa+Xv5gvy1OuwtcWuV83Yw+hZyENa4Ss=;
 b=vKsL/Wg3FwFr6vaV7/AzCnij0zAfIiTq1AzqiV/9bnbEzvslAL36tpZnSMsHSrTucZ
 sDwEN2sjtv2wvdrQ+itACiS5QZLP5/q+OHIpSInWWlAOQnK2ABaG7j7XRNg9FiDZBXNs
 hgh4DHAwNpd6y7STur75c0tSc4f2ENZ7xnzBXQGnHC6UENbRTJ4YJ5fnLvKZBtR+J+bc
 jpClUO91hpmtm1MRFQN6860NiNnoaczAFSXLUEvx6RM/mfFPSP1HedkP9Q60afKfw4fG
 ZxDHVwluZLNQMoEAk7yl/yWoIK+P0ztbcKGVPNdB4l4UjkBnDXtU2Q8YGg2mn5QuhTGs
 1rdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Fly1nuMO1CBfa+Xv5gvy1OuwtcWuV83Yw+hZyENa4Ss=;
 b=rKTNEbC9691/SSuuhWA6W9c/FWeSNGLKPCaKZXsdRCChLumOibO6BoXGgfo4d62x1D
 V9xcQ3Gx0D36a+VYd5LInkolLKeA/nF7emYrufXLqVfQa/nZr4thDVmj04Y9by9rplL4
 lQx0udSUtTgY8oZ0xWenX1dM9amtLBFmurnO8csThAIakFozG6E09wZZjdDpFyJTIOnD
 uRbG0dyJoazNFK+GeQFk49m/LyhEeRshME/AHqfNpaN/dDo+bf0mXJoTR73HHgYGgkGU
 31gF7ENlJFXx1dSJGvk2U/Cp55jEzzbplRMSpoHcRF3GKVlTJb0fDZP8//dV3rVknkf0
 ITSg==
X-Gm-Message-State: AOAM5301A5SebgwzZJtbZYYV6ECyeqA57n2C/OwT4Ht6t5YUTIFVPi5G
 y3gny1MI/XDWuBkYCmBk3KR1v/zgE9o=
X-Google-Smtp-Source: ABdhPJxC7pFHLv7k5tuTjUN795PlsCTEozgC5SCdYWb6m43iUgPkF4zZwXtFGq/yA/s8gz45/2XJ8Q==
X-Received: by 2002:adf:decb:: with SMTP id i11mr11483924wrn.78.1612641939857; 
 Sat, 06 Feb 2021 12:05:39 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t205sm12620058wmt.28.2021.02.06.12.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Feb 2021 12:05:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] travis-ci: Disable C++ on Aarch64 container
Date: Sat,  6 Feb 2021 21:05:37 +0100
Message-Id: <20210206200537.2249362-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
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
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Travis-CI seems to have enforced memory limit on containers,
and the 'GCC check-tcg' job started to fail [*]:

  [2041/3679] Compiling C++ object libcommon.fa.p/disas_nanomips.cpp.o
  FAILED: libcommon.fa.p/disas_nanomips.cpp.o
  {standard input}: Assembler messages:
  {standard input}:577781: Warning: end of file not at end of a line; newline inserted
  {standard input}:577882: Error: unknown pseudo-op: `.lvl35769'
  {standard input}: Error: open CFI at the end of file; missing .cfi_endproc directive
  c++: fatal error: Killed signal terminated program cc1plus
  compilation terminated.

Until we have a replacement for this job on Gitlab-CI, disable
compilation of C++ files by forcing the c++ compiler to /bin/false
so Meson build system can not detect it:

  $ ../configure --cxx=/bin/false

  Compilation
                       C compiler: cc
                  Host C compiler: cc
                     C++ compiler: NO

[*] https://travis-ci.org/github/qemu/qemu/jobs/757819402#L3754

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Link to first line with error, describe Meson
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .travis.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index 5f1dea873ec..b4b2d66fa4b 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -261,7 +261,7 @@ jobs:
           - genisoimage
       env:
         - TEST_CMD="make check check-tcg V=1"
-        - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS}"
+        - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS} --cxx=/bin/false"
         - UNRELIABLE=true
 
     - name: "[ppc64] GCC check-tcg"
-- 
2.26.2


