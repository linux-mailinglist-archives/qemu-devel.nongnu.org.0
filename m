Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B202DFC6E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 14:52:37 +0100 (CET)
Received: from localhost ([::1]:35282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krLc4-0004pW-JN
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 08:52:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1krLZK-0002CR-Gg; Mon, 21 Dec 2020 08:49:46 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:54340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1krLZF-00050d-KX; Mon, 21 Dec 2020 08:49:45 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BLDj91T080739;
 Mon, 21 Dec 2020 13:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=t/TwPb1FJb1F48YUIj8G53YcNrZ3C8R3Q7FgKxLTmlE=;
 b=C/CLAIF3N8QpzJe+I4g9bIn4tlShpVrkkKbWu42h8lG5VLS7tCqdtehPdRra6BDYvR7z
 9UlMP0p0gQ5lakvJ6f4T+0pJW2iGtTz5pvuFHE+cUzMkA1JeqrZPtrR47Zlsgt1QANOz
 8hmKBOjILtP2eH5vz1wc4SoTZFsAFNc3UGfuNxcvIiBly2kOduxkMwUD17DuXHKz7cnN
 Gprgo4DzJpzUmn4ke5qpWochj1vxMUzT69ii7BphGaIb9OCply377dVOe/EhoiGZ1Nay
 OfNvK/Qhk/RW/TQEVgzluEPHt2nSOhsxb9LP2saWVa9HQdrqtV9QJGeWxgG8XXiDEZhh kA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 35h8xqwcj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 21 Dec 2020 13:49:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BLDkXf4143466;
 Mon, 21 Dec 2020 13:49:38 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 35huevsajv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Dec 2020 13:49:38 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BLDnaic028015;
 Mon, 21 Dec 2020 13:49:37 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 21 Dec 2020 05:49:36 -0800
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 05da8e5d;
 Mon, 21 Dec 2020 13:49:31 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] tests: Collapse echoed JSON input to a single line
Date: Mon, 21 Dec 2020 13:49:31 +0000
Message-Id: <20201221134931.1194806-3-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221134931.1194806-1-david.edmondson@oracle.com>
References: <20201221134931.1194806-1-david.edmondson@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9841
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012210098
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9841
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012210098
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=david.edmondson@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When sending JSON to running qemu, qemu-io, etc. instances, flatten
the echoed input to a single line to ensure that comparisons with the
expected input (which is always a single line) are successful.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 tests/qemu-iotests/common.filter | 6 ++++++
 tests/qemu-iotests/common.qemu   | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index 172ea5752e..d51df59769 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -332,5 +332,11 @@ for fname in fnames:
 sys.stdout.write(result)'
 }
 
+# Convert multi-line input to a single line.
+_filter_collapse_lines()
+{
+    (tr -d '\n'; echo)
+}
+
 # make sure this script returns success
 true
diff --git a/tests/qemu-iotests/common.qemu b/tests/qemu-iotests/common.qemu
index de680cf1c7..9604c78b8a 100644
--- a/tests/qemu-iotests/common.qemu
+++ b/tests/qemu-iotests/common.qemu
@@ -159,7 +159,7 @@ _send_qemu_cmd()
     # input back to output); decide based on leading '{'
     if [ -z "$silent" ] && [ -z "$mismatch_only" ] &&
             [ "$cmd" != "${cmd#\{}" ]; then
-        echo "${cmd}" | _filter_testdir | _filter_imgfmt
+        echo "${cmd}" | _filter_testdir | _filter_imgfmt | _filter_collapse_lines
     fi
     while [ ${count} -gt 0 ]
     do
-- 
2.29.2


