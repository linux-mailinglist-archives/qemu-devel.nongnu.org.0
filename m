Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB5647D821
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:06:47 +0100 (CET)
Received: from localhost ([::1]:52480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07ss-0008Gg-PQ
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:06:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VL-0004z9-3d
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:27 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:21186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VJ-0008MW-Dz
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:26 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXxMa028487; 
 Wed, 22 Dec 2021 19:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=cga/I+3i/k80oLHbaipIyHq56lF8Jjv9n+ANl7pIQgY=;
 b=TcqGDMBVFkUnl7TOlbFWbPOs1wyTwNYGQRGxzHkNf7jhcvd25iQ8J4LNo4wSmClBwW5z
 OkP0goiQciIuUdrYonrerhf/HItPqkB+WGtmcnD9eRy7aJJ1zvqHl6eG0xcVld4i8BBS
 0w+9KTNdazEEXGRYGFdY0v8jAf0yStkfsSGtKuhMCp5zQ8IupR24f9Mxi5e/GOd5Y2az
 HYCqs1xIyTdogSpgpuwVTMnjqNEfd4+yMRqtU6L3/VWOuD3/WiCZz4EculaG4W2j/864
 xbE+/XW+wjVZMtBBrwyCzOs8grbw3RNSmYCGSjutmxDFQ/3s4RipeQnE92EohWNJfTYq NA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d410397k4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJelqH030437;
 Wed, 22 Dec 2021 19:42:06 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by userp3020.oracle.com with ESMTP id 3d193qamtk-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJvVdyZ/ekZZzQEjUCEMa2ElzxmLgoNJ+SqGuAqlN/jFyNpPkfdp2PlFDVxB6HDpdHM3RRrHk0Oetbw0Hb0tnzApEH5+fmS0cesBnQi3RxYdYkaPKCp1XQzgRqD8MinD1GP23mNqRihVqOCRtuVo2X6jpsTbXNsEFUFwBW2Lb6aBZpq6HizPWk2NcasxIrc/ukOIoBE9jVVnvFHNrz4562rhPHeXhQNWjM3CNToNVYT79/R4YfMPzpVdyDOgtpJT7jjG836E+K2uF7x4+mFM+7a8ss3W+40MpLLf+6Wn914ym0EZByTaoBohZ/+Q0D0vXAjr3gbDUMkPkcfmoPs6eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cga/I+3i/k80oLHbaipIyHq56lF8Jjv9n+ANl7pIQgY=;
 b=RIgLJKE0eT/vzVQmcoAJ6qotzL/TH/SfptxfZPwKfDt6eumlMIUH59xQ3iKTwrHQ/N61nCOVNht9o2EECZVV4/DQn25TKdsKjcazl3Etw/5hKLirEVTHnk1R3gCGd2jIw8nlUKr9v09ueSQVwyY8mbkDgLydzeQOEHxZgE1R6S6j3FGQXZe+YLoXvQHX34zlpEfFMlj8+942rNk8nwXazY4P1XYwfiiBVNZ9Q6yx22EnhautzVlAo9uSX1bffwXLkwLmEiTCIgO5GCVuUtSdFNWjVIqpEWY9Zfw+aSlPze3RKV7Id9qev3EC4040B/qihr3Q4Yw/Ygoh/vHWOlqk5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cga/I+3i/k80oLHbaipIyHq56lF8Jjv9n+ANl7pIQgY=;
 b=Zei2THFAMHpq0vScIULNCg9M3aeAscTWSVxdhKnO6+dW37atk1QzeZ0y/xjl52+ze9Z6/1mbtvmzbh7tu/gfRlTO/v18WLHmh5yhE/X0eXdRfEBjUd7SF5FF2Oz7nMkeTDi+oYv0+oHSvrZpvJ1xzfHwLhFCRd9YEuDa/G3zOM4=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4242.namprd10.prod.outlook.com (2603:10b6:a03:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 19:42:03 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:42:03 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 17/29] pci: export functions for cpr
Date: Wed, 22 Dec 2021 11:05:22 -0800
Message-Id: <1640199934-455149-18-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2a28beb-9053-41a4-265f-08d9c58320f4
X-MS-TrafficTypeDiagnostic: BY5PR10MB4242:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB424290829151C6F1E2803EC9F97D9@BY5PR10MB4242.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O/ydxxJT31lXUp+LneOwQ8J9Z6ftn6zBQ+eB6BeXrvNk4YTCB6VTIBwhI2l+KVWybRTRutY8278ryGzM5XFZRkjQHbH9QKvvZg5q3fhTApj8m7GeBYlZy9hh0R1/Kq5F1i2TbHYBLhph+wUs3y1VHCSMpqPjuL+8OrZk8pGpdjBcXQhPygkZOhjt1P/5g8+tIXhumSDrbwkTFKeoNag0AODv2VZYCoq75sAPlN3ifhfLskhpLvRdkbAoh3M5hkw77z+sDDLaDCL140tnqzbGahMcOAvGxMQEtVv0V6STOi8Ev9BNb4lgZ2hXTYeoKfNI2IVCWsF5hyWB40zxT1DMwo4cAINjbxOSGS45YBI4o9BfYi4tZ65JWk2U5Ak+YAbASp76fu48rNAavczecsMCIWcxI3HdkKSWrgUI4awWMIginZBBVNn4MpiXivARjvJoOoy/2/LlFpzMPLPceDqpZ6cL6y8t/M9qNlQBadjQ74aTL6cSl5epgwZAY1pARXW13z8tBOzfOhBXVyCRjWtb4wKuZxtwoNt53OY9Zd9JEwB1KAT/NfsuW+345SoRQDJNaJmCHV2lSLnpr+XfWT8mjyDGAnW5COCzBw7siUzOE4x+I0RUE03OE+QVZInjW0Ax6Kq1S8lfKwXZ5N7c47jfdGfEvBsONYRBMUN343fXO3QgE1wUGNtxHPv0+r2sQ9CHH+euuJ1C7JcR+JalVOKwYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(83380400001)(316002)(6916009)(38350700002)(52116002)(54906003)(8676002)(7416002)(38100700002)(8936002)(508600001)(5660300002)(66556008)(6512007)(66476007)(6486002)(36756003)(4326008)(2616005)(6666004)(107886003)(66946007)(2906002)(26005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ppdJxcL5vkFbiI/Rck6EfRARX3Fz3fvsF4v/OSoAzCVi3bPBGSNWICAD/O4L?=
 =?us-ascii?Q?o65mGOeJvtMnmSxm+rmzKf3bch2np1Sn9vymhLwL7GTi/QJEe4PQ/eQs8FCC?=
 =?us-ascii?Q?XhpTZ44PBUPDLgjU85/oLZn40QPCjMa3Q9o8Eq1J5mMKfigbVgpaq/AKCUO+?=
 =?us-ascii?Q?itgU1158ds2EW3e94kFAYBb/E4RPFFxQzfFeqHIxKENlWmxuNGju3GoomTcS?=
 =?us-ascii?Q?M0VEY3B1qXAdONEOCWWJ4G1lrLDLTRv1ZpN/PKifJLG79Q/vCFZyS4dDTF+a?=
 =?us-ascii?Q?EXsVtDQD96ig4hTJYBkO0u7ytG0AlGSJy9jOl8eXMLg/DZIglhkWV2rLC0pd?=
 =?us-ascii?Q?pFvH3IMj7bm0q9PUPVdeq0GGrieh92twGPvBK2EmVRq1pclXsUm2jmSg3eP6?=
 =?us-ascii?Q?tHdV+mQVckjrCk2TDVifmn6kbFcSaH1Y5fYprh61hNyWyV+PMMvWEkhc6cdt?=
 =?us-ascii?Q?Cgswz1bB9KRc+lI8wS1gqio8o21qq80RvizQtNqXSrRre80LCV/lXtkPaWWf?=
 =?us-ascii?Q?JEmBb0FGSAZfyqb2Ktdq2T9QFSvOMf2C59UpyUp8Voau9P0xDoUAoI5C3UCS?=
 =?us-ascii?Q?HF3w2sMKafA9F7pdzoclCvpSBjAma+i3CHdsGUcyq681DPpHsO9qTiQg0TR5?=
 =?us-ascii?Q?poNNo+B63jZtH78yCQ9bIDty6+xvnY7I1L7Ca/zjB5EmgBFL/COak3a5h1Vx?=
 =?us-ascii?Q?jxr+GQ2RH6+nnl0SeQiEJ5mWY/8b5ITufbeERtwV5si2oGjTjo1Sgdo4woc9?=
 =?us-ascii?Q?QMz62GlvYtpV0vClbAA7+okCP9ZGJwUHFomFYELeoUgHc67fejtdpuvFiWAi?=
 =?us-ascii?Q?rYynxKeK1v0cu+mQ+rykS1/blL3F/a0myZlITGilcrB9UNK/Dwllnv1FLkaI?=
 =?us-ascii?Q?ym8K2S6zUod2O12LgBHLdouElXWu6MYUGKtvtBO4WT4V94MJLbnhDeWcmmhj?=
 =?us-ascii?Q?wtfWtxf+s5OTDSHSGGOhPXy4S3wycE9xJ4870DF18GMZ3gGL3TczFuB2l+uR?=
 =?us-ascii?Q?a64PDSNSTeBdTChICl+Gca87PKA5R7F76d1GSQ0Ig8Q3YJKHoX+GBbuJU4Kq?=
 =?us-ascii?Q?LnYixvQT/ywczFxzlM66mNIxWtvLhSsj6NUvpiwIVwERLG5QKU3uPIL/XIfe?=
 =?us-ascii?Q?AsizRw/uggGJ83XlPSDjDnOPLrURbRzUOumYbpeBHQY668lgTLL/nhe+oVLI?=
 =?us-ascii?Q?v2lDCRBPrYpaVS6P/rKKSSyKc1vDMErzEq9D7E5Cb7hmVP8etuXb1/b18qLM?=
 =?us-ascii?Q?e1T9L+5jhv1/y8yIJB9jom3w8Y0nRDDfw1LjHCAZSGP8v0aoz3JSzPOjy+x6?=
 =?us-ascii?Q?aPU5AMmJbEOv7y0iaMMHS639Mw60YjUS+pbH8w09WBFyrl/HsjWQLj1+HFLP?=
 =?us-ascii?Q?VK+9kVhIf0gNf9H0LrpVd71cXeqLKt4U8kFAdtogYCNXiBKM8ICf5E1+1OoP?=
 =?us-ascii?Q?T9wIrL8OCmvAVQpvMJU/yNIpv3IvvZvsnTj/cOguencVkmgPsv4/eM5XeqfO?=
 =?us-ascii?Q?zkLnhTStLXwLFFF5FU1TQAHryFSBhNxsbgC2kviuVZ+NW2LyC9tszsafaeW6?=
 =?us-ascii?Q?jnDW+nlOaVlMO62v8LDpT8QI2cGURcBopARF75/o7F5KMdaUxkmI0Ed6Tx8I?=
 =?us-ascii?Q?5V/PH7ic2fizLDEFPeGM3udRodb/OnB+DZKP69sWc4tpLLOvpFDhClfFqheP?=
 =?us-ascii?Q?AnxUzg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a28beb-9053-41a4-265f-08d9c58320f4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:42:03.6238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gt2/p2AeNhgc6Mq3LDJa455M17/puitfWIFJ6FpCLDOapS2lkmSz4U25RctAYjlVRrIoepXm6R99jRwHJN8zidtvIEMi4qJf091gYdzkRME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-ORIG-GUID: 9dDhu5rEBAXcRNRVn2ad53Iw1coxbpfU
X-Proofpoint-GUID: 9dDhu5rEBAXcRNRVn2ad53Iw1coxbpfU
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Export msix_is_pending, msix_init_vector_notifiers, and pci_update_mappings
for use by cpr.  No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/pci/msix.c         | 20 ++++++++++++++------
 hw/pci/pci.c          |  3 +--
 include/hw/pci/msix.h |  5 +++++
 include/hw/pci/pci.h  |  1 +
 4 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331c..73f4259 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -64,7 +64,7 @@ static uint8_t *msix_pending_byte(PCIDevice *dev, int vector)
     return dev->msix_pba + vector / 8;
 }
 
-static int msix_is_pending(PCIDevice *dev, int vector)
+int msix_is_pending(PCIDevice *dev, unsigned int vector)
 {
     return *msix_pending_byte(dev, vector) & msix_pending_mask(vector);
 }
@@ -579,6 +579,17 @@ static void msix_unset_notifier_for_vector(PCIDevice *dev, unsigned int vector)
     dev->msix_vector_release_notifier(dev, vector);
 }
 
+void msix_init_vector_notifiers(PCIDevice *dev,
+                                MSIVectorUseNotifier use_notifier,
+                                MSIVectorReleaseNotifier release_notifier,
+                                MSIVectorPollNotifier poll_notifier)
+{
+    assert(use_notifier && release_notifier);
+    dev->msix_vector_use_notifier = use_notifier;
+    dev->msix_vector_release_notifier = release_notifier;
+    dev->msix_vector_poll_notifier = poll_notifier;
+}
+
 int msix_set_vector_notifiers(PCIDevice *dev,
                               MSIVectorUseNotifier use_notifier,
                               MSIVectorReleaseNotifier release_notifier,
@@ -586,11 +597,8 @@ int msix_set_vector_notifiers(PCIDevice *dev,
 {
     int vector, ret;
 
-    assert(use_notifier && release_notifier);
-
-    dev->msix_vector_use_notifier = use_notifier;
-    dev->msix_vector_release_notifier = release_notifier;
-    dev->msix_vector_poll_notifier = poll_notifier;
+    msix_init_vector_notifiers(dev, use_notifier, release_notifier,
+                               poll_notifier);
 
     if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
         (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index e5993c1..0fd21e1 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -225,7 +225,6 @@ static const TypeInfo pcie_bus_info = {
 };
 
 static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
-static void pci_update_mappings(PCIDevice *d);
 static void pci_irq_handler(void *opaque, int irq_num, int level);
 static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom, Error **);
 static void pci_del_option_rom(PCIDevice *pdev);
@@ -1366,7 +1365,7 @@ static pcibus_t pci_bar_address(PCIDevice *d,
     return new_addr;
 }
 
-static void pci_update_mappings(PCIDevice *d)
+void pci_update_mappings(PCIDevice *d)
 {
     PCIIORegion *r;
     int i;
diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
index 4c4a60c..46606cf 100644
--- a/include/hw/pci/msix.h
+++ b/include/hw/pci/msix.h
@@ -32,6 +32,7 @@ int msix_present(PCIDevice *dev);
 bool msix_is_masked(PCIDevice *dev, unsigned vector);
 void msix_set_pending(PCIDevice *dev, unsigned vector);
 void msix_clr_pending(PCIDevice *dev, int vector);
+int msix_is_pending(PCIDevice *dev, unsigned vector);
 
 int msix_vector_use(PCIDevice *dev, unsigned vector);
 void msix_vector_unuse(PCIDevice *dev, unsigned vector);
@@ -41,6 +42,10 @@ void msix_notify(PCIDevice *dev, unsigned vector);
 
 void msix_reset(PCIDevice *dev);
 
+void msix_init_vector_notifiers(PCIDevice *dev,
+                                MSIVectorUseNotifier use_notifier,
+                                MSIVectorReleaseNotifier release_notifier,
+                                MSIVectorPollNotifier poll_notifier);
 int msix_set_vector_notifiers(PCIDevice *dev,
                               MSIVectorUseNotifier use_notifier,
                               MSIVectorReleaseNotifier release_notifier,
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index e7cdf2d..cc63dd4 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -910,5 +910,6 @@ extern const VMStateDescription vmstate_pci_device;
 
 MSIMessage pci_get_msi_message(PCIDevice *dev, int vector);
 void pci_set_power(PCIDevice *pci_dev, bool state);
+void pci_update_mappings(PCIDevice *d);
 
 #endif
-- 
1.8.3.1


