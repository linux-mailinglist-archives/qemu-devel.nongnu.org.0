Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925F140D2E5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 07:41:02 +0200 (CEST)
Received: from localhost ([::1]:47142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQk8r-0004Uy-3P
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 01:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mQk62-0003ly-7o
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 01:38:06 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mQk60-0007j1-KM
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 01:38:05 -0400
Received: by mail-pl1-x634.google.com with SMTP id n2so491314plk.12
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 22:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sxm0iKDu0ghxity7dWW1SOPKYZ5kJbuYk8sL/Nimx5w=;
 b=MI9ZfClzw/3yN1zyVOQ0A7UD2WmWepGfNsUjdWb3lEe9PJh/U6s+T7flFduZ0zg5ny
 pTRyWA8KE7cXrWZbJe6r8E/kS65njuemzkIkXAZkAf4CQorCDopNy5HY0M+dPiQiqE0O
 Q/3ySQIx5AT54UPK0Dv6mszXzJfpwD7H1Rxch3noTZzGcFrPnzI3RNBAzW8LlDVPlkyY
 +7uKRv/qKtIySxnA70Fcay5sR3e8/Ce115IxRjXDlhmrVlq5BFUM0tXVbSOZW0wE1aNH
 GzGmF0Jj3XOBUbMl1+VO5qI3kaCtrl5Cjeqk97uG9er3ZGDVRv2gmv61UV7GA5iwGieR
 7xLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sxm0iKDu0ghxity7dWW1SOPKYZ5kJbuYk8sL/Nimx5w=;
 b=gd/8X2cqjxH2ansaiZVkUnsaaim2b64A9RLLJBoLyffNWnz1Kh3ad0FkL3izb+SgUZ
 ANLKNCXx7b/NTcpiQb9k3DyCSYkjX5Ln5fgXjJrFa1eYlDk9wm8gSbSubUQ3EKg6bTNh
 B1DgFMOAhi5ah4wellZt9V0MarK5ipUHzkXgu1BshzkX9M5FruJbjQDCjckILezAv8So
 8saJFtqD3FKQFai89EOE/jwwvoFNkEo3O8zn+pltrIA5dk684J12eZRqDJOZ0dgZyxRq
 RTvDB12ScMGfaCiOW+wlwMVmoZNeZQs8AsXgCTJvwDvQSJTOfrld1/uVikBjBr+rVQVI
 JgHQ==
X-Gm-Message-State: AOAM5325z0fjT+lDYahri50J0wxxIpPf5kFpW3eKIWnJuSvJWfAOhwEN
 SwHCR83pPBYEIFX0v0aMagOb1RWHp5ZiBw==
X-Google-Smtp-Source: ABdhPJzJlfoJ03l2lpWXqWNmiXOXWyZDAdOS8pEW8kS1cKwMPamEo2cae9Kq7LwNNb0Wye6IhDeDew==
X-Received: by 2002:a17:902:9692:b0:13a:2554:9646 with SMTP id
 n18-20020a170902969200b0013a25549646mr3094011plp.9.1631770682014; 
 Wed, 15 Sep 2021 22:38:02 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.233.134])
 by smtp.googlemail.com with ESMTPSA id cm5sm1305086pjb.24.2021.09.15.22.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 22:38:01 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: add myself as a reviewer for KVM guest cpu
 related changes
Date: Thu, 16 Sep 2021 11:07:33 +0530
Message-Id: <20210916053733.3457822-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I have looked into cpu features for KVM guests as a part of a different
project. Would be interested to follow and review patches in this space.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6c20634d63..3a3167c499 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -364,6 +364,7 @@ Guest CPU Cores (KVM)
 ---------------------
 Overall KVM CPUs
 M: Paolo Bonzini <pbonzini@redhat.com>
+R: Ani Sinha <ani@anisinha.ca>
 L: kvm@vger.kernel.org
 S: Supported
 F: */*/kvm*
-- 
2.25.1


