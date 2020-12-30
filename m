Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16922E7CF1
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 23:18:12 +0100 (CET)
Received: from localhost ([::1]:42552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kujnH-0007R3-UB
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 17:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@hofstaedtler.name>)
 id 1kujlm-0006rC-SN
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 17:16:41 -0500
Received: from mail.namespace.at ([2a01:190:1801:100::235]:40328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@hofstaedtler.name>)
 id 1kujlk-0001mn-80
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 17:16:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=hofstaedtler.name; s=a; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rgtaYSrVc+o8RX+T+kdMBWVHNDU1RdsXVl0ZEAHclg0=; b=XEiy4YOD0nd6xfZpX1U5hyTo13
 AKlgcs7HSzq+Jce+9FJREVISMADlp+vwlVJTiD0aQP/6gUcdVRozOAKoJNtSocgcCxdDqmmhxBnaR
 HCpOItN9Ty76pdHxZJUvjFp2NX//Jc8g74UF2YhzrbG8BvBCJ9ObAyKenqIhx1H6J4bKfw/iDQS7x
 U1yvKuj1/6LvBM4KtUeb+D70/ksPSJ2dStm1gFyQiyXOdYFXCSxNa9XDpsN8D3orW9VrtB/Et2dcz
 ww9dBjbG+plXkj0juBftv2gCGm9NY4kFQzhdFpPEd7RaUyFBKn+/JbC4ZVlSaI9uLAWlxHqRMm68A
 GRH43ASA==;
From: Chris Hofstaedtler <chris@hofstaedtler.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] meson: fix Cocoa option in summary
Date: Wed, 30 Dec 2020 23:16:23 +0100
Message-Id: <20201230221623.60423-1-chris@hofstaedtler.name>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:190:1801:100::235;
 envelope-from=chris@hofstaedtler.name; helo=mail.namespace.at
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Chris Hofstaedtler <chris@hofstaedtler.name>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cocoa support was always shown as "no", even it if was enabled.

Fixes: b4e312e953b ("configure: move cocoa option to Meson")
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Chris Hofstaedtler <chris@hofstaedtler.name>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 372576f82c..1112ca8fc2 100644
--- a/meson.build
+++ b/meson.build
@@ -2082,7 +2082,7 @@ summary_info += {'strip binaries':    get_option('strip')}
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


