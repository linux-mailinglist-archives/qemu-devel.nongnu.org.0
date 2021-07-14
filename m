Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C83A3C8694
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:03:53 +0200 (CEST)
Received: from localhost ([::1]:51216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gQS-0003Az-98
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNY-000799-13
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:00:52 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNW-0007Tx-74
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:00:51 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 f8-20020a1c1f080000b029022d4c6cfc37so2796078wmf.5
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f5eU90RHoit+tKKWWo0rk9BGq4kZjn+oIHBSezhYgfs=;
 b=Bg1/SDkbjehOECDO/t5PfYKJDvz6NSQMEpjfuwUbTq0jQvGfCaUlCTeR8pjk3boPKy
 ZdzprR1rxcbTVdcP4DhDpA/79bdZ1iVn4B0KWLgTo/+b610BoLxoaRHuL/wgRL9idM+i
 PzrFR1Z/WotdbtnTuISt2PjFABGxdoUgQywA1SscVgG/0x45TItZBZ8VtPpGi/yCJpWg
 G7Vst/QcJVVkJ90YJmsJ4SXLjKaWAO26CsyXIQSxxD1XdO7CeuzsnEEVhnule6d/D61b
 ZaUjhXjzitRlmVLaw21BxW6sLHQReeSSUrKxUROjcok2s2xd0Qd7UjGy0YBBqetTXOCQ
 cdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f5eU90RHoit+tKKWWo0rk9BGq4kZjn+oIHBSezhYgfs=;
 b=jq+SrziW4r3hEIXf2Xnek3vY3aFwTEJYTXI1uXRmA9u6S8MeSoWpvCU4TLAs25ws9E
 PpQR1qNezMds1/cY1GLtaIACrKf5UCK2Az2VQP8m3p45MyiBBopeTLJfEJpIQmttFloV
 a3BEWlMUHB7hcJ+CFwVLrnFG9QoIpzSuMNZbLNtpDFbmj8umS1xIZsiLvleUp+d1Y7i0
 URwu21G4fputrcXHrxPjIOwrFMd3iOWP1vqkz+u99hq2FYQL0kjK725/4R7gJP4IlQHZ
 geQMMuQhAcF6MD+eVm7FgarYNbSmVSrF5x3OA7G2q9J5d92P/0kLx8+0jVSaMYZ6EYQm
 4oPA==
X-Gm-Message-State: AOAM532pSn5AANypU8dsWJPMyvKp2911SGW+ukEmD7zU/uSi8xXat9zY
 SZxBZBCCqyL/NwKJ5ZkJmpr8GA==
X-Google-Smtp-Source: ABdhPJx3U9madayoDoro68RLQejI9ldqmoVG7V7o5OoKz9NKbIUOl/4UAnE++3C5b1w6fLvmD5gyww==
X-Received: by 2002:a05:600c:3644:: with SMTP id
 y4mr4726941wmq.85.1626274848197; 
 Wed, 14 Jul 2021 08:00:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p3sm5427019wmq.17.2021.07.14.08.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:00:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 82AE61FF96;
 Wed, 14 Jul 2021 16:00:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 08/44] build: validate that system capstone works before
 using it
Date: Wed, 14 Jul 2021 16:00:00 +0100
Message-Id: <20210714150036.21060-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Some versions of capstone have shipped a broken pkg-config file which
puts the -I path without the trailing '/capstone' suffix. This breaks
the ability to "#include <capstone.h>". Upstream and most distros have
fixed this, but a few stragglers remain, notably FreeBSD.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210625172211.451010-2-berrange@redhat.com>
Message-Id: <20210709143005.1554-7-alex.bennee@linaro.org>

diff --git a/meson.build b/meson.build
index 512ee2e926..89c09ed7ea 100644
--- a/meson.build
+++ b/meson.build
@@ -1657,6 +1657,19 @@ if capstone_opt in ['enabled', 'auto', 'system']
                         kwargs: static_kwargs, method: 'pkg-config',
                         required: capstone_opt == 'system' or
                                   capstone_opt == 'enabled' and not have_internal)
+
+  # Some versions of capstone have broken pkg-config file
+  # that reports a wrong -I path, causing the #include to
+  # fail later. If the system has such a broken version
+  # do not use it.
+  if capstone.found() and not cc.compiles('#include <capstone.h>',
+                                          dependencies: [capstone])
+    capstone = not_found
+    if capstone_opt == 'system'
+      error('system capstone requested, it does not appear to work')
+    endif
+  endif
+
   if capstone.found()
     capstone_opt = 'system'
   elif have_internal
-- 
2.20.1


