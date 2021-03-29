Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE9D34CE7D
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 13:08:19 +0200 (CEST)
Received: from localhost ([::1]:59618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQpko-0004C4-Gb
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 07:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQpfv-0000G6-Hs
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:03:15 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQpfs-0004iE-47
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:03:15 -0400
Received: by mail-wr1-x433.google.com with SMTP id j18so12405629wra.2
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 04:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HDXuUnUxtCz/PU0/mLdc7zRzMRtv8NDpCUEdED4RHtw=;
 b=SRGjF1v3H6CgyfPz4bSa1CmPTwznsVH+twPwV007Y5tpoNWFhiyS6sh8N65l71/1sf
 uIaSGdWWvidQG8OKmabmgJdHmN0qmsXcNQ+D98M5FpnSN9nRYiT0qEO9pNTynwj8fvro
 sFaJcxh4rqj7VUvpnc6uoEc1cmMC4P/eDgOSI+BplZ66Xy6WEHQzZlpU1NzIy5J6PMT2
 1Sc+YnrMmFoR7PRINsoQDp7iXztKBONANR36f91HQYEMyjMgDjqmGuMJAB3preH6Rchk
 +Cd6RloCIdxuSZB91cfrp09RuEUsRTuBp2MofsCG5L+kWB3swOiDOD0UbC8LNN5z5Vee
 Qwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HDXuUnUxtCz/PU0/mLdc7zRzMRtv8NDpCUEdED4RHtw=;
 b=m7Odqhh7aIt9kNLa/C/CKibttz53wc4mVXQnmjABcrfYJxpsLY6LQuOh8w4lXOCHSj
 sKk6dxqyJTWK7LAMQEayHN3nWFhKxYnIdwGaPnHY/hOMK2H6igs5EfI4O6vE4+7qLPUW
 1f5bzSRpUjb51e0x1+VXy+ahdsVGVCYpYC5/8mFJMzeE9Dx4e6kviRRp8U2+IcNa2Dch
 jCLGaPVqwYCxe8th+Kz0xCT67b5333Jis4pKnqpqrIuxjppkz0RoNJN2qZ9VeTR4T3kD
 WIC/hz0q9Hr/n1TM1/5SpcFExPJKQeUdvV8+8tuqk/jiMXobGjt+WsXvgIIs5L0hLeka
 Fqqw==
X-Gm-Message-State: AOAM533Nwn/fKe0TWtB1+FymNWwIm58fPl50K14ktkNWN+YNSKrnq+Wz
 aqBSz+SzK5iKzDLIs3hOM1A+LQ==
X-Google-Smtp-Source: ABdhPJwM8Bc6bf/y87PmI/RKPBUTb9GnubYdtoqrjEKoDuPG9t3JK7CPBHVF232pqr50wnCfCpEmSQ==
X-Received: by 2002:adf:f307:: with SMTP id i7mr28011769wro.142.1617015790727; 
 Mon, 29 Mar 2021 04:03:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j123sm22080556wmb.1.2021.03.29.04.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 04:03:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CACB41FF90;
 Mon, 29 Mar 2021 12:03:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/6] tests/tcg/configure.sh: make sure we pick up x86_64
 cross compilers
Date: Mon, 29 Mar 2021 12:03:01 +0100
Message-Id: <20210329110303.15235-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210329110303.15235-1-alex.bennee@linaro.org>
References: <20210329110303.15235-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


