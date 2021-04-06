Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C6A355751
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:08:14 +0200 (CEST)
Received: from localhost ([::1]:43222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTnJM-0004bT-B4
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCO-0006Rt-PJ
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:01:00 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCN-00056L-4i
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:01:00 -0400
Received: by mail-wr1-x436.google.com with SMTP id b9so6699337wrs.1
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 08:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xCHtZ6T1wrS+0v3mUz22AtCj5zKQWLIemaJOtTnyDSA=;
 b=bOAEbTmrGg77FP/CWphlKEJvh9L8EBV0L5vVRtCxy8z/VjTXkdilX4+vJK9O/Wp7WH
 YugS4/8bHTC+vxfIBTc5xScUzFPzrMbTB9zaUt4/x9QKAZW6HJ6/Awg9BLDWsKl+Iy8a
 w7S8oHRr1SlC/Duq4kruRzOLSYc4HB9jzRzATs0bYZBx3m3Z/VafOupOvk3ptPR2mvML
 MkGfvr/7f4CamBng8CWi0wehiCFR4VgvoWnAMmbhePYGy5Ri9LCU4IhWLa1l9p5IdfBR
 AVxm45nXTKhjzpjczXCkwaYzvaP6IbAnFQHNiikxdIf5HU2GzfTdI4Kza091z1jZDNw3
 /oTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xCHtZ6T1wrS+0v3mUz22AtCj5zKQWLIemaJOtTnyDSA=;
 b=GYYuKIHpKqAn6yFTo6Fe1hMWkxCIvlQTd/RSqmOiZmi/f7J3gJUgUGVzKAqCOrIQ4I
 tBvxD6JPNqe/n9o1gxJeXWKikGc99bCbQsoH98/VRaTCdUpmb3GDCXSumAsZmTQ6Ei1I
 Q0b0BCQdKHwA6ktACIM0w6usV1Gx3kbkpBZoDkGwAlVpb3jvNsihIiBuqeQ+/0esUkHj
 TxNeM6YRcRGoRh0zI890F+4OJlkNnLjP0KpU9SgQQapzRN8/Cg6bLxZO2XFx2ZzKyTGA
 u3j98m0ibX82e0qppI+tfB4lFAGfi9jJAhqDynSrYD4nsP24Bl2LcTvMfFddJGhec/5v
 +fcQ==
X-Gm-Message-State: AOAM533E1V17v2yVht9dcTfuo9WdUvnXtuPBLErrojXapiuZ06ZWqjqa
 iBlEMb2jdkasn0obgKdi/XjhIw==
X-Google-Smtp-Source: ABdhPJxX9z50Ij7dMwsfOdy5yMjGuN97T0Rk1qZWsMJRl3Q9jmkldc7mlcAluYO8fYW5vQKZY6xX3w==
X-Received: by 2002:adf:edd2:: with SMTP id v18mr17830096wro.305.1617721257772; 
 Tue, 06 Apr 2021 08:00:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z15sm473358wml.4.2021.04.06.08.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 08:00:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 65E6C1FF90;
 Tue,  6 Apr 2021 16:00:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 04/11] tests/tcg/configure.sh: make sure we pick up x86_64
 cross compilers
Date: Tue,  6 Apr 2021 16:00:34 +0100
Message-Id: <20210406150041.28753-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406150041.28753-1-alex.bennee@linaro.org>
References: <20210406150041.28753-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While it's hard to find cross compilers packaged for arches other than
x86_64 the same cannot be said for the x86_64 compiler which is
available on Debians i386, arm64 and ppc64el release architectures.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210401102530.12030-5-alex.bennee@linaro.org>

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


