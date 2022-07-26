Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B12C581AA6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:05:35 +0200 (CEST)
Received: from localhost ([::1]:35802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGQo9-0000u4-UX
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQG2-0006Yn-Pt
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:30:18 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:34668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGQG0-0003aW-Vs
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 15:30:18 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 r1-20020a05600c35c100b003a326685e7cso1301181wmq.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 12:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pe5Zimqd2c5xifMUxUMxyry48TVU96KwaVMb7LRHl5I=;
 b=zwzj80eC+gHx6S0MoXibeXV7C+sjg2dr+TLUyHkjnGt+Cg2Sf1+KAv5Ggc9hq3E1TV
 0/lOeuGlI/RQ4BEoQHchHdjXTI6VdskcHTY8KmUxGxsRXvC9rOVlIFPc5LXZH84yvodX
 PLC5pN3IsB7mYgsbnxnyqtIgl08yCRvL5titeMOfiLRIg+zMd4UuMhcw8FmwgydutLdR
 B0YQ6Hqc8zSHqFQxZ2XnzCYDsG2/ey8l6P+ABSzWCalfgb67bFleLsaQtVacb6hsWsfz
 bLRSBCxgHapMa3oa4z7fmbZshin1lg0kgE+scV37f2TP2iC57u/OXa9LHVaDUl21YB5d
 S/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pe5Zimqd2c5xifMUxUMxyry48TVU96KwaVMb7LRHl5I=;
 b=SPTkS9rT5Jcr15IVQOp3uz1lVOrNwA7QJhW5AmbyCJPvQSngcKoI72XvJogL9JA02I
 GMo5BnnZYz1QEnDiWdcTKXvPhFldTzI5KikEAf0ri0x0ri7tbZpO1Wce+L5MqAG0o8oO
 QH8196tAqzi8j5Brxk/8dXAZWE1emwBqo+Z2EM8zEOzL+fx6u0m5g6e9nqOJCALZ5Rcr
 ALFVP+mCkrA/KZc+PiIJppC+9U1ArDVkMpP9lvd2VJ6EdwDh8hjxM+gyMyZsvUhWd3xL
 h9x/7KpaWUyEly5OOU8ZyG2jWBVw0i+Zyq6Wsc0/pl82W26Ra/R2r9vjLfCqHukO1dKw
 GSBA==
X-Gm-Message-State: AJIora8PcaqkDG2g/mx2x6CHAJlY0ceUf+kT3SZfrqA2SB6j+Gglgcqr
 Jb0Tsa0JlX7iunG77eC8E7hxvA==
X-Google-Smtp-Source: AGRyM1uzk2LHEr9dplaroo5yIwqppLo8dP+wEIJoxOqPKXUpv7E0Ylry8yAN2HSKVIbTJqZaz44IZg==
X-Received: by 2002:a05:600c:600b:b0:3a3:1176:222d with SMTP id
 az11-20020a05600c600b00b003a31176222dmr510171wmb.42.1658863815304; 
 Tue, 26 Jul 2022 12:30:15 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c358f00b003a32297598csm23918246wmq.43.2022.07.26.12.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:30:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6E6961FFC5;
 Tue, 26 Jul 2022 20:21:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH  v3 13/21] tests/qtest: pass stdout/stderr down to subtests
Date: Tue, 26 Jul 2022 20:21:42 +0100
Message-Id: <20220726192150.2435175-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220726192150.2435175-1-alex.bennee@linaro.org>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When trying to work out what the virtio-net-tests where doing it was
hard because the g_test_trap_subprocess redirects all output to
/dev/null. Lift this restriction by using the appropriate flags so you
can see something similar to what the vhost-user-blk tests show when
running.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220407150042.2338562-1-alex.bennee@linaro.org>

---
v2
  - keep dumping of CLI behind the g_test_verbose flag
---
 tests/qtest/qos-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/qos-test.c b/tests/qtest/qos-test.c
index f97d0a08fd..7e1c8fc579 100644
--- a/tests/qtest/qos-test.c
+++ b/tests/qtest/qos-test.c
@@ -185,7 +185,8 @@ static void run_one_test(const void *arg)
 static void subprocess_run_one_test(const void *arg)
 {
     const gchar *path = arg;
-    g_test_trap_subprocess(path, 0, 0);
+    g_test_trap_subprocess(path, 0,
+                           G_TEST_SUBPROCESS_INHERIT_STDOUT | G_TEST_SUBPROCESS_INHERIT_STDERR);
     g_test_trap_assert_passed();
 }
 
-- 
2.30.2


