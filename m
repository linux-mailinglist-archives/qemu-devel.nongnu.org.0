Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2C0311FD3
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 21:01:56 +0100 (CET)
Received: from localhost ([::1]:43698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8TmE-0007za-Hx
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 15:01:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8TiQ-0006Yr-7y
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 14:57:58 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8TiO-0008Ji-LO
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 14:57:57 -0500
Received: by mail-wr1-x42b.google.com with SMTP id q7so11991765wre.13
 for <qemu-devel@nongnu.org>; Sat, 06 Feb 2021 11:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PaJDoAiIT/dL/pQTIgpahxYqI5DKx1z8HPhThj2Zci0=;
 b=Y9DbLcw7zeoQEe8xh77AcgWBgcXWeJvT3zGvtklQZubTJ8EuUsyAQlbcMOlabYujp4
 0MQFWEsXDxui4kvtGQVbbckzJwVMrugOyvpQAfi5QyqSd/DkylEvQt6HB4CnNAjSiQfy
 qnIhUIU4rkU+apOwCWBMrH06fq2id6iwrOJ4hBmtwa/TwJV7oYCzzQJzA9Cpsd4h2uhg
 8iB+eHK0AB6ZTte5/RCqNOrlWjfk2PpNbykI1GJ4MWB9d98SpUmdBcpR6lTpbvRKy0CH
 U1WiKnODMAlZ8bkoEyDFQ33XHVUgbIIr6wEnlUJIavwqz49xatQvrnRqmuub2or7TcGx
 BfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=PaJDoAiIT/dL/pQTIgpahxYqI5DKx1z8HPhThj2Zci0=;
 b=t2S7vI7zUj50qO2Z3mxWqzzhX6AfnJCP6fWywyt7LMSUuxoCXKZLNuiZlhdoiln5LZ
 P1LcU+mdZn2mDr0IVlbznuOpmeW+VFK7rdgRFposMwU2broOM4q6KE1VamWUPFPtWLqD
 iuXKN/FbSzH/caR/t4tSb9Wm4PnAjJmG2r6AVsV5nQpVy6zyVv+K+D39JtReBFV5iISE
 4FZdJav5TIR+rOk4eku8XYOB0Z/OU8CUC7pbOpOJcVrnNs3IMuvA4EUWDfGGxZo4iB4/
 LnmLZktNZYmat1FXJsmtW8c2lzbYcUL2U8Qnd6ENrGkfIvlGQwzh6hqReJUcZKcydczW
 I5yw==
X-Gm-Message-State: AOAM531U/EytWq63RRcJMIzmZGXwittUQmDqPPSzZrtlWSuQY9BWiRqV
 BPHrXEEbRByrrLiOTA+F/Dju0ks1EDY=
X-Google-Smtp-Source: ABdhPJyK4ERJNAJ4KCRXV0DP/5rgkXc5+JLLOpjbX2j6kbcgI968ob9LhckXKKMoUtOZGa8ORi+omA==
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr11245083wrq.136.1612641470996; 
 Sat, 06 Feb 2021 11:57:50 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n9sm17818567wrq.41.2021.02.06.11.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Feb 2021 11:57:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] travis-ci: Disable C++ on Aarch64 container
Date: Sat,  6 Feb 2021 20:57:48 +0100
Message-Id: <20210206195748.2241725-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
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

Disable compilation of C++ files until we have a replacement for
this job on Gitlab-CI.

[*] https://travis-ci.org/github/qemu/qemu/jobs/757819402

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


