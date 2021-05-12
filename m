Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAFE37BAA2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:33:45 +0200 (CEST)
Received: from localhost ([::1]:34152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmBU-0003Ad-5v
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzF-0003Pc-N5
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:05 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:33715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzE-0003dR-0n
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:05 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 o26-20020a1c4d1a0000b0290146e1feccdaso1025569wmh.0
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OWsxh1O/PCMLIPJdNYGt0wcTu1m8kvjY7RzHMHd8hQY=;
 b=ze9RBQMOY69S4ZuGC5QfUk0RhKt/4D/dIfRpvhHqEwuLICDu+KJa4n3jnXbNGwBhxU
 uBYpoB1O0y1yQe4xh/1kgK56loO2XFEGMe3VUzEqcailKwwzINcQ7v49hCh+SuFhxSpt
 MSbcNyqeGuCMwcj6yhfAJbiQgvcHUFXu1Yy/gU0hB7TadMIdvwEpGN++r/8pFVf4HrD2
 6qbCjqGI5+jcgWfYlGNFunMTJoM4riGpohqCGBVQoPaEYDYQYZREuLGgT4v2qloSArpZ
 H6z/Mv7CuyA5vYoAIRmijsFZa3OZUymCs9qhuDC8fsDIknMrI4tH04DtzlhT2xASjhIh
 MUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OWsxh1O/PCMLIPJdNYGt0wcTu1m8kvjY7RzHMHd8hQY=;
 b=j2CQwuQ2n1kIRz6LTSkdwyXdp9oDjphdfvqeEOdxidehnIRTgf0YBbJVliqAFjgK22
 Dd/kauZMMxL8h6oYYrnPruxC+oNqCaQFwOhVpp+JZd50vNtdFEshahJxME0cpfT0eddC
 8ejHYnJ/rqoumwtbOijdRHvdfGNqhE9KOAjeU8o+eMEiEnqigr20LnvnRcXaa53F9hTL
 JIdrqwnex+brQzCTmHJEJ7Zyrs803ofl1FLuHoEXVGq4dd4dvSVzPmSF121FrmX1T1Xn
 jxeopf3yCnNbzS5xP7OAvdMxz4nl9RiTOYcsm4oxZ29FmSvC6wBEubpnFVSl3qbu6OaJ
 DUhQ==
X-Gm-Message-State: AOAM5313VrqqQQl61q7JiPw8SSx/Lulpq3sjgVV+pSDh7HTyX+TdiaBz
 tH0BucJvUly/SNR6WmY0o+9sFA==
X-Google-Smtp-Source: ABdhPJxXAEiSvQ6+mxo6h3U38jXAN419BmL/rjVnVRHQZSyFHhq5heeMjm/YbPXYfyXHLusWMxHEaA==
X-Received: by 2002:a1c:4e06:: with SMTP id g6mr37666582wmh.30.1620814862632; 
 Wed, 12 May 2021 03:21:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h13sm27104671wml.26.2021.05.12.03.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:20:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C863D1FF93;
 Wed, 12 May 2021 11:20:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 07/31] tests/tcg: Use Hexagon Docker image
Date: Wed, 12 May 2021 11:20:27 +0100
Message-Id: <20210512102051.12134-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: fam@euphon.net, Alessandro Di Federico <ale@rev.ng>, berrange@redhat.com,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

[PMD: Split from 'Add Hexagon Docker image' patch]

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[AJB: add container_hosts]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210228222314.304787-5-f4bug@amsat.org>
Message-Id: <20210305092328.31792-6-alex.bennee@linaro.org>
---
 tests/tcg/configure.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index fa1a4261a4..24cc847688 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -128,6 +128,11 @@ for target in $target_list; do
       container_image=fedora-cris-cross
       container_cross_cc=cris-linux-gnu-gcc
       ;;
+    hexagon-*)
+      container_hosts=x86_64
+      container_image=debian-hexagon-cross
+      container_cross_cc=hexagon-unknown-linux-musl-clang
+      ;;
     hppa-*)
       container_hosts=x86_64
       container_image=debian-hppa-cross
-- 
2.20.1


