Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B1247D826
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:08:33 +0100 (CET)
Received: from localhost ([::1]:59002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07ua-0004Nz-2b
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:08:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VK-0004z7-RU
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:27 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:20640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VI-0008MC-KN
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:26 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXvQk014457; 
 Wed, 22 Dec 2021 19:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=hiTscTV84I6M8kwaZEI7jKel8Itt0I5D8mZZf39GigY=;
 b=cGA5m3UkJqtmKGbInrTCjfn+/bSYLD/C4KsiNLNC6yutYb837wqDgM767QhgRPHLi62l
 QrJnjDJ1IUapL2lYYdOGAL/5nOqSnx646lq3K3ypBvv/WdaQFU5TP0N0El836GWZFauh
 B/bfRd2tdzPsft7ELW1YPzon4Hngtudywhw5FBycYL1FdBmVjd9TIlAuvCzw7pU9w8cy
 /hfBr3D2FjQfYc0pkhq/DhS7iwP7rJSg4o9d5GjXyB9L/4DgHMvXRAdNSvVEnhuxAj3f
 4szWIX7IvHF+vlf8oyXgs/PY5M9esRPSbXuQKoIFgO5VMkZUljEIZtL7XZSdbxa1uLn7 uA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d46qn0t26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJelqI030437;
 Wed, 22 Dec 2021 19:42:07 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by userp3020.oracle.com with ESMTP id 3d193qamtk-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECo7PuAs/s/1T53D1MT9OiLjWa6GunMg3i9/fSlIsdthz8fTEIC+trhdLvJZlQko8Vw76oQXByUHSpS6bZUxZnYshOkNJ0Sesj6PeQ+izVcUx6XyGvwV6qPbWmR7PTAe4TMItNUuNyY0Wc4MyPIZ2EBu1eTgTdtwFDwh6Zg2vqYiCtMp1aI6WnIePQOXRm/aMJRdm9WDkhXoLIM3LF0D5xkD5odbuPpIilYMgKTyQ1QF7KV69KclV7UTBTvi8IlrzFRMou5u+K89ct0moDgxiGzZZvWn0/6s6VJfISibBnZdqVzY+mZmhpld3RM3usX673qikO0/6uI1ATtHesFGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiTscTV84I6M8kwaZEI7jKel8Itt0I5D8mZZf39GigY=;
 b=iLzmSl25ZDz8tEi6xG8VPVNz9N9sjiqfKIG52x0mMk41owSc/gaba2venQeIaTpge/CgkWKkriasq46figL8Dduk3AnPYSz/aNHrzu0zZlP1qlVNii2vQHK+27UbrMbofbStlldz/KyJZVhs3toE//WkcVz3WILy2hl4v4DxiMk7Z5pb3wd6uy5FeI+jd1z/wRSKZb03Pg/aw42JTOOxsHpqgYZl90mUV4f3k4l/TMNucKon4uHYxXxHEKF3qb/SeXGgcTk0YJS47XvanfVJ88DofKdMEoopvY8Rt0ink6OmCtvJk3SnbwWi1XKaFnmHZPi7DJe9w2uA7HgPVRf7cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiTscTV84I6M8kwaZEI7jKel8Itt0I5D8mZZf39GigY=;
 b=YN0jKLLaRPAQZuXaQuXL0G74TWOtJHr2AbZE0c7YgLnBfTMdW3uBcurltLC/z8spt97eH2Hdqma9V8hFLEiyTlsRV7tRIdpLQrqo7AOkru8sZCbGkPU4szULlOQHa+97GNkxbNA2NaUk4j37OjwBhp8e/Atibq5dmn4hTKj32q4=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4242.namprd10.prod.outlook.com (2603:10b6:a03:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 19:42:04 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:42:04 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 18/29] vfio-pci: refactor for cpr
Date: Wed, 22 Dec 2021 11:05:23 -0800
Message-Id: <1640199934-455149-19-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14e9140d-e69d-4353-7058-08d9c5832140
X-MS-TrafficTypeDiagnostic: BY5PR10MB4242:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB4242089E3316A3CC7C8F708BF97D9@BY5PR10MB4242.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:224;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XUDkUC9Vr+e9a52AYKcGAgzq8QXtgOV5CMAHdV1kRVnhtprab9FPadq+1rx2OcZvqp34Z5304Bm1i2SThai14SW8Od2UTV7/V+lRsoNGFeLJpPj5kkmokuR+dgRciVDyaEO0z79VI39dzCFpZsBH8Jqba5bwzN87XfQlCDNqJ/3lpolZIOM0K7xaXiVlnV60qtPWnJuxyLt27wqV0RRSJ1XwJbCMvdQ3i8ClcNGasOhwl9YPfp7rc5Pd2mmPWifsUC+psyjvisEOoLi5KTB4DzyOCkInGz0c3Org9jghtWOXy9NzMvpgeppBjEt5bny7NdUfBi9GuDMXM+ot6qeLmlKkFIuwcqt1kD6CuZKN3KuvnpUj+V2eO5quRLy20zSoaGmFSoqmXdjNwClI2+C0oYOQWLBX5csXAZYUu4PHYQ+XsR3OK0RYsUCeL/u2/QFi/sy8K7qCFLOmJC3epZQ/D+Gv2yxKnhKvxMedtcIbctMaVFqojU+rIHLXakCFaLFQ2bcvACHk3OpqojfgjthBex9qytqIUnx/XVG9HK219O3n2gTf/i4b18JdJ+UhEqtk2JpKbYnjoHOvmwXJ5tNyVQTdnvnAH2daoVSVp6pLXxyiG0N4pXWbU4o4BTImiLc6TfhlSaCer0Ii7pFR4/Yw8HbVCgxt1cQGrRjc0GzhjRCZc7jo++2E7PqnzlZYKNaW3q1V/FS4PtJvgNPhLuno2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(83380400001)(316002)(6916009)(38350700002)(52116002)(54906003)(8676002)(7416002)(38100700002)(8936002)(508600001)(5660300002)(66556008)(6512007)(66476007)(6486002)(36756003)(4326008)(2616005)(6666004)(107886003)(30864003)(66946007)(2906002)(26005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d7xfdv8uiKM1UIM8ma4k4jp4KUxjJ0gUmqxahztnt7fsy1C4apPciAWFOzgk?=
 =?us-ascii?Q?22W+PbGN2sdWNKtWJgNZ2uOlHEI6gVcGtyTXPlZ3syDPoyjdy0Jnj9EDwhdz?=
 =?us-ascii?Q?wQoUcXvtKtKib4Jp7GTRDjWGUZ+flwz/o1dVDWishBmzEwsfam2ut/2SsT9F?=
 =?us-ascii?Q?O2m5Qg8eU3BF0i3poqqDp7XLBFXLdgwXIhQ4rfdlJJORLXJrUkGT4Co5KNKN?=
 =?us-ascii?Q?i9RRKggw811bopzqILYwJAtaHL2q+flFSxdhZfj7UmashIF4PFsVQzvl+ezH?=
 =?us-ascii?Q?Pnb4ypC7rqVhSj3E0LvukF65kMpC48cpOgBuYIqL+xSB/FESnaxWXNkvcBW/?=
 =?us-ascii?Q?xrMBN0O/f59St6q/R5UzeTY7VVPzvHvym8a3a6Cs/Gt/wyRDQ74W4lQ3Pcac?=
 =?us-ascii?Q?ATaM27Ls4WQ+YhsYpj5VqEFjW34NOiRQMBfW784iFT3AK75x9W/F5LfpXJxJ?=
 =?us-ascii?Q?2LoZTQmOHZ9Pj2Nu77FXOfMZ054xRWEbUwcbtCOYzaE5ft3h1ugvOkv38hJq?=
 =?us-ascii?Q?wRsi1bxVKt/k03qP3ilqN3N5ZGA0XGycskoPpa8U51bSKAuhcw6XRaXa8vnB?=
 =?us-ascii?Q?wkRPX7kf9KyYzRLAEFILgOqVOX89qSLhopPeLK+TtbqOUZKDrtP2scZ1Rxpf?=
 =?us-ascii?Q?MHtwH87HnW5ANZ31v8rLayoyjErCeFoiiHjEPMl9Ig4HptR7V7syTnyBp6S0?=
 =?us-ascii?Q?kJsFK8xTJp61chiYP7+8ioWsOQpH5hSwZLSv7o+GUif+Up3UyORNynvrZQRU?=
 =?us-ascii?Q?FZLQ1bg4hc/K7kgV3BIvztO+DUYWc8lzWjzF+l5as2ZwuBUDB2GOLPJBWJkE?=
 =?us-ascii?Q?dMjOPjuIe4mgtwX6vxOfT8ESBd5TW297OD2TcM9bnkeE3itXIjYOfLVm4neh?=
 =?us-ascii?Q?msdzBlffEhg5XdLrNzXUnc9vIz40O/f+nAqb457Hf9Mw8lqM/mvV8VR279Ed?=
 =?us-ascii?Q?kMKV2DhAE7hijPttjOBswLwN4J14fBbDdlBq1Yv+otY9C5pR/+NvE0gYMsW0?=
 =?us-ascii?Q?ELVvhbWhDfM2EW29dC89s/R94T+RdS/9Q3qC9EncpvHcpdxw7DxjnKzKeYaH?=
 =?us-ascii?Q?RzB26JyDpthMTN+0ufLivl4gbVP71VZJimV2gmMOpJSXjz2Vp7Ygg1za1Iro?=
 =?us-ascii?Q?vvB4kNMiVbEO4vAFfoNdY5GavycltyNrWhgMU1Se3M0AWpAhai6qnHtcoid5?=
 =?us-ascii?Q?nUrt1dTSk+h/UUchRhSbXjFxDa95vJkzp59JaJJq7Mvj8V8pC5fawaW3JpnP?=
 =?us-ascii?Q?pUK3+rvA9aZ/QdushUTkNpaL4RhLFakn2UNGhzZK/Okn2TN9ZkYHsnksG9Vv?=
 =?us-ascii?Q?JcAOyuIxoU8H3mF0WlWI8XW9MlsoDgV02binj223RaTLF47MeBRauMcPnzic?=
 =?us-ascii?Q?dZChTdjTZaLXcQuagd5a66VJJ1VZKdeJBJI8+Y0Ec+NyCNb8C7YD/p5fdSHf?=
 =?us-ascii?Q?P1cC74uf+GYskSUKjzQPTdH6MgHKCZmsct2vNOezlsWYytTS2orS5+aoZdlI?=
 =?us-ascii?Q?+dRtLxjSiylYO3nO9dtQaaMr4ZCfK6kQNnazqhjRe3NlNAMKx9SUZL1KjCLm?=
 =?us-ascii?Q?P1OaiaP/bNTV8iBH9cLCR4U5PBNSOkSaK6dzJnzt0G7m2MWBW8+GeI/XPDlC?=
 =?us-ascii?Q?Eh2M+kuekqkftnkDBWy6OU4m4bXmCzoFUNLkOHRrtzZyuBFyP/A11OJi7mMO?=
 =?us-ascii?Q?132X9A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e9140d-e69d-4353-7058-08d9c5832140
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:42:04.0613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJhaFasTi7J4xoEtf1hQc0b9vW7XwIbCO8KjtiejyOvVCMV7bQC+ARuaymgRbOmrrGVBPRKOpGE/RbQhnKIOyk9WpFcE4Rhdukv/Yy4j+YY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-ORIG-GUID: vVaJZZFOHyG27knCePi9leihgpesuoKR
X-Proofpoint-GUID: vVaJZZFOHyG27knCePi9leihgpesuoKR
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

Export vfio_address_spaces.
Refactor vector use into a helper vfio_vector_init.
Add vfio_notifier_init and vfio_notifier_cleanup for named notifiers,
and pass additional arguments to vfio_remove_kvm_msi_virq.

All for use by cpr in a subsequent patch.  No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/vfio/common.c              |   2 +-
 hw/vfio/pci.c                 | 102 +++++++++++++++++++++++++++---------------
 include/hw/vfio/vfio-common.h |   2 +
 3 files changed, 70 insertions(+), 36 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 080046e..5b87f95 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -43,7 +43,7 @@
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
-static QLIST_HEAD(, VFIOAddressSpace) vfio_address_spaces =
+VFIOAddressSpaceList vfio_address_spaces =
     QLIST_HEAD_INITIALIZER(vfio_address_spaces);
 
 #ifdef CONFIG_KVM
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 7b45353..a90cce2 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -48,6 +48,27 @@
 static void vfio_disable_interrupts(VFIOPCIDevice *vdev);
 static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled);
 
+/* Create new or reuse existing eventfd */
+static int vfio_notifier_init(VFIOPCIDevice *vdev, EventNotifier *e,
+                              const char *name, int nr)
+{
+    int fd = -1;   /* placeholder until a subsequent patch */
+    int ret = 0;
+
+    if (fd >= 0) {
+        event_notifier_init_fd(e, fd);
+    } else {
+        ret = event_notifier_init(e, 0);
+    }
+    return ret;
+}
+
+static void vfio_notifier_cleanup(VFIOPCIDevice *vdev, EventNotifier *e,
+                                  const char *name, int nr)
+{
+    event_notifier_cleanup(e);
+}
+
 /*
  * Disabling BAR mmaping can be slow, but toggling it around INTx can
  * also be a huge overhead.  We try to get the best of both worlds by
@@ -128,8 +149,8 @@ static void vfio_intx_enable_kvm(VFIOPCIDevice *vdev, Error **errp)
     pci_irq_deassert(&vdev->pdev);
 
     /* Get an eventfd for resample/unmask */
-    if (event_notifier_init(&vdev->intx.unmask, 0)) {
-        error_setg(errp, "event_notifier_init failed eoi");
+    if (vfio_notifier_init(vdev, &vdev->intx.unmask, "intx-unmask", 0)) {
+        error_setg(errp, "vfio_notifier_init intx-unmask failed");
         goto fail;
     }
 
@@ -161,7 +182,7 @@ fail_vfio:
     kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, &vdev->intx.interrupt,
                                           vdev->intx.route.irq);
 fail_irqfd:
-    event_notifier_cleanup(&vdev->intx.unmask);
+    vfio_notifier_cleanup(vdev, &vdev->intx.unmask, "intx-unmask", 0);
 fail:
     qemu_set_fd_handler(irq_fd, vfio_intx_interrupt, NULL, vdev);
     vfio_unmask_single_irqindex(&vdev->vbasedev, VFIO_PCI_INTX_IRQ_INDEX);
@@ -190,7 +211,7 @@ static void vfio_intx_disable_kvm(VFIOPCIDevice *vdev)
     }
 
     /* We only need to close the eventfd for VFIO to cleanup the kernel side */
-    event_notifier_cleanup(&vdev->intx.unmask);
+    vfio_notifier_cleanup(vdev, &vdev->intx.unmask, "intx-unmask", 0);
 
     /* QEMU starts listening for interrupt events. */
     qemu_set_fd_handler(event_notifier_get_fd(&vdev->intx.interrupt),
@@ -281,9 +302,10 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
     }
 #endif
 
-    ret = event_notifier_init(&vdev->intx.interrupt, 0);
+    ret = vfio_notifier_init(vdev, &vdev->intx.interrupt, "intx-interrupt", 0);
     if (ret) {
-        error_setg_errno(errp, -ret, "event_notifier_init failed");
+        error_setg_errno(errp, -ret,
+                         "vfio_notifier_init intx-interrupt failed");
         return ret;
     }
     fd = event_notifier_get_fd(&vdev->intx.interrupt);
@@ -292,7 +314,7 @@ static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
     if (vfio_set_irq_signaling(&vdev->vbasedev, VFIO_PCI_INTX_IRQ_INDEX, 0,
                                VFIO_IRQ_SET_ACTION_TRIGGER, fd, errp)) {
         qemu_set_fd_handler(fd, NULL, NULL, vdev);
-        event_notifier_cleanup(&vdev->intx.interrupt);
+        vfio_notifier_cleanup(vdev, &vdev->intx.interrupt, "intx-interrupt", 0);
         return -errno;
     }
 
@@ -320,7 +342,7 @@ static void vfio_intx_disable(VFIOPCIDevice *vdev)
 
     fd = event_notifier_get_fd(&vdev->intx.interrupt);
     qemu_set_fd_handler(fd, NULL, NULL, vdev);
-    event_notifier_cleanup(&vdev->intx.interrupt);
+    vfio_notifier_cleanup(vdev, &vdev->intx.interrupt, "intx-interrupt", 0);
 
     vdev->interrupt = VFIO_INT_NONE;
 
@@ -410,41 +432,43 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
 }
 
 static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
-                                  int vector_n, bool msix)
+                                  int nr, bool msix)
 {
     int virq;
+    const char *name = "kvm_interrupt";
 
     if ((msix && vdev->no_kvm_msix) || (!msix && vdev->no_kvm_msi)) {
         return;
     }
 
-    if (event_notifier_init(&vector->kvm_interrupt, 0)) {
+    if (vfio_notifier_init(vdev, &vector->kvm_interrupt, name, nr)) {
         return;
     }
 
-    virq = kvm_irqchip_add_msi_route(kvm_state, vector_n, &vdev->pdev);
+    virq = kvm_irqchip_add_msi_route(kvm_state, nr, &vdev->pdev);
     if (virq < 0) {
-        event_notifier_cleanup(&vector->kvm_interrupt);
+        vfio_notifier_cleanup(vdev, &vector->kvm_interrupt, name, nr);
         return;
     }
 
     if (kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, &vector->kvm_interrupt,
                                        NULL, virq) < 0) {
         kvm_irqchip_release_virq(kvm_state, virq);
-        event_notifier_cleanup(&vector->kvm_interrupt);
+        vfio_notifier_cleanup(vdev, &vector->kvm_interrupt, name, nr);
         return;
     }
 
     vector->virq = virq;
 }
 
-static void vfio_remove_kvm_msi_virq(VFIOMSIVector *vector)
+static void vfio_remove_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
+                                     int nr)
 {
     kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, &vector->kvm_interrupt,
                                           vector->virq);
     kvm_irqchip_release_virq(kvm_state, vector->virq);
     vector->virq = -1;
-    event_notifier_cleanup(&vector->kvm_interrupt);
+    vfio_notifier_cleanup(vdev, &vector->kvm_interrupt, "kvm_interrupt", nr);
 }
 
 static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
@@ -454,6 +478,20 @@ static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
     kvm_irqchip_commit_routes(kvm_state);
 }
 
+static void vfio_vector_init(VFIOPCIDevice *vdev, int nr)
+{
+    VFIOMSIVector *vector = &vdev->msi_vectors[nr];
+    PCIDevice *pdev = &vdev->pdev;
+
+    vector->vdev = vdev;
+    vector->virq = -1;
+    if (vfio_notifier_init(vdev, &vector->interrupt, "interrupt", nr)) {
+        error_report("vfio: vfio_notifier_init interrupt failed");
+    }
+    vector->use = true;
+    msix_vector_use(pdev, nr);
+}
+
 static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
                                    MSIMessage *msg, IOHandler *handler)
 {
@@ -466,13 +504,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
     vector = &vdev->msi_vectors[nr];
 
     if (!vector->use) {
-        vector->vdev = vdev;
-        vector->virq = -1;
-        if (event_notifier_init(&vector->interrupt, 0)) {
-            error_report("vfio: Error: event_notifier_init failed");
-        }
-        vector->use = true;
-        msix_vector_use(pdev, nr);
+        vfio_vector_init(vdev, nr);
     }
 
     qemu_set_fd_handler(event_notifier_get_fd(&vector->interrupt),
@@ -484,7 +516,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
      */
     if (vector->virq >= 0) {
         if (!msg) {
-            vfio_remove_kvm_msi_virq(vector);
+            vfio_remove_kvm_msi_virq(vdev, vector, nr);
         } else {
             vfio_update_kvm_msi_virq(vector, *msg, pdev);
         }
@@ -629,8 +661,8 @@ retry:
         vector->virq = -1;
         vector->use = true;
 
-        if (event_notifier_init(&vector->interrupt, 0)) {
-            error_report("vfio: Error: event_notifier_init failed");
+        if (vfio_notifier_init(vdev, &vector->interrupt, "interrupt", i)) {
+            error_report("vfio: Error: vfio_notifier_init failed");
         }
 
         qemu_set_fd_handler(event_notifier_get_fd(&vector->interrupt),
@@ -658,11 +690,11 @@ retry:
         for (i = 0; i < vdev->nr_vectors; i++) {
             VFIOMSIVector *vector = &vdev->msi_vectors[i];
             if (vector->virq >= 0) {
-                vfio_remove_kvm_msi_virq(vector);
+                vfio_remove_kvm_msi_virq(vdev, vector, i);
             }
             qemu_set_fd_handler(event_notifier_get_fd(&vector->interrupt),
                                 NULL, NULL, NULL);
-            event_notifier_cleanup(&vector->interrupt);
+            vfio_notifier_cleanup(vdev, &vector->interrupt, "interrupt", i);
         }
 
         g_free(vdev->msi_vectors);
@@ -697,11 +729,11 @@ static void vfio_msi_disable_common(VFIOPCIDevice *vdev)
         VFIOMSIVector *vector = &vdev->msi_vectors[i];
         if (vdev->msi_vectors[i].use) {
             if (vector->virq >= 0) {
-                vfio_remove_kvm_msi_virq(vector);
+                vfio_remove_kvm_msi_virq(vdev, vector, i);
             }
             qemu_set_fd_handler(event_notifier_get_fd(&vector->interrupt),
                                 NULL, NULL, NULL);
-            event_notifier_cleanup(&vector->interrupt);
+            vfio_notifier_cleanup(vdev, &vector->interrupt, "interrupt", i);
         }
     }
 
@@ -2694,7 +2726,7 @@ static void vfio_register_err_notifier(VFIOPCIDevice *vdev)
         return;
     }
 
-    if (event_notifier_init(&vdev->err_notifier, 0)) {
+    if (vfio_notifier_init(vdev, &vdev->err_notifier, "err", 0)) {
         error_report("vfio: Unable to init event notifier for error detection");
         vdev->pci_aer = false;
         return;
@@ -2707,7 +2739,7 @@ static void vfio_register_err_notifier(VFIOPCIDevice *vdev)
                                VFIO_IRQ_SET_ACTION_TRIGGER, fd, &err)) {
         error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
         qemu_set_fd_handler(fd, NULL, NULL, vdev);
-        event_notifier_cleanup(&vdev->err_notifier);
+        vfio_notifier_cleanup(vdev, &vdev->err_notifier, "err_notifier", 0);
         vdev->pci_aer = false;
     }
 }
@@ -2726,7 +2758,7 @@ static void vfio_unregister_err_notifier(VFIOPCIDevice *vdev)
     }
     qemu_set_fd_handler(event_notifier_get_fd(&vdev->err_notifier),
                         NULL, NULL, vdev);
-    event_notifier_cleanup(&vdev->err_notifier);
+    vfio_notifier_cleanup(vdev, &vdev->err_notifier, "err_notifier", 0);
 }
 
 static void vfio_req_notifier_handler(void *opaque)
@@ -2760,7 +2792,7 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
         return;
     }
 
-    if (event_notifier_init(&vdev->req_notifier, 0)) {
+    if (vfio_notifier_init(vdev, &vdev->req_notifier, "req", 0)) {
         error_report("vfio: Unable to init event notifier for device request");
         return;
     }
@@ -2772,7 +2804,7 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
                            VFIO_IRQ_SET_ACTION_TRIGGER, fd, &err)) {
         error_reportf_err(err, VFIO_MSG_PREFIX, vdev->vbasedev.name);
         qemu_set_fd_handler(fd, NULL, NULL, vdev);
-        event_notifier_cleanup(&vdev->req_notifier);
+        vfio_notifier_cleanup(vdev, &vdev->req_notifier, "req_notifier", 0);
     } else {
         vdev->req_enabled = true;
     }
@@ -2792,7 +2824,7 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
     }
     qemu_set_fd_handler(event_notifier_get_fd(&vdev->req_notifier),
                         NULL, NULL, vdev);
-    event_notifier_cleanup(&vdev->req_notifier);
+    vfio_notifier_cleanup(vdev, &vdev->req_notifier, "req_notifier", 0);
 
     vdev->req_enabled = false;
 }
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 8af11b0..1641753 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -216,6 +216,8 @@ int vfio_get_device(VFIOGroup *group, const char *name,
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
 extern VFIOGroupList vfio_group_list;
+typedef QLIST_HEAD(, VFIOAddressSpace) VFIOAddressSpaceList;
+extern VFIOAddressSpaceList vfio_address_spaces;
 
 bool vfio_mig_active(void);
 int64_t vfio_mig_bytes_transferred(void);
-- 
1.8.3.1


