Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1876198BC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 15:05:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqxJ4-0005xu-3Z; Fri, 04 Nov 2022 10:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqxIm-0005sC-7b
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 10:04:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oqxIk-00076Y-CN
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 10:04:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667570645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bw40yOMJd2A0m2qRYweHfLuJtOZNLBkarb2o0VGzFho=;
 b=VjlZ05mQOZQf4CMkkIP5/UiRwyFjrPVZLjwUELJJ+/LYVPE+V6mZWomDzMuq1EUyEnMUNc
 LAJLimoajlPxE0d6AuFHv9pFx287KhIFb7G9PL7gj+G1ZMoIIyGMOKOK6qFWpHeJiU7eIF
 y+uZ/7/SC3zgghIFmupXkic+9LWOm1c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-azdJUTRHMCCtkwJQoqtX4g-1; Fri, 04 Nov 2022 10:04:01 -0400
X-MC-Unique: azdJUTRHMCCtkwJQoqtX4g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BA26806002;
 Fri,  4 Nov 2022 14:04:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9045A2166B26;
 Fri,  4 Nov 2022 14:04:00 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2] gitlab-ci: increase clang-user timeout
Date: Fri,  4 Nov 2022 07:36:59 -0400
Message-Id: <20221104113659.427690-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The clang-user test exceeds the 1 hour timeout occassionally.

Philippe Mathieu-Daudé has pointed out that the number of tcg tests has
increased since QEMU 7.1. The execution time therefore probably reflects
a legitimate increase in tests rather than a performance regression.

Bump the timeout to prevent CI failures.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
v2:
- Increase the timeout instead of splitting tests [Thomas]
---
 .gitlab-ci.d/buildtest.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 6c05c46397..7173749c52 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -327,6 +327,7 @@ clang-user:
   extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
+  timeout: 70m
   variables:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --cc=clang --cxx=clang++ --disable-system
-- 
2.38.1


