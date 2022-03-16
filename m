Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02C24DAE11
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 11:07:59 +0100 (CET)
Received: from localhost ([::1]:58434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUQZT-0000YZ-1V
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 06:07:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQLn-0001AZ-KS
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:53:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nUQLm-0007oO-4K
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:53:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647424429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ugp1mdgJb26JDdeFglnw+DikYi1b0WF4j+loVws/Ih4=;
 b=eTPTwyKRdZpCs7WiPcbBkGQf4Q9zmL+fKiE9IjuEAwUbGmAV5LcgBOBFdf8oNHwREvCdU+
 U3OkWtjTBh88R33xqRWpVx7ciKqImDQaX2ivIWNauH5fjmKfNvX++M7WDk/JQGhO5szX4o
 GPeZ9H2gSz7wKfv2WIpMzEcjTaCEOxE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-dAD6d7riOlKlPMLmkRHQuQ-1; Wed, 16 Mar 2022 05:53:48 -0400
X-MC-Unique: dAD6d7riOlKlPMLmkRHQuQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4817F1875069
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 09:53:48 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B71B1427AE4;
 Wed, 16 Mar 2022 09:53:46 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 14/27] scripts/modinfo-collect: remove unused/dead code
Date: Wed, 16 Mar 2022 13:53:44 +0400
Message-Id: <20220316095344.2613706-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/modinfo-collect.py | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/scripts/modinfo-collect.py b/scripts/modinfo-collect.py
index 61b90688c6dc..4e7584df6676 100755
--- a/scripts/modinfo-collect.py
+++ b/scripts/modinfo-collect.py
@@ -18,13 +18,8 @@ def find_command(src, target, compile_commands):
 
 def process_command(src, command):
     skip = False
-    arg = False
     out = []
     for item in shlex.split(command):
-        if arg:
-            out.append(x)
-            arg = False
-            continue
         if skip:
             skip = False
             continue
-- 
2.35.1.273.ge6ebfd0e8cbb


