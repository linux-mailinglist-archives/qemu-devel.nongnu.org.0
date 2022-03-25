Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8444E7A78
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:33:05 +0100 (CET)
Received: from localhost ([::1]:55106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXpgG-0006fp-Ki
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:33:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpU0-0007W5-P2
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:30 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:22508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTy-00036P-Cb
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:24 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PHJa1N031491; 
 Fri, 25 Mar 2022 19:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=AImNOR4aVOIcL7ia0TJ+Pgoe0tp/TU+I7NELSc/Bdxg=;
 b=e2H2n2b0RHgt4X7p1TNMGvlCTNQPzt+x3Tfr3lucbGUEVCalk5b6aP4iMW2KcGGWCAsr
 uGAZC+2v0O2zn7+QoHuD1r+agxUV6ByrLpryBDzfiJmkE4qh0o4NESfGPxw+jMmXjCPr
 EMTfNtJtb4AsFcFwbT603fGwrSx1GQSar20FvevLoCAFVOvD25yqcpVyP3/EdZFPN+gW
 LTrrBAV2pELxgSToJCNwWquZcdWUIF5Dd4V0N8X2GNOv2XK6GUBvw/lkrjAbEtjv+s0H
 BIlmZUPP/8HGOCdSFTZ48k+LSeEemzCyxAPEyf4pGL0zFU5fXC3gyY//fz85xXSUR+C6 ww== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew7qtgb2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:18 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PJGtNc077299;
 Fri, 25 Mar 2022 19:20:17 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2041.outbound.protection.outlook.com [104.47.56.41])
 by aserp3020.oracle.com with ESMTP id 3ew701w9v9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlFXs0WUUQGmRqjZiZ0c+kCM6uwp/bfIIyrUM5rNcUxe3XAKXtc5QVGA+p4VdcJBngjHUFLByCOwZIYae9Ik6D2NXluuAZZw1FAbD6WuYxHfAghK1fL8qZojWwImlGDS5pMlov2ntxJOjeqLxhQ6wiuBHrCazsU4gP7e3x43rASJrnQk8d47h7KjVSEUsWRy2q4EgLrLb9fME9gyt/1OTEZvdszg79j7QSHF0l1wkuftCXHGXpjZqDJunfioTIy9eEzx4ST73VXpJuVPq8jL6hB6P3RJmqnu8tWUkbScvBRm/GWoDlW3cQF2EeaUiWt0TnqptMVT609EhFuHPSFIRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AImNOR4aVOIcL7ia0TJ+Pgoe0tp/TU+I7NELSc/Bdxg=;
 b=TR+PYKcntuTxwYlmAHKcJ1TbGY8etzkt2QFkXbp3+rm71IuPSpPsK+ux2JVzFyTUkaf0Qm0KNTaCoNoXf+gRrnhnPDmn6T7Yz1SvVHOvgdeRnFkiq+IRr3QAJQ8HiHEEvX8CqsEvAP3qfK+5GS0Qfi4/QIDvl+TdfUbGzND50OQkYk5RoGvHyPsp+MFjcF5o5DN6A7BexB8qlYRh7FdMf+Ytph56DU7iGmO//dNcY1G9IMagTr/SvmsJWcRgOpP1blO9X9ggmukDGmE/6tYTpPv8QFsOQ8dqNhRRSi6AB7lGUnd7eCyq50WUxUJaOGMup+uELA8cPlUJ6i/6pfLPsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AImNOR4aVOIcL7ia0TJ+Pgoe0tp/TU+I7NELSc/Bdxg=;
 b=NIkCnq9z90qy5eUn6ZQWmiSt6/ArxoUk1+n5Va4cdVbLHIBtbsu2ApJryZsxK+jXbQg3fc8RCOpXn+mQC8gDSlb8P7muqqUokqzRRtEaAUiXu3BmDyj2+6cYW8O0Hf+RwPKf8sYPoRHZxOqiKRg9Ewvru76ZxXkhaahdKszFbX4=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN0PR10MB5206.namprd10.prod.outlook.com (2603:10b6:408:127::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 19:20:15 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 19:20:15 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 10/17] vfio-user: run vfio-user context
Date: Fri, 25 Mar 2022 15:19:39 -0400
Message-Id: <7cbf66e83a2db56cede563b276ad89528ef903ba.1648234157.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1648234157.git.jag.raman@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR2101CA0024.namprd21.prod.outlook.com
 (2603:10b6:805:106::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 837c8664-ed7f-4aa3-3eba-08da0e947dba
X-MS-TrafficTypeDiagnostic: BN0PR10MB5206:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB52067AFA4C58C4EEBE5632A8901A9@BN0PR10MB5206.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m9uADY5nk2tQjlDmzd8b9Z+hR73giYtVWJ89gDdSPZoNvslvCP7PjBD1kHMUZjtI60zPVEkPb/MdylglxodVr+rTsSn2cbgFtiefoEL2l7boInZVl6lOufF9YIcl3ALKtFDAo3FJ07ha8U1nGrMBu6LhpEPiSK18rm4cReaFz0roIXRIuseSU08NG2U4Oly25LKlq1WLx2sWDupl02NwSEl/LoCdbdijfkxK16mf9eeLI8J6963G10p4r/fPFAichKSsNEey6KSxQ/6u85wsWEDasATkVyyyvinZxMYq0U6iyfTg0W8u4UiefqE7EBN/DEQSmOk6iYvtmB+BgMVyO/SU+MRn6gO9BJuUqDs669dhQWGmYMOLIXInzrN7h73bOH+iUdgV63wU7IE/zQ4Dna1PR471DSGtEn7sHn6WC7Wgwd07WeFh+zfJf+KFzmnF5EExgYeNLA/24kCi1Zzc0GO/j5+u7C2BBCjBRpjjNb5QRnVUkfdYsc6yAe5If8G+lZ39p7WMEK21lP9pjTHx6AMTuISeaC4cjRi97A4FTKPwj1TrOODH/s+ghDptCUE6r8ULXi+y9qcbjWVUv9PSCZ0wunlykac4ByNHWZ5biNF477rGsCcopUOKochyMECYAwFm0iZBFWUIrHwiNw/kJN06sLNiwBIlxQ8vitiPTqOgNCQTMBewKXt4XXFo57EWC6wToUy+R7NnVmNTXXQlig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(107886003)(316002)(2616005)(26005)(83380400001)(6486002)(36756003)(6666004)(6512007)(6506007)(52116002)(66946007)(2906002)(86362001)(508600001)(38100700002)(38350700002)(6916009)(66476007)(8936002)(7416002)(5660300002)(66556008)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Of6Wsc5H34jCbk0/V8xobVGNAOpLPFYM/dcTVHdLWIrLYxuUXAX03ounqoLI?=
 =?us-ascii?Q?BzG6aOf0dw/lyq2XViD6rKukMPvcQEOGI31sE0A5UEY1tmSSZLenEgtvMrOF?=
 =?us-ascii?Q?pIgP1ClGcOXkdoN+AynfZwaAljsjjRoHo1UkygZEMkaFy4futXlbMcvTsH6o?=
 =?us-ascii?Q?Fw3g7s+ribmkz1I31Kjo5PCTbJ2/ddLfmKaeU1rk+p9QYcYS9GSytSSbvNPg?=
 =?us-ascii?Q?sFpqDddkLceMpPxBp0gYO/vgCExEWuKhYGtdNshmoL7iFqmQElODwHDggJeX?=
 =?us-ascii?Q?9Ch34V0FwB/i+9A8Hm+NbZitzphCDWKhp1oQ8bltdNnL8xubHX0t1nUWbgVg?=
 =?us-ascii?Q?OtMrHxO/LmWUMBnqditwpWrxyvr2gV0TFvwb5QhXZdBlpdlaUt9cer2wzKzM?=
 =?us-ascii?Q?CBe6E9KMNHtAIEmWjIgaLkuG6ebNawTcrhU++JSkAI4mxA3YCa9OI17RxfWD?=
 =?us-ascii?Q?+lJwI4KjkMY5RBOxUgvolKAWRHE0XifWKRxFAvtRL/wdr1mxWjP7ecJRJazN?=
 =?us-ascii?Q?o+QoCXd7PtwypxGCBskBw3eG6x8+oZ6fqWXLwmjwfbpbX7Q3ne3Ae+thZN62?=
 =?us-ascii?Q?1EUESzM8SeVbIM0pGCCBMq34EQkp537btWr5w2VzbLxNEMFFB3bzCJY5W/D+?=
 =?us-ascii?Q?xNohdMiVJ50w4IlJe7LVAfQMfqERJn79vY6XAo77ccZDZgmfPvbk9xZWIELa?=
 =?us-ascii?Q?5Ag9ST/8OG7N/FxsRHlyFHJ1eoECAJ0P6uwlN+urRwSQPmzGJkSJ36xMoG8S?=
 =?us-ascii?Q?zKHfbCz80rSGmnO7eRKnbPQZ64jXu8t8sxIUqEU5NKAobe9kEQ5FhKp43opW?=
 =?us-ascii?Q?nCzm+0obhxQwjlCY6xUgrF+gv162pOAaK7g1bTXTG7PNv2UZb1Lu03yxm2bc?=
 =?us-ascii?Q?1RIDqaDh/jJv62+2tYzIrqJV8hpWc+TInY9BzZXAnfNyiAu++QkxfIh7CZdM?=
 =?us-ascii?Q?wBuMWtEY8pPuDeNs2gR3UTKsSeQf3Skg8Xzn094tTQtAwjPCm4FQzDJPRUdA?=
 =?us-ascii?Q?KQbO4wCc7kVvEXaBUG7jqq1BsCQRkXLu5iQ/OZ7qeAZkIkp4OPzpISgfh8vx?=
 =?us-ascii?Q?CO2uQUbPIj9WB8QHfkNziJE7klekmPmy3GNknU8L7exxpgyH7mv87SwaW7fh?=
 =?us-ascii?Q?+nsL1rGs6gJRq5IvYHHx1ZEHws0MX6UMbs66aS9cPVFn5Ak554/eqfnQFBVU?=
 =?us-ascii?Q?H7PpwvpDmB38ZtQ6nInrWDVmS7lWYC3P4TtEAArZqceEUKlNLj00N0gG92t7?=
 =?us-ascii?Q?uFWizWu5LBJsRfdiQc3sd5pFHY6RoeGIEyxlaBh2J/Djhygs91J+m4s3OqyM?=
 =?us-ascii?Q?NDCXdjostNEKHQhO13HY2zx0cYTanQ4Rk37NHDLdliN6uQF/bLbymu3ehCF+?=
 =?us-ascii?Q?FxIH3rEj4ZfmmRTt5T1OveJMM5fXaVVQGOZFlrT4TxAD859xO2UlzcXBm9Ey?=
 =?us-ascii?Q?2tdhtbAFAiO9a1aX9rNsNuOrVyUMC+VTCpd1tBvPQ9hwuhLpZ/YXYY6yBw0H?=
 =?us-ascii?Q?OZXYeatmNTHeQTQo5izUEO7k2j35TsJymP0BPRqj0PC+M40Vv3D44UOwtoIW?=
 =?us-ascii?Q?nvhUKdtQivHXWLQgKKM1AnpR3vlgzaRoQqNwgxgPmSXOsq5ZJRYKjA+3tqKH?=
 =?us-ascii?Q?8EeiOhF5/KK/Gl3UblRSzN1KyqB1JZoCKk6k3eUYTj+kxdzEKWZSyDjixI4A?=
 =?us-ascii?Q?PhFwRU776udQV2K/qS+00QFU05ULVzpxNmNx18ngY7BpniAt64tmt/ShHy1K?=
 =?us-ascii?Q?9MG09svLsg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 837c8664-ed7f-4aa3-3eba-08da0e947dba
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:20:15.5527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ufCMsfhOQzFXeNU9HMLCu4UZXxfJGuQNBb115cQD64CysK7RtKVRaA9GCYrCeVBUqHk2WbOrb7oERsA6w97Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5206
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250106
X-Proofpoint-GUID: uohxVOiuhj9vdMpQDzLk-5TDIVgcO6z4
X-Proofpoint-ORIG-GUID: uohxVOiuhj9vdMpQDzLk-5TDIVgcO6z4
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
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


