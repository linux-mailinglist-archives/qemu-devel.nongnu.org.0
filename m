Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90853646A9
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:03:24 +0200 (CEST)
Received: from localhost ([::1]:42308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVQp-0003ag-RY
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIY-0003Ih-FD
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:50 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIW-0006xZ-MD
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:50 -0400
Received: by mail-wr1-x42a.google.com with SMTP id m9so21618228wrx.3
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 07:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VsOEBZtB0HF2JImaMnITvaw+tRLQeXiNM3E9i7SwoP8=;
 b=GFN1+Rn29/ViShAWf0FgNR5ErIat2oYslMJfj8B6eKs5YtjBg1izAALZNgsZr+1T8l
 IL6x85VQyVaKjWnyBfIC+yjSDaHlxlKmCTA/s+SS/+PsHHjMM36iDdVNxa2LcQJjK2bk
 dj2jeJRBtElWcewQIp6qh5MoUef9IG+7kfOxkqVoQscopsGCpBcI/Uzren2zAn9GmGlm
 zIphi4mPF0CN5fBz5IOdoJHO7nT1/A1lfzW3yrNCg7TqEdBb50sTv27VNSGyvslP9FZ1
 yMbp616g+CEauDWhEkBuXfFalZMW/Rt6YC8l+k8JsIYWupNzGoR2rH7hyH0z97wRZz4B
 6QiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VsOEBZtB0HF2JImaMnITvaw+tRLQeXiNM3E9i7SwoP8=;
 b=E9KRkin/U02Ezk2OvBCm5ajmfcFQeKNEeeeURMIqCXqFyKSLLElXqvCvSY1S0De1YV
 ++wBRaMJ8TERYOh3KIMR9uBXouyRAO6Ec5pR1Z4mZaHiBL8DgWFTWleUhAkiFnThcdMZ
 +NMIi0sVHIZdHzkU+Eam5Jx8sN9yTHA1DseXzlwkXwKPE/oPIoIDJMVM296D05GJVJdd
 S5OwpyGmhzktgOiS59oYucYKkEG6+NlXAqxOX2MD3lB05vgBn7uKx50HA1dUNOwOR5B5
 FoAjkidfVy50qQQgBii7xSq+g3RbKw8+Hp8jM0WrlvLq23p57casJVBqX/92Za8JlwHk
 iSMQ==
X-Gm-Message-State: AOAM530PVqGJKuEsswH/3AHYGwzlSXttt4q/FdK+KMaF6UMaVDpByHdM
 lnhUANoOzKgMTT1oKwRtVN9eHw==
X-Google-Smtp-Source: ABdhPJxu5ieH9wMljB0q4uOzAxCzIxMVCmsBi3qcZLZgN++XgkzcBXyNLESWP2nQUe43AXo+6HzXdg==
X-Received: by 2002:adf:e650:: with SMTP id b16mr14764273wrn.273.1618844087330; 
 Mon, 19 Apr 2021 07:54:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 66sm23752239wmb.36.2021.04.19.07.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 07:54:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BAECA1FF9B;
 Mon, 19 Apr 2021 15:54:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 12/25] tests/tcg: Run timeout cmds using --foreground
Date: Mon, 19 Apr 2021 15:54:22 +0100
Message-Id: <20210419145435.14083-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419145435.14083-1-alex.bennee@linaro.org>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

when trying to run successful short tests from the Makefile timeout would not
terminate. Rather it would wait until the time runs out. Excerpt from the
manpage:

--foreground
    when not running timeout directly from a shell prompt,
    allow COMMAND to read from the TTY and get TTY signals; in this mode, chil‐
    dren of COMMAND will not be timed out

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-3-kbastian@mail.uni-paderborn.de>
---
 tests/tcg/Makefile.target | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index cab8c6b3a2..b29fae4630 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -43,9 +43,10 @@ quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
 
 # $1 = test name, $2 = cmd, $3 = desc
 ifdef CONFIG_USER_ONLY
-run-test = $(call quiet-command, timeout $(TIMEOUT) $2 > $1.out,"TEST",$3)
+run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2 > $1.out, \
+	"TEST",$3)
 else
-run-test = $(call quiet-command, timeout $(TIMEOUT) $2,"TEST",$3)
+run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2,"TEST",$3)
 endif
 
 # $1 = test name, $2 = reference
-- 
2.20.1


