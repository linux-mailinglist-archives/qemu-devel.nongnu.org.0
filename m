Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B04520FA8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 10:23:52 +0200 (CEST)
Received: from localhost ([::1]:37508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noL9r-0006vS-VE
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 04:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1noL0z-0001p5-Ih
 for qemu-devel@nongnu.org; Tue, 10 May 2022 04:14:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1noL0w-0005fs-VD
 for qemu-devel@nongnu.org; Tue, 10 May 2022 04:14:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652170478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g+mhDn9yX/zxJI87NKjYqJhXIsf6BgjOGth604Atk+A=;
 b=YUeQL3hSHaL+Rdl/xLo55FGHVtpXK61v08Vvyagl1+PKQP9/8svDKBkKVmiF8KcxHwS8XT
 AUYQ6vWQTxm/KQ3nNdpmBbIp9mnEeA7eFiuEed07yWvh7MZzKKhzIJU/Zj2tZV1V+EVV+Q
 lP0NK3JnM8EVWipaIM6ORswWsyjgNsE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-QUFCgzQYOlmnnBecmWQSdg-1; Tue, 10 May 2022 04:14:35 -0400
X-MC-Unique: QUFCgzQYOlmnnBecmWQSdg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 125D585A5BE;
 Tue, 10 May 2022 08:14:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E4DD64154C1;
 Tue, 10 May 2022 08:14:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D432B21E6880; Tue, 10 May 2022 10:14:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com,
	eblake@redhat.com
Subject: [PATCH] qapi/pragma: Tidy up comments
Date: Tue, 10 May 2022 10:14:33 +0200
Message-Id: <20220510081433.3289762-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Commit 05ebf841ef "qapi: Enforce command naming rules" inserted new
code between a comment and the code it applies to.  Move the comment
back to its code, and add one for the new code.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/pragma.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qapi/pragma.json b/qapi/pragma.json
index e6a021c19c..7f810b0e97 100644
--- a/qapi/pragma.json
+++ b/qapi/pragma.json
@@ -6,7 +6,7 @@
 # Whitelists to permit QAPI rule violations; think twice before you
 # add to them!
 { 'pragma': {
-    # Commands allowed to return a non-dictionary:
+    # Command names containing '_'
     'command-name-exceptions': [
         'add_client',
         'block_resize',
@@ -24,6 +24,7 @@
         'system_powerdown',
         'system_reset',
         'system_wakeup' ],
+    # Commands allowed to return a non-dictionary
     'command-returns-exceptions': [
         'human-monitor-command',
         'qom-get',
-- 
2.35.1


