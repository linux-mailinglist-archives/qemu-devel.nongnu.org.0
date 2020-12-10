Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2622D6285
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:53:13 +0100 (CET)
Received: from localhost ([::1]:35682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knPBo-0005DT-Q6
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:53:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOrl-0008R7-8j
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:32:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOrZ-0003Tf-83
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607617934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BWx54JLBdNpUQSWfOzrXU77D94vLd9uJoy+YnRD74FA=;
 b=ZIK0XRItOBODC38GTG58xRn8mSj0jbnDlzE5Od2DL1KgqaXRoH3X2SS2lDMlGeBsPzcH2J
 wi6Z2eJpD68lEiRu1ISoC4f675USdFyaBgtIc/465a59p9rKBFITklWDmLi9SPcxjrBMt/
 XZuLSS1uVaq1bXfy8L0HNYYT2BNK/cQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-P5xuXZoLMNOcRYnNXBPv2g-1; Thu, 10 Dec 2020 11:32:10 -0500
X-MC-Unique: P5xuXZoLMNOcRYnNXBPv2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A4C1100A957;
 Thu, 10 Dec 2020 16:31:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5B7D5C260;
 Thu, 10 Dec 2020 16:31:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D04EC10FA0A9; Thu, 10 Dec 2020 17:31:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/13] ui: Tweak a client_migrate_info error message
Date: Thu, 10 Dec 2020 17:31:26 +0100
Message-Id: <20201210163132.2919935-8-armbru@redhat.com>
In-Reply-To: <20201210163132.2919935-1-armbru@redhat.com>
References: <20201210163132.2919935-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change

    Parameter 'protocol' expects spice

to

    Parameter 'protocol' expects 'spice'

for consistency with similar error messages elsewhere.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201113082626.2725812-7-armbru@redhat.com>
---
 monitor/misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor/misc.c b/monitor/misc.c
index bb102df823..7ffe6f7a84 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -447,7 +447,7 @@ void qmp_client_migrate_info(const char *protocol, const char *hostname,
         return;
     }
 
-    error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol", "spice");
+    error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol", "'spice'");
 }
 
 static void hmp_logfile(Monitor *mon, const QDict *qdict)
-- 
2.26.2


