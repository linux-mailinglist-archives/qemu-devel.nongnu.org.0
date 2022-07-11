Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBDB56D754
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 10:03:00 +0200 (CEST)
Received: from localhost ([::1]:51720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAoNf-0003It-9t
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 04:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oAoI8-00058o-Du
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 03:57:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oAoI4-00037p-KQ
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 03:57:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657526231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KQC/9XzI2xozPPLBk8dO1YxgJZggNFbkndFxydX4B6Q=;
 b=IbGdbkC6femfgZ9qgpC0gv/NemAgLJR9YHwGxtdM9K/Gc9r5aOqsnJyAp7Fo3BX5xo/D3b
 RYb92PAVYoRpMHO3W1Q2kBc5fvhisq97qQRmwYqmsMjgarMfwKsalLVyj2rFFTRZUEQvis
 y3GY2OwvfZAImQW0ZKn27IPFE0ea00g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-1SFR3dqSMwqJsPOUntrIpQ-1; Mon, 11 Jul 2022 03:56:58 -0400
X-MC-Unique: 1SFR3dqSMwqJsPOUntrIpQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60E96101A54E;
 Mon, 11 Jul 2022 07:56:58 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4DF91121314;
 Mon, 11 Jul 2022 07:56:55 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 1/2] gitlab-ci: grab msys2 meson-logs as artifacts
Date: Mon, 11 Jul 2022 11:56:42 +0400
Message-Id: <20220711075643.3744153-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220711075643.3744153-1-marcandre.lureau@redhat.com>
References: <20220711075643.3744153-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 .gitlab-ci.d/windows.yml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 1b2ede49e1ac..4e5c348e59ba 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -11,6 +11,9 @@
   needs: []
   stage: build
   timeout: 70m
+  artifacts:
+    paths:
+      - "build/meson-logs"
   before_script:
   - If ( !(Test-Path -Path msys64\var\cache ) ) {
       mkdir msys64\var\cache
@@ -89,8 +92,8 @@ msys2-32bit:
       mingw-w64-i686-usbredir "
   - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
   - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinG environment
-  - mkdir output
-  - cd output
+  - mkdir build
+  - cd build
   - ..\msys64\usr\bin\bash -lc "../configure --target-list=ppc64-softmmu"
   - ..\msys64\usr\bin\bash -lc 'make -j2'
   - ..\msys64\usr\bin\bash -lc 'make check'
-- 
2.37.0.rc0


