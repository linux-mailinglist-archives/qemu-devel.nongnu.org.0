Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241EF313B3E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:44:04 +0100 (CET)
Received: from localhost ([::1]:50516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9AZv-0007Kd-5K
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:44:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95pk-0003jn-5Y
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:40:04 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95pO-0007lC-L5
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:39:52 -0500
Received: by mail-wr1-x435.google.com with SMTP id z6so16846773wrq.10
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9FElUemn7vDCwadfEV9vU0VxAeiUTnu6ontpp4bH2YE=;
 b=TSEt0WKfL860V+xI8eED0cDdzVTqVO6pGiQDX5nO8GzQ1Rs/ZP2VuIl0xuLfUMhfvI
 7W5qFsrQt7DibXY7z0bV7TO9TExJ+uDA4JvT1Gz68S72Mj5zSC65mlIHs4cqGPyjCF+M
 yYEriNZ/22Gl/oiCKVz5KU9yrIbcWa6TKf5dOWRU78NnDzcDPZX4Pxl+Cgvwu+AKQNKW
 fZdLuhFhjNnNPoxTEBzJd/FDi7Otcc2u6yIqa5wMYqQY65JTMtPH05JxA/6APhrZQbED
 EV5yrV1tYZMRVsTsZfpt1fey4DLY7HxlmAjQFf/l8wqeKmf1Y5nkUgJsFtW89oJRs0RO
 /kgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9FElUemn7vDCwadfEV9vU0VxAeiUTnu6ontpp4bH2YE=;
 b=XD6IpI0BjqmJDp8m8LmbpJ67oLNPzTmnsXGqHItNkfUf2u0d6vKbnrv8MsXwN6fbEo
 3RvWFlN83VdYx7XdjLjgopTy4BDzNTWSeFU0/BeYbFhBR5/rijQ7X3qCGOswNXuHzgEF
 tczpI+Hot2qIXqMgqXTmxOwIsGgBaO2oCYY8/YWohjY5BiJqOoleKQJyKrAsplVqYt7E
 byIEkqdBMxPnRwbv1bi81PjO85u6nQXAVewGSRKFqV8Zp1yT7e1ncHt2ZXBp/80JrN9E
 Uv2u7dDziRKTjC4WQaHUo6fUnnZ7trPUDEiZLI/P0pKVMKvseu8RKrI5riSy7gdc9SHV
 JO+Q==
X-Gm-Message-State: AOAM532AL4eq1/oSej5GpCqn9wmTrEW0Tx8sdplIvzK6njm/9Rq+ukD0
 UOlUzD7j1GfNg1CS4i1uCunA/w==
X-Google-Smtp-Source: ABdhPJwEPEB74fbW5TTgSx52LVVlc4tOBVmzt9g3/8tWSlH8J2y5anjlM8xHPgVo6170lu/rqz9rYw==
X-Received: by 2002:a5d:4443:: with SMTP id x3mr20464961wrr.409.1612787927285; 
 Mon, 08 Feb 2021 04:38:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v11sm14236284wrr.3.2021.02.08.04.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 04:38:45 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EBF0E1FF9C;
 Mon,  8 Feb 2021 12:38:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 13/16] scripts/mtest2make.py: export all-%s-targets variable
 and use it
Date: Mon,  8 Feb 2021 12:38:18 +0000
Message-Id: <20210208123821.19818-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208123821.19818-1-alex.bennee@linaro.org>
References: <20210208123821.19818-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are some places where the conditional makefile support is the
simplest solution. Now we don't expose CONFIG_TCG as a variable create
a new one that can be checked for the check-help output.

As check-tcg is a PHONY target we re-use check-softfloat to gate that
as well.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210202134001.25738-13-alex.bennee@linaro.org>

diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
index 25ee6887cf..cbbcba100d 100644
--- a/scripts/mtest2make.py
+++ b/scripts/mtest2make.py
@@ -110,6 +110,7 @@ def emit_suite(name, suite, prefix):
     print('ifneq ($(filter %s %s, $(MAKECMDGOALS)),)' % (target, prefix))
     print('.tests += $(.test.$(SPEED).%s)' % (target, ))
     print('endif')
+    print('all-%s-targets += %s' % (prefix, target))
 
 targets = {t['id']: [os.path.relpath(f) for f in t['filename']]
            for t in introspect['targets']}
diff --git a/tests/Makefile.include b/tests/Makefile.include
index ceaf3f0d6e..17dafdfe98 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -12,7 +12,7 @@ check-help:
 	@echo " $(MAKE) check-speed          Run qobject speed tests"
 	@echo " $(MAKE) check-qapi-schema    Run QAPI schema tests"
 	@echo " $(MAKE) check-block          Run block tests"
-ifeq ($(CONFIG_TCG),y)
+ifneq ($(filter $(all-check-targets), check-softfloat),)
 	@echo " $(MAKE) check-tcg            Run TCG tests"
 	@echo " $(MAKE) check-softfloat      Run FPU emulation tests"
 endif
-- 
2.20.1


