Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6023137EFC2
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 01:25:55 +0200 (CEST)
Received: from localhost ([::1]:59990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgyEk-00010r-7k
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 19:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy31-0002bS-FJ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2z-0006P8-S7
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620861224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pfCCvJB13gZJgiTwVC+VYkurXwVoHrqfRd0EAePDQe0=;
 b=GSo59R8qmaChlFcECoLKFDcS42jdt/Xcali/vlQYoOK+twMELxIZhi8qcYGdIqQwxR0sj5
 ikMUIk1UqZTmd7GT3Lbd7JzKCRD9SVT0jhwfC3zoupE1wcyweYhRXnQ2MprHFJddqaKDj3
 +5WyJOjZXj5Hy/sx4KpuFTiGak+lY0w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-_9gWnyGXPeSOEZcaAwWh7Q-1; Wed, 12 May 2021 19:13:41 -0400
X-MC-Unique: _9gWnyGXPeSOEZcaAwWh7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C7DE1005D4E;
 Wed, 12 May 2021 23:13:40 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E12B5D736;
 Wed, 12 May 2021 23:13:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 18/25] python/qemu: add isort to pipenv
Date: Wed, 12 May 2021 19:12:34 -0400
Message-Id: <20210512231241.2816122-19-jsnow@redhat.com>
In-Reply-To: <20210512231241.2816122-1-jsnow@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isort 5.0.0 through 5.0.4 has a bug that causes it to misinterpret
certain "from ..." clauses that are not related to imports.

isort < 5.1.1 has a bug where it does not handle comments near import
statements correctly.

Require 5.1.2 or greater.

isort can be run with 'isort -c qemu' from the python root.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Pipfile      | 1 +
 python/Pipfile.lock | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/python/Pipfile b/python/Pipfile
index bb2e34b381d..fb7c8d142ee 100644
--- a/python/Pipfile
+++ b/python/Pipfile
@@ -5,6 +5,7 @@ verify_ssl = true
 
 [dev-packages]
 flake8 = ">=3.6.0"
+isort = ">=5.1.2"
 mypy = ">=0.770"
 pylint = ">=2.7.0"
 
diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index 2b1567b359c..030d5683147 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -1,7 +1,7 @@
 {
     "_meta": {
         "hash": {
-            "sha256": "5e5b76eb2f6d8e833b79d9f083f08e0087b3e663275a00b84a6799419aa8a776"
+            "sha256": "e1f54e4d7fc287bdff731659614f5f9bbea2f1aee122ba04506ab26c4007440e"
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
2.30.2


