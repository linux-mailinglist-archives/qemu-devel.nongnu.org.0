Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B9D457763
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 20:57:31 +0100 (CET)
Received: from localhost ([::1]:47458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moA0o-0002xI-Kr
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 14:57:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1mo9vh-0005UY-4J
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 14:52:14 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:58216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1mo9vc-0001MR-58
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 14:52:12 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AJJATbT006439; 
 Fri, 19 Nov 2021 19:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=cL0jF2bbjED8d6sncU+Z+WTd7vZ546U7yZ71REWJt2s=;
 b=XhzPmQ0uka0+0Tpb81W6NSbWUWdUNg+FxA9zV88Q7Esp0psC2Aq09IIMbVmeU/YQlD8g
 YTqI7YkwJNbpfEQJRRLezPICJk78CLTNdpYVwjM2Z6MqifT02mka4UJQd4/IaToWUZ8W
 MvLMY0vlTXp/JKnd993sA3eiUV98kgi2KOWG/mPzoVDmK58t8eGRrFJYUQyaJkVUb+3w
 giuBxYq5BUm9RQXXE3T3LkbQid9IGVszYvEc7rAIGvxSLezLsDXTggKjKp5XTV6O5dpd
 Bn9HZ+pPvkzeCsrVZwsL0Bu4ctjnRR+jtO5gXBih6hq7OoOy9FS3IHmbUZW5BxsCG5Wv bA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cehun06qt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 19:52:05 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AJJkagV092459;
 Fri, 19 Nov 2021 19:52:05 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by aserp3030.oracle.com with ESMTP id 3ccccty7q0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 19:52:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTjQsusuP5h/JzuQ84yRyRNYirOw5TYnl6Pi996e4Tdlo8p339nTvVEAqkAVUiNYU0Qupih8Dkvl/HTUeKfA7DFmPVA6osEO/3w1vp5MxRTTrqXfCCLVR9hiDdpFyGhPAm4Qqh8gV00+UhLosEdmUtx9mCmZ/LWqekp5mu73TdoWXbUU61/tgG97XNpSerdIurySJt5Kiwlvv3VpqfnoIviQYH1dw8C7ah+F2YPRErw8SZoik0evnbd1SiC2qzuvuFpMxJU7nl8duN5BW7UoQppLqUSyZS7cbtiFjwK5mkDo6moCIjZrQoJby9nHygb91nYWJVrUy3HmYg/+b72Bnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cL0jF2bbjED8d6sncU+Z+WTd7vZ546U7yZ71REWJt2s=;
 b=fNpQGFeULo7aQ2Dob57oni7t4oG3KC71NLeCuk7C2E8Cqra+mQOMB/cd3hF4a1Aa7CaIbAGVKbDq2Fctj3e92FFtwyORnubyKF//TRtQnUBrjQTFswQ7oWcXq4ZjAOk1/IBGIVZIuX3q/4X6TcSPHPwe42s1e8K4bDvqQ5BuPT+Punwy3k/aQnunjjJH28K1zWAiWa9PsZmKYH3EwQRPc3Mzx9yFXFkLKOx4OG9hVVN+Zk2vsFyvAMVGuAcOrhxPDO7xKnDaD/QCg0tYO/v4koCIMf99q8amp8Aady2ECMMAztUW9XXsUt4MSq7SpBQbVatQwql2K05b6e2SbB9H6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cL0jF2bbjED8d6sncU+Z+WTd7vZ546U7yZ71REWJt2s=;
 b=AnVchuIaqDTomOf1KPoo/LyFqbXK8X1curK4Ndvner5+m0AgxWPYrjy0AqmNpiCjsBP1+Yg5KJj+xyqRUwycy8f514qqB5g+ccDquALVB9P9JWhzlijeaRju1kIRMxXPcSeIQiF71tQ+v4+lJarlL6LXedEUjfMvdCnLAImcbGA=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by SA2PR10MB4603.namprd10.prod.outlook.com (2603:10b6:806:119::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20; Fri, 19 Nov
 2021 19:52:03 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::8156:fe6f:d62c:5dd6]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::8156:fe6f:d62c:5dd6%7]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 19:52:03 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] kvm: Support for querying fd-based stats
Date: Fri, 19 Nov 2021 13:51:53 -0600
Message-Id: <20211119195153.11815-4-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211119195153.11815-1-mark.kanda@oracle.com>
References: <20211119195153.11815-1-mark.kanda@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::7) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
Received: from linux-1.us.oracle.com (137.254.7.175) by
 SJ0PR03CA0212.namprd03.prod.outlook.com (2603:10b6:a03:39f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22 via Frontend Transport; Fri, 19 Nov 2021 19:52:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0477d15-5544-46b3-a04c-08d9ab960eff
X-MS-TrafficTypeDiagnostic: SA2PR10MB4603:
X-Microsoft-Antispam-PRVS: <SA2PR10MB4603D7DE9BCA349C9E38892BF99C9@SA2PR10MB4603.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dr13tRudwdhNIQBUx4a6zH0EL77Z+x08jRsU1Oyb85jml7aSzQFVkjjqfr9TJii1pY8NDgpMa3vpYJz0IeT8T4xTQh6lMpVCMBNVQHF/nn7LgOT6txmDe6A8cyE2AcD6mRACHov6fkYaICpng2z3D0OZQzbzJtVeU0GWiyKnF4nVIvgIyye05aDamax6cWKXcDq6aGWrEm7Ji6/olXOCgWqp17EX18IQRRBtc5r8pdkIwzP4vCWezShUJNrpu5jxRh3IuPcCQ0e6z2ZZawTTyHZNiqgXvcPXtknJ/tDdzkCSHHFfzpxl6rlD18Yn/IVTGGN8KIaYGyK+Z1WDc61iyA26oH6X9wrogFuZkOe24bN6d445J/+Fy9RLLxkHOXKHfizKHj4hIIXpLblUIiGKPfBjNlgln9fI35PgxwCOGQoiLbdl4DKdQ/Ojmb6g1oEqsjmItnwUUL6qDeicni7AUDoYASe4oMx1Em+/MW01PvGZfFsTaETX92FWAen9/dmNTr9O2P7cZCTBN10xIm/zPCCM9XOQlSsggKf5pzUd15W6e9YCFje1CZqW0AzAh2Bec7xCs4rdwzcLMU9otZrTuLhi0P6W/n5ESuG/acRdTIDNS8LIbjgu33Z1ky2G1EcavUPEoQepnAkMCapCIuLHX6w76iYgxUfC5+JMTKHSs4wgxpDufbJtJN/jMwi2v4FocZOUr3id7SPKeBmHIL3PCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(30864003)(107886003)(8936002)(2906002)(508600001)(86362001)(38100700002)(36756003)(316002)(5660300002)(4326008)(1076003)(6666004)(38350700002)(8676002)(26005)(66476007)(7696005)(52116002)(6916009)(44832011)(6486002)(83380400001)(186003)(66946007)(66556008)(956004)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UtWOfgDZ8+zaLEAy4QB5UC3ZegQZ2EUSh/Cbi9RC3a+55qBfXtZgU3iK6Dj+?=
 =?us-ascii?Q?BDl4HcDG3YvjvF7hJgCp4JAKv4DwAECD2M5OrXXukTyxdpOKyd42ISw/7oeh?=
 =?us-ascii?Q?5KQ+9u3ji7MHD0zdV1u77OTnAD4G91duqbYaMcWgcV6+tAmw3wSFAq0Qarqa?=
 =?us-ascii?Q?xrzPjmRloZfMDNccAiO66v8TIoHlHU6HOBqWMfwsBmlFZQ9Su/oP14AK8eAT?=
 =?us-ascii?Q?p6HY2/rtYJjzhEgDR+V40QPVRJ8QCu3XTBKmx6UKJk7UrVA60seFHXoLNGXa?=
 =?us-ascii?Q?yXvvOjROgfya9e1D6xTIHCFaW5euQonbMgTMNQTMuJowliUQBlJLvXMSYGCr?=
 =?us-ascii?Q?JR1P5FqcYx2wTeh3frkHG8JxAMqZK6BfrxLq/t4bPduJ16XXOOBsCsqNTG/K?=
 =?us-ascii?Q?l9xovwicXgNBZ8+1mSs2yJSajd+4Rv1fv7ZrOOlvykWWM4e83Sx6yFrtLaZw?=
 =?us-ascii?Q?WKnRVfzCeb00fQdDUiIrUDpc90XIJnlwgvFUjo2LV7B1XbPNlLtR1cbI54Nu?=
 =?us-ascii?Q?F6LLXjiJPizsdfkZbn9FQkbbs6jiPZMYdlZpNZCLsiuZLcY3Ah0LT+FV8Kls?=
 =?us-ascii?Q?cuWe3UGD3JG3oZaWjLD6iIxlTWz30c2qEu+JLY87Kb4VnyU+UDFy4aK5oU8L?=
 =?us-ascii?Q?m1PXA3gIeq3x7dedztDFHZ4WrbOKnvEXuLT91iuaqEgd1I8qlrHzd2HbMWly?=
 =?us-ascii?Q?erhAMz+3g53siJsrco1M1TJQdlnwxGtNREgQChMqeab1yxMxKaQnx+MNu+me?=
 =?us-ascii?Q?EUZ76nFsOlepQUMFAjwQnum9/YqumfaBkHsdtzI4ucPavpTMDC5egD9ygoI7?=
 =?us-ascii?Q?S4P3PR5JdJceIxIf9+s+C9iSohVvS7Dms9hFMxTfLmyk251ZqigRi+ol1Nk9?=
 =?us-ascii?Q?k6IIAEDRDPMoOA0zLDbCLS0z0ReuuXK8cdOPbDPXywuq7lWEMMk3EbfEzBT5?=
 =?us-ascii?Q?3ESeuqS77LpXStDNEs2UdDWaAkA70uh++g1dTVmjNe5S1IZY2bVrbxIZDi2d?=
 =?us-ascii?Q?PKK6//QTpBbLIeb3dWZBetQVR1nvX8zaczR54qG96CPdb0XHOD8UGAeYyR/O?=
 =?us-ascii?Q?4mSYqphyECSIB2VV/JbUpYYfMQ4BcRHxd7ZgKCI9PhIKSkpIWfGEE+tl2qal?=
 =?us-ascii?Q?Xd13W2qXtvW6Uzw8dWcNZohIMzRTUyBXL7JwRV+oOGay6nKHVxohbTGv5QwC?=
 =?us-ascii?Q?AkIzSEXteiNks3gXOA6bbsbOm9DL9MAdpkUQ9QVzqSdeSYqZu8tunqDqcrE2?=
 =?us-ascii?Q?SCe4ljJ6EuyHgLyKTkQKRGJFOLmpb4xJUzRSNhVhAcj+QpZXUo8z1kslhSeA?=
 =?us-ascii?Q?XMN2R3Z1ZfXb/+z3TMtSzO0ftP++rDv9Ra706QB85JOLbJ/R7TfKUHEn5RB6?=
 =?us-ascii?Q?dCkKdmusDZTL2vzx0VoqfpPBU+r9p2uusv5rnl4ZCZo9hhG7ce1ApkW41JM8?=
 =?us-ascii?Q?ji4pYRy4lJ9YS3oODJLtnk3v7CksVbG/2T/MII2dcXvURNk6zJQopVkO22xK?=
 =?us-ascii?Q?N76MtPcvV+p7Csa28LVwud9Yeflj7/YHy4UEYSGICYJQi9qQiLArXos7nqVY?=
 =?us-ascii?Q?0tvjByDh6BBbI+l9uTamazgWXNO9yCmtVC0HBTzD/pbtNSDGM03tVXu8ea1o?=
 =?us-ascii?Q?/y9TMW0GUqwss1v5y7sIGRc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0477d15-5544-46b3-a04c-08d9ab960eff
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 19:52:03.6485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esYsFrOo0Fv8ZinnVdpYXMqMWfMk9/LACuz6Er4PSbuqMIbifsZmAlACfX6SftvzGJRlnAOHVd51ahdZnbQQwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4603
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10173
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111190106
X-Proofpoint-GUID: BHpNQFJxYLwN-a9BBUAz6tDL3-JYqHf8
X-Proofpoint-ORIG-GUID: BHpNQFJxYLwN-a9BBUAz6tDL3-JYqHf8
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for querying fd-based KVM stats - as introduced by Linux
kernel commit:

cb082bfab59a ("KVM: stats: Add fd-based API to read binary stats data")

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
---
 accel/kvm/kvm-all.c | 399 ++++++++++++++++++++++++++++++++++++++++++++
 qapi/misc.json      |   2 +-
 2 files changed, 400 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index eecd8031cf..10e8b8ed5c 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -47,6 +47,8 @@
 #include "kvm-cpus.h"
 
 #include "hw/boards.h"
+#include "qapi/qapi-commands-misc.h"
+#include "monitor/monitor.h"
 
 /* This check must be after config-host.h is included */
 #ifdef CONFIG_EVENTFD
@@ -2303,6 +2305,15 @@ bool kvm_dirty_ring_enabled(void)
     return kvm_state->kvm_dirty_ring_size ? true : false;
 }
 
+static StatsList *query_stats_cb(StatsList *, bool, const char *, bool,
+                                 const char *, Error **);
+
+static StatsSchemaList *query_stats_schemas_cb(StatsSchemaList *, bool,
+                                               const char *, Error **);
+
+static StatsInstanceList *query_stats_instances_cb(StatsInstanceList *,
+                                                   Error **);
+
 static int kvm_init(MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
@@ -2612,6 +2623,11 @@ static int kvm_init(MachineState *ms)
         }
     }
 
+    if (kvm_check_extension(kvm_state, KVM_CAP_BINARY_STATS_FD)) {
+        add_stats_callbacks("kvm", &query_stats_cb, &query_stats_schemas_cb,
+                            &query_stats_instances_cb);
+    }
+
     return 0;
 
 err:
@@ -3667,3 +3683,386 @@ static void kvm_type_init(void)
 }
 
 type_init(kvm_type_init);
+
+typedef struct StatsArgs {
+    void *kvm_stat;
+    char *name;
+    bool query_schema;
+    Error **errp;
+} StatsArgs;
+
+static StatDataList *add_kvmstat_entry(struct kvm_stats_desc *pdesc,
+                                       uint64_t *stats_data,
+                                       StatDataList *data_list,
+                                       Error **errp)
+{
+    StatDataList *data_entry;
+    uint64List *val_list = NULL;
+    int i;
+
+    data_entry = g_malloc0(sizeof(*data_entry));
+    data_entry->value = g_malloc0(sizeof(*data_entry->value));
+    data_entry->value->name = g_strdup(pdesc->name);
+
+    /* Convert flags to type, unit and base (QAPI auto-generated enums) */
+    switch (pdesc->flags & KVM_STATS_TYPE_MASK) {
+    case KVM_STATS_TYPE_CUMULATIVE:
+        data_entry->value->type = STAT_TYPE_CUMULATIVE;
+        break;
+    case KVM_STATS_TYPE_INSTANT:
+        data_entry->value->type = STAT_TYPE_INSTANT;
+        break;
+    case KVM_STATS_TYPE_PEAK:
+        data_entry->value->type = STAT_TYPE_PEAK;
+        break;
+    default:
+        /* Unknown type - skip */
+        goto exit;
+    }
+
+    switch (pdesc->flags & KVM_STATS_UNIT_MASK) {
+    case KVM_STATS_UNIT_NONE:
+        data_entry->value->unit = STAT_UNIT_NONE;
+        break;
+    case KVM_STATS_UNIT_BYTES:
+        data_entry->value->unit = STAT_UNIT_BYTES;
+        break;
+    case KVM_STATS_UNIT_CYCLES:
+        data_entry->value->unit = STAT_UNIT_CYCLES;
+        break;
+    case KVM_STATS_UNIT_SECONDS:
+        data_entry->value->unit = STAT_UNIT_SECONDS;
+        break;
+    default:
+        /* Unknown unit - skip */
+        goto exit;
+    }
+
+    switch (pdesc->flags & KVM_STATS_BASE_MASK) {
+    case KVM_STATS_BASE_POW10:
+        data_entry->value->base = 10;
+        break;
+    case  KVM_STATS_BASE_POW2:
+        data_entry->value->base = 2;
+        break;
+    default:
+        /* Unknown base - skip */
+        goto exit;
+    }
+
+    data_entry->value->exponent = pdesc->exponent;
+
+    /* Alloc and populate data list */
+    for (i = 0; i < pdesc->size; i++) {
+        uint64List *val_entry = g_malloc0(sizeof(*val_entry));
+        val_entry->value = stats_data[i];
+        val_entry->next = val_list;
+        val_list = val_entry;
+    }
+    data_entry->value->val = val_list;
+    data_entry->next = data_list;
+    data_list = data_entry;
+
+    return data_list;
+
+exit:
+    g_free(data_entry->value->name);
+    g_free(data_entry->value);
+    g_free(data_entry);
+
+    return data_list;
+}
+
+static StatSchemaEntryList *add_kvmschema_entry(struct kvm_stats_desc *pdesc,
+                                               StatSchemaEntryList *data_list,
+                                               Error **errp)
+{
+    StatSchemaEntryList *data_entry;
+
+    data_entry = g_malloc0(sizeof(*data_entry));
+    data_entry->value = g_malloc0(sizeof(*data_entry->value));
+    data_entry->value->name = g_strdup(pdesc->name);
+
+    data_entry->next = data_list;
+    data_list = data_entry;
+
+    return data_list;
+}
+
+static void query_stats(StatsArgs *kvm_stat_args, int stats_fd)
+{
+    size_t size_desc, size_data;
+    struct kvm_stats_header *header;
+    struct kvm_stats_desc *stats_desc = NULL;
+    Error *local_err = NULL;
+    void *data_list = NULL;
+    char *id = NULL;
+    ssize_t ret;
+    int i;
+
+    /* Read kvm stats header */
+    header = g_malloc(sizeof(*header));
+    ret = read(stats_fd, header, sizeof(*header));
+    if (ret != sizeof(*header)) {
+        error_setg(&local_err, "KVM stats: failed to read stats header: "
+                   "expected %zu actual %zu", sizeof(*header), ret);
+        goto exit;
+    }
+    size_desc = sizeof(*stats_desc) + header->name_size;
+
+    /* Read kvm stats id string */
+    id = g_malloc(header->name_size);
+    ret = read(stats_fd, id, header->name_size);
+    if (ret != header->name_size) {
+        error_setg(&local_err, "KVM stats: failed to read id string: "
+                   "expected %zu actual %zu", (size_t) header->name_size, ret);
+        goto exit;
+    }
+
+    /* Read kvm stats descriptors */
+    stats_desc = g_malloc0(header->num_desc * size_desc);
+    ret = pread(stats_fd, stats_desc,
+                size_desc * header->num_desc, header->desc_offset);
+
+    if (ret != size_desc * header->num_desc) {
+        error_setg(&local_err, "KVM stats: failed to read stats descriptors: "
+                   "expected %zu actual %zu",
+                   size_desc * header->num_desc, ret);
+        goto exit;
+    }
+
+    for (i = 0; i < header->num_desc; ++i) {
+        struct kvm_stats_desc *pdesc = (void *)stats_desc + i * size_desc;
+        size_data = pdesc->size * sizeof(uint64_t);
+        uint64_t *stats_data = g_malloc(size_data);
+
+        ret = pread(stats_fd, stats_data, size_data,
+                    header->data_offset + pdesc->offset);
+
+        if (ret != pdesc->size * sizeof(*stats_data)) {
+            error_setg(&local_err, "KVM stats: failed to read data: "
+                       "expected %zu actual %zu",
+                       pdesc->size * sizeof(*stats_data), ret);
+            g_free(stats_data);
+            goto exit;
+        }
+
+        if (kvm_stat_args->name) {
+            if (g_strcmp0(kvm_stat_args->name, pdesc->name)) {
+                g_free(stats_data);
+                continue;
+            }
+        }
+
+        /* Add entry to the list */
+        if (kvm_stat_args->query_schema) {
+            data_list = add_kvmschema_entry(pdesc, (StatSchemaEntryList *)
+                                            data_list, &local_err);
+        } else {
+            data_list = add_kvmstat_entry(pdesc, stats_data, (StatDataList *)
+                                          data_list, &local_err);
+        }
+        g_free(stats_data);
+    }
+
+    if (kvm_stat_args->query_schema) {
+        struct StatsSchema *kvm_stat =
+            (struct StatsSchema *) kvm_stat_args->kvm_stat;
+
+        kvm_stat->stats = (StatSchemaEntryList *)data_list;
+    }  else {
+        struct Stats *kvm_stat = (struct Stats *) kvm_stat_args->kvm_stat;
+
+        kvm_stat->stats = (StatDataList *)data_list;
+    }
+exit:
+    error_propagate(kvm_stat_args->errp, local_err);
+    g_free(stats_desc);
+    g_free(id);
+    g_free(header);
+}
+
+static void query_stats_vcpu(CPUState *cpu, run_on_cpu_data data)
+{
+    StatsArgs *kvm_stats_args = (StatsArgs *) data.host_ptr;
+    int stats_fd = kvm_vcpu_ioctl(cpu, KVM_GET_STATS_FD, NULL);
+    Error *local_err = NULL;
+
+    if (stats_fd == -1) {
+        error_setg(&local_err, "KVM stats: ioctl failed");
+        error_propagate(kvm_stats_args->errp, local_err);
+        return;
+    }
+    query_stats(kvm_stats_args, stats_fd);
+    close(stats_fd);
+}
+
+static StatsSchemaList *add_stats_schema(StatsSchemaList *list_tail,
+                                         StatsArgs *stats_args,
+                                         const char *type)
+{
+    StatsSchema *value = g_malloc0(sizeof(*value));
+
+    for (int i = 0; i < STAT_SCHEMA_TYPE__MAX; i++) {
+        if (!g_strcmp0(type, StatSchemaType_str(i))) {
+            value->type = i;
+        }
+    }
+
+    QAPI_LIST_PREPEND(list_tail, value);
+    stats_args->kvm_stat = value;
+    stats_args->query_schema = TRUE;
+
+    return list_tail;
+}
+
+static StatsList *add_stats(StatsList *list_tail,
+                            StatsArgs *stats_args,
+                            const char *name,
+                            const char *type)
+{
+    Stats *value = g_malloc0(sizeof(*value));
+    value->name = g_strdup(name);
+
+    for (int i = 0; i < STAT_SCHEMA_TYPE__MAX; i++) {
+        if (!g_strcmp0(type, StatSchemaType_str(i))) {
+            value->type = i;
+        }
+    }
+
+    QAPI_LIST_PREPEND(list_tail, value);
+    stats_args->kvm_stat = value;
+
+    return list_tail;
+}
+
+static StatsArgs *prepare_stats_args(const char *name, Error **errp)
+{
+    StatsArgs *stats_args;
+    KVMState *s = kvm_state;
+    Error *local_err = NULL;
+
+    if (!kvm_enabled()) {
+        error_setg(&local_err, "KVM stats: KVM not enabled");
+        error_propagate(errp, local_err);
+        return NULL;
+    }
+
+    if (!kvm_check_extension(s, KVM_CAP_BINARY_STATS_FD)) {
+        error_setg(&local_err, "KVM stats: not supported");
+        error_propagate(errp, local_err);
+        return NULL;
+    }
+
+    stats_args = g_malloc0(sizeof(*stats_args));
+    stats_args->errp = errp;
+    stats_args->name = g_strdup(name);
+
+    return stats_args;
+}
+
+static StatsList *query_stats_cb(StatsList *list_tail,
+                                 bool has_name, const char *name,
+                                 bool has_type, const char *type,
+                                 Error **errp)
+{
+    KVMState *s = kvm_state;
+    CPUState *cpu;
+    int stats_fd;
+    StatsArgs *stats_args = NULL;
+    StatSchemaType schema_type;
+
+    /* Query vm stats */
+    stats_fd = kvm_vm_ioctl(s, KVM_GET_STATS_FD, NULL);
+    if (stats_fd == -1) {
+        error_setg(errp, "KVM stats: ioctl failed");
+        return NULL;
+    }
+
+    stats_args = prepare_stats_args(name, errp);
+    if (!stats_args) {
+        return NULL;
+    }
+
+    schema_type = STAT_SCHEMA_TYPE_KVM_VM;
+    if (!type || !g_strcmp0(StatSchemaType_str(schema_type), type)) {
+        list_tail = add_stats(list_tail, stats_args, "vm",
+                              StatSchemaType_str(schema_type));
+        query_stats(stats_args, stats_fd);
+    }
+
+    /* Query vcpu stats */
+    CPU_FOREACH(cpu) {
+        schema_type = STAT_SCHEMA_TYPE_KVM_VCPU;
+        if (type && g_strcmp0(StatSchemaType_str(schema_type), type)) {
+            continue;
+        }
+        char *resname = g_strdup_printf("vcpu_%d", cpu->cpu_index);
+        list_tail = add_stats(list_tail, stats_args, resname,
+                              StatSchemaType_str(schema_type));
+        run_on_cpu(cpu, query_stats_vcpu, RUN_ON_CPU_HOST_PTR(stats_args));
+    }
+
+    g_free(stats_args);
+    return list_tail;
+}
+
+static StatsSchemaList *query_stats_schemas_cb(StatsSchemaList *list_tail,
+                                               bool has_type, const char *type,
+                                               Error **errp)
+{
+    KVMState *s = kvm_state;
+    int stats_fd;
+    StatsArgs *stats_args = NULL;
+    StatSchemaType schema_type;
+
+    stats_fd = kvm_vm_ioctl(s, KVM_GET_STATS_FD, NULL);
+    if (stats_fd == -1) {
+        error_setg(errp, "KVM stats: ioctl failed");
+        return NULL;
+    }
+
+    stats_args = prepare_stats_args(NULL, errp);
+    if (!stats_args) {
+        return NULL;
+    }
+
+    /* Query vm */
+    schema_type = STAT_SCHEMA_TYPE_KVM_VM;
+    if (!type || !g_strcmp0(StatSchemaType_str(schema_type), type)) {
+        list_tail = add_stats_schema(list_tail, stats_args,
+                                     StatSchemaType_str(schema_type));
+        query_stats(stats_args, stats_fd);
+    }
+
+    /* Query vcpu */
+    schema_type = STAT_SCHEMA_TYPE_KVM_VCPU;
+    if (type && g_strcmp0(StatSchemaType_str(schema_type), type)) {
+        return list_tail;
+    }
+    list_tail = add_stats_schema(list_tail, stats_args,
+                                 StatSchemaType_str(schema_type));
+    run_on_cpu(first_cpu, query_stats_vcpu, RUN_ON_CPU_HOST_PTR(stats_args));
+
+    g_free(stats_args);
+    return list_tail;
+}
+
+static StatsInstanceList *query_stats_instances_cb(StatsInstanceList *list_tail,
+                                                   Error **errp)
+{
+    CPUState *cpu;
+
+    StatsInstance *value = g_malloc0(sizeof(*value));
+    value->name = g_strdup("vm");
+    value->type = STAT_SCHEMA_TYPE_KVM_VM;
+    QAPI_LIST_PREPEND(list_tail, value);
+
+    CPU_FOREACH(cpu) {
+        value = g_malloc0(sizeof(*value));
+        value->name = g_strdup_printf("vcpu_%d", cpu->cpu_index);
+        value->type = STAT_SCHEMA_TYPE_KVM_VCPU;
+        QAPI_LIST_PREPEND(list_tail, value);
+    }
+    return list_tail;
+}
diff --git a/qapi/misc.json b/qapi/misc.json
index a0a07ef0b1..77e3962a1d 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -611,7 +611,7 @@
 # Since: 7.0
 ##
 { 'enum' : 'StatSchemaType',
-  'data' : [ ] }
+  'data' : [ 'kvm-vm', 'kvm-vcpu' ] }
 
 ##
 # @StatSchemaEntry:
-- 
2.26.2


