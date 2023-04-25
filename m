Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C246EDCFB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:46:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDMj-0006Xn-NC; Tue, 25 Apr 2023 03:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMM-0006Ev-4H
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMI-0006aP-DO
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I98COpuRyuDepoEDhzUAJr/XMAii4g+6LaebKT+b88s=;
 b=E10k9JEW5bNtEhHaiOFSWkMkhN42XPxwilz7eZXk+bBy88jsZDWqKm5AcDT/4BcRVzuNEj
 sAtgJhnwDnNRK3diUB/7rSG2h+O2RrDtX3UZJa+G8EHQHal5VU0kQsGUdKyQMaluyVa5xC
 J5zsCAyBwIF1TBlIkjiAa0DxqDAsru8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-gvbjDvTuMTS9wk3F6BP4nA-1; Tue, 25 Apr 2023 03:45:04 -0400
X-MC-Unique: gvbjDvTuMTS9wk3F6BP4nA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f173bd0d1bso33753805e9.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408701; x=1685000701;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I98COpuRyuDepoEDhzUAJr/XMAii4g+6LaebKT+b88s=;
 b=bvzIPFmKCC5U6RxetjO9CXierJT6BPP10MdiZSpv6VMQCcaOEVEXFbbzedh3Kra07R
 ZGzTLVfDs81xYGrDXZ9uI/n31cAREK3se6/Fau61cFTRkLj+f87X6CON1gj5z35Z3aA6
 rJHqblI3QFCS5r49fHx4cNZpQ3RE588RovwOzaW4CDW1W+GhfwxAjg7gnvaOPYEo4Ns6
 1P3ASE1TWcv3j3Ss7jwZ6dVLfoHlRXU1Wtl6BWA9bLtiQu8EzJnBYJG4szSP2i2tLUBy
 s00c4WFN1pTpDWIqX5vK1538ZYefv/uOn/0hTki0PzOPdG8bCIndMuxlV5gxGHCpGQJa
 5kmg==
X-Gm-Message-State: AAQBX9cgcD1WL0T+acUhFKMRveyloubrIDtD0HLY8E5uyKe00ISMDTVG
 kbKRuXss1bDtRQMOzE0qRbChgXwvANZhb9EKRHohkcqTOMpodauuzYslpuZE9zbORhaZ5adXJG1
 3FYNAtOgv9vu/8m8s0jN9qYXfEVGh8+7ln4DDs8YW5gHlG+CpXxQVuecdx/ym/Pnhn0pX
X-Received: by 2002:adf:facb:0:b0:2f2:e638:1767 with SMTP id
 a11-20020adffacb000000b002f2e6381767mr10971763wrs.39.1682408701598; 
 Tue, 25 Apr 2023 00:45:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350afWR0EXJoLrlaFKej6cConBleBYYVU/VThTfTh0KW5n9ByraUjMwxNQYEEBzgTZCPG+xupHw==
X-Received: by 2002:adf:facb:0:b0:2f2:e638:1767 with SMTP id
 a11-20020adffacb000000b002f2e6381767mr10971735wrs.39.1682408701214; 
 Tue, 25 Apr 2023 00:45:01 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 t12-20020a5d460c000000b002f6962ee703sm12443193wrq.61.2023.04.25.00.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:45:00 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:44:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: [PULL 04/31] meson_options.txt: Enable qom-cast-debug by default again
Message-ID: <0f220121a47fd1c8273eb3a4a67425c608307117.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Thomas Huth <thuth@redhat.com>

This switch had been disabled by default by accident in commit
c55cf6ab03f. But we should enable it by default instead to avoid
regressions in the QOM device hierarchy.

Fixes: c55cf6ab03 ("configure, meson: move some default-disabled options to meson_options.txt")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230417130037.236747-3-thuth@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 meson_options.txt             | 2 +-
 scripts/meson-buildoptions.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson_options.txt b/meson_options.txt
index fc9447d267..2471dd02da 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -315,7 +315,7 @@ option('debug_mutex', type: 'boolean', value: false,
        description: 'mutex debugging support')
 option('debug_stack_usage', type: 'boolean', value: false,
        description: 'measure coroutine stack usage')
-option('qom_cast_debug', type: 'boolean', value: false,
+option('qom_cast_debug', type: 'boolean', value: true,
        description: 'cast debugging support')
 option('gprof', type: 'boolean', value: false,
        description: 'QEMU profiling with gprof',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 009fab1515..d4369a3ad8 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -14,6 +14,7 @@ meson_options_help() {
   printf "%s\n" '                           use idef-parser to automatically generate TCG'
   printf "%s\n" '                           code for the Hexagon frontend'
   printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
+  printf "%s\n" '  --disable-qom-cast-debug cast debugging support'
   printf "%s\n" '  --docdir=VALUE           Base directory for documentation installation'
   printf "%s\n" '                           (can be empty) [share/doc]'
   printf "%s\n" '  --enable-block-drv-whitelist-in-tools'
@@ -35,7 +36,6 @@ meson_options_help() {
   printf "%s\n" '  --enable-module-upgrades try to load modules from alternate paths for'
   printf "%s\n" '                           upgrades'
   printf "%s\n" '  --enable-profiler        profiler support'
-  printf "%s\n" '  --enable-qom-cast-debug  cast debugging support'
   printf "%s\n" '  --enable-rng-none        dummy RNG, avoid using /dev/(u)random and'
   printf "%s\n" '                           getrandom()'
   printf "%s\n" '  --enable-strip           Strip targets on install'
-- 
MST


