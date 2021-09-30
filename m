Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557D841DB96
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 15:56:57 +0200 (CEST)
Received: from localhost ([::1]:60740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwYS-0007l3-EM
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 09:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVwBc-0008LS-5o
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:33:20 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVwBP-0005Gx-Ms
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:33:19 -0400
Received: by mail-wr1-x432.google.com with SMTP id m22so4650712wrb.0
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wGiJds0yYJhr+Mh+DFZjaEyEQDl2dwE5RZtIXSszFmI=;
 b=dYtIks6I21dRxe4WfC6o9I0N+38JtZvwi6632kzaAzLMwH6K6Ynj1i8jFOeCAgyyg/
 zz9NB10rbmhipQBS3P7+c4Twyb7xBr+K5l1vcI6MPJaJDSHb0K7gRphPxraWFMUbJZyG
 tFSSZgBL0Akjt5gflz3bYZPFPLfSNljzk4dwfVHm3LxvTXRl6WoMYZosSOcf+8QFUKVc
 3jgMzVCagOc3eqDvT4R6F3DZD+BeuA9seEFp8I/ZdcmbKsclDW+ysEPvoFtf4N8rqUk+
 DeCtZ83rZL555f6r35sbg7watBGnbyMJc9GEfrOzD8mrS6dfMsHLs5DB0hIgwYcofJwH
 hrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wGiJds0yYJhr+Mh+DFZjaEyEQDl2dwE5RZtIXSszFmI=;
 b=Ko7+4no7dMA2fc1ELuPDIcMsI9pJ/jFqWlxeIiSZL14FTNoikcilFlsSjooV+vcZtc
 OZdnOBWD06TKBFmpcD/NGTPzxC1pa+sal/GmnUiEs3ibt1JUZd/G5iDaMxoQ4WURIvUV
 94I4OSQt1owaQWFDpDQK+HK52oTZnGGAY7kdojZ/pkqfwrSXcpv5LJcSuElywgllFcFr
 PgJU7zKrETDlhTA3wtg6Rwp43nPVEnm8585tNDt9uZrY3JlIZx7vHP5s4PhVexHXGG3/
 XTaY0/dNbYGYri6kYwY18gl5jV1Vr2Isc0k9BzWOLDlK2oor2ESOj9ijIfoC7hFvUA/q
 7G/A==
X-Gm-Message-State: AOAM533MvLdu5zsZPxCO42WEFbrFR0lL3ATzApXnxTx4+Ukv4uQ9qSyD
 vDR3z+HI6MM3UfopgYzn6KPRRW281IY=
X-Google-Smtp-Source: ABdhPJxz6xuDAyhuY82HXNCWHrBL5nZeIue6wfccLMBJW2Y8H4aMwJ2T2fkyhd9oaldO456Wo79XQw==
X-Received: by 2002:adf:ecd2:: with SMTP id s18mr6198279wro.99.1633008784830; 
 Thu, 30 Sep 2021 06:33:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c4sm3037168wrt.23.2021.09.30.06.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 06:33:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] docs: move gcov section at the end of testing.rst
Date: Thu, 30 Sep 2021 15:32:49 +0200
Message-Id: <20210930133250.181156-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930133250.181156-1-pbonzini@redhat.com>
References: <20210930133250.181156-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gcov testing applies to all tests, not just make check.  Move it
out of the make check section.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/testing.rst | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 4a0abbf23d..200ce46c63 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -114,25 +114,6 @@ check-block
 are in the "auto" group).
 See the "QEMU iotests" section below for more information.
 
-GCC gcov support
-----------------
-
-``gcov`` is a GCC tool to analyze the testing coverage by
-instrumenting the tested code. To use it, configure QEMU with
-``--enable-gcov`` option and build. Then run ``make check`` as usual.
-
-If you want to gather coverage information on a single test the ``make
-clean-gcda`` target can be used to delete any existing coverage
-information before running a single test.
-
-You can generate a HTML coverage report by executing ``make
-coverage-html`` which will create
-``meson-logs/coveragereport/index.html``.
-
-Further analysis can be conducted by running the ``gcov`` command
-directly on the various .gcda output files. Please read the ``gcov``
-documentation for more information.
-
 QEMU iotests
 ============
 
@@ -1233,3 +1214,22 @@ exercise as many corner cases as possible. It is a useful test suite
 to run to exercise QEMU's linux-user code::
 
   https://linux-test-project.github.io/
+
+GCC gcov support
+================
+
+``gcov`` is a GCC tool to analyze the testing coverage by
+instrumenting the tested code. To use it, configure QEMU with
+``--enable-gcov`` option and build. Then run the tests as usual.
+
+If you want to gather coverage information on a single test the ``make
+clean-gcda`` target can be used to delete any existing coverage
+information before running a single test.
+
+You can generate a HTML coverage report by executing ``make
+coverage-html`` which will create
+``meson-logs/coveragereport/index.html``.
+
+Further analysis can be conducted by running the ``gcov`` command
+directly on the various .gcda output files. Please read the ``gcov``
+documentation for more information.
-- 
2.31.1



