Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBAC39E83E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:19:47 +0200 (CEST)
Received: from localhost ([::1]:41940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLis-0001iO-JP
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLX1-0004F0-V6
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLWt-0006Ux-DC
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623096442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VTvYJjV0DdCsRUQ2Qj9FZq4CydYoH9OZSoyEzd+P5O4=;
 b=A3GSwaYBaBf69R5SfY+93RX6hj8esO3G0zqi60ZRqGvS2Llx3pCimsZ5EKPxua7q3cd2qS
 IJPrsx36I03LFnZR419qDmAh3NdA2PxGwLnuGPHfB3Jp+H2RhzBAL958770x4heDgrsw0T
 p6IpnPhG/Hv48Q8ArUtZABR9f2HKTDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-W94eu-0IPjOGLihYocCOGw-1; Mon, 07 Jun 2021 16:07:19 -0400
X-MC-Unique: W94eu-0IPjOGLihYocCOGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53D3A80EDB9;
 Mon,  7 Jun 2021 20:07:07 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92BEE5C1C2;
 Mon,  7 Jun 2021 20:07:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/42] scripts/qmp-shell: remove if-raise-else patterns
Date: Mon,  7 Jun 2021 16:06:22 -0400
Message-Id: <20210607200649.1840382-16-jsnow@redhat.com>
In-Reply-To: <20210607200649.1840382-1-jsnow@redhat.com>
References: <20210607200649.1840382-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: "Niteesh G . S ." <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Shushes pylint. I don't always mind these patterns personally, but I'm
not as sure that I want to remove the warning from pylint's repertoire
entirely. Oh well.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 80cd432607..bf7a49dfc1 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -204,8 +204,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
                 if type(parent[optpath[-1]]) is dict:
                     msg = 'Cannot use "{:s}" as both leaf and non-leaf key'
                     raise QMPShellError(msg.format('.'.join(curpath)))
-                else:
-                    raise QMPShellError(f'Cannot set "{key}" multiple times')
+                raise QMPShellError(f'Cannot set "{key}" multiple times')
             parent[optpath[-1]] = value
 
     def __build_cmd(self, cmdline):
@@ -309,13 +308,14 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         except EOFError:
             print()
             return False
+
         if cmdline == '':
             for event in self.get_events():
                 print(event)
             self.clear_events()
             return True
-        else:
-            return self._execute_cmd(cmdline)
+
+        return self._execute_cmd(cmdline)
 
     def set_verbosity(self, verbose):
         self._verbose = verbose
-- 
2.31.1


