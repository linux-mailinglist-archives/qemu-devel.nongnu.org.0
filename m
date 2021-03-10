Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE4733482B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 20:41:12 +0100 (CET)
Received: from localhost ([::1]:46990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK4hj-0003pn-Kn
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 14:41:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK4R0-00066E-IW
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:23:57 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:46131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK4Qp-0002l4-Ai
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:23:53 -0500
Received: by mail-ed1-x534.google.com with SMTP id w9so29704355edt.13
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 11:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hIWJZmL4ryUgyEw+W352gXcuQhd67mjmkYPqHcAbcc4=;
 b=v4k/ruwwN1IN2PFooa4I8IeYwJidHete0lJUOOMZfDhxLqY+Iyh51l04hunuPCfAnh
 3+vjckQ4vgqEq7kz51BGv4lCc4P36y20/abSZSCoJNBQn9SMA9W6R4E94ULL/MehmHXJ
 VrwbL3rflosYY3+8m/ks8gxYu22VhrifarglRu3dsOEKjmX3A5yYLU/cb+6/OsEAvEpJ
 fGsjppWqDLgj09CGIi+1Vn9LYepWIO9SAK9Nj37Vc2PcOFmuBNS5FLC9QUFHoylk2RTN
 FBhVw8DP5x2N18RCztYtThyUEESLgaLZ6HiKiESObK+e1B/5EvfrVICGCX125e6c2xki
 wAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hIWJZmL4ryUgyEw+W352gXcuQhd67mjmkYPqHcAbcc4=;
 b=BgXOrGCGjU22rDC0S56TlkZFzMeIQuM2dSVDDsVnVwu9UR/qACahyy3FWyV0GZ+Z8T
 YSpq8UuVlPUPWH5D6QTtNVqKLTvbIyRYMaPPiQlqtHriV/F4O54HEQfbwWR1DDfeWuUd
 Z79KcvEft2agKNP9hfQ6dDhC50V9J+WZA3i+lFR+RB6A0U1x9YHCcGVU7sGofchEb/6W
 5t3iDKheQBnpIAQIkhJd3nCdeFK8CllrkCrurNFp4hywxQgOkT1tW7IVErPCBsc/feje
 g2obUBKSQsdxcUol0Fa5wZqsfryGNeqBvwdvpkB8g8wFwQ5q1jaEbKDOGrCpcnplcwNG
 fStw==
X-Gm-Message-State: AOAM531Bec7LlXk/k1OVfq3AfHk/vqNYgl67FCDtrCyOkzNC1JKxDLz7
 3ZeCO1tuxg0XIumrVnpHx2Kmzg==
X-Google-Smtp-Source: ABdhPJyNP+Kvtuh0caPbbGoOf/TNcmCQcTZKR5CRyP3syU8Bx97APecWhhKxhzebxgPHNYm1AjYn7A==
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr4964800edu.100.1615404221964; 
 Wed, 10 Mar 2021 11:23:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s9sm106695edd.16.2021.03.10.11.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 11:23:38 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 77D521FF92;
 Wed, 10 Mar 2021 19:23:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 6/7] tests/tcg: Use Hexagon Docker image
Date: Wed, 10 Mar 2021 19:23:30 +0000
Message-Id: <20210310192331.29284-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310192331.29284-1-alex.bennee@linaro.org>
References: <20210310192331.29284-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: fam@euphon.net, Alessandro Di Federico <ale@rev.ng>, berrange@redhat.com,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

[PMD: Split from 'Add Hexagon Docker image' patch]

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210228222314.304787-5-f4bug@amsat.org>
Message-Id: <20210305092328.31792-6-alex.bennee@linaro.org>
---
 tests/tcg/configure.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 36b8a73a54..f70fd7435d 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -124,6 +124,10 @@ for target in $target_list; do
       container_image=fedora-cris-cross
       container_cross_cc=cris-linux-gnu-gcc
       ;;
+    hexagon-*)
+      container_image=debian-hexagon-cross
+      container_cross_cc=hexagon-unknown-linux-musl-clang
+      ;;
     hppa-*)
       container_image=debian-hppa-cross
       container_cross_cc=hppa-linux-gnu-gcc
-- 
2.20.1


