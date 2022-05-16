Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F304052891A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:43:15 +0200 (CEST)
Received: from localhost ([::1]:47520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcsN-0001DG-2k
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqcBA-0006Xu-5m
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:58:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nqcB8-0001T6-DF
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:58:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652713113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lnh027vYirs441h5yeKyYQpB7TUAZOySRk8n5bydWcY=;
 b=IzDH/PIxVS3KwEjw2mayI86nUDBYsNM31WyrQbtZaVFPX95sx9L1Rm13odKdkZ6XobtPh4
 x33zxfqGyr9UpKXL1kvno52hS7dAKvieAL3NDWK5CLHVZ06lr/vDIBJ+UzD5vxjNPDq5KE
 47gusvMMGEb+MxWJVJChGeb5Z30rP7E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-VZUlkUgSMYe8GVyvwqgOgg-1; Mon, 16 May 2022 10:58:30 -0400
X-MC-Unique: VZUlkUgSMYe8GVyvwqgOgg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B6A33C138A8;
 Mon, 16 May 2022 14:58:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67F8415088D0;
 Mon, 16 May 2022 14:58:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/3] capstone: Allow version 3.0.5 again
Date: Mon, 16 May 2022 16:58:22 +0200
Message-Id: <20220516145823.148450-3-thuth@redhat.com>
In-Reply-To: <20220516145823.148450-1-thuth@redhat.com>
References: <20220516145823.148450-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

According to

 https://lore.kernel.org/qemu-devel/20200921174118.39352-1-richard.henderson@linaro.org/

there was an issue with Capstone 3 from Ubuntu 18. Now that we removed
support for Ubuntu 18.04, that issue should hopefully not bite us
anymore. Compiling with version 3.0.5 seems to work fine on other
systems, so let's allow that version again.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build                | 2 +-
 .gitlab-ci.d/buildtest.yml | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 9b20dcd143..63ea585702 100644
--- a/meson.build
+++ b/meson.build
@@ -2513,7 +2513,7 @@ capstone = not_found
 capstone_opt = get_option('capstone')
 if capstone_opt in ['enabled', 'auto', 'system']
   have_internal = fs.exists(meson.current_source_dir() / 'capstone/Makefile')
-  capstone = dependency('capstone', version: '>=4.0',
+  capstone = dependency('capstone', version: '>=3.0.5',
                         kwargs: static_kwargs, method: 'pkg-config',
                         required: capstone_opt == 'system' or
                                   capstone_opt == 'enabled' and not have_internal)
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 0aea7ab84c..a4d43d743b 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -42,6 +42,7 @@ build-system-ubuntu:
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-slirp=system
+        --enable-capstone=system
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
-- 
2.27.0


