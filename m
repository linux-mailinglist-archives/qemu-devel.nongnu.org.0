Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C357539380F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 23:40:22 +0200 (CEST)
Received: from localhost ([::1]:55688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmNjp-0000ql-N9
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 17:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmNPw-0005DQ-HS
 for qemu-devel@nongnu.org; Thu, 27 May 2021 17:19:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmNPn-0000nr-MX
 for qemu-devel@nongnu.org; Thu, 27 May 2021 17:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622150379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VMM4zsokxayNHrvGvB1/6QODbH68WwAV6q7/6X3N/uU=;
 b=azqnT2niX+i2S7zV34aUAyH2RtJlglJDdlFw4PWG2unPFX2uh9v6iO4pKZ3YpwI9IhVJK3
 kpJL8wt1BtYLJe0FZu6ftfMKt6YOjH49BwBLZnm6nw8RaFcF2ITDJrsHzwlhVLuaVG3k3k
 HywMYnH7p2GzCmsE/CXfn05qzCmZkTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-TzdVK856OReXMskQHwJK0A-1; Thu, 27 May 2021 17:19:37 -0400
X-MC-Unique: TzdVK856OReXMskQHwJK0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86441801B12;
 Thu, 27 May 2021 21:19:36 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00CE65D9C6;
 Thu, 27 May 2021 21:19:32 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 24/31] python/qemu: add isort to pipenv
Date: Thu, 27 May 2021 17:17:08 -0400
Message-Id: <20210527211715.394144-25-jsnow@redhat.com>
In-Reply-To: <20210527211715.394144-1-jsnow@redhat.com>
References: <20210527211715.394144-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isort 5.0.0 through 5.0.4 has a bug that causes it to misinterpret
certain "from ..." clauses that are not related to imports.

isort < 5.1.1 has a bug where it does not handle comments near import
statements correctly.

Require 5.1.2 or greater.

isort can be run (in "check" mode) with 'isort -c qemu' from the python
root. isort can also be used to fix/rewrite import order automatically
by using 'isort qemu'.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 python/Pipfile      | 1 +
 python/Pipfile.lock | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/python/Pipfile b/python/Pipfile
index 796c6282e17..79c74dd8db4 100644
--- a/python/Pipfile
+++ b/python/Pipfile
@@ -5,6 +5,7 @@ verify_ssl = true
 
 [dev-packages]
 flake8 = ">=3.6.0"
+isort = ">=5.1.2"
 mypy = ">=0.770"
 pylint = ">=2.8.0"
 
diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index 626e68403f7..57a5befb104 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -1,7 +1,7 @@
 {
     "_meta": {
         "hash": {
-            "sha256": "14d171b3d86759e1fdfb9e55f66be4a696b6afa8f627d6c4778f8398c6a66b98"
+            "sha256": "8173290ad57aab0b722c9b4f109519de4e0dd7cd1bad1e16806b78bb169bce08"
         },
         "pipfile-spec": 6,
         "requires": {
@@ -46,7 +46,7 @@
                 "sha256:0a943902919f65c5684ac4e0154b1ad4fac6dcaa5d9f3426b732f1c8b5419be6",
                 "sha256:2bb1680aad211e3c9944dbce1d4ba09a989f04e238296c87fe2139faa26d655d"
             ],
-            "markers": "python_version >= '3.6' and python_version < '4.0'",
+            "index": "pypi",
             "version": "==5.8.0"
         },
         "lazy-object-proxy": {
-- 
2.31.1


