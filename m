Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFFC4E456F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 18:47:39 +0100 (CET)
Received: from localhost ([::1]:46364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWibZ-0000Oc-Fi
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 13:47:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWiWW-00077y-Sx
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:42:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWiWS-0000D8-Jw
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647970936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8BsvdoVdAOFh7Gf83SaTQa9sw2cpXVeVWmQdtk9jBcI=;
 b=gm/jxqASeZuwRfPc7b5ddd00AS71xQF7u6SRUEpDenvprCKWYEL+u5SH5aRUXK3qK253Hj
 TAd9lk0B0pKXON/WWQIq2sSMg+9TzzaPCjWbW3m817GVqdOY4kal1JvzT1Ni3Yc3pRnIY/
 8jHXIBqPXHubyHsFoGChgNvsWcEOEPg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-fW-ge2d3M8CrZHlgMkThWQ-1; Tue, 22 Mar 2022 13:42:13 -0400
X-MC-Unique: fW-ge2d3M8CrZHlgMkThWQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 391681C04B68;
 Tue, 22 Mar 2022 17:42:13 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E40BA401E80;
 Tue, 22 Mar 2022 17:42:12 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] iotests: update test owner contact information
Date: Tue, 22 Mar 2022 13:42:12 -0400
Message-Id: <20220322174212.1169630-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Quite a few of these tests have stale contact information. This patch
updates the stale ones that I happen to be aware of at the moment.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/025 | 2 +-
 tests/qemu-iotests/027 | 2 +-
 tests/qemu-iotests/028 | 2 +-
 tests/qemu-iotests/036 | 2 +-
 tests/qemu-iotests/039 | 2 +-
 tests/qemu-iotests/059 | 2 +-
 tests/qemu-iotests/060 | 2 +-
 tests/qemu-iotests/061 | 2 +-
 tests/qemu-iotests/062 | 2 +-
 tests/qemu-iotests/064 | 2 +-
 tests/qemu-iotests/066 | 2 +-
 tests/qemu-iotests/068 | 2 +-
 tests/qemu-iotests/069 | 2 +-
 tests/qemu-iotests/070 | 2 +-
 tests/qemu-iotests/071 | 2 +-
 tests/qemu-iotests/072 | 2 +-
 tests/qemu-iotests/074 | 2 +-
 tests/qemu-iotests/084 | 2 +-
 tests/qemu-iotests/085 | 2 +-
 tests/qemu-iotests/089 | 2 +-
 tests/qemu-iotests/090 | 2 +-
 tests/qemu-iotests/091 | 2 +-
 tests/qemu-iotests/094 | 2 +-
 tests/qemu-iotests/095 | 2 +-
 tests/qemu-iotests/097 | 2 +-
 tests/qemu-iotests/098 | 2 +-
 tests/qemu-iotests/099 | 2 +-
 tests/qemu-iotests/102 | 2 +-
 tests/qemu-iotests/103 | 2 +-
 tests/qemu-iotests/105 | 2 +-
 tests/qemu-iotests/106 | 2 +-
 tests/qemu-iotests/107 | 2 +-
 tests/qemu-iotests/108 | 2 +-
 tests/qemu-iotests/110 | 2 +-
 tests/qemu-iotests/111 | 2 +-
 tests/qemu-iotests/112 | 2 +-
 tests/qemu-iotests/113 | 2 +-
 tests/qemu-iotests/115 | 2 +-
 tests/qemu-iotests/117 | 2 +-
 tests/qemu-iotests/119 | 2 +-
 tests/qemu-iotests/120 | 2 +-
 tests/qemu-iotests/121 | 2 +-
 tests/qemu-iotests/123 | 2 +-
 tests/qemu-iotests/125 | 2 +-
 tests/qemu-iotests/126 | 2 +-
 tests/qemu-iotests/127 | 2 +-
 tests/qemu-iotests/135 | 2 +-
 tests/qemu-iotests/138 | 2 +-
 tests/qemu-iotests/140 | 2 +-
 tests/qemu-iotests/141 | 2 +-
 tests/qemu-iotests/143 | 2 +-
 tests/qemu-iotests/144 | 2 +-
 tests/qemu-iotests/146 | 2 +-
 tests/qemu-iotests/150 | 2 +-
 tests/qemu-iotests/153 | 2 +-
 tests/qemu-iotests/156 | 2 +-
 tests/qemu-iotests/162 | 2 +-
 tests/qemu-iotests/173 | 2 +-
 tests/qemu-iotests/176 | 2 +-
 tests/qemu-iotests/182 | 2 +-
 tests/qemu-iotests/192 | 2 +-
 tests/qemu-iotests/200 | 2 +-
 tests/qemu-iotests/216 | 2 +-
 tests/qemu-iotests/218 | 2 +-
 tests/qemu-iotests/224 | 2 +-
 tests/qemu-iotests/225 | 2 +-
 tests/qemu-iotests/228 | 2 +-
 tests/qemu-iotests/229 | 2 +-
 tests/qemu-iotests/231 | 2 +-
 tests/qemu-iotests/250 | 2 +-
 tests/qemu-iotests/251 | 2 +-
 tests/qemu-iotests/252 | 2 +-
 tests/qemu-iotests/258 | 2 +-
 tests/qemu-iotests/259 | 2 +-
 tests/qemu-iotests/261 | 2 +-
 tests/qemu-iotests/310 | 2 +-
 76 files changed, 76 insertions(+), 76 deletions(-)

diff --git a/tests/qemu-iotests/025 b/tests/qemu-iotests/025
index 80686a30d5..5771ea9200 100755
--- a/tests/qemu-iotests/025
+++ b/tests/qemu-iotests/025
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=stefanha@linux.vnet.ibm.com
+owner=stefanha@redhat.com
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/027 b/tests/qemu-iotests/027
index b279c88f33..24c93627bb 100755
--- a/tests/qemu-iotests/027
+++ b/tests/qemu-iotests/027
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=stefanha@linux.vnet.ibm.com
+owner=stefanha@redhat.com
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/028 b/tests/qemu-iotests/028
index 8c391f2adc..2b232c4614 100755
--- a/tests/qemu-iotests/028
+++ b/tests/qemu-iotests/028
@@ -23,7 +23,7 @@
 #
 
 # creator
-owner=stefanha@linux.vnet.ibm.com
+owner=stefanha@redhat.com
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/036 b/tests/qemu-iotests/036
index f703605e44..16a401985c 100755
--- a/tests/qemu-iotests/036
+++ b/tests/qemu-iotests/036
@@ -23,7 +23,7 @@
 #
 
 # creator
-owner=stefanha@linux.vnet.ibm.com
+owner=stefanha@redhat.com
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/039 b/tests/qemu-iotests/039
index 00d379cde2..e43e7026ce 100755
--- a/tests/qemu-iotests/039
+++ b/tests/qemu-iotests/039
@@ -23,7 +23,7 @@
 #
 
 # creator
-owner=stefanha@linux.vnet.ibm.com
+owner=stefanha@redhat.com
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/059 b/tests/qemu-iotests/059
index 65c0c32b26..e8be217e1f 100755
--- a/tests/qemu-iotests/059
+++ b/tests/qemu-iotests/059
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=famz@redhat.com
+owner=fam@euphon.net
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/060 b/tests/qemu-iotests/060
index df87d600f7..5cd21a6f68 100755
--- a/tests/qemu-iotests/060
+++ b/tests/qemu-iotests/060
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/061 b/tests/qemu-iotests/061
index 513fbec14c..509ad247cd 100755
--- a/tests/qemu-iotests/061
+++ b/tests/qemu-iotests/061
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/062 b/tests/qemu-iotests/062
index 321252298d..6a71bf1477 100755
--- a/tests/qemu-iotests/062
+++ b/tests/qemu-iotests/062
@@ -21,7 +21,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/064 b/tests/qemu-iotests/064
index 71fc575b21..21e25cf39f 100755
--- a/tests/qemu-iotests/064
+++ b/tests/qemu-iotests/064
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=jcody@redhat.com
+owner=codyprime@gmail.com
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/066 b/tests/qemu-iotests/066
index a780ed7ab5..cf63144cb9 100755
--- a/tests/qemu-iotests/066
+++ b/tests/qemu-iotests/066
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/068 b/tests/qemu-iotests/068
index 54e49c8ffa..7ecd247409 100755
--- a/tests/qemu-iotests/068
+++ b/tests/qemu-iotests/068
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/069 b/tests/qemu-iotests/069
index 222dcba741..6647e11861 100755
--- a/tests/qemu-iotests/069
+++ b/tests/qemu-iotests/069
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/070 b/tests/qemu-iotests/070
index b181e00f9b..edb71afbe3 100755
--- a/tests/qemu-iotests/070
+++ b/tests/qemu-iotests/070
@@ -21,7 +21,7 @@
 #
 
 # creator
-owner=jcody@redhat.com
+owner=codyprime@gmail.com
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/071 b/tests/qemu-iotests/071
index d99cef5a42..27bc7305bf 100755
--- a/tests/qemu-iotests/071
+++ b/tests/qemu-iotests/071
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/072 b/tests/qemu-iotests/072
index c492ab8a78..662ede961c 100755
--- a/tests/qemu-iotests/072
+++ b/tests/qemu-iotests/072
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/074 b/tests/qemu-iotests/074
index c32c94b50d..ee73e636b2 100755
--- a/tests/qemu-iotests/074
+++ b/tests/qemu-iotests/074
@@ -21,7 +21,7 @@
 ##
 #
 # creator
-owner=famz@redhat.com
+owner=fam@euphon.net
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/084 b/tests/qemu-iotests/084
index e51e91a7c8..1181cb7cd0 100755
--- a/tests/qemu-iotests/084
+++ b/tests/qemu-iotests/084
@@ -21,7 +21,7 @@
 #
 
 # creator
-owner=jcody@redhat.com
+owner=codyprime@gmail.com
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/085 b/tests/qemu-iotests/085
index de74262a26..3fb7b0b5c8 100755
--- a/tests/qemu-iotests/085
+++ b/tests/qemu-iotests/085
@@ -25,7 +25,7 @@
 #
 
 # creator
-owner=jcody@redhat.com
+owner=codyprime@gmail.com
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/089 b/tests/qemu-iotests/089
index 48bdc42e42..c68c5a66b9 100755
--- a/tests/qemu-iotests/089
+++ b/tests/qemu-iotests/089
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/090 b/tests/qemu-iotests/090
index 2044c09e9b..8f88eea9aa 100755
--- a/tests/qemu-iotests/090
+++ b/tests/qemu-iotests/090
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/091 b/tests/qemu-iotests/091
index 9d144b9439..e396748a91 100755
--- a/tests/qemu-iotests/091
+++ b/tests/qemu-iotests/091
@@ -22,7 +22,7 @@
 #
 
 # creator
-owner=jcody@redhat.com
+owner=codyprime@gmail.com
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/094 b/tests/qemu-iotests/094
index a295fb20ef..4766e9a458 100755
--- a/tests/qemu-iotests/094
+++ b/tests/qemu-iotests/094
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/095 b/tests/qemu-iotests/095
index 20b5f9bf61..d1d347eb1f 100755
--- a/tests/qemu-iotests/095
+++ b/tests/qemu-iotests/095
@@ -23,7 +23,7 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 # creator
-owner=jcody@redhat.com
+owner=codyprime@gmail.com
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/097 b/tests/qemu-iotests/097
index 30313f8867..93857f4fd0 100755
--- a/tests/qemu-iotests/097
+++ b/tests/qemu-iotests/097
@@ -21,7 +21,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/098 b/tests/qemu-iotests/098
index 4c37eb0cf5..e3eadb3296 100755
--- a/tests/qemu-iotests/098
+++ b/tests/qemu-iotests/098
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/099 b/tests/qemu-iotests/099
index 2f1199ce04..a5d2d30931 100755
--- a/tests/qemu-iotests/099
+++ b/tests/qemu-iotests/099
@@ -21,7 +21,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/102 b/tests/qemu-iotests/102
index 8b4c4c905f..141bfe1e90 100755
--- a/tests/qemu-iotests/102
+++ b/tests/qemu-iotests/102
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq=$(basename $0)
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/103 b/tests/qemu-iotests/103
index 726f8313ef..bb9fd6f650 100755
--- a/tests/qemu-iotests/103
+++ b/tests/qemu-iotests/103
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq=$(basename $0)
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/105 b/tests/qemu-iotests/105
index d804685110..b8f2029f62 100755
--- a/tests/qemu-iotests/105
+++ b/tests/qemu-iotests/105
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=famz@redhat.com
+owner=fam@euphon.net
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/106 b/tests/qemu-iotests/106
index 333144502c..9d6adb542d 100755
--- a/tests/qemu-iotests/106
+++ b/tests/qemu-iotests/106
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq=$(basename $0)
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/107 b/tests/qemu-iotests/107
index e68f1e07c7..3fabff2791 100755
--- a/tests/qemu-iotests/107
+++ b/tests/qemu-iotests/107
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/108 b/tests/qemu-iotests/108
index 8eaef0b8bf..56339ab2c5 100755
--- a/tests/qemu-iotests/108
+++ b/tests/qemu-iotests/108
@@ -21,7 +21,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/110 b/tests/qemu-iotests/110
index 1fa36ccdb7..91b15f7513 100755
--- a/tests/qemu-iotests/110
+++ b/tests/qemu-iotests/110
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/111 b/tests/qemu-iotests/111
index 3ba25f6161..382dbf0606 100755
--- a/tests/qemu-iotests/111
+++ b/tests/qemu-iotests/111
@@ -21,7 +21,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/112 b/tests/qemu-iotests/112
index 5333212993..a2ffc96e60 100755
--- a/tests/qemu-iotests/112
+++ b/tests/qemu-iotests/112
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/113 b/tests/qemu-iotests/113
index ee59b9a4b8..a3ad208fd7 100755
--- a/tests/qemu-iotests/113
+++ b/tests/qemu-iotests/113
@@ -21,7 +21,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/115 b/tests/qemu-iotests/115
index 26dd37dd6d..7a24070caa 100755
--- a/tests/qemu-iotests/115
+++ b/tests/qemu-iotests/115
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/117 b/tests/qemu-iotests/117
index 48ebc012b1..6081473584 100755
--- a/tests/qemu-iotests/117
+++ b/tests/qemu-iotests/117
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/119 b/tests/qemu-iotests/119
index 5770b50045..6cac8793ba 100755
--- a/tests/qemu-iotests/119
+++ b/tests/qemu-iotests/119
@@ -21,7 +21,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/120 b/tests/qemu-iotests/120
index 7187731253..ac7bd8c4e3 100755
--- a/tests/qemu-iotests/120
+++ b/tests/qemu-iotests/120
@@ -21,7 +21,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/121 b/tests/qemu-iotests/121
index ba3d8d9377..f0dd1d1114 100755
--- a/tests/qemu-iotests/121
+++ b/tests/qemu-iotests/121
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/123 b/tests/qemu-iotests/123
index e19111f70d..4d34a2ac49 100755
--- a/tests/qemu-iotests/123
+++ b/tests/qemu-iotests/123
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/125 b/tests/qemu-iotests/125
index bd390b3a99..46279d6b38 100755
--- a/tests/qemu-iotests/125
+++ b/tests/qemu-iotests/125
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq=$(basename $0)
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/126 b/tests/qemu-iotests/126
index 92c0547746..d8d2d654f2 100755
--- a/tests/qemu-iotests/126
+++ b/tests/qemu-iotests/126
@@ -21,7 +21,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/127 b/tests/qemu-iotests/127
index 32edc3b068..7cc3ce1d78 100755
--- a/tests/qemu-iotests/127
+++ b/tests/qemu-iotests/127
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq=$(basename $0)
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/135 b/tests/qemu-iotests/135
index 299075b4c9..71125719ee 100755
--- a/tests/qemu-iotests/135
+++ b/tests/qemu-iotests/135
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=jcody@redhat.com
+owner=codyprime@gmail.com
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/138 b/tests/qemu-iotests/138
index 951cfa67d4..76628adab7 100755
--- a/tests/qemu-iotests/138
+++ b/tests/qemu-iotests/138
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/140 b/tests/qemu-iotests/140
index 91e08c30d4..d923b777e2 100755
--- a/tests/qemu-iotests/140
+++ b/tests/qemu-iotests/140
@@ -24,7 +24,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/141 b/tests/qemu-iotests/141
index 115cc1691e..a37030ee17 100755
--- a/tests/qemu-iotests/141
+++ b/tests/qemu-iotests/141
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/143 b/tests/qemu-iotests/143
index 72151acf27..92a081b79e 100755
--- a/tests/qemu-iotests/143
+++ b/tests/qemu-iotests/143
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/144 b/tests/qemu-iotests/144
index 60e9ddd75f..bdcc498fa2 100755
--- a/tests/qemu-iotests/144
+++ b/tests/qemu-iotests/144
@@ -22,7 +22,7 @@
 #
 
 # creator
-owner=jcody@redhat.com
+owner=codyprime@gmail.com
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/146 b/tests/qemu-iotests/146
index 98aca96732..661a9d2625 100755
--- a/tests/qemu-iotests/146
+++ b/tests/qemu-iotests/146
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=jcody@redhat.com
+owner=codyprime@gmail.com
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/150 b/tests/qemu-iotests/150
index ac6930ae20..fab0faa389 100755
--- a/tests/qemu-iotests/150
+++ b/tests/qemu-iotests/150
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/153 b/tests/qemu-iotests/153
index 607af59091..9bc3be8f75 100755
--- a/tests/qemu-iotests/153
+++ b/tests/qemu-iotests/153
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=famz@redhat.com
+owner=fam@euphon.net
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/156 b/tests/qemu-iotests/156
index 65dcedd493..a9540bd80d 100755
--- a/tests/qemu-iotests/156
+++ b/tests/qemu-iotests/156
@@ -28,7 +28,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/162 b/tests/qemu-iotests/162
index cf17f494d8..94dae60d30 100755
--- a/tests/qemu-iotests/162
+++ b/tests/qemu-iotests/162
@@ -21,7 +21,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/173 b/tests/qemu-iotests/173
index 9594f3c5ea..217e55c168 100755
--- a/tests/qemu-iotests/173
+++ b/tests/qemu-iotests/173
@@ -20,7 +20,7 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 # creator
-owner=jcody@redhat.com
+owner=codyprime@gmail.com
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/176 b/tests/qemu-iotests/176
index 27ac25467f..a6a2a4cd44 100755
--- a/tests/qemu-iotests/176
+++ b/tests/qemu-iotests/176
@@ -25,7 +25,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/182 b/tests/qemu-iotests/182
index fcd1d796eb..bbd1132b05 100755
--- a/tests/qemu-iotests/182
+++ b/tests/qemu-iotests/182
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=famz@redhat.com
+owner=fam@euphon.net
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/192 b/tests/qemu-iotests/192
index d809187fca..e66e1a4f06 100755
--- a/tests/qemu-iotests/192
+++ b/tests/qemu-iotests/192
@@ -21,7 +21,7 @@
 #
 
 # creator
-owner=famz@redhat.com
+owner=fam@euphon.net
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/200 b/tests/qemu-iotests/200
index f80517e342..f66c571d24 100755
--- a/tests/qemu-iotests/200
+++ b/tests/qemu-iotests/200
@@ -22,7 +22,7 @@
 #
 
 # creator
-owner=jcody@redhat.com
+owner=codyprime@gmail.com
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/216 b/tests/qemu-iotests/216
index 88b385afa3..c531abfded 100755
--- a/tests/qemu-iotests/216
+++ b/tests/qemu-iotests/216
@@ -18,7 +18,7 @@
 # You should have received a copy of the GNU General Public License
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
-# Creator/Owner: Max Reitz <mreitz@redhat.com>
+# Creator/Owner: Hanna Reitz <hreitz@redhat.com>
 
 import iotests
 from iotests import log, qemu_img, qemu_io_silent
diff --git a/tests/qemu-iotests/218 b/tests/qemu-iotests/218
index 853ed52b34..8345793902 100755
--- a/tests/qemu-iotests/218
+++ b/tests/qemu-iotests/218
@@ -25,7 +25,7 @@
 # You should have received a copy of the GNU General Public License
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
-# Creator/Owner: Max Reitz <mreitz@redhat.com>
+# Creator/Owner: Hanna Reitz <hreitz@redhat.com>
 
 import iotests
 from iotests import log, qemu_img, qemu_io_silent
diff --git a/tests/qemu-iotests/224 b/tests/qemu-iotests/224
index c31c55b49d..4df5157e8d 100755
--- a/tests/qemu-iotests/224
+++ b/tests/qemu-iotests/224
@@ -19,7 +19,7 @@
 # You should have received a copy of the GNU General Public License
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
-# Creator/Owner: Max Reitz <mreitz@redhat.com>
+# Creator/Owner: Hanna Reitz <hreitz@redhat.com>
 
 import iotests
 from iotests import log, qemu_img, qemu_io_silent, filter_qmp_testfiles, \
diff --git a/tests/qemu-iotests/225 b/tests/qemu-iotests/225
index c0053790db..b5949fcb58 100755
--- a/tests/qemu-iotests/225
+++ b/tests/qemu-iotests/225
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq=$(basename $0)
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/228 b/tests/qemu-iotests/228
index f79bae0267..7341777f9f 100755
--- a/tests/qemu-iotests/228
+++ b/tests/qemu-iotests/228
@@ -19,7 +19,7 @@
 # You should have received a copy of the GNU General Public License
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
-# Creator/Owner: Max Reitz <mreitz@redhat.com>
+# Creator/Owner: Hanna Reitz <hreitz@redhat.com>
 
 import iotests
 from iotests import log, qemu_img, filter_testfiles, filter_imgfmt, \
diff --git a/tests/qemu-iotests/229 b/tests/qemu-iotests/229
index 4bc99390b5..aaa6996ce3 100755
--- a/tests/qemu-iotests/229
+++ b/tests/qemu-iotests/229
@@ -21,7 +21,7 @@
 #
 
 # creator
-owner=jcody@redhat.com
+owner=codyprime@gmail.com
 
 seq="$(basename $0)"
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/231 b/tests/qemu-iotests/231
index 8e6c6447c1..eddc8e9641 100755
--- a/tests/qemu-iotests/231
+++ b/tests/qemu-iotests/231
@@ -22,7 +22,7 @@
 #
 
 # creator
-owner=jcody@redhat.com
+owner=codyprime@gmail.com
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/250 b/tests/qemu-iotests/250
index f069ca1759..af48f83aba 100755
--- a/tests/qemu-iotests/250
+++ b/tests/qemu-iotests/250
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=vsementsov@virtuozzo.com
+owner=v.sementsov-og@mail.ru
 
 seq=`basename $0`
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/251 b/tests/qemu-iotests/251
index 8bdec37d32..794cad58b2 100755
--- a/tests/qemu-iotests/251
+++ b/tests/qemu-iotests/251
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq=$(basename $0)
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/252 b/tests/qemu-iotests/252
index 2134b9993a..522333cf1d 100755
--- a/tests/qemu-iotests/252
+++ b/tests/qemu-iotests/252
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq=$(basename $0)
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/258 b/tests/qemu-iotests/258
index 7798a04d7d..cfd536d6dc 100755
--- a/tests/qemu-iotests/258
+++ b/tests/qemu-iotests/258
@@ -18,7 +18,7 @@
 # You should have received a copy of the GNU General Public License
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
-# Creator/Owner: Max Reitz <mreitz@redhat.com>
+# Creator/Owner: Hanna Reitz <hreitz@redhat.com>
 
 import iotests
 from iotests import log, qemu_img, qemu_io_silent, \
diff --git a/tests/qemu-iotests/259 b/tests/qemu-iotests/259
index 1b15e8fb48..82f5de4b34 100755
--- a/tests/qemu-iotests/259
+++ b/tests/qemu-iotests/259
@@ -20,7 +20,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq=$(basename $0)
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/261 b/tests/qemu-iotests/261
index d1c8037ab1..b73da565da 100755
--- a/tests/qemu-iotests/261
+++ b/tests/qemu-iotests/261
@@ -22,7 +22,7 @@
 #
 
 # creator
-owner=mreitz@redhat.com
+owner=hreitz@redhat.com
 
 seq=$(basename $0)
 echo "QA output created by $seq"
diff --git a/tests/qemu-iotests/310 b/tests/qemu-iotests/310
index e3bfedc7fd..00fc5618f6 100755
--- a/tests/qemu-iotests/310
+++ b/tests/qemu-iotests/310
@@ -31,7 +31,7 @@ log('')
 log('=== Copy-on-read across nodes ===')
 log('')
 
-# This test is similar to the 216 one by Max Reitz <mreitz@redhat.com>
+# This test is similar to the 216 one by Hanna Reitz <hreitz@redhat.com>
 # The difference is that this test case involves a bottom node to the
 # COR filter driver.
 
-- 
2.34.1


