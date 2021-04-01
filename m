Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8D0351370
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:28:20 +0200 (CEST)
Received: from localhost ([::1]:50414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRuYl-0004b0-J6
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWc-0002l9-Vi
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:26:14 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWC-0001kZ-Px
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:25:56 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x7so1262426wrw.10
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HDXuUnUxtCz/PU0/mLdc7zRzMRtv8NDpCUEdED4RHtw=;
 b=bzljo8ZbfnzmpUabhEWJ5piXmZmtdrSUE934WkcJ5WCZy7CtG6+JrFlm+YG/00EXqI
 JkjRRUmw8bNK8QNHFTfFE1HzH1DqfL/kghOS6/ZCIInDJw1M+NbAbFut1s/z6g1RgklD
 /+tQd3YSfRgbvCdwLOix4zWjTSHz/67OxVvG7q1702RxKKPimqR2pvgrRyew7iCZlvdx
 zt24JDJqwfVZogmAAY4AQMHwjV4Oc9DhATTmLiF9R6nphjhRZ92B+W8PJf2BEo8jAlC0
 o45uvNKnOHiNBG8uht2FMuge1dcq52zsD7FUNw1E3XuYPnWMwiIC0DWlZPAed//FQf9o
 Ycsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HDXuUnUxtCz/PU0/mLdc7zRzMRtv8NDpCUEdED4RHtw=;
 b=D9SzqVkRukCVjPkQZzjAIH4YelsIG7LM8s+iNfOvNDxpCa4cWWvT2OQyvNtfGU189M
 BAvT5NFQUTvLWboMOnAeCXs+jEQnf+L7UVwS1njMN1H6DKpm5va1cuTsAIntKQJiW6s/
 /I70yRh8xiVxpkQmC4XfCLcpX8xcOVbAMIx1VPf4TwrrfbNMG2ZFSVfq/Tr0Htkxaqui
 Wpixc+v5ZsuWshYqKIayFXbO5n5eUh1whL/H6ArJTR/mMJtD42/6xEbh2an2TyER+Bas
 PV7B27S/6rpTX50SAJFRw/Z95HgDj6Y6zxf+tKNfxW01H12G3XFAj28eZduFeUEkJEM2
 Gc5A==
X-Gm-Message-State: AOAM530IdX25v0mjIyg9QqXBthvcZ5wWLfU3O53bmVfD1a9ipIksNGSA
 xIbADBszVqe+qkww0KOt1YKLKg==
X-Google-Smtp-Source: ABdhPJxXLogNKb6RvA/NBFje+JrJBPT50uTyiFj4mRKMJ3p+T3oB9eqlSdNo3ypDGHM1LwB6JFa/bg==
X-Received: by 2002:adf:fbc8:: with SMTP id d8mr8953707wrs.94.1617272737500;
 Thu, 01 Apr 2021 03:25:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f2sm8162005wmp.20.2021.04.01.03.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:25:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C5BCF1FF90;
 Thu,  1 Apr 2021 11:25:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/11] tests/tcg/configure.sh: make sure we pick up x86_64
 cross compilers
Date: Thu,  1 Apr 2021 11:25:23 +0100
Message-Id: <20210401102530.12030-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210401102530.12030-1-alex.bennee@linaro.org>
References: <20210401102530.12030-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While it's hard to find cross compilers packaged for arches other than
x86_64 the same cannot be said for the x86_64 compiler which is
available on Debians i386, arm64 and ppc64el release architectures.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/configure.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 87a9f24b20..90fd81f506 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -198,6 +198,11 @@ for target in $target_list; do
       container_image=debian-sparc64-cross
       container_cross_cc=sparc64-linux-gnu-gcc
       ;;
+    x86_64-*)
+      container_hosts="aarch64 ppc64el x86_64"
+      container_image=debian-amd64-cross
+      container_cross_cc=x86_64-linux-gnu-gcc
+      ;;
     xtensa*-softmmu)
       container_hosts=x86_64
       container_image=debian-xtensa-cross
-- 
2.20.1


