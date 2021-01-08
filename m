Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03322EFAAB
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 22:39:37 +0100 (CET)
Received: from localhost ([::1]:34062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxzTs-00066W-Db
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 16:39:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kxzSS-0005HW-8n
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 16:38:08 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:38682 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kxzSP-0008Nh-Sv
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 16:38:07 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 7E714412C6;
 Fri,  8 Jan 2021 21:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1610141882; x=
 1611956283; bh=D1D1cGx3wj0Aeut7/TF1nBP9Vg2x7/Gw0rUDYRthG/o=; b=s
 fkgCSEOrEY4ECxm+OkE+LIyjzKyxyGgchNgjDBJNQcLCkra8yly1GMCaglkmdN3e
 /uxvbxrGvQ/82meXmK3OAX0VZORcvO4j13E8mridzWj4Tn+JBrNj5O+saqEFE2wW
 +zaXVET5udN6ApO9Y3+fxHDuuLjWdl1dQ2htFiFjXM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PYgWnRpVoplD; Sat,  9 Jan 2021 00:38:02 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1C02941277;
 Sat,  9 Jan 2021 00:38:01 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sat, 9 Jan
 2021 00:38:01 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] ui/cocoa: Update path to docs in build tree
Date: Sat, 9 Jan 2021 00:38:15 +0300
Message-ID: <20210108213815.64678-1-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU documentation can't be opened if QEMU is run from build tree
because executables are placed in the top of build tree after conversion
to meson.

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 ui/cocoa.m | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index ea3b845b53..13fba8103e 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1176,7 +1176,7 @@ QemuCocoaView *cocoaView;
 - (void) openDocumentation: (NSString *) filename
 {
     /* Where to look for local files */
-    NSString *path_array[] = {@"../share/doc/qemu/", @"../doc/qemu/", @"../docs/"};
+    NSString *path_array[] = {@"../share/doc/qemu/", @"../doc/qemu/", @"docs/"};
     NSString *full_file_path;
     NSURL *full_file_url;
 
-- 
2.29.2


