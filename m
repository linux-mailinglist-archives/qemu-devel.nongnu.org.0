Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907343996FF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 02:38:59 +0200 (CEST)
Received: from localhost ([::1]:52182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lobNy-0006oW-IA
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 20:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMW-00047u-31
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMT-0004Th-M7
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622680644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xe5J7uEXnYUxYup+4J75GPBTU88JI9isFkDu2VPG0pc=;
 b=WOIoBeiWEXd/iQmIsinO56Px6mDkcJBo45zA8xGJmfDv5SMPPiHk6a6A4RphyKR6qim6QJ
 f7DJcIYM0bMixwLb1IoFuD4ayU8FPA7NF5Ud87/rikFN13UT9+7yg73hAXhpjZoveA/hN+
 HAlWxR/1V0MjOXFM6eBjdBMYxBDC32s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-dGEtUUYLMLOVTWNevWeN1w-1; Wed, 02 Jun 2021 20:37:22 -0400
X-MC-Unique: dGEtUUYLMLOVTWNevWeN1w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86E42803620;
 Thu,  3 Jun 2021 00:37:21 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C981910013D6;
 Thu,  3 Jun 2021 00:37:20 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/19] python/pipenv: Update Pipfile.lock
Date: Wed,  2 Jun 2021 20:37:01 -0400
Message-Id: <20210603003719.1321369-2-jsnow@redhat.com>
In-Reply-To: <20210603003719.1321369-1-jsnow@redhat.com>
References: <20210603003719.1321369-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In a previous commit, I added tox to the development requirements of the
Python library. I never bothered to add them to the Pipfile, because
they aren't needed there. Here, I sync it anyway in its own commit so
that when we add new packages later that the diffstats will not
confusingly appear to pull in lots of extra packages.

Ideally I could tell Pipenv simply not to install these, but it doesn't
seem to support that, exactly. The alternative is removing Tox from the
development requires, which I'd rather not do.

The other alternative is re-specifying all of the dependencies of
setup.cfg in the Pipfile, which I'd also rather not do.

Picking what feels least-worst here.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Pipfile.lock | 91 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 88 insertions(+), 3 deletions(-)

diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index 6e344f5fadf..f2a3f91d0fa 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -22,6 +22,13 @@
         }
     },
     "develop": {
+        "appdirs": {
+            "hashes": [
+                "sha256:7d5d0167b2b1ba821647616af46a749d1c653740dd0d2415100fe26e27afdf41",
+                "sha256:a841dacd6b99318a741b166adb07e19ee71a274450e68237b4650ca1055ab128"
+            ],
+            "version": "==1.4.4"
+        },
         "astroid": {
             "hashes": [
                 "sha256:4db03ab5fc3340cf619dbc25e42c2cc3755154ce6009469766d7143d1fc2ee4e",
@@ -38,6 +45,20 @@
             "markers": "python_version >= '3.6'",
             "version": "==88.1"
         },
+        "distlib": {
+            "hashes": [
+                "sha256:106fef6dc37dd8c0e2c0a60d3fca3e77460a48907f335fa28420463a6f799736",
+                "sha256:23e223426b28491b1ced97dc3bbe183027419dfc7982b4fa2f05d5f3ff10711c"
+            ],
+            "version": "==0.3.2"
+        },
+        "filelock": {
+            "hashes": [
+                "sha256:18d82244ee114f543149c66a6e0c14e9c4f8a1044b5cdaadd0f82159d6a6ff59",
+                "sha256:929b7d63ec5b7d6b71b0fa5ac14e030b3f70b75747cef1b10da9b879fef15836"
+            ],
+            "version": "==3.0.12"
+        },
         "flake8": {
             "hashes": [
                 "sha256:07528381786f2a6237b061f6e96610a4167b226cb926e2aa2b6b1d78057c576b",
@@ -54,6 +75,14 @@
             "markers": "python_version < '3.8'",
             "version": "==4.0.1"
         },
+        "importlib-resources": {
+            "hashes": [
+                "sha256:54161657e8ffc76596c4ede7080ca68cb02962a2e074a2586b695a93a925d36e",
+                "sha256:e962bff7440364183203d179d7ae9ad90cb1f2b74dcb84300e88ecc42dca3351"
+            ],
+            "markers": "python_version < '3.7'",
+            "version": "==5.1.4"
+        },
         "isort": {
             "hashes": [
                 "sha256:0a943902919f65c5684ac4e0154b1ad4fac6dcaa5d9f3426b732f1c8b5419be6",
@@ -132,6 +161,30 @@
             ],
             "version": "==0.4.3"
         },
+        "packaging": {
+            "hashes": [
+                "sha256:5b327ac1320dc863dca72f4514ecc086f31186744b84a230374cc1fd776feae5",
+                "sha256:67714da7f7bc052e064859c05c595155bd1ee9f69f76557e21f051443c20947a"
+            ],
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "version": "==20.9"
+        },
+        "pluggy": {
+            "hashes": [
+                "sha256:15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0",
+                "sha256:966c145cd83c96502c3c3868f50408687b38434af77734af1e9ca461a4081d2d"
+            ],
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "version": "==0.13.1"
+        },
+        "py": {
+            "hashes": [
+                "sha256:21b81bda15b66ef5e1a777a21c4dcd9c20ad3efd0b3f817e7a809035269e1bd3",
+                "sha256:3b80836aa6d1feeaa108e046da6423ab8f6ceda6468545ae8d02d9d58d18818a"
+            ],
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "version": "==1.10.0"
+        },
         "pycodestyle": {
             "hashes": [
                 "sha256:514f76d918fcc0b55c6680472f0a37970994e07bbb80725808c17089be302068",
@@ -156,18 +209,42 @@
             "markers": "python_version ~= '3.6'",
             "version": "==2.8.2"
         },
+        "pyparsing": {
+            "hashes": [
+                "sha256:c203ec8783bf771a155b207279b9bccb8dea02d8f0c9e5f8ead507bc3246ecc1",
+                "sha256:ef9d7589ef3c200abe66653d3f1ab1033c3c419ae9b9bdb1240a85b024efc88b"
+            ],
+            "markers": "python_version >= '2.6' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "version": "==2.4.7"
+        },
         "qemu": {
             "editable": true,
             "path": "."
         },
+        "six": {
+            "hashes": [
+                "sha256:1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926",
+                "sha256:8abb2f1d86890a2dfb989f9a77cfcfd3e47c2a354b01111771326f8aa26e0254"
+            ],
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "version": "==1.16.0"
+        },
         "toml": {
             "hashes": [
                 "sha256:806143ae5bfb6a3c6e736a764057db0e6a0e05e338b5630894a5f779cabb4f9b",
                 "sha256:b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f"
             ],
-            "markers": "python_version >= '2.6' and python_version not in '3.0, 3.1, 3.2'",
+            "markers": "python_version >= '2.6' and python_version not in '3.0, 3.1, 3.2, 3.3'",
             "version": "==0.10.2"
         },
+        "tox": {
+            "hashes": [
+                "sha256:307a81ddb82bd463971a273f33e9533a24ed22185f27db8ce3386bff27d324e3",
+                "sha256:b0b5818049a1c1997599d42012a637a33f24c62ab8187223fdd318fa8522637b"
+            ],
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3, 3.4'",
+            "version": "==3.23.1"
+        },
         "typed-ast": {
             "hashes": [
                 "sha256:01ae5f73431d21eead5015997ab41afa53aa1fbe252f9da060be5dad2c730ace",
@@ -201,7 +278,7 @@
                 "sha256:f8afcf15cc511ada719a88e013cec87c11aff7b91f019295eb4530f96fe5ef2f",
                 "sha256:fb1bbeac803adea29cedd70781399c99138358c26d05fcbd23c13016b7f5ec65"
             ],
-            "markers": "implementation_name == 'cpython' and python_version < '3.8'",
+            "markers": "python_version < '3.8' and implementation_name == 'cpython'",
             "version": "==1.4.3"
         },
         "typing-extensions": {
@@ -213,6 +290,14 @@
             "markers": "python_version < '3.8'",
             "version": "==3.10.0.0"
         },
+        "virtualenv": {
+            "hashes": [
+                "sha256:14fdf849f80dbb29a4eb6caa9875d476ee2a5cf76a5f5415fa2f1606010ab467",
+                "sha256:2b0126166ea7c9c3661f5b8e06773d28f83322de7a3ff7d06f0aed18c9de6a76"
+            ],
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
+            "version": "==20.4.7"
+        },
         "wrapt": {
             "hashes": [
                 "sha256:b62ffa81fb85f4332a4f609cab4ac40709470da05643a082ec1eb88e6d9b97d7"
@@ -224,7 +309,7 @@
                 "sha256:3607921face881ba3e026887d8150cca609d517579abe052ac81fc5aeffdbd76",
                 "sha256:51cb66cc54621609dd593d1787f286ee42a5c0adbb4b29abea5a63edc3e03098"
             ],
-            "markers": "python_version >= '3.6'",
+            "markers": "python_version < '3.10'",
             "version": "==3.4.1"
         }
     }
-- 
2.31.1


