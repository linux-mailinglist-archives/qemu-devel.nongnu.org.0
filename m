Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5613331B6A9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 10:48:56 +0100 (CET)
Received: from localhost ([::1]:34756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBaUv-0005b3-OB
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 04:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaPI-0000GC-EX
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:43:04 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:35122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaPG-0004RS-Kh
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:43:04 -0500
Received: by mail-wm1-x32b.google.com with SMTP id n10so8705757wmq.0
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 01:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sov8d2o/MDl4fBPHqNE5WPrOKr3CBeeeNgl6ZptC+Bc=;
 b=TLicSYJR7mZY3kx3s5MvAW508I8l9QiaOoTLgucMx/QtTj7JnuYAiWQnaTeFg2Vu2k
 FkWTlrc6JvwworMh2agnMYVtDe0a8zDTPZ8tMJxLcfL9ECJ05ZNW+vYkG93nMP2UwsYN
 fl9ioQkkNT5tDS4vea0kZ3oKrjk+dvxHIAyv8W391SbFbPxQ3o5eHQmD4MrnBtkrRQds
 APJUeiSMv1cYGJAJ8mp4QYWX2EJEu/PCXbV5GYQ0+1O/T2lZ4D6kQ7Q4EEUrwU6uohBG
 +M61blwJp8fywT16Gvnua4g5UTid2xkj/iR6l3lkwfnZfni4flMTbbFsT3hUavJDO1hU
 InmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sov8d2o/MDl4fBPHqNE5WPrOKr3CBeeeNgl6ZptC+Bc=;
 b=kQPNGKrNMoMUkwVup17ZGX302qw+XQGOtt/23NfImdJ/DosH4N+eHsnaQg1reszP0a
 MiH4YFhQwgjPQMupfbMnIFXknaC9xCfBEExq+rB2HoMp5kkhGAOniooPlhfYkFGmgfOY
 mUSp+bOYJuwEDRiFzIPwjiOmfG1i3RamHglrsnTQ9htzFT3Uwhc7NetOnRWWbBgkFn70
 MYMNbu2FLyHXk2/dog0WAbnj20l9Fx0sll5AnaxtI0LKPUqtwF/gizqNWxBZRMNDyvti
 UnTJ1M8ORrftrRwB0dIp0C6qbn5McwcdXpG3Z3+QDgGoMdDKjMaMOxZXiVpAsRHJcOdV
 dV3w==
X-Gm-Message-State: AOAM531VRVUFO83wyPt6+GHVnvPW+ut2HebfAWLo2oDghRMjzbPs8ndI
 qNWv8qd5lhi/gkewCaThYTdaQA==
X-Google-Smtp-Source: ABdhPJy+0drHnmCPoOakN1R1HJ1sTpZxEOjEaco9OUDtxpo3KB4dI79TTn9c82o6wuz5X44a/uH9HQ==
X-Received: by 2002:a1c:f604:: with SMTP id w4mr13758180wmc.39.1613382181140; 
 Mon, 15 Feb 2021 01:43:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s5sm3619167wmh.45.2021.02.15.01.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 01:42:52 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 990981FF93;
 Mon, 15 Feb 2021 09:42:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 07/15] travis-ci: Disable C++ optional objects on AArch64
 container
Date: Mon, 15 Feb 2021 09:42:36 +0000
Message-Id: <20210215094244.12716-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215094244.12716-1-alex.bennee@linaro.org>
References: <20210215094244.12716-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210207121239.2288530-1-f4bug@amsat.org>
Message-Id: <20210211122750.22645-8-alex.bennee@linaro.org>

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


