Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB534C3540
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:01:30 +0100 (CET)
Received: from localhost ([::1]:43500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJMn-0007tH-NV
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:01:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nNJ15-0001Cx-9u
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:39:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nNJ13-0003TQ-Fd
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:39:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645727926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ugp1mdgJb26JDdeFglnw+DikYi1b0WF4j+loVws/Ih4=;
 b=BAJpL/2lLt6JAUcThokPudC3Bxn4INGoAXkumfSsLc6+8R3mKENKUgrf8lkSRyWa5gT1qv
 CS7UOk3yT2l423Nh9TYWnuiF2HetAexClez0sER+LT/+4DbXMjZEjg6CAR6c/u2tjMIbhG
 CKKGy/HuRrValf99BlNp41t8ffTzBLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-HVJZw08zOVuBYi6QlsanPw-1; Thu, 24 Feb 2022 13:38:45 -0500
X-MC-Unique: HVJZw08zOVuBYi6QlsanPw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12849801AAD;
 Thu, 24 Feb 2022 18:38:44 +0000 (UTC)
Received: from localhost (unknown [10.39.208.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4569D818FA;
 Thu, 24 Feb 2022 18:38:39 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 09/12] scripts/modinfo-collect: remove unused/dead code
Date: Thu, 24 Feb 2022 22:36:58 +0400
Message-Id: <20220224183701.608720-10-marcandre.lureau@redhat.com>
In-Reply-To: <20220224183701.608720-1-marcandre.lureau@redhat.com>
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
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


