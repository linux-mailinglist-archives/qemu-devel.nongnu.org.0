Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4B7573413
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 12:24:19 +0200 (CEST)
Received: from localhost ([::1]:39716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBZXV-0002Do-1S
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 06:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oBZSh-000621-TZ
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 06:19:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oBZSf-0007fm-7a
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 06:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657707556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aj86G5T1F6qGl2vA8dbwjstChEP5M13Wm1d7zFw3cTE=;
 b=iqZWAQAS1bk3K5XV+TAX/+ygpiQOrVbQifnU5W0EeEjUP1H8/4kVO/zYzPlzg2KxdTI2x8
 Ws4yxZnhDJ9pBLGCtvwPH8YITDqCuMgkWLi8MWA6leBiYHC0KXa0dVSPLUCNXsowZvN3tI
 4iwxeOWNqvduT8TswS1hkSh7k238mDU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-LwCXHL7GMjCXbrSIpnGZUw-1; Wed, 13 Jul 2022 06:19:15 -0400
X-MC-Unique: LwCXHL7GMjCXbrSIpnGZUw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABC4A101A54E;
 Wed, 13 Jul 2022 10:19:14 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.40.194.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC74E1121314;
 Wed, 13 Jul 2022 10:19:13 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 2/3] qapi: Avoid generating C identifier 'linux'
Date: Wed, 13 Jul 2022 13:19:07 +0300
Message-Id: <20220713101908.2212307-3-kkostiuk@redhat.com>
In-Reply-To: <20220713101908.2212307-1-kkostiuk@redhat.com>
References: <20220713101908.2212307-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
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

From: zhenwei pi <pizhenwei@bytedance.com>

'linux' is not usable as identifier, because C compilers targeting
Linux predefine it as a macro expanding to 1.  Add it to
@polluted_words. 'unix' is already there.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Message-Id: <20220707005602.696557-2-pizhenwei@bytedance.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 scripts/qapi/common.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 489273574a..737b059e62 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -114,7 +114,7 @@ def c_name(name: str, protect: bool = True) -> str:
                      'and', 'and_eq', 'bitand', 'bitor', 'compl', 'not',
                      'not_eq', 'or', 'or_eq', 'xor', 'xor_eq'])
     # namespace pollution:
-    polluted_words = set(['unix', 'errno', 'mips', 'sparc', 'i386'])
+    polluted_words = set(['unix', 'errno', 'mips', 'sparc', 'i386', 'linux'])
     name = re.sub(r'[^A-Za-z0-9_]', '_', name)
     if protect and (name in (c89_words | c99_words | c11_words | gcc_words
                              | cpp_words | polluted_words)
-- 
2.25.1


