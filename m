Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AE7549F7F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 22:37:39 +0200 (CEST)
Received: from localhost ([::1]:57208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qoc-0004ji-Tg
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 16:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qfd-0008US-PF
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:28:21 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:58326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qfc-0001v2-02
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:28:21 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DJdXZx027265;
 Mon, 13 Jun 2022 20:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=v0TtMtb4msHN7hub68kHMLkIaVoFhkiYdKR+pNRRZvw=;
 b=vcw47KoTz8i59U0YH9+TYMsXt5wBO/GN2+kXWgK+Og1tum/5+LXK1B7ogf3YRvzc6djd
 RQqbzHkh7QmScVt38qcu1VLzCxJ33Jl1cGkYkpK0Me8ryKFH5Lfw6mwys6QLJ9Ajmman
 sM5dI5Vu+Lb1X6bTmC5Zitr7XwlX34Z43U0y2vuZdsw2qPU6GFYqmfCqJUW5xlJA5qnV
 7eJkbGs5oK9utP4+BNLl0g6rH3/8OkEJNRC/0+P7KEgm/BxKR4k11AaOyTDxHs2v1YJ1
 uhdYrlikAbF0M9qJBsZ4E5Um2E/dM3VCHd9Ke8HEuPxvD4jCaHKCjas7Cf7BfEPqUh7s gg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjns42ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:28:16 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25DKGGHn040826; Mon, 13 Jun 2022 20:28:15 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpc4hr9tc-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:28:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENuePLVzJvfuHvHW6uwj4jm9nESX11pQOs/bvhVIADm4drMwyJJznVjz+YrYvLW/v9KN7mcYv5qf9nYqyFdVi/2ojPxn4mZ4KDjVxv4Fj7LrlXvLU1ZFiDp/O/OnJJApN/k2D1ubxPfJDJZl7gSscughsrSVqmNXt+j8aG+PJ3aL3j5+7LXfzlb9pSRfXf8fXp+LJBezOV4UlC5OqVRJy/D+Jt9UHLFu+rUdV1tP/IdlgtKhWpGWjMS8a0bUmxGWAvBahveTnQhvzFrq5GRB/tSnfWoF06iKML/LcheFLrwAxjW97uVUZDPMqLofF8mds0SVWygEvdAahPCMaOKk/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0TtMtb4msHN7hub68kHMLkIaVoFhkiYdKR+pNRRZvw=;
 b=CH9g0mNg7zyxBOKi7h3s8cI9qDrgzoqRVtPHts5R/BRF8pirC3Rmb+6TA92i33w1YKLp0dxM6Smxuldqi5xWhrukNeHQeLOSnB66rN6/oVw5MM1XfFnDds5Yu7KZkegEgxb8K9ai55nYFE0yXM5EcX4myO5xdxg8olyzIP9N5bBipVDe/+WFdrE069dXaI1ivKatzpl4IZoGZ2Rxf+6T0YOgUlsRIUgdETN/604uO4d2glhLxB0OTTCu+mBKW6fMlaTdn441OgdFQtsqPbUdwSby+pKLQSSHdIVvpPbbNZOoT2427wAvWQwJMvffDC4RSQa+BGfkQUBwRAQh3cDC4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0TtMtb4msHN7hub68kHMLkIaVoFhkiYdKR+pNRRZvw=;
 b=gwM1fXINTIrgWVm8yxBq6NCD1CERiQth88wWUfuZYSqcs0oQSthMr/ydPvgGiMn7DB05HAuJLgHQiZHB9JBYbYDgx5cSH1JaIKbyTJGrpYrT7s1KF2myuoqaX7haFrvfBxtYhjXu/BFpy61M0VPedgfLeYBHtJpCqppxipv2DKs=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN6PR10MB1585.namprd10.prod.outlook.com (2603:10b6:404:49::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Mon, 13 Jun
 2022 20:27:43 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 20:27:43 +0000
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
Subject: [PATCH v12 11/14] vfio-user: handle DMA mappings
Date: Mon, 13 Jun 2022 16:26:31 -0400
Message-Id: <faacbcd45c4d02c591f0dbfdc19041fbb3eae7eb.1655151679.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1655151679.git.jag.raman@oracle.com>
References: <cover.1655151679.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34370228-f813-4227-84f0-08da4d7b2b25
X-MS-TrafficTypeDiagnostic: BN6PR10MB1585:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB158573492AFD8CE4055A8B3D90AB9@BN6PR10MB1585.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TmEFBK/Aec0UQUhjc/S/zivsVuyoe/xZB/m0MbADUW1COLJto8OHCNW/4r58NjmcxyZ785/ByPqgv13w3fJH/tWD99QlLaZX0PgFlQ699YFWv+8L/uPLukscrAVftIX5voABlWiEUjDHdxNNOPgq4St707hROkcbWhi7xsnS7DJnGCJUxVIH2SGkd/0KqdkR49UWVw+rYKRGftoaHz+YM2UHrWtNq82VaX2iIwvU8fujd1r1oGb1xWvQ0e3E6mW+upS7nVp+Tk372tvv/DQWsiUcIQnCz1wGpX8wLLT6e5MsLq3jkZ5m66FcMqdqmjoCB/S4k0zGWQJG/YemZgh0gJ7d4nE6oIL+5BsBhBjVNURMsNJh0SwbQHgkl3v1g4T3JJlYCazwxeRdjVMReR0qa+hVGAXvNzNBPCruM/S+V2BX04UxPZRoilGKHAJb6EwNXAF9wSjt3XdH+Cr0GTmaD16v3KDfnJ1QdIgsYdEwTXCBKXc5DBQmv2vXInYc5HwDupGwXjOQm8JkTs37st7LHjd1o8mAhLRS8Y4Bzd7K8xDFV6rsE6TzH4Urdr+pXYst8eJMUXiklmvYOFRJ8/uH1AZ8xhUG+wO9ZXeDAHoyVJ7J87F/NN+KS+/20THKmrlIULDeP7iXJ0Gl1k1IoH/B2WgPHm+uRCep/BdA7IpBQZG0zTTuT7eTPVZ8Nz8K2L7l589asWSevjFMA2OvYsd/dQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(38350700002)(38100700002)(6916009)(316002)(36756003)(6506007)(52116002)(86362001)(26005)(66476007)(66556008)(5660300002)(66946007)(107886003)(2906002)(2616005)(8936002)(508600001)(6512007)(6486002)(6666004)(83380400001)(8676002)(4326008)(7416002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kRox2oVqM8bIqSPHAn1UiME8iC2JC47v+w+BK6XBPoaP4aCqucEVBzlSjV3b?=
 =?us-ascii?Q?vvXC19dDd+hWtT1z9y7mZyt3N7ekgt+IhO/KP7DL81DwwlHaF6TDmonMl/kN?=
 =?us-ascii?Q?tfxKmvnUFqvwX5aZBrl2PWu9RZcs+vPdUjLy195jfIaJLNvWCDCxYkMbxX+A?=
 =?us-ascii?Q?qFo1i/co8Dp8GoVRFMycJQLmr/gjEHCUaWQAdSCs62ZAIxYibAbw6V8sbZHI?=
 =?us-ascii?Q?WDpq9vxTf5BrqOpReGdB0l6q07F6mAkLcDMRcQmEgegknvUqf5lnNieHEZzz?=
 =?us-ascii?Q?uakO+X5ICHf6hOyvREyCV6u5+qiTJZViYLEklUbWXVh1+OYLmjNU4YqR+ZIg?=
 =?us-ascii?Q?tCW3WPMiYicR6ubGVdlsKMtCipZmi2tJv2zj4LHhjyAQsT7VQSGRFoH0wWCD?=
 =?us-ascii?Q?8Y8cYfLrsnpxl7A/Zws6nuz4k7fuLnvt8JbzBl7HACLusRdy9O2NwdggQYQO?=
 =?us-ascii?Q?gXBh7fwhQ7KIN9CPN9rRrrLYD8IWZK4t5KIToXx/Che8rQorpaMzgmkxaqba?=
 =?us-ascii?Q?3XSfnCzElxR4RfIUUuNEQpqazdCD1jmg7UbNxoiq+qC9WEk7dhV7DvKLAb3T?=
 =?us-ascii?Q?/tcYy8jaTHM8pzYiLlnrmGcEyFcN9KPe640r3gKQ5FKrRlcZQxKx8Ei+UkSO?=
 =?us-ascii?Q?WL8N/W3HaDRS9YL3uAb+4m4VHA2IpdBJkcRFlpiQxAFZ8jm1KMOexhBKdXyj?=
 =?us-ascii?Q?8I3VyjATBUNw4LMRoe0Ouhk7FD+386v4WPvJfyzM58VF1renfpNSfvfuoLsf?=
 =?us-ascii?Q?JFksiBKmDgsvceDqezU7PO8RzXv1+1FqA9f8eTMW3Eaxo6mgjqqmBdJBjlyt?=
 =?us-ascii?Q?R83CZKK/s3FHSYLak5a5F12nqhMKUy00eqQxdEGCU9V18iPl+uuw62MvtpQi?=
 =?us-ascii?Q?9mfQHf6J7KW5Y3AMr2+lXFSYezn5pVlF6i97d3HkxrnODdHsDGy6dBJdiHux?=
 =?us-ascii?Q?rdHbX/MB5Kptd/wUdvOLAS++YvHU5eXJ6loBxSIKVuebFxHZXIK4Z9TcJfB6?=
 =?us-ascii?Q?FK3djrmTTW0ebrIwU4gUKJ4/P2jWsqNQ1ETxm6mC/GlvSCaOBGadVsUoWe1w?=
 =?us-ascii?Q?fLmcveU141deeAG6oLt7f2atjKjtWT9scDxwE2mnaNXMDu7JXYuzF1a5pCdn?=
 =?us-ascii?Q?RhDCR6TiFHj4uPvKBG3c5nWkNQZufV5X7ACxy8IdEE5RFaYlW3fft0lqUZCD?=
 =?us-ascii?Q?Q4zDeUb1QrV0lqTorfvfkiuZa6vpozKgSkPQkCkTHKDPgc7nOHCy8e4LENLa?=
 =?us-ascii?Q?yMmMzwOgp8aJ6WK2e8WxabOHH0Vd3djC2FwR1QrifYhVMgQVtpi8bPBOBWiN?=
 =?us-ascii?Q?jkqMe3jSwP8oI/wGebcmDmL8t3bsmdjQm4458vlXoYx+gxKCq8Q22KbX5V/U?=
 =?us-ascii?Q?EFx9TqDBjDSfmfvDYQ3jsR/k4Ti/T/g2EJSHZ3ky1dGpSdCPT7fj+ew0/axn?=
 =?us-ascii?Q?bpqcBi2ZkQQ0fzll+UxyqTGs/hZPJS8bb9zgj6oq8j9C9DXIJANHGqttcZH8?=
 =?us-ascii?Q?P+Nd6P8v0e8EKqBxhsJJ1IGVtC8UBdNAcremEhKuLY02owNHMWHsClqR9Jl5?=
 =?us-ascii?Q?tbKfahKKhUGscNT5C5PFruBLwmHJv805YfoHPQaRakAufbhWR0+jIUy6If4x?=
 =?us-ascii?Q?dJTdm68F22xkXZXbvKmVrTh48KCxkqgggW/pqoElFluKun+5D4RloeW+Jvzz?=
 =?us-ascii?Q?tZ880IokNbqBK/kMko98PnP5XlU6o7U4wCsx875csYZcXa8yz7nAZKLausPP?=
 =?us-ascii?Q?34FrBvc1Yw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34370228-f813-4227-84f0-08da4d7b2b25
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 20:27:42.9979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6rWfB8tDfa9jMjCUOKu2CMr7mXwTc6KIeaFNNGyAtExmYTZfL4z8Yr06OINnP+UmULCpGR3VZG8lhXx+/J4Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1585
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-13_08:2022-06-13,
 2022-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130082
X-Proofpoint-GUID: 7yox3AYuyQzf63kBRIcQ-ckausqGw7gr
X-Proofpoint-ORIG-GUID: 7yox3AYuyQzf63kBRIcQ-ckausqGw7gr
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

Define and register callbacks to manage the RAM regions used for
device DMA

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/machine.c       |  5 ++++
 hw/remote/vfio-user-obj.c | 55 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 3 files changed, 62 insertions(+)

diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index cbb2add291..645b54343d 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -22,6 +22,7 @@
 #include "hw/remote/iohub.h"
 #include "hw/remote/iommu.h"
 #include "hw/qdev-core.h"
+#include "hw/remote/iommu.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -51,6 +52,10 @@ static void remote_machine_init(MachineState *machine)
 
     pci_host = PCI_HOST_BRIDGE(rem_host);
 
+    if (s->vfio_user) {
+        remote_iommu_setup(pci_host->bus);
+    }
+
     remote_iohub_init(&s->iohub);
 
     pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_irq,
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index cef473cb98..7b21f77052 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -284,6 +284,54 @@ static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
     return count;
 }
 
+static void dma_register(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    AddressSpace *dma_as = NULL;
+    MemoryRegion *subregion = NULL;
+    g_autofree char *name = NULL;
+    struct iovec *iov = &info->iova;
+
+    if (!info->vaddr) {
+        return;
+    }
+
+    name = g_strdup_printf("mem-%s-%"PRIx64"", o->device,
+                           (uint64_t)info->vaddr);
+
+    subregion = g_new0(MemoryRegion, 1);
+
+    memory_region_init_ram_ptr(subregion, NULL, name,
+                               iov->iov_len, info->vaddr);
+
+    dma_as = pci_device_iommu_address_space(o->pci_dev);
+
+    memory_region_add_subregion(dma_as->root, (hwaddr)iov->iov_base, subregion);
+
+    trace_vfu_dma_register((uint64_t)iov->iov_base, iov->iov_len);
+}
+
+static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    AddressSpace *dma_as = NULL;
+    MemoryRegion *mr = NULL;
+    ram_addr_t offset;
+
+    mr = memory_region_from_host(info->vaddr, &offset);
+    if (!mr) {
+        return;
+    }
+
+    dma_as = pci_device_iommu_address_space(o->pci_dev);
+
+    memory_region_del_subregion(dma_as->root, mr);
+
+    object_unparent((OBJECT(mr)));
+
+    trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -387,6 +435,13 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    ret = vfu_setup_device_dma(o->vfu_ctx, &dma_register, &dma_unregister);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup DMA handlers for %s",
+                   o->device);
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 2ef7884346..f945c7e33b 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -7,3 +7,5 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d,
 vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
 vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
 vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
+vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx64", %zu bytes"
+vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
-- 
2.20.1


