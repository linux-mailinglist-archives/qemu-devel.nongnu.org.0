Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A2E405FE5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 01:12:23 +0200 (CEST)
Received: from localhost ([::1]:55444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOTDS-0001nL-Mg
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 19:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3n5M6YQgKCsA20nguzynmuumrk.iuswks0-jk1krtutmt0.uxm@flex--wuhaotsh.bounces.google.com>)
 id 1mOT8V-0004WW-I6
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 19:07:15 -0400
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a]:34368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3n5M6YQgKCsA20nguzynmuumrk.iuswks0-jk1krtutmt0.uxm@flex--wuhaotsh.bounces.google.com>)
 id 1mOT8T-0003W0-5g
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 19:07:15 -0400
Received: by mail-qt1-x84a.google.com with SMTP id
 b24-20020ac86798000000b0029eaa8c35d6so11111675qtp.1
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 16:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=d+iEWa9+N3kMf5+xiBX1AwgnTOY8ceQH+EygWvgBIa8=;
 b=K4SOptHYbJtmTnvwp+uXiXEnsQlHmbtFYQtbUCWQbyLZqJrGAw6+O7OziMu0K/Dh9C
 9oCon7srTiECUzXotnVO2OlYSahQ3uMXVNq/NdT7EUnVvdxVe4kRmeYhqhRG5YBPpY4M
 RYFK873aofx4DwF9uAU7/n7b5DOcp1CtlktGxswY7uA9B618cWeJRQ2Rw+C4jzBG7jNO
 3lFxTZIwvMfodMYS0A0GVcHCL/2OWHUW41XDHqIY/jFAohgPR9xk/9SoIYVZOplAC9pK
 G+QUAVB0KbTeE3wVVId50rUUGIadGOhzSl0NXH5cUF5D3YtDgqIe8MKR2UybFbZCmy3O
 O3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=d+iEWa9+N3kMf5+xiBX1AwgnTOY8ceQH+EygWvgBIa8=;
 b=CbgqM2hjMs0rm6VTufXPMDYJ8gjug/4DdwZmS1e8kb9JTP8EdpvlSzpVj3OomweCy5
 3SecMcAGdh+vPTUa6qm1lwpkgkK0G/pnca/Eh1Z/oCTjS243u27dTVuZf54Lk7RtfnsG
 YMvtLU9mF0C2r+ztjpcFRjvR/C7g0oiK53Dpo8S/oXGck6vvpxk0407QNplGNg3hm2vx
 A9rLvfDfzApuWXcHl9hZLXLEJP6FazltPmcuFus6mWT3vH8/DbM2uRGwDslN0wmnecWS
 ADBZVlgcdM1Dpz1S9nCJPG5JU/Hy9emKD4YtDfK/K2XT7f5RajswqXvrT599d1jWd1PN
 4kAg==
X-Gm-Message-State: AOAM5300fFbnBZUQxUitn3zf20d/hE3TKI/rL/hBgKdRob4ZyMCNsAKy
 6uperGP/cTd6GZ5wd5cSBxNBgRVJYRbrAA==
X-Google-Smtp-Source: ABdhPJwxKv6d0ZFdAgt38/Tt9k4asHmzdqQkjkZRz+LIwXS9SQANCkg/zU3PcRcVB8ay3wizwEnXj9I9fkHKgw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6214:140a:: with SMTP id
 n10mr5701030qvx.4.1631228831092; Thu, 09 Sep 2021 16:07:11 -0700 (PDT)
Date: Thu,  9 Sep 2021 16:06:13 -0700
In-Reply-To: <20210909230620.511815-1-wuhaotsh@google.com>
Message-Id: <20210909230620.511815-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210909230620.511815-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 1/8] docs: enable sphinx blockdiag extension
From: Hao Wu <wuhaotsh@google.com>
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::84a;
 envelope-from=3n5M6YQgKCsA20nguzynmuumrk.iuswks0-jk1krtutmt0.uxm@flex--wuhaotsh.bounces.google.com;
 helo=mail-qt1-x84a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Havard Skinnemoen <hskinnemoen@google.com>

Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
Signed-off-by: Hao Wu <hskinnemoen@google.com>
---
 docs/conf.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/docs/conf.py b/docs/conf.py
index ff6e92c6e2..ecd0be66a5 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -71,7 +71,11 @@
 # Add any Sphinx extension module names here, as strings. They can be
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
 # ones.
-extensions = ['kerneldoc', 'qmp_lexer', 'hxtool', 'depfile', 'qapidoc']
+extensions = ['kerneldoc', 'qmp_lexer', 'hxtool', 'depfile', 'qapidoc',
+        'sphinxcontrib.blockdiag']
+
+# Fontpath for blockdiag (truetype font)
+blockdiag_fontpath = '/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf'
 
 # Add any paths that contain templates here, relative to this directory.
 templates_path = ['_templates']
-- 
2.33.0.309.g3052b89438-goog


