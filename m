Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB0341DF2B
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 18:38:49 +0200 (CEST)
Received: from localhost ([::1]:49110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVz56-0007Sz-DQ
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 12:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVz35-0005Mg-8K
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 12:36:43 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:34372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVz32-0006A4-6C
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 12:36:43 -0400
Received: by mail-qt1-x834.google.com with SMTP id m26so6289441qtn.1
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 09:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=unOqLzAPd6poy21NosqfBpvujG84W8QKJdncOwMlFts=;
 b=gRAkcZ81A0nj20a2o5LKnEDTScskW3gwakOALD8UQKp3N9kMNCtPjZH+ohWLkidW14
 ZGWFJwa7qY7kMXGPyh7qmlbWYgII/25XKGX0RGe6g1PXhknWGExR0Zo4yUv6XSLrEqUR
 FI0UwlFGosbqmqNaAbEXL9jmhijAd7mhoqJbHppZQUElSCRMeK9+pXBYLf1FlJfw8Miz
 RAqaWDfarr8zib2vt5RuACWljCPrOP17GXZJiBQwXydVojAniDPzzf8IfoI0Eqmhm7EV
 ZGoRMldt0SrMtcfX/VJR7sZuIk8WjyinzVO4MCI4QkAE3TV9mSLpGlGkYZgup0Vryiax
 cFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=unOqLzAPd6poy21NosqfBpvujG84W8QKJdncOwMlFts=;
 b=TWAEO9ERaMBfjSVU6SECDvgOImMIA2dDk3hnCT59dTHnuugRLfdVPi4ww0cF6Urho+
 xmBc0VZQC86vUfqB9VLx+ySmoHjO8viW/MGXG1WHG6HclQ9LJwXlWq+aF64C0Ooao0jX
 0+WojOWYmLlW9p2skkuLLv0Ojmmp8BaJAMWYYOzkC04Ij9bAAJujRhW2SvyXpTO4FvgK
 AksNTcE+ppj0TVXD1cyhImWcfjMj05iL3xR6MUoTmstIx8amggFKpPuJRfeUTZ+wlmX5
 lCRiJc6IY0W6KaXftX8gtJHudc58Ll2+C15wEHmiMNtloCnQay+UbPpOW7wBDD5RPapZ
 XYgQ==
X-Gm-Message-State: AOAM532HbWXNDh0eqdUb1IubQ3c/3G1XIZgzpwx5HKZ5Gx8cqzpT/vhs
 vBXYLMaZKw99odrowKZ+kwZe2+HNRpR1mg==
X-Google-Smtp-Source: ABdhPJwxJ/Hz232S1Sbg36hemvMhcb9EolkTajmjz8xNVk06nNluzkxU1NhEf1xkKJ+aDuk6lemYhQ==
X-Received: by 2002:ac8:4b4f:: with SMTP id e15mr7760150qts.219.1633019798891; 
 Thu, 30 Sep 2021 09:36:38 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id q8sm1855781qtl.80.2021.09.30.09.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 09:36:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] tests/docker: Remove fedora-i386-cross from
 DOCKER_PARTIAL_IMAGES
Date: Thu, 30 Sep 2021 12:36:35 -0400
Message-Id: <20210930163636.721311-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930163636.721311-1-richard.henderson@linaro.org>
References: <20210930163636.721311-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The image was upgraded to a full image in ee381b7fe146.
This makes it possible to use docker-test@image syntax
with this container.

Cc: Thomas Huth <thuth@redhat.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index ff5d732889..0806c6f726 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -184,7 +184,7 @@ DOCKER_PARTIAL_IMAGES += debian-riscv64-cross
 DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
 DOCKER_PARTIAL_IMAGES += debian-tricore-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
-DOCKER_PARTIAL_IMAGES += fedora-i386-cross fedora-cris-cross
+DOCKER_PARTIAL_IMAGES += fedora-cris-cross
 
 # Rules for building linux-user powered images
 #
-- 
2.25.1


