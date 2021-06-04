Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F01239BD93
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:48:38 +0200 (CEST)
Received: from localhost ([::1]:48288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCzt-00066a-BX
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRJ-0002yp-Na
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:12:53 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:45657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRD-0003pT-A5
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:12:53 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 v206-20020a1cded70000b02901a586d3fa23so1645978wmg.4
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wONPc0qYV05aYWd43IzxOdQbvCsObFB2L5QRCtxqT+c=;
 b=blVjmi0T4xncD1CPiZb8+go4DchsTCsavQ/SW7q4YfAZ980JftA8hIkvZYSaKASpLL
 1rBo3U9CbrOFqI/wFr+7tRE5wjXa34o0IVgmCGX9AOqCEXlp/zhhKLLlB8HbJy+AVxDJ
 eDYy/1IhmgVx6hzorf4Z50IX5HDkvz8SUh6QPjE2Ck22Z/FhTHi8EXNk9Ei60mqVA2yd
 U2DOgpBaSk2SnyqJIhAoN7y4ActZKm8fpvTqto3igWttCPxAb9DbuiZCo0U1yrgqTMiz
 uBRac7AEjuFes/jC2Y3kJh6JMsZ34ql+grXjTOXE6usMrx8SQwPG0SaSKYXxo3Nf5fUs
 VNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wONPc0qYV05aYWd43IzxOdQbvCsObFB2L5QRCtxqT+c=;
 b=oXXnNVdhS0n4n6Czgf03P+WIOFuggXOrxwiqL2VVm7N9BSn9PKiNcZLN/s5GLYVaqI
 JQXxLiwWsA5icnWdECoBVnEd6s4ohtex3l8h/hfN5kjpQBvQTQO4kT21SXl2BAi2h1Ks
 bd6j2jnlceNaPict1A/5+u2ypAnVhWeYyS8m8KnflxRtz9Z/vRBZjL2KQ8mBOdZMzXtE
 ak+kVXJxzmyYDHGlCcjnyn77X4vZnlRS9vbJcz4JyMO9h72Fag8U9dxjw6l9YZpAnwFx
 ROw6wdPou68gxkUbHQk8+0B9E/XyC01h3wjsMphpjyGc7+RHGSuIoJ6a26G3CYB/puJu
 aZ7Q==
X-Gm-Message-State: AOAM533kE+C9TebPHjLP0La6dDzKySGm4WweVXiMhI1iCIVgprmqGuGH
 0y/ypVbe/49kJ9Po7NSCB0yF8A==
X-Google-Smtp-Source: ABdhPJzfSjKX8Cx12RN/EsHmSi18yPKEKbQ7A08bsWGI6hH65+G0+S4+scRK9mhU+BsuPMwottzaeg==
X-Received: by 2002:a05:600c:19c8:: with SMTP id
 u8mr4496800wmq.50.1622823165972; 
 Fri, 04 Jun 2021 09:12:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c12sm8185002wrr.90.2021.06.04.09.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:12:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1ABC41FFD1;
 Fri,  4 Jun 2021 16:53:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 59/99] MAINTAINERS: update arm kvm maintained files to all
 in target/arm/kvm/
Date: Fri,  4 Jun 2021 16:52:32 +0100
Message-Id: <20210604155312.15902-60-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 24e55954d4..95e836af49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -373,7 +373,7 @@ ARM KVM CPUs
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
-F: target/arm/kvm/kvm.c
+F: target/arm/kvm/
 
 MIPS KVM CPUs
 M: Huacai Chen <chenhuacai@kernel.org>
-- 
2.20.1


