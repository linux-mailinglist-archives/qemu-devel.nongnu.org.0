Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D335639BEFA
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:39:54 +0200 (CEST)
Received: from localhost ([::1]:55640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDnV-0001J7-V0
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpDNT-0000N6-Nq
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 13:12:59 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpDNR-00028U-AH
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 13:12:59 -0400
Received: by mail-wr1-x431.google.com with SMTP id a20so10078149wrc.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 10:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YHX7W7pdovA8sEaHbdvBxPdYJmSQGO3xjxfiDb+VvUU=;
 b=rs7ezZV7gCdf3aUQB0E6qL/jm7MgBEpBi7CEhaulBEMsi6cOzQyepxi4s2BukgV748
 PwQ247qsBXs2KM6kwmf1JVDYtrRPHBiCn0kB+ZSCimu+BcswEbBXz6koH8Ux4OGTYbAx
 7opJTl1qdFOOEVsbJCJOCM6h7644KP2CDomrX4c+9buz2TkgtnosELU4xFvtVZVNxC/V
 d7Lk9g//cn0MXAhRg+Ztd26YTaW6Quxzpe1JRH48b2Cte7SfnpXcZeyi8zZgXbALfl/b
 c50SPeqIXBhNBiQpazzZMJHVzu1cZ98DQT26qGNZVHTxPlsHxSOZDA3VI1Wflh19dTtF
 CcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YHX7W7pdovA8sEaHbdvBxPdYJmSQGO3xjxfiDb+VvUU=;
 b=cua+OmrLg6ulPq10/wFun2Vc839AI8GfeS4f+MkbneT1WCJndJ3+O4RlqfDSTiq+Vw
 lW9IUdLYAtHQV4BG0ocDwwNI1G5ZLeJ4kvJbmubz8w0Ub6IwQ98n7JAZhWuV1TfjazoX
 xdPiB6bkUJa7tp04DwFVI+eLLoqhWfjBPQUTAjTt6jU8C6jAiyX//RUmQhleBmk8/wtT
 5mH/1PIVzQeDNBpbssAZbZW/T9pPMA7a9hgpSeRIXZ0IfFTK03GXEgonAsiUt0GPE4wu
 yCZ6d3gZOTzkkZEkF394W2LAvV5bCqZs8kni/myqkfCqSIQyM2U+xGK0v4Rqh1g7c/HW
 zTXA==
X-Gm-Message-State: AOAM533Z1pFcnehW/XMeSCN2fK56ERQO7yotQS6l55LHcpuvharNm4fK
 gz/47G0TxEtjcwOBTrFpZNUtZA==
X-Google-Smtp-Source: ABdhPJw07QOmfs5qh+xdFRfGSeyaA6eg15d+GHM6EbygIUisvL1wp2iFrzMrnJvK6EVG7yAuM4LdwA==
X-Received: by 2002:adf:df87:: with SMTP id z7mr5029279wrl.56.1622826775698;
 Fri, 04 Jun 2021 10:12:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m22sm1190276wmq.21.2021.06.04.10.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 10:12:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8150B20023;
 Fri,  4 Jun 2021 16:53:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 95/99] hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
Date: Fri,  4 Jun 2021 16:53:08 +0100
Message-Id: <20210604155312.15902-96-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need this functionality due to:

    /* XRAM IRQs get ORed into a single line.  */
    object_initialize_child(OBJECT(s), "xram-irq-orgate",
                            &s->lpd.xram.irq_orgate, TYPE_OR_IRQ);

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index afaf807c92..02962c0987 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -371,6 +371,7 @@ config XLNX_VERSAL
     select UNIMP
     select XLNX_ZDMA
     select XLNX_ZYNQMP
+    select OR_IRQ
 
 config NPCM7XX
     bool
-- 
2.20.1


