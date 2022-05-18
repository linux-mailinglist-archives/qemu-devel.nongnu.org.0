Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1779252B5A6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 11:18:54 +0200 (CEST)
Received: from localhost ([::1]:50054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrFpV-00020Y-5H
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 05:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrFbv-0008B8-Ud
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:04:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrFbu-0004NM-3j
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652864687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/tZMNdMCXP+GscgGyvKm6rk9GfriGjCNq4KuNsJESVw=;
 b=V7gmWLpRLtVmbviIRqqfyQ9bA6eSgKh/Z6si7cg596hylX6RO+TmJiY/y8ODi63dvkcawY
 /HpMT+EnIyY6KwGUN74VjoVv4PRPpvD502eGCGUSrD2R0C/i7HfsTU5BfOG2NbPmuYHZ46
 YbvCeOnRmOUmRdW2FRU9ZLjGKXf1Hv4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-Ys_dyhirMfSCh_GM06p8Fw-1; Wed, 18 May 2022 05:04:46 -0400
X-MC-Unique: Ys_dyhirMfSCh_GM06p8Fw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDA2E803D7C;
 Wed, 18 May 2022 09:04:45 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78CD81410DD9;
 Wed, 18 May 2022 09:04:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 7/8] capstone: Allow version 3.0.5 again
Date: Wed, 18 May 2022 11:04:37 +0200
Message-Id: <20220518090438.158475-8-thuth@redhat.com>
In-Reply-To: <20220518090438.158475-1-thuth@redhat.com>
References: <20220518090438.158475-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

there was an issue with Capstone 3.0.4 from Ubuntu 18, which was the reason
for bumping our minimum Capstone requirement to version 4.0. And indeed,
compiling with that version 3.0.4 from Ubuntu 18.04 still fails (after
allowing it with a hack in meson.build). But now that we've dropped support
for Ubuntu 18.04, that issue is not relevant anymore. Compiling with Capstone
version 3.0.5 (e.g. used in Ubuntu 20.04) seems to work fine, so let's allow
that version again.

Message-Id: <20220516145823.148450-3-thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build                | 2 +-
 .gitlab-ci.d/buildtest.yml | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 53a4728250..526ff29a86 100644
--- a/meson.build
+++ b/meson.build
@@ -2525,7 +2525,7 @@ capstone = not_found
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


