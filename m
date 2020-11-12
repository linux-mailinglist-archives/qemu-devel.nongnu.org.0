Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A572B07C0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 15:46:35 +0100 (CET)
Received: from localhost ([::1]:43172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdDru-000665-A6
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 09:46:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdDmN-0000ci-90
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:40:51 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:53210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdDmK-0003kQ-1R
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:40:50 -0500
Received: by mail-wm1-x335.google.com with SMTP id 10so5483570wml.2
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 06:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IgyBRSdkiFG9Ecsso5QqbbzLRg/ym4sdq7093XNdiVY=;
 b=O31HsXlMzvd3BqVdh+gqX/ImH8vHauNhSMvDYOCz8UZkYVLuRTEDaLJg2qaYY7tUrF
 BX0uowVHyBrBxHcl3qc7m7QVx7jWy6PY4AHQtgluDPHbzve9xoIYxoflqWUpTOTm80n6
 RodVXZZnpUaDPOlE6Nq5mNlMyT4eg0XSjxEyXHEawO0G6fxHvp8ivvzNiPNForiOkBbp
 8ejaEZJBAU1M2TiV1AN6PYpDQWXfIrNRYoXMxJBjCNpjfhpJfe/3gciV0RVaIgpJMrCw
 OLo2afwslmfE3UweeNi4EjM5SGUsCQd2j31TunvE9cfQrV6h3urxa2Uux8q7djJLGXVh
 qSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IgyBRSdkiFG9Ecsso5QqbbzLRg/ym4sdq7093XNdiVY=;
 b=YK+cvTkjAX+RGKH0IOhfcJw1g7aW8Svw6gLb+Oz+JmfVy6V/NDwHNvARbu6eAwT0KZ
 0kroUtxqqy3b/UStQji60ArJQZiqKOIyrkAZx3un/y9SCG1XTPgtp9AwCkC+SiPJgC2W
 5nKLRKrV3Yc4poYRMBabSvblAqdAAAulVHewYzzS8n73aRYOnYyKVG09rUD+NOhdah8P
 k6i1y4GYlNWrckrFDsElsaFY9QwLQnSCJPJnV/I0od9NwSk18rFfj8S42rL+6AgA8aS1
 4/xGUWZPrwY436pvWATEGXkLKK7BxWhgyEE+sy5ik3cz8m8PMoeU1l+bjT+2FsWiXnwM
 eYPw==
X-Gm-Message-State: AOAM530o7l+nZc6eict1r8Knw4naHgL6EtUiRANJXKruy6bcxv8DUuHy
 QeCJwbww2P1J4jK/uq9CFPSXJ+HQ/oiNgA==
X-Google-Smtp-Source: ABdhPJxhFL1vXf9z3Y8IKGyoB10IKCYcojtE7pTdU+NL5LUc7U+7BfouRswWrurNtYKV2Q74hfAsDQ==
X-Received: by 2002:a1c:9ad3:: with SMTP id c202mr19786wme.43.1605192046246;
 Thu, 12 Nov 2020 06:40:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k16sm7410907wrl.65.2020.11.12.06.40.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 06:40:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [for-5.2 2/9] docs: Move cpu-hotplug.rst into the system manual
Date: Thu, 12 Nov 2020 14:40:34 +0000
Message-Id: <20201112144041.32278-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201112144041.32278-1-peter.maydell@linaro.org>
References: <20201112144041.32278-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The cpu-hotplug.rst documentation is currently orphan and not
included in any manual; move it into the system manual.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/{ => system}/cpu-hotplug.rst | 0
 docs/system/index.rst             | 1 +
 2 files changed, 1 insertion(+)
 rename docs/{ => system}/cpu-hotplug.rst (100%)

diff --git a/docs/cpu-hotplug.rst b/docs/system/cpu-hotplug.rst
similarity index 100%
rename from docs/cpu-hotplug.rst
rename to docs/system/cpu-hotplug.rst
diff --git a/docs/system/index.rst b/docs/system/index.rst
index d0613cd5f72..0f0f6d2e99d 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -29,6 +29,7 @@ Contents:
    tls
    gdb
    managed-startup
+   cpu-hotplug
    targets
    security
    deprecated
-- 
2.20.1


