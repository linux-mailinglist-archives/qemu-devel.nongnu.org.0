Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D34C45DDD1
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:45:23 +0100 (CET)
Received: from localhost ([::1]:46722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqGw6-0004JJ-H6
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:45:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqGsj-0006Zx-En
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:41:53 -0500
Received: from [2a00:1450:4864:20::436] (port=43599
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqGsh-0002JF-Gq
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:41:53 -0500
Received: by mail-wr1-x436.google.com with SMTP id v11so12491117wrw.10
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 07:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ouEp36joxnPAP6ToPpz7+NhGlX24uSLIBMD0iYKDcl0=;
 b=ufgFGs3USfyxA5pMJVdlYx2+/RvpPow8mM2nO7AalKA1GdSxmL7nhBvLKI2yOek44B
 lQlSYGeQaDFXRx+cJ8OXO2HGYyRQMP2fTfIlvMj4mRT/JtD4oFVZU9PayTNdwaYTIo1r
 cSKjRkXTBTr93LvBvnZk7ItvmXMCU/qTvie+rnU5gYaFtFTrLbn+xOVrsl/YOv80h/o6
 Nq1rBoZsfM0GaBd9xvUHaDixHhijstmuEK4tJBftdPPyiH6RTJqhErCwTQX/ngWLl5QV
 H1FCKGhXTcf+oK9ggnYWDeAnUsCeilPoqprvY+UId8xxwSPBA7GL2UPGnhQrGwS+1Nqv
 LlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ouEp36joxnPAP6ToPpz7+NhGlX24uSLIBMD0iYKDcl0=;
 b=sF1zO8zefsBMFvA5fAZbOasj8wAq4sEev+wNeyEK6JcbsX3SoadFJX+cy8oR4XD+TA
 YqlUi9cq8bWC82ov2OdD2azERuaTdP/B/eNcneM3QA+qN2SMzr+7RxAWcdoUVTHOEseu
 LIe9Z5K1vOp9AER/9hJEKzsJE0Y1v5iNuL8qE63GeYPD27vfIJamZ/F+7udlFYNkuT8S
 WC3qQTQuuZRcQ0r5vHXgJhfpzrjIrJjbZjPL+VScG7k1xU2J2UDalVnEms/j1PVRxUvV
 KeHyizdrS2WvBcGsfBXN5QmS4Y+vcS99oHZX/ZxsNVAI15vMouiSwPtfg6Y0dS4/10XZ
 T5SQ==
X-Gm-Message-State: AOAM531mkYuovirnh4H88mVbeJRcQjbILRpG2LsKQFPLRK5yfjHgxmuT
 x41i8IvuJf7oV/cysIEYwEA0XQ==
X-Google-Smtp-Source: ABdhPJxpuk5exdp87E4exQMorVIc8Rkqu6LkM0MPGHITyqSt7w9gzpwEf1w9aka2W9DxppeoogF7WQ==
X-Received: by 2002:a5d:4d11:: with SMTP id z17mr7453235wrt.458.1637854910126; 
 Thu, 25 Nov 2021 07:41:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p13sm8243188wmi.0.2021.11.25.07.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:41:46 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3EA301FF9A;
 Thu, 25 Nov 2021 15:41:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 3/7] tests/avocado: fix tcg_plugin mem access count test
Date: Thu, 25 Nov 2021 15:41:40 +0000
Message-Id: <20211125154144.2904741-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211125154144.2904741-1-alex.bennee@linaro.org>
References: <20211125154144.2904741-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we cleaned up argument handling the test was missed.

Fixes: 5ae589faad ("tests/plugins/mem: introduce "track" arg and make args not positional")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211123205729.2205806-4-alex.bennee@linaro.org>
---
 tests/avocado/tcg_plugins.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/tcg_plugins.py b/tests/avocado/tcg_plugins.py
index 9ca1515c3b..642d2e49e3 100644
--- a/tests/avocado/tcg_plugins.py
+++ b/tests/avocado/tcg_plugins.py
@@ -131,7 +131,7 @@ def test_aarch64_virt_mem_icount(self):
                                                  suffix=".log")
 
         self.run_vm(kernel_path, kernel_command_line,
-                    "tests/plugin/libmem.so,arg=both", plugin_log.name,
+                    "tests/plugin/libmem.so,inline=true,callback=true", plugin_log.name,
                     console_pattern,
                     args=('-icount', 'shift=1'))
 
-- 
2.30.2


