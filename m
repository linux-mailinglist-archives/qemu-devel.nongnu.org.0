Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F3F3B7A0A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 23:47:36 +0200 (CEST)
Received: from localhost ([::1]:34008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyLZv-0007rA-Fn
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 17:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyLW8-0000GA-WB
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 17:43:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyLW6-0005fI-Bq
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 17:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625003017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8AFwMd/IvOrS06R+jOgnr74N8V7Fx5meIpLSd4eLMdA=;
 b=IoNdYeHIr2hgXvE4U6nYSrGnU4HxXih7M0Fyg4AWF5v2LoZLrT3VrBrOPBJXJV5psr1eVY
 zO0pSGe/x/V798jntNWIRvGL431vMww9e89qb1oVogZpQ8EMKn7abbvrI0R/sH3wkgkG/8
 G4b9jDXFtCR0lWxnvWOmbgMPYlz4pLc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-EdO1iMnNMwGuXBsZ6RvuXg-1; Tue, 29 Jun 2021 17:43:33 -0400
X-MC-Unique: EdO1iMnNMwGuXBsZ6RvuXg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBF0C1835AC5;
 Tue, 29 Jun 2021 21:43:32 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B647360C13;
 Tue, 29 Jun 2021 21:43:31 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/15] python/qom: Do not use 'err' name at module scope
Date: Tue, 29 Jun 2021 17:43:09 -0400
Message-Id: <20210629214323.1329806-2-jsnow@redhat.com>
In-Reply-To: <20210629214323.1329806-1-jsnow@redhat.com>
References: <20210629214323.1329806-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pylint updated to 2.9.0 upstream, adding new warnings for things that
re-use the 'err' variable. Luckily, this only breaks the
python-check-tox job, which is allowed to fail as a warning.

Signed-off-by: John Snow <jsnow@redhat.com>

---

I guess that's good enough evidence that check-pipenv and check-tox both
have their place :)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/qmp/qom.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/python/qemu/qmp/qom.py b/python/qemu/qmp/qom.py
index 7ec7843d57..8ff28a8343 100644
--- a/python/qemu/qmp/qom.py
+++ b/python/qemu/qmp/qom.py
@@ -38,8 +38,8 @@
 
 try:
     from .qom_fuse import QOMFuse
-except ModuleNotFoundError as err:
-    if err.name != 'fuse':
+except ModuleNotFoundError as _err:
+    if _err.name != 'fuse':
         raise
 else:
     assert issubclass(QOMFuse, QOMCommand)
-- 
2.31.1


