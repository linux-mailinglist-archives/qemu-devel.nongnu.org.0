Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EA33AD5FC
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:33:30 +0200 (CEST)
Received: from localhost ([::1]:37964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNzN-0005rf-Ls
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYl-0007na-Ra
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYj-0006Ye-OE
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdntNT1nQ+CAKfvOQGTyMNvISbFBCs9zN/h0WW8mTHE=;
 b=NZEJ8cj9PxqL6kCuJxcOj+M1OMZGJSbp5sd3QHjD3BXXo7fnrx6FWCaHYX4t4MwDytpofm
 SqkeC87ldgE9F1l8XhiKQeGpyiqpfw52BGvF9UgDAnHWsii32hBtUQzTke3yD2e+/I3a07
 tuofMtME3xog5IEPN6Q3tQ/f5l1IVi0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-IfYpk_HyPoiNCGI_elvZiQ-1; Fri, 18 Jun 2021 19:05:53 -0400
X-MC-Unique: IfYpk_HyPoiNCGI_elvZiQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A257018D6A25;
 Fri, 18 Jun 2021 23:05:52 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFB6C1000358;
 Fri, 18 Jun 2021 23:05:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 48/72] scripts/qmp-shell: Add pretty attribute to HMP shell
Date: Fri, 18 Jun 2021 19:04:31 -0400
Message-Id: <20210618230455.2891199-49-jsnow@redhat.com>
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

It's less useful, but it makes the initialization methods LSP
consistent, which quiets a mypy complaint.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210607200649.1840382-19-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 5317dcd516..de5fa189f0 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -322,8 +322,8 @@ class QMPShell(qmp.QEMUMonitorProtocol):
 
 
 class HMPShell(QMPShell):
-    def __init__(self, address):
-        super().__init__(address)
+    def __init__(self, address, pretty=False):
+        super().__init__(address, pretty)
         self.__cpu_index = 0
 
     def __cmd_completion(self):
@@ -421,12 +421,9 @@ def main():
     if args.qmp_server is None:
         parser.error("QMP socket or TCP address must be specified")
 
-    qemu: QMPShell
+    shell_class = HMPShell if args.hmp else QMPShell
     try:
-        if args.hmp:
-            qemu = HMPShell(args.qmp_server)
-        else:
-            qemu = QMPShell(args.qmp_server, args.pretty)
+        qemu = shell_class(args.qmp_server, args.pretty)
     except qmp.QMPBadPortError:
         parser.error(f"Bad port number: {args.qmp_server}")
         return  # pycharm doesn't know error() is noreturn
-- 
2.31.1


