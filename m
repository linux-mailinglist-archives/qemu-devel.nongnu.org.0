Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE34DAE65A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 11:11:02 +0200 (CEST)
Received: from localhost ([::1]:36206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7cAv-0006xr-Jq
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 05:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37155)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i7bqp-0000eD-6i
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 04:50:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i7bqn-0000Xe-LE
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 04:50:14 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35695)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i7bqn-0000Ws-DL
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 04:50:13 -0400
Received: by mail-wr1-x430.google.com with SMTP id g7so18461940wrx.2
 for <qemu-devel@nongnu.org>; Tue, 10 Sep 2019 01:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uAN7rc3XuPCMzWFwqeyrIQC5X91wCicNm0Fvw4/6E2E=;
 b=C8zN5YF2bIZOiJufd/kkJiysepEecK5RksYzGW+69AD94dU5gkZMuellz18zv7ca2r
 72ZYZrSdqvIrNiiuLk1BBX9t/RrEd/y9aosQTuVLNPdus60Lg/76w4vdmf2oPpcc0UwQ
 CrKM6fiob9VpxS+Em3eqT6TNJ4Lh6ExpZEVlILDeb0MLsvUV//hfU3RUTJMm16iQg1PX
 JfWJ+NmliFGEGcFT4ulZpbopadqMjf/n2KqtPU6REtRbZF9qjmsDmA1fwh1otWU5t/vD
 NBJboCMbs0JPcfggegop3Z9cge/GXrshaSU4pI+FnVGfFe+X9dHeciBzbO7/liCC8njG
 Vt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uAN7rc3XuPCMzWFwqeyrIQC5X91wCicNm0Fvw4/6E2E=;
 b=ntFvb3EtnEtMprq3FN8khu2OSeZLQWchV02YW8/WTVw7te98lHiW+N9XqL8ucCgp29
 WYYa8A5ya9V3PEWuXbElewyf+ilt+aCUtEYGBbID+NcvSCGuTB4GQnE7kpIOHc5/44tn
 INLLKI29NTvsE4s2kN4r9Q0v9B8LG0//oUGhI7pwUvQGix2NOfFE8lTqt4uOuMiqOTbW
 e8pY//fEgf1uoTyrT/QJk5m4xpXbDtQmocCzcBuVj0VLpugdbTzmBqPabGv+0ymFUU4M
 QYKgyqv1GSSqJv06cHsAT+RN9FDqJRh9N19smx+2D9ay0ptWUcDc7jF0SDqNH2uM3hb+
 e1Lg==
X-Gm-Message-State: APjAAAWeJcfQO/iaMjj6iU3bs5qoxhT7E8PIx9u93zJl3YdP/nb/j2El
 IziAeWlPARQkRNjXflun1nW6SA==
X-Google-Smtp-Source: APXvYqx0TLtx0PUI7+X37UN8zeR2Ta52Q1m/6sOkzSc/CaWPS8pZLTO+/p3b5uvJ1r7EXoWqNBtEJg==
X-Received: by 2002:adf:f284:: with SMTP id k4mr9706420wro.294.1568105412064; 
 Tue, 10 Sep 2019 01:50:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b3sm14403871wrw.4.2019.09.10.01.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 01:50:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 57EB21FFC0;
 Tue, 10 Sep 2019 09:43:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Tue, 10 Sep 2019 09:43:45 +0100
Message-Id: <20190910084349.28817-42-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910084349.28817-1-alex.bennee@linaro.org>
References: <20190910084349.28817-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::430
Subject: [Qemu-devel] [PULL 41/45] .travis.yml: Cache Linux/GCC 'debug
 profile' jobs together
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

These jobs build different components but use the same
host features. Put them in the same cache bucket.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/.travis.yml b/.travis.yml
index 51c7d19c071..d2da12580f3 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -120,11 +120,13 @@ matrix:
 
     - env:
         - CONFIG="--enable-debug --enable-debug-tcg --disable-user"
+        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug"
 
 
     # TCG debug can be run just on it's own and is mostly agnostic to user/softmmu distinctions
     - env:
         - CONFIG="--enable-debug-tcg --disable-system"
+        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug"
 
 
     - env:
-- 
2.20.1


