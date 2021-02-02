Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAEB30C047
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:54:01 +0100 (CET)
Received: from localhost ([::1]:43076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6w80-0002Ui-DY
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:54:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vuq-0003pI-RE
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:24 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vun-0007MU-IA
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:24 -0500
Received: by mail-wr1-x42e.google.com with SMTP id 7so20520236wrz.0
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ryuNxTXwDSUiKM7x6VXFmXXC0IegaYuuOajUh/vALXs=;
 b=YrOWF3W8+Qy9oR8z/qozm+KRraHUIw+aDxMV350X8w38caVsFSDNIoW/dQDLqujUga
 2ITyC5n8ScAuWEvCNrpBXwm4p5R52fAQy3oG6ogI9J8Jx9c6sbWquWLyOTJOMorMQ54O
 7XMtMqwJZqrT+0QzkRbnAN3UoWAwet7WxenTi4fMtFlmI7+FMHwNqdSH6YHG+dvtxwuD
 O9vshKksI9jRBNVIqIHcUq1tSwTwGPScqXiVQZIgr2oyP9rFtUOdM7U29cnPQuVDsz+W
 0WFesRWkRdeh20ZRHx5noh7ZTBpHNtCAsFFlCLqsM7WjbTpVBjUaW5fNXwkBX/LkPWcK
 LOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ryuNxTXwDSUiKM7x6VXFmXXC0IegaYuuOajUh/vALXs=;
 b=Pf6J7g2VJdQ1D3lPMl3KVei4/PQ26oNCML6JUn8uaDoe0dpuhx9huazfXHIi/SfDiZ
 Gz2EoaMt6N0zO/HsxTRQiW70o3yqVxZjUs1NoJzdgbPyJw4/iFSsM9TJTCAyr6dlYisL
 aeRnJluAGop0Al48nGItZRgi73Umxk9t4S3UDOYsJ+oES5p5GZTwMmKJPAmaYkDh0Mvt
 pLyUTOcRQ6CaaJrIR2Lkd0BuNmptso1osE5FabokG3s4vWRZ2TIuCIxfqONXO9wmb+o4
 fAU0BfaCAQ6kq6Mx+eRQWL2OkjSY+qLnRzw2PxDDa2r0yaHNbMAsezuM3i1YVEwRc5D/
 J0jg==
X-Gm-Message-State: AOAM5317eiU4iCUJiiitqsNMWmNZPrIjRlHf2bvokIPM67QBADBftVYL
 gsOBTbsU3bDXYknvThTRZtqcng==
X-Google-Smtp-Source: ABdhPJyjyXv9+D/c8KbafawCBdcfoAkORmiTIRvQkGQKYWZfxKyCQNgXhAsu+kLM+wbe6C98Q/UtIg==
X-Received: by 2002:a5d:55c3:: with SMTP id i3mr23507687wrw.190.1612273220092; 
 Tue, 02 Feb 2021 05:40:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g1sm32160549wrq.30.2021.02.02.05.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 05:40:12 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 291F71FF9B;
 Tue,  2 Feb 2021 13:40:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 12/15] scripts/mtest2make.py: export all-%s-targets
 variable and use it
Date: Tue,  2 Feb 2021 13:39:57 +0000
Message-Id: <20210202134001.25738-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202134001.25738-1-alex.bennee@linaro.org>
References: <20210202134001.25738-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are some places where the conditional makefile support is the
simplest solution. Now we don't expose CONFIG_TCG as a variable create
a new one that can be checked for the check-help output.

As check-tcg is a PHONY target we re-use check-softfloat to gate that
as well.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210126145356.7860-2-alex.bennee@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/mtest2make.py  | 1 +
 tests/Makefile.include | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

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


