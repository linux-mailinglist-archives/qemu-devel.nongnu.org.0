Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 951A72B4490
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:17:21 +0100 (CET)
Received: from localhost ([::1]:38546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keeNk-0002zB-JJ
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:17:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1keeH7-000473-Lb
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:10:29 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:35694 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1keeH5-0002uy-M1
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:10:29 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 36CD541394;
 Mon, 16 Nov 2020 13:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1605532225; x=1607346626; bh=51dhNsumTuqceMjo1bPaFyS4fMWSvIjVY9d
 eYkR5PaE=; b=WVC5zzu9sEydVBuBHAHkN/LJ9pRi92hqEua4Ks1bCPEHFgwXYPD
 MbX/SkqQJ2ZjqRVe8MItR17BcszkpH5nkfmnMYp8ELhm7/f2GuA7FWVomHRas0+S
 FMkjWA8LvmefRnOyQmcxRKjaQsBWpLzWr+cYRbrdk15YqKzuyI6DHqQw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qynjk9wcMXa2; Mon, 16 Nov 2020 16:10:25 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 4E2E741392;
 Mon, 16 Nov 2020 16:10:25 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 16
 Nov 2020 16:10:24 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH for-6.0 6/6] qapi: Deprecate 'query-kvm'
Date: Mon, 16 Nov 2020 16:10:11 +0300
Message-ID: <20201116131011.26607-7-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116131011.26607-1-r.bolshakov@yadro.com>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 08:10:19
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'query-accel' QMP command should be used instead.

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 qapi/machine.json | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 5648d8d24d..130b0dbebc 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -579,6 +579,9 @@
 #
 # Returns information about KVM acceleration
 #
+# Features:
+# @deprecated: This command is deprecated, use 'query-accel' instead.
+#
 # Returns: @AccelInfo
 #
 # Since: 0.14.0
@@ -589,7 +592,8 @@
 # <- { "return": { "enabled": true, "present": true } }
 #
 ##
-{ 'command': 'query-kvm', 'returns': 'AccelInfo' }
+{ 'command': 'query-kvm', 'returns': 'AccelInfo',
+  'features': [ 'deprecated' ] }
 
 ##
 # @query-accel:
-- 
2.29.2


