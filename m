Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808836C81C2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:48:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfjT3-0005TO-5W; Fri, 24 Mar 2023 11:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfjT0-0005PX-Tg
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 11:36:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfjSz-0001lr-Bu
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 11:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679672192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZi7OZJoIDBUiYpfz1MwO5wzGPzhZ/lJbxsxTaRuHjs=;
 b=PlXHgVw+1NQaIe9KNCJZKroGIXVfY9zCyznUOCb2oRACQiTks0DwBN3v2t1SvWTGiE7jBG
 WmNFUQIY/Zd27DsDjqSFjMd2HGLIasCyLtgnLaBHsgdd/ku3QbAsW3NqxqP4v7jKgD+5Dr
 kBBeMbdwBIoBlAQ3ShLSV7DLdFa8Xj0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-wOJB4aCHPs2VMnHSI8Drfg-1; Fri, 24 Mar 2023 11:36:27 -0400
X-MC-Unique: wOJB4aCHPs2VMnHSI8Drfg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDB89280A335;
 Fri, 24 Mar 2023 15:36:26 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90DDB140EBF4;
 Fri, 24 Mar 2023 15:36:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 6/8] gitlab-ci: Cover SPICE in the MSYS2 job
Date: Fri, 24 Mar 2023 16:36:08 +0100
Message-Id: <20230324153610.224673-7-thuth@redhat.com>
In-Reply-To: <20230324153610.224673-1-thuth@redhat.com>
References: <20230324153610.224673-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Include the mingw-w64-x86_64-spice package so SPICE is covered:

  C compiler for the host machine: cc -m64 -mcx16 (gcc 12.2.0 "cc (Rev10, Built by MSYS2 project) 12.2.0")
  ...
  Run-time dependency spice-protocol found: YES 0.14.4
  Run-time dependency spice-server found: YES 0.15.1

In particular this would have helped catching the build issue
reported as https://gitlab.com/qemu-project/qemu/-/issues/1553:

  [1851/5253] Compiling C object libcommon.fa.p/ui_spice-core.c.obj
  FAILED: libcommon.fa.p/ui_spice-core.c.obj
  ../ui/spice-core.c: In function 'watch_remove':
  ../ui/spice-core.c:152:5: error: implicit declaration of function 'qemu_close_to_socket' [-Werror=implicit-function-declaration]
  152 |     qemu_close_to_socket(watch->fd);
      |     ^~~~~~~~~~~~~~~~~~~~
  ../ui/spice-core.c:152:5: error: nested extern declaration of 'qemu_close_to_socket' [-Werror=nested-externs]

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230322135721.61138-2-philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/windows.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 87235e43b4..472bacd2e2 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -59,6 +59,7 @@ msys2-64bit:
       mingw-w64-x86_64-SDL2
       mingw-w64-x86_64-SDL2_image
       mingw-w64-x86_64-snappy
+      mingw-w64-x86_64-spice
       mingw-w64-x86_64-usbredir
       mingw-w64-x86_64-zstd "
   - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
@@ -108,6 +109,7 @@ msys2-32bit:
       mingw-w64-i686-SDL2
       mingw-w64-i686-SDL2_image
       mingw-w64-i686-snappy
+      mingw-w64-i686-spice
       mingw-w64-i686-usbredir
       mingw-w64-i686-zstd "
   - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
-- 
2.31.1


