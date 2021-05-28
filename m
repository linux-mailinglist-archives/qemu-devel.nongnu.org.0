Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB106393BB0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:53:30 +0200 (CEST)
Received: from localhost ([::1]:39116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmScr-00046G-WB
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSKv-0005Up-J6
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:34:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSKt-0000kz-Cn
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622169294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xO8EHu3MvKBdUwtj+v7ht4zctJrfXKGuIEI1ugD3Y7g=;
 b=h6jacoQrkbX6GqyJx0gntQiYfhORUklnj3nXLHnoar+pqXNJqScC4yLpLNHxlY2tH2+doL
 pqmdFTaslm1US1IR0XjRCNsQUGnSoSPtF/voTUB+NOqD5VYOdWuK8vsvQdk/9EbISkwmhv
 Su6RK9rgmHqA3LJvhEY6GGgkVKfkhKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-ypu-VYyJP5G8H2YVDJZk_g-1; Thu, 27 May 2021 22:34:52 -0400
X-MC-Unique: ypu-VYyJP5G8H2YVDJZk_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67328107ACC7;
 Fri, 28 May 2021 02:34:51 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C582D1F0C0;
 Fri, 28 May 2021 02:34:43 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/44] python: add pylint to pipenv
Date: Thu, 27 May 2021 22:32:06 -0400
Message-Id: <20210528023220.417057-31-jsnow@redhat.com>
In-Reply-To: <20210528023220.417057-1-jsnow@redhat.com>
References: <20210528023220.417057-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are specifying >= pylint 2.8.x for several reasons:

1. For setup.cfg support, added in pylint 2.5.x
2. To specify a version that has incompatibly dropped
   bad-whitespace checks (2.6.x)
3. 2.7.x fixes "unsubscriptable" warnings in Python 3.9
4. 2.8.x adds a new, incompatible 'consider-using-with'
   warning that must be disabled in some cases.
   These pragmas cause warnings themselves in 2.7.x.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Message-id: 20210527211715.394144-18-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Pipfile      |   1 +
 python/Pipfile.lock | 130 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 131 insertions(+)
 create mode 100644 python/Pipfile.lock

diff --git a/python/Pipfile b/python/Pipfile
index 9534830b5eb..285e2c8e671 100644
--- a/python/Pipfile
+++ b/python/Pipfile
@@ -4,6 +4,7 @@ url = "https://pypi.org/simple"
 verify_ssl = true
 
 [dev-packages]
+pylint = ">=2.8.0"
 
 [packages]
 
diff --git a/python/Pipfile.lock b/python/Pipfile.lock
new file mode 100644
index 00000000000..c9debd09503
--- /dev/null
+++ b/python/Pipfile.lock
@@ -0,0 +1,130 @@
+{
+    "_meta": {
+        "hash": {
+            "sha256": "bd4fb76fcdd145bbf23c3a9dd7ad966113c5ce43ca51cc2d828aa7e73d572901"
+        },
+        "pipfile-spec": 6,
+        "requires": {
+            "python_version": "3.6"
+        },
+        "sources": [
+            {
+                "name": "pypi",
+                "url": "https://pypi.org/simple",
+                "verify_ssl": true
+            }
+        ]
+    },
+    "default": {},
+    "develop": {
+        "astroid": {
+            "hashes": [
+                "sha256:4db03ab5fc3340cf619dbc25e42c2cc3755154ce6009469766d7143d1fc2ee4e",
+                "sha256:8a398dfce302c13f14bab13e2b14fe385d32b73f4e4853b9bdfb64598baa1975"
+            ],
+            "markers": "python_version ~= '3.6'",
+            "version": "==2.5.6"
+        },
+        "isort": {
+            "hashes": [
+                "sha256:0a943902919f65c5684ac4e0154b1ad4fac6dcaa5d9f3426b732f1c8b5419be6",
+                "sha256:2bb1680aad211e3c9944dbce1d4ba09a989f04e238296c87fe2139faa26d655d"
+            ],
+            "markers": "python_version >= '3.6' and python_version < '4.0'",
+            "version": "==5.8.0"
+        },
+        "lazy-object-proxy": {
+            "hashes": [
+                "sha256:17e0967ba374fc24141738c69736da90e94419338fd4c7c7bef01ee26b339653",
+                "sha256:1fee665d2638491f4d6e55bd483e15ef21f6c8c2095f235fef72601021e64f61",
+                "sha256:22ddd618cefe54305df49e4c069fa65715be4ad0e78e8d252a33debf00f6ede2",
+                "sha256:24a5045889cc2729033b3e604d496c2b6f588c754f7a62027ad4437a7ecc4837",
+                "sha256:410283732af311b51b837894fa2f24f2c0039aa7f220135192b38fcc42bd43d3",
+                "sha256:4732c765372bd78a2d6b2150a6e99d00a78ec963375f236979c0626b97ed8e43",
+                "sha256:489000d368377571c6f982fba6497f2aa13c6d1facc40660963da62f5c379726",
+                "sha256:4f60460e9f1eb632584c9685bccea152f4ac2130e299784dbaf9fae9f49891b3",
+                "sha256:5743a5ab42ae40caa8421b320ebf3a998f89c85cdc8376d6b2e00bd12bd1b587",
+                "sha256:85fb7608121fd5621cc4377a8961d0b32ccf84a7285b4f1d21988b2eae2868e8",
+                "sha256:9698110e36e2df951c7c36b6729e96429c9c32b3331989ef19976592c5f3c77a",
+                "sha256:9d397bf41caad3f489e10774667310d73cb9c4258e9aed94b9ec734b34b495fd",
+                "sha256:b579f8acbf2bdd9ea200b1d5dea36abd93cabf56cf626ab9c744a432e15c815f",
+                "sha256:b865b01a2e7f96db0c5d12cfea590f98d8c5ba64ad222300d93ce6ff9138bcad",
+                "sha256:bf34e368e8dd976423396555078def5cfc3039ebc6fc06d1ae2c5a65eebbcde4",
+                "sha256:c6938967f8528b3668622a9ed3b31d145fab161a32f5891ea7b84f6b790be05b",
+                "sha256:d1c2676e3d840852a2de7c7d5d76407c772927addff8d742b9808fe0afccebdf",
+                "sha256:d7124f52f3bd259f510651450e18e0fd081ed82f3c08541dffc7b94b883aa981",
+                "sha256:d900d949b707778696fdf01036f58c9876a0d8bfe116e8d220cfd4b15f14e741",
+                "sha256:ebfd274dcd5133e0afae738e6d9da4323c3eb021b3e13052d8cbd0e457b1256e",
+                "sha256:ed361bb83436f117f9917d282a456f9e5009ea12fd6de8742d1a4752c3017e93",
+                "sha256:f5144c75445ae3ca2057faac03fda5a902eff196702b0a24daf1d6ce0650514b"
+            ],
+            "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3, 3.4, 3.5'",
+            "version": "==1.6.0"
+        },
+        "mccabe": {
+            "hashes": [
+                "sha256:ab8a6258860da4b6677da4bd2fe5dc2c659cff31b3ee4f7f5d64e79735b80d42",
+                "sha256:dd8d182285a0fe56bace7f45b5e7d1a6ebcbf524e8f3bd87eb0f125271b8831f"
+            ],
+            "version": "==0.6.1"
+        },
+        "pylint": {
+            "hashes": [
+                "sha256:586d8fa9b1891f4b725f587ef267abe2a1bad89d6b184520c7f07a253dd6e217",
+                "sha256:f7e2072654a6b6afdf5e2fb38147d3e2d2d43c89f648637baab63e026481279b"
+            ],
+            "index": "pypi",
+            "version": "==2.8.2"
+        },
+        "toml": {
+            "hashes": [
+                "sha256:806143ae5bfb6a3c6e736a764057db0e6a0e05e338b5630894a5f779cabb4f9b",
+                "sha256:b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f"
+            ],
+            "markers": "python_version >= '2.6' and python_version not in '3.0, 3.1, 3.2'",
+            "version": "==0.10.2"
+        },
+        "typed-ast": {
+            "hashes": [
+                "sha256:01ae5f73431d21eead5015997ab41afa53aa1fbe252f9da060be5dad2c730ace",
+                "sha256:067a74454df670dcaa4e59349a2e5c81e567d8d65458d480a5b3dfecec08c5ff",
+                "sha256:0fb71b8c643187d7492c1f8352f2c15b4c4af3f6338f21681d3681b3dc31a266",
+                "sha256:1b3ead4a96c9101bef08f9f7d1217c096f31667617b58de957f690c92378b528",
+                "sha256:2068531575a125b87a41802130fa7e29f26c09a2833fea68d9a40cf33902eba6",
+                "sha256:209596a4ec71d990d71d5e0d312ac935d86930e6eecff6ccc7007fe54d703808",
+                "sha256:2c726c276d09fc5c414693a2de063f521052d9ea7c240ce553316f70656c84d4",
+                "sha256:398e44cd480f4d2b7ee8d98385ca104e35c81525dd98c519acff1b79bdaac363",
+                "sha256:52b1eb8c83f178ab787f3a4283f68258525f8d70f778a2f6dd54d3b5e5fb4341",
+                "sha256:5feca99c17af94057417d744607b82dd0a664fd5e4ca98061480fd8b14b18d04",
+                "sha256:7538e495704e2ccda9b234b82423a4038f324f3a10c43bc088a1636180f11a41",
+                "sha256:760ad187b1041a154f0e4d0f6aae3e40fdb51d6de16e5c99aedadd9246450e9e",
+                "sha256:777a26c84bea6cd934422ac2e3b78863a37017618b6e5c08f92ef69853e765d3",
+                "sha256:95431a26309a21874005845c21118c83991c63ea800dd44843e42a916aec5899",
+                "sha256:9ad2c92ec681e02baf81fdfa056fe0d818645efa9af1f1cd5fd6f1bd2bdfd805",
+                "sha256:9c6d1a54552b5330bc657b7ef0eae25d00ba7ffe85d9ea8ae6540d2197a3788c",
+                "sha256:aee0c1256be6c07bd3e1263ff920c325b59849dc95392a05f258bb9b259cf39c",
+                "sha256:af3d4a73793725138d6b334d9d247ce7e5f084d96284ed23f22ee626a7b88e39",
+                "sha256:b36b4f3920103a25e1d5d024d155c504080959582b928e91cb608a65c3a49e1a",
+                "sha256:b9574c6f03f685070d859e75c7f9eeca02d6933273b5e69572e5ff9d5e3931c3",
+                "sha256:bff6ad71c81b3bba8fa35f0f1921fb24ff4476235a6e94a26ada2e54370e6da7",
+                "sha256:c190f0899e9f9f8b6b7863debfb739abcb21a5c054f911ca3596d12b8a4c4c7f",
+                "sha256:c907f561b1e83e93fad565bac5ba9c22d96a54e7ea0267c708bffe863cbe4075",
+                "sha256:cae53c389825d3b46fb37538441f75d6aecc4174f615d048321b716df2757fb0",
+                "sha256:dd4a21253f42b8d2b48410cb31fe501d32f8b9fbeb1f55063ad102fe9c425e40",
+                "sha256:dde816ca9dac1d9c01dd504ea5967821606f02e510438120091b84e852367428",
+                "sha256:f2362f3cb0f3172c42938946dbc5b7843c2a28aec307c49100c8b38764eb6927",
+                "sha256:f328adcfebed9f11301eaedfa48e15bdece9b519fb27e6a8c01aa52a17ec31b3",
+                "sha256:f8afcf15cc511ada719a88e013cec87c11aff7b91f019295eb4530f96fe5ef2f",
+                "sha256:fb1bbeac803adea29cedd70781399c99138358c26d05fcbd23c13016b7f5ec65"
+            ],
+            "markers": "implementation_name == 'cpython' and python_version < '3.8'",
+            "version": "==1.4.3"
+        },
+        "wrapt": {
+            "hashes": [
+                "sha256:b62ffa81fb85f4332a4f609cab4ac40709470da05643a082ec1eb88e6d9b97d7"
+            ],
+            "version": "==1.12.1"
+        }
+    }
+}
-- 
2.31.1


