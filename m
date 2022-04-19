Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86210507B31
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 22:48:36 +0200 (CEST)
Received: from localhost ([::1]:53728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngum3-0000SQ-3o
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 16:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nguj2-000629-V0
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 16:45:29 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:6216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nguiz-0003Oc-HB
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 16:45:28 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23JItnla024789; 
 Tue, 19 Apr 2022 20:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=AImNOR4aVOIcL7ia0TJ+Pgoe0tp/TU+I7NELSc/Bdxg=;
 b=MGK/pikLPuuistzpa9TA5+V6Ib8LFKQdaeTub6Fa3OtPJAR263HuzJ84Uzt2ykIOl1P4
 kiztl69R/WzAAyfrGDAXYgKCWCCHzhSWXPh3koD2gyYh4nUvroFHkggtjk0Mo1gIeU/e
 0C38Shk+r4dsb6JqQb/QP3StIE1DUzrHwEF4DViXSD989a6P91ehnP7bGP/XScERRtxd
 YlQDoxvBzNZ8vnzknbfUlRYstrefp8m5T70qCETi4/wOnG/tMJ+ZWHKdmPGB4QqBX3sM
 XwXkMQjAxNgUC9KxtlTTv5Ib6PP+8IxuYru/9aJMiOCDH1g5ODj0d+jsO0W8wKWlC/f+ lQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffnp9f2bk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:16 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23JKa45o017127; Tue, 19 Apr 2022 20:45:14 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3ffm88spq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxBdVliXCzD8Jmw+dCSzfAB5uud7DeZ6a0QLlbIJ/NyTGiiqFIsUfcMxFo6mJvYAJyOIhYHHHRpE0/7i/9c9mvdI/oH3GWkDer6Ujr8sVMQ+yUbExwZjHlbo/EGVg+aNGWkGOjmuLTIj2DSLS3MLr5YshGRjHuak0cewaEp7QP1RhCtjI4+Dv1CIinDdSqApUtOAwOj73uhb3ocWG3srWg0oFCn0xxWfvXnOGdKHt5gjZz72AbutPrMizt4iXRbuUoQXt19NC6wWIH2VyY6mJkVu9FzGaHQw73E8x7SZc8lKr2wddIdjGobwaEhiru4rnnXT5JgKBRm6g0tudNgzbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AImNOR4aVOIcL7ia0TJ+Pgoe0tp/TU+I7NELSc/Bdxg=;
 b=cYnMHMDqDoZM9BBInzsr8zxKev9UNkOzalJTv+MZM6hfngJinEAEAc1yZVBfXgvmDWHSPwQpENXYoHSJW/OBtffOgxWBII/akPAezTdAuepPLwXXIPPm8cGpETEPT79yNso1JjWJiYMUU9BWqVzlc9kTE6t6UI/J995lO1PFcbYcwAv9xeQrJDyv/FMT8zEkTVoR/CeQAWVqY/Nv55aVHSOvWSLH2HjBM6cKqoJuKCccqO1GXqsXToLTdIRwuLtl9zmuJ/b/+YVy668tc5pBG/JqyAtb/iFZxVU6RztVwNHzYwsndjtYhKRAz69BWY50MwS+nRalwX45Ycgl5O0x7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AImNOR4aVOIcL7ia0TJ+Pgoe0tp/TU+I7NELSc/Bdxg=;
 b=RCotmitTs+DhshWVSdOv16qCSTY2sNJtzK9UTlbkduB7Y6SoVU830oA6K3YzkZTfxbytwxVB/SOynB7hiO5z/JmlT5KgR5GDtNAj7B6D3WvnqSgY1AZRLkdP3yU0/aAElE6NF+TGIxit6Ja+VXubuIjy6N4LztolX0o2WsVaNJw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM6PR10MB3290.namprd10.prod.outlook.com (2603:10b6:5:1aa::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 20:45:11 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac%4]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 20:45:11 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 10/17] vfio-user: run vfio-user context
Date: Tue, 19 Apr 2022 16:44:15 -0400
Message-Id: <1f71b01f49b461a41130ac9d19355344c3752f7d.1650379269.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1650379269.git.jag.raman@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:40::42) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75253a4d-8f2b-410e-194a-08da22457f2a
X-MS-TrafficTypeDiagnostic: DM6PR10MB3290:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3290A87E1889EB6C75B7B12B90F29@DM6PR10MB3290.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: feF5OoNPjylyTPNLB/UL1r2iJMt8Mywv6chB1qTjNRUUcp7Vs7c9mGqXF2PNSNt+EW2bnvXk5Bxtzv/Y1H6C84C/COIIcFYc+dYXWR/WOZhZCQAYErZS08EO3tve1TnN8bn4kRUtpTo6cNYEgkk/9ufFJnJR220h+g32/gbkBkONvhvU0ku4CXHb3U4Bbtq9t2qXIs1fbWwdBzv291ig7jo/Cj10BBqAN+K32qxBX4I0D+V7qTgiSK6e2heUhxyiPpycXFnLWKXoiV41VAifhDKhXvzsSyqIvCPe7FF3OCbpn1c3tteb3bVOsbino7Ir69G5+Ulf3m7VirzLlMjSS9V8O/lmlC6W8l8qvC59rFqAwCh3nLxh0KzumSyY8o1bnCElUTleeeUso5I63lTCMddlASYPiCJc6me/wLgKDvYtOwcm7JdSH74dx/xwej8VDIUKYCwXf1OCItqMJsq/P99WDJ3l0Cw9gn3fdaOiFvCNsS0LVL6Cjz45iD+CU0BJ/tiUlxRdwQjhsxk37pgJKV+/Uqi/csJJqt3IuLYY/9Li8WGYKqA2L+uekiNfraX6PIHnU5b7mUAYq5HrKXtvwSGSJLYzthnY5CSK/Qn2YoAA0q2SSkcF2tBTSn+usm1Bh9koH1658QAo8UsNUQ0zDZkioqVi5Xi3w4y6tDcOABxd03WntlNXv52I5mvRsZs4D83+z7MhZ+QQo0A2VDg2Dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(8936002)(186003)(83380400001)(38100700002)(7416002)(6916009)(2616005)(107886003)(6486002)(36756003)(66946007)(8676002)(66476007)(66556008)(4326008)(52116002)(6512007)(86362001)(508600001)(38350700002)(5660300002)(26005)(316002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vgFQzyiZs7kXRuxryoX/ywrHpIdYHLBP44sQ6V0qh4OHZtrUv+7aiD9glHWu?=
 =?us-ascii?Q?EmIvtkL2MfFxnA9RDEfJU7YEXXys4jVvIn7Pc6OwXI60aG+oQXUodr5h9Mq2?=
 =?us-ascii?Q?6RDu8E6i5SNaYzNgerf3uiuIWuxcxpyHuWObOrUG8c9SWHOZmn5dxBrqrEcv?=
 =?us-ascii?Q?dW0AdS8cQFfc8w0hwhJF9StzuPOwVyTGqlcW/4rcoQUmOdGyXMGEmvwaCT5o?=
 =?us-ascii?Q?d0kR09IsfzRWQ8ViDrUwKzaj937mxdvbShtIage1bo6Bo+QYJhhbpRCK6vwv?=
 =?us-ascii?Q?Vhcjx08DduU/ltiWqlKjKnIRwMtpo2Cra08S2FXiyHvlcHXTCUQfKMrHvMiQ?=
 =?us-ascii?Q?JUqmmIvBTzhRsk8uVjtNxsESheU6lTepG4nz90+z1POrchGnLTvBFf/+G8Ga?=
 =?us-ascii?Q?aUtD6T6l5CVL3MdFQJBr2dI8nFCAw09RXqfhqclx80lXVJnfXSia3JADCpcy?=
 =?us-ascii?Q?tcKggCVJJtAwJbdccII+osX1HWGhl9//8TIE2tQFEN9P+T0iU6Y9dqY6Rp74?=
 =?us-ascii?Q?8we0aJLkBlXrwwEB//LP3JZX6FFp0P8CXXvQ9FkJucNIaVB5M+Ml4epeSy7l?=
 =?us-ascii?Q?mC45nOwPSW0/jpWCEqTXFh2xu5ox6bmmR1oH3kIROHCwf4TjvyL4YamVMMLG?=
 =?us-ascii?Q?ALm9halL2+OOtqfiVlEXjGdt6ZHlL05T1NmUY7eajXm87kMvFuZv1Z6cPAdf?=
 =?us-ascii?Q?1Qf6hCTz8FJs3esp8dLaZXycRSQPWHAKp0PDS0F3NEzwKmDdXc3S7MY3kAtz?=
 =?us-ascii?Q?rgQ7T0/FxgEBeJCcr9mQTBR1zVLmItLIoi5NYsXgdJPRokeUsU6eEnwzz/Qd?=
 =?us-ascii?Q?xGpE1pxrx3GgVia3bL4VR5dlGA7qrRgLLUrkFLOM19PsILv/nrjPr4/iN5n+?=
 =?us-ascii?Q?Esdsl0MZT9EE4g2SM1qruP6Sol7AuER+VcbMssk+YDnkEVAFLsdJSBUgAD9G?=
 =?us-ascii?Q?FKMWK+3+nTy2stO7w9sAAsfdvAN0G/c4QdzAbKd9M2RQzql+3gx9AcsFp5Bt?=
 =?us-ascii?Q?G3UtGuCm4yFKD+vv8uz8+uFVs/38pY2fZBzzz5yIDM9LzlG836w/NMizBIYl?=
 =?us-ascii?Q?/vvSkmCWsy6fLlqSc17S4lz4uKQ8A4OMoHQZNThLuHmHIwnEtKiwJEGv8g6Y?=
 =?us-ascii?Q?FIKfxqiyL1tRBSkDpRDBfhNyS2kGzw+5A9nfj2Q9CbKbeCbNTvS2ARa7bi/7?=
 =?us-ascii?Q?5nUNTd2FXUkhBnUofSpg1lpj63ftBqES9b5f4O9iEHFWwemMV361YfW51sIE?=
 =?us-ascii?Q?dczFpEXdriUXUBA7cHGhw7cTjR3C5b9YVkpUARzx5YPcT8JuELwffWlygYum?=
 =?us-ascii?Q?Wy0BIso7soo9C+oXxrL7qULd+ASQqn/pGFGheGBacgbMKVVkBHUGN6iYJnd7?=
 =?us-ascii?Q?W4EuUalKw30uzhBl+YnKNpiu1M5DeGUyFibxZz+A6y5wjad6LTmGu3RahAga?=
 =?us-ascii?Q?+hQ2sUarA8dEf9uE1aBXxK3GKq8SPBpjqJX7XRuMKB8vGRo5c99JRqSQdDZA?=
 =?us-ascii?Q?48rzQI8320suTbwrCzs+++XNTJgTOW0Jbj/BxLQphn5HrnXTIksblhnIAIZT?=
 =?us-ascii?Q?dAbAoSm9weK2Z8WLy1Mc1vpwp74iyZDwvmSO00vhVrpMlb0WUAzJa+k9Jgsw?=
 =?us-ascii?Q?9b8OPQXVvVkQHXcWIpA0lO4iRbRRPLTL0SkVX8OZWgjaAnEec0/DPf1UPTFV?=
 =?us-ascii?Q?sAJI7+W+PycdD02+jto6ItYQSeTo7jO2LzBcvl0MXiX0Ngghrslgoo8LjBLa?=
 =?us-ascii?Q?YLoVUz3G1SPA2kpl3y2zyDephofDEe0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75253a4d-8f2b-410e-194a-08da22457f2a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 20:45:11.1493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gfKWW6ZwGXV+hW2cKorSflKP4Uv5exXkbGc27JMIbF26ER47wouMy3EHGs+AHbd2F1RWVQnpTE/NNhdA5moOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3290
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-19_07:2022-04-15,
 2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204190115
X-Proofpoint-ORIG-GUID: oqvsTZASq7P30Epz0KDaJPGENJvNjN7D
X-Proofpoint-GUID: oqvsTZASq7P30Epz0KDaJPGENJvNjN7D
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, thanos.makatos@nutanix.com, kanth.ghatraju@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 jag.raman@oracle.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setup a handler to run vfio-user context. The context is driven by
messages to the file descriptor associated with it - get the fd for
the context and hook up the handler with it

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qapi/misc.json            | 23 ++++++++++
 hw/remote/vfio-user-obj.c | 95 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 117 insertions(+), 1 deletion(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index b83cc39029..f3cc4a4854 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -553,3 +553,26 @@
 ##
 { 'event': 'RTC_CHANGE',
   'data': { 'offset': 'int', 'qom-path': 'str' } }
+
+##
+# @VFU_CLIENT_HANGUP:
+#
+# Emitted when the client of a TYPE_VFIO_USER_SERVER closes the
+# communication channel
+#
+# @id: ID of the TYPE_VFIO_USER_SERVER object
+#
+# @device: ID of attached PCI device
+#
+# Since: 7.1
+#
+# Example:
+#
+# <- { "event": "VFU_CLIENT_HANGUP",
+#      "data": { "id": "vfu1",
+#                "device": "lsi1" },
+#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
+#
+##
+{ 'event': 'VFU_CLIENT_HANGUP',
+  'data': { 'id': 'str', 'device': 'str' } }
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 15f6fe3a1a..06d99a8698 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -27,6 +27,9 @@
  *
  * device - id of a device on the server, a required option. PCI devices
  *          alone are supported presently.
+ *
+ * notes - x-vfio-user-server could block IO and monitor during the
+ *         initialization phase.
  */
 
 #include "qemu/osdep.h"
@@ -41,11 +44,14 @@
 #include "hw/remote/machine.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-sockets.h"
+#include "qapi/qapi-events-misc.h"
 #include "qemu/notify.h"
+#include "qemu/thread.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
+#include "qemu/timer.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -87,6 +93,8 @@ struct VfuObject {
     PCIDevice *pci_dev;
 
     Error *unplug_blocker;
+
+    int vfu_poll_fd;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -165,6 +173,69 @@ static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
     vfu_object_init_ctx(o, errp);
 }
 
+static void vfu_object_ctx_run(void *opaque)
+{
+    VfuObject *o = opaque;
+    const char *id = NULL;
+    int ret = -1;
+
+    while (ret != 0) {
+        ret = vfu_run_ctx(o->vfu_ctx);
+        if (ret < 0) {
+            if (errno == EINTR) {
+                continue;
+            } else if (errno == ENOTCONN) {
+                id = object_get_canonical_path_component(OBJECT(o));
+                qapi_event_send_vfu_client_hangup(id, o->device);
+                qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+                o->vfu_poll_fd = -1;
+                object_unparent(OBJECT(o));
+                break;
+            } else {
+                VFU_OBJECT_ERROR(o, "vfu: Failed to run device %s - %s",
+                                 o->device, strerror(errno));
+                break;
+            }
+        }
+    }
+}
+
+static void vfu_object_attach_ctx(void *opaque)
+{
+    VfuObject *o = opaque;
+    GPollFD pfds[1];
+    int ret;
+
+    qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+
+    pfds[0].fd = o->vfu_poll_fd;
+    pfds[0].events = G_IO_IN | G_IO_HUP | G_IO_ERR;
+
+retry_attach:
+    ret = vfu_attach_ctx(o->vfu_ctx);
+    if (ret < 0 && (errno == EAGAIN || errno == EWOULDBLOCK)) {
+        /**
+         * vfu_object_attach_ctx can block QEMU's main loop
+         * during attach - the monitor and other IO
+         * could be unresponsive during this time.
+         */
+        (void)qemu_poll_ns(pfds, 1, 500 * (int64_t)SCALE_MS);
+        goto retry_attach;
+    } else if (ret < 0) {
+        VFU_OBJECT_ERROR(o, "vfu: Failed to attach device %s to context - %s",
+                         o->device, strerror(errno));
+        return;
+    }
+
+    o->vfu_poll_fd = vfu_get_poll_fd(o->vfu_ctx);
+    if (o->vfu_poll_fd < 0) {
+        VFU_OBJECT_ERROR(o, "vfu: Failed to get poll fd %s", o->device);
+        return;
+    }
+
+    qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_ctx_run, NULL, o);
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -203,7 +274,8 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         return;
     }
 
-    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path, 0,
+    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path,
+                                LIBVFIO_USER_FLAG_ATTACH_NB,
                                 o, VFU_DEV_TYPE_PCI);
     if (o->vfu_ctx == NULL) {
         error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
@@ -242,6 +314,21 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
                TYPE_VFU_OBJECT, o->device);
     qdev_add_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
 
+    ret = vfu_realize_ctx(o->vfu_ctx);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to realize device %s- %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
+    o->vfu_poll_fd = vfu_get_poll_fd(o->vfu_ctx);
+    if (o->vfu_poll_fd < 0) {
+        error_setg(errp, "vfu: Failed to get poll fd %s", o->device);
+        goto fail;
+    }
+
+    qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_attach_ctx, NULL, o);
+
     return;
 
 fail:
@@ -276,6 +363,7 @@ static void vfu_object_init(Object *obj)
         qemu_add_machine_init_done_notifier(&o->machine_done);
     }
 
+    o->vfu_poll_fd = -1;
 }
 
 static void vfu_object_finalize(Object *obj)
@@ -289,6 +377,11 @@ static void vfu_object_finalize(Object *obj)
 
     o->socket = NULL;
 
+    if (o->vfu_poll_fd != -1) {
+        qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+        o->vfu_poll_fd = -1;
+    }
+
     if (o->vfu_ctx) {
         vfu_destroy_ctx(o->vfu_ctx);
         o->vfu_ctx = NULL;
-- 
2.20.1


