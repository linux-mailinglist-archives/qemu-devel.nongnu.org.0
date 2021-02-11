Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB756318A81
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:30:07 +0100 (CET)
Received: from localhost ([::1]:53702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAB6f-0004ia-IP
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:30:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4q-0002zZ-4v
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:28:08 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:34064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4n-0003sE-0X
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:28:07 -0500
Received: by mail-wm1-x329.google.com with SMTP id o10so5893626wmc.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gl9xFNM+9T4uY/Qi4zDURzY+BCcVcqbAc2SPVGPcuVc=;
 b=mdCp8tcfFgidK6CcmyPEDT62b/qVI8aObYy6MV9WCv4uRdNrXASAajo4shKynelgvd
 pS8Nk1WxRnRdazsn5zJrjiNxlEqujY1QoLT4EVYjpg+UorGK94zZOM/FO9oEGxWYV/bh
 +riFPBsP2KqyQ7+pJFS65ShPjKTJfb+zA8ekfJnJl5X7Ck/ik8DDpswdfpPHVh815GOi
 vHiHsqCY7ZjlBUooIrfhVtw85JCaBUkEc1KpxNldbsQWvHGiPKrEeL5YUDOGRsl6L0C5
 u6UPqk4u2wSjnwPKOD7LphjdgNaYY22ohfQ+WeQqQal/hlH47s5JaB5UEM6rnKxabB9u
 /Vkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gl9xFNM+9T4uY/Qi4zDURzY+BCcVcqbAc2SPVGPcuVc=;
 b=uiZLeTsxkFRlIUhlI+zNrlph4ppDoMFmMzodDmjsJysS14u8VC1YX35aSvFrs7ES1I
 gkpzkX/LcNec8EA75n18CmP/07g+8sUcReJf7SYJJ83CvFb+B23dCy2xy2dM1W79MP5J
 i+5vAc2bfCsY+g5HZYSs6AEncz+Uk/xYeSOjLYYVmVl7zSP6zlnSh4CRtOKmYuwwwpSk
 bnSmGuJJVyz3Cki6Pl5eKYRYP8id2lSx7PtWXC7C+0pukLT7YRt868aRF4zQ6qeDziVl
 HAF9N0u2Z/OYqUMcwbhxjAxoUSwRMjWb1T8GNLey0sRPb9boZjnYkYTb2138/8xcsV1U
 YUhw==
X-Gm-Message-State: AOAM530zD87k4C5XTvF2sS6hHzhigQJ0RDgMbbACmmB8n4PLSqHsfgds
 GlKlIMkU5u8/Hmc7RVi0hwZeGg==
X-Google-Smtp-Source: ABdhPJwVE8zrDWoa/9lLdwqWO3eT5hM9FKLwaJH8GMg7K3B0ySEpn8T79CoA2p/OtLCiSBYG/bw7Vw==
X-Received: by 2002:a1c:e104:: with SMTP id y4mr4719523wmg.89.1613046482796;
 Thu, 11 Feb 2021 04:28:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q15sm4890130wrr.58.2021.02.11.04.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:27:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AE1901FF93;
 Thu, 11 Feb 2021 12:27:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 07/15] travis-ci: Disable C++ optional objects on AArch64
 container
Date: Thu, 11 Feb 2021 12:27:42 +0000
Message-Id: <20210211122750.22645-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211122750.22645-1-alex.bennee@linaro.org>
References: <20210211122750.22645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Travis-CI seems to have enforced memory limit on containers,
and the 'GCC check-tcg' job started to fail on AArch64 [*]:

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
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210207121239.2288530-1-f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .travis.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index 0a4f38b9d8..fc27fd6330 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -150,7 +150,7 @@ jobs:
           - genisoimage
       env:
         - TEST_CMD="make check check-tcg V=1"
-        - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS}"
+        - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS} --cxx=/bin/false"
         - UNRELIABLE=true
 
     - name: "[ppc64] GCC check-tcg"
-- 
2.20.1


