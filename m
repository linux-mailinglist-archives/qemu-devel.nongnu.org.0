Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2FA37EFC0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 01:24:26 +0200 (CEST)
Received: from localhost ([::1]:52454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgyDJ-0004FV-8P
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 19:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy36-0002fw-Sm
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy34-0006St-BA
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620861229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36x1IjXhovfT+2JFu3CG04WLQV+4eJKav+w2/61E75c=;
 b=dLUxh5YZllfWt5+M0AGy/U0tCCFqKxoaGWg8dPkGmXmvL5xhR/VP/HzpQ2N35xsFEiAH8s
 ItK2CssXrnvBNyhlKVk8/kKjQVrwzAcZbUYaJZlBBGlcjT3/I7qofzcMCgstExcHBnH8bR
 BuTYL3jCAcee60c+qI7u6aCDJYuo5k4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-nRpflWg5M4aJDELkuVI7nQ-1; Wed, 12 May 2021 19:13:48 -0400
X-MC-Unique: nRpflWg5M4aJDELkuVI7nQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D959E64149;
 Wed, 12 May 2021 23:13:46 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C551D62A02;
 Wed, 12 May 2021 23:13:41 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 20/25] python: add devel package requirements to setuptools
Date: Wed, 12 May 2021 19:12:36 -0400
Message-Id: <20210512231241.2816122-21-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

setuptools doesn't have a formal understanding of development requires,
but it has an optional feataures section. Fine; add a "devel" feature
and add the requirements to it.

To avoid duplication, we can modify pipenv to install qemu[devel]
instead. This enables us to run invocations like "pip install -e
.[devel]" and test the package on bleeding-edge packages beyond those
specified in Pipfile.lock.

Importantly, this also allows us to install the qemu development
packages in a non-networked mode: `pip3 install --no-index -e .[devel]`
will now fail if the proper development dependencies are not already
met. This can be useful for automated build scripts where fetching
network packages may be undesirable.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Pipfile      |  5 +----
 python/Pipfile.lock | 14 +++++++++-----
 python/setup.cfg    |  9 +++++++++
 3 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/python/Pipfile b/python/Pipfile
index fb23455eadd..e7acb8cefa4 100644
--- a/python/Pipfile
+++ b/python/Pipfile
@@ -4,10 +4,7 @@ url = "https://pypi.org/simple"
 verify_ssl = true
 
 [dev-packages]
-flake8 = ">=3.6.0"
-isort = ">=5.1.2"
-mypy = ">=0.770"
-pylint = ">=2.7.0"
+qemu = {editable = true, extras = ["devel"], path = "."}
 
 [packages]
 qemu = {editable = true,path = "."}
diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index 5d3de43609d..18f3bba08f2 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -1,7 +1,7 @@
 {
     "_meta": {
         "hash": {
-            "sha256": "986164b4c690953890066f288b48c3d84c63df86fc8fa30a26e9001d5b0968e0"
+            "sha256": "eff562a688ebc6f3ffe67494dbb804b883e2159ad81c4d55d96da9f7aec13e91"
         },
         "pipfile-spec": 6,
         "requires": {
@@ -35,7 +35,7 @@
                 "sha256:12d05ab02614b6aee8df7c36b97d1a3b2372761222b19b58621355e82acddcff",
                 "sha256:78873e372b12b093da7b5e5ed302e8ad9e988b38b063b61ad937f26ca58fc5f0"
             ],
-            "index": "pypi",
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3, 3.4'",
             "version": "==3.9.0"
         },
         "importlib-metadata": {
@@ -51,7 +51,7 @@
                 "sha256:0a943902919f65c5684ac4e0154b1ad4fac6dcaa5d9f3426b732f1c8b5419be6",
                 "sha256:2bb1680aad211e3c9944dbce1d4ba09a989f04e238296c87fe2139faa26d655d"
             ],
-            "index": "pypi",
+            "markers": "python_version >= '3.6' and python_version < '4.0'",
             "version": "==5.8.0"
         },
         "lazy-object-proxy": {
@@ -114,7 +114,7 @@
                 "sha256:d65cc1df038ef55a99e617431f0553cd77763869eebdf9042403e16089fe746c",
                 "sha256:d7da2e1d5f558c37d6e8c1246f1aec1e7349e4913d8fb3cb289a35de573fe2eb"
             ],
-            "index": "pypi",
+            "markers": "python_version >= '3.5'",
             "version": "==0.812"
         },
         "mypy-extensions": {
@@ -145,9 +145,13 @@
                 "sha256:0e21d3b80b96740909d77206d741aa3ce0b06b41be375d92e1f3244a274c1f8a",
                 "sha256:d09b0b07ba06bcdff463958f53f23df25e740ecd81895f7d2699ec04bbd8dc3b"
             ],
-            "index": "pypi",
+            "markers": "python_version ~= '3.6'",
             "version": "==2.7.2"
         },
+        "qemu": {
+            "editable": true,
+            "path": "."
+        },
         "toml": {
             "hashes": [
                 "sha256:806143ae5bfb6a3c6e736a764057db0e6a0e05e338b5630894a5f779cabb4f9b",
diff --git a/python/setup.cfg b/python/setup.cfg
index 8a2c200a581..9d941386921 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -19,6 +19,15 @@ classifiers =
 python_requires = >= 3.6
 packages = find_namespace:
 
+[options.extras_require]
+# Run `pipenv lock` when changing these requirements.
+devel =
+    flake8 >= 3.6.0
+    isort >= 5.1.2
+    mypy >= 0.770
+    pylint >= 2.7.0
+
+
 [flake8]
 extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
 exclude = __pycache__,
-- 
2.30.2


