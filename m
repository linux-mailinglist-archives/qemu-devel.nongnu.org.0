Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F879546DC8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 21:58:50 +0200 (CEST)
Received: from localhost ([::1]:48532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzkmP-0002FW-ND
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 15:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkfI-0000bG-TK
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:31 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nzkfG-0000cU-TO
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 15:51:28 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AJhuHE021480;
 Fri, 10 Jun 2022 19:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=WYJzEwinvFw5eeirBfYBuhwEJrv973cyD+cgG6PxnXg=;
 b=IqsFtFZ3hsBrNXM1DSzNP7SnMuIlaWHKgWvtBAFcQjDd+eNNROEux04X0lWzwcd359pT
 O157lnc5OTUbzaEpcOMRpnvtUOfk9bLS3ZYSwjFNPRdY6KopPEuh2IhoPo8wI4LebdOX
 oDU/g+DWIkuyV5aXMu05gMIc+/U3V1yi9HzFJjmx3l4yH8D3j/mLtwkrLEHyate2IbuH
 SY6/280OD+R0Sp4mLv3r3cfsRyr3wwNu7EiGvYZv2qKwBHFI1Cuf8eSCVHx2DQIXunJb
 mxrA6wnAwyuXvjISUZyK42utCS8i+0lPSrI315pyCuWYulEWQKLK+an9EiN31C+tXTl/ FQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ghexem0vc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:24 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25AJkbGq009283; Fri, 10 Jun 2022 19:51:23 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gfwu6bbbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jun 2022 19:51:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BjttBUas4BMaNErZqxtAS8Jos0M4jaRx+292KZnjWG0hPvCA6RUuz9NAJRnfpPHAYz4WqrpD4onQNwl5sy1CJau3nkoNDLGKh1XjO27mAnSPUAFtGokiKImeDg+6c4hrGbpR3tcT6ZTBxQQMJnYMuZLCaVR7d39JfFApnv8WwLuddqIzksNCLCn2HXsAOD6Q3UN0JpjdfvMTCcQUgdFSxrZ0FEKpWAryIdQuk8hYaOLUSJLAYavOPKw9uw4B3RlZyOz5pfOCICFlNkxIDCsr+juyD2t5M2OG5mo7FPerdkgeXcXr1KLy9VzSGL0msJ53Iro87sEp4MCC/tjFGo3arA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYJzEwinvFw5eeirBfYBuhwEJrv973cyD+cgG6PxnXg=;
 b=eUYFASVx5WMNdYLbfHc+O+W5Bke4MHCme7Uk8v70jLEyDtx1qFpJO8UpTzQMyE/LrumYppC95/h4ZY3bymv0XGDvArhd/dRUXj/lmkf76vHknatB5PCfdPwFwpHoqQXHAZR65HH6YQFIgBWleaai/f2UNrKs9UYDjkFumJyqFU7IHiptYZ55QPK2YD+J19TAFGgO6T496gTqqBdFlhR78RgX6HmoNUBuyUxjeJiIEoTtozM8cedFOI/0EyIYHzt+ujhS6Djc82pj/HbfvrVWVVskMbQ8SqNLcyZvOI1QR3rIlU5PtpvIB/0XV8M4TP/GFlH2odZ9+W5pfNzkYwWQvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYJzEwinvFw5eeirBfYBuhwEJrv973cyD+cgG6PxnXg=;
 b=SYshn0B5qxhhEfk95RPHgtIJjSD8+OLYLihv9EHsvJQjwSyqzg1q0rBEOyFur8/ngBgFQnMzYlXH6CrRd9z6xlGMILrSMYw+TqmI2kUie1HHdifP4ZmNYkb5UHi1jo1yYjuOEpfJOBg9dKT0HFMZtqVPj8Qb9IGIPTJzx2Gc7QQ=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM5PR10MB1915.namprd10.prod.outlook.com (2603:10b6:3:107::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Fri, 10 Jun
 2022 19:51:21 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5314.020; Fri, 10 Jun 2022
 19:51:21 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v11 14/14] vfio-user: handle reset of remote device
Date: Fri, 10 Jun 2022 15:50:41 -0400
Message-Id: <73a2c43596d9fa5d04c3faa4ebbf045f87f7cabc.1654889541.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1654889541.git.jag.raman@oracle.com>
References: <cover.1654889541.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM5PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:3:12b::32) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa8963d1-5c14-41ae-ebde-08da4b1a9788
X-MS-TrafficTypeDiagnostic: DM5PR10MB1915:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB19155EDA9101CC66E2CF650390A69@DM5PR10MB1915.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aFRfbOnxMHTWB76TyEGllwmjy51U0kpvoA1ktocVBPuobwt/mZ9WD6UIC1DI9X6a6v6nqj+9q5G8aMvuroFj1j22HXbTIfIK8FaxGJVEUPSM4qJrSrEC3+ERFgXYiPFb7BR8xaQ8Y1/F7KOzbslkqudIgQ+nInFwzO4GZZ3K9haPt2bwnb1PQVzeKxY+c5jMJLuE1OIThs5WkH5sxx46d7YCMwkUr943AWQ4HuCBAU02ApeqhvR3i+JI2ieL7XsmhUN7XtUZ/BG/fHsk5Hwb5MFpIEKXtYsQ9gvluIojmExfmYq5ePRSufYfGnYdQTpI2HH7DIQNsILrrCO8v5/F1qAcDoPIZkI8zBZ9hEPrwCgpGA8DLuiKtcoLJ32QTaTQ6SH1EXbBKAHafjqWHc70N0jtHexRGbOuIdm5OCSUFZzDVUspXh47xoQHvfVuRNgxuf4BPW90tpmpZ1hUucuujlkff7VxmQadJA3o5mC/hkG7ckDHIt856CwZpiT7KgGWn5XEV4fE0HUpDqXlLG7VVQiD8wg5TypMdzw/kPe7hoJGI8LGypDnz5jnB6wHfqWm43Y0gvOQnRTyDrPUNqocWKY7f4VF3g/3LkpUVJTggjacfUsZn2oTWGedHp6KaRNlkf3bkBlB9x1fQsszG0BGr4IX6UQ1blnQfqvr+KnXufdHKXpadY2bHFDOHbGFTBR7A+IMmu+OA81JUlxnHzkJPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(6506007)(6916009)(2906002)(107886003)(38100700002)(38350700002)(6512007)(26005)(8936002)(2616005)(86362001)(52116002)(186003)(36756003)(66556008)(66476007)(7416002)(6666004)(8676002)(508600001)(6486002)(316002)(66946007)(4326008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N+Ban8QifD3q1jDgHm3wTsPyUzD8m85jGGHPze3cvfoH0Rll+aKIw7srD/2s?=
 =?us-ascii?Q?7PRbkpQKVIQaunGybpM57mnhP+bS3TVBEgTFC8tOIu86uyDbJorN4CWkeb4C?=
 =?us-ascii?Q?FLg+SbrxRbEtkQrZsmhU8CurfZE2x7WIZDLIf2cSUaHtmJnGwmpLjg8mc+iE?=
 =?us-ascii?Q?kGbFXiGD6Pnk2woq1d8uhnxdosPfBxhobaRn0EvakV8Em2XCp6AWEe/CXYou?=
 =?us-ascii?Q?fPVts66KoFgxhKgfUxKSXMVLgHAzCxEXtmogG4EOaZNH5KAK7YDjsIxK2aFJ?=
 =?us-ascii?Q?JKqqD/iyxhPnZiBU8y6Ds0+EyMReBXbaL2fEl0AXQxBEjuarSL9eCdNNZCMy?=
 =?us-ascii?Q?IAPC8VzIRsLG8qkI5jKRxSkQK6pLpjy6whL35pCdhyPcQ8wmuKfHNFoWjkoG?=
 =?us-ascii?Q?vohWR5TMjJeraFErq9NGsRGKt3v3qhcIn3csntqCuVU6t2wcXhpGIkJcwx3a?=
 =?us-ascii?Q?gz4wXWL/Mht3dp0pkT0LaHBvUHKb4ZgaY9v+YOOmqI6vFi1IgP9DegYbsS5W?=
 =?us-ascii?Q?EOK9BwPEfx4qc+Kb/cC6P6CHQvAmDCseGxbg9gIn/Japfzb0ZVJ9xUpIJofb?=
 =?us-ascii?Q?oH/gJQs+JI4zlUaSwrlcnsNQSudxbA50VvqkusINbst5fz7sZo8QseeAx7lL?=
 =?us-ascii?Q?jJoIBDUQia778S6FmO1LboAmvVVkgYDWir7CbrAJW/G3nN/YMhCGA2hnHaXo?=
 =?us-ascii?Q?4R7KsCSPC9oU0an/d6XMHLndOdklD/KSBVyX1uSKKSub9Pd5rsVtFGJdkRl2?=
 =?us-ascii?Q?m/g0Ti8kk8nFuM63Yw5aQdRlDbW/CMI0XfXUuzp4CX8s4wVZErcaLHyCvoXq?=
 =?us-ascii?Q?BryeyVogZ1zw+OBXUcc0+g3AuNK31lgkB9yM1U5G+ZgC/cESRsRwcn1m1bXr?=
 =?us-ascii?Q?mbsJGopfWVNmPL9jzEfIttuoXY8VH4w/htJRzAT4jot4pJWav1VH55VFms7T?=
 =?us-ascii?Q?rDy4IPR6KrmJPTnMFrZvSkmQU9X+TnNZjgECAt5EFylYLrQ+QjmoVWwZJBlJ?=
 =?us-ascii?Q?KpcTexH9ikeMgydMLPfZohSOGtxHtrkFGhWsFKYI8XlSbQA+fEMVOVtAXcsI?=
 =?us-ascii?Q?S6HdAawz6hUgExY9aQGM1I2QN8HAdEMYLb++dzaxTkNVOtIH/SNXYTJ2rGBV?=
 =?us-ascii?Q?SdazjOuYiOdaaSiipLBo0GCSWCUbZd6kNWrZARrdAu9GwnCbJYRqR5MPnIm6?=
 =?us-ascii?Q?asDJGJDYzkFe1Da9cShVmyIDXALmi03VdBs4tZzthf6+w/IzgdTgLLHydU20?=
 =?us-ascii?Q?8GoKJlM9wBP2Qr8tn4j04GH68EGTmfEl9dlaakEEjGL4+YMmOVRTiyHN8sCx?=
 =?us-ascii?Q?EEJB/DKUmnVsi5peQhLRlXEh3cm+EwBARcutf32NE4COb6FyluPzWVnynaIj?=
 =?us-ascii?Q?5h+50dLKfUkFzGs+wZdS9db0UUlwq3uXnfU7XBBbFrTdVoTfurl/iM8+f0h5?=
 =?us-ascii?Q?XkJjLmwnMAXDS3dYvwe7sAn3tvJGsS4K2l/6VPfqqN7A3DHDLXddJevUClWu?=
 =?us-ascii?Q?XlBmnAPnZf7u7O0JnQwyLsM7zjMQdDjxNQMJpoqEiXBzNbrjIp1AEUxkzAyc?=
 =?us-ascii?Q?+xERRxZmqgRfDwtuePS4uHSDmyyHhSIVl8yrYOQTA4Th93F62AQB9ikKwCOV?=
 =?us-ascii?Q?/DtURxg9JMGq+2sT3nisHPJLDMwho5IMse5NOGRLoA48TfwgyGQvooVDtEHV?=
 =?us-ascii?Q?YuI2i7bqjKwZVtl715hie3iXzEoMoHYnRSV7S75M6M2n6fPMVfekvSEaLcp1?=
 =?us-ascii?Q?krM4xVhcig=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8963d1-5c14-41ae-ebde-08da4b1a9788
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 19:51:21.1474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k31ymjwfDGSXOdNcmtIotziutKP3r3NiexXIwMbnSkCghCWxLImi3rbYQWH7lcZjGXyfncVSBnb6tNaYMvn8gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1915
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-10_08:2022-06-09,
 2022-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 spamscore=0
 phishscore=0 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206100076
X-Proofpoint-GUID: 3MyjKp1FRNvnRstKJYpHBtI4mGwgETyk
X-Proofpoint-ORIG-GUID: 3MyjKp1FRNvnRstKJYpHBtI4mGwgETyk
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adds handler to reset a remote device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 2d716e6391..c8c61494dd 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -676,6 +676,20 @@ void vfu_object_set_bus_irq(PCIBus *pci_bus)
                  max_bdf);
 }
 
+static int vfu_object_device_reset(vfu_ctx_t *vfu_ctx, vfu_reset_type_t type)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    /* vfu_object_ctx_run() handles lost connection */
+    if (type == VFU_RESET_LOST_CONN) {
+        return 0;
+    }
+
+    qdev_reset_all(DEVICE(o->pci_dev));
+
+    return 0;
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -795,6 +809,12 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    ret = vfu_setup_device_reset_cb(o->vfu_ctx, &vfu_object_device_reset);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup reset callback");
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
-- 
2.20.1


