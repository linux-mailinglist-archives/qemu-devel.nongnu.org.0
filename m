Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C80EF6A106C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 20:15:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVH2R-0008AQ-Jp; Thu, 23 Feb 2023 14:13:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVH2N-00089M-VB
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 14:13:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVH2M-0000Vm-7j
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 14:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677179629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=I37JNRcFfrMB+f1a/tbFj6nruYYp+mIS78R5M9zp2xM=;
 b=IEbVGoJn9T1N10xW5lcyX9kSRAxfLzdbAV1yjYiLEwUI5x0LK3Nmu/ws/oftzekX+7qIJA
 hp479Zm7q3CtDKx5yVf6Xb/yRTZudCARFBB8tqoOByBIDf4LPUEyQvEyFyT61AGau2WSyz
 6/ZnJebmFzb52gIwpVC+zh42Lma/Kq4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-zbCjJXujPUm66KAiuB8bzQ-1; Thu, 23 Feb 2023 14:13:47 -0500
X-MC-Unique: zbCjJXujPUm66KAiuB8bzQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E66641C04B71;
 Thu, 23 Feb 2023 19:13:46 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E13640C1423;
 Thu, 23 Feb 2023 19:13:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Daniel P Berrange <berrange@redhat.com>
Subject: [PATCH] .gitlab-ci.d/base: Mark jobs as interruptible by default
Date: Thu, 23 Feb 2023 20:13:43 +0100
Message-Id: <20230223191343.1064274-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When handling pull requests in the staging branch, it often happens
that one of the job fails due to a problem, so that the pull request
can't be merged. Peter/Richard/Stefan then informs the sender of the
pull request and continues by pushing the next pending pull request
from another subsystem maintainer. Now the problem is that there might
still be lots of other running jobs in the pipeline of the first pull
request, eating up precious CI minutes though the pipeline is not
needed anymore. We can avoid this by marking the jobs as "interruptible".
With this setting, the jobs from previous pipelines are automatically
terminated when pushing a new one. If someone does not like this auto-
matic termination, it can still be disabled in the settings of the
repository. See this URL for details:

 https://docs.gitlab.com/ee/ci/yaml/index.html#interruptible

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/base.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
index 50fb59e147..0274228de8 100644
--- a/.gitlab-ci.d/base.yml
+++ b/.gitlab-ci.d/base.yml
@@ -11,6 +11,8 @@
     # and show the duration of each line.
     FF_SCRIPT_SECTIONS: 1
 
+  interruptible: true
+
   rules:
     #############################################################
     # Stage 1: exclude scenarios where we definitely don't
-- 
2.31.1


