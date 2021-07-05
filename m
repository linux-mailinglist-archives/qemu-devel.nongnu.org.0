Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFF53BBAA1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:58:23 +0200 (CEST)
Received: from localhost ([::1]:42322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LMt-0006Db-0W
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0LKU-0003XQ-78
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:55:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0LKS-0003ri-DC
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:55:53 -0400
Received: by mail-wr1-x436.google.com with SMTP id i8so21410886wrc.0
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 02:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cI/p7AorWVHufXxzSf07Slr6R+3YNsz5IQizQd2NIH0=;
 b=AuS7sCxmdV/72kKZzRcb1G4W2Y1YNzVgIlp+4vSd611jpHKqIWiJbo37DuxBW/dO8/
 bfEpKFhCVX/6zsHGPxkafAZhKkZL+IK3ssjbe97xj6qBND5AT+JPsRaLKe2i4IzmG6rl
 i7J6QtVSdV47sSrMAsKbheWAc9H43cPTvna4u2i0/LAj1Ugpo/SGNqY966wM6xFrdwRX
 uquM+khmF5IyddiJ6CuARe4TBrOv8QrSZekMvAY9ruEdpUeQqWtYULD8ui1BlOdLf3vS
 Fxf/t1hTXG51FmgEbQ8fgUX6pp/x34OHTDpDbUsgco4EvoyJPrSm87R/VwGjH+yNh7OQ
 snLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cI/p7AorWVHufXxzSf07Slr6R+3YNsz5IQizQd2NIH0=;
 b=NicsZMpdvmrLU46VipklsDdt9Q0ZkiwOr2DUt6dHdDsF/kcjPqHNwtkgWlAROmCx0s
 3KKyKCBZnPqNAG8NqWT6jGjNszwWbU0NVd7reqCg+HnJ2Yubo2q6tqKxXWyflVYYS4xC
 E0h/JIsmGl4c+yL2EGonAKXBy7p3rX/sX4vC+1qrwHyyzYbOVTH1/PoSwfGXjRWSc6D6
 d+29v6qzh0UOLFDnfcOXW4yBSX/yguNBqxjMVIOC0Zjyrua+DUN/wYnkniBoTCEYNqm1
 zB1TrW8HlXwo3J7ydykYE2G0cGRQGXl6n0jaKJFCR1FWmw/Lq99z6TrTrYG7lMYjdvxH
 9Law==
X-Gm-Message-State: AOAM533rJJ+AvkhjZjGG9W92/J8Cbu+UCVUh3LMVvinNIuZUrN/gZON/
 ctfqey0XZMj2tDLD/ardbWk3gVFnlbAZCtV8
X-Google-Smtp-Source: ABdhPJxtKp7z3UrzscP/NDq3sAks/SKQEPgghZSs5yrgxdD+Px+wAW+qJ1NAG29gIPvr+EMVldXV6w==
X-Received: by 2002:a05:6000:186f:: with SMTP id
 d15mr15241596wri.29.1625478951065; 
 Mon, 05 Jul 2021 02:55:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i5sm12528727wrr.4.2021.07.05.02.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 02:55:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] docs: Fix documentation Copyright date
Date: Mon,  5 Jul 2021 10:55:41 +0100
Message-Id: <20210705095547.15790-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210705095547.15790-1-peter.maydell@linaro.org>
References: <20210705095547.15790-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit 6d8980a38fa we updated the copyright string we present to
the user in -version output, About dialogs, etc, but we forgot that
the Sphinx manuals have a separate copyright string setting.  Update
that one too.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/conf.py b/docs/conf.py
index 42729e22bbe..ff6e92c6e2e 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -87,7 +87,7 @@
 
 # General information about the project.
 project = u'QEMU'
-copyright = u'2020, The QEMU Project Developers'
+copyright = u'2021, The QEMU Project Developers'
 author = u'The QEMU Project Developers'
 
 # The version info for the project you're documenting, acts as replacement for
-- 
2.20.1


