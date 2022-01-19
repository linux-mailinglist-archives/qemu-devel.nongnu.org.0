Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDB24942C9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 23:06:55 +0100 (CET)
Received: from localhost ([::1]:35006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAJ6U-0006XC-B3
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 17:06:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIjl-000077-EB
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:43:27 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:61288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIji-0007PM-AO
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:43:24 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JJU0LY031218; 
 Wed, 19 Jan 2022 21:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=AQ0evnV9UvpDTIfWKxevLIFkwP8LiSEGiDcNQhmW4gs=;
 b=EZHZw+iXqAJ5sd41vT4Cn4UhwzuIk/+qi9vlJGug1imT0UgDy9SVAYOjqQjCF774RIV+
 srxTxwzL17R/BFj9/ANj3CZSnLXw40XGQRuhA3M8C5VgxIt8dV4DigFD5vdYlv6rx4/N
 MKMnMACtGBnr9skMyYhBws1pdNdgk2UTLpBXHSoAoNrmSuuMcjwCMYj7b+mD717cZmSN
 QzQSxzCu3FhSkST+l5Y9bfTfCNcCpK89NTzH9bSqcW6B62WFTNcxmDjKf556lz8snmcM
 m0TCv2FcWJSuG+moC7aB7FRFH3Lp8sMuZj/Wqr6xOyxYlxxVs1VwEkG95c1y4CqUhGjy 0A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc4vpgqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:43:19 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JLa78h131775;
 Wed, 19 Jan 2022 21:43:18 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2049.outbound.protection.outlook.com [104.47.57.49])
 by userp3020.oracle.com with ESMTP id 3dkqqr65p7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:43:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQ3A+j6sQmwKBgZbwoQtWDU09AUIeJsNgza6gPVT0w3q73KlDBPZitbwEiGFtpo5E2NzHFaUF0E1Aqi+VryETmRjYFogu+w9udZo5kXHqBcXRyC9bjCfS2bh8L4YnoI2KihSrF9zNWQwim7LU5Np4yluv4xvRKuJ4bAMclc6fwc9C91mRjCKwAzYfNY7vk1SY2BL6rxlUeGnkosmflhxzd0DsQPSG/Mb0kHG4zJ6sBYeha+pOPl8gOKX+YeyxI8rI57dxV5/9l2WR7P/ZaaIrJExl7plMNA2mHP0fufLXmqmFIxHJHXy5dAcuv/CFvS8QWAt6Qhc2trLA9xOhNLniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQ0evnV9UvpDTIfWKxevLIFkwP8LiSEGiDcNQhmW4gs=;
 b=GCChgtl02Fy3hXRBKeLtf40SSHYzODSNjF+lrGpcT6XDZhbpPwJaAubudjdz8z82jE34ruNRejZ2LPDmzWGIN1/wXg1uNq97829o0hr93QISVC3bdTYBxDAVV8I7wroc4U1y0HTzHIKMgS32oHCPCXxLB+K11WxSIRb+S0SQLQZSWaZh9k3yUYiyZwJjQWuEd1EjelrKkRw2KlxzMHuCQ/J2ftzBGBroirt2crzYi6krCOLDu+CF8RyQrjv3PNgAYoumfxuoNIzQOdWjwjyGVIbHSqoGcPF9TFm1Ij4eX9SyFig3gUKoPjqKvkCN0p7sosCnurV1vbkwFwM/VQxcTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQ0evnV9UvpDTIfWKxevLIFkwP8LiSEGiDcNQhmW4gs=;
 b=dygGttABTix4K/WTXWjPjtgR7vowUDx/Ixl/ylVtAUTC6RwRjQSqaxYOFcWWYs5xvM6IIyT/1xsV0dACynifj++lW7gP3mfrnYPKTbAUJGN54TLHUsnzxfb+5fAY7Pl5BYze0UcJ+DVSfRcWPf3BmoS7edPQrmc/8oIyepFmcwg=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM5PR10MB1497.namprd10.prod.outlook.com (2603:10b6:3:13::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Wed, 19 Jan
 2022 21:43:16 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 21:43:16 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 17/18] vfio-user: register handlers to facilitate migration
Date: Wed, 19 Jan 2022 16:42:06 -0500
Message-Id: <0ec006e5c309166cc1920871688508c1f6270ac3.1642626515.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1642626515.git.jag.raman@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 011bb0d2-e988-4ec5-2574-08d9db94b37c
X-MS-TrafficTypeDiagnostic: DM5PR10MB1497:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB149761E5FBFC8DC8407777E890599@DM5PR10MB1497.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EcE/iVS9h0p2XzVz8x74ItukpsKOUU5abJIQ9W65Vt7tfhgI5F/8whrq6f1bSOnPfKOhetgr8yz3NdnD6nPEAH/F6GCTy9mPou0pqWrx/BEuQskwVXgEmsaoSReBOW0oxRVCDUgyM3u3KANRpbAr9BngwxLqF+j3j9p6iFT/QehjtcZp/Q+K+Am+VZTp4Dnx4eTL8mkPyhUYrisd0yD2NdIswkgGc0jIg+j/uk/CsGz/tUpFJdAdfO3MSJ8BCw1fw2LGHgF2ztJ0aopZNXKcQe3q0x3+zfP1rfpzPCiCk97CNjLZSYIwGrbDJcLZ3IhfqB7o61IIkQPZcIMUNshkG2Y15InCcdR9bK7p7eIcLlARh8vNL6l1n61oXoFDnhp4Q+BK2gGV8eqRcRtCKP3piej3/V/d+xWBV/jnTDwBKRnRBiYj6ZKYgVhaOWjVC1xEBSEW4kCsUDVxSw0mT6ru1fZ4iqq3sU4XHjO2H3VNLp+/WIJ/zm9Uqr/NQUDKPzB3xFaVJGCawBLQRi5ZOOG8Oc4eeGHpXY+81gMDAThxGshD20G8bUcD5LRjeACZLaWXnmrt92EDsiTDHWuNvfVybDJhGFkGAwrzXavDdKVPjMttZUqsYLi/HBjZ1kNNLuvIif8kR1A4ZR4DCWv/FybNSXrLazk714Bffmjadpj5XeyZOxhgqgq/JKuiUjEXCUQDe6s9VQ6bWUBRY36rFhtfuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(26005)(5660300002)(2906002)(6916009)(8676002)(86362001)(4326008)(36756003)(508600001)(2616005)(6512007)(83380400001)(186003)(8936002)(107886003)(316002)(66556008)(66946007)(66476007)(38100700002)(7416002)(6486002)(52116002)(38350700002)(6666004)(30864003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bX5S9bvpm2QBLBHF6i6t5ifkcoLv2iNo/gAWKlXHSLELtCXTgAHjiCkRDUK/?=
 =?us-ascii?Q?A5vXzM9dSDFlTLRmLRiVV22GjtDUUh8Cxk3ENnb3jGwGuCeGgQsZxDNXG6ag?=
 =?us-ascii?Q?EHI4tg4x12AhX/j6j2+gSFVPZrmQB6s9X6iVTy7N4tJ4AkcGsnIQcs7vJxUR?=
 =?us-ascii?Q?W9kacgrWgrvcSF0JyRWGqTYR23fX5JVgkq7jF+SKI6oHv37CeH/aNXIcJVOL?=
 =?us-ascii?Q?o6t4LDGbjIBbds0l10S2md0hDTn4wvziowkY2gYIhmsWoV/99nSQBP56LRZK?=
 =?us-ascii?Q?m93AJ3twiOtySBsrXtZLv5Xx0VOwZFOsdxnvmm/E+UfX2YzeYeUiRRU2ghFD?=
 =?us-ascii?Q?4oyFJmpy4xvT56E6kqQft9XFFUcwWhIkyAoUiemrzYDaYW6wGqU2ZhvQZDwL?=
 =?us-ascii?Q?X9T5155dBYnkvRzcb1BpTNaNm7OCFo+l4QqBGCE1O82tPZ4COYu4AHpFnh/Y?=
 =?us-ascii?Q?p9BhWjU9RWclep0sc9iR1JhY/qPgIDREy1wtgPPREO4/ZHRdNpEtA2FQLvlw?=
 =?us-ascii?Q?ZT9t12BoOm1VPxUoGVvFR+zIPVLQIKWGPghrHLzSEi0MUiOQqDn106mWXHiI?=
 =?us-ascii?Q?WjicYKIE1TmY7UD8VRnJNFpupZvxQgkMTkZvPDppms7S9v5oeSyuedpQ3APy?=
 =?us-ascii?Q?aF1TuDuV1kjIIFhOW9DHdExVxaY42U5fxYqjg2aGVz8Mr8XbKtYDHp7ilrqW?=
 =?us-ascii?Q?OotlVnP8J9m5Wf7DtoZGJrj3Uu1q+tx8AmPCcQEU5+j6DHDnAJrdPVz47lt1?=
 =?us-ascii?Q?f/V2KRZ2Aa4xReGub6vY5Uzr5a18dYTZZu9bWlFU1XDtLqZ9mg8e8lUKkFZ+?=
 =?us-ascii?Q?Hh2zwXj8PTuHAerupG5RIhNw5Yj2vctXKmq6F/b7fIAy1agFZlYL99XFsf7C?=
 =?us-ascii?Q?5CqjraN0ugL2MZaPEjHms+VbtLw8bSwPo3wA0on4HbmPQM76Fp519ePgPHWB?=
 =?us-ascii?Q?E+HZmMPUf3hxrs6PANEt/YNoojeNYJkN0BumFzDullYOq3/ADdfPOCrIgvrk?=
 =?us-ascii?Q?7VZGSsGuvD3qNW0AVnzqB4zYzWCBdlrxNJp4Hul2k1bXG1ylcOslY0I18r/E?=
 =?us-ascii?Q?KeGh6HXiQ8qz8n9eXJz3NV4jlqE+9yexvLkAOIQZdXAhuQHH6z14MFvLS5B9?=
 =?us-ascii?Q?MacCcpps3ck0n/HSbnbaMvIJw5SrXwuCix6rL6qsl0w4fCvqA1gTPnL+ku8e?=
 =?us-ascii?Q?fmRg+PpJL7TBnY1A9AenqEjL8UGAW+akQLIl94FXXg7uXJtqL9d9d5dWfgXD?=
 =?us-ascii?Q?507ELndzB66MIUD9YIeO9cadYb0FSzaXQovl519PLWS9j/n0oOHNAmAgDRSi?=
 =?us-ascii?Q?jsm6J30c5iS5llP+NeckBEwF+w4UQsH9KKISjxPWug7ey6xmegBexvX7duPZ?=
 =?us-ascii?Q?grYPobm8A90Nsrq+HlEp32w3Sjzs4HGOIU7+uF1cfBN+ILBcivS0LwN+jtP8?=
 =?us-ascii?Q?WkOFY1sVdZrG6jtdAasFZkR0ZPezlO9BZfHLPZlD7DEiV3sFvMkAcKL3X442?=
 =?us-ascii?Q?2NWHbrjnNegydvId8MAd+LvlZdIuH+66N/Uhy3xTosvnYhB9LtSX6XiheH9M?=
 =?us-ascii?Q?WbOxuYCXEbTzBdHGyDPBZa7W0VPyjePin4lN4q997jO4TviPsjwq/XTj9Wks?=
 =?us-ascii?Q?SvZlEOIFU47qBAWAmvEAc34=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 011bb0d2-e988-4ec5-2574-08d9db94b37c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 21:43:16.4254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1OFMX56KpkXy6ktH7dlaKlKH1IoWYaJ62a3yFIfcT8nMrYFIcp9Br1X4eFN4EavJM9+2ZUubzBWAQ0ciho5+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1497
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190117
X-Proofpoint-GUID: Q5V6SyDQXu7fTnUb_2LDYXDvORhDF_tN
X-Proofpoint-ORIG-GUID: Q5V6SyDQXu7fTnUb_2LDYXDvORhDF_tN
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 marcandre.lureau@gmail.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 pbonzini@redhat.com, jag.raman@oracle.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Store and load the device's state during migration. use libvfio-user's
handlers for this purpose

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/migration/vmstate.h |   2 +
 migration/savevm.h          |   2 +
 hw/remote/vfio-user-obj.c   | 323 ++++++++++++++++++++++++++++++++++++
 migration/savevm.c          |  73 ++++++++
 migration/vmstate.c         |  19 +++
 5 files changed, 419 insertions(+)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 017c03675c..68bea576ea 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -1165,6 +1165,8 @@ extern const VMStateInfo vmstate_info_qlist;
 #define VMSTATE_END_OF_LIST()                                         \
     {}
 
+uint64_t vmstate_vmsd_size(PCIDevice *pci_dev);
+
 int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
                        void *opaque, int version_id);
 int vmstate_save_state(QEMUFile *f, const VMStateDescription *vmsd,
diff --git a/migration/savevm.h b/migration/savevm.h
index 6461342cb4..8007064ff2 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -67,5 +67,7 @@ int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
 int qemu_load_device_state(QEMUFile *f);
 int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
         bool in_postcopy, bool inactivate_disks);
+int qemu_remote_savevm(QEMUFile *f, DeviceState *dev);
+int qemu_remote_loadvm(QEMUFile *f);
 
 #endif
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 1771dba1bf..d3c51577bd 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -55,6 +55,11 @@
 #include "qemu/timer.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
+#include "migration/qemu-file.h"
+#include "migration/savevm.h"
+#include "migration/vmstate.h"
+#include "migration/global_state.h"
+#include "block/block.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -106,6 +111,35 @@ struct VfuObject {
     Error *unplug_blocker;
 
     int vfu_poll_fd;
+
+    /*
+     * vfu_mig_buf holds the migration data. In the remote server, this
+     * buffer replaces the role of an IO channel which links the source
+     * and the destination.
+     *
+     * Whenever the client QEMU process initiates migration, the remote
+     * server gets notified via libvfio-user callbacks. The remote server
+     * sets up a QEMUFile object using this buffer as backend. The remote
+     * server passes this object to its migration subsystem, which slurps
+     * the VMSD of the device ('devid' above) referenced by this object
+     * and stores the VMSD in this buffer.
+     *
+     * The client subsequetly asks the remote server for any data that
+     * needs to be moved over to the destination via libvfio-user
+     * library's vfu_migration_callbacks_t callbacks. The remote hands
+     * over this buffer as data at this time.
+     *
+     * A reverse of this process happens at the destination.
+     */
+    uint8_t *vfu_mig_buf;
+
+    uint64_t vfu_mig_buf_size;
+
+    uint64_t vfu_mig_buf_pending;
+
+    QEMUFile *vfu_mig_file;
+
+    vfu_migr_state_t vfu_state;
 };
 
 static GHashTable *vfu_object_dev_to_ctx_table;
@@ -157,6 +191,272 @@ static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
     vfu_object_init_ctx(o, errp);
 }
 
+/**
+ * Migration helper functions
+ *
+ * vfu_mig_buf_read & vfu_mig_buf_write are used by QEMU's migration
+ * subsystem - qemu_remote_loadvm & qemu_remote_savevm. loadvm/savevm
+ * call these functions via QEMUFileOps to load/save the VMSD of a
+ * device into vfu_mig_buf
+ *
+ */
+static ssize_t vfu_mig_buf_read(void *opaque, uint8_t *buf, int64_t pos,
+                                size_t size, Error **errp)
+{
+    VfuObject *o = opaque;
+
+    if (pos > o->vfu_mig_buf_size) {
+        size = 0;
+    } else if ((pos + size) > o->vfu_mig_buf_size) {
+        size = o->vfu_mig_buf_size - pos;
+    }
+
+    memcpy(buf, (o->vfu_mig_buf + pos), size);
+
+    return size;
+}
+
+static ssize_t vfu_mig_buf_write(void *opaque, struct iovec *iov, int iovcnt,
+                                 int64_t pos, Error **errp)
+{
+    VfuObject *o = opaque;
+    uint64_t end = pos + iov_size(iov, iovcnt);
+    int i;
+
+    if (end > o->vfu_mig_buf_size) {
+        o->vfu_mig_buf = g_realloc(o->vfu_mig_buf, end);
+    }
+
+    for (i = 0; i < iovcnt; i++) {
+        memcpy((o->vfu_mig_buf + o->vfu_mig_buf_size), iov[i].iov_base,
+               iov[i].iov_len);
+        o->vfu_mig_buf_size += iov[i].iov_len;
+        o->vfu_mig_buf_pending += iov[i].iov_len;
+    }
+
+    return iov_size(iov, iovcnt);
+}
+
+static int vfu_mig_buf_shutdown(void *opaque, bool rd, bool wr, Error **errp)
+{
+    VfuObject *o = opaque;
+
+    o->vfu_mig_buf_size = 0;
+
+    g_free(o->vfu_mig_buf);
+
+    o->vfu_mig_buf = NULL;
+
+    o->vfu_mig_buf_pending = 0;
+
+    return 0;
+}
+
+static const QEMUFileOps vfu_mig_fops_save = {
+    .writev_buffer  = vfu_mig_buf_write,
+    .shut_down      = vfu_mig_buf_shutdown,
+};
+
+static const QEMUFileOps vfu_mig_fops_load = {
+    .get_buffer     = vfu_mig_buf_read,
+    .shut_down      = vfu_mig_buf_shutdown,
+};
+
+/**
+ * handlers for vfu_migration_callbacks_t
+ *
+ * The libvfio-user library accesses these handlers to drive the migration
+ * at the remote end, and also to transport the data stored in vfu_mig_buf
+ *
+ */
+static void vfu_mig_state_stop_and_copy(vfu_ctx_t *vfu_ctx)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    int ret;
+
+    if (!o->vfu_mig_file) {
+        o->vfu_mig_file = qemu_fopen_ops(o, &vfu_mig_fops_save, false);
+    }
+
+    ret = qemu_remote_savevm(o->vfu_mig_file, DEVICE(o->pci_dev));
+    if (ret) {
+        qemu_file_shutdown(o->vfu_mig_file);
+        o->vfu_mig_file = NULL;
+        return;
+    }
+
+    qemu_fflush(o->vfu_mig_file);
+}
+
+static void vfu_mig_state_running(vfu_ctx_t *vfu_ctx)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(OBJECT(o));
+    static int migrated_devs;
+    Error *local_err = NULL;
+    int ret;
+
+    /**
+     * TODO: move to VFU_MIGR_STATE_RESUME handler. Presently, the
+     * VMSD data from source is not available at RESUME state.
+     * Working on a fix for this.
+     */
+    if (!o->vfu_mig_file) {
+        o->vfu_mig_file = qemu_fopen_ops(o, &vfu_mig_fops_load, false);
+    }
+
+    ret = qemu_remote_loadvm(o->vfu_mig_file);
+    if (ret) {
+        VFU_OBJECT_ERROR(o, "vfu: failed to restore device state");
+        return;
+    }
+
+    qemu_file_shutdown(o->vfu_mig_file);
+    o->vfu_mig_file = NULL;
+
+    /* VFU_MIGR_STATE_RUNNING begins here */
+    if (++migrated_devs == k->nr_devs) {
+        bdrv_invalidate_cache_all(&local_err);
+        if (local_err) {
+            error_report_err(local_err);
+            return;
+        }
+
+        vm_start();
+    }
+}
+
+static void vfu_mig_state_stop(vfu_ctx_t *vfu_ctx)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(OBJECT(o));
+    static int migrated_devs;
+
+    /**
+     * note: calling bdrv_inactivate_all() is not the best approach.
+     *
+     *  Ideally, we would identify the block devices (if any) indirectly
+     *  linked (such as via a scsi-hd device) to each of the migrated devices,
+     *  and inactivate them individually. This is essential while operating
+     *  the server in a storage daemon mode, with devices from different VMs.
+     *
+     *  However, we currently don't have this capability. As such, we need to
+     *  inactivate all devices at the same time when migration is completed.
+     */
+    if (++migrated_devs == k->nr_devs) {
+        vm_stop(RUN_STATE_PAUSED);
+        bdrv_inactivate_all();
+    }
+}
+
+static int vfu_mig_transition(vfu_ctx_t *vfu_ctx, vfu_migr_state_t state)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    if (o->vfu_state == state) {
+        return 0;
+    }
+
+    switch (state) {
+    case VFU_MIGR_STATE_RESUME:
+        break;
+    case VFU_MIGR_STATE_STOP_AND_COPY:
+        vfu_mig_state_stop_and_copy(vfu_ctx);
+        break;
+    case VFU_MIGR_STATE_STOP:
+        vfu_mig_state_stop(vfu_ctx);
+        break;
+    case VFU_MIGR_STATE_PRE_COPY:
+        break;
+    case VFU_MIGR_STATE_RUNNING:
+        if (!runstate_is_running()) {
+            vfu_mig_state_running(vfu_ctx);
+        }
+        break;
+    default:
+        warn_report("vfu: Unknown migration state %d", state);
+    }
+
+    o->vfu_state = state;
+
+    return 0;
+}
+
+static uint64_t vfu_mig_get_pending_bytes(vfu_ctx_t *vfu_ctx)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    return o->vfu_mig_buf_pending;
+}
+
+static int vfu_mig_prepare_data(vfu_ctx_t *vfu_ctx, uint64_t *offset,
+                                uint64_t *size)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    if (offset) {
+        *offset = 0;
+    }
+
+    if (size) {
+        *size = o->vfu_mig_buf_size;
+    }
+
+    return 0;
+}
+
+static ssize_t vfu_mig_read_data(vfu_ctx_t *vfu_ctx, void *buf,
+                                 uint64_t size, uint64_t offset)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    if (offset > o->vfu_mig_buf_size) {
+        return -1;
+    }
+
+    if ((offset + size) > o->vfu_mig_buf_size) {
+        warn_report("vfu: buffer overflow - check pending_bytes");
+        size = o->vfu_mig_buf_size - offset;
+    }
+
+    memcpy(buf, (o->vfu_mig_buf + offset), size);
+
+    o->vfu_mig_buf_pending -= size;
+
+    return size;
+}
+
+static ssize_t vfu_mig_write_data(vfu_ctx_t *vfu_ctx, void *data,
+                                  uint64_t size, uint64_t offset)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    uint64_t end = offset + size;
+
+    if (end > o->vfu_mig_buf_size) {
+        o->vfu_mig_buf = g_realloc(o->vfu_mig_buf, end);
+        o->vfu_mig_buf_size = end;
+    }
+
+    memcpy((o->vfu_mig_buf + offset), data, size);
+
+    return size;
+}
+
+static int vfu_mig_data_written(vfu_ctx_t *vfu_ctx, uint64_t count)
+{
+    return 0;
+}
+
+static const vfu_migration_callbacks_t vfu_mig_cbs = {
+    .version = VFU_MIGR_CALLBACKS_VERS,
+    .transition = &vfu_mig_transition,
+    .get_pending_bytes = &vfu_mig_get_pending_bytes,
+    .prepare_data = &vfu_mig_prepare_data,
+    .read_data = &vfu_mig_read_data,
+    .data_written = &vfu_mig_data_written,
+    .write_data = &vfu_mig_write_data,
+};
+
 static void vfu_object_ctx_run(void *opaque)
 {
     VfuObject *o = opaque;
@@ -476,6 +776,7 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
     ERRP_GUARD();
     DeviceState *dev = NULL;
     vfu_pci_type_t pci_type = VFU_PCI_TYPE_CONVENTIONAL;
+    uint64_t migr_regs_size, migr_size;
     int ret;
 
     if (o->vfu_ctx || !o->socket || !o->device ||
@@ -555,6 +856,26 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    migr_regs_size = vfu_get_migr_register_area_size();
+    migr_size = migr_regs_size + vmstate_vmsd_size(o->pci_dev);
+
+    ret = vfu_setup_region(o->vfu_ctx, VFU_PCI_DEV_MIGR_REGION_IDX,
+                           migr_size, NULL,
+                           VFU_REGION_FLAG_RW, NULL, 0, -1, 0);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to register migration BAR %s- %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
+    ret = vfu_setup_device_migration_callbacks(o->vfu_ctx, &vfu_mig_cbs,
+                                               migr_regs_size);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup migration %s- %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
@@ -604,6 +925,8 @@ static void vfu_object_init(Object *obj)
     }
 
     o->vfu_poll_fd = -1;
+
+    o->vfu_state = VFU_MIGR_STATE_STOP;
 }
 
 static void vfu_object_finalize(Object *obj)
diff --git a/migration/savevm.c b/migration/savevm.c
index 0bef031acb..be119e2e59 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1605,6 +1605,49 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
     return ret;
 }
 
+static SaveStateEntry *find_se_from_dev(DeviceState *dev)
+{
+    SaveStateEntry *se;
+
+    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+        if (se->opaque == dev) {
+            return se;
+        }
+    }
+
+    return NULL;
+}
+
+int qemu_remote_savevm(QEMUFile *f, DeviceState *dev)
+{
+    SaveStateEntry *se;
+    int ret = 0;
+
+    se = find_se_from_dev(dev);
+    if (!se) {
+        return -ENODEV;
+    }
+
+    if (!se->vmsd || !vmstate_save_needed(se->vmsd, se->opaque)) {
+        return ret;
+    }
+
+    save_section_header(f, se, QEMU_VM_SECTION_FULL);
+
+    ret = vmstate_save(f, se, NULL);
+    if (ret) {
+        qemu_file_set_error(f, ret);
+        return ret;
+    }
+
+    save_section_footer(f, se);
+
+    qemu_put_byte(f, QEMU_VM_EOF);
+    qemu_fflush(f);
+
+    return 0;
+}
+
 void qemu_savevm_live_state(QEMUFile *f)
 {
     /* save QEMU_VM_SECTION_END section */
@@ -2446,6 +2489,36 @@ qemu_loadvm_section_start_full(QEMUFile *f, MigrationIncomingState *mis)
     return 0;
 }
 
+int qemu_remote_loadvm(QEMUFile *f)
+{
+    uint8_t section_type;
+    int ret = 0;
+
+    while (true) {
+        section_type = qemu_get_byte(f);
+
+        ret = qemu_file_get_error(f);
+        if (ret) {
+            break;
+        }
+
+        switch (section_type) {
+        case QEMU_VM_SECTION_FULL:
+            ret = qemu_loadvm_section_start_full(f, NULL);
+            if (ret < 0) {
+                break;
+            }
+            break;
+        case QEMU_VM_EOF:
+            return ret;
+        default:
+            return -EINVAL;
+        }
+    }
+
+    return ret;
+}
+
 static int
 qemu_loadvm_section_part_end(QEMUFile *f, MigrationIncomingState *mis)
 {
diff --git a/migration/vmstate.c b/migration/vmstate.c
index 05f87cdddc..83f8562792 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -63,6 +63,25 @@ static int vmstate_size(void *opaque, const VMStateField *field)
     return size;
 }
 
+uint64_t vmstate_vmsd_size(PCIDevice *pci_dev)
+{
+    DeviceClass *dc = DEVICE_GET_CLASS(DEVICE(pci_dev));
+    const VMStateField *field = NULL;
+    uint64_t size = 0;
+
+    if (!dc->vmsd) {
+        return 0;
+    }
+
+    field = dc->vmsd->fields;
+    while (field && field->name) {
+        size += vmstate_size(pci_dev, field);
+        field++;
+    }
+
+    return size;
+}
+
 static void vmstate_handle_alloc(void *ptr, const VMStateField *field,
                                  void *opaque)
 {
-- 
2.20.1


