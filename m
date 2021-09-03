Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4323FFCB7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:07:43 +0200 (CEST)
Received: from localhost ([::1]:39660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5Ak-0001Hk-Q0
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM56y-0005zK-SH
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:03:48 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM56x-0005WL-6d
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:03:48 -0400
Received: by mail-wr1-x42f.google.com with SMTP id i6so7195278wrv.2
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eApeYrApbfWiu3vQv6rtu4BHNUrQ/4BvHORTpCt0Hq0=;
 b=LbJzmcEiFGq2TPxa/P9bS2I9uK3yRgU8Ui7tSRjaS4KEURf8jIOwPxCKnRsk/wDP23
 XLd40YWD0nDDNDW7He7RCEnAc0o3x0xhUrkGtnAuz2yRx5g83nNcjCjDE/yTxFBK4/BV
 vqFGOE9JqhkVSn+10L5S67oXL/rKy1SVV07dHYjpAHRVVgT1GTwk/lXvNQmKJPJX4SBb
 t7fyUC/DNb/8OdDATuP6w3wFKKI6HwSpPoJGrD0lRn3ApEWZwtSeuZ82RadiyUqb/ZOr
 nhSa+K4OLcxhpwOI8IbKcbcsCUSIY0jzj7ZaIce6zINg/j+02qHEMQcs7DIm6szAH7Se
 m4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eApeYrApbfWiu3vQv6rtu4BHNUrQ/4BvHORTpCt0Hq0=;
 b=aziCp7bfmnrpd8QtQTwTyygDTKTil8EChHJena59XxXDaezCkAdQG1PAnF36YKb8wN
 R76c8RxnXhgjRnn9bLv7oweKPjCZ5rk6TEq/aE1SW/QdOvepxn0nqfkXtTTbGze3hPjC
 yNwBTRtTd7I74e3Tr6bFoG7W/DFlc19niCtdsRrYKxZ+9JbRe/ieNjqdH4xjKpsy21yS
 MnVdiXFzTtQ6tgwk+nG1aJCR9xjtHr+Lh2M3ybfKp6M0ieEuwhTBvleT/W6tYRLp8hKx
 5MB0yn9vT8bllinmRQfepfDVELpT7+vYbHmwGcwbjeoJd1nhhUoRwFyTG/5SfIa38U6c
 cF2w==
X-Gm-Message-State: AOAM533rSoT/+chbK5tibmEzfskHTx9iODuMUKkRYSEGOAnW2unGxwe5
 LnshcDNY9auZk0iIe23TZfSW7w==
X-Google-Smtp-Source: ABdhPJx7fxcJv9FelxnQp/a1BBLMr88adt99NFNDRmtRb3wDegzWTh0xXm3KFVpRYFCl9BGAp6vjEg==
X-Received: by 2002:a05:6000:1c4:: with SMTP id
 t4mr2762347wrx.414.1630659825126; 
 Fri, 03 Sep 2021 02:03:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x9sm3568150wmi.30.2021.09.03.02.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:03:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 267701FF9A;
 Fri,  3 Sep 2021 10:03:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 03/22] gitlab-ci: Remove superfluous "dnf install" statement
Date: Fri,  3 Sep 2021 10:03:20 +0100
Message-Id: <20210903090339.1074887-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The container already features meson and ninja, so there is no need
to try to install it with dnf again.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210730143809.717079-3-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210806141015.2487502-4-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index f390f98044..38f08452f1 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -590,8 +590,6 @@ build-libvhost-user:
   image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
   needs:
     job: amd64-fedora-container
-  before_script:
-    - dnf install -y meson ninja-build
   script:
     - mkdir subprojects/libvhost-user/build
     - cd subprojects/libvhost-user/build
-- 
2.30.2


