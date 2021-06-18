Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9B93AD5D2
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:25:56 +0200 (CEST)
Received: from localhost ([::1]:41032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNs2-0005Bm-Se
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYY-0007GE-P8
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYV-0006Lu-QT
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BoPsFNIPvoMwNPQxFCM3J1A6Q/7uBBrMGhibXgyZO4o=;
 b=LVQAwh6zekglZysXeZrzH0YHoLlvBaEnf4df2TMTZy7kEg4+P5WKrUd+wQGbTM21kmdOxn
 6qrX12H4R0poYgFoZ/Loi2iEuUdza2n/J6m8LQsBpS2KbXxcSh17GkvLGXtTFcqjIWEwn7
 O3Spakd53oyJbligojOJ9cm39zuk9b4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-hRXVc5fcOYyOVo24LDNcGQ-1; Fri, 18 Jun 2021 19:05:41 -0400
X-MC-Unique: hRXVc5fcOYyOVo24LDNcGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C49A65074E;
 Fri, 18 Jun 2021 23:05:40 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A79E101E249;
 Fri, 18 Jun 2021 23:05:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 38/72] scripts/qmp-shell: Use python3-style super()
Date: Fri, 18 Jun 2021 19:04:21 -0400
Message-Id: <20210618230455.2891199-39-jsnow@redhat.com>
In-Reply-To: <20210618230455.2891199-1-jsnow@redhat.com>
References: <20210618230455.2891199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210607200649.1840382-9-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index f354549bf2..3066e37ae5 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -112,7 +112,7 @@ class FuzzyJSON(ast.NodeTransformer):
 #       _execute_cmd()). Let's design a better one.
 class QMPShell(qmp.QEMUMonitorProtocol):
     def __init__(self, address, pretty=False):
-        super(QMPShell, self).__init__(self.parse_address(address))
+        super().__init__(self.parse_address(address))
         self._greeting = None
         self._completer = None
         self._pretty = pretty
@@ -281,7 +281,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         return True
 
     def connect(self, negotiate: bool = True):
-        self._greeting = super(QMPShell, self).connect(negotiate)
+        self._greeting = super().connect(negotiate)
         self.__completer_setup()
 
     def show_banner(self, msg='Welcome to the QMP low-level shell!'):
@@ -322,7 +322,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
 
 class HMPShell(QMPShell):
     def __init__(self, address):
-        QMPShell.__init__(self, address)
+        super().__init__(address)
         self.__cpu_index = 0
 
     def __cmd_completion(self):
-- 
2.31.1


