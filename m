Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C2D3AD5DC
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:27:57 +0200 (CEST)
Received: from localhost ([::1]:49310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNu0-0002W9-B4
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYU-0007CK-TX
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYL-0006Il-VO
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oBe0/1JgBc88N8uxFBcYiUFm3RN0++pDnyMFfeCSi9M=;
 b=JyDi66ywQYxHgANcjUi6MK1K8YKQ2rRMVCDzjAT2+KsPe72gq59WLeJbBHD0BXNWDJY7/Y
 VVQWNUGr5GTKIawHcjSLXnDRas74J50VFJHbB6Kir4XFrF8uQTM4TqM+FMPtQYITDEhqXu
 jTHQr5Gcr85AaVWzKD4n3n8GsDSnhDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-71NKxsE2MuqmfF4u4tUzBA-1; Fri, 18 Jun 2021 19:05:31 -0400
X-MC-Unique: 71NKxsE2MuqmfF4u4tUzBA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E4231084F56;
 Fri, 18 Jun 2021 23:05:30 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7EFF1017CE5;
 Fri, 18 Jun 2021 23:05:29 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/72] python/qemu-ga-client: add entry point
Date: Fri, 18 Jun 2021 19:04:12 -0400
Message-Id: <20210618230455.2891199-30-jsnow@redhat.com>
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

Remove the shebang, and add a package-defined entry point instead. Now,
it can be accessed using 'qemu-ga-client' from the command line after
installing the package.

The next commit adds a forwarder shim that allows the running of this
script without needing to install the package again.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210604155532.1499282-11-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/qmp/qemu_ga_client.py | 2 --
 python/setup.cfg                  | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)
 mode change 100755 => 100644 python/qemu/qmp/qemu_ga_client.py

diff --git a/python/qemu/qmp/qemu_ga_client.py b/python/qemu/qmp/qemu_ga_client.py
old mode 100755
new mode 100644
index d2938ad47c..67ac0b4211
--- a/python/qemu/qmp/qemu_ga_client.py
+++ b/python/qemu/qmp/qemu_ga_client.py
@@ -1,5 +1,3 @@
-#!/usr/bin/env python3
-
 """
 QEMU Guest Agent Client
 
diff --git a/python/setup.cfg b/python/setup.cfg
index 6b6be8b03c..7f3c59d74e 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -50,6 +50,7 @@ console_scripts =
     qom-list = qemu.qmp.qom:QOMList.entry_point
     qom-tree = qemu.qmp.qom:QOMTree.entry_point
     qom-fuse = qemu.qmp.qom_fuse:QOMFuse.entry_point [fuse]
+    qemu-ga-client = qemu.qmp.qemu_ga_client:main
 
 [flake8]
 extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
-- 
2.31.1


