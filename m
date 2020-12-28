Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6810F2E64D0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 16:54:39 +0100 (CET)
Received: from localhost ([::1]:57090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktur0-00067i-E3
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 10:54:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zeha@debian.org>) id 1ktu9t-0005SR-S7
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 10:10:05 -0500
Received: from ns1.namespace.at ([213.208.148.230]:42670
 helo=nlay-fle-service01.in.namespace.at)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zeha@debian.org>) id 1ktu9s-0001VD-0p
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 10:10:05 -0500
Received: from [10.100.0.62] (helo=debbuild.in.namespace.at)
 by nlay-fle-service01.in.namespace.at with smtp (Exim 4.92)
 (envelope-from <zeha@debian.org>)
 id 1ktu9n-00E0WA-0J; Mon, 28 Dec 2020 16:09:59 +0100
Received: (nullmailer pid 232615 invoked by uid 1000);
 Mon, 28 Dec 2020 15:09:58 -0000
From: Chris Hofstaedtler <zeha@debian.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: fix Cocoa option in summary
Date: Mon, 28 Dec 2020 15:09:58 +0000
Message-Id: <20201228150958.232564-1-zeha@debian.org>
X-Mailer: git-send-email 2.30.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=213.208.148.230; envelope-from=zeha@debian.org;
 helo=nlay-fle-service01.in.namespace.at
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Dec 2020 10:50:32 -0500
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
Cc: peter.maydell@linaro.org, Chris Hofstaedtler <chris@hofstaedtler.name>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chris Hofstaedtler <chris@hofstaedtler.name>

Regression introduced in f9332757898.

Signed-off-by: Chris Hofstaedtler <chris@hofstaedtler.name>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index e864cdd155..9c152a85bd 100644
--- a/meson.build
+++ b/meson.build
@@ -2112,7 +2112,7 @@ summary_info += {'strip binaries':    get_option('strip')}
 summary_info += {'profiler':          config_host.has_key('CONFIG_PROFILER')}
 summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
 if targetos == 'darwin'
-  summary_info += {'Cocoa support': config_host.has_key('CONFIG_COCOA')}
+  summary_info += {'Cocoa support': config_host_data.get('CONFIG_COCOA', false)}
 endif
 # TODO: add back version
 summary_info += {'SDL support':       sdl.found()}
-- 
2.29.2


