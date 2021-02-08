Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B79313D8D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:33:24 +0100 (CET)
Received: from localhost ([::1]:37012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BLf-0003ia-Fb
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:33:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95pk-0003jm-3l
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:40:04 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95pO-0007jK-Kl
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:39:53 -0500
Received: by mail-wr1-x42b.google.com with SMTP id g10so16944043wrx.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ubNATQbmg8iLajRmP4P0Pz9JUdOIhvXA6u0rva7SAvE=;
 b=b+Dyei4ynkXCJhzfPoJBcTK3PXpDQwCoBWYD8M1PWDopR4kz14QgiQCbGRfcqqT4U0
 oDOTWxBub7JLhlzOS/kbMsstDR1szHn3GqB1kiejAzdR1svDKta8YyN9HpYefpa7KPe0
 BK596Xj6DSs8qGwkqMr2qcVAe/Uq+qyRCmVTBzTs3HKU8KqUcejR+yFDlGBGCIVHaa8q
 QaudGjaFw6+jabOyG63yKfuPisSU/ord6/aDwMtdlCEJiRoRjWhBikteVpdE6BohMBI1
 XY9h3+xlx6/Ke7C6tKELuNUkca898eyEUuESadHV8Dg17xFWHuK4axW7s6+Cq1SiolDJ
 hdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ubNATQbmg8iLajRmP4P0Pz9JUdOIhvXA6u0rva7SAvE=;
 b=SwHb7wXW31vUAe/BodPP+5SO2lyn0B0/0YyG3ZU1rbVL9BqPtPNXKNcKNAks6ZkyVq
 06rsI7/GahxKUMoE8ootAMPOdV606Ddq0OUXzL3vq4hzZTRjLrR2HFvUbfFKufsWmx2o
 xyAJaoYer0PLQLBIHC6MUrBdhpQX3K8joN3j3yILkdNXB7WAcglnYQza18cDMJE/vnrZ
 OCOUhmIHTaWnPDW8gVi2AmZdM0teB/dLCr97Sn34kdmABYRyl6/PwTbF4UVkLIrSGYme
 hB0kjsAAYNzg58/jMsVbRzg8+Ade5VOXERkB09mUafnPu+B8DxbtvZmmorOjDe4gdOyD
 EMCw==
X-Gm-Message-State: AOAM533FgonLOW61YLxo08DdCOhW905nbAmIIvuYrYu5NK3hTo8YU6k0
 VDzF5t36fnAobYMjcahuSP8vNHg5ccKycD3W
X-Google-Smtp-Source: ABdhPJyVB5eWyupNF+0q/ZD8muqjSINuDZwyE5nz4+QDqtlAXOXUwvgbLfeY5vLUYlbipOjOqoHH9A==
X-Received: by 2002:adf:ecc5:: with SMTP id s5mr19180471wro.423.1612787913370; 
 Mon, 08 Feb 2021 04:38:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k15sm20167889wmj.6.2021.02.08.04.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 04:38:26 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 487B01FF92;
 Mon,  8 Feb 2021 12:38:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 06/16] tests/docker: alias docker-help target for consistency
Date: Mon,  8 Feb 2021 12:38:11 +0000
Message-Id: <20210208123821.19818-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208123821.19818-1-alex.bennee@linaro.org>
References: <20210208123821.19818-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have a bunch of -help targets so this will save some cognitive
dissonance. Keep the original for those with muscle memory.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210202134001.25738-6-alex.bennee@linaro.org>

diff --git a/Makefile b/Makefile
index b0dff73904..d7fb6b270e 100644
--- a/Makefile
+++ b/Makefile
@@ -305,7 +305,7 @@ endif
 	@echo  'Test targets:'
 	$(call print-help,check,Run all tests (check-help for details))
 	$(call print-help,bench,Run all benchmarks)
-	$(call print-help,docker,Help about targets running tests inside containers)
+	$(call print-help,docker-help,Help about targets running tests inside containers)
 	$(call print-help,vm-help,Help about targets running tests inside VM)
 	@echo  ''
 	@echo  'Documentation targets:'
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index bdc53ddfcf..a5c1e4a615 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -1,6 +1,6 @@
 # Makefile for Docker tests
 
-.PHONY: docker docker-test docker-clean docker-image docker-qemu-src
+.PHONY: docker docker-help docker-test docker-clean docker-image docker-qemu-src
 
 NULL :=
 SPACE := $(NULL) #
@@ -218,6 +218,8 @@ endif
 	@echo '                         Specify which container engine to run.'
 	@echo '    REGISTRY=url         Cache builds from registry (default:$(DOCKER_REGISTRY))'
 
+docker-help: docker
+
 # This rule if for directly running against an arbitrary docker target.
 # It is called by the expanded docker targets (e.g. make
 # docker-test-foo@bar) which will do additional verification.
-- 
2.20.1


