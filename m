Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D05A66AC120
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:32:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAvw-0002gL-AE; Mon, 06 Mar 2023 08:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZAut-0002DN-AX
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:30:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZAur-0007Sz-Eu
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:30:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678109412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GxvtnRTxvPlVVnGaElpphYs+9Dfdgq1Stsq+dNOzG28=;
 b=SHNqA8JoyOepGDtTLhe73Gx3dWxb0QVsA2Neld8Sz1PiKskUy0fq3ogYfWx2XB9nmvu1+K
 iWIQviPtcE94JARo/TVw9g80/Ag3tQt7SUwQcJwIOScmGjSsSx3yQI5TZyovfv6rkAlSmO
 mdITnBSqsSQxRBwy7iW1hFw0TuLEhjQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-VN34VidpMG2FX8Hr8w3P6g-1; Mon, 06 Mar 2023 08:30:09 -0500
X-MC-Unique: VN34VidpMG2FX8Hr8w3P6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DA661C05B06;
 Mon,  6 Mar 2023 13:30:09 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB3EB40C10FA;
 Mon,  6 Mar 2023 13:30:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/16] gitlab-ci.d/crossbuilds: Drop the i386 system emulation
 job
Date: Mon,  6 Mar 2023 14:29:52 +0100
Message-Id: <20230306133002.418421-7-thuth@redhat.com>
In-Reply-To: <20230306133002.418421-1-thuth@redhat.com>
References: <20230306133002.418421-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

Hardly anybody still uses 32-bit x86 environments for running QEMU with
full system emulation, so let's stop wasting our scarce CI minutes with
this job.

(There are still the 32-bit MinGW and TCI jobs around for having
some compile test coverage on 32-bit)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Message-Id: <20230306084658.29709-4-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index d3a31a2112..a25cb87ae4 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -43,16 +43,6 @@ cross-arm64-user:
   variables:
     IMAGE: debian-arm64-cross
 
-cross-i386-system:
-  extends:
-    - .cross_system_build_job
-    - .cross_test_artifacts
-  needs:
-    job: i386-fedora-cross-container
-  variables:
-    IMAGE: fedora-i386-cross
-    MAKE_CHECK_ARGS: check-qtest
-
 cross-i386-user:
   extends:
     - .cross_user_build_job
-- 
2.31.1


