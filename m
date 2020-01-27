Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C267314A834
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 17:40:10 +0100 (CET)
Received: from localhost ([::1]:47738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw7Qn-0003rY-RL
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 11:40:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liam.merwick@oracle.com>) id 1iw7OV-0000QN-B3
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 11:37:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liam.merwick@oracle.com>) id 1iw7OU-0001uT-AU
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 11:37:47 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:41088)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <liam.merwick@oracle.com>)
 id 1iw7OU-0001qh-2m
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 11:37:46 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00RGIXU0043107;
 Mon, 27 Jan 2020 16:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2019-08-05;
 bh=vXb8vHwQ2x7gPuXBsk3QR9nb12JrCNXibJsAaHmEMHU=;
 b=eZdTf48G0c8VKIDMvniFA9oRSMzvtZ522ZjBo7SSZqI4QmWO/i/C4Gok9gudgAqL1iYD
 te+iTN0XgXM+xzoXS2JR6igixZcsvsJURLVVXhh/o7xPkviFpIib/6AMd9TMixpca9M/
 4tHo9bK3kXTOZ2D8BIefZxJun3YeA2fW0Pc/QcmnKLxey3+r/IB+dMP6854ibXL/vHi5
 AKdIPAQJa/kSqGJMdE+JW01+ylnZoDt7VkAN6SlNnWfCT76IxNI424IZ1LslRJCaLvzl
 GV+4tr9hm7d+JMk8f7XY04Kk0VSk7OmjfoyMaA9Ux1iEL80Yr+YKJGhJ5nRrAXLPlp6t BQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2xrear0dj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jan 2020 16:37:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00RGNUce141833;
 Mon, 27 Jan 2020 16:37:38 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2xrytqcb0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jan 2020 16:37:38 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00RGbbcP024609;
 Mon, 27 Jan 2020 16:37:38 GMT
Received: from ol7.uk.oracle.com (/10.175.203.109)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 27 Jan 2020 08:37:37 -0800
From: Liam Merwick <liam.merwick@oracle.com>
To: alex.bennee@linaro.org, fam@euphon.net, philmd@redhat.com
Subject: [PATCH 3/6] tests/boot_linux_console: fix extract_from_deb() comment
Date: Mon, 27 Jan 2020 16:36:31 +0000
Message-Id: <1580142994-1836-4-git-send-email-liam.merwick@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1580142994-1836-1-git-send-email-liam.merwick@oracle.com>
References: <1580142994-1836-1-git-send-email-liam.merwick@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9513
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001270138
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9513
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001270138
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.85
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
Cc: slp@redhat.com, qemu-devel@nongnu.org, wainersm@redhat.com,
 pbonzini@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The second param in extract_from_deb() is 'path' not 'file'

Signed-off-by: Liam Merwick <liam.merwick@oracle.com>
---
 tests/acceptance/boot_linux_console.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 8daf6461ffac..43bc928b03a2 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -40,7 +40,7 @@ class BootLinuxConsole(Test):
         Extracts a file from a deb package into the test workdir
 
         :param deb: path to the deb archive
-        :param file: path within the deb archive of the file to be extracted
+        :param path: path within the deb archive of the file to be extracted
         :returns: path of the extracted file
         """
         cwd = os.getcwd()
-- 
1.8.3.1


