Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B05F37EFBB
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 01:22:28 +0200 (CEST)
Received: from localhost ([::1]:43990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgyBP-0006tu-B6
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 19:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2t-0002UI-7C
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2q-0006Ey-8A
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620861215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mj9pLSbbhuItTlGL4OPdaXMMF9vj9VVUpbC7cDZzetg=;
 b=AoWb8I+QQQOIN6WdtObNjVjJktEvSE79AGg50wGbE4sUe+8TDfZ7MRulzpfrwK6PH8lIcS
 LYefjxccrdobATNQmV5t7yv1748QgpacG0LtLUK+eoDFaQPy/dKWm/Bi9+EIFfyzMXpHs0
 R1N756GE/hdN8MaZuPOAT9jtSJzSyK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-DP4xTcDeNKulJCPtOODrzg-1; Wed, 12 May 2021 19:13:33 -0400
X-MC-Unique: DP4xTcDeNKulJCPtOODrzg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F99D64157;
 Wed, 12 May 2021 23:13:32 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E48E3629DA;
 Wed, 12 May 2021 23:13:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 14/25] python: Add flake8 to pipenv
Date: Wed, 12 May 2021 19:12:30 -0400
Message-Id: <20210512231241.2816122-15-jsnow@redhat.com>
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

flake8 3.5.x does not support the --extend-ignore syntax used in the
.flake8 file to gracefully extend default ignores, so 3.6.x is our
minimum requirement. There is no known upper bound.

flake8 can be run from the python/ directory with no arguments.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
---
 python/Pipfile      |  1 +
 python/Pipfile.lock | 55 ++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/python/Pipfile b/python/Pipfile
index aaee00581eb..cc43445ef8f 100644
--- a/python/Pipfile
+++ b/python/Pipfile
@@ -4,6 +4,7 @@ url = "https://pypi.org/simple"
 verify_ssl = true
 
 [dev-packages]
+flake8 = ">=3.6.0"
 pylint = ">=2.7.0"
 
 [packages]
diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index b5e556d265b..dd2fafadd61 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -1,7 +1,7 @@
 {
     "_meta": {
         "hash": {
-            "sha256": "2016d2670f203ed4ffac9f59cdfbc540f209ad76eff28e484f245f401d524f5c"
+            "sha256": "4a4a9c6e09d9c5ce670fe4d067052a743dc3eff93c4790f9da31a0db2a66f8fc"
         },
         "pipfile-spec": 6,
         "requires": {
@@ -25,6 +25,22 @@
             "markers": "python_version >= '3.6'",
             "version": "==2.5.2"
         },
+        "flake8": {
+            "hashes": [
+                "sha256:12d05ab02614b6aee8df7c36b97d1a3b2372761222b19b58621355e82acddcff",
+                "sha256:78873e372b12b093da7b5e5ed302e8ad9e988b38b063b61ad937f26ca58fc5f0"
+            ],
+            "index": "pypi",
+            "version": "==3.9.0"
+        },
+        "importlib-metadata": {
+            "hashes": [
+                "sha256:1cedf994a9b6885dcbb7ed40b24c332b1de3956319f4b1a0f07c0621d453accc",
+                "sha256:c9c1b6c7dbc62084f3e6a614a194eb16ded7947736c18e3300125d5c0a7a8b3c"
+            ],
+            "markers": "python_version < '3.8'",
+            "version": "==3.9.1"
+        },
         "isort": {
             "hashes": [
                 "sha256:0a943902919f65c5684ac4e0154b1ad4fac6dcaa5d9f3426b732f1c8b5419be6",
@@ -68,6 +84,22 @@
             ],
             "version": "==0.6.1"
         },
+        "pycodestyle": {
+            "hashes": [
+                "sha256:514f76d918fcc0b55c6680472f0a37970994e07bbb80725808c17089be302068",
+                "sha256:c389c1d06bf7904078ca03399a4816f974a1d590090fecea0c63ec26ebaf1cef"
+            ],
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "version": "==2.7.0"
+        },
+        "pyflakes": {
+            "hashes": [
+                "sha256:7893783d01b8a89811dd72d7dfd4d84ff098e5eed95cfa8905b22bbffe52efc3",
+                "sha256:f5bc8ecabc05bb9d291eb5203d6810b49040f6ff446a756326104746cc00c1db"
+            ],
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "version": "==2.3.1"
+        },
         "pylint": {
             "hashes": [
                 "sha256:0e21d3b80b96740909d77206d741aa3ce0b06b41be375d92e1f3244a274c1f8a",
@@ -81,7 +113,7 @@
                 "sha256:806143ae5bfb6a3c6e736a764057db0e6a0e05e338b5630894a5f779cabb4f9b",
                 "sha256:b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f"
             ],
-            "markers": "python_version >= '2.6' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "markers": "python_version >= '2.6' and python_version not in '3.0, 3.1, 3.2'",
             "version": "==0.10.2"
         },
         "typed-ast": {
@@ -117,14 +149,31 @@
                 "sha256:d746a437cdbca200622385305aedd9aef68e8a645e385cc483bdc5e488f07166",
                 "sha256:e683e409e5c45d5c9082dc1daf13f6374300806240719f95dc783d1fc942af10"
             ],
-            "markers": "python_version < '3.8' and implementation_name == 'cpython'",
+            "markers": "implementation_name == 'cpython' and python_version < '3.8'",
             "version": "==1.4.2"
         },
+        "typing-extensions": {
+            "hashes": [
+                "sha256:7cb407020f00f7bfc3cb3e7881628838e69d8f3fcab2f64742a5e76b2f841918",
+                "sha256:99d4073b617d30288f569d3f13d2bd7548c3a7e4c8de87db09a9d29bb3a4a60c",
+                "sha256:dafc7639cde7f1b6e1acc0f457842a83e722ccca8eef5270af2d74792619a89f"
+            ],
+            "markers": "python_version < '3.8'",
+            "version": "==3.7.4.3"
+        },
         "wrapt": {
             "hashes": [
                 "sha256:b62ffa81fb85f4332a4f609cab4ac40709470da05643a082ec1eb88e6d9b97d7"
             ],
             "version": "==1.12.1"
+        },
+        "zipp": {
+            "hashes": [
+                "sha256:3607921face881ba3e026887d8150cca609d517579abe052ac81fc5aeffdbd76",
+                "sha256:51cb66cc54621609dd593d1787f286ee42a5c0adbb4b29abea5a63edc3e03098"
+            ],
+            "markers": "python_version >= '3.6'",
+            "version": "==3.4.1"
         }
     }
 }
-- 
2.30.2


