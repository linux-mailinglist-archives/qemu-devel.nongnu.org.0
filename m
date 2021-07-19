Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1947A3CEC36
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:11:49 +0200 (CEST)
Received: from localhost ([::1]:55362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZcC-0007OE-6R
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRQ-0005sW-EK
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:00:40 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:35868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1m5ZRO-0005Tp-1i
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 16:00:40 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JJuV6H015851; Mon, 19 Jul 2021 20:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=9CzF7tsHv/R5f3eDR1pzZDOtP8hvcfcUrVHAr1lwATo=;
 b=fjctjeHfTEh76HrOoN2rksU/fstFE1BLiImQhI6tC5k5a5fy1FW6Ko4HjQBuq5MgIHWj
 Eh2xL9lj4DPT4uUZLP+TWpFM7BUPdmMP2j8ZFeMFaA8G8HRdFC9d9aq1tGERC3VislPO
 /sbmdBM7R/ayLsn6Ecr4Wp5opajBsrKh+d95alsuxEIIIP/ip7cRcUJ0TCOvtk+txFF9
 w08GNZKYrJ63LdhfZsJ3SWQg+bHjYoogRLLbEqZztuZo2uzozyeJ0Nsk+PA7CdNnYXwZ
 MYXiOnX8FNfLEB3PPEhL1jSliftgCiaWh596HEgMLKMGLS4IVjH7pjmYFqbOc1Q8vRjZ ow== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=9CzF7tsHv/R5f3eDR1pzZDOtP8hvcfcUrVHAr1lwATo=;
 b=wzOy26vpIWGejJKi3ce+gMm6G3V9Hdm2Qeyq7BEz1V15aPtADdPkQHulcO5uuN4UIR9I
 bJPDZ0uyqplq7ibvILQKaVgQuB5yiVY9s6+YwDXrz6X721ZeyHD4uIgYPtbol5erXlsU
 oK6wAGlBuLw5F/Qtn/Etz7D6wr5DaWMlgkhzomKMWGqnbXBde6RXX1okFxBD/NjsrITc
 MeXN+RpP6zloo75tcZ/vWFZl6cLxzwU5ZewR0AtPWCyxLk6x/aPTALxJ99cAmZ27L7eK
 fNvMVo3fOpQ91RQmcjqUzKz4MVE77zATQe0v+CdVSEzVP1S6PfxXJwbnsipk66qLBNDL Hw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vqm9a96w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:36 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16JJf5Ix033120;
 Mon, 19 Jul 2021 20:00:35 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by aserp3020.oracle.com with ESMTP id 39uq15b6up-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 20:00:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKbaLJsUS01j+M4fKUEVTQPQgBAR3vYQaAGLtBxR18Wwg51pjCJdsrgR3/CZmx1SaKzdnIlDCJyNWRCezs5+7VgeMR7x5vW/Q8rbwX3TCJaQQe1pktd/KgKD7/M+2ko/sQYNjjqaPyaoCxDcROONxvtwtRiNNwe5A776YbXhgDy2azsdqiyI9bHsqqJwNkzUC8ICdIoTCCG7/hpOq7yxCw493uZHJictdKrCy1y/7WUcV/uqhy7CioXarqe91GNFvi3pGonzqxFYP6EpgNRK6tP+UKHHRYfWx+LeGFnWQEUsWSvbaO6RtsbMRi+7YkWypyF0PTNIzC4RJNMPB7wupQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CzF7tsHv/R5f3eDR1pzZDOtP8hvcfcUrVHAr1lwATo=;
 b=gjpP4kz4fFnaLeIkwoN7uo9aDTkc5d4V2hQL0VMGkBi36HCCmVz3QwYVsnfNnH/BbnnlGS9mh60rqMXtCea45kfUldab8gT/AHWF1BxnJz9cNAp5u/qUoWJinuOsoVRoufk5l/gBMYvSC9VZdRFwxrFzsVYogJWH6g83j7wAGWAAFoI80jLiwss4KtgUWD9odlbHJv083kcEPBEB2tkWiIpRreEWJrgRtsxdpLAQfkGO1Wv6sMtu1TjaXCkSEjjCW03Hbva2FBFgbhZWyF8gWT69fJQFtuX80ac09NYsytLfd8WXVwdLpqnSy1UXDAhlDixhckuTx0M+DZFRcTLJJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CzF7tsHv/R5f3eDR1pzZDOtP8hvcfcUrVHAr1lwATo=;
 b=vN1RTFdohgxETCOzGR/e3+fBA60qQziuNYQOO1bXRlMDoJc7byaPRWvYC7UfovnYbJo4SRglU6JA3pPuwmN0U2OrrEr3Y2LF+fLHCh8bGi36GlUdvGgiplsO2mxoB9JpNO6tjgw7vBQ0veSqnsVTNVswH+NcfLgLxG7ccJ/yqcA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3853.namprd10.prod.outlook.com (2603:10b6:208:180::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Mon, 19 Jul
 2021 20:00:32 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e935:82a8:3c37:8aa4%4]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 20:00:32 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC server 11/11] vfio-user: acceptance test
Date: Mon, 19 Jul 2021 16:00:13 -0400
Message-Id: <0ed2315f59965380ffbbfb01556e18075fc654b2.1626722742.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1626722742.git.jag.raman@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0040.namprd11.prod.outlook.com
 (2603:10b6:806:d0::15) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.44) by
 SA0PR11CA0040.namprd11.prod.outlook.com (2603:10b6:806:d0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 20:00:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11878326-cc9e-4a08-824e-08d94aefdd3d
X-MS-TrafficTypeDiagnostic: MN2PR10MB3853:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB38532FC2F1D4875EB1EA234790E19@MN2PR10MB3853.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v6cOMCC3y12A9kIK+UmLlE5K8Ctgz0bhqs+XSdlFhiH542h6jSZY3fUDsFBAMe/jSwGexisn2ER+1zvRvNzo3klwVsvjbNDy5k93kTMeaJ8O7V6c2kXIKMsin0UuVOV+GaHBGPpov70sQOtnDKWUjjIM31xY2Td8nhF83PWJN1WHospn75kbMMS/e5T7jqtaro0rzqzcpxTATXgoKKLd+9N7C6YKrkJn51UjZ0KsDmFxKiLwXkke+/QSKpTzZN42/ojl/rAHLSiuqNhOPpojZgNM7qinBT9n54izl8ytZoeIpvvrjmDjOvwojv7SM5A/AG59jiaMS9pp/G9IKyKkL4ede7/903Gtd8QVf97qS8DHxnzzF7ScVNgqsQF85hmuDe5UTI1sYTUZX7C9I/yFD6UOnDxrQFkprxPjmnDloyopg9C1GoumAqa3yv0OIx0m8JYdR0LgvgsZJbAqvxvKqVskdrgJ6oj++ojcSuEKuGMw8L5rOUwjpUzet/OzyHlnipxMB9QHDdta7IzQRSPqFdO7BP2mTZae0oh1uNYjXe247fNtGpIhxLV/je5jRNvqDW1JD78pgKwAfiPTNqkZCa2j4lJDJztxfbHdhrf0R0KXc+ca8j2SQmRbB5B5NVrKXa9HjhuqyxwmGab8JThrhADED8CqvrAHkiAdtshaFK4cWxEU8034SNW0iS9+46QMFd/XAbUWp4aAkKtcBDUcu1W/kZGDrt7TS+GGAoFoejcap8SEc+iO08y0W58PfJ6gESb2L9myCKshAoDxKieebQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(5660300002)(956004)(2616005)(107886003)(7696005)(26005)(6666004)(508600001)(38350700002)(38100700002)(52116002)(36756003)(86362001)(186003)(6486002)(4326008)(66556008)(66476007)(6916009)(66946007)(83380400001)(8676002)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FII1FzQfrQTx/6z7gdBLS9DsXScqWf/XHALrnnJeaOqG1Sc0Bj+HR0iDjsqGl5/jv57zCqjAkYr7jTvG7LvyM/lW+GxKxDqPzqags0jNfQ+W+hn6FuibajIhVosxzKiPpDNpJN6oTuXDnRr8Rb7Xylc9mSTUQf1Uoz+QWXDUa33YkF/Ej1mIFP2XS1wwEn4ZKkHuHeGMw3sQU1iRdlQefC9DIqre6toWAYKO/Ixrl3EYReWJdQrBLl2uTurDMvM3I63nj55uLfEihayle1/uKp7d1wtBlgVhQoMi7pA0dc4pqGujeK1EZRTvuyxmMniuGUE8Z+smdC2HFNOglxXoUbY8XRjWL+fJLT25uChMmXtRz9jlnqgjQenqHAdEjrE26457RLQ82wWBXsibZEZy89d35wtrNHhboKwXBK68LAdTaRPCclMmVV64ksuVHlqIaqtJ+zD3+wfg6Xou1u8DxL7lri3Rl5anjVq1MiGTyiaB35z+6Jg3UhxxwCuy4NQSWuiQsLFCUrBQosbgjLqTxmeRFCrm3a7PF9qIG0PNbpwiqEf+6InKo9DGaHri9lsSfI6yHHGiTghsxOvC0/KIzIZi6MB86xW91AG9vHoG3dPRRffruD4PHC7Zfi4/D02FrG6NpPJLwdEeGYBbCHEij/iTV2fYqls1uHA/MtCBH3d3p9r9QDK2DXYDoz5PpGlBIFNjKWlCn9CNWXYazKUuQTvc/gAZrnFBlUrbFUxx01SFtt0lM1ZGlOuGCQC81Yox
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11878326-cc9e-4a08-824e-08d94aefdd3d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 20:00:32.0619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kt+TA6nCi6eHKZ6vmjXlBYjftiuUPoP4fbguT+wxpwwGPKPrUMT+a5RLoc/hmztbh243pr8/oaOr7AFlToC2ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3853
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10050
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190112
X-Proofpoint-GUID: 2Ru-f8qgt1LIBpucFDuifJBkSZdeUcfI
X-Proofpoint-ORIG-GUID: 2Ru-f8qgt1LIBpucFDuifJBkSZdeUcfI
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Acceptance test for libvfio-user in QEMU

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 MAINTAINERS                   |  1 +
 tests/acceptance/vfio-user.py | 94 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 tests/acceptance/vfio-user.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 46ab6b6..644bd35 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3381,6 +3381,7 @@ F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: hw/remote/vfio-user-obj.c
+F: tests/acceptance/vfio-user.py
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/tests/acceptance/vfio-user.py b/tests/acceptance/vfio-user.py
new file mode 100644
index 0000000..ef318d9
--- /dev/null
+++ b/tests/acceptance/vfio-user.py
@@ -0,0 +1,94 @@
+# vfio-user protocol sanity test
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+
+import os
+import socket
+import uuid
+
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command
+from avocado_qemu import exec_command_and_wait_for_pattern
+
+class VfioUser(Test):
+    """
+    :avocado: tags=vfiouser
+    """
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+
+    def do_test(self, kernel_url, initrd_url, kernel_command_line,
+                machine_type):
+        """Main test method"""
+        self.require_accelerator('kvm')
+
+        kernel_path = self.fetch_asset(kernel_url)
+        initrd_path = self.fetch_asset(initrd_url)
+
+        socket = os.path.join('/tmp', str(uuid.uuid4()))
+        if os.path.exists(socket):
+            os.remove(socket)
+
+        # Create remote process
+        remote_vm = self.get_vm()
+        remote_vm.add_args('-machine', 'x-remote')
+        remote_vm.add_args('-nodefaults')
+        remote_vm.add_args('-device', 'lsi53c895a,id=lsi1')
+        remote_vm.add_args('-object', 'vfio-user,id=vfioobj1,'
+                           'devid=lsi1,socket='+socket)
+        remote_vm.launch()
+
+        # Create proxy process
+        self.vm.set_console()
+        self.vm.add_args('-machine', machine_type)
+        self.vm.add_args('-accel', 'kvm')
+        self.vm.add_args('-cpu', 'host')
+        self.vm.add_args('-object',
+                         'memory-backend-memfd,id=sysmem-file,size=2G')
+        self.vm.add_args('--numa', 'node,memdev=sysmem-file')
+        self.vm.add_args('-m', '2048')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-initrd', initrd_path,
+                         '-append', kernel_command_line)
+        self.vm.add_args('-device',
+                         'vfio-user-pci,'
+                         'socket='+socket)
+        self.vm.launch()
+        wait_for_console_pattern(self, 'as init process',
+                                 'Kernel panic - not syncing')
+        exec_command(self, 'mount -t sysfs sysfs /sys')
+        exec_command_and_wait_for_pattern(self,
+                                          'cat /sys/bus/pci/devices/*/uevent',
+                                          'PCI_ID=1000:0012')
+
+    def test_multiprocess_x86_64(self):
+        """
+        :avocado: tags=arch:x86_64
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0 rdinit=/bin/bash')
+        machine_type = 'pc'
+        self.do_test(kernel_url, initrd_url, kernel_command_line, machine_type)
+
+    def test_multiprocess_aarch64(self):
+        """
+        :avocado: tags=arch:aarch64
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/aarch64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/aarch64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'rdinit=/bin/bash console=ttyAMA0')
+        machine_type = 'virt,gic-version=3'
+        self.do_test(kernel_url, initrd_url, kernel_command_line, machine_type)
-- 
1.8.3.1


