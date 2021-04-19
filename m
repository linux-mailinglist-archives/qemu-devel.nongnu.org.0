Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA07364684
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 16:57:27 +0200 (CEST)
Received: from localhost ([::1]:53040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVL3-0004ju-RA
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 10:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIP-0002yj-1P
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:41 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIN-0006s5-HK
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:40 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 o9-20020a1c41090000b029012c8dac9d47so11367740wma.1
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 07:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tLKjqMKIjh3YXoNizCAFrfsiNgZ3bBB8hCFaWw47VeQ=;
 b=qg5j9pPoXKLLVMKjdZXYeB9xLDGsqNfcMjAlCvRQ3hBBPoQiIaaiBNrqtD0Ly3nG0M
 CKKkF93sSqAMqcLvfxWvfvgC48ZtAMKRdu8C23LrKWd6Q/TklIp1Z7tGAE+NstgaUlVA
 FoMAhL5shFM6ztdmOHKjUcYZcEMaVwuUcSPsNDG4AeuscDGs79pSuuB6yhWArCd72GH/
 hmxoDEzgKJc7jh6WWql+3BP1YYcE/0m3Ao2K7L87vSTh3JsWR73SxzKRjKfhdY5KSmD3
 VfJPB+xWqGWeGrwMWmdeJdEaD6bC05Rt36WcErywmeOJipEJvHRfxdxFyTbXvDWW67Oo
 17dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tLKjqMKIjh3YXoNizCAFrfsiNgZ3bBB8hCFaWw47VeQ=;
 b=lKwWbGXH7wtqkF0SjMPfi43SJMOmGMDhlwJTb8VXcrDVq4GNcY9o7zZ5/7VnsyhvH6
 2q90hIuWZNyHIL2r0H8vIqKDE6CDSChI3hjomV3VlPF6UMqDKuJLZaf8gdEt6eCD4086
 Q7aDB7aPSgmhF2OsOS0cswXE28vpZ9495jO8L1pAw87HGFxvmZJw5/NW9kPxSUEbON8R
 lZe2aeX1mZh7Nv995wxXjHgE1HCBUuiATjDPsXuY2N737STs5cPhcmjIs2E414GbGffX
 tk25AhubBecV9cyLDnK7DP/3mHcij/bNAsr54hJXgqkneKs+9lwzUyuXzsIUo/JCka7a
 MI2Q==
X-Gm-Message-State: AOAM533CXVORqMHULOIHLxYUujl7xAF3wF1yrs3sTNEZnlgTCTbo5yPa
 f6BCBq7b0p5D2S8Kanhpr2hpzQ==
X-Google-Smtp-Source: ABdhPJx+6wr4ze4OHgLKHdR21xOi/HgNALDa24qliHssL0BKtfx/oYO7NvPoGkhgwcIQ05er+6YcFQ==
X-Received: by 2002:a05:600c:3790:: with SMTP id
 o16mr17134396wmr.174.1618844077923; 
 Mon, 19 Apr 2021 07:54:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g9sm20127354wmh.21.2021.04.19.07.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 07:54:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ABF171FF87;
 Mon, 19 Apr 2021 15:54:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 01/25] checkpatch: Fix use of uninitialized value
Date: Mon, 19 Apr 2021 15:54:11 +0100
Message-Id: <20210419145435.14083-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419145435.14083-1-alex.bennee@linaro.org>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: fam@euphon.net, Isaku Yamahata <isaku.yamahata@intel.com>,
 berrange@redhat.com, f4bug@amsat.org, Greg Kurz <groug@kaod.org>,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

checkfilename() doesn't always set $acpi_testexpected. Fix the following
warning:

Use of uninitialized value $acpi_testexpected in string eq at
 ./scripts/checkpatch.pl line 1529.

Fixes: d2f1af0e4120 ("checkpatch: don't emit warning on newly created acpi data files")
Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Isaku Yamahata <isaku.yamahata@intel.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Cc: isaku.yamahata@intel.com
Message-Id: <20210408164610.14229-1-alex.bennee@linaro.org>
Message-Id: <161786467973.295167.5612704777283969903.stgit@bahia.lan>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/checkpatch.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8f7053ec9b..3d185cceac 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1532,6 +1532,7 @@ sub process {
 		     ($line =~ /\{\s*([\w\/\.\-]*)\s*\=\>\s*([\w\/\.\-]*)\s*\}/ &&
 		      (defined($1) || defined($2)))) &&
                       !(($realfile ne '') &&
+                        defined($acpi_testexpected) &&
                         ($realfile eq $acpi_testexpected))) {
 			$reported_maintainer_file = 1;
 			WARN("added, moved or deleted file(s), does MAINTAINERS need updating?\n" . $herecurr);
-- 
2.20.1


