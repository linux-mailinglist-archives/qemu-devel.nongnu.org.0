Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA651355681
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 16:22:04 +0200 (CEST)
Received: from localhost ([::1]:55822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTmah-0006bt-QJ
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 10:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lTmYE-0003ya-KE
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:19:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lTmYB-0005qZ-Rl
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:19:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617718766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b+uw4DxZje8+TCNOdEo1GWeYc5HmwDH6lDHqSAbWO70=;
 b=Png3rAtUOEfCAOXuGSVbuEe5QyHbgGUmELvRnme1lsZZrvssoG02wlvLsDJ6HRso6Lt/zu
 IrRQ0SwMNO8aNMCSRk9UXlqZ2gb5b3H3uhgseyktAsG47h1Z/Mi2P+YxUmMUbKDRlG5Hci
 WkYr5m9rgWhyFN/Z022JXBHR061Xong=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-tINWHbtyNfqi_Hn2BuZofg-1; Tue, 06 Apr 2021 10:19:23 -0400
X-MC-Unique: tINWHbtyNfqi_Hn2BuZofg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5347A0BC3;
 Tue,  6 Apr 2021 14:19:11 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 325395D6DC;
 Tue,  6 Apr 2021 14:19:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] sphinx: qapidoc: Wrap "If" section body in a paragraph
 node
Date: Tue,  6 Apr 2021 10:19:09 -0400
Message-Id: <20210406141909.1992225-2-jsnow@redhat.com>
In-Reply-To: <20210406141909.1992225-1-jsnow@redhat.com>
References: <20210406141909.1992225-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These sections need to be wrapped in a block-level element, such as
Paragraph in order for them to be rendered into Texinfo correctly.

Before (e.g.):

<section ids="qapidoc-713">
  <title>If</title>
  <literal>defined(CONFIG_REPLICATION)</literal>
</section>

became:

  .SS If
  \fBdefined(CONFIG_REPLICATION)\fP.SS \fBBlockdevOptionsReplication\fP (Object)
  ...


After:

<section ids="qapidoc-713">
  <title>If</title>
  <paragraph>
    <literal>defined(CONFIG_REPLICATION)</literal>
  </paragraph>
</section>

becomes:

  .SS If
  .sp
  \fBdefined(CONFIG_REPLICATION)\fP
  .SS \fBBlockdevOptionsReplication\fP (Object)
  ...


Reported-by: Markus Armbruster <armbru@redhat.com>
Tested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/sphinx/qapidoc.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index b7b86b5dff..b7a2d39c10 100644
--- a/docs/sphinx/qapidoc.py
+++ b/docs/sphinx/qapidoc.py
@@ -278,7 +278,9 @@ def _nodes_for_if_section(self, ifcond):
         nodelist = []
         if ifcond:
             snode = self._make_section('If')
-            snode += self._nodes_for_ifcond(ifcond, with_if=False)
+            snode += nodes.paragraph(
+                '', '', *self._nodes_for_ifcond(ifcond, with_if=False)
+            )
             nodelist.append(snode)
         return nodelist
 
-- 
2.30.2


