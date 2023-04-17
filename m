Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D02C6E4924
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 15:02:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poOTa-000282-9Y; Mon, 17 Apr 2023 09:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poOTT-00025I-5b
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:00:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poOTQ-0005Ly-1y
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:00:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681736447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DLOUJzNnosr5HrSSJLBAoIyWiXlR8bNif4y5DqYZq0k=;
 b=D2O36xWctn6Q2tbcSX3KwgWabMT2prgIf43UqFw38WDNYZkNTKfQ1IIbxjHOCGNVt3OOsI
 h2/kDV9CEKo3jZfvxUFpbxOYSZ6PDLJqy3NeoDW3DTF6gLVE9cRxg/tsOdGufa2NTAm2ni
 c5YEC6N0YihCKOTsQT5TYeITDrXGZr8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-U4jiS0uSOUmm218h-FFwbg-1; Mon, 17 Apr 2023 09:00:44 -0400
X-MC-Unique: U4jiS0uSOUmm218h-FFwbg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA05F857FB2;
 Mon, 17 Apr 2023 13:00:43 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B34C42166B26;
 Mon, 17 Apr 2023 13:00:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Fan Ni <fan.ni@samsung.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/2] meson_options.txt: Enable qom-cast-debug by default again
Date: Mon, 17 Apr 2023 15:00:37 +0200
Message-Id: <20230417130037.236747-3-thuth@redhat.com>
In-Reply-To: <20230417130037.236747-1-thuth@redhat.com>
References: <20230417130037.236747-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

This switch had been disabled by default by accident in commit
c55cf6ab03f. But we should enable it by default instead to avoid
regressions in the QOM device hierarchy.

Fixes: c55cf6ab03 ("configure, meson: move some default-disabled options to meson_options.txt")
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
2.31.1


